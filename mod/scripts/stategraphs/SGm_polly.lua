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
	-- 出场：从高空俯冲下来，落地后再升起悬停
	-- 注意：这里不依赖 Physics:SetMotorVel —— 我们的宠物用的是幽灵物理（无碰撞），
	-- motorvel 在它身上不生效，鹦鹉会一直卡在 y = 15 只剩个影子。
	-- 改成每帧直接 Teleport 下降，稳定可控。
	State{
		name = "glide",
		tags = { "busy", "flight" },

		onenter = function(inst)
			inst:AddTag("NOCLICK")
			inst.AnimState:PlayAnimation("glide", true)
			inst.SoundEmitter:PlaySound("dontstarve/birds/flyin")
			inst.Physics:Stop()
			-- 兜底：5 秒还没落地就强行落地
			inst.sg:SetTimeout(5)
		end,

		onupdate = function(inst, dt)
			if inst.sg.statemem.landed then
				return
			end

			local x, y, z = inst.Transform:GetWorldPosition()
			local newy = y - 9 * dt
			if newy > 0 then
				inst.Physics:Teleport(x, newy, z)
			else
				inst.Physics:Stop()
				inst.Physics:Teleport(x, 0, z)
				inst.AnimState:PlayAnimation("land")
				inst.DynamicShadow:Enable(true)
				inst.sg.statemem.landed = true
			end
		end,

		ontimeout = function(inst)
			if not inst.sg.statemem.landed then
				local x, _, z = inst.Transform:GetWorldPosition()
				inst.Physics:Stop()
				inst.Physics:Teleport(x, 0, z)
				inst.DynamicShadow:Enable(true)
				inst.sg.statemem.landed = true
				inst.AnimState:PlayAnimation("land")
			end
		end,

		events =
		{
			EventHandler("animover", function(inst)
				if inst.sg.statemem.landed then
					inst.sg:GoToState("idle")
				end
			end),
		},

		onexit = function(inst)
			inst:RemoveTag("NOCLICK")
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

		-- 上升同样不用 motorvel，直接每帧 Teleport（幽灵物理不吃 motorvel）
		ontimeout = function(inst)
			inst.sg.statemem.rising = true
			-- 原版这里是 GoHome 收回帽子；我们没有帽子，升起来后删掉
			inst:DoTaskInTime(0.45, function(inst2)
				if inst2:IsValid() then
					inst2:Remove()
				end
			end)
		end,

		onupdate = function(inst, dt)
			if inst.sg.statemem.rising then
				local x, y, z = inst.Transform:GetWorldPosition()
				inst.Physics:Teleport(x, y + 14 * dt, z)
			end
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

return StateGraph("SGm_polly", states, events, "idle", actionhandlers)
