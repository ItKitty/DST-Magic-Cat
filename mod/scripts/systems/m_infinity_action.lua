-- ============================================================================
-- 无限充能（M_INFINITY_CHARGE）
-- 用「启迪碎片 alterguardianhatshard」对带耐久的装备/建筑使用，使其耐久变成无限：
--   · 护甲      armor       不再掉耐久
--   · 工具/武器  finiteuses  不再消耗
--   · 火堆/燃料  fueled      不再减少（火堆会一直点着）
-- 动作显示名：无限充能
--
-- 交互方式：把启迪碎片「拿在鼠标上」（原版 USEITEM 流程）再点目标才出现，
-- 和工坊模组 3504310575 的耐久宝石一致。
-- 目标用标签 m_infinity_chargeable 判定：这个标签由 AddPrefabPostInitAny 在
-- 服务端给「带 armor / finiteuses / fueled」的实体加上，标签会同步到客户端。
-- ============================================================================

local SHARD_PREFAB = "alterguardianhatshard"
local CHARGE_COMPONENT = "m_infinity_charge"
local CHARGEABLE_TAG = "m_infinity_chargeable"

-- 已经充过的目标不再提示
local DONE_TAGS = {
	"m_infinity_firepit",
	"m_infinity_finiteuses",
	"m_infinity_armor",
	"m_infinity_fueled",
}

-- ---------------------------------------------------------------------------
-- 动作本体
-- ---------------------------------------------------------------------------
local ACTION = AddAction("M_INFINITY_CHARGE", "无限充能", function(act)
	if act == nil or act.doer == nil or act.target == nil or not act.target:IsValid() then
		return false
	end
	if act.doer.prefab ~= "madeleine" then
		return false
	end

	local shard = act.invobject
	if shard == nil or shard.prefab ~= SHARD_PREFAB then
		return false
	end

	if not TheWorld.ismastersim then
		return true
	end

	-- 目标第一次被充能时才挂组件（组件里负责各种「无限」的实现）
	local comp = act.target.components[CHARGE_COMPONENT]
	if comp == nil then
		act.target:AddComponent(CHARGE_COMPONENT)
		comp = act.target.components[CHARGE_COMPONENT]
	end
	if comp == nil then
		return false
	end

	return comp:Charge(act.doer, shard)
end)

ACTION.distance = 2
ACTION.mount_valid = true
-- 和工坊模组一致：优先级高于同目标上的普通动作，确保拿着碎片点时能看到
ACTION.priority = 10

-- 动作状态：用原版的短动作，不新增状态
AddStategraphActionHandler("wilson", ActionHandler(ACTION, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTION, "doshortaction"))

-- ---------------------------------------------------------------------------
-- 给「带耐久」的实体打标签（服务端加，标签会同步给客户端）
-- ---------------------------------------------------------------------------
AddPrefabPostInitAny(function(inst)
	if not TheWorld.ismastersim then
		return
	end

	local comps = inst.components
	if comps ~= nil and (comps.armor ~= nil or comps.finiteuses ~= nil or comps.fueled ~= nil) then
		inst:AddTag(CHARGEABLE_TAG)
	end
end)

-- ---------------------------------------------------------------------------
-- 拿着碎片点目标时出现「无限充能」
-- 用碎片专属的标记组件注册，不要注册在 inventoryitem 上：
-- 同一模组内 AddComponentAction 是按「组件名」做键的，后注册的会覆盖先注册的，
-- 而护符能力解锁（amulet_action.lua）用的正是 inventoryitem。
-- ---------------------------------------------------------------------------
AddPrefabPostInit(SHARD_PREFAB, function(inst)
	if inst.components.m_infinity_shard == nil then
		inst:AddComponent("m_infinity_shard")
	end
end)

AddComponentAction("USEITEM", "m_infinity_shard", function(inst, doer, target, actions, right)
	if doer == nil or doer.prefab ~= "madeleine" then
		return
	end
	if target == nil or not target:IsValid() or not target:HasTag(CHARGEABLE_TAG) then
		return
	end

	for _, tag in ipairs(DONE_TAGS) do
		if target:HasTag(tag) then
			return
		end
	end

	table.insert(actions, ACTIONS.M_INFINITY_CHARGE)
end)
