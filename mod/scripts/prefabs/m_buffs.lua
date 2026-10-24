local function OnTimerDone(inst, data)
	if data.name == "buffover" then
		inst.components.debuff:Stop()
	end
end
local function MakeBuff(name, onattachedfn, onextendedfn, ondetachedfn, duration, priority, prefabs)
	local function OnAttached(inst, target)
		inst.entity:SetParent(target.entity)
		inst.Transform:SetPosition(0, 0, 0) -- in case of loading
		inst:ListenForEvent("death", function()
			inst.components.debuff:Stop()
		end, target)

		if onattachedfn ~= nil then
			onattachedfn(inst, target)
		end
	end

	local function OnExtended(inst, target)
		inst.components.timer:StopTimer("buffover")
		if duration then
			inst.components.timer:StartTimer("buffover", duration)
		end

		if onextendedfn ~= nil then
			onextendedfn(inst, target)
		end
	end

	local function OnDetached(inst, target)
		if ondetachedfn ~= nil then
			ondetachedfn(inst, target)
		end
		inst:Remove()
	end

	local function fn()
		local inst = CreateEntity()

		if not TheWorld.ismastersim then
			-- Not meant for client!
			inst:DoTaskInTime(0, inst.Remove)
			return inst
		end

		inst.entity:AddTransform()

		--[[Non-networked entity]]
		-- inst.entity:SetCanSleep(false)
		inst.entity:Hide()
		inst.persists = false

		inst:AddTag("CLASSIFIED")

		inst:AddComponent("debuff")
		inst.components.debuff:SetAttachedFn(OnAttached)
		inst.components.debuff:SetDetachedFn(OnDetached)
		inst.components.debuff:SetExtendedFn(OnExtended)
		inst.components.debuff.keepondespawn = true

		inst:AddComponent("timer")
		if duration then
			inst.components.timer:StartTimer("buffover", duration)
		end
		inst:ListenForEvent("timerdone", OnTimerDone)

		return inst
	end

	return Prefab("buff_" .. name, fn, nil, prefabs)
end

local function RecalculatePlanarDamage(inst)
	local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if item then
		if not item.components.planardamage then
			item:AddComponent("planardamage")
			item._addplanardamage = true
		end
		item.components.planardamage:AddBonus(inst, 15, "furry_marshmallow")
	end

	local olditem = inst._furry_marshmallow_planarweapon
	if olditem ~= item then
		if olditem and olditem.components.planardamage then
			if olditem._addplanardamage then
				olditem:RemoveComponent("planardamage")
				olditem._addplanardamage = nil
			else
				olditem.components.planardamage:RemoveBonus(inst, "furry_marshmallow")
			end
		end
		inst._furry_marshmallow_planarweapon = item
	end
end

local function RemovePlanarDamage(inst)
	local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	if item and item.components.planardamage then
		if item._addplanardamage then
			item:RemoveComponent("planardamage")
			item._addplanardamage = nil
		else
			item.components.planardamage:RemoveBonus(inst, "furry_marshmallow")
		end
	end
end

local function OnEquip(inst, data)
	if data ~= nil and data.item ~= nil then
		if data.eslot == EQUIPSLOTS.HANDS then
			RecalculatePlanarDamage(inst)
		end
	end
end

local function OnUnequip(inst, data)
	if data ~= nil and data.item ~= nil then
		if data.eslot == EQUIPSLOTS.HANDS then
			RecalculatePlanarDamage(inst)
		end
	end
end
-- 棉花糖buff锁定旺达老年伤害
local function CustomCombatDamage(inst, target, weapon, multiplier, mount)
	-- 判断是否有棉花糖buff
	if
		mount == nil
		and inst.components.debuffable
		and inst.components.debuffable:HasDebuff("buff_furry_marshmallow")
	then
		return TUNING.WANDA_SHADOW_DAMAGE_OLD
	end
	-- 调用旧方法
	return inst._furry_marshmallow_CustomCombatDamage
		and inst._furry_marshmallow_CustomCombatDamage(inst, target, weapon, multiplier, mount)
end
-- 给投射物加上10位面伤害
local function NutEnergyBarOnAttack(attacker, data)
	local projectile = data.projectile
	if projectile then
		if not projectile.components.planardamage then
			projectile:AddComponent("planardamage")
		end
		projectile.components.planardamage:AddBonus(attacker, 5, "furry_nut_energy_bar")
	end
end

local SPIDER_TAGS = { "spider" }
local function spider_update(owner)
	if owner and owner.components.leader then
		owner.components.leader:RemoveFollowersByTag("pig")
		local x, y, z = owner.Transform:GetWorldPosition()
		local ents = TheSim:FindEntities(x, y, z, TUNING.SPIDERHAT_RANGE, SPIDER_TAGS)
		for k, v in pairs(ents) do
			if
				v.components.follower
				and not v.components.follower.leader
				and not owner.components.leader:IsFollower(v)
				and owner.components.leader.numfollowers < 10
			then
				owner.components.leader:AddFollower(v)
			end
		end
	end
end

-- 共享食物的三维效果
local function ShareFood(player, food)
	local eater = player.components.eater
	local stack_mult = eater.eatwholestack
			and food.components.stackable ~= nil
			and food.components.stackable:StackSize()
		or 1

	local health_delta = 0
	local hunger_delta = 0
	local sanity_delta = 0

	if player.components.health ~= nil and (food.components.edible.healthvalue >= 0 or eater:DoFoodEffects(food)) then
		health_delta = food.components.edible:GetHealth(player) * eater.healthabsorption
	end

	if player.components.hunger ~= nil then
		hunger_delta = food.components.edible:GetHunger(player) * eater.hungerabsorption
	end

	if player.components.sanity ~= nil and (food.components.edible.sanityvalue >= 0 or eater:DoFoodEffects(food)) then
		sanity_delta = food.components.edible:GetSanity(player) * eater.sanityabsorption
	end

	if health_delta ~= 0 then
		player.components.health:DoDelta(health_delta * stack_mult, nil, food.prefab)
	end
	if hunger_delta ~= 0 then
		player.components.hunger:DoDelta(hunger_delta * stack_mult)
	end
	if sanity_delta ~= 0 then
		player.components.sanity:DoDelta(sanity_delta * stack_mult)
	end
end

local function OnEat(inst, data)
	local food = data.food
	for i, v in ipairs(AllPlayers) do
		if v ~= inst then
			local x, y, z = inst.Transform:GetWorldPosition()
			local dist = v:GetDistanceSqToPoint(x, y, z)
			if dist <= 4 * 4 then
				if food and food.components.edible ~= nil then
					ShareFood(v, food)
					food.components.edible:OnEaten(v)
				end
			end
		end
	end
end

---------------------------- 宠物附带攻击 ---------------------------------------
local function ShouldSkipAttack(target, inst)
	return not target
		or not target:IsValid()
		or target == inst
		or target:HasAnyTag("structure", "wall", "m_pet", "engineering")
end

-- 凝神养血攻击效果
local function OnAttackFocusNourish(inst, data)
	if not data or not data.target then
		return
	end

	if ShouldSkipAttack(data.target, inst) then
		return
	end
	-- 攻击时治疗
	if inst.components.health ~= nil and inst.components.health:GetPercent() < 1 then
		inst.components.health:DoDelta(3.4)
		inst.components.health:DeltaPenalty(-0.01)
	end
	-- 攻击时恢复理智
	if inst.components.sanity ~= nil and inst.components.sanity:GetPercent() < 1 then
		if not inst.components.sanity:IsLunacyMode() then
			inst.components.sanity:DoDelta(1)
		else
			inst.components.sanity:DoDelta(-1)
		end
	end
end

-- 暗影宠物攻击效果
local function OnAttackDarkPet(inst, data)
	if not data or not data.target then
		return
	end

	if ShouldSkipAttack(data.target, inst) then
		return
	end
	-- 攻击时治疗
	-- if inst.components.health ~= nil and inst.components.health:GetPercent() < 1 then
	-- 	inst.components.health:DoDelta(3.4)
	-- 	inst.components.health:DeltaPenalty(-0.01)
	-- end

	-- 20%几率召唤暗影蝙蝠
	local target = data.target

	if math.random() < 0.2 then
		local pt = (target ~= nil and target:IsValid()) and target:GetPosition() or inst:GetPosition()
		local m_batsfx = SpawnPrefab("m_batsfx")
		m_batsfx.Transform:SetPosition(pt.x, 0, pt.z)
		m_batsfx._target = target -- 设置目标
		m_batsfx.components.follower:SetLeader(inst) -- 设置跟随主人
	end
end

-- 光明宠物攻击效果
local function OnAttackLightPet(inst, data)
	if not data or not data.target then
		return
	end

	if ShouldSkipAttack(data.target, inst) then
		return
	end

	-- 攻击时恢复理智
	-- if inst.components.sanity ~= nil and inst.components.sanity:GetPercent() < 1 then
	-- 	if not inst.components.sanity:IsLunacyMode() then
	-- 		inst.components.sanity:DoDelta(1)
	-- 	else
	-- 		inst.components.sanity:DoDelta(-1)
	-- 	end
	-- end

	-- 50%几率发射投射物
	local target = data.target

	if math.random() < 0.5 then
		local x, y, z = target.Transform:GetWorldPosition()

		local gestalt = SpawnPrefab("alterguardianhat_projectile")
		gestalt.components.combat:SetDefaultDamage(25)
		gestalt:AddComponent("planardamage")
		gestalt.components.planardamage:SetBaseDamage(37)
		local radius = GetRandomMinMax(3, 5)
		local angle = (inst:GetAngleToPoint(x, y, z) + GetRandomMinMax(-90, 90)) * DEGREES
		gestalt.Transform:SetPosition(x + radius * math.cos(angle), y, z + radius * -math.sin(angle))
		gestalt:ForceFacePoint(x, y, z)
		gestalt:SetTargetPosition(Vector3(x, y, z))
		gestalt.components.follower:SetLeader(inst)

		-- target:AddDebuff("ammo_purebrilliance_mark", "slingshotammo_purebrilliance_debuff")

		-- 增加潮湿度
		if target and target.components.moisture then
			target.components.moisture:DoDelta(100, true)
		end
	end
end
---------------------------- 宠物附带攻击 ---------------------------------------

-- buff列表
local buffs = {
	-- 乘风而行
	{
		name = "m_windspeed",
		onattachedfn = function(inst, target)
			if target.components.locomotor ~= nil then
				target.components.locomotor:SetExternalSpeedMultiplier(inst, "m_windspeed", 1.3)
			end
			-- 播放特效
			if not inst.fx_haste then
				inst.fx_haste = SpawnPrefab("fx_haste")
				inst.fx_haste.Transform:SetScale(2, 2, 2)
				inst.fx_haste.entity:SetParent(target.entity)
			end
		end,
		ondetachedfn = function(inst, target)
			if target.components.locomotor ~= nil then
				target.components.locomotor:RemoveExternalSpeedMultiplier(inst, "m_windspeed")
			end
			if inst.fx_haste then
				inst.fx_haste:Remove()
				inst.fx_haste = nil
			end
		end,
		duration = 480,
	},
	-- 黯魂
	{
		name = "m_darkpet",
		onattachedfn = function(inst, target)
			target:ListenForEvent("onattackother", OnAttackDarkPet)

			-- 暗影伤害减免和月光伤害加成
			if target.components.damagetyperesist ~= nil then
				target.components.damagetyperesist:AddResist("shadow_aligned", inst, 0.9, "battlesong_shadowaligned")
			end
			if target.components.damagetypebonus ~= nil then
				target.components.damagetypebonus:AddBonus("lunar_aligned", inst, 1.1, "battlesong_shadowaligned")
			end

			-- 额外增害倍率加成 2就是100%增幅
			target.components.combat.externaldamagemultipliers:SetModifier(inst, 1.2)
			-- 额外移速
			target.components.locomotor:SetExternalSpeedMultiplier(inst, "m_darkpet_speed", 1.1)
			-- 不会被黑暗攻击
			target.components.grue:AddImmunity("m_darkpet")
		end,
		ondetachedfn = function(inst, target)
			target:RemoveEventCallback("onattackother", OnAttackDarkPet)

			-- 移除暗影伤害减免和月光伤害加成
			if target.components.damagetyperesist ~= nil then
				target.components.damagetyperesist:RemoveResist("shadow_aligned", inst, "battlesong_shadowaligned")
			end
			if target.components.damagetypebonus ~= nil then
				target.components.damagetypebonus:RemoveBonus("lunar_aligned", inst, "battlesong_shadowaligned")
			end
			target.components.combat.externaldamagemultipliers:RemoveModifier(inst)
			target.components.locomotor:RemoveExternalSpeedMultiplier(inst, "m_darkpet_speed")

			target.components.grue:RemoveImmunity("m_darkpet")
		end,
	},
	-- 月魄
	{
		name = "m_lightpet",
		onattachedfn = function(inst, target)
			target:ListenForEvent("onattackother", OnAttackLightPet)

			-- 月光伤害减免和暗影伤害加成
			if target.components.damagetyperesist ~= nil then
				target.components.damagetyperesist:AddResist("lunar_aligned", inst, 0.9, "battlesong_lunaraligned")
			end
			if target.components.damagetypebonus ~= nil then
				target.components.damagetypebonus:AddBonus("shadow_aligned", inst, 1.1, "battlesong_lunaraligned")
			end
			if target.components.health ~= nil then
				-- 额外倍率减伤
				target.components.health.externalabsorbmodifiers:SetModifier(inst, 0.2)
				-- 额外固定减伤 高鸟无伤
				target.components.health.externalreductionmodifiers:SetModifier(inst, 5, "forcefield")
			end
			-- 闪避CD 3秒冷却
			if not target.components.attackdodger then
				local attackdodger = target:AddComponent("attackdodger")
				attackdodger.ondodgefn = function(inst, attacker)
					local fx = SpawnPrefab("elixir_player_forcefield")
					inst:AddChild(fx)
					inst.SoundEmitter:PlaySound("dontstarve/characters/wendy/abigail/shield/on")
				end
				attackdodger.cooldowntime = 9
			end
		end,
		ondetachedfn = function(inst, target)
			target:RemoveEventCallback("onattackother", OnAttackLightPet)

			-- 移除月光伤害减免和暗影伤害加成
			if target.components.damagetyperesist ~= nil then
				target.components.damagetyperesist:RemoveResist("lunar_aligned", inst, "battlesong_lunaraligned")
			end
			if target.components.damagetypebonus ~= nil then
				target.components.damagetypebonus:RemoveBonus("shadow_aligned", inst, "battlesong_lunaraligned")
			end
			if target.components.health ~= nil then
				target.components.health.externalabsorbmodifiers:RemoveModifier(inst)
				target.components.health.externalreductionmodifiers:RemoveModifier(inst, "forcefield")
			end
			target:RemoveComponent("attackdodger")
		end,
	},
	-- 生命律动
	{
		name = "m_rhythm_life",
		onattachedfn = function(inst, target)
			inst.m_rhythm_lifetasktask = inst:DoPeriodicTask(2, function()
				if
					target.components.health ~= nil
					and not target.components.health:IsDead()
					and not target:HasTag("playerghost")
				then
					target.components.health:DoDelta(2)
				end
			end)
		end,
		ondetachedfn = function(inst, target)
			if inst.m_rhythm_lifetasktask then
				inst.m_rhythm_lifetasktask:Cancel()
				inst.m_rhythm_lifetasktask = nil
			end
		end,
		duration = 120,
	},
	-- 灵感泉涌
	{
		name = "m_surge_inspiration",
		onattachedfn = function(inst, target)
			inst.m_surge_inspirationtask = inst:DoPeriodicTask(2, function()
				if
					target.components.sanity ~= nil
					and not target.components.sanity:IsLunacyMode()
					and not target:HasTag("playerghost")
				then
					target.components.sanity:DoDelta(5)
				else
					target.components.sanity:DoDelta(-5)
				end
			end)
		end,
		ondetachedfn = function(inst, target)
			if inst.m_surge_inspirationtask then
				inst.m_surge_inspirationtask:Cancel()
				inst.m_surge_inspirationtask = nil
			end
		end,
		duration = 120,
	},
	-- 凝神养血
	{
		name = "m_focus_nourish",
		onattachedfn = function(inst, target)
			target:ListenForEvent("onattackother", OnAttackFocusNourish)
		end,
		ondetachedfn = function(inst, target)
			target:RemoveEventCallback("onattackother", OnAttackFocusNourish)
		end,
		duration = 120,
	},
	-- 轻快步伐
	{
		name = "m_lightfoot_stride",
		onattachedfn = function(inst, target)
			target.components.locomotor:SetExternalSpeedMultiplier(inst, "m_lightfoot_stride", 1.25)
		end,
		ondetachedfn = function(inst, target)
			target.components.locomotor:RemoveExternalSpeedMultiplier(inst, "m_lightfoot_stride")
		end,
		duration = 120,
	},
	-- 钢铁意志
	{
		name = "m_iron_will",
		onattachedfn = function(inst, target)
			-- 霸体
			target:AddTag("m_not_rigidity")
			-- 防火
			if target.components.health ~= nil then
				target.components.health.externalfiredamagemultipliers:SetModifier(
					inst,
					1 - TUNING.ARMORDRAGONFLY_FIRE_RESIST
				)
			end
			-- 防冻
			if target.components.freezable ~= nil then
				target.components.freezable:SetRedirectFn(function()
					return true
				end)
			end
		end,
		ondetachedfn = function(inst, target)
			target:RemoveTag("m_not_rigidity")
			if target.components.health ~= nil then
				target.components.health.externalfiredamagemultipliers:RemoveModifier(inst)
			end
			if target.components.freezable ~= nil then
				target.components.freezable.redirectfn = nil
			end
		end,
		duration = 120,
	},

	{
		-- 棉花糖buff
		name = "furry_marshmallow",
		onattachedfn = function(inst, target)
			-- 旺达攻击锁定老年形态
			if target.components.combat then
				if not target._furry_marshmallow_CustomCombatDamage and target.components.combat.customdamagemultfn then
					target._furry_marshmallow_CustomCombatDamage = target.components.combat.customdamagemultfn
					target.components.combat.customdamagemultfn = CustomCombatDamage
				end
			end
			-- 第一种方法给装备增加位面伤害
			-- RecalculatePlanarDamage(target)
			-- inst:ListenForEvent("equip", OnEquip, target)
			-- inst:ListenForEvent("unequip", OnUnequip, target)
			-- 第二种直接给人物加位面伤害
			if not target.components.planardamage then
				target:AddComponent("planardamage")
				-- 标记一下
				target._addplanardamage = true
			end
			target.components.planardamage:AddBonus(inst, 15, "furry_marshmallow")
		end,
		ondetachedfn = function(inst, target)
			-- buff消失移除装备增加的额外位面伤害
			-- RemovePlanarDamage(inst)
			-- inst:RemoveEventCallback("equip", OnEquip, target)
			-- inst:RemoveEventCallback("unequip", OnUnequip, target)
			-- 第二种方法
			if target.components.planardamage then
				-- 如果有标记，就移除位面伤害组件
				if target._addplanardamage then
					target:RemoveComponent("planardamage")
					-- 移除标记
					target._addplanardamage = nil
				else
					target.components.planardamage:RemoveBonus(inst, "furry_marshmallow")
				end
			end
		end,
		duration = 120,
	},
	{
		-- 坚果能量棒buff
		name = "furry_nut_energy_bar",
		onattachedfn = function(inst, target)
			-- 监听onattackother，给投射物加上位面伤害
			inst:ListenForEvent("onattackother", NutEnergyBarOnAttack, target)
			target:AddTag("furry_nut_energy_bar")
		end,
		ondetachedfn = function(inst, target)
			inst:RemoveEventCallback("onattackother", NutEnergyBarOnAttack, target)
			target:RemoveTag("furry_nut_energy_bar")
		end,
		duration = 180,
	},
	{
		-- 榴莲酱千层buff
		name = "furry_durian_mille_feuille",
		onattachedfn = function(inst, target)
			if target.components.hunger then
				target.components.hunger:SetPercent(0)
			end
			if target.components.locomotor then
				target.components.locomotor:SetExternalSpeedMultiplier(inst, "furry_durian_mille_feuille", 1.2)
			end
			-- 可以吃肉食
			if target.components.eater then
				local caneat = target.components.eater.caneat or {}
				local preferseating = target.components.eater.preferseating or {}
				table.insert(caneat, FOODTYPE.MEAT)
				table.insert(preferseating, FOODTYPE.MEAT)
				target.components.eater:SetDiet(caneat, preferseating)
			end
		end,
		ondetachedfn = function(inst, target)
			if target.components.locomotor then
				target.components.locomotor:RemoveExternalSpeedMultiplier(inst, "furry_durian_mille_feuille")
			end
			if target.components.eater then
				local caneat = target.components.eater.caneat or {}
				local preferseating = target.components.eater.preferseating or {}
				for k, v in ipairs(caneat) do
					if v == FOODTYPE.MEAT then
						table.remove(caneat, k)
						break
					end
				end
				for k, v in ipairs(preferseating) do
					if v == FOODTYPE.MEAT then
						table.remove(preferseating, k)
						break
					end
				end
				target.components.eater:SetDiet(caneat, preferseating)
			end
		end,
		duration = 960,
	},

	{
		-- 奶油蛤蜊炖蛋buff
		name = "furry_creamy_clam_egg_stew",
		onattachedfn = function(inst, target)
			-- 共享食物效果
			target:ListenForEvent("oneat", OnEat)
			-- 食用同种料理无惩罚
			if target.components.foodmemory and not target.FurryOldRememberFood then
				target.FurryOldRememberFood = target.components.foodmemory.RememberFood
				function target.components.foodmemory:RememberFood(...)
					if self.inst:HasDebuff("buff_furry_creamy_clam_egg_stew") then
						return
					end
					target.FurryOldRememberFood(self, ...)
				end
			end
		end,
		ondetachedfn = function(inst, target)
			target:RemoveEventCallback("oneat", OnEat)
		end,
		duration = 360,
	},
	{
		-- 甜腻蔬菜汤buff
		name = "furry_sweet_vegetable_soup",
		onattachedfn = function(inst, target)
			-- 移除hungrybuilder标签
			if target:HasTag("hungrybuilder") then
				target:RemoveTag("hungrybuilder")
				target.furry_hungrybuilder = true
			end
			-- 饱食度下降缓慢
			if target.components.hunger then
				target.components.hunger.burnratemodifiers:SetModifier(inst, 0.5)
			end
			-- 快速搬运重物
			target:AddTag("furry_strong")
		end,
		ondetachedfn = function(inst, target)
			if target.furry_hungrybuilder then
				target:AddTag("hungrybuilder")
				target.furry_hungrybuilder = nil
			end
			if target.components.hunger then
				target.components.hunger.burnratemodifiers:RemoveModifier(inst)
			end
			target:RemoveTag("furry_strong")
		end,
		duration = 720,
	},
	{
		-- 香草甜筒buff
		name = "furry_vanilla_cone",
		onattachedfn = function(inst, target)
			if target and target.components.leader then
				target:AddTag("monster")
				target:AddTag("spiderdisguise")
			end
			inst.updatetask = target:DoPeriodicTask(0.5, spider_update, 1)
		end,
		ondetachedfn = function(inst, target)
			if inst.updatetask then
				inst.updatetask:Cancel()
				inst.updatetask = nil
			end
			if target and target.components.leader then
				if not target:HasTag("spiderwhisperer") then
					if not target:HasTag("playermonster") then
						target:RemoveTag("monster")
					end
					target:RemoveTag("spiderdisguise")
				end
			end
		end,
		duration = 360,
	},
	{
		-- 火鸡盛宴buff
		name = "furry_turkey_feast",
		onattachedfn = function(inst, target)
			-- 力量加成0.25
			if target.components.combat then
				target.components.combat.externaldamagemultipliers:SetModifier(inst, 1.25)
			end
			-- 每次攻击理智和回血翻倍
			if target.components.battleborn then
				local battleborn_bonus = target.components.battleborn.battleborn_bonus
				local clamp_max = target.components.battleborn.clamp_max
				target.components.battleborn:SetBattlebornBonus(battleborn_bonus * 2)
				target.components.battleborn:SetClampMax(clamp_max * 2)
			end
		end,
		ondetachedfn = function(inst, target)
			if target.components.combat then
				target.components.combat.externaldamagemultipliers:RemoveModifier(inst)
			end
			if target.components.battleborn then
				local battleborn_bonus = target.components.battleborn.battleborn_bonus
				local clamp_max = target.components.battleborn.clamp_max
				target.components.battleborn:SetBattlebornBonus(battleborn_bonus / 2)
				target.components.battleborn:SetClampMax(clamp_max / 2)
			end
		end,
		duration = 180,
	},
}
local ret = {}
for k, v in pairs(buffs) do
	table.insert(ret, MakeBuff(v.name, v.onattachedfn, v.onextendedfn, v.ondetachedfn, v.duration))
end

--- @diagnostic disable-next-line: deprecated
return unpack(ret)
