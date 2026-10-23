require("stategraphs/commonstates")

local actionhandlers = {
	ActionHandler(ACTIONS.EAT, "eat"),
}

local events = {
	EventHandler("attacked", function(inst)
		if not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") then
			inst.sg:GoToState("hit")
		end
	end),
	EventHandler("death", function(inst)
		inst.sg:GoToState("death")
	end),
	EventHandler("doattack", function(inst, data)
		if not inst.components.health:IsDead() and (inst.sg:HasStateTag("hit") or not inst.sg:HasStateTag("busy")) then
			if inst:HasTag("hound_healer") then
				if
					data.target:IsValid() -- 8秒一治疗
					and (inst.healtime == nil or GetTime() - inst.healtime >= 8)
				then
					inst.sg:GoToState("heal", data.target)
				else
					inst.sg:GoToState("attack", data.target)
				end
			elseif inst:HasTag("hound_buffer") then
				if
					data.target:IsValid() -- 40秒一加buff
					and (inst.bufftime == nil or GetTime() - inst.bufftime >= 40)
				then
					inst.sg:GoToState("buff", data.target)
				else
					inst.sg:GoToState("attack", data.target)
				end
			else
				inst.sg:GoToState("attack", data.target)
			end
		end
	end),
	CommonHandlers.OnSleep(),
	CommonHandlers.OnHop(),
	CommonHandlers.OnLocomote(true, false),
	CommonHandlers.OnFreeze(),
}

local states = {
	State({
		name = "idle",
		tags = {
			"idle",
			"canrotate",
		},
		onenter = function(inst, playanim)
			inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/pant")
			inst.Physics:Stop()
			if playanim then
				inst.AnimState:PlayAnimation(playanim)
				inst.AnimState:PushAnimation("idle", true)
			else
				inst.AnimState:PlayAnimation("idle", true)
			end

			inst.sg:SetTimeout(2 * math.random() + 0.5)
		end,
	}),
	-- attack
	State({
		name = "attack",
		tags = {
			"attack",
			"busy",
		},

		onenter = function(inst, target)
			inst.sg.statemem.target = target
			inst.Physics:Stop()
			inst.components.combat:StartAttack()
			inst.AnimState:PlayAnimation("atk_pre")
			inst.AnimState:PushAnimation("atk", false)
		end,

		timeline = {
			TimeEvent(12 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/attack")
			end),
			TimeEvent(14 * FRAMES, function(inst)
				inst.components.combat:DoAttack(inst.sg.statemem.target)
			end),
		},

		events = {
			EventHandler("animqueueover", function(inst)
				if math.random() < 0.333 then
					inst.sg:GoToState("taunt")
				else
					inst.sg:GoToState("idle", "atk_pst")
				end
			end),
		},
	}),
	-- eat
	State({
		name = "eat",
		tags = {
			"busy",
		},

		onenter = function(inst, cb)
			inst.Physics:Stop()
			inst.components.combat:StartAttack()
			inst.AnimState:PlayAnimation("atk_pre")
			inst.AnimState:PushAnimation("atk", false)
		end,

		timeline = {
			TimeEvent(14 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/bite")
			end),
		},

		events = {
			EventHandler("animqueueover", function(inst)
				inst.sg:GoToState("idle", "atk_pst")
			end),
		},
	}),
	-- hit
	State({
		name = "hit",
		tags = {
			"busy",
			"hit",
		},

		onenter = function(inst, cb)
			inst.Physics:Stop()
			inst.AnimState:PlayAnimation("hit")
		end,

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),
	-- taunt
	State({
		name = "taunt",
		tags = {
			"busy",
		},

		onenter = function(inst, cb)
			inst.Physics:Stop()
			inst.AnimState:PlayAnimation("taunt")
		end,

		timeline = {
			TimeEvent(13 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/bark")
			end),
			TimeEvent(24 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/bark")
			end),
			TimeEvent(30 * FRAMES, function(inst)
				inst:DoTaunt()
			end),
		},

		events = {
			EventHandler("animover", function(inst)
				if math.random() < 0.333 then
					inst.sg:GoToState("attack")
				else
					inst.sg:GoToState("idle")
				end
			end),
		},
	}),
	-- dismiss
	State({
		name = "dismiss",
		tags = {
			"idle",
		},
		onenter = function(inst, cb)
			inst.Physics:Stop()
			inst.AnimState:PlayAnimation("taunt")
		end,

		timeline = {
			TimeEvent(13 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/bark")
			end),
			TimeEvent(24 * FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/bark")
			end),
		},

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),
	-- death
	State({
		name = "death",
		tags = {
			"busy",
		},

		onenter = function(inst)
			inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/death")
			inst.AnimState:PlayAnimation("death")
			if inst.components.amphibiouscreature ~= nil and inst.components.amphibiouscreature.in_water then
				inst.AnimState:PushAnimation("death_idle", true)
			end
			inst.Physics:Stop()
			RemovePhysicsColliders(inst)
			inst.components.lootdropper:DropLoot(Vector3(inst.Transform:GetWorldPosition()))
		end,
	}),
	-- heal
	State({
		name = "heal",
		tags = {
			"attack",
			"busy",
		},

		onenter = function(inst, target)
			inst.Physics:Stop()
			inst.AnimState:PlayAnimation("taunt")
		end,

		timeline = {
			TimeEvent(30 * FRAMES, function(inst)
				-- inst:DoHeal()
				inst:DoHeal()
			end),
		},

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),
	-- buff
	State({
		name = "buff",
		tags = {
			"attack",
			"busy",
		},

		onenter = function(inst, target)
			inst.Physics:Stop()
			inst.AnimState:PlayAnimation("taunt")
		end,

		timeline = {
			TimeEvent(30 * FRAMES, function(inst)
				inst:AddBuff()
			end),
		},

		events = {
			EventHandler("animover", function(inst)
				inst.sg:GoToState("idle")
			end),
		},
	}),
}

CommonStates.AddAmphibiousCreatureHopStates(states, { -- config
	swimming_clear_collision_frame = 9 * FRAMES,
}, { -- anims
}, { -- timeline
	hop_pre = {
		TimeEvent(0, function(inst)
			if inst:HasTag("swimming") then
				SpawnPrefab("splash_green").Transform:SetPosition(inst.Transform:GetWorldPosition())
			end
		end),
	},
	hop_pst = {
		TimeEvent(4 * FRAMES, function(inst)
			if inst:HasTag("swimming") then
				inst.components.locomotor:Stop()
				SpawnPrefab("splash_green").Transform:SetPosition(inst.Transform:GetWorldPosition())
			end
		end),
		TimeEvent(6 * FRAMES, function(inst)
			if not inst:HasTag("swimming") then
				inst.components.locomotor:StopMoving()
			end
		end),
	},
})

CommonStates.AddSleepStates(states, {
	sleeptimeline = {
		TimeEvent(30 * FRAMES, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/sleep")
		end),
	},
})

CommonStates.AddRunStates(states, {
	runtimeline = {
		TimeEvent(0, function(inst)
			inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/growl")
			if inst:HasTag("swimming") then
				inst.SoundEmitter:PlaySound("turnoftides/common/together/water/splash/jump_small", nil, 0.25)
			else
				if inst:HasTag("clay") then
					PlayClayFootstep(inst)
				else
					PlayFootstep(inst)
				end
			end
		end),
		TimeEvent(4 * FRAMES, function(inst)
			if inst:HasTag("swimming") then
				inst.SoundEmitter:PlaySound("turnoftides/common/together/water/splash/jump_small", nil, 0.25)
			else
				if inst:HasTag("clay") then
					PlayClayFootstep(inst)
				else
					PlayFootstep(inst)
				end
			end
		end),
	},
})
CommonStates.AddFrozenStates(states)

return StateGraph("hound", states, events, "taunt", actionhandlers)
