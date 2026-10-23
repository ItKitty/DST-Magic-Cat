require("stategraphs/commonstates")

local actionhandlers = {
    ActionHandler(ACTIONS.ATTACK, "fireattack")
}

local events = {
    EventHandler("locomote", function(inst)
        if not inst.sg:HasStateTag("busy") then
            local is_moving = inst.sg:HasStateTag("moving")
            local wants_to_move = inst.components.locomotor:WantsToMoveForward()
            if is_moving ~= wants_to_move then
                if wants_to_move then
                    inst.sg.statemem.wantstomove = true
                else
                    -- inst.sg:GoToState("moving")
                    inst.sg:GoToState("idle")
                end
            end
        end
    end),
    CommonHandlers.OnFreeze(),
    EventHandler("attacked", function(inst)
        inst.sg:GoToState("idle")
    end),
    EventHandler("doattack", function(inst, data)
        inst.sg:GoToState("fireattack", data.target)

    end)
}

local states = {

    State {
        name="moving",
        tags={
            "moving",
            "canrotate"
        },

        onenter=function(inst)
            inst.components.locomotor:WalkForward()
            inst.AnimState:PlayAnimation("flight_cycle", true)
            -- inst.AnimState:PlayAnimation("idle_flight_loop")
        end
    },
    State {
        name="idle",
        tags={
            "idle",
            "canrotate"
        },

        onenter=function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("flight_cycle", true)
            -- inst.AnimState:PlayAnimation("idle_flight_loop")
        end,

        events={
            EventHandler("animover", function(inst)
                if inst.sg.statemem.wantstomove then
                    inst.sg:GoToState("moving")
                else
                    inst.sg:GoToState("idle")
                end
            end)
        }
    },

    State {
        name="fireattack",
        tags={
            "attack",
            "busy",
            "canrotate",
            "throwing"
        },

        onenter=function(inst)
            inst.Physics:Stop()
            -- inst.AnimState:PlayAnimation("flight_cycle", true)
            inst.AnimState:PlayAnimation("idle_flight_loop")
        end,

        -- 751
        timeline={
            TimeEvent(0 * FRAMES, function(inst)
                inst.components.combat:DoAttack()
            end)
        },

        events={
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end)
        }
    },

    -- buff
    State {
        name="buff",
        tags={
            "attack",
            "busy"
        },

        onenter=function(inst, target)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("taunt")
        end,

        timeline={
            TimeEvent(30 * FRAMES, function(inst)
                inst:AddBuff()
            end)
        },

        events={
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end)
        }
    }

}
CommonStates.AddFrozenStates(states)

return StateGraph("lightpet", states, events, "idle", actionhandlers)

