local _G = GLOBAL

-- ---------------------------------------------------------------------------
-- 动作：M_INFINITY_CHARGE
-- ---------------------------------------------------------------------------
local INFINITY_CHARGE_ACTION = AddAction("M_INFINITY_CHARGE", "充能", function(act)
	if
		act.doer ~= nil
		and act.target ~= nil
		and act.target:IsValid()
		and act.invobject ~= nil
		and act.invobject.prefab == "alterguardianhatshard"
		and act.doer.prefab == "madeleine"
		and act.target.components.m_infinity_charge ~= nil
	then
		if not GLOBAL.TheWorld.ismastersim then
			return true
		end

		return act.target.components.m_infinity_charge:Charge(act.doer, act.invobject)
	end

	return false
end)

INFINITY_CHARGE_ACTION.priority = 11
INFINITY_CHARGE_ACTION.distance = 3
INFINITY_CHARGE_ACTION.mount_valid = true

-- 状态机
AddStategraphActionHandler("wilson", _G.ActionHandler(INFINITY_CHARGE_ACTION, "doshortaction"))
AddStategraphActionHandler("wilson_client", _G.ActionHandler(INFINITY_CHARGE_ACTION, "doshortaction"))

-- ---------------------------------------------------------------------------
-- 动作注册：USEITEM + 目标带 m_infinity_chargeable
-- ---------------------------------------------------------------------------
AddComponentAction("USEITEM", "m_infinity_charge", function(inst, doer, target, actions, right)
	print("[infinity] callback", right, inst and inst.prefab, doer and doer.prefab, target and target.prefab)
	if
		doer.prefab == "madeleine"
		and inst.prefab == "alterguardianhatshard"
		and target ~= nil
		and target:IsValid()
		and target:HasTag("m_infinity_chargeable")
		and not target:HasAnyTag("m_infinity_firepit", "m_infinity_finiteuses", "m_infinity_armor", "m_infinity_fueled")
	then
		print("[infinity] condition passed, insert action")
		table.insert(actions, _G.ACTIONS.M_INFINITY_CHARGE)
	end
end)
print("[infinity_action] loaded")
