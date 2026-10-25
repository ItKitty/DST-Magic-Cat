-- SGm_salty_dog
-- 盐狗自己的状态机：待机 / 走 / 捡（fetch）/ 交（give）/ 抖盐（saltshake）+ 上下水。
-- 不抄原版 SGsalty_dog 的关键原因：它默认状态是 "summon"，并且 summon / desummon /
-- despawn 都会去碰 inst.hat.components.spawner（原版是挂在帽子上的召唤物），
-- 我们的盐狗是护符直接生成的，没有 hat，进这些状态会直接报错。

require("stategraphs/commonstates")
require("stategraphs/SGcritter_common")

local actionhandlers =
{
	ActionHandler(ACTIONS.PICKUP, "pickup"),
	ActionHandler(ACTIONS.CHECKTRAP, "pickup"),
	ActionHandler(ACTIONS.GIVE, "give"),
	ActionHandler(ACTIONS.GIVEALLTOPLAYER, "give"),
	ActionHandler(ACTIONS.DROP, "give"),
}

local events =
{
	CommonHandlers.OnLocomote(false, true),
	CommonHandlers.OnHop(),

	EventHandler("saltshake", function(inst)
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("saltshake")
		end
	end),
}

local states =
{
	State{
		name = "idle",
		tags = { "idle", "canrotate" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			if not inst.AnimState:IsCurrentAnimation("idle_loop") then
				inst.AnimState:PlayAnimation("idle_loop", true)
			end
		end,
	},

	-- 捡东西：扑一下
	State{
		name = "pickup",
		tags = { "busy" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("fetch")
			inst.SoundEmitter:PlaySound("meta5/woby/woby_pounce")
			inst.sg:SetTimeout(0.6)
		end,

		ontimeout = function(inst)
			inst:PerformBufferedAction()
			inst.sg:GoToState("idle")
		end,
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
				inst.sg:GoToState("idle")
			end),
		},
	},

	-- 抖盐：把身上的盐甩到地上
	State{
		name = "saltshake",
		tags = { "busy" },

		onenter = function(inst)
			inst.components.locomotor:StopMoving()
			inst.AnimState:PlayAnimation("emote_cute")
			inst.Physics:Stop()
		end,

		timeline =
		{
			FrameEvent(10, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/characters/walter/woby/small/emote_cute_shake")
				inst.SoundEmitter:PlaySound("winter2025/saltydog/salt_shake")
				inst:ShedSalt()
			end),
			FrameEvent(13, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/characters/walter/woby/small/emote_cute_shake")
			end),
		},

		events =
		{
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	},
}

-- 上下水的动画状态
CommonStates.AddAmphibiousCreatureHopStates(states,
	{ -- config
		swimming_clear_collision_frame = 3 * FRAMES,
	},
	{ -- anims
	},
	{ -- timeline
		hop_pre =
		{
			TimeEvent(0, function(inst)
				if inst:HasTag("swimming") then
					SpawnPrefab("splash_green").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
			end),
		},
		hop_pst =
		{
			FrameEvent(4, function(inst)
				if inst:HasTag("swimming") then
					inst.components.locomotor:Stop()
					SpawnPrefab("splash_green").Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
			end),
			FrameEvent(6, function(inst)
				if not inst:HasTag("swimming") then
					inst.components.locomotor:StopMoving()
				end
			end),
		},
	}
)

-- 走路状态（和小动物共用一套 walk_pre / walk_loop / walk_pst）
SGCritterStates.AddWalkStates(states,
	{
		starttimeline =
		{
			TimeEvent(0 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant")
			end),
			TimeEvent(4 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant")
			end),
		},
		walktimeline =
		{
			TimeEvent(1 * FRAMES, function(inst) PlayFootstep(inst, 0.25) end),
			TimeEvent(4 * FRAMES, function(inst) PlayFootstep(inst, 0.25) end),
		},
	}, true)

return StateGraph("SGm_salty_dog", states, events, "idle", actionhandlers)
