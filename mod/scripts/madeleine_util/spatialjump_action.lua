local _G = GLOBAL

local TheNet = _G.TheNet
local Strings = _G.STRINGS
local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()

-- local m_spatialjump_consume = 50

local function m_playercontroller(self)
	local e_oldGetMapActions = self.GetMapActions
	function self:GetMapActions(position, ...)
		local LMBaction, RMBaction = e_oldGetMapActions(self, position, ...)
		local inventory = self.inst.components.inventory or self.inst.replica.inventory
		local inst = self.inst

		if (inst and inst:HasTag("madeleine")) and inventory and inventory:EquipHasTag("m_amulet_spatial") then
			local act = BufferedAction(self.inst, nil, ACTIONS.M_SPATIALJUMP)
			RMBaction = self:RemapMapAction(act, position)
		end
		return LMBaction, RMBaction
	end

	local e_oldOnMapAction = self.OnMapAction
	function self:OnMapAction(actioncode, position, maptarget, mod_name, ...)
		local is_run_old = true

		-- mod_name 被其他模组丢弃，或为原版动作时会为空
		if mod_name == nil or mod_name == STRINGS.M_SPATIALJUMP_MODNAME then
			local act = MOD_ACTIONS_BY_ACTION_CODE[STRINGS.M_SPATIALJUMP_MODNAME][actioncode]

			-- 如果有其他模组没将 mod_name 传下来，还是会有极小概率出现地图动作冲突的情况
			if act and act.map_action then
				-- 判断为本模组的地图动作，开始执行传送
				is_run_old = false
				if self.ismastersim then
					-- print("sanity.current", self.inst.components.sanity.current)
					-- print("sanity", self.inst.components.sanity.max - m_spatialjump_consume)
					-- if
					-- 	self.inst.components.sanity ~= nil
					-- 	and (
					-- 		(
					-- 			self.inst.components.sanity:IsInsanityMode()
					-- 			and self.inst.components.sanity.current >= m_spatialjump_consume
					-- 		)
					-- 		or (
					-- 			self.inst.components.sanity:IsLunacyMode()
					-- 			and self.inst.components.sanity.current
					-- 				<= (self.inst.components.sanity.max - m_spatialjump_consume)
					-- 		)
					-- 	)
					-- then
					local LMBaction, RMBaction = self:GetMapActions(position)
					if act.rmb then
						if RMBaction then
							self.locomotor:PushAction(RMBaction, true)
						end
					else
						if LMBaction then
							self.locomotor:PushAction(LMBaction, true)
						end
					end

					-- 	if self.inst.components.sanity:IsInsanityMode() then
					-- 		self.inst.components.sanity:DoDelta(-m_spatialjump_consume, true, "debug_key")
					-- 	end
					-- 	if self.inst.components.sanity:IsLunacyMode() then
					-- 		self.inst.components.sanity:DoDelta(m_spatialjump_consume, true, "debug_key")
					-- 	end
					-- end
				elseif self.locomotor == nil and not self.inst.m_amulet then
					self.inst.m_amulet = true
					if self.inst.item_task_portal == nil then
						self.inst.item_task_portal = self.inst:DoTaskInTime(9, function()
							self.inst.m_amulet = false
							self.inst.item_task_portal = nil
						end)
					end
					SendRPCToServer(RPC.DoActionOnMap, actioncode, position.x, position.z)
				elseif self:CanLocomote() then
					local _, RMBaction = self:GetMapActions(position)
					RMBaction.preview_cb = function()
						SendRPCToServer(RPC.DoActionOnMap, actioncode, position.x, position.z)
					end
					self.locomotor:PreviewAction(RMBaction, true)
				end
			end
		end
		if is_run_old then
			e_oldOnMapAction(self, actioncode, position, maptarget, mod_name, ...)
		end
	end
end
AddComponentPostInit("playercontroller", m_playercontroller)

AddAction("M_SPATIALJUMP", "空间跃迁", function(act)
	if act == nil or act.doer == nil or act.pos == nil then
		return false
	end
	local inst = act.doer

	if
		not (
			inst
			and inst:HasTag("madeleine")
			and inst.components
			and inst.components.inventory
			and inst.components.inventory:EquipHasTag("m_amulet_spatial")
		)
	then
		return false
	end

	local targetpos = act.pos:GetPosition()
	local pt = inst:GetPosition()
	local offset = FindWalkableOffset(
		pt,
		math.random() * 2 * PI,
		3 + math.random(),
		16,
		false,
		true,
		noentcheckfn,
		true,
		true
	) or FindWalkableOffset(pt, math.random() * 2 * PI, 5 + math.random(), 16, false, true, noentcheckfn, true, true) or FindWalkableOffset(
		pt,
		math.random() * 2 * PI,
		7 + math.random(),
		16,
		false,
		true,
		noentcheckfn,
		true,
		true
	)
	if offset ~= nil then
		pt = pt + offset
	end
	local e_portal = SpawnPrefab("pocketwatch_portal_entrance")
	if e_portal then
		if e_portal and e_portal.components.teleporter then
			e_portal.components.teleporter.onActivate = function(_, doer)
				if doer.components.talker ~= nil then
					doer.components.talker:ShutUp()
				end
			end
		end
		e_portal.Transform:SetPosition(pt:Get())
		e_portal:SpawnExit(TheShard:GetShardId(), targetpos.x or pt.x, 0, targetpos.z or pt.z)
		inst.SoundEmitter:PlaySound("wanda1/wanda/portal_entrance_pre")
	end
	return true
end).map_action =
	true
ACTIONS.M_SPATIALJUMP.do_not_locomote = true
ACTIONS.M_SPATIALJUMP.rmb = true
ACTIONS.M_SPATIALJUMP.closes_map = true
STRINGS.M_SPATIALJUMP_MODNAME = ACTIONS.M_SPATIALJUMP.mod_name

AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.M_SPATIALJUMP, nil))
AddStategraphActionHandler("wilson_client", ActionHandler(GLOBAL.ACTIONS.M_SPATIALJUMP, nil))

local BLINK_MAP_MUST = { "CLASSIFIED", "globalmapicon", "fogrevealer" }
ACTIONS_MAP_REMAP[ACTIONS.M_SPATIALJUMP.code] = function(act, targetpos)
	local doer = act.doer
	if doer == nil then
		return nil
	end
	if doer.m_amulet then
		return nil
	end

	if
		doer.replica == nil
		or doer.replica.inventory == nil
		or not doer.replica.inventory:EquipHasTag("m_amulet_spatial")
	then
		return nil
	end

	if not TheWorld.Map:IsVisualGroundAtPoint(targetpos.x, targetpos.y, targetpos.z) then
		local ents =
			TheSim:FindEntities(targetpos.x, targetpos.y, targetpos.z, PLAYER_REVEAL_RADIUS * 0.4, BLINK_MAP_MUST)
		local revealer
		local MAX_WALKABLE_PLATFORM_DIAMETERSQ = TUNING.MAX_WALKABLE_PLATFORM_RADIUS
			* TUNING.MAX_WALKABLE_PLATFORM_RADIUS
			* 4
		for _, v in ipairs(ents) do
			if doer:GetDistanceSqToInst(v) > MAX_WALKABLE_PLATFORM_DIAMETERSQ then
				revealer = v
				break
			end
		end
		if revealer == nil then
			return nil
		end
		targetpos.x, targetpos.y, targetpos.z = revealer.Transform:GetWorldPosition()
		if revealer._target ~= nil then
			local boat = revealer._target:GetCurrentPlatform()
			if boat == nil then
				return nil
			end
			targetpos.x, targetpos.y, targetpos.z = boat.Transform:GetWorldPosition()
		end
	end
	local act_remap = BufferedAction(doer, nil, ACTIONS.M_SPATIALJUMP, act.invobject, targetpos)
	return act_remap
end
