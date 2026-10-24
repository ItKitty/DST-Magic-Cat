-- ============================================================================
-- m_infinity_charge
-- Madeleine 用启迪碎片给目标充能，使其获得无限耐久/燃料
-- 挂载对象：
--   fueled    : firepit / coldfirepit / campfire / portablefirepit / 其他燃料物品
--   finiteuses: 工具 / 武器 / 书 / 魔杖等
--   armor     : 护甲
-- ============================================================================

local FIREPIT_PREFABS = {
	firepit = true,
	coldfirepit = true,
	campfire = true,
	portablefirepit = true,
}

local function _IsFirepit(inst)
	return inst ~= nil
		and (inst:HasTag("campfire") or FIREPIT_PREFABS[inst.prefab] == true)
		and inst.components ~= nil
		and inst.components.fueled ~= nil
		and inst.components.burnable ~= nil
end

-- ---------------------------------------------------------------------------
-- 修复破损的锻造装备（月光/虚空等）
-- ---------------------------------------------------------------------------
local function _RepairBrokenForged(inst, doer, item)
	if inst:HasTag("broken") and inst.components.forgerepairable then
		if inst.components.forgerepairable.onrepaired then
			inst.components.forgerepairable.onrepaired(inst, doer, item)
		end
	end
end

-- ---------------------------------------------------------------------------
-- 无限充能的火堆：夜里当「伪矮星」用
-- 火堆本身的 Light 其实挂在火焰特效上（burnable 的 firefx -> firefx_light），
-- 所以直接给那盏已有的灯打上 lightsource / daylight 标签即可，
-- 农场作物会把它当成光源继续生长（prefabs/farm_plants.lua 的 CANGROW_TAGS）。
-- ---------------------------------------------------------------------------
local function _TagFireLight(inst)
	local burnable = inst.components.burnable
	if burnable == nil or burnable.fxchildren == nil then
		return
	end

	for _, fx in ipairs(burnable.fxchildren) do
		local firefx = fx.components ~= nil and fx.components.firefx or nil
		local light = firefx ~= nil and firefx.light or nil

		if light ~= nil and light:IsValid() then
			if not light:HasTag("lightsource") then
				light:AddTag("lightsource")
			end
			if not light:HasTag("daylight") then
				light:AddTag("daylight")
			end
		end
	end
end

-- ---------------------------------------------------------------------------
-- fueled：火堆类无限燃料
-- ---------------------------------------------------------------------------
local function _RefuelAndIgnite(inst, doer)
	if inst == nil or not inst:IsValid() then
		return
	end
	if inst:HasTag("burnt") then
		return
	end

	local fueled = inst.components.fueled
	if fueled ~= nil then
		local maxfuel = fueled.maxfuel
		if maxfuel ~= nil and maxfuel > 0 then
			fueled:InitializeFuelLevel(maxfuel)
		else
			fueled:SetPercent(1)
		end
	end

	local burnable = inst.components.burnable
	if burnable ~= nil and not burnable:IsBurning() then
		burnable:Ignite(nil, nil, doer)
	end

	-- 火焰特效（firefx）在点燃后才存在，所以放到最后给它的灯打标签
	_TagFireLight(inst)
end

-- ---------------------------------------------------------------------------
-- finiteuses：工具/武器/书等无限耐久
-- ---------------------------------------------------------------------------
local function _ApplyInfiniteFiniteUses(inst, doer, item)
	_RepairBrokenForged(inst, doer, item)

	local finiteuses = inst.components.finiteuses
	if finiteuses == nil then
		return false
	end

	if not finiteuses._m_infinity_wrapped then
		finiteuses._m_infinity_wrapped = true
		finiteuses.Use = function() end
		finiteuses.SetUses = function() end
		finiteuses.SetPercent = function(self, percent)
			self.current = self.total
		end
	end

	if finiteuses.total then
		finiteuses.current = finiteuses.total
	end

	inst:AddTag("m_infinity_finiteuses")
	inst:AddTag("infinite_durability")
	inst:AddTag("hide_percentage")

	if inst:HasTag("show_broken_ui") then
		inst:RemoveTag("show_broken_ui")
		inst:PushEvent("hide_spoilage")
	end

	return true
end

-- ---------------------------------------------------------------------------
-- armor：护甲无限耐久
-- ---------------------------------------------------------------------------
local function _ApplyInfiniteArmor(inst, doer, item)
	_RepairBrokenForged(inst, doer, item)

	local armor = inst.components.armor
	if armor == nil then
		return false
	end

	if not armor._m_infinity_wrapped then
		armor._m_infinity_wrapped = true
		armor.indestructible = true
		armor.TakeDamage = function(self, damage_amount)
			return 0
		end
		armor.SetCondition = function(self, amount)
			self.condition = (self.maxcondition and self.maxcondition > 0) and self.maxcondition or amount
		end
	end

	armor:SetPercent(1)

	inst:AddTag("m_infinity_armor")
	inst:AddTag("infinite_durability")
	inst:AddTag("hide_percentage")

	if inst:HasTag("show_broken_ui") then
		inst:RemoveTag("show_broken_ui")
		inst:PushEvent("hide_spoilage")
	end

	return true
end

-- ---------------------------------------------------------------------------
-- fueled：通用无限燃料（非火堆的燃料类物品）
-- ---------------------------------------------------------------------------
local function _ApplyInfiniteFueled(inst, doer, item)
	if _IsFirepit(inst) then
		_RefuelAndIgnite(inst, doer)
		return true
	end

	local fueled = inst.components.fueled
	if fueled == nil then
		return false
	end

	if not fueled._m_infinity_wrapped then
		fueled._m_infinity_wrapped = true
		fueled.StartConsuming = function(self)
			self:StopConsuming()
		end
		fueled.DoDelta = function() end
	end

	fueled:StopConsuming()
	fueled.rate = 0
	fueled:SetPercent(1)

	inst:AddTag("m_infinity_fueled")
	inst:AddTag("infinite_durability")
	inst:AddTag("hide_percentage")

	if inst:HasTag("show_broken_ui") then
		inst:RemoveTag("show_broken_ui")
		inst:PushEvent("hide_spoilage")
	end

	return true
end

-- ---------------------------------------------------------------------------
-- 组件
-- ---------------------------------------------------------------------------
local m_infinity_charge = Class(function(self, inst)
	self.inst = inst
	self.charged = false
	self.charge_type = nil -- "fueled" / "finiteuses" / "armor"

	inst:AddTag("m_infinity_chargeable")
end)

function m_infinity_charge:CanCharge()
	if _IsFirepit(self.inst) then
		return not self.inst:HasTag("m_infinity_firepit")
	end
	if self.inst.components.finiteuses ~= nil then
		return not self.inst:HasTag("m_infinity_finiteuses")
	end
	if self.inst.components.armor ~= nil then
		return not self.inst:HasTag("m_infinity_armor")
	end
	if self.inst.components.fueled ~= nil then
		return not self.inst:HasTag("m_infinity_fueled")
	end
	return false
end

function m_infinity_charge:Charge(doer, item)
	if doer == nil or doer.prefab ~= "madeleine" then
		return false
	end
	if item == nil or item.prefab ~= "alterguardianhatshard" then
		return false
	end

	if not self:CanCharge() then
		if doer.components.talker ~= nil then
			doer.components.talker:Say("这个物品已经充能过了。")
		end
		return false
	end

	local inst = self.inst
	local ok = false
	local msg = nil

	if _IsFirepit(inst) then
		self.charge_type = "firepit"
		self:ApplyInfiniteFuel(doer)
		ok = true
		msg = "火堆被启迪碎片充能，永不熄灭！"
	elseif inst.components.finiteuses ~= nil then
		self.charge_type = "finiteuses"
		ok = _ApplyInfiniteFiniteUses(inst, doer, item)
		msg = ok and "物品被启迪碎片充能，永不磨损！" or "这个物品无法充能。"
	elseif inst.components.armor ~= nil then
		self.charge_type = "armor"
		ok = _ApplyInfiniteArmor(inst, doer, item)
		msg = ok and "护甲被启迪碎片充能，永不破损！" or "这个护甲无法充能。"
	elseif inst.components.fueled ~= nil then
		self.charge_type = "fueled"
		ok = _ApplyInfiniteFueled(inst, doer, item)
		msg = ok and "物品被启迪碎片充能，能源永不枯竭！" or "这个物品无法充能。"
	end

	if not ok then
		if doer.components.talker ~= nil then
			doer.components.talker:Say(msg or "这个物品无法充能。")
		end
		return false
	end

	self.charged = true

	-- 消耗启迪碎片
	if item.components.stackable ~= nil and item.components.stackable:StackSize() > 1 then
		item.components.stackable:Get(1):Remove()
	else
		item:Remove()
	end

	if doer.components.talker ~= nil then
		doer.components.talker:Say(msg)
	end

	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = SpawnPrefab("lavaarena_creature_teleport_small_fx")
	if fx ~= nil then
		fx.Transform:SetPosition(x, y, z)
	end
	if doer.SoundEmitter ~= nil then
		doer.SoundEmitter:PlaySound("dontstarve/common/telebase_gemplace")
	end

	return true
end

-- ---------------------------------------------------------------------------
-- 火堆专用：保留原有实现（sectionfn 拦截、DoDelta 拦截、周期兜底）
-- ---------------------------------------------------------------------------
function m_infinity_charge:ApplyInfiniteFuel(doer)
	local inst = self.inst

	if inst._m_infinity_firepit then
		_RefuelAndIgnite(inst, doer)
		return
	end

	inst._m_infinity_firepit = true
	inst:AddTag("m_infinity_firepit")

	local fueled = inst.components.fueled
	if fueled ~= nil then
		-- 营火特殊处理：阻止 sectionfn 进入烧尽
		if inst.prefab == "campfire" and not fueled._m_infinity_section_wrapped and fueled.sectionfn ~= nil then
			fueled._m_infinity_section_wrapped = true
			fueled._m_infinity_original_sectionfn = fueled._m_infinity_original_sectionfn or fueled.sectionfn

			fueled.sectionfn = function(newsection, oldsection, inst2, doer2)
				if inst2 ~= nil and inst2._m_infinity_firepit and newsection <= 0 then
					if inst2.components and inst2.components.burnable then
						inst2.components.burnable:Extinguish()
					end
					return
				end
				if
					inst2 ~= nil
					and inst2._m_infinity_firepit
					and newsection > 0
					and inst2.components
					and inst2.components.propagator == nil
				then
					inst2:AddComponent("propagator")
				end
				return fueled._m_infinity_original_sectionfn(newsection, oldsection, inst2, doer2)
			end
		end

		-- 拦截燃料消耗
		if not fueled._m_infinity_wrapped then
			fueled._m_infinity_wrapped = true
			fueled._m_infinity_original_DoDelta = fueled._m_infinity_original_DoDelta or fueled.DoDelta

			fueled.DoDelta = function(self, delta, doer2)
				if delta == nil then
					return
				end
				if delta < 0 then
					return
				end
				local res = self:_m_infinity_original_DoDelta(delta, doer2)
				if self.inst and self.inst._m_infinity_firepit then
					_RefuelAndIgnite(self.inst, doer2)
				end
				return res
			end
		end
	end

	-- 事件监听
	if not inst._m_infinity_event_hooked then
		inst._m_infinity_event_hooked = true

		inst:ListenForEvent("takefuel", function(inst2)
			if inst2._m_infinity_firepit then
				_RefuelAndIgnite(inst2)
			end
		end)

		inst:ListenForEvent("onextinguish", function(inst2)
			if inst2._m_infinity_firepit then
				inst2:DoTaskInTime(0, function()
					_RefuelAndIgnite(inst2)
				end)
			end
		end)
	end

	-- 周期兜底
	if inst._m_infinity_recheck_task == nil then
		inst._m_infinity_recheck_task = inst:DoPeriodicTask(5, function(inst2)
			if inst2._m_infinity_firepit then
				local fueled2 = inst2.components.fueled
				local burnable2 = inst2.components.burnable
				if fueled2 ~= nil and fueled2:IsEmpty() then
					_RefuelAndIgnite(inst2)
				elseif burnable2 ~= nil and not burnable2:IsBurning() then
					_RefuelAndIgnite(inst2)
				end
			end
		end)

		inst:ListenForEvent("onremove", function(inst2)
			if inst2._m_infinity_recheck_task ~= nil then
				inst2._m_infinity_recheck_task:Cancel()
				inst2._m_infinity_recheck_task = nil
			end
		end)
	end

	_RefuelAndIgnite(inst, doer)
end

-- ---------------------------------------------------------------------------
-- 存档
-- ---------------------------------------------------------------------------
function m_infinity_charge:OnSave()
	return {
		charged = self.charged,
		charge_type = self.charge_type,
		-- 这个组件是「充能时」才挂到目标身上的，目标 prefab 里并没有它。
		-- 原版 SetPersistData 只会给「已经存在的组件」调 OnLoad，
		-- 所以必须带上这个标记，读档时才会按需 AddComponent 再触发 OnLoad。
		add_component_if_missing = true,
	}
end

function m_infinity_charge:OnLoad(data)
	if data == nil or not data.charged then
		return
	end

	self.charged = true
	self.charge_type = data.charge_type

	local inst = self.inst
	local charge_type = data.charge_type

	-- 注意：标签（m_infinity_*）不会存进存档，重载后必须按 charge_type 重新恢复，
	-- 否则效果会“消失”（尤其是火堆：旧逻辑查的是标签，重载后一定查不到）。
	if charge_type == "firepit" then
		inst._m_infinity_firepit = nil
		self:ApplyInfiniteFuel(nil)
	elseif charge_type == "finiteuses" then
		_ApplyInfiniteFiniteUses(inst, nil, nil)
	elseif charge_type == "armor" then
		_ApplyInfiniteArmor(inst, nil, nil)
	elseif charge_type == "fueled" then
		_ApplyInfiniteFueled(inst, nil, nil)
	else
		-- 兼容没写 charge_type 的旧存档，按组件顺序推断
		if _IsFirepit(inst) then
			inst._m_infinity_firepit = nil
			self:ApplyInfiniteFuel(nil)
		elseif inst.components.finiteuses ~= nil then
			_ApplyInfiniteFiniteUses(inst, nil, nil)
		elseif inst.components.armor ~= nil then
			_ApplyInfiniteArmor(inst, nil, nil)
		elseif inst.components.fueled ~= nil then
			_ApplyInfiniteFueled(inst, nil, nil)
		end
	end
end

return m_infinity_charge
