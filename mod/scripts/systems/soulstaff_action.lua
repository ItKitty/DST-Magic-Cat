-- 灵魂法杖：右键切换「吸血形态」
-- 照抄原版磁力信标（boatmagnetbeacon）的做法：定义一对开关动作，
-- 在 INVENTORY 组件动作里根据 turnedon 标签决定右键显示「开启」还是「关闭」。

local function GetStaff(act)
	return act.invobject or act.target
end

local function DoTurnOn(act)
	local staff = GetStaff(act)
	if staff ~= nil and staff.components.machine ~= nil and not staff.components.machine:IsOn() then
		staff.components.machine:TurnOn()
		return true
	end
	return false
end

local function DoTurnOff(act)
	local staff = GetStaff(act)
	if staff ~= nil and staff.components.machine ~= nil and staff.components.machine:IsOn() then
		staff.components.machine:TurnOff()
		return true
	end
	return false
end

local SOULSTAFF_ON = AddAction("M_SOULSTAFF_ON", "开启吸血形态", DoTurnOn)
SOULSTAFF_ON.rmb = true
SOULSTAFF_ON.priority = 3
SOULSTAFF_ON.mount_valid = true

local SOULSTAFF_OFF = AddAction("M_SOULSTAFF_OFF", "关闭吸血形态", DoTurnOff)
SOULSTAFF_OFF.rmb = true
SOULSTAFF_OFF.priority = 3
SOULSTAFF_OFF.mount_valid = true

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(SOULSTAFF_ON, "doshortaction"))
AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(SOULSTAFF_OFF, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(SOULSTAFF_ON, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(SOULSTAFF_OFF, "doshortaction"))

-- 右键背包里 / 手上的法杖直接切换形态（不用打开任何界面）
AddComponentAction("INVENTORY", "machine", function(inst, doer, actions, right)
	if not right or not inst:HasTag("m_soulstaff") then
		return
	end
	if inst:HasTag("turnedon") then
		table.insert(actions, GLOBAL.ACTIONS.M_SOULSTAFF_OFF)
	else
		table.insert(actions, GLOBAL.ACTIONS.M_SOULSTAFF_ON)
	end
end)
