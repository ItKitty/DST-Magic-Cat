-- m_witchbroom - 女巫扫帚（玛德琳版）
--
-- 物品本身只负责：外观、手持动画、+30% 移速、拖尾特效。
-- 飞行 / 跨地形 / 水上行走 / 骑扫帚待机状态 在 systems/m_witchbroom_fly.lua 里，
-- 那部分是照搬工坊「女巫扫帚飞行」(3828144951) 的实现。
--
-- 本文件保留：
--   · 带 "flyingbroom" 标签（原版 SGwilson 的 run.onenter 与系统的 ShouldFly 都认它）
--   · 装备时 +30% 移速（equippable.walkspeedmult，locomotor.lua:193/216 会乘进速度）
--   · 装备时生成 m_witchbroom_fx（原版扫帚拖尾 + 星屑，只在移动时出现）

local assets = {
	Asset("ANIM", "anim/witchbroom.zip"),
	Asset("ANIM", "anim/witchbroom_living_build.zip"),
	Asset("INV_IMAGE", "witchbroom"),
	Asset("INV_IMAGE", "witchbroom_living"),
}

-- 附魔（活体）外观
local BROOM_BUILD = "witchbroom_living_build"
local BROOM_IMAGE = "witchbroom_living"

local prefabs = {
	"m_witchbroom_fx", -- 飞行拖尾 + 星屑（只有移动时出现）
}

local SPEED_MULT = 1.3

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
	owner.AnimState:OverrideSymbol("swap_object", BROOM_BUILD, "swap_witchbroom")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	AddTrailFx(inst, owner)
end

local function OnUnequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	RemoveTrailFx(inst)
end

local FLOATER_SCALE = { 1.25, 0.5, 1.25 }
local FLOATER_SWAP_DATA = { sym_build = BROOM_BUILD, sym_name = "swap_witchbroom" }

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("witchbroom")
	inst.AnimState:SetBuild(BROOM_BUILD)
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
	-- 附魔扫帚的背包图标
	inst.components.inventoryitem.imagename = BROOM_IMAGE

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
