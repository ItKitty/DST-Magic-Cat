-- ============================================================================
-- 无限充能（M_INFINITY_CHARGE）
-- 用「启迪碎片 alterguardianhatshard」对带耐久的装备/建筑使用，使其耐久变成无限：
--   · 护甲      armor       不再掉耐久
--   · 工具/武器  finiteuses  不再消耗
--   · 火堆/燃料  fueled      不再减少（火堆会一直点着）
-- 动作显示名：无限充能
-- 只认「碎片」这一个道具，且目标必须真的带耐久，所以不会和其它动作抢
-- ============================================================================

local SHARD_PREFAB = "alterguardianhatshard"
local CHARGE_COMPONENT = "m_infinity_charge"

-- 已经充过的目标不再提示
local DONE_TAGS = {
	"m_infinity_firepit",
	"m_infinity_finiteuses",
	"m_infinity_armor",
	"m_infinity_fueled",
}

-- 目标是否带「耐久」类组件：服务端用 components，客户端用 replica
local function HasDurability(target)
	if target == nil then
		return false
	end

	local comps = target.components
	if comps ~= nil and (comps.armor ~= nil or comps.finiteuses ~= nil or comps.fueled ~= nil) then
		return true
	end

	local replica = target.replica
	return replica ~= nil and (replica.armor ~= nil or replica.finiteuses ~= nil or replica.fueled ~= nil)
end

-- ---------------------------------------------------------------------------
-- 动作本体
-- ---------------------------------------------------------------------------
local ACTION = AddAction("M_INFINITY_CHARGE", "无限充能", function(act)
	if
		act == nil
		or act.doer == nil
		or act.target == nil
		or not act.target:IsValid()
		or act.invobject == nil
		or act.invobject.prefab ~= SHARD_PREFAB
		or act.doer.prefab ~= "madeleine"
	then
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

	return comp:Charge(act.doer, act.invobject)
end)

ACTION.distance = 3
ACTION.mount_valid = true
-- 优先级压低：不要盖掉同一目标上原版的其它动作
ACTION.priority = 1

-- 动作状态：用原版的短动作，不新增状态
AddStategraphActionHandler("wilson", ActionHandler(ACTION, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTION, "doshortaction"))

-- ---------------------------------------------------------------------------
-- 给启迪碎片挂标记组件，再用 USEITEM 注册「拿碎片点目标」的动作
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
	if not HasDurability(target) then
		return
	end

	for _, tag in ipairs(DONE_TAGS) do
		if target:HasTag(tag) then
			return
		end
	end

	table.insert(actions, ACTIONS.M_INFINITY_CHARGE)
end)
