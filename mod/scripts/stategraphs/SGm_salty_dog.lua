-- SGm_salty_dog
-- 盐狗自己的状态机：待机 / 走 / 捡（fetch）/ 交（give）/ 抖盐（saltshake）
-- + 上下水 + 出场（summon）/退场（desummon）。
-- 出场、退场的动画与特效对照原版 SGsalty_dog:148-229：
--   summon  ：wave_splash → 隐藏 → 3 帧后现身、向前跳（jump_pre/jump_pst）
--   desummon：丢背包 → jump_pre/jump_pst → 6 帧后 wave_splash → 删除
-- 唯一差异：原版会 inst.hat.components.spawner:GoHome(inst) 把孩子收回帽子，
-- 我们是护符直接生成的，没有 hat，所以改成直接 Remove。

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

	-- 出场：从水花里跳出来
	EventHandler("summon", function(inst)
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("summon")
		end
	end),

	-- 退场：跳一下再化成水花
	EventHandler("desummon", function(inst)
		inst.sg:GoToState("desummon")
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

	-- 出场（对照原版 SGsalty_dog:148-185）
	State{
		name = "summon",
		tags = { "busy" },

		onenter = function(inst)
			local fx = SpawnPrefab("wave_splash")
			if fx ~= nil then
				fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
			end
			inst:Hide()
			inst.Physics:Stop()
		end,

		timeline =
		{
			FrameEvent(3, function(inst)
				inst:Show()
				inst.Physics:SetMotorVel(5, 0, 0)
				inst.AnimState:PlayAnimation("jump_pre")
				inst.AnimState:PushAnimation("jump_pst")
				inst.SoundEmitter:PlaySound("winter2025/saltydog/vocalization")
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

		onexit = function(inst)
			inst.Physics:SetMotorVel(0, 0, 0)
			inst:Show()
		end,
	},

	-- 退场（对照原版 SGsalty_dog:186-229）
	State{
		name = "desummon",
		tags = { "busy" },

		onenter = function(inst)
			if inst.components.inventory ~= nil then
				inst.components.inventory:DropEverything()
			end
			inst.AnimState:PlayAnimation("jump_pre")
			inst.AnimState:PushAnimation("jump_pst")
			inst.SoundEmitter:PlaySound("winter2025/saltydog/vocalization")
			inst.Physics:SetMotorVel(5, 0, 0)
		end,

		timeline =
		{
			FrameEvent(6, function(inst)
				local fx = SpawnPrefab("wave_splash")
				if fx ~= nil then
					fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
				end
				-- 原版这里是 GoHome，我们直接删掉
				inst:DoTaskInTime(0.15, function(inst2)
					if inst2:IsValid() then
						inst2:Remove()
					end
				end)
			end),
		},
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

-- 默认状态保持 "idle"：召唤时由 m_amulet 先摆好位置，再推 "summon" 事件，
-- 这样 wave_splash 才会出现在正确的位置（原版 SGsalty_dog 默认是 summon，
-- 但那是靠帽子 spawner 先定好位置再生成的，我们生成后再定位，顺序不同）
return StateGraph("SGm_salty_dog", states, events, "idle", actionhandlers)
