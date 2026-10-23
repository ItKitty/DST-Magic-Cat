local NIGHTVISION_COLOURCUBES = {
	day = "images/colour_cubes/mole_vision_off_cc.tex",
	dusk = "images/colour_cubes/mole_vision_on_cc.tex",
	night = "images/colour_cubes/mole_vision_on_cc.tex",
	full_moon = "images/colour_cubes/mole_vision_off_cc.tex",
}

local function NightvisionShenanigans(inst) --transformeddirty except i dont follow naming convention
	if inst.components.playervision ~= nil and inst.replica.chiropteran:IsTransformed(inst) then
		inst.components.playervision:ForceNightVision(true)
		inst.components.playervision:SetCustomCCTable(NIGHTVISION_COLOURCUBES)
	elseif inst.components.playervision ~= nil and not inst.replica.chiropteran:IsTransformed(inst) then
		inst.components.playervision:ForceNightVision(false)
		inst.components.playervision:SetCustomCCTable(nil)
	end
end

--[[----------------------------
    Initilization
----------------------------]]
--
local Chiropteran = Class(function(self, inst)
	self.inst = inst

	self.manualformed = net_bool(inst.GUID, "chiropteran.manualformed")
	self.transformed = net_bool(inst.GUID, "chiropteran.transformed", "transformeddirty")
	self.forceformed = net_bool(inst.GUID, "chiropteran.forceformed")
	self.forceformdark = net_bool(inst.GUID, "chiropteran.forceformdark")
	self.forceformbloodcrazed = net_bool(inst.GUID, "chiropteran.forceformbloodcrazed")

	inst:ListenForEvent("transformeddirty", NightvisionShenanigans)
end)

--[[----------------------------
    Setters
----------------------------]]
--
function Chiropteran:SetTransformed(set, inst)
	self.transformed:set(set)
end

function Chiropteran:SetForceFormed(set)
	self.forceformed:set(set)
end

function Chiropteran:SetManualFormed(set)
	self.manualformed:set(set)
end

function Chiropteran:SetForceFormDark(set)
	self.forceformdark:set(set)
end

function Chiropteran:SetForceFormBloodcrazed(set)
	self.forceformbloodcrazed:set(set)
end

--[[----------------------------
    Getters
----------------------------]]
--
function Chiropteran:IsTransformed(inst)
	if self.inst.components.chiropteran ~= nil then
		return self.inst.components.chiropteran.transformed
	else
		return self.transformed:value()
	end
end

function Chiropteran:IsForceFormed(inst)
	if self.inst.components.chiropteran ~= nil then
		return self.inst.components.chiropteran.forceformed
	else
		return self.forceformed:value()
	end
end

function Chiropteran:IsManualFormed(inst)
	if self.inst.components.chiropteran ~= nil then
		return self.inst.components.chiropteran.manualformed
	else
		return self.manualformed:value()
	end
end

function Chiropteran:IsForceFormDark(inst)
	if self.inst.components.chiropteran ~= nil then
		return self.inst.components.chiropteran.forceformeddark
	else
		return self.forceformeddark:value()
	end
end

function Chiropteran:IsForceFormBloodcrazed(inst)
	if self.inst.components.chiropteran ~= nil then
		return self.inst.components.chiropteran.transformed
	else
		return self.forceformbloodcrazed:value()
	end
end

function Chiropteran:CanTransform(inst)
	local sanity = inst.replica.sanity:GetCurrent() or 0

	if
		inst:HasTag("chiropteran")
			and (not inst:HasTag("sunburning") and not inst:HasTag("playerghost") and not self:IsTransformed(inst) and not inst:HasTag(
				"transform_animated"
			) and sanity > 15)
		or (self:IsTransformed(inst) and not self:IsForceFormed(inst) and not inst:HasTag("transform_animated"))
	then
		return true
	else
		return false
	end
end

return Chiropteran
