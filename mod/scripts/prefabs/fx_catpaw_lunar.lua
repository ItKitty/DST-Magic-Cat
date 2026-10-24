-- 猫爪的「月能充能」光效
-- 原版 wurt_swampitem_lunar_chargedfx 有两处不合适：
--   AnimState:SetFinalOffset(-1)    → 排在武器后面（层级偏低）
--   AnimState:SetMultColour(1,1,1,.5) → 半透明，看着发浅
-- 这里复制一份，把透明度和层级做成可调常量，避免影响到 Wurt 本体的那个物品

local assets = {
	Asset("ANIM", "anim/wurt_swampitem_charged_fx.zip"),
}

-- 调到满意为止：
-- ALPHA：1 = 完全不透明（原版 0.5）
-- FINAL_OFFSET：负数在武器后面、正数在武器前面（原版 -1）
local FX_ALPHA = 1
local FX_FINAL_OFFSET = 1

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst.AnimState:SetBank("wurt_swampitem_charged_fx")
	inst.AnimState:SetBuild("wurt_swampitem_charged_fx")
	inst.AnimState:PlayAnimation("lunar", true)
	inst.AnimState:SetFinalOffset(FX_FINAL_OFFSET)
	inst.AnimState:SetMultColour(1, 1, 1, FX_ALPHA)
	inst.AnimState:UsePointFiltering(true)
	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
	inst.AnimState:SetLightOverride(.1)

	inst:AddTag("FX")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.AnimState:SetFrame(math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1)

	inst.persists = false

	return inst
end

return Prefab("fx_catpaw_lunar", fn, assets)
