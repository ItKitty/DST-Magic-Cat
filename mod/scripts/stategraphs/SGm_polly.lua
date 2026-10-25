-- SGm_polly
-- 鹦鹉自己的状态机：地面待机 / 走 / 捡（take）/ 交（give）/ 跳。
-- 不抄原版 SGpolly_rogers 的关键原因：它默认从 "init" → "glide" 起步，
-- 而且 hit / death / flyaway / despawn 会用到 health、hat.components.spawner，
-- 我们的鹦鹉没有生命值也不挂在帽子上。

require("stategraphs/commonstates")

local actionhandlers =
{
	ActionHandler(ACTIONS.PICKUP, "take"),
	ActionHandler(ACTIONS.CHECKTRAP, "take"),
	ActionHandler(ACTIONS.GIVE, "give"),
	ActionHandler(ACTIONS.GIVEALLTOPLAYER, "give"),
	ActionHandler(ACTIONS.DROP, "give"),
}

local events =
{
	CommonHandlers.OnLocomote(false, true),
	CommonHandlers.OnHop(),
}

local states =
{
	-- 召唤登场：从空中落下来
	State{
		name = "summon_land",
		tags = { "busy" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("land")
		end,

		events =
		{
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	},

	-- 收回：垂直飞走，播完再删除自己
	State{
		name = "despawn_fly",
		tags = { "busy" },

		onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("takeoff_vertical_pre")
			-- 兜底：万一动画播不完也不会永远留着
			inst.sg:SetTimeout(1.2)
		end,

		ontimeout = function(inst)
			if inst:IsValid() then
				inst:Remove()
			end
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst:IsValid() then
					inst:Remove()
				end
			end),
		},
	},

	-- 常态：一直悬停飞行（对照原版 SGpolly_rogers 的 "idle" 状态）
	State{
		name = "idle",
		tags = { "idle", "canrotate", "flying" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst:AddTag("flying")
			if not inst.AnimState:IsCurrentAnimation("idle") then
				inst.AnimState:PlayAnimation("idle", true)
			end
			if not inst.SoundEmitter:PlayingSound("fly_lp") then
				inst.SoundEmitter:PlaySound("monkeyisland/pollyroger/flap_lp", "fly_lp")
			end
		end,

		onexit = function(inst)
			inst.SoundEmitter:KillSound("fly_lp")
		end,
	},

	State{
		name = "walk_start",
		tags = { "moving", "canrotate" },

		-- 一直飞着：不走地面那套 walk_pre，直接接飞行循环
		onenter = function(inst)
			inst.sg:GoToState("walk")
		end,
	},

	State{
		name = "walk",
		tags = { "moving", "canrotate", "flying" },

		onenter = function(inst)
			inst:AddTag("flying")
			inst.components.locomotor:WalkForward()
			if not inst.AnimState:IsCurrentAnimation("glide") then
				inst.AnimState:PlayAnimation("glide", true)
			end
			if not inst.SoundEmitter:PlayingSound("fly_lp") then
				inst.SoundEmitter:PlaySound("monkeyisland/pollyroger/flap_lp", "fly_lp")
			end
		end,

		onexit = function(inst)
			inst.SoundEmitter:KillSound("fly_lp")
		end,
	},

	State{
		name = "walk_stop",
		tags = { "canrotate" },

		-- 停下就直接回悬停
		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.sg:GoToState("idle")
		end,
	},

	-- 捡东西
	State{
		name = "take",
		tags = { "busy" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("take")
		end,

		timeline =
		{
			TimeEvent(7 * FRAMES, function(inst)
				inst:PerformBufferedAction()
			end),
		},

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("idle")
				end
			end),
		},
	},

	-- 交给主人
	State{
		name = "give",
		tags = { "busy" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("give")
		end,

		timeline =
		{
			TimeEvent(4 * FRAMES, function(inst)
				inst:PerformBufferedAction()
			end),
		},

		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("idle")
				end
			end),
		},
	},

	-- 跳（OnHop 需要这个状态）
	State{
		name = "hop",
		tags = { "busy" },

		onenter = function(inst)
			inst.AnimState:PlayAnimation("hop")
		end,

		events =
		{
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	},
}

return StateGraph("SGm_polly", states, events, "idle", actionhandlers)
