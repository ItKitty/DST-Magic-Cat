-- ============================================
-- 为 m_soulstaff 添加右键开关交互
-- ============================================

-- 注册自定义动作（第二个参数必须是字符串）
local ToggleAction = AddAction("M_SOULSTAFF_TOGGLE", "切换灵魂法杖", function(act)
	local inst = act.target or act.invobject
	if inst and inst:IsValid() and inst.components.machine then
		local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
		if owner == act.doer then
			if TheNet:IsServer() then
				if inst.components.machine:IsOn() then
					inst.components.machine:TurnOff()
				else
					inst.components.machine:TurnOn()
				end
			else
				SendModRPCToServer(MOD_RPC.m_toggle_soulstaff.ToggleSoulStaff, act.doer, inst)
			end
			return true
		end
	end
	return false
end)

-- 动态文字（覆盖默认显示）
ToggleAction.strfn = function(act)
	local inst = act.target or act.invobject
	if inst and inst:IsValid() and inst.components.machine then
		local ison = inst.components.machine:IsOn()
		return ison and "关闭吸血" or "开启吸血"
	end
	return "切换灵魂法杖"
end

-- 添加组件动作（右键菜单）
AddComponentAction("SCENE", "inventoryitem", function(inst, doer, actions, right)
	if not right then
		return
	end

	if inst.prefab ~= "m_soulstaff" then
		return
	end

	if not inst.components.machine then
		return
	end

	-- 检查是否被当前玩家持有
	local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
	if owner ~= doer then
		return
	end

	-- 检查是否在物品栏中或手持
	if not inst.components.inventoryitem:IsHeld() then
		return
	end

	-- 添加到右键菜单
	table.insert(actions, GLOBAL.ACTIONS.M_SOULSTAFF_TOGGLE)
end)

-- 注册 RPC（服务器端处理）
AddModRPCHandler("m_toggle_soulstaff", "ToggleSoulStaff", function(player, inst)
	if player:HasTag("playerghost") then
		return
	end

	if not inst or not inst:IsValid() then
		return
	end

	local machine = inst.components.machine
	if not machine then
		return
	end

	local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
	if owner ~= player then
		return
	end

	if machine:IsOn() then
		machine:TurnOff()
	else
		machine:TurnOn()
	end
end)
