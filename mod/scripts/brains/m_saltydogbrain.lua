-- m_saltydogbrain
-- 盐狗：跟着主人；只捡地上的盐块；身上积满盐时抖到地上；闲下来会跑去水里泡着。

require "behaviours/follow"
require "behaviours/faceentity"
require "behaviours/standstill"
require "behaviours/wander"

local PICKUP_RANGE = 8
local MAX_WANDER = 6
local WANDER_TIMING = {
	minwalktime = 0.5,
	randwalktime = 0.5,
	minwaittime = 2,
	randwaittime = 2,
}

local function GetLeader(inst)
	return inst.components.follower ~= nil and inst.components.follower:GetLeader() or nil
end

local function IsSalt(item)
	if item == nil or not item:IsValid() then
		return false
	end
	return item.prefab == "saltrock" or item:HasTag("salt")
end

local function PickSaltAction(inst)
	local inventory = inst.components.inventory
	if inventory == nil or inventory:IsFull() then
		return nil
	end

	local item = FindEntity(
		inst,
		PICKUP_RANGE,
		function(v)
			return IsSalt(v)
				and v.components.inventoryitem ~= nil
				and not v.components.inventoryitem:IsHeld()
		end,
		{ "_inventoryitem" },
		{ "INLIMBO", "NOCLICK" }
	)

	return item ~= nil and BufferedAction(inst, item, ACTIONS.PICKUP) or nil
end

local function GiveAction(inst)
	local leader = GetLeader(inst)
	if leader == nil or not leader:IsValid() then
		return nil
	end

	local item = inst.components.inventory:GetFirstItemInAnySlot()
	if item == nil then
		return nil
	end

	local target = leader.components.inventory
	if target == nil or target:CanAcceptCount(item, 1) <= 0 then
		return nil
	end

	return BufferedAction(inst, leader, ACTIONS.GIVEALLTOPLAYER, item)
end

-- 身上盐满了，在岸上就抖一抖
local function ShouldShakeSalt(inst)
	if inst.components.counter == nil or inst.IsInWater == nil then
		return false
	end
	if inst.components.counter:GetCount("salty") < TUNING.SALTY_DOG_MAX_SALT_COUNT then
		return false
	end
	return not inst:IsInWater()
end

-- 找附近的海面：主人 8 格内找一圈，找到就过去泡着
local function FindNearbyOceanPos(inst)
	local leaderorself = GetLeader(inst) or inst
	local x, _, z = leaderorself.Transform:GetWorldPosition()
	for r = 8, 2, -2 do
		for i = 0, 7 do
			local theta = (i / 8) * TWOPI
			local px, pz = x + r * math.cos(theta), z + r * math.sin(theta)
			if TheWorld.Map:IsOceanAtPoint(px, 0, pz, false) then
				return Vector3(px, 0, pz)
			end
		end
	end
	return nil
end

local SaltDogBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function SaltDogBrain:OnStart()
	local root = PriorityNode(
		{
			WhileNode(function()
				return not self.inst.sg:HasStateTag("busy")
			end, "not busy", WhileNode(function()
				local leader = GetLeader(self.inst)
				return leader ~= nil and leader:IsValid()
			end, "has leader", PriorityNode({
				IfNode(ShouldShakeSalt, "shake salt", ActionNode(function()
					self.inst:PushEvent("saltshake")
				end)),
				DoAction(self.inst, PickSaltAction, "pick up salt"),
				DoAction(self.inst, GiveAction, "give salt to leader"),
				Follow(self.inst, GetLeader, 0, 4, 6),
				FaceEntity(self.inst, GetLeader),
				Wander(self.inst, FindNearbyOceanPos, MAX_WANDER, WANDER_TIMING),
				StandStill(self.inst),
			}, 0.25))),
			StandStill(self.inst),
		},
		0.25
	)

	self.bt = BT(self.inst, root)
end

return SaltDogBrain
