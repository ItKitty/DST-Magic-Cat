local UIAnim = require("widgets/uianim")

local assets = {
	Asset("ANIM", "anim/soulstaff.zip"),
	Asset("ANIM", "anim/swap_soulstaff.zip"),
}

local prefabs = {
	"fx_soulstaff_corrupt", -- 腐化光效
	"queen_torchlight", -- 形态关闭时的照明
}

-- 轮盘的半径/图标；具体条目（以及发 RPC 的闭包）放在 systems/soulstaff_toggle.lua，
-- 因为 prefab 文件跑在全局环境里，既没有 modname 也没有 GLOBAL（strict.lua 会报错）。
local SPELLBOOK_RADIUS = 100
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2

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

-- 这两个函数在下面才定义（腐化光效那段），这里先声明，方便 StartEffects 里调用
local SpawnCorruptFX, RemoveCorruptFX

-- 常驻拖影：只要手持就有
local function StartTrail(inst)
	if inst._trailtask == nil then
		inst._trailtask = inst:DoPeriodicTask(6 * FRAMES, staff_do_trail, 2 * FRAMES)
	end
end

local function StopTrail(inst)
	if inst._trailtask ~= nil then
		inst._trailtask:Cancel()
		inst._trailtask = nil
	end
end

-- 开启形态：吸血任务 + 腐化光效（只在手持时真正跑，放背包里不生效）
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
	SpawnCorruptFX(inst, owner)
	inst:AddTag("m_soulstaff_active")
end

-- 关闭形态：停掉吸血任务和腐化光效
local function StopEffects(inst)
	if inst.starvetask ~= nil then
		inst.starvetask:Cancel()
		inst.starvetask = nil
	end
	RemoveCorruptFX(inst)
	inst:RemoveTag("m_soulstaff_active")
end

-- 形态关闭时的「驱散暗影」：靠的是原版 queen_torchlight 这个实体本身。
-- 暗影生物的大脑里会调用 FindClosestQueenTorch，它遍历的是 queen_torchlight 的全局列表 TORCHES，
-- 只要场上有这盏灯（半径 16 内），它们就会按「10 格开始逃、15 格才停」的规则退避。
-- 所以这里保留实体、但关掉它的灯光和音效——只要驱散功能，不要照明。
local function RemoveTorchLight(inst)
	if inst._torchlight ~= nil then
		if inst._torchlight:IsValid() then
			inst._torchlight:Remove()
		end
		inst._torchlight = nil
	end
end

local function SpawnRepelSource(inst, parent)
	local light = SpawnPrefab("queen_torchlight")
	if light == nil then
		return nil
	end
	light.entity:SetParent(parent)
	-- 关掉照明
	if light.Light ~= nil then
		light.Light:Enable(false)
	end
	-- 关掉火把的循环音效
	if light.SoundEmitter ~= nil then
		light.SoundEmitter:KillSound("loop")
	end
	return light
end

-- 手持、或者掉在地上，都挂驱散源；放在背包/容器里不生效（和原版火把一致）
local function UpdateTorchLight(inst)
	if inst.soulstaff_on then
		RemoveTorchLight(inst)
		return
	end

	local inventoryitem = inst.components.inventoryitem
	local held = IsHeld(inst)
	local owner = held and inventoryitem and inventoryitem:GetGrandOwner() or nil

	local parent
	if owner ~= nil then
		parent = owner.entity
	elseif inventoryitem ~= nil and inventoryitem.owner == nil and not inst:IsInLimbo() then
		-- 没有主人 = 在地上
		parent = inst.entity
	end

	if parent == nil then
		RemoveTorchLight(inst)
		return
	end

	-- 已经挂在正确的目标上就不动
	if inst._torchlight ~= nil and inst._torchlight:IsValid() then
		if inst._torchlight.entity:GetParent() == parent then
			return
		end
		RemoveTorchLight(inst)
	end

	inst._torchlight = SpawnRepelSource(inst, parent)
end

-- 物品进出背包/地面时，重新评估驱散源挂在哪
local function OnInventoryStateChanged(inst)
	inst:DoTaskInTime(0, UpdateTorchLight)
end

-- 兜底：0.5 秒查一次，防止「丢地上 / 被强制脱手」时拖影和光效残留
local function StartEquipWatch(inst)
	if inst._equipwatch ~= nil then
		return
	end
	inst._equipwatch = inst:DoPeriodicTask(0.5, function()
		if IsHeld(inst) then
			return
		end
		StopTrail(inst)
		StopEffects(inst)
		-- 如果正好被丢在地上，这里会把它挂到物品身上继续驱散
		UpdateTorchLight(inst)
		if inst._equipwatch ~= nil then
			inst._equipwatch:Cancel()
			inst._equipwatch = nil
		end
	end)
end

-- 开关状态：只用一个字段存，不再借 machine 组件
local function SetActive(inst, on)
	on = on and true or false
	if (inst.soulstaff_on and true or false) == on then
		return false
	end
	inst.soulstaff_on = on
	if on then
		StartEffects(inst)
	else
		StopEffects(inst)
	end
	-- 形态关闭时点灯，开启时收掉
	UpdateTorchLight(inst)
	return true
end

-- 存档：只记一个开/关标记
local function onsave(inst, data)
	if inst.soulstaff_on then
		data.soulstaff_on = true
	end
end

local function onload(inst, data)
	if data ~= nil and data.soulstaff_on then
		inst.soulstaff_on = true
		-- 读档时多半还没装备，StartEffects 会自己判断；装备时 onequip 会再补一次
		StartEffects(inst)
	end
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

-- 腐化光效（king_cane 的 corrupt_level3，单独做的 FX prefab，不带武器贴图）
-- 只在「吸血形态」开启时出现；默认值按实测调好的位置
-- 游戏内仍可用控制台实时调：M_SOULSTAFF_CORRUPT(缩放, x, y, z)
-- 偏移量单位是 1/100 世界单位；y 正数往下、负数往上
local CORRUPT_FX_DEFAULT = {
	scale = 0.75,
	x = 0,
	y = -110,
	z = 0,
}

local function GetCorruptTuning()
	-- rawget 绕过 strict：这个全局由 systems/soulstaff_toggle.lua 创建
	local tuning = rawget(_G, "M_SOULSTAFF_CORRUPT_TUNING")
	if type(tuning) == "table" then
		return tuning
	end
	return CORRUPT_FX_DEFAULT
end

-- 注意：这两个函数在上面用 local 声明过，这里是赋值给那两个局部变量
function RemoveCorruptFX(inst)
	if inst._corruptfx ~= nil then
		if inst._corruptfx:IsValid() then
			inst._corruptfx:Remove()
		end
		inst._corruptfx = nil
	end
end

function SpawnCorruptFX(inst, owner)
	RemoveCorruptFX(inst)

	local fx = SpawnPrefab("fx_soulstaff_corrupt")
	if fx == nil then
		return
	end

	local tuning = GetCorruptTuning()

	fx.entity:SetParent(owner.entity)
	fx.Follower:FollowSymbol(owner.GUID, "swap_object", tuning.x, tuning.y, tuning.z)
	fx.Transform:SetScale(tuning.scale, tuning.scale, tuning.scale)

	inst._corruptfx = fx
end

-- 控制台调完参数后重新生成一次，不用退出重进
local function RefreshCorruptFX(inst)
	if not inst.soulstaff_on then
		RemoveCorruptFX(inst)
		return
	end
	local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
	if owner ~= nil then
		SpawnCorruptFX(inst, owner)
	end
end

-- 装备/卸下
local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_soulstaff", "swap_soulstaff")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	-- 常驻拖影（只要手持就有）
	StartTrail(inst)
	StartEquipWatch(inst)

	-- 已经开启「吸血形态」时，一上手就恢复吸血与腐化光效
	if inst.soulstaff_on then
		StartEffects(inst)
	end

	-- 形态关闭时给照明（queen_torch 的灯）
	UpdateTorchLight(inst)

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

	-- 停掉常驻拖影
	StopTrail(inst)

	-- 收掉照明
	RemoveTorchLight(inst)

	-- 只停特效，开关状态保留；下次手持会接着开（StopEffects 里也会收掉腐化光效）
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

	-- 形态轮盘：条目由 systems/soulstaff_toggle.lua 通过 AddPrefabPostInit 塞进来
	inst:AddComponent("spellbook")
	inst.components.spellbook:SetRadius(SPELLBOOK_RADIUS)
	inst.components.spellbook:SetFocusRadius(SPELLBOOK_FOCUS_RADIUS)
	inst.components.spellbook.opensound = "dontstarve/HUD/craft_open"
	inst.components.spellbook.closesound = "dontstarve/HUD/craft_close"
	-- 只有手持（装备）时才允许打开轮盘，放在背包里右键不会出现这个选项
	inst.components.spellbook:SetCanUseFn(function(item, user)
		local equippable = item.replica.equippable
		return equippable ~= nil and equippable:IsEquipped()
	end)

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

	-- 开关状态与存档：吸血形态只由轮盘控制，状态记在 soulstaff_on 上
	inst.soulstaff_on = false
	inst.SetActive = SetActive
	inst.RefreshCorruptFX = RefreshCorruptFX
	inst.OnSave = onsave
	inst.OnLoad = onload

	-- 掉地上 / 被捡回背包时，重新决定驱散源挂在哪
	inst:ListenForEvent("ondropped", OnInventoryStateChanged)
	inst:ListenForEvent("onputininventory", OnInventoryStateChanged)

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

return Prefab("m_soulstaff", fn, assets, prefabs)
