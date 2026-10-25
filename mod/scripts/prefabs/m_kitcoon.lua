-- m_kitcoon
-- 玛德琳的专属浣猫崽：会跟随、可改名/换皮，肚子里是一个 3x4 的保鲜仓库。
-- 参考工坊「(专属)浣猫崽」(2904374520) 的思路重写：
--   · 用原版浣猫崽（kittington）的美术，皮肤用原版 kitcoon 各地形 build
--   · 跟随/存档交给自定义的 m_petleash 组件，不碰原版 petleash，
--     所以不影响玩家召唤其它宠物
--   · container 用 m_kitcoon 布局（3x4，和龙鳞箱一样），开启无限堆叠
--   · preserver 保鲜 + 定期回满新鲜度
--   · 皮肤用 net_string 同步，客户端收到后再切 AnimState，保证联机也看得到

local brain = require("brains/crittersbrain")

local WAKE_TO_FOLLOW_DISTANCE = 6
local SLEEP_NEAR_LEADER_DISTANCE = 5

local BASE_BANK = "kittington"
local BASE_BUILD = "kittington_build"

-- 换皮：原版 kitcoon 的各地形 build
local SKIN_BUILDS = {
	kitcoon_forest = true,
	kitcoon_savanna = true,
	kitcoon_deciduous = true,
	kitcoon_marsh = true,
	kitcoon_grass = true,
	kitcoon_rocky = true,
	kitcoon_desert = true,
	kitcoon_moon = true,
	kitcoon_yot = true,
}

local assets = {
	Asset("ANIM", "anim/kittington_build.zip"),
	Asset("ANIM", "anim/kittington_basic.zip"),
	Asset("ANIM", "anim/kittington_emotes.zip"),
	Asset("ANIM", "anim/kittington_traits.zip"),
	Asset("ANIM", "anim/kittington_jump.zip"),
	-- 换皮用的资源
	Asset("ANIM", "anim/kitcoon_basic.zip"),
	Asset("ANIM", "anim/kitcoon_emotes.zip"),
	Asset("ANIM", "anim/kitcoon_traits.zip"),
	Asset("ANIM", "anim/kitcoon_jump.zip"),
}
for skin in pairs(SKIN_BUILDS) do
	table.insert(assets, Asset("ANIM", "anim/" .. skin .. "_build.zip"))
end

local function IsLeaderSleeping(inst)
	return inst.components.follower.leader ~= nil and inst.components.follower.leader:HasTag("sleeping")
end

local function ShouldWakeUp(inst)
	return (DefaultWakeTest(inst) and not IsLeaderSleeping(inst))
		or not inst.components.follower:IsNearLeader(WAKE_TO_FOLLOW_DISTANCE)
end

local function ShouldSleep(inst)
	return (DefaultSleepTest(inst) or IsLeaderSleeping(inst))
		and inst.components.follower:IsNearLeader(SLEEP_NEAR_LEADER_DISTANCE)
end

local function GetPeepChance(inst)
	return 0
end

local function IsAffectionate(inst)
	return true
end

local function IsPlayful(inst)
	return true
end

local function IsSuperCute(inst)
	return true
end

-- 按当前的皮肤值切换 bank/build；服务端和客户端都会调
local function ApplySkin(inst)
	local skin = inst._skin ~= nil and inst._skin:value() or nil

	if skin ~= nil and skin ~= "" and SKIN_BUILDS[skin] then
		inst.AnimState:SetBank("kitcoon")
		inst.AnimState:SetBuild(skin .. "_build")
	else
		inst.AnimState:SetBank(BASE_BANK)
		inst.AnimState:SetBuild(BASE_BUILD)
	end

	if inst._killed then
		return
	end
	inst.AnimState:PlayAnimation("idle_loop")
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

	inst.DynamicShadow:SetSize(1, .33)
	inst.Transform:SetSixFaced()

	-- 皮肤：服务端写、客户端读
	inst._skin = net_string(inst.GUID, "m_kitcoon.skin", "m_kitcoon_skindirty")

	MakeGhostPhysics(inst, 1, .5)
	RemovePhysicsColliders(inst)
	inst.Physics:SetDontRemoveOnSleep(true)

	inst:AddTag("critter")
	inst:AddTag("companion")
	inst:AddTag("notraptrigger")
	inst:AddTag("noauradamage")
	inst:AddTag("small_livestock")
	inst:AddTag("NOBLOCK")
	-- kitcoon 标签：让原版「浣猫崽」相关逻辑认得它（起名/互动）
	inst:AddTag("kitcoon")
	inst:AddTag("nonpackable")

	inst:AddComponent("spawnfader")

	inst.favoritefood = "fishsticks"
	inst.playmatetags = { "critter", "kitcoon" }

	inst.GetPeepChance = GetPeepChance
	inst.IsAffectionate = IsAffectionate
	inst.IsSuperCute = IsSuperCute
	inst.IsPlayful = IsPlayful

	ApplySkin(inst)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		inst:ListenForEvent("m_kitcoon_skindirty", function(inst2)
			ApplySkin(inst2)
		end)
		-- 进服时网络值可能稍后才到，补一次
		inst:DoTaskInTime(0.2, function(inst2)
			ApplySkin(inst2)
		end)
		return inst
	end

	-- 起名
	inst:AddComponent("named")
	inst.components.named.possiblenames = STRINGS.M_KITCOON_NAMES

	inst:AddComponent("inspectable")

	inst:AddComponent("follower")
	inst.components.follower:KeepLeaderOnAttacked()
	inst.components.follower.keepdeadleader = true
	inst.components.follower.keepleaderduringminigame = true

	inst:AddComponent("knownlocations")

	inst:AddComponent("sleeper")
	inst.components.sleeper:SetResistance(3)
	inst.components.sleeper.testperiod = GetRandomWithVariance(6, 2)
	inst.components.sleeper:SetSleepTest(ShouldSleep)
	inst.components.sleeper:SetWakeTest(ShouldWakeUp)

	inst:AddComponent("eater")
	inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })

	-- 3x4 储物格（布局在 systems/m_kitcoon_container.lua 里注册）
	inst:AddComponent("container")
	inst.components.container:WidgetSetup("m_kitcoon")
	inst.components.container:EnableInfiniteStackSize(true)

	-- 保鲜：perish 速度为 0，另外定期把新鲜度往回补一点
	inst:AddComponent("preserver")
	inst.components.preserver:SetPerishRateMultiplier(0)

	inst:AddComponent("locomotor")
	inst.components.locomotor:EnableGroundSpeedMultiplier(true)
	inst.components.locomotor:SetTriggersCreep(false)
	inst.components.locomotor.softstop = true
	inst.components.locomotor.walkspeed = TUNING.CRITTER_WALK_SPEED
	inst.components.locomotor:SetAllowPlatformHopping(true)

	inst:AddComponent("embarker")
	inst.components.embarker.embark_speed = inst.components.locomotor.walkspeed

	inst:AddComponent("drownable")
	inst.components.drownable.enabled = false

	inst:AddComponent("crittertraits")
	inst:AddComponent("timer")

	inst:SetBrain(brain)
	inst:SetStateGraph("SGcritter_kitten")

	-- 换皮入口（服务端调用；写入 net_string 后客户端会自己切）
	inst.ApplyKitcoonSkin = function(inst2, skin)
		inst2._skin:set(skin ~= nil and SKIN_BUILDS[skin] and skin or "")
		ApplySkin(inst2)
	end

	-- 如果有通过 SpawnPrefab(name, skin) 传入的皮肤，补应用一次
	inst:DoTaskInTime(0, function(inst2)
		if inst2._skin:value() == "" and inst2.linked_skinname ~= nil and SKIN_BUILDS[inst2.linked_skinname] then
			inst2:ApplyKitcoonSkin(inst2.linked_skinname)
		end
	end)

	-- 兜底保鲜：每 10 秒把格子里的食物新鲜度往回补 1%
	inst:DoPeriodicTask(10, function(inst2)
		if inst2.components.container == nil then
			return
		end
		for _, item in pairs(inst2.components.container.slots) do
			if item.components.perishable ~= nil then
				item.components.perishable:ReducePercent(-0.01)
			end
		end
	end)

	-- 首次生成时随机起个名字
	inst:DoTaskInTime(0, function(inst2)
		if inst2.components.named ~= nil and inst2.name == nil then
			inst2.components.named:PickNewName()
		end
	end)

	return inst
end

return Prefab("m_kitcoon", fn, assets)
