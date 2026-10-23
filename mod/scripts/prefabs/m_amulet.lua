local assets = {
	Asset("ANIM", "anim/ancestorsrelics.zip"),
}

local prefabs = {}

local function onequip(inst, owner)
	-- 处理皮肤和动画
	-- local skin_build = inst:GetSkinBuild()
	-- if skin_build ~= nil then
	-- 	owner:PushEvent("equipskinneditem", inst:GetSkinName())
	-- 	owner.AnimState:OverrideItemSkinSymbol("swap_body", skin_build, "swap_body", inst.GUID, "torso_amulets")
	-- else
	owner.AnimState:OverrideSymbol("swap_body", "ancestorsrelics", "blueamulet")
	-- end

	local amulettraits = inst.components.amulettraits

	-- 激活各项能力
	if amulettraits:HasSkill("redgem") then
		-- 可控燃烧 傻逼科雷电击植物燃烧
		owner:AddTag("controlled_burner")
		amulettraits:HealStart(inst, owner)
	end
	if amulettraits:HasSkill("bluegem") then
		amulettraits:EnableWaterWalking(inst, owner, true)
	end
	if amulettraits:HasSkill("purplegem") then
		amulettraits:SetSanityAura(owner, true)
	end
	if amulettraits:HasSkill("orangegem") then
		amulettraits:EnableNoSlowDown(owner, true)
	end
	if amulettraits:HasSkill("yellowgem") then
		amulettraits:EnableLight(owner, true)
	end
	if amulettraits:HasSkill("greengem") then
		amulettraits:SetBuildCostReduction(owner, true)
	end
	if amulettraits:HasSkill("opalpreciousgem") then
		amulettraits:SetDisguise(owner, true)
	end
	if amulettraits:HasSkill("alterguardianhatshard") then
		inst:AddTag("m_amulet_spatial")
	end

	amulettraits:SetTemperatureImmunity(
		inst,
		amulettraits:HasSkill("dragon_scales"),
		amulettraits:HasSkill("deerclops_eyeball"),
		owner
	)
	-- 回血
	amulettraits:onequip_protect(inst, owner)
	-- 骨甲
	amulettraits:InitializeDefenseSystem()
end

local function onunequip(inst, owner)
	-- if owner.sg == nil or owner.sg.currentstate.name ~= "amulet_rebirth" then
	-- 	owner.AnimState:ClearOverrideSymbol("swap_body")
	-- end

	-- local skin_build = inst:GetSkinBuild()
	-- if skin_build ~= nil then
	-- 	owner:PushEvent("unequipskinneditem", inst:GetSkinName())
	-- end
	owner.AnimState:ClearOverrideSymbol("swap_body")

	local amulettraits = inst.components.amulettraits

	-- 禁用各项能力
	if amulettraits:HasSkill("redgem") then
		owner:RemoveTag("controlled_burner")
		amulettraits:HealEnd()
	end

	if amulettraits:HasSkill("bluegem") then
		amulettraits:EnableWaterWalking(inst, owner, false)
	end

	if amulettraits:HasSkill("purplegem") then
		amulettraits:SetSanityAura(owner, false)
	end

	if amulettraits:HasSkill("orangegem") then
		amulettraits:EnableNoSlowDown(owner, false)
	end
	if amulettraits:HasSkill("yellowgem") then
		amulettraits:EnableLight(owner, false)
	end
	if amulettraits:HasSkill("purplegem") then
		amulettraits:SetBuildCostReduction(owner, false)
	end
	if amulettraits:HasSkill("opalpreciousgem") then
		amulettraits:SetDisguise(owner, false)
	end
	if amulettraits:HasSkill("alterguardianhatshard") then
		inst:RemoveTag("m_amulet_spatial")
	end

	amulettraits:SetTemperatureImmunity(inst, false, false, owner)
	amulettraits:onunequip_protect(inst, owner)
	-- 骨甲
	amulettraits:DeactivateDefenseSystem()
end

-- 视觉效果
local function ShowGroundFX(inst)
	if inst.fx == nil then
		inst.fx = SpawnPrefab("tophat_shadow_fx")
	else
		inst.fx.Follower:StopFollowing()
		inst.fx.Transform:SetPosition(0, 0, 0)
	end
	inst.fx.entity:SetParent(inst.entity)
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()

	MakeInventoryPhysics(inst)
	-- local skin_build = inst:GetSkinBuild()
	-- if skin_build ~= nil then
	-- 	inst.AnimState:SetBank("amulets")
	-- 	inst.AnimState:SetBuild("amulets")
	-- 	inst.AnimState:PlayAnimation("redamulet")
	-- else
	inst.AnimState:SetBank("ancestorsrelics")
	inst.AnimState:SetBuild("ancestorsrelics")
	inst.AnimState:PlayAnimation("idle")
	-- end

	inst:AddTag("m_item")
	inst:AddTag("m_amulet")

	-- 复活石
	inst:AddTag("resurrector")
	-- 君威
	inst:AddTag("regal")
	-- 不会被偷
	inst:AddTag("nosteal")

	-- 隐藏百分比
	-- inst:AddTag("hide_percentage")

	MakeInventoryFloatable(inst, "med", nil, 0.6)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	-- 网络变量
	-- inst.deliverylist = net_string(inst.GUID, "deliverylist") -- 传送列表

	inst:AddComponent("named")
	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "ancestorsrelics"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ancestorsrelics.xml"

	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.NECK or EQUIPSLOTS.BODY
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = 1.2
	-- 专属 能被捡起但不能佩戴
	-- inst.components.equippable.restrictedtag = "madeleine"

	inst:AddComponent("amulettraits")
	-- inst.components.amulettraits.inst = inst -- 确保inst被正确设置

	inst:AddComponent("waterproofer")
	inst.components.waterproofer:SetEffectiveness(0)

	-- 回血CD
	inst.protect_time = nil

	--作祟
	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)

	-- 显示倒计时CD
	inst:AddComponent("rechargeable")

	-- 骨甲CD
	inst:AddComponent("cooldown")
	inst.components.cooldown.cooldown_duration = 5
	-- 修改resistance组件的设置：骨甲防御
	inst:AddComponent("resistance")
	inst.components.resistance:SetShouldResistFn(function()
		return inst.components.amulettraits:ShouldResistFn()
	end)
	inst.components.resistance:SetOnResistDamageFn(function(inst, damage)
		if inst.components.amulettraits then
			inst.components.amulettraits:OnResistDamage(damage)
		end
	end)

	-- 传送开关
	-- local machine = inst:AddComponent("machine")
	-- machine.turnonfn = inst.TryToPlayRecord
	-- machine.turnofffn = inst.StopPlayingRecord

	-- 地面效果
	if not inst:IsInLimbo() then
		ShowGroundFX(inst)
	end

	return inst
end

--- 调取官方的皮肤
-- PREFAB_SKINS["m_amulet"] = PREFAB_SKINS["amulet"]
-- PREFAB_SKINS_IDS["m_amulet"] = PREFAB_SKINS_IDS["amulet"]

return Prefab("m_amulet", fn, assets, prefabs)
