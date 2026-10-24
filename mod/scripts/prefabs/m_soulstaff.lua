local UIAnim = require("widgets/uianim")

local assets = {
	Asset("ANIM", "anim/soulstaff.zip"),
	Asset("ANIM", "anim/swap_soulstaff.zip"),
}

local prefabs = {}

-- 形态轮盘：和 m_shadow_tool 一样，手持时右键物品打开，用来开关「吸血形态」
local SPELLBOOK_RADIUS = 100
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2
local ICON_ATLAS = "images/inventoryimages/soulstaff.xml"
local ICON_IMAGE = "soulstaff.tex"
local ICON_SCALE = 0.6
local ICON_RADIUS = 50

local function ToggleRequest(inst, on)
	SendModRPCToServer(MOD_RPC[modname]["SoulStaffToggle"], inst, on)
end

local SOULSTAFF_SPELLS = {
	{
		label = "开启吸血形态",
		execute = function(inst)
			ToggleRequest(inst, true)
		end,
		atlas = ICON_ATLAS,
		normal = ICON_IMAGE,
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},
	{
		label = "关闭吸血形态",
		execute = function(inst)
			ToggleRequest(inst, false)
		end,
		atlas = ICON_ATLAS,
		normal = ICON_IMAGE,
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},
}

-- 吸血闪光特效
-- 改进后的 sparkle 函数
local function sparkle(inst)
	local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
	if not owner or owner:HasTag("playerghost") then
		return
	end

	-- ... 原有的吸血逻辑保持不变 ...
	local pos = Vector3(owner.Transform:GetWorldPosition())
	local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 10, nil, {
		"INLIMBO",
		"wall",
		"notarget",
		"player",
		"companion",
		"flight",
		"invisible",
		"noattack",
		"hiding",
	})

	for k, v in pairs(ents) do
		if
			v:IsValid()
			and v.components.health
			and owner.components.sanity
			and owner.components.health
			and v.components.combat
			and v.components.combat.target == owner
			and not v:HasAnyTag("structure", "wall", "player")
			and (v:HasTag("m_aligned") or (not v:HasTag("epic") and v:HasAnyTag("shadow_aligned", "lunar_aligned")))
		then
			local sparkle_fx = SpawnPrefab("m_sparkle")
			local pt = v:GetPosition()
			sparkle_fx.Transform:SetPosition(pt.x, pt.y, pt.z)

			v.components.health:DoDelta(-68, nil, (inst.nameoverride or inst.prefab), true, inst, true)

			if owner.components.sanity ~= nil and not owner.components.sanity:IsLunacyMode() then
				owner.components.sanity:DoDelta(1)
			else
				owner.components.sanity:DoDelta(-1)
			end

			if owner.components.health and owner.components.health:IsHurt() then
				owner.components.health:DoDelta(2)
			end
		end
	end
end

-- 暗影拖影：只在「吸血形态」开启时出现
local function staff_do_trail(inst)
	local owner = inst.components.inventoryitem:GetGrandOwner() or inst
	if not owner.entity:IsVisible() then
		return
	end

	local x, y, z = owner.Transform:GetWorldPosition()
	if owner.sg ~= nil and owner.sg:HasStateTag("moving") then
		local theta = -owner.Transform:GetRotation() * DEGREES
		local speed = owner.components.locomotor:GetRunSpeed() * 0.1
		x = x + speed * math.cos(theta)
		z = z + speed * math.sin(theta)
	end

	local mounted = owner.components.rider ~= nil and owner.components.rider:IsRiding()
	local map = TheWorld.Map
	local offset = FindValidPositionByFan(
		math.random() * 2 * PI,
		(mounted and 1 or 0.5) + math.random() * 0.5,
		4,
		function(offset)
			local pt = Vector3(x + offset.x, 0, z + offset.z)
			return map:IsPassableAtPoint(pt:Get())
				and not map:IsPointNearHole(pt)
				and #TheSim:FindEntities(pt.x, 0, pt.z, 0.7, { "shadowtrail" }) <= 0
		end
	)

	if offset ~= nil then
		SpawnPrefab("cane_ancient_fx").Transform:SetPosition(x + offset.x, 0, z + offset.z)
	end
end

local function IsHeld(inst)
	return inst.components.equippable ~= nil and inst.components.equippable:IsEquipped()
end

-- 开启形态：启动吸血任务 + 拖影任务（只在手持时真正跑，放背包里不生效）
local function StartEffects(inst)
	if not IsHeld(inst) then
		return
	end
	local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
	if owner == nil or owner:HasTag("playerghost") then
		return
	end
	if inst.starvetask == nil then
		inst.starvetask = inst:DoPeriodicTask(0.5, sparkle)
	end
	if inst._trailtask == nil then
		inst._trailtask = inst:DoPeriodicTask(6 * FRAMES, staff_do_trail, 2 * FRAMES)
	end
	inst:AddTag("m_soulstaff_active")
end

-- 关闭形态：停掉两个任务，拖影不再生成，场上已有的会自己播完消失
local function StopEffects(inst)
	if inst.starvetask ~= nil then
		inst.starvetask:Cancel()
		inst.starvetask = nil
	end
	if inst._trailtask ~= nil then
		inst._trailtask:Cancel()
		inst._trailtask = nil
	end
	inst:RemoveTag("m_soulstaff_active")
end

-- machine 组件只存「开/关」这个状态，特效的启停交给上面两个函数
local function OnTurnOn(inst)
	StartEffects(inst)
end

local function OnTurnOff(inst)
	StopEffects(inst)
end

-- 对话管理
local function StaffTalk(inst, talk_type)
	local talk_list = STRINGS.M_SOULSTAFF[talk_type]
	if not talk_list or #talk_list == 0 then
		return false
	end

	-- 随机选择一条对话
	local msg_index = math.random(#talk_list)
	inst.components.talker:Chatter(
		"M_SOULSTAFF." .. talk_type,
		msg_index,
		3, -- 显示时长
		false, -- 非强制对话
		CHATPRIORITIES.LOW
	)
end

-- 装备/卸下
local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_soulstaff", "swap_soulstaff")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	-- 已经开启「吸血形态」时，一上手就恢复吸血与拖影
	if inst.components.machine:IsOn() then
		StartEffects(inst)
	end

	-- 装备时随机对话
	if inst.talkCooldown.equip then
		StaffTalk(inst, "EQUIP_TALK")
		inst.talkCooldown.equip = false
		inst:DoTaskInTime(5, function()
			inst.talkCooldown.equip = true
		end)
	end
end

local function onunequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	-- 只停特效，开关状态保留；下次手持会接着开
	StopEffects(inst)
end

-- 攻击相关
local function onattack(inst, attacker, target)
	if not target:IsValid() then
		return
	end

	-- 攻击时随机对话
	if inst.talkCooldown.attack then
		StaffTalk(inst, "ATTACK_TALK")
		inst.talkCooldown.attack = false
		inst:DoTaskInTime(15, function()
			inst.talkCooldown.attack = true
		end)
	end
	-- 检查san值是否低于0.2
	local canUseSpecialAttack = true
	if attacker.components.sanity and attacker.components.sanity:GetPercent() < 0.1 then
		canUseSpecialAttack = false
	end

	-- 元素攻击（仅在san值足够时执行）
	if canUseSpecialAttack then
		if attacker:HasTag("m_ice_charge") then
			inst.components.stafftraits:ice_attack(inst, attacker, target)
		elseif attacker:HasTag("m_fire_charge") then
			inst.components.stafftraits:fire_attack(inst, attacker, target)
		end
	end
end

-- 魔法能力
local function Magicpower(inst, target, pos)
	local caster = inst.components.inventoryitem.owner
	if caster then
		if caster.components.staffsanity then
			caster.components.staffsanity:DoCastingDelta(-TUNING.SANITY_MEDLARGE)
		elseif caster.components.sanity ~= nil then
			caster.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
		end

		if caster:HasTag("m_ice_charge") then
			inst.components.stafftraits:Freeze(inst, target, pos, caster)
		elseif caster:HasTag("m_fire_charge") then
			inst.components.stafftraits:Scorch(inst, target, pos, caster)
		else
			inst.components.stafftraits:Immobilize(inst, target, pos, caster)
		end
	end
end

local function top_showfx_onground(inst)
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

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("soulstaff")
	inst.AnimState:SetBuild("soulstaff")
	inst.AnimState:PlayAnimation("idle", true)

	MakeInventoryFloatable(inst, "med", nil, 0.62)

	inst.entity:SetPristine()

	inst:AddTag("m_item")
	inst:AddTag("sparkle") --闪光的源头
	inst:AddTag("m_soulstaff")
	inst:AddTag("rangedweapon")
	inst:AddTag("weapon")
	inst:AddTag("allow_action_on_impassable") -- 允许水面释放技能
	inst:AddTag("shadowlure") -- 暗影香炉
	inst:AddTag("nosteal")

	-- inst.itemtile_colour = RGB(143, 41, 41)

	local talker = inst:AddComponent("talker")
	talker.fontsize = 35
	talker.font = TALKINGFONT
	talker.name_colour = Vector3(143 / 255, 41 / 255, 41 / 255)
	talker.colour = Vector3(143 / 255, 41 / 255, 41 / 255)
	talker.offset = Vector3(0, -400, 0)
	talker.symbol = "swap_object"
	talker:MakeChatter()
	talker.chaticon = "npcchatflair_stalker"

	-- 形态轮盘（客户端也要有，所以放在 master 判断之前）
	inst:AddComponent("spellbook")
	inst.components.spellbook:SetRadius(SPELLBOOK_RADIUS)
	inst.components.spellbook:SetFocusRadius(SPELLBOOK_FOCUS_RADIUS)
	inst.components.spellbook:SetItems(SOULSTAFF_SPELLS)
	inst.components.spellbook.opensound = "dontstarve/HUD/craft_open"
	inst.components.spellbook.closesound = "dontstarve/HUD/craft_close"

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/soulstaff.xml"
	inst.components.inventoryitem.imagename = "soulstaff"

	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = TUNING.CANE_SPEED_MULT
	-- inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED * 2
	--特定的装备给沃尔特(WALTER)提供理智恢复
	-- inst.components.equippable.is_magic_dapperness = true
	-- inst.components.equippable.restrictedtag = "madeleine"

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(34)
	inst.components.weapon:SetRange(8, 10)
	inst.components.weapon:SetOnAttack(onattack)
	inst.components.weapon:SetProjectile("dark_projectile_fx")
	inst.components.weapon:SetElectric()

	-- 位面伤害
	inst:AddComponent("planardamage")
	inst.components.planardamage:SetBaseDamage(15)

	-- 阵营加伤
	inst:AddComponent("damagetypebonus")
	inst.components.damagetypebonus:AddBonus("shadow_aligned", inst, 1.3)
	inst.components.damagetypebonus:AddBonus("lunar_aligned", inst, 1.3)

	inst:AddComponent("spellcaster")
	inst.components.spellcaster:SetSpellFn(Magicpower)
	inst.components.spellcaster.canuseonpoint = true
	inst.components.spellcaster.canuseonpoint_water = true

	MakeHauntableLaunch(inst)

	inst:AddComponent("stafftraits")

	-- 添加 machine 组件
	inst:AddComponent("machine")
	inst.components.machine.turnonfn = OnTurnOn
	inst.components.machine.turnofffn = OnTurnOff

	-- 初始化对话冷却系统
	inst.talkCooldown = {
		attack = true, -- 攻击对话冷却状态
		equip = true, -- 装备对话冷却状态
	}

	if not inst:IsInLimbo() then
		top_showfx_onground(inst)
	end

	return inst
end

return Prefab("m_soulstaff", fn, assets)
