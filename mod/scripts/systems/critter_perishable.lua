-- critter_perishable.lua - 事件处理系统

local PETS = {
	"critter_kitten",
	"critter_puppy",
	"critter_lamb",
	"critter_dragonling",
	"critter_glomling",
	"critter_perdling",
	"critter_lunarmothling",
	"critter_eyeofterror",
	"critter_bulbin",
	"critter_eets",
}
local MADELEINE = "madeleine"

-- ============================================================
-- 抚摸给礼物配置
-- ============================================================
local GIFT_DELAY = 0.5

-- ------------------------------------------------------------
-- 三个奖池
-- ------------------------------------------------------------

-- 基础物资池
local BASIC_POOL = {
	{ prefab = "cutgrass", weight = 1, min = 20, max = 40 },
	{ prefab = "twigs", weight = 1, min = 20, max = 40 },
	{ prefab = "rocks", weight = 1, min = 20, max = 40 },
	{ prefab = "flint", weight = 1, min = 20, max = 40 },
	{ prefab = "nitre", weight = 1, min = 20, max = 40 },
	{ prefab = "cutreeds", weight = 1, min = 20, max = 40 },
	{ prefab = "log", weight = 1, min = 10, max = 20 },
	{ prefab = "goldnugget", weight = 1, min = 10, max = 20 },
}

-- 宝石池
local GEM_POOL = {
	{ prefab = "redgem", weight = 1, min = 3, max = 10 },
	{ prefab = "bluegem", weight = 1, min = 3, max = 10 },
	{ prefab = "purplegem", weight = 0.8, min = 1, max = 2 },
	{ prefab = "orangegem", weight = 0.8, min = 1, max = 2 },
	{ prefab = "yellowgem", weight = 0.5, min = 1, max = 2 },
	{ prefab = "greengem", weight = 0.5, min = 1, max = 2 },
}

-- 特殊物品池
local SPECIAL_POOL = {
	{ prefab = "nightmarefuel", weight = 1, min = 20, max = 40 },
	{ prefab = "walrus_tusk", weight = 1, min = 1, max = 1 },
	{ prefab = "mandrake", weight = 1, min = 1, max = 1 },
	{ prefab = "lightninggoathorn", weight = 1, min = 1, max = 1 },
	{ prefab = "steelwool", weight = 1, min = 1, max = 1 },
	{ prefab = "krampus_sack", weight = 0.1, min = 1, max = 1 },
}

-- ------------------------------------------------------------
-- 从指定池子里按权重抽一件
-- ------------------------------------------------------------
local function PickFromPool(pool)
	local total = 0
	for _, v in ipairs(pool) do
		total = total + v.weight
	end
	local r = math.random() * total
	for _, v in ipairs(pool) do
		r = r - v.weight
		if r <= 0 then
			return v
		end
	end
	return pool[1]
end

-- ------------------------------------------------------------
-- 第 4 格：按天数动态选池子
--   0~50 天：基础池、宝石池、特殊池
--   50~100 天：宝石池、特殊池
--   100 天以后：只有特殊池
-- ------------------------------------------------------------
local function PickDynamicPool()
	local day = TheWorld.state.cycles

	local w_basic = math.max(1 - day / 50, 0) -- 50 天归零
	local w_gem = math.max(1 - day / 100, 0) -- 100 天归零
	local w_special = 1 + math.min(day / 100, 1) * 2

	local total = w_basic + w_gem + w_special
	local r = math.random() * total

	if r < w_basic then
		return BASIC_POOL
	elseif r < w_basic + w_gem then
		return GEM_POOL
	else
		return SPECIAL_POOL
	end
end

local function NoHoles(pt)
	return not TheWorld.Map:IsPointNearHole(pt)
end

-- ============================================================
-- 生成礼物盒
-- ============================================================
local function MakeCritterGift(inst, petter)
	if petter == nil or not petter:IsValid() or petter.components.inventory == nil then
		return
	end

	local items = {}

	-- 第 1 格：基础池
	-- 第 2 格：宝石池
	-- 第 3 格：特殊池
	-- 第 4 格：按天数动态选池
	local pools = {
		BASIC_POOL,
		GEM_POOL,
		SPECIAL_POOL,
		PickDynamicPool(),
	}

	for _, pool in ipairs(pools) do
		local entry = PickFromPool(pool)
		if entry ~= nil then
			local item = SpawnPrefab(entry.prefab)
			if item ~= nil then
				local stack = math.random(entry.min, entry.max)
				if item.components.stackable ~= nil then
					item.components.stackable:SetStackSize(stack)
				end
				table.insert(items, item)
			end
		end
	end

	if #items == 0 then
		return
	end

	local gift = SpawnPrefab("gift")
	if gift == nil then
		for _, item in ipairs(items) do
			petter.components.inventory:GiveItem(item, nil, inst:GetPosition())
		end
		return
	end

	gift.components.unwrappable:WrapItems(items)
	for _, item in ipairs(items) do
		item:Remove()
	end

	local pos = inst:GetPosition()
	local theta = inst:GetAngleToPoint(petter.Transform:GetWorldPosition()) * DEGREES
	local radius = inst:GetPhysicsRadius(0) + 0.7 + math.random() * 0.5

	local offset = FindWalkableOffset(pos, theta, radius, 8, false, true, NoHoles)
		or FindWalkableOffset(pos, theta, radius + 0.5, 8, false, true, NoHoles)

	if offset ~= nil then
		gift.Transform:SetPosition(pos.x + offset.x, 0, pos.z + offset.z)
	else
		petter.components.inventory:GiveItem(gift, nil, pos:Get())
	end

	inst.SoundEmitter:PlaySound("dontstarve/creatures/together/deer/bell")
	inst.SoundEmitter:PlaySound("dontstarve/creatures/together/deer/chain")
	inst.SoundEmitter:PlaySound("dontstarve/common/dropGeneric")

	if petter.components.talker ~= nil then
		petter:DoTaskInTime(0.6, function()
			if petter:IsValid() and petter.components.talker ~= nil then
				petter.components.talker:Say("这是给我的吗？")
			end
		end)
	end
end

-- ============================================================
-- 抚摸给礼物
-- ============================================================
local function GivePetGift(inst, petter)
	if petter == nil or not petter:IsValid() or petter.components.inventory == nil then
		return
	end

	-- 用世界天数判断（地上洞穴通用）
	local today = TheWorld.state.cycles

	-- 同一天只给一次
	if inst._lastgiftcycle == today then
		if petter.components.talker ~= nil then
			petter:DoTaskInTime(0.5, function()
				if petter:IsValid() and petter.components.talker ~= nil then
					petter.components.talker:Say("再摸都要秃啦。")
				end
			end)
		end
		return
	end

	-- 记下这次给礼物的天数
	inst._lastgiftcycle = today

	inst:DoTaskInTime(GIFT_DELAY, function()
		if not inst:IsValid() or not petter:IsValid() then
			return
		end
		if petter.components.inventory == nil then
			return
		end
		MakeCritterGift(inst, petter)
	end)
end

-- ============================================================
-- 宠物初始化
-- ============================================================
for _, pet in ipairs(PETS) do
	AddPrefabPostInit(pet, function(inst)
		if not TheWorld.ismastersim then
			return
		end

		inst._madeleine_fed = inst._madeleine_fed or false
		inst._lastgiftcycle = inst._lastgiftcycle or nil

		-- ---------------- 存档 ----------------
		local _oldOnSave = inst.OnSave
		inst.OnSave = function(_inst, _data)
			local data = _oldOnSave and _oldOnSave(_inst, _data) or _data or {}
			data.madeleine_fed = _inst._madeleine_fed
			data.lastgiftcycle = _inst._lastgiftcycle
			return data
		end

		-- ---------------- 读档 ----------------
		local _oldOnLoad = inst.OnLoad
		inst.OnLoad = function(_inst, _data)
			if _oldOnLoad then
				_oldOnLoad(_inst, _data)
			end
			if _data then
				if _data.lastgiftcycle ~= nil then
					_inst._lastgiftcycle = _data.lastgiftcycle
				end
				if _data.madeleine_fed then
					_inst._madeleine_fed = true
					if _inst.components.perishable then
						_inst.components.perishable:SetPercent(1)
						_inst.components.perishable:StopPerishing()
						_inst.components.perishable.StartPerishing = function() end
					end
				end
			end
		end

		-- ---------------- 喂食逻辑 ----------------
		if inst.components.eater then
			local _oneatfn = inst.components.eater.oneatfn
			inst.components.eater:SetOnEatFn(function(inst, food)
				if inst.components.follower then
					local leader = inst.components.follower:GetLeader()
					if leader and leader.prefab == MADELEINE then
						if leader.components.talker then
							leader.components.talker:Say("吃饱了就不要再闹了哦。")
						end
						inst._madeleine_fed = true
						if inst.components.perishable then
							inst.components.perishable:SetPercent(1)
							inst.components.perishable:StopPerishing()
							inst.components.perishable.StartPerishing = function() end
						end
					end
				end
				if _oneatfn then
					return _oneatfn(inst, food)
				end
			end)
		end

		-- ---------------- 抚摸给礼物 ----------------
		if inst.components.crittertraits then
			local _oldonpet = inst.components.crittertraits.onpetfn
			inst.components.crittertraits:SetOnPetFn(function(_inst, petter)
				if _oldonpet then
					_oldonpet(_inst, petter)
				end
				GivePetGift(_inst, petter)
			end)
		end
	end)
end
