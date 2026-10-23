-- ============================================================
-- 右键熄灭矮星
-- 条件：
--   1. doer 必须是 madeleine
--   2. 熄灭 staffcoldlight（冷星）需要装备栏有 m_nooverheat
--   3. 熄灭 heatstar（热星）需要装备栏有 m_nofreezing
-- ============================================================

local EXTINGUISH_DWARFSTAR = AddAction("EXTINGUISH_DWARFSTAR", "熄灭", function(act)
	local target = act.target
	local doer = act.doer
	if target == nil then
		return false
	end
	-- 说话
	if doer ~= nil and doer.components.talker ~= nil then
		if target:HasTag("heatstar") then
			-- doer.components.talker:Say("好烫！")
			doer.components.temperature:SetTemperature(71)
		elseif target.prefab == "staffcoldlight" then
			-- doer.components.talker:Say("好冷！")
			doer.components.temperature:SetTemperature(-1)
		end
	end
	-- 熄灭
	if target.components.hauntable ~= nil and target.components.hauntable.onhaunt ~= nil then
		target.components.hauntable.onhaunt(target)
		return true
	end
	if target.components.timer ~= nil then
		target:PushEvent("timerdone", { name = "extinguish" })
		return true
	end
	return false
end)

EXTINGUISH_DWARFSTAR.priority = 10
EXTINGUISH_DWARFSTAR.rmb = true
EXTINGUISH_DWARFSTAR.distance = 1
EXTINGUISH_DWARFSTAR.mount_valid = true

AddStategraphActionHandler("wilson", ActionHandler(EXTINGUISH_DWARFSTAR, "domediumaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(EXTINGUISH_DWARFSTAR, "domediumaction"))

AddComponentAction("SCENE", "inspectable", function(inst, doer, actions, right)
	if not right then
		return
	end

	-- 必须是 madeleine
	if doer.prefab ~= "madeleine" then
		return
	end

	-- 用 replica，两端都存在
	local inv = doer.replica.inventory
	if inv == nil then
		return
	end

	-- 冷星 staffcoldlight：装备栏需要 m_nooverheat
	if inst.prefab == "staffcoldlight" then
		if inv:EquipHasTag("m_nooverheat") then
			table.insert(actions, EXTINGUISH_DWARFSTAR)
		end
		return
	end

	-- 热星 stafflight / emberlight：装备栏需要 m_nofreezing
	if inst:HasTag("heatstar") then
		if inv:EquipHasTag("m_nofreezing") then
			table.insert(actions, EXTINGUISH_DWARFSTAR)
		end
		return
	end
end)
