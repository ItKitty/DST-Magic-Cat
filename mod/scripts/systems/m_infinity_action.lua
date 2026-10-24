-- ============================================================================
-- 无限充能（M_INFINITY_CHARGE）
-- 用「启迪碎片 alterguardianhatshard」对带耐久的装备/建筑使用，使其耐久变成无限：
--   · 护甲      armor       不再掉耐久
--   · 工具/武器  finiteuses  不再消耗
--   · 火堆/燃料  fueled      不再减少（火堆会一直点着）
-- 动作显示名：无限充能
--
-- 两条注册路径，覆盖两种操作习惯：
--   1) SCENE  : 碎片放在背包里，直接右键目标 → 自动从背包找碎片
--   2) USEITEM: 把碎片拿在鼠标上再点目标（原版“使用道具”的方式）
-- 只有目标真的带耐久、且没充过，才会出现这个动作，不会和其它动作抢
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

-- 玩家背包里有没有碎片（客户端用 replica，服务端用 components）
local function DoerHasShard(doer)
	local replica_inv = doer.replica ~= nil and doer.replica.inventory or nil
	if replica_inv ~= nil and replica_inv:Has(SHARD_PREFAB, 1) then
		return true
	end

	local inv = doer.components ~= nil and doer.components.inventory or nil
	return inv ~= nil and inv:Has(SHARD_PREFAB, 1) or false
end

-- 服务端执行时真正取出一个碎片
local function FindShardItem(doer)
	local inv = doer.components ~= nil and doer.components.inventory or nil
	if inv == nil then
		return nil
	end

	return inv:FindItem(function(item)
		return item.prefab == SHARD_PREFAB
	end)
end

local function CanOfferCharge(target, doer)
	if doer == nil or doer.prefab ~= "madeleine" then
		return false
	end
	if not HasDurability(target) then
		return false
	end

	for _, tag in ipairs(DONE_TAGS) do
		if target:HasTag(tag) then
			return false
		end
	end

	return DoerHasShard(doer)
end

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
		shard = FindShardItem(act.doer)
	end
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

ACTION.distance = 3
ACTION.mount_valid = true
-- 优先级压低：不要盖掉同一目标上原版的其它动作
ACTION.priority = 1

-- 动作状态：用原版的短动作，不新增状态
AddStategraphActionHandler("wilson", ActionHandler(ACTION, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTION, "doshortaction"))

-- ---------------------------------------------------------------------------
-- 路径一：右键世界里的目标（碎片放在背包里就行）
-- ---------------------------------------------------------------------------
local function OnSceneCollect(inst, doer, actions, right)
	if CanOfferCharge(inst, doer) then
		table.insert(actions, ACTIONS.M_INFINITY_CHARGE)
	end
end

AddComponentAction("SCENE", "fueled", OnSceneCollect)
AddComponentAction("SCENE", "armor", OnSceneCollect)
AddComponentAction("SCENE", "finiteuses", OnSceneCollect)

-- ---------------------------------------------------------------------------
-- 路径二：把碎片拿在鼠标上再点目标（原版 USEITEM 流程）
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
