local assets = {
	Asset("ANIM", "anim/ancestorsrelics.zip"),
}

local prefabs = {}

--------------------------------------------------------------------------
-- 护符召唤物：带对应材料时召唤，脱下护符就消失
--   龙鳞（dragon_scales）      -> 鹦鹉 m_polly
--   巨鹿眼球（deerclops_eyeball）-> 盐狗 m_salty_dog
--------------------------------------------------------------------------
local SUMMONED_PETS = {
	dragon_scales = "m_polly",
	deerclops_eyeball = "m_salty_dog",
}

local function RemoveSummonedPets(inst)
	if inst.m_summoned_pets == nil then
		return
	end

	for _, pet in pairs(inst.m_summoned_pets) do
		if pet:IsValid() then
			if pet.components.inventory ~= nil then
				pet.components.inventory:DropEverything()
			end
			-- 各自播自己的退场（鹦鹉飞走 / 盐狗水花），没有就用直接删除兜底
			if pet.PlaySummonDespawn ~= nil then
				pet:PlaySummonDespawn()
			else
				pet:Remove()
			end
		end
	end

	inst.m_summoned_pets = nil
end

local function SpawnSummonedPets(inst, owner)
	if owner == nil or not owner:IsValid() then
		return
	end

	local traits = inst.components.amulettraits
	if traits == nil then
		return
	end

	inst.m_summoned_pets = inst.m_summoned_pets or {}

	for skill, prefab in pairs(SUMMONED_PETS) do
		local pet = inst.m_summoned_pets[prefab]
		if traits:HasSkill(skill) and (pet == nil or not pet:IsValid()) then
			pet = SpawnPrefab(prefab)
			if pet ~= nil then
				-- 出生点对照原版 hats.lua:2550-2566 的 getpollyspawnlocation：
				-- 主人周围 5 格内随机找个能站的点；鸟类的 y 是 15（从空中俯冲下来）
				local pt = owner:GetPosition()
				local offset = nil
				local count = 0
				while offset == nil and count < 12 do
					offset = FindWalkableOffset(pt, math.random() * TWOPI, math.random() * 5, 12, false, false, nil, false, true)
					count = count + 1
				end

				local x = pt.x + (offset ~= nil and offset.x or 0)
				local z = pt.z + (offset ~= nil and offset.z or 0)
				local y = pet:HasTag("bird") and 15 or 0

				pet.Transform:SetPosition(x, y, z)
				if pet.components.follower ~= nil then
					pet.components.follower:SetLeader(owner)
				end

				-- 登场表现（鹦鹉落下 / 盐狗水花）
				if pet.PlaySummonAppear ~= nil then
					pet:PlaySummonAppear()
				end

				inst.m_summoned_pets[prefab] = pet
				inst:ListenForEvent("onremove", function()
					if inst.m_summoned_pets ~= nil then
						inst.m_summoned_pets[prefab] = nil
					end
				end, pet)
			end
		end
	end
end


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
	-- 召唤物（龙鳞 -> 鹦鹉，巨鹿眼球 -> 盐狗）
	SpawnSummonedPets(inst, owner)
end

local function onunequip(inst, owner)
	-- 先收回召唤物，避免它们留在世界上
	RemoveSummonedPets(inst)

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

	-- 护符本身被移除/销毁时，一并收回召唤物
	inst.OnRemoveEntity = function(inst2)
		RemoveSummonedPets(inst2)
	end

	return inst
end

--- 调取官方的皮肤
-- PREFAB_SKINS["m_amulet"] = PREFAB_SKINS["amulet"]
-- PREFAB_SKINS_IDS["m_amulet"] = PREFAB_SKINS_IDS["amulet"]

return Prefab("m_amulet", fn, assets, prefabs)
