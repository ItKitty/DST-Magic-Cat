local assets = {
	Asset("ANIM", "anim/haste_fx.zip"),
}
local function onsave()
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
	-- 添加网络标识（关键修复）
	inst.entity:AddNetwork()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()

	inst.AnimState:SetBank("haste_fx")
	inst.AnimState:SetBuild("haste_fx")
	inst.AnimState:PlayAnimation("fx", true)
	inst.AnimState:SetScale(1, 0.7, 1)
	inst.AnimState:SetMultColour(0.6, 0.6, 0.6, 0.5)

	-- inst:DoTaskInTime(0.5, function()
	-- 	if inst and not inst:HasTag("cast_fx") then
	-- 		inst:Remove()
	-- 	end
	-- end)
	inst:AddTag("fx")

	inst.entity:SetPristine()
	if not TheWorld.ismastersim then
		return inst
	end

	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

	return inst
end

return Prefab("fx_haste", fn, assets)
