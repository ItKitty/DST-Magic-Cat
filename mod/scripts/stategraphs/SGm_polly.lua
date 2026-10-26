-- SGm_polly
-- 鹦鹉自己的状态机：悬停 / 滑翔移动 / 捡（take）/ 交（give）/ 俯冲登场（glide）/ 飞走（flyaway）。
--
-- 出场、退场对照原版 SGpolly_rogers:332-442：
--   glide  ：在 y = 15 生成，靠 motorvel 向下俯冲，y <= 0.5 时落地并播 "land"，再回悬停
--   flyaway：takeoff_vertical/diagonal 两段 + 向上 motorvel 飞走
-- 唯一差异：原版飞走时会 inst.hat.components.spawner:GoHome(inst) 收回帽子，
-- 我们是护符直接生成的，没有 hat，所以改成升空一小段时间后 Remove。
--
-- 常态一直是悬停（原版是地面/空中交替，我们要的是"一直飞"）。

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
	-- 出场：从高空俯冲下来（逐行对照 SGpolly_rogers:396-442）
	State{
		name = "glide",
		tags = { "idle", "flight", "notarget", "busy", "noelectrocute" },

		onenter = function(inst)
			inst.readytogather = nil
			inst:AddTag("NOCLICK")
			if not inst.AnimState:IsCurrentAnimation("glide") then
				inst.AnimState:PlayAnimation("glide", true)
			end
			inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
			inst.Physics:SetMotorVel(0, math.random() * 10 - 20, 0)
		end,

		timeline =
		{
			TimeEvent(1 * FRAMES, function(inst)
				if inst.components.inventoryitem == nil or not inst.components.inventoryitem:IsHeld() then
					inst.SoundEmitter:PlaySound(inst.sounds.flyin)
				end
			end),
		},

		onupdate = function(inst)
			local x, y, z = inst.Transform:GetWorldPosition()

			if y < 2 then
				inst.Physics:SetMotorVel(0, 0, 0)
			end

			if y <= 0.5 then
				inst.Physics:Stop()
				inst.Physics:Teleport(x, 0, z)
				inst.AnimState:PlayAnimation("land")
				inst.DynamicShadow:Enable(true)
				if inst.components.floater ~= nil then
					inst:PushEvent("on_landed")
				end
				inst.sg:GoToState("idle_ground", true)
			end
		end,

		onexit = function(inst)
			inst:RemoveTag("NOCLICK")
			inst.readytogather = true
		end,
	},

	-- 触地状态（逐行对照 SGpolly_rogers:133-172）
	-- 唯一差异：原版会在原地赖一会儿再随机 switch/peck/hop/caw，
	-- 我们要「常态一直在飞」，所以停留 1~2 秒后直接起飞回悬停。
	State{
		name = "idle_ground",
		tags = { "idle", "canrotate", "ground" },

		onenter = function(inst, pushanim)
			inst:RemoveTag("flying")
			if pushanim then
				if type(pushanim) == "string" then
					inst.AnimState:PlayAnimation(pushanim)
				end
				inst.AnimState:PushAnimation("idle_ground", true)
			elseif not inst.AnimState:IsCurrentAnimation("idle_ground") then
				inst.AnimState:PlayAnimation("idle_ground", true)
			end
			inst.sg:SetTimeout(1 + math.random())
		end,

		ontimeout = function(inst)
			inst:AddTag("flying")
			inst.sg:GoToState("idle")
		end,
	},

	-- 飞走：向上冲，随后消失
	State{
		name = "flyaway",
		tags = { "flight", "busy", "notarget", "flyaway" },

		onenter = function(inst)
			inst.components.locomotor:Stop()
			inst:ClearBufferedAction()
			inst:AddTag("NOCLICK")
			inst.DynamicShadow:Enable(false)
			inst.SoundEmitter:KillSound("fly_lp")
			inst.SoundEmitter:PlaySound("monkeyisland/pollyroger/takeoff")

			if inst.components.inventory ~= nil then
				inst.components.inventory:DropEverything()
			end

			if math.random() < 0.5 then
				inst.sg.statemem.vert = true
				inst.AnimState:PlayAnimation("takeoff_vertical_pre")
				inst.AnimState:PushAnimation("takeoff_vertical_loop", true)
			else
				inst.AnimState:PlayAnimation("takeoff_diagonal_pre")
				inst.AnimState:PushAnimation("takeoff_diagonal_loop", true)
			end

			inst.sg:SetTimeout(0.1 + math.random() * 0.2)
		end,

		-- 上升照原版 SGpolly_rogers:366-372 用 motorvel
		ontimeout = function(inst)
			if inst.sg.statemem.vert then
				inst.Physics:SetMotorVel(math.random() * 4 - 2, math.random() * 5 + 15, math.random() * 4 - 2)
			else
				inst.Physics:SetMotorVel(math.random() * 8 + 8, math.random() * 5 + 15, math.random() * 4 - 2)
			end

			-- 原版这里是 GoHome 收回帽子；我们没有帽子，升起来后删掉
			inst:DoTaskInTime(0.45, function(inst2)
				if inst2:IsValid() then
					inst2:Remove()
				end
			end)
		end,
	},

	-- 常态：一直悬停飞行（对照原版 SGpolly_rogers:64-83）
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

-- 默认状态就是 "glide"：对照原版 SGpolly_rogers 的
--   CommonStates.AddInitState(states, "glide")
--   return StateGraph("polly_rogers", states, events, "init", actionhandlers)
-- 也就是说原版鹦鹉一生成就在滑翔下降，而不是等外部推事件。
return StateGraph("SGm_polly", states, events, "glide", actionhandlers)
