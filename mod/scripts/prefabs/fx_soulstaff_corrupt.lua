-- 灵魂法杖专用：国王权杖的腐化光效（最高档）
-- 只播 corrupt_level3 这一段动画，不带武器本体贴图。
-- 原版里这是 king_cane_fx 内部的非网络子特效，这里单独做成一个可联网的 FX prefab，
-- 这样服务端生成一次，所有客户端都能看到。

local assets = {
	Asset("ANIM", "anim/king_cane.zip"),
}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddFollower()
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")
	inst:AddTag("DECOR")

	inst.AnimState:SetBank("king_cane")
	inst.AnimState:SetBuild("king_cane")
	inst.AnimState:PlayAnimation("corrupt_level3", true)

	inst.Transform:SetNoFaced()

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.persists = false

	return inst
end

return Prefab("fx_soulstaff_corrupt", fn, assets)
