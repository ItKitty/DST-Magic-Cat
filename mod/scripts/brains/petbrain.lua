require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/panic"
require "behaviours/runaway"

local MIN_FOLLOW_DIST = 1
local MAX_FOLLOW_DIST = 7
local TARGET_FOLLOW_DIST = 3

local MAX_WANDER_DIST = 3

local MAX_CHASE_TIME = 3
local MAX_CHASE_DIST = 15

local RUN_START_DIST = 5
local RUN_STOP_DIST = 7

local function GetFaceTargetFn(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function GetHunter(inst)
    return FindEntity(inst, RUN_START_DIST, function(guy)
        return guy.components.combat and guy.components.combat.target == inst
    end, nil, {
        'notarget'
    })
end

local function TargetFollowDistFn(inst)
    local loyalty = inst.components.follower ~= nil and inst.components.follower:GetLoyaltyPercent() or 0.5
    local boatmod = inst:GetCurrentPlatform() ~= nil and 0.2 or 1.0
    return (MAX_FOLLOW_DIST - MIN_FOLLOW_DIST) * (1.0 - loyalty) * boatmod * math.random() + MIN_FOLLOW_DIST
end

local PetBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function PetBrain:OnStart()
    local root = PriorityNode({
        Follow(self.inst, function()
            return self.inst.components.follower.leader
        end, MIN_FOLLOW_DIST, TargetFollowDistFn, MAX_FOLLOW_DIST, nil, true),
        RunAway(self.inst, GetHunter, RUN_START_DIST, RUN_STOP_DIST),
        -- RunAway(self.inst, "minigame_participator", RUN_START_DIST, RUN_STOP_DIST),
        -- WhileNode(function()
        --     -- return self.inst.components.combat.target ~= nil and self.inst.components.combat.target
        --     --            ~= self.inst.components.combat.target:HasTag("player")
        --     return self.inst.components.combat.target ~= nil and not self.inst.components.combat.target:HasTag("player")
        -- end, "Attack", ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST)),
        -- WhileNode(function()
        --     return (self.inst.components.combat.target == nil or not self.inst.components.combat:InCooldown())
        -- end, "AttackMomentarily", ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST)),
        FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
        Wander(self.inst, function()
            return self.inst.components.knownlocations:GetLocation("home")
        end, MAX_WANDER_DIST)

    }, .25)
    self.bt = BT(self.inst, root)
end

return PetBrain
