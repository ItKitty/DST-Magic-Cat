-- m_kitcoonbrain
-- 浣猫崽专用的简单大脑：只做「跟着主人 + 附近闲逛 + 站着」三件事。
-- 特意不复用原版 crittersbrain：原版小动物跟随距离写死 4 / 4.5，
-- 和玩家同时带着的原版宠物会挤在同一个位置，看起来重叠。
-- 这里把跟随距离收紧到 2.5 / 3.2，让它贴着主人脚边，和原版宠物分开。

require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/standstill"

local FOLLOW_DIST = 2.5
local MAX_FOLLOW_DIST = 3.2
local WANDER_DIST = 4
local WANDER_PERIOD = 6

local function GetOwner(inst)
	return inst.components.follower ~= nil and inst.components.follower:GetLeader() or nil
end

local KitcoonBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function KitcoonBrain:OnStart()
	local root = PriorityNode(
		{
			Follow(self.inst, GetOwner, 0, FOLLOW_DIST, MAX_FOLLOW_DIST),
			FaceEntity(self.inst, GetOwner),
			Wander(self.inst, function()
				return self.inst:GetPosition()
			end, WANDER_DIST, WANDER_PERIOD),
			StandStill(self.inst),
		},
		0.25
	)

	self.bt = BT(self.inst, root)
end

return KitcoonBrain
