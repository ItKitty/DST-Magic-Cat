-- m_pollyrogerbrain
-- 1:1 照搬原版 scripts/brains/pollyrogerbrain.lua，
-- 仅把 salty_dog 的 prefab 判断改成 m_salty_dog。

require("behaviours/follow")
require("behaviours/wander")
require("behaviours/faceentity")
require("behaviours/standstill")
require("behaviours/leash")

local BrainCommon = require("brains/braincommon")

local MIN_FOLLOW_DIST = 0
local MAX_FOLLOW_DIST = 8
local TARGET_FOLLOW_DIST = 6
local MAX_SALT_IDLE_DIST_SQ = 16 * 16
local WANDER_TIMING = {
	minwalktime = 0.25,
	randwalktime = 0.25,
	minwaittime = 1.5,
	randwaittime = 1.5,
}
local WANDER_DATA = {
	leashwhengoinghome = true,
}
local MAX_WANDER = 6

local STOP_RUN_DIST = 10
local SEE_MONSTER_DIST = 5
local AVOID_MONSTER_DIST = 3
local AVOID_MONSTER_STOP = 6

local function closetoleader(inst)
	if inst.sg:HasStateTag("busy") then
		return nil
	end
	local leader = inst.components.follower and inst.components.follower:GetLeader()
	if leader and leader:GetDistanceSqToInst(inst) < TUNING.POLLY_ROGERS_RANGE * TUNING.POLLY_ROGERS_RANGE then
		return true
	end
end

local ShouldRunAway = {
	tags = { "hostile" },
	notags = { "NOCLICK", "invisible" }, -- NOTES(JBK): You can not fear what you can not see right Polly?
	fn = function(thing, polly)
		if thing.components.follower ~= nil then
			local leader = thing.components.follower:GetLeader()
			if leader and leader:HasTag("player") then -- TODO(JBK): PVP check.
				return false
			end
		end
		return true
	end,
}

-- NOTES(JBK): A circle with 8 points is disitrubted around a circle and these lookups are to find close points from any given index on this circle.
local NearbyPoints = {}
for i = 0, 7 do
	NearbyPoints[i + 1] = (i / 8) * TWOPI
end
local NearbyPointsOffsets = {
	0,
	1,
	-1,
	2,
	-2,
	3,
	-3,
	4,
}

local function FindNearbyOceanPos(inst)
	local leaderorself = inst.components.follower and inst.components.follower:GetLeader() or inst

	local x, y, z = leaderorself.Transform:GetWorldPosition()
	local x1, y1, z1 = inst.Transform:GetWorldPosition()
	local angle = math.atan2(z1 - z, x1 - x)
	local baseindex = math.floor((angle + EIGHTHPI) / QUARTERPI)
	for r = MAX_FOLLOW_DIST, 1, -2 do
		for i = 0, 7 do
			local offsetindex = NearbyPointsOffsets[i + 1]
			local index = (baseindex + offsetindex) % 8
			local theta = NearbyPoints[index + 1]
			local xoff, zoff = r * math.cos(theta), r * math.sin(theta)
			if TheWorld.Map:IsOceanAtPoint(x + xoff, 0, z + zoff, false) then
				return Vector3(x + xoff, 0, z + zoff)
			end
		end
	end

	return nil
end

local function IsWanderOcean(pt)
	return TheWorld.Map:IsOceanAtPoint(pt.x, pt.y, pt.z)
end

local PollyRogerBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function PollyRogerBrain:OnStart()
	local pickupparams = {
		cond = function()
			return self.inst.readytogather
		end,
		range = TUNING.POLLY_ROGERS_RANGE,
		furthestfirst = true,
		custom_pickup_filter = function(worker, item, owner)
			if worker.prefab == "m_salty_dog" then
				return item.prefab == "saltrock" or item:HasTag("salt")
			end
			-- 鹦鹉：只认种子
			return item.prefab == "seeds" or string.find(item.prefab, "seeds") ~= nil or item:HasTag("seed")
		end,
	}

	local nearbyoceanpoint = nil

	-- 盐是否已经积满。积满后就不该继续泡在水里等计时器了：
	-- 原版大脑在「主人离海点 16 格内」时让 Follow 返回 nil，
	-- 于是会一直停在 Wander（水里溜达），永远等不到上岸抖盐。
	local function IsSaltFull(inst)
		local counter = inst.components.counter
		return counter ~= nil and counter:GetCount("salty") >= TUNING.SALTY_DOG_MAX_SALT_COUNT
	end

	-- 盐狗当前是不是在海里
	local function IsInWater(inst)
		local x, y, z = inst.Transform:GetWorldPosition()
		return TheWorld.Map:IsOceanAtPoint(x, y, z, false)
	end

	local function GetLeader(inst)
		return inst.components.follower and inst.components.follower:GetLeader()
	end

	-- 在主人身边找一块「陆地」的位置。
	-- 不能直接朝主人走：主人可能就站在水边，狗走到跟随距离内还是泡在水里，
	-- 而抖盐要求「不在海里」，于是永远卡在水里。
	-- 结果缓存 1 秒，避免每帧重新随机导致目标点抖动。
	local ashorepoint = nil
	local ashoretime = 0

	local function FindAshorePoint(inst)
		local now = GetTime()
		if ashorepoint ~= nil and now - ashoretime < 1 then
			return ashorepoint
		end

		ashoretime = now
		ashorepoint = nil

		local leader = GetLeader(inst)
		if leader == nil or not leader:IsValid() then
			return nil
		end

		local pt = leader:GetPosition()
		for r = 1, 4, 0.5 do
			local offset = FindWalkableOffset(pt, math.random() * TWOPI, r, 8, true, false)
			if offset ~= nil then
				ashorepoint = pt + offset
				return ashorepoint
			end
		end

		-- 找不到就往主人脚下走（至少不会原地不动）
		ashorepoint = pt
		return ashorepoint
	end

	local root = PriorityNode({
		WhileNode(
			function()
				return not self.inst.sg:HasStateTag("busy")
			end,
			"NO BRAIN WHEN BUSY",
			PriorityNode({
				BrainCommon.PanicTrigger(self.inst),
				BrainCommon.ElectricFencePanicTrigger(self.inst),
				RunAway(self.inst, ShouldRunAway, AVOID_MONSTER_DIST, AVOID_MONSTER_STOP),
				RunAway(self.inst, ShouldRunAway, SEE_MONSTER_DIST, STOP_RUN_DIST), -- NOTES(JBK): Polly Rogers has an atypical home to go back to so do not use typical home run logic!
				IfNode(
					function()
						if self.inst.prefab == "m_salty_dog" then
							local x, y, z = self.inst.Transform:GetWorldPosition()
							if TheWorld.Map:IsOceanAtPoint(x, y, z, false) then
								return false
							end
							local counter = self.inst.components.counter
							local count = counter and counter:GetCount("salty") or 0
							return count >= TUNING.SALTY_DOG_MAX_SALT_COUNT
						end
					end,
					"IsSaltedOnLand",
					ActionNode(function()
						self.inst:PushEvent("saltshake")
					end)
				),
				-- 盐满但还是泡在水里：主动游到主人身边的陆地上。
				-- 只靠后面的 Follow 不够 —— 主人站在水边时，狗在跟随距离内 Follow 直接成功，
				-- 就会原地泡在水里，永远等不到 IsSaltedOnLand 的抖盐。
				IfNode(function()
					return self.inst.prefab == "m_salty_dog" and IsSaltFull(self.inst) and IsInWater(self.inst)
				end, "GoAshore", Leash(self.inst, FindAshorePoint, 2, 0.8)),
				WhileNode(function()
					return closetoleader(self.inst)
				end, "Stayclose", BrainCommon.NodeAssistLeaderPickUps(self, pickupparams)),
				Follow(self.inst, function()
					local leader = self.inst.components.follower and self.inst.components.follower:GetLeader()
					if self.inst.prefab == "m_salty_dog" then
						-- 盐满了：不再往水里钻，改为跟回主人（主人一般在岸上），
						-- 上岸后上面的 IsSaltedOnLand 节点会推 saltshake 抖盐
						if IsSaltFull(self.inst) then
							return leader
						end
						if
							nearbyoceanpoint
							and leader
							and leader:GetDistanceSqToPoint(nearbyoceanpoint:Get()) < MAX_SALT_IDLE_DIST_SQ
						then
							return nil
						end
					end
					return leader
				end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
				IfNode(
					function()
						-- 只有没积满的时候才去海里溜达
						return self.inst.prefab == "m_salty_dog" and not IsSaltFull(self.inst)
					end,
					"IsSaltyDog",
					Wander(self.inst, function(inst)
						nearbyoceanpoint = FindNearbyOceanPos(inst)
						return nearbyoceanpoint
					end, MAX_WANDER, WANDER_TIMING, nil, nil, IsWanderOcean, WANDER_DATA)
				),
				StandStill(self.inst),
			}, 0.25)
		),
	}, 0.25)
	self.bt = BT(self.inst, root)
end

return PollyRogerBrain
