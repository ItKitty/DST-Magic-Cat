-- SGm_kitcoon
-- 玛德琳浣猫崽（m_kitcoon）的专用状态机。
--
-- 为什么单独写一份而不是去 hook 原版 SGticoon：
--   · 原版 SGticoon 是给「任务浣猫崽」用的，idle 里会在 persists == false 时自动 despawn，
--     还会直接读 components.combat.target；walk_stop 里读 entitytracker / questowner。
--   · hook 别人的状态机，一旦别的 mod 也做 stategraph postinit，执行顺序和覆盖关系就不可控。
--   · 这里直接裁一份自己的状态机，只保留我们用得到的部分，互不干扰。
--
-- 保留：走动、eat（喂食）、sleep（睡觉）、受击/冰冻/电击/跳船/落水等通用状态
-- 去掉：找小浣猫任务链（searching / annoyed / waiting / waiting_loop / happy_done / hiss）
--       以及 despawn / despawn_loop（宠物由 m_petleash 存档，不该自己消失）

require("stategraphs/commonstates")

local events = {
	CommonHandlers.OnSleep(),
	CommonHandlers.OnFreeze(),
	CommonHandlers.OnElectrocute(),
	CommonHandlers.OnAttacked(),
	CommonHandlers.OnAttack(),
	CommonHandlers.OnDeath(),
	CommonHandlers.OnLocomote(false, true),
	CommonHandlers.OnHop(),
	CommonHandlers.OnSink(),
	CommonHandlers.OnFallInVoid(),

	-- 喂食：吃到东西时播 eat 动作
	EventHandler("oneat", function(inst)
		if inst.components.health == nil or (not inst.components.health:IsDead() and not inst:HasTag("busy")) then
			inst.sg:GoToState("eat")
		end
	end),
}

local states = {
	State({
		name = "idle",
		tags = { "idle", "canrotate" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("idle_loop")
		end,

		timeline = {
			TimeEvent(25 * FRAMES, function(inst)
				-- inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/swipe_tail")
			end),
		},

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),

	State({
		name = "walk_start",
		tags = { "moving", "canrotate" },

		onenter = function(inst)
			inst.AnimState:PlayAnimation("walk_pre")
		end,

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("walk")
			end),
		},
	}),

	State({
		name = "walk",
		tags = { "moving", "canrotate" },

		onenter = function(inst)
			inst.components.locomotor:WalkForward()
			inst.AnimState:PlayAnimation("walk_loop")
		end,

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("walk")
			end),
		},

		timeline = {
			TimeEvent(FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(8 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(15 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(23 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
		},
	}),

	State({
		name = "walk_stop",
		tags = { "canrotate" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("walk_pst")
		end,

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),

	State({
		name = "eat",
		tags = { "busy" },

		onenter = function(inst)
			inst.Physics:Stop()
			inst.AnimState:PlayAnimation("eat")
			inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/pickup")
		end,

		timeline = {
			TimeEvent(6 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(13 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(20 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(27 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(34 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
			TimeEvent(42 * FRAMES, function(inst)
				PlayFootstep(inst)
			end),
		},

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),
}

-- 受击 / 攻击 / 死亡：宠物没有 combat 和 health，这两套状态实际上进不去，
-- 保留定义只是为了别的事件意外推过来时不至于找不到状态。
-- 攻击时间轴留空，避免在没有 combat 组件时被调用。
CommonStates.AddCombatStates(states, {
	hittimeline = {},

	attacktimeline = {},

	deathtimeline = {
		TimeEvent(1 * FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/death")
		end),
	},
})

-- 睡觉（配合 sleeper 组件）
CommonStates.AddSleepStates(states, {
	starttimeline = {
		TimeEvent(26 * FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/yawn")
		end),
	},

	sleeptimeline = {
		TimeEvent(37 * FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/sleep")
		end),
	},

	waketimeline = {
		TimeEvent(31 * FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/pickup")
		end),
	},
})

CommonStates.AddFrozenStates(states)
CommonStates.AddElectrocuteStates(states)
CommonStates.AddHopStates(states, true)
CommonStates.AddSinkAndWashAshoreStates(states)
CommonStates.AddVoidFallStates(states)

return StateGraph("SGm_kitcoon", states, events, "idle")
