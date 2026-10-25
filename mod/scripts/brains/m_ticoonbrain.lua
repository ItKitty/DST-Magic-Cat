-- m_ticoonbrain
-- 玛德琳的浣猫崽专用大脑，基于原版 ticoonbrain 精简：
--   · 保留      ：跟随主人、面向主人、发呆、受惊逃跑（PanicWhenScared / PanicTrigger）
--   · 去掉      ：ChaseAndAttack（不复仇、不主动打架）
--   · 去掉      ：Tracking Kitcoon / questowner 那一整套「找小浣猫」任务逻辑
--   · 新增      ：附近有战斗时自动跑开（RunAway），不参战
--   · 跟随距离  ：2.5 / 3.2，比原版小动物（4 / 4.5）更贴近主人，
--                  同时带原版宠物时不会挤在同一个位置

require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/runaway"
require "behaviours/standstill"

local BrainCommon = require "brains/braincommon"

local MIN_FOLLOW_DIST = 0
local TARGET_FOLLOW_DIST = 2.5
local MAX_FOLLOW_DIST = 3.2

-- 看到多远的战斗就开始躲
local COMBAT_SEE_DIST = 6
-- 跑到离战斗这么远
local COMBAT_SAFE_DIST = 10

local WANDER_DIST = 4

local TicoonBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

local function GetLeader(inst)
	return inst.components.follower ~= nil and inst.components.follower:GetLeader() or nil
end

local function KeepFaceTargetFn(inst, target)
	return GetLeader(inst) == target
end

-- 只躲「敌人」，不躲玩家和同伴
local function IsThreat(v)
	return v ~= nil
		and v:IsValid()
		and not v:HasTag("player")
		and not v:HasTag("companion")
		and not v:HasTag("INLIMBO")
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

				-- 附近有战斗 → 跑开，不参战
				RunAway(self.inst, {
					tags = { "_combat", "_health" },
					notags = { "wall", "INLIMBO", "INVISIBLE" },
					fn = IsThreat,
				}, COMBAT_SEE_DIST, COMBAT_SAFE_DIST),

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
