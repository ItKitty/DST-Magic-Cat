local Amulettraits = Class(function(self, inst)
	self.inst = inst
	self.skills = {}
	self.pick_task = nil
	self.heal_task = nil
	self.ripple_task = nil
	self._light = nil
	self.skeleton_task = nil
	self._protect_fn = nil
end, nil, {})

-- 通用功能函数
function Amulettraits:CancelTask(task)
	if task then
		task:Cancel()
	end
	return nil
end

----------------------------------------------------------
-- RED 功能 - 治疗
----------------------------------------------------------
function Amulettraits:HealOwner(inst, owner)
	if
		(owner.components.health and owner.components.health:IsHurt())
		and (owner.components.hunger and owner.components.hunger.current > 5)
	then
		owner.components.health:DoDelta(TUNING.REDAMULET_CONVERSION, false, "redamulet")
		-- owner.components.hunger:DoDelta(-TUNING.REDAMULET_CONVERSION)
	end
end

function Amulettraits:HealStart(inst, owner)
	self.heal_task = self.inst:DoPeriodicTask(TUNING.REDAMULET_CONVERSION_TIME, function()
		self:HealOwner(inst, owner)
	end)
end

function Amulettraits:HealEnd()
	self.heal_task = self:CancelTask(self.heal_task)
end

----------------------------------------------------------
-- BLUE 功能 - 水上行走
----------------------------------------------------------
local function DoRipple(inst)
	local is_running = inst.sg and inst.sg:HasStateTag("running")
	if inst.components.drownable and inst.components.drownable:IsOverWater() and not TheWorld:HasTag("cave") then
		local fx_name = is_running and "weregoose_splash_med" .. tostring(math.random(2))
			or "weregoose_ripple" .. tostring(math.random(2))
		local fx = SpawnPrefab(fx_name)
		fx.entity:SetParent(inst.entity)
		if inst:HasTag("m_onMounted") then
			fx.Transform:SetScale(2, 2, 2)
		end
	end
end

function Amulettraits:EnableWaterWalking(inst, owner, enable)
	if owner.components.drownable then
		owner.components.drownable.enabled = not enable
		if not TheWorld:HasTag("cave") then
			if enable then
				owner.Physics:ClearCollisionMask()
				owner.Physics:CollidesWith(COLLISION.GROUND)
				owner.Physics:CollidesWith(COLLISION.OBSTACLES)
				owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
				owner.Physics:CollidesWith(COLLISION.CHARACTERS)
				owner.Physics:CollidesWith(COLLISION.GIANTS)

				if self.ripple_task then
					self.ripple_task:Cancel()
					self.ripple_task = nil
				end
				self.ripple_task = owner:DoPeriodicTask(0.7, DoRipple, FRAMES)
			else
				owner.Physics:ClearCollisionMask()
				owner.Physics:CollidesWith(COLLISION.WORLD)
				owner.Physics:CollidesWith(COLLISION.OBSTACLES)
				owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
				owner.Physics:CollidesWith(COLLISION.CHARACTERS)
				owner.Physics:CollidesWith(COLLISION.GIANTS)
				self.ripple_task = self:CancelTask(self.ripple_task)
			end
			owner.Physics:Teleport(owner.Transform:GetWorldPosition())
		end
	end
	-- 确保 preserver 组件存在
	if not owner.components.preserver then
		owner:AddComponent("preserver") -- 自动添加组件
	end
	-- 物品栏反鲜
	owner.components.preserver:SetPerishRateMultiplier(enable and -10 or 1)
	-- 防雨
	inst.components.waterproofer:SetEffectiveness(enable and 1 or 0)
	-- 绝缘
	inst.components.equippable.insulated = enable
end

----------------------------------------------------------
-- PURPLE 功能
----------------------------------------------------------
function Amulettraits:SetSanityAura(owner, enable)
	if owner == nil then
		return
	end
	-- 理智光环
	if owner.components.sanity ~= nil then
		owner.components.sanity.neg_aura_absorb = enable and TUNING.ARMOR_HIVEHAT_SANITY_ABSORPTION or 0
	end
	-- 困倦抗性：开启时加、关闭时必须移除，否则玩家会永久免疫困倦
	local grogginess = owner.components.grogginess
	if grogginess ~= nil then
		if enable then
			grogginess:AddResistanceSource("nogrogginess", 9999)
			grogginess:ResetGrogginess()
		else
			grogginess:RemoveResistanceSource("nogrogginess")
		end
	end
	-- 梦魇形态
	if enable then
		self.inst:AddTag("m_nightmareform")
	else
		self.inst:RemoveTag("m_nightmareform")
	end
end

----------------------------------------------------------
-- ORANGE 功能 - 辅助功能
----------------------------------------------------------
function Amulettraits:EnableNoSlowDown(owner, enable)
	-- 确保 critwork 组件存在
	if not owner.components.critwork then
		owner:AddComponent("critwork") -- 自动添加组件
	end
	-- 确保 pinnable 组件存在
	if not owner.components.pinnable then
		owner:AddComponent("pinnable") -- 自动添加组件
	end

	if enable then
		-- 工作暴击
		owner.components.critwork:Enable() -- 默认启用
		-- 多种伪装
		-- 发情牛
		owner:AddTag("beefalo")
		-- -- 发情蜜蜂
		-- owner:AddTag("insect")
		-- 兔子
		owner:AddTag("rabbitdisguise")
		-- 荆棘伪装
		self.inst:AddTag("bramble_resistant")
		-- 强力开采者
		owner:AddTag("toughworker")
		-- 快速升帆
		-- owner:AddTag("master_crewman")
		-- 快速制作
		owner:AddTag("fastbuilder")
		-- 防滑
		owner:AddTag("stronggrip")
		-- 月亮孢子防护
		owner:AddTag("moon_spore_protection")
		-- 搬运重物
		owner:AddTag("m_strong")
		-- 藏肉
		self.inst:AddTag("hidesmeats")
		-- 不会被钢羊，姜饼座狼黏住
		owner.components.pinnable.canbepinned = false
		-- 冰面不打滑 + 坑洼/陷坑不减速（原版女巫扫帚的做法，见 SetGroundTraction）
		self:SetGroundTraction(owner, true)
	else
		owner.components.critwork:Disable() -- 禁用
		owner:RemoveTag("beefalo")
		-- owner:RemoveTag("insect")
		owner:RemoveTag("rabbitdisguise")
		owner:RemoveTag("toughworker")
		self.inst:RemoveTag("bramble_resistant")
		-- owner:RemoveTag("master_crewman")
		owner:RemoveTag("fastbuilder")
		owner:RemoveTag("stronggrip")
		owner:RemoveTag("moon_spore_protection")
		owner:RemoveTag("m_strong")
		owner.components.pinnable.canbepinned = true
		self.inst:RemoveTag("hidesmeats")
		self:SetGroundTraction(owner, false)
	end
end

-- 地面抓地：冰面不打滑 + 坑洼/陷坑不减速 + 蛛网/蜜迹减速免疫
--  1) nonslipgrituser  -> components/slipperyfeet.lua:245-255 不再累积 slipperiness
--                          （达不到 threshold 就不会 PushEvent("feetslipped")，冰面不滑）
--                          —— 照原版女巫扫帚 SGwilson.lua:890-911 的 ConfigureWitchBroomFlying
--  2) carefulwalker:Enable(false)
--                          -> unevenground（蚁狮塌陷、坑洼）推来的 unevengrounddetected 不再
--                             TrackTarget，也就不会挂 "carefulwalking"（TUNING.CAREFUL_SPEED_MOD=0.3）
--  3) vigorbuff 标签       -> 原版「迅捷药剂」ghostly_elixirs.lua:208-218 用的同一套：
--                             · locomotor.lua:620 站在 creep（蛛网等）上不套 slowmultiplier(0.6)
--                             · honey_trail.lua:2/18 蜂王蜜迹不再推 BEEQUEEN_HONEYTRAIL_SPEED_PENALTY
--                             · equippable.lua:126-144 装备减速按 +0.25 折扣（客户端 replica 同步）
-- 记录进入前的状态，脱下时按原值恢复，避免覆盖别的来源做的修改。
function Amulettraits:SetGroundTraction(owner, enable)
	if owner == nil or not owner:IsValid() then
		return
	end

	if enable then
		-- 冰面：给玩家挂一个"防滑砂"来源（和原版防滑砂共用同一个组件）
		local grit = owner.components.nonslipgrituser
		if grit == nil then
			grit = owner:AddComponent("nonslipgrituser")
		end
		if grit ~= nil then
			grit:AddSource(self.inst)
		end

		-- 坑洼 / 陷坑
		if owner.components.carefulwalker ~= nil and self._careful_was_enabled == nil then
			self._careful_was_enabled = owner.components.carefulwalker.enabled ~= false
			owner.components.carefulwalker:Enable(false)
		end

		-- 蛛网 / 蜂王蜜迹 / 装备减速（原版迅捷药剂的 vigorbuff）
		-- 只在原本没有该标签时由我们加，脱下时只撤销我们自己加的那次
		if self._vigor_added == nil then
			self._vigor_added = not owner:HasTag("vigorbuff")
			if self._vigor_added then
				owner:AddTag("vigorbuff")
			end
		end

		-- 立刻清掉当前正生效的地面减速（原版药剂同款手法：关掉再开，归 1 并清 temp 倍率）
		-- 只在倍率当前是开启状态时才做，避免把别的来源（例如女巫扫帚）关掉的状态误打开
		local loco = owner.components.locomotor
		if loco ~= nil and loco.enablegroundspeedmultiplier then
			loco:EnableGroundSpeedMultiplier(false)
			loco:EnableGroundSpeedMultiplier(true)
		end
	else
		local grit = owner.components.nonslipgrituser
		if grit ~= nil then
			-- RemoveSource 在最后一个来源移除时会自己 RemoveComponent
			grit:RemoveSource(self.inst)
		end

		if owner.components.carefulwalker ~= nil and self._careful_was_enabled ~= nil then
			owner.components.carefulwalker:Enable(self._careful_was_enabled)
			self._careful_was_enabled = nil
		end

		if self._vigor_added == true then
			owner:RemoveTag("vigorbuff")
		end
		self._vigor_added = nil
	end
end

----------------------------------------------------------
-- YELLOW 功能 - 光照
----------------------------------------------------------
function Amulettraits:EnableLight(owner, enable)
	if enable then
		if self._light == nil or not self._light:IsValid() then
			self._light = SpawnPrefab("yellowamuletlight")
		end
		self._light.entity:SetParent(owner.entity)

		if owner.components.bloomer ~= nil then
			owner.components.bloomer:PushBloom(self.inst, "shaders/anim.ksh", 1)
		else
			owner.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
		end
	else
		if self._light ~= nil then
			if self._light:IsValid() then
				self._light:Remove()
			end
			self._light = nil
		end

		if owner.components.bloomer ~= nil then
			owner.components.bloomer:PopBloom(self.inst)
		else
			owner.AnimState:ClearBloomEffectHandle()
		end
	end
end

----------------------------------------------------------
-- GREEN 功能 - 建造减耗
----------------------------------------------------------
function Amulettraits:SetBuildCostReduction(owner, enable)
	if owner.components.builder then
		owner.components.builder.ingredientmod = enable and 0.5 or 1
	end
	-- 绿手指
	if enable then
		-- 多倍采集 施肥
		owner:AddTag("m_greenfinger")
		-- 快采
		owner:AddTag("fastpicker")
	else
		owner:RemoveTag("m_greenfinger")
		owner:RemoveTag("fastpicker")
	end
end

----------------------------------------------------------
-- OPAL 功能 位面机制
----------------------------------------------------------
function Amulettraits:SetDisguise(owner, enable)
	if enable then
		-- 阵营加伤
		owner.components.damagetypebonus:AddBonus("shadow_aligned", owner, 1.3)
		owner.components.damagetypebonus:AddBonus("lunar_aligned", owner, 1.3)
		-- 阵营减伤
		owner.components.damagetyperesist:AddResist("shadow_aligned", owner, 0.7)
		owner.components.damagetyperesist:AddResist("lunar_aligned", owner, 0.7)
		-- 位面伤害
		owner.components.planardamage:SetBaseDamage(20)
		-- 位面防御
		owner.components.planardefense:SetBaseDefense(10)
	else
		owner.components.damagetypebonus:AddBonus("shadow_aligned", owner, 1)
		owner.components.damagetypebonus:AddBonus("lunar_aligned", owner, 1)
		owner.components.damagetyperesist:AddResist("shadow_aligned", owner, 1)
		owner.components.damagetyperesist:AddResist("lunar_aligned", owner, 1)
		owner.components.planardamage:SetBaseDamage(0)
		owner.components.planardefense:SetBaseDefense(0)
	end
end

----------------------------------------------------------
-- 温度控制
----------------------------------------------------------
function Amulettraits:SetTemperatureImmunity(inst, nofreezing, nooverheat, owner)
	-- 不会过热 眼球
	if nooverheat then
		inst:AddTag("m_nooverheat")
		if owner.components.health ~= nil then
			owner.components.health.externalfiredamagemultipliers:SetModifier(
				inst,
				1 - TUNING.ARMORDRAGONFLY_FIRE_RESIST
			)
		end
	else
		inst:RemoveTag("m_nooverheat")
		if owner.components.health ~= nil then
			owner.components.health.externalfiredamagemultipliers:RemoveModifier(inst)
		end
	end
	-- 不会过冷 龙鳞
	if nofreezing then
		inst:AddTag("m_nofreezing")
		-- 冰冻抗性
		owner.components.freezable:SetRedirectFn(function()
			return true
		end)
	else
		inst:RemoveTag("m_nofreezing")
		owner.components.freezable.redirectfn = nil
	end
end

----------------------------------------------------------

-- 本命功能
--------------------------- 护符被动回血和立场护盾 ---------------------------------------

local function ruinshat_unproc(inst, owner)
	if owner == nil then
		-- 如果没有传入owner，尝试从inst获取
		owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
		if owner == nil then
			return
		end
	end

	if inst:HasTag("forcefield") then
		inst:RemoveTag("forcefield")
		if inst._fx ~= nil then
			inst._fx:kill_fx()
			inst._fx = nil
		end

		local health = owner.components.health
		if health ~= nil then
			local restore_absorb = inst._prgm_prev_absorb

			if restore_absorb ~= nil then
				health:SetAbsorptionAmount(restore_absorb)
			else
				-- 如果没记录到，就按 0 处理
				health:SetAbsorptionAmount(0)
			end

			-- 只有在“不是 ghost”时才强制关闭无敌，避免破坏幽灵默认的 invincible
			if not inst:HasTag("playerghost") then
				health:SetInvincible(false)
			end
		end
		inst._prgm_prev_absorb = nil
		owner:RemoveTag("m_not_rigidity")

		if inst._task ~= nil then
			inst._task:Cancel()
			inst._task = nil
		end
	end
end

local function ruinshat_proc(inst, owner)
	local health = owner.components.health

	if health == nil then
		return
	end
	inst:AddTag("forcefield")
	if inst._fx ~= nil then
		inst._fx:kill_fx()
	end
	inst._fx = SpawnPrefab("forcefieldfx")
	inst._fx.entity:SetParent(owner.entity)
	inst._fx.Transform:SetPosition(0, 0.2, 0)

	-- 应用无敌状态
	owner:AddTag("m_not_rigidity")
	inst._prgm_prev_absorb = health.absorb or 0
	health:SetAbsorptionAmount(1)
	health:SetInvincible(true)

	if inst._task ~= nil then
		inst._task:Cancel()
	end
	-- 持续时间 10秒无敌
	inst._task = inst:DoTaskInTime(10, function()
		ruinshat_unproc(inst, owner)
	end)
end

local function Tryproc(inst, owner)
	if inst._task == nil then
		ruinshat_proc(inst, owner)
	end
end

local function protect_carehealth(owner, data, amulet)
	-- 检查玩家是否存活且不是幽灵
	if not owner.components.health or owner.components.health:IsDead() or owner:HasTag("playerghost") then
		return
	end

	-- 获取当前血量百分比
	local percent = owner.components.health:GetPercent()
	local maxhealth = owner.components.health.maxhealth

	-- 获取当前时间
	local current_time = GetTime()

	-- 检查是否已冷却
	local should_trigger = false
	local time_since_last = nil

	if percent <= 0.3 then
		if amulet.protect_time == nil then
			-- 第一次触发保护
			should_trigger = true
		else
			-- 检查冷却时间 60
			time_since_last = current_time - amulet.protect_time
			if time_since_last >= 60 then
				should_trigger = true
			end
		end
	end

	if should_trigger then
		-- 回满血量
		owner.components.health:SetVal(maxhealth)
		owner:DoTaskInTime(0, function()
			owner.components.health:DoDelta(0) -- 防止 UI 显示错误
		end)

		-- 触发冷却时间 60秒
		amulet.protect_time = current_time
		owner.components.talker:Say("护符庇佑着我！")

		if owner.components.combat then
			local fx = SpawnPrefab("wortox_soul_heal_fx")
			fx.entity:AddFollower():FollowSymbol(owner.GUID, owner.components.combat.hiteffectsymbol, 0, -50, 0)
			fx:Setup(owner)
		end

		-- 立场
		Tryproc(amulet, owner)
	end
end

function Amulettraits:onequip_protect(inst, owner)
	if self._protect_fn then
		return
	end -- 防止重复注册
	-- 使用闭包传入护符实例
	self._protect_fn = function(owner, data)
		protect_carehealth(owner, data, inst)
	end
	inst:ListenForEvent("healthdelta", self._protect_fn, owner)
end

function Amulettraits:onunequip_protect(inst, owner)
	if self._protect_fn then
		inst:RemoveEventCallback("healthdelta", self._protect_fn, owner)
		self._protect_fn = nil
	end
end
--------------------------- 护符被动回血和立场护盾 ---------------------------------------

------------------------------ 骨甲防御 ----------------------------------

local SHIELD_DURATION = 10 * FRAMES
local SHIELD_VARIATIONS = 3
local MAIN_SHIELD_CD = 1.2

local RESISTANCES = {
	"_combat",
	"explosive",
	"quakedebris",
	"lunarhaildebris",
	"caveindebris",
	"trapdamage",
}

local function PickShield(inst)
	local t = GetTime()
	local flipoffset = math.random() < 0.5 and SHIELD_VARIATIONS or 0
	local dt = t - inst.lastmainshield

	if dt >= MAIN_SHIELD_CD then
		inst.lastmainshield = t
		return flipoffset + 3
	end

	local rnd = math.random()
	if rnd < dt / MAIN_SHIELD_CD then
		inst.lastmainshield = t
		return flipoffset + 3
	end

	return flipoffset + (rnd < dt / (MAIN_SHIELD_CD * 2) + 0.5 and 2 or 1)
end

function Amulettraits:OnShieldOver()
	self.skeleton_task = self:CancelTask(self.skeleton_task)
	for i, v in ipairs(RESISTANCES) do
		self.inst.components.resistance:RemoveResistance(v)
	end
	self.inst.components.resistance:SetOnResistDamageFn(function()
		self:OnResistDamage()
	end)
end

function Amulettraits:OnResistDamage()
	-- 如果处于冷却则不触发特效
	if self.inst.components.rechargeable and not self.inst.components.rechargeable:IsCharged() then
		return
	end

	local owner = self.inst.components.inventoryitem:GetGrandOwner() or self.inst
	local fx = SpawnPrefab("shadow_shield" .. tostring(PickShield(self.inst)))
	fx.entity:SetParent(owner.entity)

	-- 开始冷却
	if self.inst.components.rechargeable then
		self.inst.components.rechargeable:Discharge(5)
	end

	self.skeleton_task = self:CancelTask(self.skeleton_task)
	self.skeleton_task = self.inst:DoTaskInTime(SHIELD_DURATION, function()
		self:OnShieldOver()
	end)
	self.inst.components.resistance:SetOnResistDamageFn(nil)

	if self.inst.components.cooldown.onchargedfn ~= nil then
		self.inst.components.cooldown:StartCharging()
	end
end

function Amulettraits:ShouldResistFn()
	if not self.inst.components.equippable:IsEquipped() then
		return false
	end
	-- 检查 rechargeable 组件是否处于冷却
	if self.inst.components.rechargeable and not self.inst.components.rechargeable:IsCharged() then
		return false
	end
	local owner = self.inst.components.inventoryitem.owner
	return owner ~= nil
		and not (owner.components.inventory ~= nil and owner.components.inventory:EquipHasTag("forcefield"))
end

function Amulettraits:OnChargedFn()
	self.skeleton_task = self:CancelTask(self.skeleton_task)
	self.inst.components.resistance:SetOnResistDamageFn(function()
		self:OnResistDamage()
	end)
	for i, v in ipairs(RESISTANCES) do
		self.inst.components.resistance:AddResistance(v)
	end
end

function Amulettraits:InitializeDefenseSystem()
	self.inst.lastmainshield = 0
	self.inst.components.cooldown.onchargedfn = function()
		self:OnChargedFn()
	end
	self.inst.components.cooldown:StartCharging(
		math.max(TUNING.ARMOR_SKELETON_FIRST_COOLDOWN, self.inst.components.cooldown:GetTimeToCharged())
	)
end

function Amulettraits:DeactivateDefenseSystem()
	self.inst.components.cooldown.onchargedfn = nil
	self.skeleton_task = self:CancelTask(self.skeleton_task)
	self.inst.components.resistance:SetOnResistDamageFn(function()
		self:OnResistDamage()
	end)
	for i, v in ipairs(RESISTANCES) do
		self.inst.components.resistance:RemoveResistance(v)
	end
end

------------------------------ 骨甲防御 ----------------------------------

-- 同步信息
------------------------------
function Amulettraits:RefreshIfEquipped()
	-- 检查物品是否被佩戴
	local owner = self.inst.components.inventoryitem and self.inst.components.inventoryitem.owner
	if not owner then
		return -- 没有被佩戴，不需要刷新
	end

	-- 检查是否佩戴在正确的槽位（护符通常戴在 NECK 或 BODY 槽）
	local equipslot = self.inst.components.equippable and self.inst.components.equippable.equipslot
	if not equipslot then
		return
	end

	-- 获取该槽位上当前装备的物品
	local equipped_item = owner.components.inventory and owner.components.inventory:GetEquippedItem(equipslot)

	-- 判断当前槽位上装备的是否是这个护符
	if equipped_item == self.inst then
		-- 是这个护符，重新触发装备效果
		if self.inst.components.equippable and self.inst.components.equippable.onunequipfn then
			self.inst.components.equippable.onunequipfn(self.inst, owner)
		end
		if self.inst.components.equippable and self.inst.components.equippable.onequipfn then
			self.inst.components.equippable.onequipfn(self.inst, owner)
		end
	end
end

-- 检查是否拥有技能
function Amulettraits:HasSkill(skill_name)
	return self.skills[skill_name] == true
end

-- 获取所有技能
function Amulettraits:GetSkills()
	return self.skills
end

function Amulettraits:SyncData()
	if self.skills == nil then
		self.skills = {}
	end
	if self.inst.replica.amulettraits ~= nil then
		self.inst.replica.amulettraits:SyncData(json.encode(self.skills))
	end
end

function Amulettraits:Upgrade(item_prefab)
	if self.skills[item_prefab] then
		return false -- 已经拥有该技能
	end
	-- 记录技能
	self.skills[item_prefab] = true

	-- 如果当前佩戴着，刷新效果
	self:RefreshIfEquipped()

	self:SyncData()

	return true
end

function Amulettraits:OnSave()
	return {
		skills = self.skills,
	}
end

function Amulettraits:OnLoad(data)
	if data ~= nil then
		self.skills = data.skills
	end

	self:SyncData()
end
------------------------------

return Amulettraits
