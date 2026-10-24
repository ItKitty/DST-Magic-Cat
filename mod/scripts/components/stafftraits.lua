local Stafftraits = Class(function(self, inst)
	self.inst = inst
end, nil, {})

function Stafftraits:DoDeltaSanity(inst, attacker, target)
	if attacker ~= nil then
		if attacker.components.staffsanity then
			attacker.components.staffsanity:DoCastingDelta(-TUNING.SANITY_MEDLARGE)
		elseif attacker.components.sanity ~= nil then
			attacker.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
		end
	end
end

----------------------------
local function laterdamage(inst, target, attacker)
	-- 计算最终数值
	local health = target.components.health.maxhealth
	local resultDamage = health / 100
	-- 真伤
	local damageNum = resultDamage > 0 and resultDamage or 0 -- 保证伤害值不为负数

	for i = 1, 10 do
		inst:DoTaskInTime(0.5 * i, function()
			if
				target
				and target:IsValid()
				and target.components.health
				and target.components.health.currenthealth > 0
			then
				target.components.health:DoDelta(-damageNum, nil, inst.prefab, true, nil, true)

				if target ~= nil and target:IsValid() and attacker ~= nil and attacker:IsValid() then
					SpawnPrefab("thunder").Transform:SetPosition(target.Transform:GetWorldPosition())
					SpawnPrefab("lightning").Transform:SetPosition(target.Transform:GetWorldPosition())
				end
				if target.sg and target.sg:HasState("electrocute") then
					target.sg:GoToState("electrocute")
				end
			end
		end)
	end
end

function Stafftraits:fire_attack(inst, attacker, target)
	if target ~= nil and target:IsValid() and not target:HasTag("epic") then
		return
	end

	self:DoDeltaSanity(inst, attacker, target)

	-- 只添加标签如果还没有
	if not target:HasTag("m_flame_marked") then
		--火焰标记
		target:AddTag("m_flame_marked")
		target:DoTaskInTime(5, function()
			if target:IsValid() then
				target:RemoveTag("m_flame_marked")
			end
		end)

		-- 火焰特效（视觉提示）
		local x, y, z = target.Transform:GetWorldPosition()
		local fx = SpawnPrefab("halloween_firepuff_" .. tostring(math.random(1, 3)))
		fx.Transform:SetPosition(x, 0, z)
	else
		target:RemoveTag("m_flame_marked")
		laterdamage(inst, target, attacker)
		-- if target ~= nil and target:IsValid() and attacker ~= nil and attacker:IsValid() then
		-- 	SpawnPrefab("thunder").Transform:SetPosition(target.Transform:GetWorldPosition())
		-- 	SpawnPrefab("lightning").Transform:SetPosition(target.Transform:GetWorldPosition())
		-- end

		-- -- 计算最终数值
		-- local health = target.components.health.maxhealth
		-- local resultDamage = health / 10
		-- -- 真伤
		-- local damageNum = resultDamage > 0 and resultDamage or 0 -- 保证伤害值不为负数
		-- target.components.health:DoDelta(-damageNum, nil, inst.prefab, true, nil, true)

		attacker.components.talker:Say("天罚！")
	end

	target:PushEvent("attacked", { attacker = attacker, damage = 0, weapon = inst })
end

function Stafftraits:ice_attack(inst, attacker, target)
	if target ~= nil and target:IsValid() and not target:HasTag("epic") then
		return
	end

	self:DoDeltaSanity(inst, attacker, target)

	-- 只添加标签如果还没有
	if not target:HasTag("m_ice_marked") then
		--寒冰标记
		target:AddTag("m_ice_marked")
		target:DoTaskInTime(5, function()
			if target:IsValid() then
				target:RemoveTag("m_ice_marked")
			end
		end)

		local x, y, z = target.Transform:GetWorldPosition()
		local fx = SpawnPrefab("halloween_firepuff_cold_" .. tostring(math.random(1, 3)))
		fx.Transform:SetPosition(x, 0, z)
	else
		target:RemoveTag("m_ice_marked")
		if target ~= nil and target:IsValid() then
			local x, y, z = target.Transform:GetWorldPosition()
			local beam = SpawnPrefab("m_lightfx")
			if beam then
				beam.Transform:SetPosition(x, 0, z)
				beam.TrackTarget(target, x, z)
			end
		end

		attacker.components.talker:Say("天基炮！")
	end

	target:PushEvent("attacked", { attacker = attacker, damage = 0, weapon = inst })
end

function Stafftraits:sleep_attack(inst, attacker, target)
	if not target:IsValid() then
		--target killed or removed in combat damage phase
		return
	end

	if target.components.sleeper ~= nil then
		target.components.sleeper:AddSleepiness(10, 999, inst)
	elseif target.components.grogginess ~= nil then
		target.components.grogginess:AddGrogginess(10, 999)
	end
end

-- StaffSkill
-- 唤光
-- 火形态用模组自己的 m_stafflight（不点燃周围建筑/植物，照明取暖照旧），
-- 冷形态仍用原版的 staffcoldlight。
local function SpawnLight(inst, light, pos)
	light = light == "stafflight" and "m_stafflight" or light

	local _light = SpawnPrefab(light)
	if _light ~= nil then
		_light.Transform:SetPosition(pos:Get())
	end
end
-- 控温
local function Temperture(inst, caster)
	local x, y, z = caster.Transform:GetWorldPosition()
	local players = FindPlayersInRange(x, y, z, TUNING.BOOK_TEMPERATURE_RADIUS, true)

	for _, player in pairs(players) do
		player.components.temperature:SetTemperature(TUNING.BOOK_TEMPERATURE_AMOUNT)
		player.components.moisture:SetMoistureLevel(0)

		local fx = SpawnPrefab(
			player.components.rider ~= nil and player.components.rider:IsRiding() and "fx_book_temperature_mount"
				or "fx_book_temperature"
		)
		fx.Transform:SetPosition(player.Transform:GetWorldPosition())
		fx.Transform:SetRotation(player.Transform:GetRotation())

		local items = player.components.inventory:ReferenceAllItems()
		for _, item in ipairs(items) do
			if item.components.inventoryitemmoisture ~= nil then
				item.components.inventoryitemmoisture:SetMoisture(0)
			end
		end
	end

	local frozens = TheSim:FindEntities(x, y, z, TUNING.BOOK_TEMPERATURE_RADIUS, {
		"freezable",
	}, {
		"INLIMBO",
		"frozen",
	})
	for _, frozen in ipairs(frozens) do
		if frozen.components.freezable then -- Just in case.
			frozen.components.freezable:Unfreeze()
		end
	end
	------------------------------------
end
-- 灭火
local function Extinguish(inst, caster)
	local _x, _y, _z = caster.Transform:GetWorldPosition()
	local fires = TheSim:FindEntities(_x, _y, _z, 20, nil, {
		"INLIMBO",
		"lighter",
	}, {
		"fire",
		"smolder",
	})

	if #fires > 0 then
		for i, fire in ipairs(fires) do
			if fire.components.burnable then
				fire.components.burnable:Extinguish(true, 0)
			end
		end
	end
	-----------------------------------
end
-- 控雨
local function Forceprecipitation(inst)
	if TheWorld.state.precipitation ~= "none" then
		TheWorld:PushEvent("ms_forceprecipitation", false)
	else
		TheWorld:PushEvent("ms_forceprecipitation", true)
	end
end
-- 范围冰冻
local function ForznWorld(inst, caster)
	local x, y, z = caster.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x, y, z, 30, {
		"freezable",
	}, {
		"INLIMBO",
		"wall",
		"notarget",
		"player",
		"companion",
		"flight",
		"invisible",
		"noattack",
		"hiding",
	})
	for i, v in ipairs(ents) do
		if v.components.freezable ~= nil then
			v.components.freezable:AddColdness(10)
			v.components.freezable:SpawnShatterFX()
		end
	end
end

-- fire
function Stafftraits:Scorch(inst, target, pos, caster)
	caster.components.talker:Say("灼热！")
	-- 召唤晨光
	SpawnLight(inst, "stafflight", pos)
	-- 范围控温
	-- Temperture(inst, caster)
end

-- ice
function Stafftraits:Freeze(inst, target, pos, caster)
	caster.components.talker:Say("冰冻！")
	-- 召唤雨
	-- Forceprecipitation(inst)
	-- 召唤冷光
	SpawnLight(inst, "staffcoldlight", pos)
	-- 范围冰冻
	-- ForznWorld(inst, caster)
	-- 范围灭火
	-- Extinguish(inst, caster)
end

local TARGET_TAGS = { "_combat", "locomotor", "_health" }
local TARGET_NOT_TAGS = {
	"INLIMBO",
	"wall",
	"notarget",
	"player",
	"companion",
	"flight",
	"invisible",
	"noattack",
	"hiding",
	"shadowminion",
	-- "bird", --鸟会乱飞
}
function Stafftraits:Immobilize(inst, target, pos, caster)
	caster.components.talker:Say("定身！")
	local x, y, z = caster.Transform:GetWorldPosition()
	local range = 30

	local ents = TheSim:FindEntities(x, y, z, range, TARGET_TAGS, TARGET_NOT_TAGS)

	for i, v in ipairs(ents) do
		if
			v ~= caster
			and v:IsValid()
			and v.components.health
			and not v.components.health:IsDead()
			and v.components.combat
			and v.components.combat:CanBeAttacked()
		then
			-- 如果实体已经有绑定的定身特效，先清除
			if v._immobilize_fx then
				-- 停止之前的定身任务
				if v._immobilize_task then
					v._immobilize_task:Cancel()
					v._immobilize_task = nil
				end

				-- 移除之前的特效
				if v._immobilize_fx:IsValid() then
					v._immobilize_fx:Remove()
				end
				v._immobilize_fx = nil
			end

			-- 停止当前移动
			if v.brain then
				v.brain:Stop()
			end
			if v.components.locomotor then
				v.components.locomotor:Stop()
			end
			if v.Physics then
				v.Physics:Stop()
			end

			if v.sg then
				v.sg:GoToState("idle")
			end

			-- 创建新特效
			local scale = (v:HasTag("smallcreature") and 0.5) or (v:HasTag("largecreature") and 2) or 1
			local fx = SpawnPrefab("fx_restriction")
			fx.Transform:SetScale(scale, scale, scale)

			-- 将特效绑定到实体
			fx.entity:SetParent(v.entity) -- 设置为实体的子实体，会跟随移动

			-- 将特效和任务存储到实体上
			v._immobilize_fx = fx
			v._immobilize_task = v:DoTaskInTime(30, function()
				if v:IsValid() then
					if v.brain then
						v.brain:Start()
					end
					-- 移除特效
					if v._immobilize_fx and v._immobilize_fx:IsValid() then
						v._immobilize_fx:Decay() -- 如果有 Decay 方法
						-- 或者直接移除
						-- v._immobilize_fx:Remove()
					end

					-- 清理引用
					v._immobilize_fx = nil
					v._immobilize_task = nil
				end
			end)

			-- 监听实体移除事件，清理特效
			v:ListenForEvent("onremove", function()
				if v._immobilize_fx and v._immobilize_fx:IsValid() then
					v._immobilize_fx:Remove()
				end
				v._immobilize_fx = nil
				if v._immobilize_task then
					v._immobilize_task:Cancel()
					v._immobilize_task = nil
				end
			end)
		end
	end
end

-- NATURE
local GARDENING_CANT_TAGS = {
	"pickable",
	"stump",
	"withered",
	"barren",
	"INLIMBO",
}
local function MaximizePlant(inst)
	if inst.components.farmplantstress ~= nil then
		if inst.components.farmplanttendable then
			inst.components.farmplanttendable:TendTo()
		end

		inst.magic_tending = true
		local _x, _y, _z = inst.Transform:GetWorldPosition()
		local x, y = TheWorld.Map:GetTileCoordsAtPoint(_x, _y, _z)

		local nutrient_consumption = inst.plant_def.nutrient_consumption
		TheWorld.components.farming_manager:AddTileNutrients(
			x,
			y,
			nutrient_consumption[1] * 6,
			nutrient_consumption[2] * 6,
			nutrient_consumption[3] * 6
		)
	end
end

local function trygrowth(inst, maximize)
	if
		not inst:IsValid()
		or inst:IsInLimbo()
		or (inst.components.witherable ~= nil and inst.components.witherable:IsWithered())
	then
		return false
	end
	if inst:HasTag("leif") then
		inst.components.sleeper:GoToSleep(1000)
		return true
	end

	if maximize then
		MaximizePlant(inst)
	end

	if inst.components.growable ~= nil then
		-- If we're a tree and not a stump, or we've explicitly allowed magic growth, do the growth.
		if
			inst.components.growable.magicgrowable
			or ((inst:HasTag("tree") or inst:HasTag("winter_tree")) and not inst:HasTag("stump"))
		then
			if inst.components.simplemagicgrower ~= nil then
				inst.components.simplemagicgrower:StartGrowing()
				return true
			elseif inst.components.growable.domagicgrowthfn ~= nil then
				-- The upgraded horticulture book has a delayed start to make sure the plants get tended to first
				inst.magic_growth_delay = maximize and 2 or nil
				inst.components.growable:DoMagicGrowth()
				return true
			else
				return inst.components.growable:DoGrowth()
			end
		end
	end

	if inst.components.pickable ~= nil then
		if TheWorld.state.iswinter then
			inst.components.pickable:Resume()
		end
		if inst.components.pickable:CanBePicked() and inst.components.pickable.caninteractwith then
			return false
		end
		if inst.components.pickable:FinishGrowing() then
			-- inst.components.pickable:ConsumeCycles(0)
			if inst.components.pickable.max_cycles ~= nil then
				inst.components.pickable.cycles_left = inst.components.pickable.max_cycles + 1
			end
			return true
		end
	end

	if inst.components.crop ~= nil and (inst.components.crop.rate or 0) > 0 then
		if inst.components.crop:DoGrow(1 / inst.components.crop.rate, true) then
			return true
		end
	end

	if
		inst.components.harvestable ~= nil
		and inst.components.harvestable:CanBeHarvested()
		and inst:HasTag("mushroom_farm")
	then
		if inst.components.harvestable:IsMagicGrowable() then
			inst.components.harvestable:DoMagicGrowth()
			return true
		else
			if inst.components.harvestable:Grow() then
				return true
			end
		end
	end

	return false
end

function Stafftraits:Nature(inst, caster)
	caster.components.talker:Say("自然！")
	local range = 30
	local x, y, z = caster.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x, y, z, range, nil, GARDENING_CANT_TAGS)
	if #ents > 0 then
		trygrowth(table.remove(ents, math.random(#ents)))
		if #ents > 0 then
			local timevar = 1 - 1 / (#ents + 1)
			for i, v in ipairs(ents) do
				v:DoTaskInTime(timevar * math.random(), trygrowth)
			end
		end
	end
end

return Stafftraits
