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

	-- 物理对照原版 prefabs/polly_rogers.lua:40-48 的「飞行」分支：
	-- 用真实动态刚体（这样 Physics:SetMotorVel 才推得动），
	-- 但碰撞掩码只给 GROUND，不会和玩家/生物互推 —— 依旧无碰撞体积。
	inst.entity:AddPhysics()
	inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
	inst.Physics:SetCollisionMask(COLLISION.GROUND)
	inst.Physics:SetMass(1)
	inst.Physics:SetSphere(1)

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

	-- 登场：不需要额外触发 —— SGm_polly 的默认状态就是 "glide"，
	-- 和原版 SGpolly_rogers 用 AddInitState(states, "glide") 起手一致。

	-- 收回：flyaway 状态向上飞走，状态里会自己 Remove
	inst.PlaySummonDespawn = function(inst2)
		if inst2.sg ~= nil then
			inst2.sg:GoToState("flyaway")
		else
			inst2:Remove()
		end
	end

	return inst
end

return Prefab("m_polly", fn, assets)
