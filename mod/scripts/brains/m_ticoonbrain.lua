-- m_ticoonbrain
-- 玛德琳的浣猫崽专用大脑，基于原版 ticoonbrain 精简：
--   · 保留      ：跟随主人、面向主人、发呆、受惊逃跑（PanicWhenScared / PanicTrigger）
--   · 去掉      ：ChaseAndAttack（不复仇、不主动打架）
--   · 去掉      ：Tracking Kitcoon / questowner 那一整套「找小浣猫」任务逻辑
--   · 新增      ：附近「真的在打架」时跑开（逻辑照抄 crittersbrain 的
--                  CombatAvoidance，只认正在交战的目标，不是见到带血的就跑）
--   · 跟随距离  ：2.5 / 3.2，比原版小动物（4 / 4.5）更贴近主人

require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/runaway"
require "behaviours/standstill"

local BrainCommon = require "brains/braincommon"

local MIN_FOLLOW_DIST = 0
local TARGET_FOLLOW_DIST = 2.5
local MAX_FOLLOW_DIST = 3.2

local WANDER_DIST = 4

-- 战斗躲避参数（数值对齐原版 crittersbrain）
local COMBAT_TOO_CLOSE_DIST = 5
local COMBAT_SAFE_TO_WATCH_FROM_DIST = 8
local COMBAT_TIMEOUT = 6

local COMBAT_TOO_CLOSE_DIST_SQ = COMBAT_TOO_CLOSE_DIST * COMBAT_TOO_CLOSE_DIST
local COMBAT_SAFE_TO_WATCH_FROM_DIST_SQ = COMBAT_SAFE_TO_WATCH_FROM_DIST * COMBAT_SAFE_TO_WATCH_FROM_DIST

local TicoonBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

local function GetLeader(inst)
	return inst.components.follower ~= nil and inst.components.follower:GetLeader() or nil
end

local function KeepFaceTargetFn(inst, target)
	return GetLeader(inst) == target
end

-- 判断某个目标是不是「真的在打架」，而不是只要有血就跑。
-- 判定条件（任何时候命中一条即算）：
--   1. 它在攻击我们的主人（或把主人当目标）
--   2. 它自己有战斗目标，而且离主人很近
--   3. 主人最近打过它 / 它最近打过主人
local function IsRealCombatThreat(inst, target)
	if target == nil or not target:IsValid() then
		return false
	end

	local leader = GetLeader(inst)
	if target == leader then
		return false
	end

	local leader_combat = leader ~= nil and leader.components.combat or nil
	local target_combat = target.components.combat
	if leader_combat == nil or target_combat == nil then
		return false
	end

	if target_combat:TargetIs(leader)
		or (target.components.grouptargeter ~= nil and target.components.grouptargeter:IsTargeting(leader))
	then
		return true
	end

	local distsq = leader:GetDistanceSqToInst(target)
	if distsq >= COMBAT_SAFE_TO_WATCH_FROM_DIST_SQ then
		-- 太远，不管
		return false
	elseif distsq < COMBAT_TOO_CLOSE_DIST_SQ and target_combat:HasTarget() then
		-- 离主人太近，而且它正在打别人
		return true
	end

	local t = GetTime()
	return ((leader_combat:IsRecentTarget(target) or target_combat:HasTarget())
		and math.max(leader_combat.laststartattacktime or 0, leader_combat.lastdoattacktime or 0) + COMBAT_TIMEOUT > t)
		or (leader_combat.lastattacker == target
			and leader_combat:GetLastAttackedTime() + COMBAT_TIMEOUT > t)
end

function TicoonBrain:OnStart()
	local root = PriorityNode(
		{
			WhileNode(function()
				return not self.inst.sg:HasStateTag("jumping")
			end, "not jumping", PriorityNode({
				BrainCommon.PanicWhenScared(self.inst),
				BrainCommon.PanicTrigger(self.inst),
				BrainCommon.ElectricFencePanicTrigger(self.inst),

				-- 附近真的打起来了才躲开：只认正在交战的目标
				RunAway(self.inst, {
					tags = { "_combat", "_health" },
					notags = { "wall", "INLIMBO", "INVISIBLE" },
					fn = function(ent)
						return IsRealCombatThreat(self.inst, ent)
					end,
				}, COMBAT_TOO_CLOSE_DIST, COMBAT_SAFE_TO_WATCH_FROM_DIST),

				Follow(self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
				FaceEntity(self.inst, GetLeader, KeepFaceTargetFn),
				StandStill(self.inst),
			}, 0.25)),
		},
		0.25
	)

	self.bt = BT(self.inst, root)
end

return TicoonBrain
