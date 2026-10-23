require("behaviours/follow")
require("behaviours/wander")
require("behaviours/faceentity")
require("behaviours/panic")
require("behaviours/runaway")

local MIN_FOLLOW_DIST = 1
local MAX_FOLLOW_DIST = 15
local TARGET_FOLLOW_DIST = 6
local MAX_WANDER_DIST = 3
local MAX_CHASE_TIME = 10
local MAX_CHASE_DIST = 40
local RUN_START_DIST = 4
local RUN_STOP_DIST = 5.5

local function GetFaceTargetFn(inst)
	return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
	return inst.components.follower.leader == target
end

local function GetHunter(inst)
	return FindEntity(inst, RUN_START_DIST, function(guy)
		return guy.components.combat and guy.components.combat.target == inst
	end, nil, { "notarget" })
end

local function TargetFollowDistFn(inst)
	local loyalty = inst.components.follower ~= nil and inst.components.follower:GetLoyaltyPercent() or 0.5
	local boatmod = inst:GetCurrentPlatform() ~= nil and 0.2 or 1.0
	return (MAX_FOLLOW_DIST - MIN_FOLLOW_DIST) * (1.0 - loyalty) * boatmod * math.random() + MIN_FOLLOW_DIST
end

local M_HoundBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function M_HoundBrain:OnStart()
	local root = PriorityNode({
		Follow(self.inst, function()
			return self.inst.components.follower.leader
		end, MIN_FOLLOW_DIST, TargetFollowDistFn, MAX_FOLLOW_DIST, nil, true),
		RunAway(self.inst, GetHunter, RUN_START_DIST, RUN_STOP_DIST),
		WhileNode(function()
			return self.inst.components.combat.target ~= nil
		end, "Attack", ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST)),
		FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
		Wander(self.inst, function()
			return self.inst.components.knownlocations:GetLocation("home")
		end, MAX_WANDER_DIST),
	}, 0.25)
	self.bt = BT(self.inst, root)
end

return M_HoundBrain
