-- m_witchbroom - 女巫扫帚（玛德琳版）
--
-- 飞行 / 免疫沿用原版 witchbroom 的机制，不改状态机：
--   · 物品本身带 "flyingbroom" 标签，SGwilson 的 run.onenter 用
--     `inventory:EquipHasTag("flyingbroom")` 判定（SGwilson.lua:500-507），
--     于是跑动时切换到 run_flyingbroom_start / run_flyingbroom；
--   · 进入该状态会调用 ConfigureWitchBroomFlying(inst, true)（SGwilson.lua:890-911）：
--     关闭地面速度倍率、关闭 carefulwalker、挂防滑 grit —— 冰面/坑洼/蛛网都不减速。
--
-- 相对原版新增：
--   1) 手持移速 +30%：equippable.walkspeedmult（locomotor.lua:193/216 会乘进速度）
--   2) 可以跨海：做法同 amulettraits:EnableWaterWalking
--      （drownable 关闭 + 物理只与 GROUND 碰撞 + pathcaps.allowocean）
--      脱下时恢复；如果正站在海上，会先找最近的陆地落脚，找不到就等玩家上岸后再恢复，
--      避免在深海换装备直接淹死。

local assets = {
	Asset("ANIM", "anim/witchbroom.zip"),
	Asset("INV_IMAGE", "witchbroom"),
}

local SPEED_MULT = 1.3
local LAND_SEARCH_RADII = { 2, 4, 6, 8 }
local RESTORE_RETRY_TIME = 0.5
local RESTORE_TIMEOUT = 60

local function CancelRestoreTask(inst)
	if inst._ocean_restore_task ~= nil then
		inst._ocean_restore_task:Cancel()
		inst._ocean_restore_task = nil
	end
	inst._ocean_restore_time = nil
end

local function IsOnOcean(owner)
	local x, y, z = owner.Transform:GetWorldPosition()
	return TheWorld.Map:IsOceanAtPoint(x, y, z, false)
end

local function FindLandOffset(owner)
	local pt = owner:GetPosition()
	for _, r in ipairs(LAND_SEARCH_RADII) do
		local offset = FindWalkableOffset(pt, math.random() * TWOPI, r, 8, false, false)
		if offset ~= nil then
			return pt.x + offset.x, pt.z + offset.z
		end
	end
	return nil
end

local function ApplyOceanMask(owner)
	owner.Physics:ClearCollisionMask()
	owner.Physics:CollidesWith(COLLISION.GROUND)
	owner.Physics:CollidesWith(COLLISION.OBSTACLES)
	owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
	owner.Physics:CollidesWith(COLLISION.CHARACTERS)
	owner.Physics:CollidesWith(COLLISION.GIANTS)
	owner.Physics:Teleport(owner.Transform:GetWorldPosition())
end

local function ApplyLandMask(owner)
	owner.Physics:ClearCollisionMask()
	owner.Physics:CollidesWith(COLLISION.WORLD)
	owner.Physics:CollidesWith(COLLISION.OBSTACLES)
	owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
	owner.Physics:CollidesWith(COLLISION.CHARACTERS)
	owner.Physics:CollidesWith(COLLISION.GIANTS)
	owner.Physics:Teleport(owner.Transform:GetWorldPosition())
end

-- 真正把跨海状态关掉（调用前要确保玩家已经不在海上）
local function RestoreNormalWalking(inst, owner)
	if owner == nil or not owner:IsValid() then
		return
	end

	if owner.Physics ~= nil and not TheWorld:HasTag("cave") then
		ApplyLandMask(owner)
	end

	local drownable = owner.components.drownable
	if drownable ~= nil then
		drownable.enabled = true
	end

	local locomotor = owner.components.locomotor
	if locomotor ~= nil and locomotor.pathcaps ~= nil then
		locomotor.pathcaps.allowocean = nil
	end
end

local function SetOceanWalking(inst, owner, enable)
	if owner == nil or not owner:IsValid() then
		return
	end

	local locomotor = owner.components.locomotor
	local drownable = owner.components.drownable
	local in_cave = TheWorld:HasTag("cave")

	if enable then
		CancelRestoreTask(inst)
		inst._ocean_walking = true

		if drownable ~= nil then
			drownable.enabled = false
		end
		if owner.Physics ~= nil and not in_cave then
			ApplyOceanMask(owner)
		end
		if locomotor ~= nil then
			locomotor.pathcaps = locomotor.pathcaps or {}
			locomotor.pathcaps.allowocean = true
		end
	else
		if not inst._ocean_walking then
			return
		end
		inst._ocean_walking = nil
		CancelRestoreTask(inst)

		if owner.Physics == nil or in_cave or not IsOnOcean(owner) then
			RestoreNormalWalking(inst, owner)
			return
		end

		-- 正站在海上：先找最近的陆地；找不到就等玩家自己走回岸上再恢复
		local x, z = FindLandOffset(owner)
		if x ~= nil then
			owner.Physics:Teleport(x, 0, z)
			RestoreNormalWalking(inst, owner)
			return
		end

		inst._ocean_restore_time = 0
		inst._ocean_restore_task = inst:DoPeriodicTask(RESTORE_RETRY_TIME, function(inst2)
			if not owner:IsValid() then
				CancelRestoreTask(inst2)
				return
			end

			inst2._ocean_restore_time = (inst2._ocean_restore_time or 0) + RESTORE_RETRY_TIME

			local lx, lz = FindLandOffset(owner)
			if lx ~= nil then
				owner.Physics:Teleport(lx, 0, lz)
			elseif IsOnOcean(owner) and inst2._ocean_restore_time < RESTORE_TIMEOUT then
				-- 还在海上且超时未到：继续保留跨海状态，等玩家上岸
				return
			end

			CancelRestoreTask(inst2)
			RestoreNormalWalking(inst2, owner)
		end)
	end
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "witchbroom", "swap_witchbroom")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	SetOceanWalking(inst, owner, true)
end

local function OnUnequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	SetOceanWalking(inst, owner, false)
end

local FLOATER_SCALE = { 1.25, 0.5, 1.25 }
local FLOATER_SWAP_DATA = { sym_build = "witchbroom", sym_name = "swap_witchbroom" }

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("witchbroom")
	inst.AnimState:SetBuild("witchbroom")
	inst.AnimState:PlayAnimation("idle")

	-- 武器 + 扫地（原版扫帚也是拿着它扫/敲）
	inst:AddTag("weapon")
	inst:AddTag("propweapon")
	inst:AddTag("propweapon_nopvp")
	-- 飞行：SGwilson 通过 inventory:EquipHasTag("flyingbroom") 判定
	inst:AddTag("flyingbroom")

	MakeInventoryFloatable(inst, "med", 0.05, FLOATER_SCALE, true, -15, FLOATER_SWAP_DATA)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.scrapbook_subcat = "tool"

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	-- 复用原版扫帚的背包图标
	inst.components.inventoryitem.imagename = "witchbroom"

	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(OnEquip)
	inst.components.equippable:SetOnUnequip(OnUnequip)
	-- 手持移速 +30%
	inst.components.equippable.walkspeedmult = SPEED_MULT

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(1)

	inst:AddComponent("sweeper")
	inst.components.sweeper:SetSweepSound("yotr_2023/common/pillow_hit_petals")

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
	MakeSmallPropagator(inst)
	MakeHauntableLaunch(inst)

	return inst
end

return Prefab("m_witchbroom", fn, assets)
