local _G = GLOBAL

--[[----------------------------
   	Chiropteran Tuning
----------------------------]]
--
TUNING.CHIROPTERAN_RANGE = 2
TUNING.CHIROPTERAN_DAMAGE = 10
TUNING.CHIROPTERAN_DAMAGE_PLAYER = 6
TUNING.CHIROPTERAN_ATTACK_RATE = 0.5

--[[----------------------------
    Silence Footsteps
----------------------------]]
--
local _PlayFootstep = GLOBAL.PlayFootstep
GLOBAL.PlayFootstep = function(inst, ...)
	if inst.nofootsteps and inst.nofootsteps:value() then
		return
	end
	return _PlayFootstep(inst, ...)
end

--[[----------------------------
    Chiropterian Transformations
----------------------------]]
--
AddModRPCHandler("Wyrdelyn", "rpcEventPusher", function(inst)
	inst:PushEvent("chiroptera_toggle")
end)

--[[----------------------------
    Transform Option
----------------------------]]
--

-- The actual transform option
local CHIROPTERA_TRANSFORM = GLOBAL.Action({ priority = 10 })
CHIROPTERA_TRANSFORM.str = "变身蝙蝠"
CHIROPTERA_TRANSFORM.id = "CHIROPTERA_TRANSFORM"
CHIROPTERA_TRANSFORM.rmb = true
CHIROPTERA_TRANSFORM.fn = function(act)
	if GLOBAL.TheWorld.ismastersim then
		act.doer:PushEvent("chiroptera_toggle")
	else
		SendModRPCToServer(MOD_RPC["Wyrdelyn"]["rpcEventPusher"])
	end

	return true
end
AddAction(CHIROPTERA_TRANSFORM)

local transformation_sequence = State({
	name = "transformation_sequence",
	tags = { "busy", "pausepredict", "nomorph", "nodangle" },

	onenter = function(inst)
		inst:AddTag("transform_animated")
		inst.components.locomotor:Stop()
		inst.components.locomotor:Clear()

		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(false)
			inst.components.playercontroller:Enable(false)
		end

		inst.AnimState:OverrideSymbol("shadow_hands", "shadow_skinchangefx", "shadow_hands")
		inst.AnimState:OverrideSymbol("shadow_ball", "shadow_skinchangefx", "shadow_ball")
		inst.AnimState:OverrideSymbol("splode", "shadow_skinchangefx", "splode")

		inst.AnimState:PlayAnimation("idle", false)
		inst.AnimState:PushAnimation("skin_change", false)
	end,

	timeline = {
		-- frame 42 of skin_change is where the character is completely hidden
		TimeEvent(42 * FRAMES, function(inst)
			inst.sg:RemoveStateTag("busy")
			inst:PerformBufferedAction()
			inst:ClearBufferedAction()
		end),
	},

	events = {
		EventHandler("animqueueover", function(inst)
			if inst.AnimState:AnimDone() then
				inst.sg:GoToState("idle")
			end
		end),
	},

	onexit = function(inst)
		inst.AnimState:OverrideSymbol("shadow_hands", "shadow_hands", "shadow_hands")
		inst:RemoveTag("transform_animated")
		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(true)
			inst.components.playercontroller:Enable(true)
		end
	end,
})
AddStategraphState("wilson", transformation_sequence)

local transformation_sequence_client = State({
	name = "transformation_sequence",
	tags = { "busy", "pausepredict", "nomorph", "nodangle" },

	onenter = function(inst)
		inst:AddTag("animated")
		inst.components.locomotor:Stop()
		inst.components.locomotor:Clear()

		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(false)
			inst.components.playercontroller:Enable(false)
		end

		inst.AnimState:OverrideSymbol("shadow_hands", "shadow_skinchangefx", "shadow_hands")
		inst.AnimState:OverrideSymbol("shadow_ball", "shadow_skinchangefx", "shadow_ball")
		inst.AnimState:OverrideSymbol("splode", "shadow_skinchangefx", "splode")

		inst.AnimState:PlayAnimation("idle", false)
		inst.AnimState:PushAnimation("skin_change", false)
	end,

	timeline = {
		-- frame 42 of skin_change is where the character is completely hidden
		TimeEvent(42 * FRAMES, function(inst)
			inst.sg:RemoveStateTag("busy")
			inst:PerformBufferedAction()
			inst:ClearBufferedAction()
		end),
	},

	events = {
		EventHandler("animqueueover", function(inst)
			if inst.AnimState:AnimDone() then
				inst.sg:GoToState("idle")
			end
		end),
	},

	onexit = function(inst)
		inst.AnimState:OverrideSymbol("shadow_hands", "shadow_hands", "shadow_hands")
		inst:RemoveTag("transform_animated")
		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(true)
			inst.components.playercontroller:Enable(true)
		end
	end,
})
AddStategraphState("wilson_client", transformation_sequence_client)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(CHIROPTERA_TRANSFORM, "transformation_sequence"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(CHIROPTERA_TRANSFORM, "transformation_sequence"))

--[[----------------------------
    Revert Option
----------------------------]]
--

-- The actual option
local CHIROPTERA_REVERT = GLOBAL.Action({ priority = 10 })
CHIROPTERA_REVERT.str = "变回原样"
CHIROPTERA_REVERT.id = "CHIROPTERA_REVERT"
CHIROPTERA_REVERT.rmb = true
CHIROPTERA_REVERT.fn = function(act)
	if GLOBAL.TheWorld.ismastersim then
		act.doer:PushEvent("chiroptera_toggle")
	else
		SendModRPCToServer(MOD_RPC["Wyrdelyn"]["rpcEventPusher"])
	end

	return true
end
AddAction(CHIROPTERA_REVERT)

local reverting_sequence = State({
	name = "reverting_sequence",
	tags = { "busy", "pausepredict", "nomorph", "nodangle" },

	onenter = function(inst)
		inst:AddTag("transform_animated")
		inst.components.locomotor:Stop()
		inst.components.locomotor:Clear()
		inst:PerformBufferedAction()
		inst:ClearBufferedAction()

		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(false)
			inst.components.playercontroller:Enable(false)
		end

		inst.AnimState:OverrideSymbol("shadow_hands", "shadow_skinchangefx", "shadow_hands")
		inst.AnimState:OverrideSymbol("shadow_ball", "shadow_skinchangefx", "shadow_ball")
		inst.AnimState:OverrideSymbol("splode", "shadow_skinchangefx", "splode")

		inst.AnimState:PlayAnimation("idle", false)
		inst.AnimState:PushAnimation("skin_change", false)
	end,

	timeline = {
		TimeEvent(33 * FRAMES, function(inst)
			inst.sg:RemoveStateTag("busy")
		end),
	},

	events = {
		EventHandler("animqueueover", function(inst)
			if inst.AnimState:AnimDone() then
				inst.sg:GoToState("idle")
			end
		end),
	},

	onexit = function(inst)
		inst:RemoveTag("transform_animated")
		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(true)
			inst.components.playercontroller:Enable(true)
		end
	end,
})
AddStategraphState("wilson", reverting_sequence)

local reverting_sequence_client = State({
	name = "reverting_sequence",
	tags = { "busy", "pausepredict", "nomorph", "nodangle" },

	onenter = function(inst)
		inst:AddTag("animated")
		inst.components.locomotor:Stop()
		inst.components.locomotor:Clear()
		inst:PerformBufferedAction()
		inst:ClearBufferedAction()

		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(false)
			inst.components.playercontroller:Enable(false)
		end

		inst.AnimState:PlayAnimation("corpse_revive")
	end,

	timeline = {
		TimeEvent(33 * FRAMES, function(inst)
			inst.sg:RemoveStateTag("busy")
		end),
	},

	events = {
		EventHandler("animqueueover", function(inst)
			if inst.AnimState:AnimDone() then
				inst.sg:GoToState("idle")
			end
		end),
	},

	onexit = function(inst)
		inst:RemoveTag("transform_animated")
		if inst.components.playercontroller ~= nil then
			inst.components.playercontroller:EnableMapControls(true)
			inst.components.playercontroller:Enable(true)
		end
	end,
})
AddStategraphState("wilson_client", reverting_sequence_client)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(CHIROPTERA_REVERT, "reverting_sequence"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(CHIROPTERA_REVERT, "reverting_sequence"))

-- Gives option to transform and revert
AddComponentAction("SCENE", "chiropteran", function(inst, doer, actions, right)
	local chiro = inst.replica.chiropteran
	local item = doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if
		right
		and inst:HasTag("player")
		and doer
		and doer == inst
		and item
		and item:HasTag("m_soulstaff")
		and chiro:CanTransform(inst)
	then
		if not chiro:IsTransformed(inst) then
			table.insert(actions, ACTIONS.CHIROPTERA_TRANSFORM)
		else
			table.insert(actions, ACTIONS.CHIROPTERA_REVERT)
		end
	end
end)
