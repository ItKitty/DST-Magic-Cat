require("prefabutil")
require("modutil")
require("recipe")

local assets = {
	Asset("ANIM", "anim/bat_wings.zip"),
	Asset("ANIM", "anim/swap_bat_wings.zip"),
	Asset("ANIM", "anim/swap_krampus_sack.zip"),
	-- Asset("ANIM", "anim/ui_krampusbag_2x5.zip"),
}

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_body", "bat_wings", "backpack")
	owner.AnimState:OverrideSymbol("swap_body", "swap_bat_wings", "swap_body")

	if inst.components.container ~= nil then
		inst.components.container:Open(owner)
	end
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_body")
	owner.AnimState:ClearOverrideSymbol("backpack")
	inst.components.container:Close(owner)

	if inst.components.container ~= nil then
		inst.components.container:Close(owner)
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

---------------------- 弹性空间升级背包 ------------------------

-- 升级逻辑
local function OnUpgrade(inst, performer, upgraded_from_item)
	-- if not inst.__m_wings_upgraded then
	inst.__m_wings_upgraded = true -- 标记已升级

	-- 修改名称和描述
	if inst.components.named then
		inst.components.named:SetName(STRINGS.NAMES.M_WINGS_UPGRADED)
	end
	inst.components.inspectable.description = STRINGS.CHARACTERS.GENERIC.DESCRIBE.M_WINGS_UPGRADED

	-- 启用无限堆叠
	if inst.components.container then
		inst.components.container:EnableInfiniteStackSize(true)
	end

	-- 特效（可选）
	local fx = SpawnPrefab("chestupgrade_stacksize_fx")
	fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	-- end
end

-- 初始化升级组件
local function AddUpgradeable(inst)
	if not inst.components.named then
		inst:AddComponent("named")
		inst.components.named:SetName(STRINGS.NAMES.M_WINGS) -- 初始名称
	end

	inst:AddComponent("upgradeable")
	inst.components.upgradeable.upgradetype = UPGRADETYPES.CHEST
	inst.components.upgradeable:SetOnUpgradeFn(OnUpgrade)
	inst.components.upgradeable:SetCanUpgradeFn(function(inst, performer)
		if inst.__m_wings_upgraded then
			if performer and performer.components.talker then
				performer.components.talker:Say("已经是最强形态了！")
			end
			return false, "ALREADY_UPGRADED" -- 第二参数可传递拒绝原因
		end
		return true -- 允许升级
	end)

	-- 存档保存
	inst.OnSave = function(inst, data)
		data.upgraded = inst.__m_wings_upgraded -- 保存升级状态
	end

	-- 存档加载
	inst.OnLoad = function(inst, data)
		if data and data.upgraded then
			inst.__m_wings_upgraded = true -- 恢复升级状态
			-- 确保加载后也应用升级效果
			if inst.components.named then
				inst.components.named:SetName(STRINGS.NAMES.M_WINGS_UPGRADED)
			end
			inst.components.inspectable.description = STRINGS.CHARACTERS.GENERIC.DESCRIBE.M_WINGS_UPGRADED
			if inst.components.container then
				inst.components.container:EnableInfiniteStackSize(true)
			end
		end
	end
end

---------------------- 弹性空间升级背包 ------------------------

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("bat_wings")
	inst.AnimState:SetBuild("swap_bat_wings")
	inst.AnimState:PlayAnimation("anim")

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("bat_wings.tex")

	inst.foleysound = "dontstarve/movement/foley/backpack"

	inst:AddTag("m_item")
	inst:AddTag("backpack")
	inst:AddTag("fridge")
	inst:AddTag("nocool")

	MakeInventoryFloatable(inst, "small", 0.1, 0.85)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst)
			inst.replica.container:WidgetSetup("krampus_sack")
		end
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bat_wings.xml"
	inst.components.inventoryitem.imagename = "bat_wings"
	inst.components.inventoryitem.cangoincontainer = false

	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.BACK or EQUIPSLOTS.BODY
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = 1.1

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("krampus_sack")

	inst:AddComponent("preserver")
	inst.components.preserver:SetPerishRateMultiplier(0)

	-- 添加升级组件
	AddUpgradeable(inst)

	MakeHauntableLaunch(inst)

	-- 地面效果
	if not inst:IsInLimbo() then
		ShowGroundFX(inst)
	end

	return inst
end

return Prefab("m_wings", fn, assets, prefabs)
