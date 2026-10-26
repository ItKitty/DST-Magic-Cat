-- m_lunge_trail
-- 穿刺（combat_lunge）用的拖尾特效。
--
-- 走的是原版 aoeweapon_lunge 自带的接口：
--   components/aoeweapon_lunge.lua:33  SetTrailFX(prefab, spacing)
--   components/aoeweapon_lunge.lua:186-226  DoLunge 会沿「起点 -> 落点」等距铺这个 FX
-- 所以这里只需要提供一个会自己淡出消失的 FX prefab，不需要 net_event，也不用改状态机。
--
-- 视觉直接复用原版奔雷的拖尾资源 elec_lunge_fx（对应
-- prefabs/spear_wathgrithr.lua:600-645 的 LungueTrailFxFn），
-- 区别只在于把 Prefab 名换成自己的，避免和原版撞名。

local assets = {
	Asset("ANIM", "anim/elec_lunge_fx.zip"),
}

local function FX_OnUpdate(inst, dt)
	inst.Light:SetIntensity(inst.i)
	inst.i = inst.i - dt * 2
	if inst.i <= 0 then
		if inst.killfx then
			inst:Remove()
		else
			inst.task:Cancel()
			inst.task = nil
		end
	end
end

local function FX_OnAnimOver(inst)
	if inst.task == nil then
		inst:Remove()
	else
		inst:RemoveEventCallback("animover", FX_OnAnimOver)
		inst.killfx = true
	end
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddLight()

	inst.Light:Enable(true)
	inst.Light:SetRadius(3.5)
	inst.Light:SetFalloff(1.5)
	inst.Light:SetIntensity(.9)
	inst.Light:SetColour(237 / 255, 237 / 255, 209 / 255)

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")

	inst.Transform:SetEightFaced()

	inst.AnimState:SetBank("elec_lunge_fx")
	inst.AnimState:SetBuild("elec_lunge_fx")
	inst.AnimState:PlayAnimation("fx")

	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
	inst.AnimState:SetLightOverride(1)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	local scale = GetRandomMinMax(1.4, 1.7)
	inst.Transform:SetScale(scale, scale, scale)

	inst.persists = false

	local dt = 1 / 20

	inst.i = .9
	inst.task = inst:DoPeriodicTask(dt, FX_OnUpdate, nil, dt)

	inst:ListenForEvent("animover", FX_OnAnimOver)

	return inst
end

return Prefab("m_lunge_trail", fn, assets)
