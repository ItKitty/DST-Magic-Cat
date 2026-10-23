local assets = {
	Asset("ANIM", "anim/axe.zip"),
	Asset("ANIM", "anim/swap_axe.zip"),
	Asset("ANIM", "anim/pickaxe.zip"),
	Asset("ANIM", "anim/swap_pickaxe.zip"),
	Asset("ANIM", "anim/shovel.zip"),
	Asset("ANIM", "anim/swap_shovel.zip"),
	Asset("ANIM", "anim/hammer.zip"),
	Asset("ANIM", "anim/swap_hammer.zip"),
	Asset("ANIM", "anim/bugnet.zip"),
	Asset("ANIM", "anim/swap_bugnet.zip"),
	Asset("ANIM", "anim/quagmire_hoe.zip"),
	Asset("ANIM", "anim/swap_goldenhoe.zip"),
	Asset("ANIM", "anim/pitchfork.zip"),
	Asset("ANIM", "anim/swap_pitchfork.zip"),
	Asset("ANIM", "anim/oar.zip"),
	Asset("ANIM", "anim/swap_oar.zip"),
	Asset("ANIM", "anim/trident.zip"),
	Asset("ANIM", "anim/swap_trident.zip"),
	Asset("INV_IMAGE", "trident"),
	Asset("ANIM", "anim/cane.zip"),
	Asset("ANIM", "anim/swap_cane.zip"),
	Asset("ANIM", "anim/staffs.zip"),
	Asset("ANIM", "anim/swap_staffs.zip"),

	Asset("ANIM", "anim/floating_items.zip"),
}

local function onblink(staff, pos, caster)
	if caster then
		if caster.components.staffsanity then
			caster.components.staffsanity:DoCastingDelta(-TUNING.SANITY_MED)
		elseif caster.components.sanity ~= nil then
			caster.components.sanity:DoDelta(-TUNING.SANITY_MED)
		end
	end

	staff.components.finiteuses:Use(1)
end

local TOOL_DATA = {
	{ --斧头
		id = 1, --唯一标识,方便区分
		str = STRINGS.M_SHADOW_TOOL_UI.AXE,
		action = ACTIONS.CHOP, --动作
		image = "medal_shadow_axe", --物品栏贴图名
		bank = "axe",
		build = "axe",
		anim = "idle",
		swapbuild = "swap_axe", --手持build
		swapsymbol = "swap_axe", --手持symbol
		showimg = "axe.tex", --选项贴图
	},
	{ --鹤嘴锄
		id = 2,
		str = STRINGS.M_SHADOW_TOOL_UI.PICKAXE,
		action = ACTIONS.MINE,
		image = "medal_shadow_pickaxe",
		bank = "pickaxe",
		build = "pickaxe",
		anim = "idle",
		swapbuild = "swap_pickaxe",
		swapsymbol = "swap_pickaxe",
		showimg = "pickaxe.tex",
	},
	{ --铲子
		id = 3,
		str = STRINGS.M_SHADOW_TOOL_UI.SHOVEL,
		action = ACTIONS.DIG,
		image = "medal_shadow_shovel",
		bank = "shovel",
		build = "shovel",
		anim = "idle",
		swapbuild = "swap_shovel",
		swapsymbol = "swap_shovel",
		showimg = "shovel.tex",
	},
	{ --锤子
		id = 4,
		str = STRINGS.M_SHADOW_TOOL_UI.HAMMER,
		action = ACTIONS.HAMMER,
		image = "medal_shadow_hammer",
		bank = "hammer",
		build = "swap_hammer",
		anim = "idle",
		swapbuild = "swap_hammer",
		swapsymbol = "swap_hammer",
		showimg = "hammer.tex",
	},
	{ --捕虫网
		id = 5,
		str = STRINGS.M_SHADOW_TOOL_UI.BUGNET,
		action = ACTIONS.NET,
		image = "medal_shadow_bugnet",
		bank = "bugnet",
		build = "swap_bugnet",
		anim = "idle",
		swapbuild = "swap_bugnet",
		swapsymbol = "swap_bugnet",
		showimg = "bugnet.tex",
	},
	{ --锄头
		id = 6,
		str = STRINGS.M_SHADOW_TOOL_UI.FARM_HOE,
		action = ACTIONS.TILL,
		actiontype = 2,
		image = "medal_shadow_farm_hoe",
		bank = "quagmire_hoe",
		build = "quagmire_hoe",
		anim = "idle",
		swapbuild = "quagmire_hoe",
		swapsymbol = "swap_quagmire_hoe",
		showimg = "farm_hoe.tex",
		fn = function(inst)
			inst:AddInherentAction(ACTIONS.TILL)
			if inst.components.farmtiller == nil then
				inst:AddComponent("farmtiller")
			end
		end,
		clearfn = function(inst, newaction) --清除工具信息
			--清除锄头动作
			if newaction ~= ACTIONS.TILL and inst:CanDoAction(ACTIONS.TILL) then
				inst:RemoveInherentAction(ACTIONS.TILL)
				if inst.components.farmtiller ~= nil then
					inst:RemoveComponent("farmtiller")
				end
			end
		end,
	},
	{ --干草叉
		id = 7,
		str = STRINGS.M_SHADOW_TOOL_UI.PITCHFORK,
		action = ACTIONS.TERRAFORM,
		actiontype = 2,
		image = "medal_shadow_pitchfork",
		bank = "pitchfork",
		build = "pitchfork",
		anim = "idle",
		swapbuild = "swap_pitchfork",
		swapsymbol = "swap_pitchfork",
		showimg = "pitchfork.tex",
		fn = function(inst)
			inst:AddInherentAction(ACTIONS.TERRAFORM)
			if inst.components.terraformer == nil then
				inst:AddComponent("terraformer")
			end
		end,
		clearfn = function(inst, newaction) --清除工具信息
			--清除草叉动作
			if newaction ~= ACTIONS.TERRAFORM and inst:CanDoAction(ACTIONS.TERRAFORM) then
				inst:RemoveInherentAction(ACTIONS.TERRAFORM)
				if inst.components.terraformer ~= nil then
					inst:RemoveComponent("terraformer")
				end
			end
		end,
	},
	{ --桨
		id = 8,
		str = STRINGS.M_SHADOW_TOOL_UI.OAR,
		action = ACTIONS.ROW,
		actiontype = 2,
		image = "medal_shadow_oar",
		bank = "oar",
		build = "oar",
		anim = "idle",
		swapbuild = "swap_oar",
		swapsymbol = "swap_oar",
		showimg = "oar.tex",
		fn = function(inst)
			inst:AddTag("allow_action_on_impassable")
			if inst.components.oar == nil then
				inst:AddComponent("oar")
				inst.components.oar.force = 0.8
				inst.components.oar.max_velocity = 5
			end
			if inst.components.finiteuses then
				inst.components.finiteuses:SetConsumption(ACTIONS.ROW_CONTROLLER, 1)
				inst.components.finiteuses:SetConsumption(ACTIONS.ROW_FAIL, 2)
			end
		end,
		clearfn = function(inst, newaction) --清除工具信息
			if newaction ~= ACTIONS.ROW then
				inst:RemoveTag("allow_action_on_impassable")
				if inst.components.oar ~= nil then
					inst:RemoveComponent("oar")
				end
			end
		end,
	},
	{ --懒人魔杖
		id = 10,
		str = STRINGS.M_SHADOW_TOOL_UI.ORANGESTAFF,
		action = ACTIONS.BLINK,
		actiontype = 2,
		image = "medal_shadow_tool",
		bank = "staffs",
		build = "staffs",
		anim = "orangestaffs",
		swapbuild = "swap_staffs",
		swapsymbol = "swap_orangestaff",
		showimg = "multi_use.tex",
		fn = function(inst)
			inst:AddComponent("blinkstaff")
			inst.components.blinkstaff:SetFX("sand_puff_large_front", "sand_puff_large_back")
			inst.components.blinkstaff.onblinkfn = onblink
		end,
		clearfn = function(inst, newaction) --清除工具信息
			if newaction ~= ACTIONS.BLINK then
				if inst.components.blinkstaff ~= nil then
					inst:RemoveComponent("blinkstaff")
				end
			end
		end,
	},
}

--五合一工具
table.insert(TOOL_DATA, {
	id = 9,
	str = STRINGS.M_SHADOW_TOOL_UI.MULTI_USE,
	action = ACTIONS.CHOP,
	image = "medal_shadow_axe",
	bank = "axe",
	build = "axe",
	anim = "idle",
	swapbuild = "swap_axe",
	swapsymbol = "swap_axe",
	showimg = "multi_use.tex",
	is_multi_tool = true, --五合一标记
	fn = function(inst)
		--同时拥有多种功能
		for i = 1, 5 do
			local tool_info = TOOL_DATA[i]
			if inst.components.tool then
				inst.components.tool:SetAction(tool_info.action, 1)
			end
			if inst.components.finiteuses then
				inst.components.finiteuses:SetConsumption(tool_info.action, 1)
			end
			if tool_info.fn then
				tool_info.fn(inst)
			end
		end
	end,
	equipfn = function(inst, owner)
		owner.m_multi_use_tool = true --多用工具
	end,
	unequipfn = function(inst, owner)
		owner.m_multi_use_tool = nil --多用工具
	end,
})

local TOOL_CLEAR_FNS = {} --特殊工具形态清理列表

local ICON_SCALE = 0.6
local ICON_RADIUS = 50
local SPELLBOOK_RADIUS = 100
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2
local SPELLS = {}

for i, v in ipairs(TOOL_DATA) do
	--加入动作轮盘
	table.insert(SPELLS, {
		label = v.str,
		execute = function(inst)
			SendModRPCToServer(MOD_RPC.functional_medal.ShadowToolSwitch, inst, i)
		end,
		atlas = "images/inventoryimages/medal_shadow_tool_icons.xml",
		normal = v.showimg,
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	})
	--加入工具形态清理列表
	if v.clearfn ~= nil then
		table.insert(TOOL_CLEAR_FNS, v.clearfn)
	end
end

--是否为五合一工具
local function IsMultiTool(inst)
	return inst.tool_idx and TOOL_DATA[inst.tool_idx] and TOOL_DATA[inst.tool_idx].is_multi_tool
end

--重置工具状态(inst)
local function ResetToolAction(inst)
	local tool_info = TOOL_DATA[inst.tool_idx] or {}
	local act_type = tool_info.actiontype or 1 --1工具、2特殊工具
	local newaction = tool_info.action or ACTIONS.CHOP

	--清除特殊工具状态
	for _, v in ipairs(TOOL_CLEAR_FNS) do
		v(inst, newaction)
	end

	--重新绑定动作
	if inst.components.tool then
		for k, v in pairs(inst.components.tool.actions) do
			inst:RemoveTag(k.id .. "_tool")
		end
		inst.components.tool.actions = {}
		if act_type == 1 then
			inst.components.tool:SetAction(newaction, 1)
		end
	end

	--重置动作消耗
	if inst.components.finiteuses then
		inst.components.finiteuses.consumption = {}
		inst.components.finiteuses:SetConsumption(newaction, 1)
	end

	if tool_info.fn then
		tool_info.fn(inst)
	end
	--已经处于装备状态需要执行equipfn方法
	if tool_info.equipfn and inst.components.equippable and inst.components.equippable:IsEquipped() then
		local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
		if owner ~= nil then
			tool_info.equipfn(inst, owner)
		end
	end
end

--重置工具场景动画
local function ResetToolAnim(inst, idx)
	idx = idx or inst.tool_idx
	local tool_info = TOOL_DATA[idx] or {}
	if inst.tool_id == tool_info.id then
		return
	end --重复ID就没必要切贴图了

	inst.tool_id = tool_info.id --记录下ID防止重复切换贴图
	inst.components.inventoryitem:ChangeImageName(tool_info.image or "axe")
	inst.AnimState:SetBank(tool_info.bank or "axe")
	inst.AnimState:SetBuild(tool_info.build or "axe")
	inst.AnimState:PlayAnimation(tool_info.anim or "idle")
	inst.AnimState:SetMultColour(0, 0, 0, 0.5)
	if inst.components.equippable and inst.components.equippable:IsEquipped() then
		local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
		if owner ~= nil and owner.AnimState ~= nil then
			local spos = owner and owner:GetPosition()
			if spos ~= nil then
				local fx = SpawnPrefab("explode_reskin")
				if fx then
					fx.Transform:SetPosition(spos.x, spos.y, spos.z)
				end
			end
			owner.AnimState:SetSymbolMultColour(
				"swap_object",
				inst.symbol_mult[1] or 1,
				inst.symbol_mult[2] or 1,
				inst.symbol_mult[3] or 1,
				inst.symbol_mult[4] or 1
			)
			owner.AnimState:OverrideSymbol(
				"swap_object",
				tool_info.swapbuild or "swap_axe",
				tool_info.swapsymbol or "swap_axe"
			)
			owner.AnimState:SetSymbolMultColour("swap_object", 0, 0, 0, 0.5)
		end
	end
end

--移除上一种工具的特殊效果
local function DoOldUnEquipFn(inst)
	local tool_info = TOOL_DATA[inst.tool_idx] or {}
	--已经处于装备状态需要执行unequipfn方法
	if tool_info.unequipfn and inst.components.equippable and inst.components.equippable:IsEquipped() then
		local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
		if owner ~= nil then
			tool_info.unequipfn(inst, owner)
		end
	end
end

--切换工具
local function SwitchTool(inst, idx)
	if idx == inst.tool_idx then
		return
	end --编号重复了就不用切换了
	if idx and TOOL_DATA[idx] then
		DoOldUnEquipFn(inst) --移除上一种装备的效果,要在索引改变之前执行
		inst.tool_idx = idx
		ResetToolAnim(inst)
		ResetToolAction(inst)
	end
end

--装备
local function onequip(inst, owner)
	local tool_info = TOOL_DATA[inst.tool_idx] or {}
	--五合一形态
	if IsMultiTool(inst) then
		local idx = inst.tool_id and (inst.tool_id % 10) or 1 --默认显示斧头形态

		local symbol_info = TOOL_DATA[idx] or {}
		owner.AnimState:OverrideSymbol(
			"swap_object",
			symbol_info.swapbuild or "swap_axe",
			symbol_info.swapsymbol or "swap_axe"
		)
	else
		owner.AnimState:OverrideSymbol(
			"swap_object",
			tool_info.swapbuild or "swap_axe",
			tool_info.swapsymbol or "swap_axe"
		)
	end
	owner.AnimState:SetSymbolMultColour("swap_object", 0, 0, 0, 0.5)
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
	if tool_info.equipfn then
		tool_info.equipfn(inst, owner)
	end
end
--卸下
local function onunequip(inst, owner)
	local tool_info = TOOL_DATA[inst.tool_idx] or {}
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")
	owner.AnimState:SetSymbolMultColour(
		"swap_object",
		inst.symbol_mult[1] or 1,
		inst.symbol_mult[2] or 1,
		inst.symbol_mult[3] or 1,
		inst.symbol_mult[4] or 1
	)
	if tool_info.unequipfn then
		tool_info.unequipfn(inst, owner)
	end
end

--添加可装备组件相关内容
local function SetupEquippable(inst)
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.CANE_SPEED_MULT
end

local function onSaveFn(inst, data)
	data.tool_idx = inst.tool_idx
end

local function onLoadFn(inst, data)
	if data then
		inst.tool_idx = data.tool_idx or 1
	end
	ResetToolAnim(inst)
	ResetToolAction(inst)
end

local function ShouldAcceptItem(inst, item)
	if item.prefab == "nightmarefuel" then
		return true
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == "nightmarefuel" then
		inst.components.finiteuses:Repair(0.2 * inst.components.finiteuses.total)
		inst.SoundEmitter:PlaySound("dontstarve/common/nightmareAddFuel")
	end
end

local function OnRefuseItem(inst, giver, item)
	if giver and giver.components.talker then
		giver.components.talker:Say("它不要这个")
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

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("axe")
	inst.AnimState:SetBuild("axe")
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:SetMultColour(0, 0, 0, 0.5)

	inst:AddTag("sharp")
	inst:AddTag("weapon")
	inst:AddTag("tool")
	inst:AddTag("m_shadow_tool")
	inst:AddTag("nosteal")
	inst:AddTag("m_item")

	MakeInventoryFloatable(inst, "small", 0.05, { 1.2, 0.75, 1.2 })

	inst:AddComponent("spellbook")
	inst.components.spellbook:SetRadius(SPELLBOOK_RADIUS)
	inst.components.spellbook:SetFocusRadius(SPELLBOOK_FOCUS_RADIUS)
	inst.components.spellbook:SetItems(SPELLS)
	inst.components.spellbook.opensound = "dontstarve/HUD/craft_open"
	inst.components.spellbook.closesound = "dontstarve/HUD/craft_close"

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.tool_idx = 1 --状态索引
	inst.symbol_mult = { 1, 1, 1, 1 } --颜色通道数据

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "medal_shadow_axe"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/medal_shadow_tool.xml"

	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.CHOP, 1)

	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(500)
	inst.components.finiteuses:SetUses(500)
	inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1) --伐木

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(TUNING.AXE_DAMAGE)

	inst:AddComponent("inspectable")

	MakeHauntableLaunch(inst)

	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	inst.components.trader.acceptnontradable = true

	inst.SwitchTool = SwitchTool
	inst.ResetToolAnim = ResetToolAnim

	inst.OnSave = onSaveFn
	inst.OnLoad = onLoadFn

	SetupEquippable(inst)

	-- 地面效果
	if not inst:IsInLimbo() then
		ShowGroundFX(inst)
	end

	return inst
end

return Prefab("m_shadow_tool", fn, assets)
