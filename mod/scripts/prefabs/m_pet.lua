-- 资源声明
local assets = {
	-- 动画资源
	Asset("ANIM", "anim/neverfade_butterfly.zip"),
	Asset("ANIM", "anim/butterfly_basic.zip"),
	Asset("ANIM", "anim/bat_basic.zip"),

	-- 声音资源
	Asset("SOUND", "sound/bat.fsb"),
}

local prefabs = {
	"moonbutterflywings",
	"batwing",
	"wormwood_lunar_transformation_finish",
}

-- 公共配置
local COMMON_CONFIG = {
	LOCOMOTOR = {
		walk_speed = 12,
		run_speed = 14,
		pathcaps = { allowocean = true },
	},
	HEALTH = {
		max_health = 650,
		absorb = 0.95,
		regen_amount = 22.5,
		regen_period = 3,
	},
	LIGHT = {
		falloff = 0.8,
		intensity = 0.5,
		radius = 1.5,
		color = { 180 / 255, 195 / 255, 225 / 255 },
	},
}

-- 生命周期结束处理
local function finish_transformed_life(inst, data)
	local ix, iy, iz = inst.Transform:GetWorldPosition()
	local leader = inst.components.follower:GetLeader()
	local loot_prefab = (inst.prefab == "m_lightpet") and "moonbutterflywings" or "batwing"
	local buff_tag = "buff_" .. inst.prefab

	if leader and leader:HasDebuff(buff_tag) then
		leader:RemoveDebuff(buff_tag)
	end

	if leader then
		leader.components.talker:Say("BUFF消失了！！")
	end

	local loot = SpawnPrefab(loot_prefab)
	loot.Transform:SetPosition(ix, iy, iz)
	inst.components.lootdropper:FlingItem(loot)

	SpawnPrefab("wormwood_lunar_transformation_finish").Transform:SetPosition(ix, iy, iz)
	inst:Remove()
end

-- 被攻击事件处理
local function OnAttacked(inst, data)
	if data.attacker ~= nil and data.attacker.components.petleash and data.attacker.components.petleash:IsPet(inst) then
		finish_transformed_life(inst, data)
	end
end

-- 设置公共组件
local function setup_common_components(inst)
	inst:AddComponent("locomotor")
	inst.components.locomotor:EnableGroundSpeedMultiplier(false)
	inst.components.locomotor:SetTriggersCreep(false)
	inst.components.locomotor.walkspeed = COMMON_CONFIG.LOCOMOTOR.walk_speed
	inst.components.locomotor.runspeed = COMMON_CONFIG.LOCOMOTOR.run_speed
	inst.components.locomotor.pathcaps = COMMON_CONFIG.LOCOMOTOR.pathcaps

	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(COMMON_CONFIG.HEALTH.max_health)
	inst.components.health.absorb = COMMON_CONFIG.HEALTH.absorb
	inst.components.health:StartRegen(COMMON_CONFIG.HEALTH.regen_amount, COMMON_CONFIG.HEALTH.regen_period)

	inst:AddComponent("inspectable")
	inst.components.inspectable:RecordViews()

	inst:AddComponent("knownlocations")
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_LARGE

	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)

	inst:AddComponent("combat")
	inst:AddComponent("planardefense")
	inst.components.planardefense:SetBaseDefense(10)

	inst:AddComponent("pettraits")
	inst:AddComponent("lootdropper")

	inst:ListenForEvent("attacked", OnAttacked)
	inst:ListenForEvent("death", function()
		finish_transformed_life(inst)
	end)

	inst.RemoveMPets = finish_transformed_life
end

-- 创建基础实体
local function create_base_entity(bank, build)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	-- inst.entity:AddMiniMapEntity()
	inst.entity:AddLight()

	-- 重要：允许被保存到存档
	inst.persists = true

	MakeGhostPhysics(inst, 1, 0.5)

	inst.AnimState:SetBank(bank)
	inst.AnimState:SetBuild(build)
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("m_pet")
	inst:AddTag("companion")
	inst:AddTag("flying")
	inst:AddTag("ignorewalkableplatformdrowning")
	inst:AddTag("NOBLOCK")
	inst:AddTag("shadow")
	inst:AddTag("gestaltprotection")

	inst.Light:SetFalloff(COMMON_CONFIG.LIGHT.falloff)
	inst.Light:SetIntensity(COMMON_CONFIG.LIGHT.intensity)
	inst.Light:SetRadius(COMMON_CONFIG.LIGHT.radius)
	inst.Light:SetColour(unpack(COMMON_CONFIG.LIGHT.color))

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	local follower = inst:AddComponent("follower")
	follower:KeepLeaderOnAttacked()
	follower.keepdeadleader = true
	follower.keepleaderduringminigame = true

	setup_common_components(inst)

	inst:SetBrain(require("brains/petbrain"))

	return inst
end

-- 光系宠物
local function light(inst)
	inst = create_base_entity("butterfly", "butterfly_moon")

	inst.AnimState:SetRayTestOnBB(true)
	inst.AnimState:SetLightOverride(0.3)
	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

	-- inst.MiniMapEntity:SetIcon("lightpet.tex")
	-- inst.MiniMapEntity:SetCanUseCache(false)

	inst.Transform:SetTwoFaced()
	inst.Transform:SetScale(0.8, 0.8, 0.8)
	inst.AnimState:SetMultColour(44 / 255, 109 / 255, 139 / 255, 1)

	inst.Light:Enable(true)

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddTag("m_lightpet")
	inst:SetStateGraph("SGlightpet")

	inst.components.pettraits:AddFx(inst, "cane_victorian_fx", "butterfly_body")
	inst.components.pettraits:AddFx3(inst, "wurt_swampitem_lunar_chargedfx", "butterfly_body")

	return inst
end

-- 暗系宠物
local function dark(inst)
	inst = create_base_entity("bat", "bat_basic")

	inst.Transform:SetFourFaced()
	inst.Transform:SetScale(0.4, 0.4, 0.4)

	-- inst.MiniMapEntity:SetIcon("darkpet.tex")
	-- inst.MiniMapEntity:SetCanUseCache(false)

	inst.Light:Enable(false)

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddTag("m_darkpet")
	inst.components.locomotor.walkspeed = 18
	inst:SetStateGraph("SGdarkpet")

	inst.components.pettraits:AddFx(inst, "cane_victorian_fx", "bat_body")
	inst.components.pettraits:AddFx2(inst, "wurt_swampitem_shadow_chargedfx", "bat_body")

	return inst
end

-- 返回预制体
return Prefab("m_lightpet", light, assets, prefabs), Prefab("m_darkpet", dark, assets, prefabs)
