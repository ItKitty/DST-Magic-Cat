local _G = GLOBAL

-- 添加升级动作
local AMULETUNLOCK_ACTION = AddAction("M_AMULET_UNLOCK", "能力解锁", function(act)
	if
		act.doer ~= nil
		and act.invobject ~= nil
		and act.invobject:HasTag("m_amulet_upgradable")
		and act.target ~= nil
		and act.target:HasTag("m_amulet")
	then
		local item = act.invobject
		local amulet = act.target

		local hasSkill = amulet.components.amulettraits:HasSkill(item.prefab)
		-- 检查是否已经拥有该技能
		if hasSkill then
			if act.doer and act.doer.components.talker then
				act.doer.components.talker:Say("能力已解锁")
			end
			return true -- 返回true表示动作成功执行，但实际没有消耗物品
		end

		-- 执行升级
		local success = amulet.components.amulettraits:Upgrade(item.prefab)
		if success then
			local x, y, z = amulet.Transform:GetWorldPosition()
			SpawnPrefab("fx_book_light").Transform:SetPosition(x, y, z)

			-- 消耗物品
			if item.components.stackable then
				item.components.stackable:Get():Remove()
			else
				item:Remove()
			end
			return true
		else
			if act.doer and act.doer.components.talker then
				act.doer.components.talker:Say("能力已解锁")
			end
		end

		return false
	else
		if act.doer and act.doer.components.talker then
			act.doer.components.talker:Say("无法解锁这个物品")
		end
		return false
	end
end)

AMULETUNLOCK_ACTION.priority = 9
AMULETUNLOCK_ACTION.distance = 3
AMULETUNLOCK_ACTION.mount_valid = true

-- 添加状态机处理
AddStategraphActionHandler("wilson", _G.ActionHandler(AMULETUNLOCK_ACTION, "doshortaction"))
AddStategraphActionHandler("wilson_client", _G.ActionHandler(AMULETUNLOCK_ACTION, "doshortaction"))

-- 简化动作注册：直接为升级材料注册动作
AddComponentAction("USEITEM", "inventoryitem", function(inst, doer, target, actions, right)
	if
		right
		and doer:HasTag("madeleine")
		and inst:HasTag("m_amulet_upgradable")
		and target ~= nil
		and target:HasTag("m_amulet")
	then
		table.insert(actions, _G.ACTIONS.M_AMULET_UNLOCK)
	end
end)
