local assets = {
	Asset("ANIM", "anim/true_scythe_voidcloth.zip"),
}

local prefabs = {
	"true_voidcloth_scythe_fx",
	"hitsparks_fx",
	"scythe_shadow_fx",
}
local SpDamageUtil = require("components/spdamageutil")

local VOIDCLOTH_SCYTHE_DAMAGE = 40

--------------------------------------------------------------------------

local function SetBuffEnabled(inst, enabled)
	if enabled then
		if not inst._bonusenabled then
			inst._bonusenabled = true
			if inst.components.weapon ~= nil then
				inst.components.weapon:SetDamage(
					VOIDCLOTH_SCYTHE_DAMAGE * TUNING.WEAPONS_VOIDCLOTH_SETBONUS_DAMAGE_MULT
				)
			end
			inst.components.planardamage:AddBonus(inst, 10, "setbonus")
		end
	elseif inst._bonusenabled then
		inst._bonusenabled = nil
		if inst.components.weapon ~= nil then
			inst.components.weapon:SetDamage(VOIDCLOTH_SCYTHE_DAMAGE)
		end
		inst.components.planardamage:RemoveBonus(inst, "setbonus")
	end
end

local function SetBuffOwner(inst, owner)
	if inst._owner ~= owner then
		if inst._owner ~= nil then
			inst:RemoveEventCallback("equip", inst._onownerequip, inst._owner)
			inst:RemoveEventCallback("unequip", inst._onownerunequip, inst._owner)
			inst._onownerequip = nil
			inst._onownerunequip = nil
			SetBuffEnabled(inst, false)
		end
		inst._owner = owner
		if owner ~= nil then
			inst._onownerequip = function(owner, data)
				if data ~= nil then
					if data.item ~= nil and data.item.prefab == "m_bonehat" then
						SetBuffEnabled(inst, true)
					elseif data.eslot == EQUIPSLOTS.HEAD then
						SetBuffEnabled(inst, false)
					end
				end
			end
			inst._onownerunequip = function(owner, data)
				if data ~= nil and data.eslot == EQUIPSLOTS.HEAD then
					SetBuffEnabled(inst, false)
				end
			end
			inst:ListenForEvent("equip", inst._onownerequip, owner)
			inst:ListenForEvent("unequip", inst._onownerunequip, owner)

			local hat = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
			if hat ~= nil and hat.prefab == "m_bonehat" then
				SetBuffEnabled(inst, true)
			end
		end
	end
end

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

local function SetFxOwner(inst, owner)
	if inst._fxowner ~= nil and inst._fxowner.components.colouradder ~= nil then
		inst._fxowner.components.colouradder:DetachChild(inst.fx)
	end
	inst._fxowner = owner
	if owner ~= nil then
		inst.fx.entity:SetParent(owner.entity)
		inst.fx.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, 2)
		inst.fx.components.highlightchild:SetOwner(owner)
		inst.fx:ToggleEquipped(true)
		if owner.components.colouradder ~= nil then
			owner.components.colouradder:AttachChild(inst.fx)
		end
		inst.bladefx.entity:SetParent(owner.entity)
		inst.bladefx.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, 1, 5)

		-- 暗影特效
		if inst._trailtask == nil then
			inst._trailtask = inst:DoPeriodicTask(6 * FRAMES, staff_do_trail, 2 * FRAMES)
		end
	else
		inst.fx.entity:SetParent(inst.entity)
		--For floating
		inst.fx.Follower:FollowSymbol(inst.GUID, "swap_spear", nil, nil, nil, true, nil, 2)

		inst.fx.components.highlightchild:SetOwner(inst)
		inst.fx:ToggleEquipped(false)
		inst.bladefx.entity:SetParent(inst.entity)
		inst.bladefx.Follower:StopFollowing()
		inst.bladefx:Hide()

		if inst._trailtask ~= nil then
			inst._trailtask:Cancel()
			inst._trailtask = nil
		end
	end
end

local function PushIdleLoop(inst)
	inst.AnimState:PushAnimation("idle")
end

local function OnStopFloating(inst)
	inst.fx.AnimState:SetFrame(0)
	inst:DoTaskInTime(0, PushIdleLoop) --#V2C: #HACK restore the looping anim, timing issues
end

local function DoAOEAttack(weapon, attacker)
	---延时任务，考虑破碎判定
	if weapon.components.weapon == nil then
		return
	end
	local doer_pos = attacker:GetPosition()
	local doer_rotation = attacker.Transform:GetRotation()
	local doer_combat = attacker.components.combat

	local ents = TheSim:FindEntities(doer_pos.x, 0, doer_pos.z, 7, { "_combat" }, {
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
	for _, v in pairs(ents) do
		if weapon:IsEntityInFront(v, doer_rotation, doer_pos) and doer_combat:P_AOECheck(v) then
			local dmg, spdmg = weapon.components.weapon:GetDamage(attacker, v)

			dmg = dmg
				* (doer_combat.customdamagemultfn ~= nil and doer_combat.customdamagemultfn(attacker, v, weapon) or 1)
			spdmg = SpDamageUtil.CollectSpDamage(attacker, spdmg)
			v.components.combat:GetAttacked_Internal(attacker, dmg, weapon, nil, spdmg)

			local fx = SpawnPrefab("wanda_attack_pocketwatch_old_fx")
			local tx, _, tz = v.Transform:GetWorldPosition()
			local radius = v:GetPhysicsRadius(0.5)
			local angle = (doer_rotation - 90) * DEGREES
			fx.Transform:SetPosition(tx + math.sin(angle) * radius, 0.5, tz + math.cos(angle) * radius)
		end
	end
end

---------  影袭 -----------

local function onAttackMultHits(inst, attacker, target)
	local damage = inst.components.weapon.damage
	local nums = 10

	local fulldamage = damage * nums
	local newnums = math.random(4, 6)
	local newdamage = fulldamage / newnums
	local roa_little = math.random() * math.pi - math.random() * 2 * math.pi

	local sleeptime = math.min(0.1, 0.4 / newnums)
	local rad = 4.5
	inst:StartThread(function()
		for roa = roa_little, 2 * math.pi + roa_little, 2 * math.pi / newnums do
			local pos = target:GetPosition()
			local offset = Vector3(math.cos(roa) * rad, 0, math.sin(roa) * rad)
			local shadow = SpawnPrefab("m_magical_shadow")
			shadow:SetPosition(pos, offset)
			shadow:SetDamage(newdamage)
			shadow:SetTarget(target)
			shadow:SetPlayer(attacker)
			shadow:InitAnim("wilson", attacker.prefab)
			local nx, nv, nz = (pos + offset):Get()
			Sleep(sleeptime)
		end
	end)
end
--------------------------------------------

local function OnAttack(inst, owner, target)
	if
		owner.components.health ~= nil
		and owner.components.health:IsHurt()
		and not target:HasOneOfTags(NON_LIFEFORM_TARGET_TAGS)
	then
		if owner.components.sanity ~= nil then
			owner.components.sanity:DoDelta(-3.4)
		end
		owner.components.health:DoDelta(6.8, false, "death_hunter")
	end
	inst.bladefx:Show()
	inst.bladefx.AnimState:PlayAnimation("scythe_shadow")
	-- 范围伤害
	inst.aoetask = inst:DoTaskInTime(4 * FRAMES, DoAOEAttack, owner)
	-- 影袭
	if target:HasTag("epic") and inst.components.rechargeable:IsCharged() then
		onAttackMultHits(inst, owner, target)
		-- 10S cd
		inst.components.rechargeable:Discharge(10)
	end

	-- 计算最终数值
	local health = target.components.health.maxhealth
	local resultDamage = health * 0.0075
	-- 真伤
	local damageNum = resultDamage > 0 and resultDamage or 0 -- 保证伤害值不为负数
	target.components.health:DoDelta(-damageNum, nil, inst.prefab, true, nil, true)
end

local function OnEquip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_object")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
	SetFxOwner(inst, owner)
	SetBuffOwner(inst, owner)
end

local function OnUnequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	SetFxOwner(inst, nil)
	SetBuffOwner(inst, nil)
end

local function HarvestPickable(inst, ent, doer)
	if ent.components.pickable.picksound ~= nil then
		doer.SoundEmitter:PlaySound(ent.components.pickable.picksound)
	end

	local success, loot = ent.components.pickable:Pick(TheWorld)

	if loot ~= nil then
		for i, item in ipairs(loot) do
			Launch(item, doer, 1.5)
		end
	end
end

local function SetupComponents(inst)
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(OnEquip)
	inst.components.equippable:SetOnUnequip(OnUnequip)
	inst.components.equippable.walkspeedmult = 1.25
	-- inst.components.equippable.restrictedtag = "madeleine"

	inst:AddComponent("weapon")
	inst.components.weapon:SetRange(4)
	inst.components.weapon:SetDamage(
		inst._bonusenabled and VOIDCLOTH_SCYTHE_DAMAGE * TUNING.WEAPONS_VOIDCLOTH_SETBONUS_DAMAGE_MULT
			or VOIDCLOTH_SCYTHE_DAMAGE
	)
	inst.components.weapon:SetOnAttack(OnAttack)
	inst.components.weapon:EnableToughFight(true)

	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.SCYTHE)
end

local function IsEntityInFront(inst, ent, doer_rotation, doer_pos)
	if not ent.entity:IsValid() then
		return
	end
	local facing = Vector3(math.cos(-doer_rotation / RADIANS), 0, math.sin(-doer_rotation / RADIANS))

	return IsWithinAngle(doer_pos, facing, TUNING.VOIDCLOTH_SCYTHE_HARVEST_ANGLE_WIDTH, ent:GetPosition())
end

local HARVEST_MUSTTAGS = { "pickable" }
local HARVEST_CANTTAGS = { "INLIMBO", "FX" }
local HARVEST_ONEOFTAGS = { "plant", "lichen", "oceanvine", "kelp" }

local function DoScythe(inst, target, doer)
	if target.components.pickable ~= nil then
		local doer_pos = doer:GetPosition()
		local x, y, z = doer_pos:Get()

		local doer_rotation = doer.Transform:GetRotation()

		local ents = TheSim:FindEntities(x, y, z, 7, HARVEST_MUSTTAGS, HARVEST_CANTTAGS, HARVEST_ONEOFTAGS)
		for _, ent in pairs(ents) do
			if ent:IsValid() and ent.components.pickable ~= nil then
				if inst:IsEntityInFront(ent, doer_rotation, doer_pos) then
					inst:HarvestPickable(ent, doer)
				end
			end
		end
	end
end

local SWAP_DATA = { sym_build = "scythe_voidcloth", sym_name = "swap_scythe", bank = "scythe_voidcloth" }

local function ScytheFn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("true_scythe_voidcloth")
	inst.AnimState:SetBuild("true_scythe_voidcloth")
	inst.AnimState:PlayAnimation("idle", true)

	inst:AddTag("sharp")

	--weapon (from weapon component) added to pristine state for optimization
	inst:AddTag("weapon")
	inst:AddTag("m_item")

	inst:AddTag("mythical")
	inst:AddTag("scythe_attack")

	-- inst.itemtile_colour = RGB(143, 41, 41)

	inst:AddComponent("floater")
	inst.components.floater:SetSize("med")
	inst.components.floater:SetVerticalOffset(0)
	inst.components.floater:SetScale({ 1.2, 0.4, 1.2 })
	inst.components.floater:SetBankSwapOnFloat(true, -20, SWAP_DATA)

	inst.scrapbook_specialinfo = "VOIDCLITHSCYTHE"

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	local frame = math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1
	inst.AnimState:SetFrame(frame)
	inst.fx = SpawnPrefab("true_voidcloth_scythe_fx")
	inst.fx.AnimState:SetFrame(frame)

	inst.bladefx = SpawnPrefab("scythe_shadow_fx")
	inst.bladefx.entity:SetParent(inst.entity)

	SetFxOwner(inst, nil)
	inst:ListenForEvent("floater_stopfloating", OnStopFloating)

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "m_shadowreaper"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/m_shadowreaper.xml"

	local planardamage = inst:AddComponent("planardamage")
	planardamage:SetBaseDamage(25)

	local damagetypebonus = inst:AddComponent("damagetypebonus")
	damagetypebonus:AddBonus("lunar_aligned", inst, 1.1)

	SetupComponents(inst)

	MakeHauntableLaunch(inst)

	inst.DoScythe = DoScythe
	inst.IsEntityInFront = IsEntityInFront
	inst.HarvestPickable = HarvestPickable

	-- 显示倒计时cd
	inst:AddComponent("rechargeable")

	return inst
end

local function fxfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddNetwork()
	inst.entity:AddAnimState()
	inst.entity:AddFollower()

	inst.AnimState:SetBank("true_scythe_voidcloth")
	inst.AnimState:SetBuild("true_scythe_voidcloth")

	inst.AnimState:PlayAnimation("scythe_shadow")
	inst:AddTag("FX")

	inst:Hide()

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:ListenForEvent("animover", inst.Hide)

	inst.persists = false

	return inst
end

local FX_DEFS = {
	{ anim = "swap_loop_1", frame_begin = 0, frame_end = 2 },
	{ anim = "swap_loop_6", frame_begin = 5 },
	{ anim = "swap_loop_7", frame_begin = 6 },
	{ anim = "swap_loop_8", frame_begin = 7 },
}

local function CreateFxFollowFrame()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddFollower()

	inst:AddTag("FX")

	inst.AnimState:SetBank("true_scythe_voidcloth")
	inst.AnimState:SetBuild("true_scythe_voidcloth")

	inst:AddComponent("highlightchild")

	inst.persists = false

	return inst
end

local function FxRemoveAll(inst)
	for i = 1, #inst.fx do
		inst.fx[i]:Remove()
		inst.fx[i] = nil
	end
end

local function FxColourChanged(inst, r, g, b, a)
	for i = 1, #inst.fx do
		inst.fx[i].AnimState:SetAddColour(r, g, b, a)
	end
end

local function FxOnEquipToggle(inst)
	local owner = inst.equiptoggle:value() and inst.entity:GetParent() or nil
	if owner ~= nil then
		if inst.fx == nil then
			inst.fx = {}
		end
		local frame = inst.AnimState:GetCurrentAnimationFrame()
		for i, v in ipairs(FX_DEFS) do
			local fx = inst.fx[i]
			if fx == nil then
				fx = CreateFxFollowFrame()
				fx.AnimState:PlayAnimation(v.anim, true)
				inst.fx[i] = fx
			end
			fx.entity:SetParent(owner.entity)
			fx.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, v.frame_begin, v.frame_end)
			fx.AnimState:SetFrame(frame)
			fx.components.highlightchild:SetOwner(owner)
		end
		inst.components.colouraddersync:SetColourChangedFn(FxColourChanged)
		inst.OnRemoveEntity = FxRemoveAll
	elseif inst.OnRemoveEntity ~= nil then
		inst.OnRemoveEntity = nil
		inst.components.colouraddersync:SetColourChangedFn(nil)
		FxRemoveAll(inst)
	end
end

local function FxToggleEquipped(inst, equipped)
	if equipped ~= inst.equiptoggle:value() then
		inst.equiptoggle:set(equipped)
		if not TheNet:IsDedicated() then
			FxOnEquipToggle(inst)
		end
	end
end

local function FollowSymbolFxFn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddFollower()
	inst.entity:AddNetwork()

	inst:AddTag("FX")

	inst.AnimState:SetBank("true_scythe_voidcloth")
	inst.AnimState:SetBuild("true_scythe_voidcloth")
	inst.AnimState:PlayAnimation("swap_loop_3", true)

	inst:AddComponent("highlightchild")
	inst:AddComponent("colouraddersync")

	inst.equiptoggle = net_bool(inst.GUID, "true_voidcloth_scythe_fx.equiptoggle", "equiptoggledirty")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		inst:ListenForEvent("equiptoggledirty", FxOnEquipToggle)
		return inst
	end

	inst.ToggleEquipped = FxToggleEquipped
	inst.persists = false

	return inst
end

return Prefab("m_voidcloth_scythe", ScytheFn, assets, prefabs),
	Prefab("scythe_shadow_fx", fxfn, assets),
	Prefab("true_voidcloth_scythe_fx", FollowSymbolFxFn, assets)
