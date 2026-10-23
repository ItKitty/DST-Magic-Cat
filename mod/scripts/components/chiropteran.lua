local function OnChiropteraToggle(inst)
	local chiro = inst.components.chiropteran
	if not chiro.transformed then
		chiro:SetManualFormed(true)
		chiro:ChiropteraStart(inst)
	else
		chiro:ChiropteraStop(inst)
	end
end

-- If at any time you want to disable the animations for manual uncomment out the normal start/stop and comment out the dotaskintime

--[[----------------------------
    Initilization
----------------------------]]
--
local Chiropteran = Class(function(self, inst)
	self.inst = inst

	self.manualformed = false
	self.transformed = false
	self.forceformed = false
	self.forceformdark = false
	self.forceformbloodcrazed = false

	inst:AddTag("chiropteran")

	inst:ListenForEvent("chiroptera_toggle", OnChiropteraToggle)
end)

--[[----------------------------
    Setting
----------------------------]]
--
function Chiropteran:SetTransformed(set, inst)
	self.transformed = set
	self.inst.replica.chiropteran:SetTransformed(set, inst)
end
function Chiropteran:SetManualFormed(set)
	self.manualformed = set
	self.inst.replica.chiropteran:SetManualFormed(set)
end
function Chiropteran:SetForceFormed(set)
	self.forceformed = set
	self.inst.replica.chiropteran:SetForceFormed(set)
end
function Chiropteran:SetForceFormDark(set)
	self.forceformdark = set
	self.inst.replica.chiropteran:SetForceFormDark(set)
end
function Chiropteran:SetForceFormBloodcrazed(set)
	self.forceformbloodcrazed = set
	self.inst.replica.chiropteran:SetForceFormBloodcrazed(set)
end

function Chiropteran:RevertAll(inst)
	self:SetTransformed(false, inst)
	self:SetManualFormed(false)
	self:SetForceFormed(false)
	self:SetForceFormDark(false)
	self:SetForceFormBloodcrazed(false)
end
--[[----------------------------
    Checking
----------------------------]]
--
function Chiropteran:CanTransform(inst)
	local sanity = inst.replica.sanity:GetCurrent()

	if
		inst:HasTag("chiropteran")
			and (not inst:HasTag("sunburning") and not inst:HasTag("playerghost") and not self.transformed and not inst:HasTag(
				"transform_animated"
			) and sanity > 15)
		or (self.transformed and not self.forceformed and not inst:HasTag("transform_animated"))
	then
		return true
	else
		return false
	end
end

local function RightClickOverride(inst, target)
	if target ~= nil and target == inst and inst:HasTag("chiropteran") then
		inst.components.chiropteran:ChiropteraStop(inst)
		return true and inst.components.playeractionpicker:SortActionList({ ACTIONS.CHIROPTERA_TRANSFORM }, inst, nil)
		-- does nothing but it will crash if i dont include it lol
	else
		return nil
	end
end

--[[----------------------------
    Empty :)
----------------------------]]
--
local function Empty() end

--[[----------------------------
    Force Transform
----------------------------]]
--
function Chiropteran:ForceForm(inst, type)
	self:SetForceFormed(true)
	if type == "dark" then
		self:SetForceFormDark(true)
	elseif type == "bloodcrazed" then
		self:SetForceFormBloodcrazed(true)
	end

	self:ChiropteraStart(inst)
end

function Chiropteran:UnforceForm(inst, type)
	if type == "dark" then
		self:SetForceFormDark(false)
	elseif type == "bloodcrazed" then
		self:SetForceFormBloodcrazed(false)
	end

	if (self.forceformdark == false) and (self.forceformbloodcrazed == false) then
		self:SetForceFormed(false)
		if self.manualformed == false then
			self:ChiropteraStop(inst)
		end
	end
end

--[[----------------------------
    Transformation
----------------------------]]
--

function Chiropteran:ChiropteraStart(inst)
	-- Transform init, sort of
	--[[if inst.components and inst.components.sanity then
		inst.components.sanity:DoDelta(-5, false)
	end]]
	--
	inst:AddTag("monster")
	self:SetTransformed(true, inst)

	-- Actual Bat FX
	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = SpawnPrefab("chiropteran_bats")
	fx.entity:AddFollower()
	fx.Follower:FollowSymbol(inst.GUID, "torso", 0, 0, 0)
	fx.owner = inst
	inst.batfx = fx

	-- Several variables that need to be modified
	inst.components.grue:AddImmunity("chiropteran_flight")
	inst.nofootsteps:set(true)
	inst.components.locomotor.fasteronroad = false
	inst.AnimState:SetMultColour(0, 0, 0, 0)
	inst.DynamicShadow:SetSize(2.6, 1.2)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "chiropteran_flight", 1.25)
	inst.components.inventory:Hide()
	if inst.components.drownable ~= nil then
		inst.components.drownable.enabled = false
	end
	inst.components.locomotor.triggerscreep = false

	-- Disable World Collisions
	inst.Physics:ClearCollisionMask()
	inst.Physics:CollidesWith(COLLISION.GROUND)
	inst.Physics:CollidesWith(COLLISION.OBSTACLES)
	--inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
	--inst.Physics:CollidesWith(COLLISION.CHARACTERS)
	--inst.Physics:CollidesWith(COLLISION.GIANTS)

	-- Disable Actions
	if inst.components.playercontroller ~= nil then
		inst.components.playercontroller.actionbuttonoverride = Empty
	end
	inst.ActionStringOverride = nil
	if inst.components.playeractionpicker ~= nil then
		inst.components.playeractionpicker.leftclickoverride = Empty
		inst.components.playeractionpicker.rightclickoverride = RightClickOverride
		inst.components.playeractionpicker.pointspecialactionsfn = nil
	end
end

-- removed inst.LightWatcher:IsInLight() for night, fix
function Chiropteran:ChiropteraStop(inst)
	-- Kill bats
	if inst.batfx ~= nil then
		inst.batfx:PushEvent("chiroptera_exitbat")
	end

	-- Uninit, lol
	inst:RemoveTag("monster")
	self:RevertAll(inst)

	-- Undo modified variables
	inst.components.grue:RemoveImmunity("chiropteran_flight")
	inst.nofootsteps:set(false)
	inst.components.locomotor.fasteronroad = true
	inst.AnimState:SetMultColour(1, 1, 1, 1)
	inst.DynamicShadow:SetSize(1.3, 0.6)
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "chiropteran_flight")
	inst.components.inventory:Show()
	if inst.components.drownable ~= nil then
		inst.components.drownable.enabled = true
	end
	inst.components.locomotor.triggerscreep = true

	-- Fix Collisions
	if not inst:HasTag("playerghost") then
		inst.Physics:ClearCollisionMask()
		inst.Physics:CollidesWith(COLLISION.WORLD)
		inst.Physics:CollidesWith(COLLISION.OBSTACLES)
		inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
		inst.Physics:CollidesWith(COLLISION.CHARACTERS)
		inst.Physics:CollidesWith(COLLISION.GIANTS)
	end

	-- Enable Actions
	if inst.components.playercontroller ~= nil then
		inst.components.playercontroller.actionbuttonoverride = nil
	end
	if inst.components.playeractionpicker ~= nil then
		inst.components.playeractionpicker.leftclickoverride = nil
		inst.components.playeractionpicker.rightclickoverride = nil
		inst.components.playeractionpicker.pointspecialactionsfn = nil
	end
end

return Chiropteran
