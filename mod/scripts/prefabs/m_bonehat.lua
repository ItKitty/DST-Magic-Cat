local assets = {
	Asset("ANIM", "anim/hat_skeleton.zip"),
}

local prefabs = {}
for j = 0, 3, 3 do
	for i = 1, 3 do
		table.insert(prefabs, "shadow_shield" .. tostring(j + i))
	end
end

local function OnTakeDamage(inst, amount)
	-- 确保玩家是装备者
	local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner

	if owner ~= nil and owner.components.sanity ~= nil then
		owner.components.sanity:DoDelta(-amount * TUNING.ARMOR_RUINSHAT_DMG_AS_SANITY, false)
	end
end

-- 装备/卸下效果
local function OnEquip(inst, owner)
	-- 处理皮肤和动画
	local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		owner:PushEvent("equipskinneditem", inst:GetSkinName())
		owner.AnimState:OverrideItemSkinSymbol("swap_hat", skin_build, "swap_hat", inst.GUID, "hat_skeleton")
	else
		owner.AnimState:OverrideSymbol("swap_hat", "hat_skeleton", "swap_hat")
	end

	-- 设置动画状态
	owner.AnimState:Show("HAT")
	owner.AnimState:Show("HAIR_HAT")
	owner.AnimState:Hide("HAIR_NOHAT")
	owner.AnimState:Hide("HAIR")

	if owner:HasTag("player") then
		owner.AnimState:Hide("HEAD")
		owner.AnimState:Show("HEAD_HAT")
	end

	local hattraits = inst.components.hattraits
	-- 反击
	-- hattraits:SetupRetaliation(inst, owner)
	-- 启迪特效
	-- hattraits:alterguardian_onequip(inst, owner)
end

local function OnUnequip(inst, owner)
	-- 处理皮肤和动画
	local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		owner:PushEvent("unequipskinneditem", inst:GetSkinName())
	end

	owner.AnimState:ClearOverrideSymbol("swap_hat")
	owner.AnimState:Hide("HAT")
	owner.AnimState:Hide("HAIR_HAT")
	owner.AnimState:Show("HAIR_NOHAT")
	owner.AnimState:Show("HAIR")

	if owner:HasTag("player") then
		owner.AnimState:Show("HEAD")
		owner.AnimState:Hide("HEAD_HAT")
	end

	local hattraits = inst.components.hattraits
	-- 反击
	-- hattraits:RemoveRetaliation(inst, owner)
	-- 启迪特效
	-- hattraits:alterguardian_onunequip(inst, owner)
end

-- 特殊伤害处理
local function OnHitByDebris(inst, damage)
	if inst.components.armor ~= nil then
		inst.components.armor:TakeDamage(damage)
	end
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

------------------- 暗影箱 ---------------------------------------
local function top_onclose(tophatcontainer)
	tophatcontainer.tophat.components.magiciantool:StopUsing()
end

local function top_onstartusing(inst, doer)
	if inst.container == nil then
		inst.container = SpawnPrefab("tophat_container")
		inst.container.Network:SetClassifiedTarget(doer)
		inst.container.tophat = inst
		inst.container.components.container_proxy:SetOnCloseFn(top_onclose)
	end
	doer:PushEvent("opencontainer", { container = inst.container.components.container_proxy:GetMaster() })
	inst.container.components.container_proxy:Open(doer)
	if doer.SoundEmitter ~= nil and not doer.SoundEmitter:PlayingSound("magician_tophat_loop") then
		doer.SoundEmitter:PlaySound("maxwell_rework/shadow_magic/storage_void_LP", "magician_tophat_loop")
	end
end

local function top_onstopusing(inst, doer)
	if inst.container ~= nil then
		inst.container.components.container_proxy:Close(doer)
		doer:PushEvent("closecontainer", { container = inst.container.components.container_proxy:GetMaster() })
		inst.container:Remove()
		inst.container = nil
	end
	if doer.SoundEmitter ~= nil then
		doer.SoundEmitter:KillSound("magician_tophat_loop")
	end
end

------------------- 暗影箱 ---------------------------------------

local function CreateShadowboneCrown()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst:AddTag("hat")
	inst:AddTag("m_item")
	-- 抗击飞效果
	inst:AddTag("heavyarmor")
	-- 硬质盔甲
	inst:AddTag("hardarmor")
	-- 添加免疫瘴气
	inst:AddTag("miasmaimmune")
	-- 添加特殊效果 酸雨免疫
	inst:AddTag("acidrainimmune")
	-- 天体
	inst:AddTag("gestaltprotection")
	-- 暗影
	inst:AddTag("shadowdominance")
	-- 不会被偷
	inst:AddTag("nosteal")
	-- 隐藏百分比
	inst:AddTag("hide_percentage")

	inst.AnimState:SetBank("skeletonhat")
	inst.AnimState:SetBuild("hat_skeleton")
	inst.AnimState:PlayAnimation("anim")

	MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	-- 基础组件
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:ChangeImageName("skeletonhat")

	inst:AddComponent("inspectable")

	-- 装备系统
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(OnEquip)
	inst.components.equippable:SetOnUnequip(OnUnequip)
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	-- inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED * 2
	--特定的装备给沃尔特(WALTER)提供理智恢复
	-- inst.components.equippable.is_magic_dapperness = true
	-- inst.components.equippable.restrictedtag = "madeleine"

	MakeHauntableLaunch(inst)

	-- 防御系统
	inst:AddComponent("armor")
	inst.components.armor:InitCondition(100, 0.9) -- 1500耐久，90%吸收
	inst.components.armor.ontakedamage = OnTakeDamage
	-- 不消耗耐久
	inst.components.armor.indestructible = true

	-- 位面防御
	inst:AddComponent("planardefense")
	inst.components.planardefense:SetBaseDefense(10)

	-- 阵营减伤
	inst:AddComponent("damagetyperesist")
	inst.components.damagetyperesist:AddResist("shadow_aligned", inst, 0.7)
	inst.components.damagetyperesist:AddResist("lunar_aligned", inst, 0.7)

	-- 特殊伤害抵抗 地震月雹
	inst:AddComponent("resistance")
	inst.components.resistance:AddResistance("quakedebris")
	inst.components.resistance:AddResistance("lunarhaildebris")
	inst.components.resistance:SetOnResistDamageFn(OnHitByDebris)

	-- 暗影箱
	inst:AddComponent("magiciantool")
	inst.components.magiciantool:SetOnStartUsingFn(top_onstartusing)
	inst.components.magiciantool:SetOnStopUsingFn(top_onstopusing)

	inst:AddComponent("hattraits")
	inst.components.hattraits.inst = inst -- 确保inst被正确设置

	-- 地面效果
	if not inst:IsInLimbo() then
		ShowGroundFX(inst)
	end

	return inst
end

-- 复用官方皮肤
PREFAB_SKINS["m_bonehat"] = PREFAB_SKINS["skeletonhat"]
PREFAB_SKINS_IDS["m_bonehat"] = PREFAB_SKINS_IDS["skeletonhat"]

return Prefab("m_bonehat", CreateShadowboneCrown, assets)
