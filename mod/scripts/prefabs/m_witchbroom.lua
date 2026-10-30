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
--   2) 真正的飞行物理：装备时把玩家切成 COLLISION.FLYERS 组（原版飞行单位同款，
--      例如 wagdrone_flying），障碍物（树/石头/墙/石笋）的碰撞掩码里没有 FLYERS，
--      所以能直接飞过去 —— 地上和地下都有效。
--      同时保留 GROUND 碰撞：水面上能站住（跨海），WORLD 碰撞保留：不会飞出地图边界。
--   3) 脱下时如果正站在海上，会先找最近的陆地落脚，找不到就等玩家上岸后再恢复，
--      避免在深海换装备直接淹死。
--   4) 拖尾：原版扫帚飞行拖尾 + cane_victorian_fx 星屑。

local assets = {
	Asset("ANIM", "anim/witchbroom.zip"),
	Asset("INV_IMAGE", "witchbroom"),
}

local prefabs = {
	"witchbroom_fx",     -- 原版扫帚飞行拖尾
	"cane_victorian_fx", -- 维多利亚手杖星屑
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

-- 飞行物理：完全照抄玛德琳变身蝙蝠的写法（components/chiropteran.lua:164-170）
-- 只和 GROUND + OBSTACLES 碰撞，WORLD 不碰撞 —— 于是海岸线、洞穴边缘、
-- 地图外沿这些"地形"全都可以直接飞过去（蝙蝠形态就是这么飞的）。
-- 不换碰撞组、也不碰撞 SMALLOBSTACLES / CHARACTERS / GIANTS。
local function ApplyFlyingMask(owner)
	owner.Physics:ClearCollisionMask()
	owner.Physics:CollidesWith(COLLISION.GROUND)
	owner.Physics:CollidesWith(COLLISION.OBSTACLES)
	owner.Physics:Teleport(owner.Transform:GetWorldPosition())
end

-- 普通玩家物理（和 MakeCharacterPhysics 一致）
local function ApplyNormalMask(owner)
	owner.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
	owner.Physics:ClearCollisionMask()
	owner.Physics:CollidesWith(COLLISION.WORLD)
	owner.Physics:CollidesWith(COLLISION.OBSTACLES)
	owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
	owner.Physics:CollidesWith(COLLISION.CHARACTERS)
	owner.Physics:CollidesWith(COLLISION.GIANTS)
	owner.Physics:Teleport(owner.Transform:GetWorldPosition())
end

local function SavePathcaps(inst, owner)
	local locomotor = owner.components.locomotor
	if locomotor == nil then
		return
	end
	local saved = {}
	for k, v in pairs(locomotor.pathcaps or {}) do
		saved[k] = v
	end
	inst._saved_pathcaps = saved
end

local function RestorePathcaps(inst, owner)
	local locomotor = owner.components.locomotor
	if locomotor == nil or inst._saved_pathcaps == nil then
		return
	end
	locomotor.pathcaps = inst._saved_pathcaps
	inst._saved_pathcaps = nil
	if locomotor.pathcaps ~= nil and next(locomotor.pathcaps) == nil then
		locomotor.pathcaps = nil
	end
end

-- 真正把飞行状态关掉（调用前要确保玩家已经不在海上）
local function RestoreNormalWalking(inst, owner)
	if owner == nil or not owner:IsValid() then
		return
	end

	if owner.Physics ~= nil then
		ApplyNormalMask(owner)
	end

	local drownable = owner.components.drownable
	if drownable ~= nil then
		drownable.enabled = true
	end

	if inst._saved_triggerscreep ~= nil and owner.components.locomotor ~= nil then
		owner.components.locomotor.triggerscreep = inst._saved_triggerscreep
		inst._saved_triggerscreep = nil
	end

	RestorePathcaps(inst, owner)
end

local function SetFlying(inst, owner, enable)
	if owner == nil or not owner:IsValid() then
		return
	end

	local locomotor = owner.components.locomotor
	local drownable = owner.components.drownable

	if enable then
		CancelRestoreTask(inst)
		inst._flying = true

		if drownable ~= nil then
			drownable.enabled = false
		end
		if owner.Physics ~= nil then
			ApplyFlyingMask(owner)
		end
		if locomotor ~= nil then
			if inst._saved_pathcaps == nil then
				SavePathcaps(inst, owner)
				-- 蝙蝠形态也会关掉踩网触发（chiropteran.lua:162）
				inst._saved_triggerscreep = locomotor.triggerscreep
			end
			locomotor.pathcaps = locomotor.pathcaps or {}
			locomotor.pathcaps.allowocean = true
			-- 寻路也别绕障碍物（点击移动时才能真正穿过去）
			locomotor.pathcaps.ignorewalls = true
			locomotor.pathcaps.ignorecreep = true
			locomotor.triggerscreep = false
		end
	else
		if not inst._flying then
			return
		end
		inst._flying = nil
		CancelRestoreTask(inst)

		if owner.Physics == nil or not IsOnOcean(owner) then
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
				-- 还在海上且超时未到：继续保留飞行状态，等玩家上岸
				return
			end

			CancelRestoreTask(inst2)
			RestoreNormalWalking(inst2, owner)
		end)
	end
end

-- 拖尾特效：原版扫帚的飞行拖尾 + 维多利亚手杖的星屑
local function RemoveTrailFx(inst)
	if inst._broom_trail ~= nil then
		if inst._broom_trail:IsValid() then
			inst._broom_trail:Remove()
		end
		inst._broom_trail = nil
	end
	if inst._victorian_trail ~= nil then
		if inst._victorian_trail:IsValid() then
			inst._victorian_trail:Remove()
		end
		inst._victorian_trail = nil
	end
end

local function AddTrailFx(inst, owner)
	RemoveTrailFx(inst)

	-- 原版女巫扫帚的飞行拖尾（witchbroom_trail 动画，内部按移动距离铺残影）
	inst._broom_trail = SpawnPrefab("witchbroom_fx")
	if inst._broom_trail ~= nil then
		inst._broom_trail.entity:SetParent(owner.entity)
	end

	-- 维多利亚手杖的星屑粒子（cane_victorian_fx，按移动速度决定粒子密度）
	inst._victorian_trail = SpawnPrefab("cane_victorian_fx")
	if inst._victorian_trail ~= nil then
		inst._victorian_trail.entity:SetParent(owner.entity)
	end
end

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "witchbroom", "swap_witchbroom")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	SetFlying(inst, owner, true)
	AddTrailFx(inst, owner)
end

local function OnUnequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	SetFlying(inst, owner, false)
	RemoveTrailFx(inst)
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

	-- 物品被移除时（烧毁、被吞掉等）兜底清掉拖尾
	inst:ListenForEvent("onremove", function(inst2)
		RemoveTrailFx(inst2)
		CancelRestoreTask(inst2)
	end)

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
	MakeSmallPropagator(inst)
	MakeHauntableLaunch(inst)

	return inst
end

return Prefab("m_witchbroom", fn, assets, prefabs)
