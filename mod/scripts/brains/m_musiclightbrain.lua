require("behaviours/leash")

local M_MusicLightBrain = Class(Brain, function(self, inst)
	Brain._ctor(self, inst)
end)

local function GetLeader(inst)
	return inst.owner
end
local function GetScanTarget(inst)
	return GetLeader(inst)
end

--scan position is [scandist] away from target
local DEG_45 = 45 * DEGREES
local function GetScanPos(inst)
	local target = GetScanTarget(inst)
	if target then
		local index = inst.index or 1 --1~3
		local scandist --[[, maxdist]] = inst:CalcScanRange()
		local x1, y1, z1 = target.Transform:GetWorldPosition()
		local theta
		theta = index * 60 * DEGREES
		local SCAN_SPEED = 40 -- 度/秒，360度就是一圈所需秒数
		theta = theta + math.ceil((GetTime() * SCAN_SPEED % 360)) * DEGREES
		theta = theta % 360
		--Snap to nearest 45 degrees, better matches 8-faced beams
		--[[theta = math.floor(theta / DEG_45 + 0.5) * DEG_45]]
		local pos = Vector3(x1 + scandist * math.cos(theta), 0, z1 - scandist * math.sin(theta))

		inst.aimpos = pos

		return pos
	end
end
function M_MusicLightBrain:OnStart()
	local root = PriorityNode({
		WhileNode(
			function()
				return not self.inst.sg:HasStateTag("despawn")
			end,
			"<busy state guard>",
			PriorityNode({
				PriorityNode({
					ActionNode(function()
						local pos = GetScanPos(self.inst)
						if self.inst.aimpos then
							self.inst:SetScanTarget(self.inst.owner)
							local target = self.inst:GetScanTarget()
							if target then
								self.inst:ForceFacePoint(target.Transform:GetWorldPosition())
							end
							self.inst.speed = math.sqrt(distsq(self.inst:GetPosition(), self.inst.aimpos)) * 10
							if self.inst.speed > 24 then
								self.inst.components.locomotor:Stop()
								self.inst.Transform:SetPosition(self.inst.aimpos:Get())
							else
								self.inst.components.locomotor.strafedir =
									self.inst:GetAngleToPoint(self.inst.aimpos:Get())

								self.inst.components.locomotor:SetMotorSpeed(self.inst.speed)
							end
						end
						self.inst:PushEventImmediate("ms_wx_shadowdrone_scan")
					end),
				}, FRAMES),
			}, FRAMES)
		),
	}, 0.1)

	self.bt = BT(self.inst, root)
end

return M_MusicLightBrain
