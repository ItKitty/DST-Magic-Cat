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
--   3) 脱下时只恢复普通物理；如果此刻在海上/虚空，游戏自带的落水/掉虚空回岸逻辑会处理。
--   4) 拖尾：统一由 m_witchbroom_fx 处理（原版拖尾 + 星屑），只在移动时出现。

local assets = {
	Asset("ANIM", "anim/witchbroom.zip"),
	Asset("INV_IMAGE", "witchbroom"),
}

local prefabs = {
	"m_witchbroom_fx", -- 飞行拖尾 + 星屑（只有移动时出现）
}

local SPEED_MULT = 1.3

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

		-- 直接恢复普通物理即可：如果此刻站在海上/虚空里，
		-- 游戏自带的落水/掉虚空处理会把玩家送回最近的岸边，不需要我们再找点。
		RestoreNormalWalking(inst, owner)
	end
end

-- 拖尾特效：原版扫帚的飞行拖尾 + 维多利亚手杖的星屑
local function RemoveTrailFx(inst)
	if inst._flight_fx ~= nil then
		if inst._flight_fx:IsValid() then
			inst._flight_fx:Remove()
		end
		inst._flight_fx = nil
	end
end

local function AddTrailFx(inst, owner)
	RemoveTrailFx(inst)

	-- 一个特效实体同时负责拖尾和星屑，内部自己判断持有者是否在移动
	inst._flight_fx = SpawnPrefab("m_witchbroom_fx")
	if inst._flight_fx ~= nil then
		inst._flight_fx.entity:SetParent(owner.entity)
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
	end)

	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
	MakeSmallPropagator(inst)
	MakeHauntableLaunch(inst)

	return inst
end

return Prefab("m_witchbroom", fn, assets, prefabs)
