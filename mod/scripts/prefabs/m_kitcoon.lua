-- m_kitcoon
-- 玛德琳的专属浣猫崽（大号 kitcoon 外观）：会跟随，肚子里是一个 3x4 的保鲜仓库。
-- 参考工坊「(专属)浣猫崽」的思路重写：
--   · 外观固定用原版大号浣猫崽（kitcoon bank + kitcoon_forest_build），不做换皮
--   · 跟随/存档交给自定义的 m_petleash 组件，不碰原版 petleash，
--     所以不影响玩家召唤其它宠物
--   · container 用 m_kitcoon 布局（3x4，和龙鳞箱一样），开启无限堆叠
--   · preserver 保鲜 + 定期回满新鲜度

local brain = require("brains/m_kitcoonbrain")

local WAKE_TO_FOLLOW_DISTANCE = 6
local SLEEP_NEAR_LEADER_DISTANCE = 5

local KITCOON_BANK = "kitcoon"
local KITCOON_BUILD = "kitcoon_forest_build"

local assets = {
	Asset("ANIM", "anim/kitcoon_basic.zip"),
	Asset("ANIM", "anim/kitcoon_emotes.zip"),
	Asset("ANIM", "anim/kitcoon_traits.zip"),
	Asset("ANIM", "anim/kitcoon_jump.zip"),
	Asset("ANIM", "anim/" .. KITCOON_BUILD .. ".zip"),
}

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

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

	inst.DynamicShadow:SetSize(1, .33)
	inst.Transform:SetSixFaced()

	inst.AnimState:SetBank(KITCOON_BANK)
	inst.AnimState:SetBuild(KITCOON_BUILD)
	inst.AnimState:PlayAnimation("idle_loop")

	MakeGhostPhysics(inst, 1, .5)
	RemovePhysicsColliders(inst)
	inst.Physics:SetDontRemoveOnSleep(true)

	inst:AddTag("critter")
	inst:AddTag("companion")
	inst:AddTag("notraptrigger")
	inst:AddTag("noauradamage")
	inst:AddTag("small_livestock")
	inst:AddTag("NOBLOCK")
	-- kitcoon 标签：让原版「浣猫崽」相关逻辑认得它
	inst:AddTag("kitcoon")
	inst:AddTag("nonpackable")

	inst:AddComponent("spawnfader")

	inst.favoritefood = "fishsticks"
	inst.playmatetags = { "critter", "kitcoon" }

	inst.GetPeepChance = GetPeepChance
	inst.IsAffectionate = IsAffectionate
	inst.IsSuperCute = IsSuperCute
	inst.IsPlayful = IsPlayful

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	-- 起名（名字固定，见下面的 SetName）
	inst:AddComponent("named")

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

	-- 固定名字「猪咪」：稍微延后一点，确保读档时名字组件的 OnLoad 已经跑完
	inst:DoTaskInTime(0.1, function(inst2)
		if inst2.components.named ~= nil then
			inst2.components.named:SetName(STRINGS.M_KITCOON_NAME)
		end
	end)

	return inst
end

return Prefab("m_kitcoon", fn, assets)
