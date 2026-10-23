-- 服务器端动作处理器修改

----------------------- 镰刀横劈 --------------------------------
AddStategraphPostInit("wilson", function(sg)
	local actionhandlers = sg.actionhandlers
	local Attack_Old = actionhandlers[ACTIONS.ATTACK].deststate

	actionhandlers[ACTIONS.ATTACK].deststate = function(inst, action)
		inst.sg.mem.localchainattack = not action.forced or nil
		local playercontroller = inst.components.playercontroller
		local attack_tag = playercontroller ~= nil
				and playercontroller.remote_authority
				and playercontroller.remote_predicting
				and "abouttoattack"
			or "attack"

		if
			not (
				inst.sg:HasStateTag(attack_tag) and action.target == inst.sg.statemem.attacktarget
				or inst.components.health:IsDead()
			)
		then
			local weapon = inst.components.combat ~= nil and inst.components.combat:GetWeapon() or nil
			if weapon ~= nil then
				if weapon:HasTag("quick_attack") then
					return "quick_attack"
				elseif weapon:HasTag("scythe_attack") then
					return "scythe_attack"
				end
			end
		end
		return Attack_Old(inst, action)
	end
end)

-- 客户端动作处理器修改
AddStategraphPostInit("wilson_client", function(sg)
	local actionhandlers = sg.actionhandlers
	local ClientAttack_Old = actionhandlers[ACTIONS.ATTACK].deststate

	actionhandlers[ACTIONS.ATTACK].deststate = function(inst, action)
		if
			not (inst.sg:HasStateTag("attack") and action.target == inst.sg.statemem.attacktarget or IsEntityDead(inst))
		then
			local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
			if equip ~= nil then
				if equip:HasTag("quick_attack") then
					return "quick_attack"
				elseif equip:HasTag("scythe_attack") then
					return "scythe_attack"
				end
			end
		end
		return ClientAttack_Old(inst, action)
	end
end)

AddStategraphState(
	"wilson",
	-- scythe_attack
	State({
		name = "scythe_attack",
		tags = { "attack", "notalking", "abouttoattack", "autopredict", "nointerrupt" },

		onenter = function(inst)
			if inst.components.combat:InCooldown() then
				inst.sg:RemoveStateTag("abouttoattack")
				inst:ClearBufferedAction()
				inst.sg:GoToState("idle", true)
				return
			end
			inst.components.combat:StartAttack()
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("scythe_pre")
			inst.AnimState:PushAnimation("scythe_loop", false)
			local buffaction = inst:GetBufferedAction()
			local target = buffaction ~= nil and buffaction.target or nil

			inst.components.combat:SetTarget(target)
			inst.components.locomotor:Stop()

			if target ~= nil then
				inst.components.combat:BattleCry()
				if target:IsValid() then
					inst:FacePoint(target:GetPosition())
					inst.sg.statemem.attacktarget = target
					inst.sg.statemem.retarget = target
				end
			end
		end,

		timeline = {
			FrameEvent(12, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
			end),
			FrameEvent(13, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
				inst:PerformBufferedAction()
				inst.sg:RemoveStateTag("abouttoattack")
			end),
			FrameEvent(18, function(inst)
				inst.sg:RemoveStateTag("attack")
			end),
			FrameEvent(22, function(inst)
				inst.sg:GoToState("idle", true)
			end),
		},

		events = {
			EventHandler("equip", function(inst)
				inst.sg:GoToState("idle")
			end),
			EventHandler("unequip", function(inst)
				inst.sg:GoToState("idle")
			end),
		},

		onexit = function(inst)
			inst.components.combat:SetTarget(nil)
			if inst.sg:HasStateTag("abouttoattack") then
				inst.components.combat:CancelAttack()
			end
		end,
	})
)

AddStategraphState(
	"wilson_client",
	-- scythe_attack
	State({
		name = "scythe_attack",
		tags = { "attack", "notalking", "autopredict", "nointerrupt" },

		onenter = function(inst)
			local combat = inst.replica.combat
			if combat:InCooldown() then
				inst.sg:RemoveStateTag("abouttoattack")
				inst:ClearBufferedAction()
				inst.sg:GoToState("idle", true)
				return
			end

			combat:StartAttack()
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("scythe_pre")
			inst.AnimState:PushAnimation("scythe_loop", false)
			local buffaction = inst:GetBufferedAction()
			if buffaction ~= nil then
				inst:PerformPreviewBufferedAction()

				if buffaction.target ~= nil and buffaction.target:IsValid() then
					inst:FacePoint(buffaction.target:GetPosition())
					inst.sg.statemem.attacktarget = buffaction.target
					inst.sg.statemem.retarget = buffaction.target
				end
			end
		end,

		timeline = {
			FrameEvent(12, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
			end),
			FrameEvent(13, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
				inst:ClearBufferedAction()
				inst.sg:RemoveStateTag("abouttoattack")
			end),
			FrameEvent(18, function(inst)
				inst.sg:RemoveStateTag("attack")
			end),
			FrameEvent(22, function(inst)
				inst.sg:GoToState("idle", true)
			end),
		},

		events = {
			EventHandler("equip", function(inst)
				inst.sg:GoToState("idle")
			end),
			EventHandler("unequip", function(inst)
				inst.sg:GoToState("idle")
			end),
		},

		onexit = function(inst)
			if inst.sg:HasStateTag("abouttoattack") then
				inst.replica.combat:CancelAttack()
			end
		end,
	})
)
----------------------- 镰刀横劈 --------------------------------

------------------------ 不吃僵硬 ----------------------------------------
-- 状态机事件补丁：无敌期间不进 hit（attacked）、knockback / knockbacklanded
local function PatchAttackedEvent(sg)
	if sg == nil or sg.events == nil then
		return
	end

	-- 内部小工具：按事件名打补丁
	local function PatchOneEvent(event_name)
		-- 优先按 key 拿事件（sg.events["attacked"] / ["knockback"]）
		local ev = sg.events[event_name]

		if ev == nil then
			-- 兜底：部分版本可能是数组形式，退回到遍历
			for _, e in pairs(sg.events) do
				if e ~= nil and e.name == event_name then
					ev = e
					break
				end
			end
		end

		if ev ~= nil and ev.fn ~= nil and not ev._prgm_patched then
			local oldfn = ev.fn
			ev.fn = function(inst, data)
				if inst ~= nil and inst:HasTag("m_not_rigidity") then
					return
				end
				return oldfn(inst, data)
			end
			ev._prgm_patched = true
		end
	end

	-- 拦截 attacked, knockback, knockbacklanded 事件
	PatchOneEvent("attacked")
	PatchOneEvent("knockback")
	PatchOneEvent("knockbacklanded")
end

-- 为服务器和客户端状态图都应用补丁
AddStategraphPostInit("wilson", PatchAttackedEvent)
AddStategraphPostInit("wilson_client", PatchAttackedEvent)
------------------------ 不吃僵硬 ----------------------------------------

---------------------   女武神前摇    --------------------------------
AddStategraphPostInit("wilson", function(sg)
	local oldlungestart = sg.states["combat_lunge_start"].onenter
	sg.states["combat_lunge_start"].onenter = function(inst, ...)
		oldlungestart(inst, ...)

		local weapon = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		if inst.components.colourtweener and weapon and weapon.prefab == "m_catpaw" then
			if inst and inst.AnimState then
				inst.AnimState:PlayAnimation("lunge_lag")
				if inst.PerformBufferedAction then
					inst:PerformBufferedAction()
				end
			end
		end
	end
end)
---------------------   女武神前摇    --------------------------------
