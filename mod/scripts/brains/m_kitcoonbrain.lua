-- m_kitcoonbrain
-- 浣猫崽专用的简单大脑：跟主人 + 附近闲逛 + 站着。
-- 特意不复用原版 crittersbrain：原版小动物跟随距离写死 4 / 4.5，
-- 和玩家同时带着的原版宠物会挤在同一个位置，看起来重叠。
-- 这里把跟随距离收紧到 2.5 / 3.2，让它贴着主人脚边。

require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/standstill"

local FOLLOW_DIST = 2.5
local MAX_FOLLOW_DIST = 3.2
local WANDER_DIST = 4

local function GetOwner(inst)
	return inst.components.follower ~= nil and inst.components.follower:GetLeader() or nil
end

local KitcoonBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function KitcoonBrain:OnStart()
	local root = PriorityNode(
		{
			-- 有主人：跟着走 / 面向主人 / 站着
			WhileNode(function()
				return GetOwner(self.inst) ~= nil
			end, "Has owner", PriorityNode({
				Follow(self.inst, GetOwner, 0, FOLLOW_DIST, MAX_FOLLOW_DIST),
				FaceEntity(self.inst, GetOwner),
				StandStill(self.inst),
			}, 0.25)),
			-- 没主人：原地附近闲逛（Wander 的第 4 个参数是 times 表，不是数字）
			Wander(self.inst, function()
				return self.inst:GetPosition()
			end, WANDER_DIST),
			StandStill(self.inst),
		},
		0.25
	)

	self.bt = BT(self.inst, root)
end

return KitcoonBrain
