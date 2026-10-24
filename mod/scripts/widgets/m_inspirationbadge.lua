local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

-------------------------------------------------------------------------------------------------------

local NUM_SLOTS = 3

local InspirationBadge = Class(Badge, function(self, owner, colour)
	Badge._ctor(self, nil, owner, { 132 / 255, 62 / 255, 162 / 255, 1 }, nil, true, true, true)

	self._clientpredicteddraining = false

	self.circleframe:GetAnimState():SetBank("status_wathgrithr")
	self.circleframe:GetAnimState():SetBuild("status_wathgrithr")

	self.slots = {}
	for i = 1, NUM_SLOTS do
		self.slots[i] = self:AddChild(UIAnim())
		self.slots[i]:GetAnimState():SetBank("status_wathgrithr")
		self.slots[i]:GetAnimState():SetBuild("status_wathgrithr")
		self.slots[i]:GetAnimState():PlayAnimation("slot_deactivated_" .. tostring(i))
		self.slots[i]:GetAnimState():AnimateWhilePaused(false)
	end
	self.buffs = {}
	for i = 1, NUM_SLOTS do
		self.buffs[i] = self:AddChild(UIAnim())
		self.buffs[i]:GetAnimState():SetBank("status_wathgrithr")
		self.buffs[i]:GetAnimState():SetBuild("status_wathgrithr")
		self.buffs[i]:GetAnimState():PlayAnimation("buff_off")
		self.buffs[i]:GetAnimState():AnimateWhilePaused(false)
	end
	self.num_active_slots = 0
end)

function InspirationBadge:OnUpdateSlots(num)
	if num > self.num_active_slots then
		for i = self.num_active_slots + 1, num do
			self.slots[i]:GetAnimState():PlayAnimation("slot_activate_" .. tostring(i))
		end
		TheFrontEnd:GetSound():PlaySoundWithParams("dontstarve_DLC001/characters/wathgrithr/inspiration_up",
			{ intensity = (num - 1) / (NUM_SLOTS - 1) }) -- intensity: 0, 0.5, 1
	elseif num < self.num_active_slots then
		for i = self.num_active_slots, num + 1, -1 do
			self.slots[i]:GetAnimState():PlayAnimation("slot_deactivate_" .. tostring(i))
			self.slots[i]:GetAnimState():PushAnimation("slot_deactivated_" .. tostring(i), false)
		end
		TheFrontEnd:GetSound():PlaySound("dontstarve_DLC001/characters/wathgrithr/inspiration_down")
	end

	self.num_active_slots = num
end

function InspirationBadge:OnBuffChanged(num, name)
	if num ~= nil and self.buffs[num] ~= nil then
		if name ~= nil then
			self.buffs[num]:GetAnimState():OverrideSymbol("buff_icon" .. tostring(num), "status_wathgrithr", name)
			self.buffs[num]:GetAnimState():PlayAnimation("buff_activate_" .. tostring(num))
		else
			if not self.buffs[num]:GetAnimState():IsCurrentAnimation("buff_off") and not self.buffs[num]:GetAnimState():IsCurrentAnimation("buff_deactivate_" .. tostring(num)) then
				self.buffs[num]:GetAnimState():PlayAnimation("buff_deactivate_" .. tostring(num))
				self.buffs[num]:GetAnimState():PushAnimation("buff_off", false)
			end
		end
	end
end

function InspirationBadge:EnableClientPredictedDraining(enable)
	if enable == nil then
		enable = false
	end
	if self._clientpredicteddraining ~= enable then
		if enable then
			self:StartUpdating()
		else
			self:StopUpdating()
		end

		self._clientpredicteddraining = enable == true
	end
end

function InspirationBadge:OnUpdate(dt)
	if TheNet:IsServerPaused() then return end

	local percent = math.max(0, self.percent + dt * TUNING.INSPIRATION_DRAIN_RATE * 0.98 / 100) -- just go a little bit slower than the server so there will be less jumping backwards in the meter
	self:SetPercent(percent)
end

function InspirationBadge:OnControl(control, down)
	if self.focus then
		if control == CONTROL_ACCEPT then
			if down then
				if not self.down then
					self.down = true
					if self.ondown then
						self.ondown()
					end
				end
			else
				if self.down then
					self.down = false
					-- 刚拖动过就不算点击，避免拖完顺手把音乐开关了
					if self._drag_moved then
						self._drag_moved = false
					elseif self.onclick then
						self.onclick()
					end
				end
			end
			return true
		end
	end

	return Badge.OnControl(self, control, down)
end

-------------------------------------------------------------------------------------------------------
-- 拖拽：按住左键可以把图标拖到任意位置
-------------------------------------------------------------------------------------------------------
local DRAG_THRESHOLD = 4 -- 超过这个位移才算「拖动」，否则仍视为点击

function InspirationBadge:StopDrag()
	self._dragging = false
	if self._dragtask ~= nil then
		self._dragtask:Cancel()
		self._dragtask = nil
	end
end

function InspirationBadge:OnMouseButton(button, down, x, y)
	if button ~= 0 then
		return false
	end

	if down then
		local mouse = TheInput:GetScreenPosition()
		local pos = self:GetPosition()
		self._drag_offset = { x = mouse.x - pos.x, y = mouse.y - pos.y }
		self._drag_start = { x = mouse.x, y = mouse.y }
		self._drag_moved = false
		self._dragging = true

		if self._dragtask == nil then
			self._dragtask = self.inst:DoPeriodicTask(0, function()
				if not self._dragging or not self.inst:IsValid() then
					return
				end
				local mx, my = TheInput:GetScreenPosition():Get()
				if not self._drag_moved then
					local dx, dy = mx - self._drag_start.x, my - self._drag_start.y
					if math.abs(dx) > DRAG_THRESHOLD or math.abs(dy) > DRAG_THRESHOLD then
						self._drag_moved = true
					end
				end
				self:SetPosition(mx - self._drag_offset.x, my - self._drag_offset.y, 0)
			end)
		end
		return true
	elseif self._dragging then
		self:StopDrag()
		return true
	end

	return false
end

return InspirationBadge
