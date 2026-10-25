-- m_pollybrain
-- 鹦鹉：跟着主人，只捡地上的种子，捡到后飞回去交给主人。
-- 没有战斗、没有逃跑，也不需要生命值。

require "behaviours/follow"
require "behaviours/faceentity"
require "behaviours/standstill"

local PICKUP_RANGE = TUNING.POLLY_ROGERS_RANGE
local GIVE_DIST = 3

local function GetLeader(inst)
	return inst.components.follower ~= nil and inst.components.follower:GetLeader() or nil
end

local function IsSeed(item)
	if item == nil or not item:IsValid() then
		return false
	end
	if item:HasTag("seed") then
		return true
	end
	-- 兜底：seeds / carrot_seeds / corn_seeds ...
	return item.prefab == "seeds" or string.find(item.prefab, "seeds") ~= nil
end

local function PickSeedAction(inst)
	local inventory = inst.components.inventory
	if inventory == nil or inventory:IsFull() then
		return nil
	end

	local item = FindEntity(
		inst,
		PICKUP_RANGE,
		function(v)
			return IsSeed(v)
				and v.components.inventoryitem ~= nil
				and not v.components.inventoryitem:IsHeld()
		end,
		{ "_inventoryitem" },
		{ "INLIMBO", "NOCLICK" }
	)

	return item ~= nil and BufferedAction(inst, item, ACTIONS.PICKUP) or nil
end

local function GiveAction(inst)
	local leader = GetLeader(inst)
	if leader == nil or not leader:IsValid() then
		return nil
	end

	local item = inst.components.inventory:GetFirstItemInAnySlot()
	if item == nil then
		return nil
	end

	local target = leader.components.inventory
	if target == nil or target:CanAcceptCount(item, 1) <= 0 then
		return nil
	end

	return BufferedAction(inst, leader, ACTIONS.GIVEALLTOPLAYER, item)
end

local PollyBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

function PollyBrain:OnStart()
	local root = PriorityNode(
		{
			WhileNode(function()
				return not self.inst.sg:HasStateTag("busy")
			end, "not busy", WhileNode(function()
				local leader = GetLeader(self.inst)
				return leader ~= nil and leader:IsValid()
			end, "has leader", PriorityNode({
				DoAction(self.inst, PickSeedAction, "pick up seeds"),
				DoAction(self.inst, GiveAction, "give seeds to leader"),
				Follow(self.inst, GetLeader, 0, 4, 6),
				FaceEntity(self.inst, GetLeader),
				StandStill(self.inst),
			}, 0.25))),
			StandStill(self.inst),
		},
		0.25
	)

	self.bt = BT(self.inst, root)
end

return PollyBrain
