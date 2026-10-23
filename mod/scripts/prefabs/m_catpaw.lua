local assets = {
	Asset("ANIM", "anim/m_catpaw.zip"), --地上的动画
	Asset("ANIM", "anim/swap_catpaw.zip"),

	Asset("ANIM", "anim/blow_dart.zip"),
	Asset("ANIM", "anim/elec_lunge_fx.zip"),
}

local projectile_prefabs = {
	"hitsparks_piercing_fx",
}

local function laterdamage(inst, target, attacker)
	for i = 1, 4 do
		inst:DoTaskInTime(0.5 * i, function()
			if
				target
				and target:IsValid()
				and target.components.combat
				and target.components.health
				and target.components.health.currenthealth > 0
			then
				target.components.combat:GetAttacked_Internal(
					attacker,
					0.0125 * target.components.health.maxhealth,
					inst
				)
				SpawnPrefab("lucy_transform_fx").Transform:SetPosition(target.Transform:GetWorldPosition())
			end
		end)
	end
end

local function onattack(inst, owner, target)
	if target ~= nil and target:IsValid() then
		SpawnPrefab("hitsparks_fx"):Setup(owner, target)

		local fx = SpawnPrefab("wanda_attack_pocketwatch_old_fx")
		local tx, _, tz = target.Transform:GetWorldPosition()
		local doer_rotation = owner.Transform:GetRotation()
		local radius = target:GetPhysicsRadius(0.5)
		local angle = (doer_rotation - 90) * DEGREES
		fx.Transform:SetPosition(tx + math.sin(angle) * radius, 0.5, tz + math.cos(angle) * radius)
		-- 真伤
		-- target.components.health:DoDelta(-34, nil, inst.prefab, true, nil, true)
	end
	-- 流血
	-- if inst.attacknum == 2 then
	-- 	laterdamage(inst, target, owner)
	-- end
	-- inst.attacknum = (inst.attacknum + 1) % 3
end

local function add_charged_fx(inst, owner)
	if not inst._charged_vfx and inst.components.equippable:IsEquipped() then
		local _charged_vfx = SpawnPrefab("wurt_swampitem_lunar_chargedfx")
		_charged_vfx.entity:AddFollower()
		_charged_vfx.entity:SetParent(owner.entity)
		_charged_vfx.Transform:SetScale(0.6, 0.6, 0.6)
		_charged_vfx.Follower:FollowSymbol(owner.GUID, "swap_object", 0, 0, 0)
		inst._charged_vfx = _charged_vfx
	end

	if not inst._cane_vfx and inst.components.equippable:IsEquipped() then
		local _cane_vfx = SpawnPrefab("cane_victorian_fx")
		_cane_vfx.entity:AddFollower()
		_cane_vfx.entity:SetParent(owner.entity)
		_cane_vfx.Follower:FollowSymbol(owner.GUID, "swap_object", 0, 0, 0)
		inst._cane_vfx = _cane_vfx
	end
end
local function remove_charged_fx(inst)
	if inst._charged_vfx then
		inst._charged_vfx:Remove()
		inst._charged_vfx = nil
	end
	if inst._cane_vfx then
		inst._cane_vfx:Remove()
		inst._cane_vfx = nil
	end
end

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_catpaw", "swap_catpaw")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	add_charged_fx(inst, owner)
end

local function onunequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	remove_charged_fx(inst)
end

------------------------ 奔雷 -----------------------------------
local function Lightning_ReticuleTargetFn()
	--Cast range is 8, leave room for error (6.5 lunge)
	return Vector3(ThePlayer.entity:LocalToWorldSpace(6.5, 0, 0))
end

local function Lightning_ReticuleMouseTargetFn(inst, mousepos)
	if mousepos ~= nil then
		local x, y, z = inst.Transform:GetWorldPosition()
		local dx = mousepos.x - x
		local dz = mousepos.z - z
		local l = dx * dx + dz * dz
		if l <= 0 then
			return inst.components.reticule.targetpos
		end
		l = 6.5 / math.sqrt(l)
		return Vector3(x + dx * l, 0, z + dz * l)
	end
end

local function Lightning_ReticuleUpdatePositionFn(inst, pos, reticule, ease, smoothing, dt)
	local x, y, z = inst.Transform:GetWorldPosition()
	reticule.Transform:SetPosition(x, 0, z)
	local rot = -math.atan2(pos.z - z, pos.x - x) / DEGREES
	if ease and dt ~= nil then
		local rot0 = reticule.Transform:GetRotation()
		local drot = rot - rot0
		rot = Lerp((drot > 180 and rot0 + 360) or (drot < -180 and rot0 - 360) or rot0, rot, dt * smoothing)
	end
	reticule.Transform:SetRotation(rot)
end

local function Lightning_HasElectric(inst, target)
	return inst._electric_lunge_task ~= nil or (target ~= nil and target:IsValid() and target:GetWetMultiplier() > 0)
end

local function Lightning_SpellFn(inst, doer, pos)
	doer:PushEvent("combat_lunge", { targetpos = pos, weapon = inst })
end

local function Lightning_ResetElectric(inst)
	inst._electric_lunge_task = nil
end

local function Lightning_OnPreLunge(inst, doer, startingpos, targetpos)
	--@V2C: #HACK so that during lunge, we can trigger electrocute even when dry
	if inst._electric_lunge_task then
		inst._electric_lunge_task:Cancel()
	end
	--@V2C: #HACK delayed because targets' stategraph events are deferred, and they will be checking the electric mults
	inst._electric_lunge_task = inst:DoTaskInTime(2 * FRAMES, Lightning_ResetElectric)
end

local function Lightning_OnLunged(inst, doer, startingpos, targetpos)
	local fx = SpawnPrefab("spear_wathgrithr_lightning_lunge_fx")
	fx.Transform:SetPosition(targetpos:Get())
	fx.Transform:SetRotation(doer:GetRotation())

	inst.components.rechargeable:Discharge(inst._cooldown)
end

local function Lightning_OnLungedHit(inst, doer, target) end

local function LightningSpearCommonFn_Base(inst)
	-- aoeweapon_lunge (from aoeweapon_lunge component) added to pristine state for optimization.
	inst:AddTag("aoeweapon_lunge")

	-- rechargeable (from rechargeable component) added to pristine state for optimization.
	inst:AddTag("rechargeable")

	inst:AddComponent("aoetargeting")
	inst.components.aoetargeting:SetAllowRiding(false)
	inst.components.aoetargeting.reticule.reticuleprefab = "reticuleline"
	inst.components.aoetargeting.reticule.pingprefab = "reticulelineping"
	inst.components.aoetargeting.reticule.targetfn = Lightning_ReticuleTargetFn
	inst.components.aoetargeting.reticule.mousetargetfn = Lightning_ReticuleMouseTargetFn
	inst.components.aoetargeting.reticule.updatepositionfn = Lightning_ReticuleUpdatePositionFn
	inst.components.aoetargeting.reticule.validcolour = { 1, 0.75, 0, 1 }
	inst.components.aoetargeting.reticule.invalidcolour = { 0.5, 0, 0, 1 }
	inst.components.aoetargeting.reticule.ease = true
	inst.components.aoetargeting.reticule.mouseenabled = true
	inst.components.aoetargeting:SetEnabled(true)
end

local function LightningSpearPostInitFn_Base(inst)
	inst.CanElectrocuteTarget = Lightning_HasElectric
	inst._cooldown = 1

	inst:AddComponent("aoeweapon_lunge")
	inst.components.aoeweapon_lunge:SetDamage(TUNING.SPEAR_WATHGRITHR_LIGHTNING_LUNGE_DAMAGE)
	inst.components.aoeweapon_lunge:SetSound("meta3/wigfrid/spear_lighting_lunge")
	inst.components.aoeweapon_lunge:SetSideRange(1)
	inst.components.aoeweapon_lunge:SetOnPreLungeFn(Lightning_OnPreLunge)
	inst.components.aoeweapon_lunge:SetOnLungedFn(Lightning_OnLunged)
	inst.components.aoeweapon_lunge:SetOnHitFn(Lightning_OnLungedHit)
	-- inst.components.aoeweapon_lunge:SetStimuli("electric")
	inst.components.aoeweapon_lunge:SetWorkActions()
	inst.components.aoeweapon_lunge:SetTags("_combat")

	inst:AddComponent("aoespell")
	inst.components.aoespell:SetSpellFn(Lightning_SpellFn)
end
-----------------------------------------------------------

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("m_catpaw") --地上动画
	inst.AnimState:SetBuild("m_catpaw")
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("sharp")
	inst:AddTag("pointy")
	inst:AddTag("weapon")

	MakeInventoryFloatable(inst, "small")

	inst.entity:SetPristine()

	LightningSpearCommonFn_Base(inst)

	if not TheWorld.ismastersim then
		return inst
	end

	inst.attacknum = 0

	LightningSpearPostInitFn_Base(inst)

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(51)
	inst.components.weapon:SetOnAttack(onattack)

	-- 位面伤害
	inst:AddComponent("planardamage")
	inst.components.planardamage:SetBaseDamage(15)

	inst:AddTag("rangedweapon")

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "m_catpaw"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/m_catpaw.xml"

	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = 1.25
	-- inst.components.equippable.restrictedtag = "madeleine"

	-- 显示倒计时cd
	inst:AddComponent("rechargeable")

	MakeHauntableLaunch(inst)

	return inst
end

return Prefab("m_catpaw", fn, assets)
