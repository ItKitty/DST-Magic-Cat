-- m_polly
-- 护符召唤的鹦鹉：只捡种子，不给它生命值、不带碰撞体积。
-- 由 m_amulet 在「护符带龙鳞」时召唤，脱下护符就消失。

local brain = require("brains/m_pollybrain")

local assets = {
	Asset("ANIM", "anim/polly_rogers.zip"),
}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

	-- 无碰撞体积：幽灵物理 + 去掉碰撞体（和小动物一样的做法）
	MakeGhostPhysics(inst, 1, .1)
	RemovePhysicsColliders(inst)

	inst.DynamicShadow:SetSize(1, .75)
	inst.Transform:SetFourFaced()

	inst.AnimState:SetBank("polly_rogers")
	inst.AnimState:SetBuild("polly_rogers")
	inst.AnimState:PlayAnimation("idle_ground", true)

	inst:AddTag("animal")
	inst:AddTag("smallcreature")
	inst:AddTag("companion")
	inst:AddTag("untrappable")
	inst:AddTag("noplayertarget")
	inst:AddTag("NOBLOCK")
	inst:AddTag("bird")
	inst:AddTag("flying")
	inst:AddTag("notraptrigger")
	inst:AddTag("noauradamage")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	-- 由护符管理，不进存档
	inst.persists = false

	inst:AddComponent("locomotor")
	inst.components.locomotor.walkspeed = TUNING.POLLY_ROGERS_WALK_SPEED
	inst.components.locomotor.runspeed = TUNING.POLLY_ROGERS_RUN_SPEED
	inst.components.locomotor.pathcaps = { allowocean = true }
	inst.components.locomotor:SetTriggersCreep(false)

	inst:AddComponent("inventory")
	inst.components.inventory.maxslots = 1

	inst:AddComponent("follower")
	inst.components.follower:KeepLeaderOnAttacked()

	inst:AddComponent("inspectable")

	inst:SetStateGraph("SGm_polly")
	inst:SetBrain(brain)

	return inst
end

return Prefab("m_polly", fn, assets)
