require("stategraphs/SGhound")

local assets = {
	Asset("ANIM", "anim/hound_basic.zip"),
	Asset("ANIM", "anim/hound_basic_water.zip"),
	Asset("ANIM", "anim/hound.zip"),
	Asset("ANIM", "anim/hound_ocean.zip"),
	Asset("ANIM", "anim/hound_red.zip"),
	Asset("ANIM", "anim/hound_red_ocean.zip"),
	Asset("ANIM", "anim/hound_ice.zip"),
	Asset("ANIM", "anim/hound_ice_ocean.zip"),
	Asset("ANIM", "anim/hound_mutated.zip"),
	Asset("SOUND", "sound/hound.fsb"),

	Asset("INV_IMAGE", "houndstooth"),
}

local prefabs = {
	"houndstooth",
	"meat",
	"redgem",
	"bluegem",
}

SetSharedLootTable("m_icehound", {
	{
		"meat",
		1.0,
	},
	{
		"bluegem",
		1.0,
	},
	{
		"houndstooth",
		0.2,
	},
	{
		"houndbone",
		0.1,
	},
})
SetSharedLootTable("m_firehound", {
	{
		"meat",
		1.0,
	},
	{
		"redgem",
		1.0,
	},
	{
		"houndstooth",
		0.2,
	},
	{
		"houndbone",
		0.1,
	},
})

-- 火狗名字库（凶猛、火焰相关的名字）
local FIREHOUND_NAMES = {
	"灰烬",
	"熔岩",
	"狱炎",
	"赤焰",
	"灼爪",
	"炎鬃",
	"焦土",
	"焚风",
	"烈阳",
	"炽牙",
}

-- 冰狗名字库（寒冷、冰雪相关的名字）
local ICEHOUND_NAMES = {
	"霜牙",
	"寒冰",
	"雪影",
	"凛冬",
	"冰魄",
	"冻原",
	"凝霜",
	"极光",
	"冰川",
	"白霜",
}

-- 随机选择名字
local function GetRandomHoundName(inst)
	if inst:HasTag("m_firehound") then
		-- return "烈焰战犬·" .. FIREHOUND_NAMES[math.random(#FIREHOUND_NAMES)]
		return FIREHOUND_NAMES[math.random(#FIREHOUND_NAMES)]
	elseif inst:HasTag("m_icehound") then
		-- return "寒冰守护者·" .. ICEHOUND_NAMES[math.random(#ICEHOUND_NAMES)]
		return ICEHOUND_NAMES[math.random(#ICEHOUND_NAMES)]
	else
		return "未知猎犬"
	end
end

-- time
local function ontimerdone(inst, data)
	if data.name == "summontime" then
		inst.sg:GoToState("dismiss")
		inst:DoTaskInTime(3, function(inst)
			SpawnPrefab("spawn_fx_tiny").Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst:Remove()
		end)
	end
end

---addskill
local function AddFx(inst, status)
	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = nil
	if status == "ice" then
		fx = SpawnPrefab("crab_king_icefx")
	else
		fx = SpawnPrefab("moonpulse_fx")
	end
	fx.Transform:SetPosition(x, y, z)
end

local HOUND_TAGS = {
	"m_hound",
}
local HOUND_IGNORE_TAGS = {
	"FX",
	"NOCLICK",
	"DECOR",
	"INLIMBO",
}
local function GetOtherHounds(inst, radius, tags)
	tags = tags or HOUND_TAGS
	local x, y, z = inst.Transform:GetWorldPosition()

	local hounds = TheSim:FindEntities(x, y, z, radius, nil, HOUND_IGNORE_TAGS, tags)
	local valid_hounds = {}

	for _, hound in ipairs(hounds) do
		if hound:IsValid() and not hound.components.health:IsDead() and not hound:HasTag("playerghost") then
			table.insert(valid_hounds, hound)
		end
	end

	return valid_hounds
end

local function DoHeal(inst)
	AddFx(inst, "ice")

	local other_hounds = GetOtherHounds(inst, 15)
	local leader = inst.components.follower.leader

	for i, hound in ipairs(other_hounds) do
		local target = inst.components.combat.target
		local targetting_us = target ~= nil
			and (
				target == inst
				or (leader ~= nil and (target == leader or leader.components.leader:IsFollower(target)))
			)
		local targetted_by_us = inst.components.combat.target == hound
			or (
				leader ~= nil
				and (leader.components.combat:TargetIs(hound) or leader.components.leader:IsTargetedByFollowers(hound))
			)

		if not (targetting_us or targetted_by_us) then
			local heal_amount = 50
			hound.components.health:DoDelta(heal_amount, false, inst.prefab)

			local fx = SpawnPrefab("wortox_eat_soul_fx")
			fx.Transform:SetRotation(hound.Transform:GetRotation())
			fx.entity:SetParent(hound.entity)
			-- 糖豆buff
			hound:AddDebuff("healthregenbuff", "healthregenbuff")
		end
	end

	inst.healtime = GetTime()
end

local function AddBuff(inst)
	AddFx(inst, "fire")
	local other_hounds = GetOtherHounds(inst, 15)
	local leader = inst.components.follower.leader

	for i, hound in ipairs(other_hounds) do
		local target = inst.components.combat.target
		local targetting_us = target ~= nil
			and (
				target == inst
				or (leader ~= nil and (target == leader or leader.components.leader:IsFollower(target)))
			)
		local targetted_by_us = inst.components.combat.target == hound
			or (
				leader ~= nil
				and (leader.components.combat:TargetIs(hound) or leader.components.leader:IsTargetedByFollowers(hound))
			)

		if not (targetting_us or targetted_by_us) then
			-- 羊角冻buff
			hound:AddDebuff("buff_electricattack", "buff_electricattack")
			-- 沃尔夫冈哨子buff
			hound:AddDebuff("wolfgang_coach_buff", "wolfgang_coach_buff")
		end
	end

	inst.bufftime = GetTime()
end

local function AddEnemyDebuffFx(fx, target)
	target:DoTaskInTime(math.random() * 0.25, function()
		local x, y, z = target.Transform:GetWorldPosition()
		local fx = SpawnPrefab(fx)
		if fx then
			fx.Transform:SetPosition(x, y, z)
		end

		return fx
	end)
end

local function DoTaunt(inst)
	local pos = Vector3(inst.Transform:GetWorldPosition())
	local leader = inst.components.follower.leader
	local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 15, nil, {
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
	for k, v in pairs(ents) do
		if
			v:IsValid()
			and v.components.health
			and v.components.combat
			and (v:HasTag("monster") or v.components.combat.target == leader)
		then
			v.components.combat:SetTarget(inst)
			AddEnemyDebuffFx("battlesong_instant_taunt_fx", v)
		end
	end
end
----------------------------------------------------------

-- target
local SHARE_TARGET_DIST = 30
local NO_TAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "player", "companion" }
local RETARGET_MUST_TAGS = { "_combat" }
local RETARGET_CANT_TAGS = { "INLIMBO", "player", "companion" }

local function RetargetFn(inst)
	if inst.components.follower and inst.components.follower.leader then
		local leader = inst.components.follower.leader

		-- 在座狼周围寻找敌人
		local target = FindEntity(inst, SHARE_TARGET_DIST, function(guy)
			if guy.components.health and not guy.components.health:IsDead() then
				-- 条件1：敌人正在攻击主人
				if guy.components.combat and guy.components.combat.target == leader then
					return true
				end
				-- 条件2：主人正在攻击这个敌人
				if leader.components.combat and leader.components.combat.target == guy then
					return true
				end
			end
			return false
		end, RETARGET_MUST_TAGS, RETARGET_CANT_TAGS)

		if target then
			return target
		end
	end
end

local function KeepTargetFn(inst, target)
	return target
		and target.components.combat
		and target.components.health
		and not target.components.health:IsDead()
		and not (inst.components.follower and inst.components.follower:IsLeaderSame(target))
		and not (inst.components.follower and inst.components.follower.leader == target)
end

local function OnAttacked(inst, data)
	-- 如果是主人攻击，立即消失
	if data.attacker == inst.components.follower.leader then
		inst.sg:GoToState("dismiss")
		inst:DoTaskInTime(3, function(inst)
			SpawnPrefab("spawn_fx_tiny").Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst:Remove()
		end)
		return
	end
	if not (data.attacker:HasTag("player") or data.attacker:HasTag("m_hound") or data.attacker:HasTag("m_pet")) then
		inst.components.combat:SetTarget(data.attacker)
		inst.components.combat:ShareTarget(data.attacker, SHARE_TARGET_DIST, function(dude)
			return (dude:HasTag("m_hound") or dude:HasTag("m_pet")) and not dude.components.health:IsDead()
		end, 5)
	end
end
----------------------------------------------------------

local function fncommon(bank, build)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

	inst.DynamicShadow:SetSize(2.5, 1.5)
	inst.Transform:SetFourFaced()
	inst.Transform:SetScale(0.6, 0.6, 0.6)

	inst:AddTag("m_hound")
	inst:AddTag("companion")
	-- 不妨碍玩家摆放建筑物
	inst:AddTag("NOBLOCK")

	-- MakeGhostPhysics(inst, 10, 0.5)
	MakeGiantCharacterPhysics(inst, 10, 0.5)

	inst.AnimState:SetBank(bank)
	inst.AnimState:SetBuild(build)
	inst.AnimState:PlayAnimation("idle")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
	inst.components.locomotor.runspeed = 18
	inst:SetStateGraph("SGmhound")

	-- 航海
	inst:AddComponent("embarker")
	inst.components.embarker.embark_speed = inst.components.locomotor.runspeed
	inst.components.embarker.antic = true

	inst.components.locomotor:SetAllowPlatformHopping(true)

	inst:AddComponent("amphibiouscreature")
	inst.components.amphibiouscreature:SetBanks("hound", "hound_water")
	inst.components.amphibiouscreature:SetEnterWaterFn(function(inst)
		inst.landspeed = inst.components.locomotor.runspeed
		inst.components.locomotor.runspeed = 9 -- 3.5
		inst.hop_distance = inst.components.locomotor.hop_distance
		inst.components.locomotor.hop_distance = 4
	end)
	inst.components.amphibiouscreature:SetExitWaterFn(function(inst)
		if inst.landspeed then
			inst.components.locomotor.runspeed = inst.landspeed
		end
		if inst.hop_distance then
			inst.components.locomotor.hop_distance = inst.hop_distance
		end
	end)

	inst.components.locomotor.pathcaps = {
		allowocean = true,
	}

	local brain = require("brains/m_houndbrain")
	inst:SetBrain(brain)

	inst:AddComponent("follower")

	inst:AddComponent("knownlocations")

	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(650)
	inst.components.health.absorb = 0.3
	-- 5s回15点
	inst.components.health:StartRegen(15, 5)

	inst:AddComponent("inventory")

	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_MED

	inst:AddComponent("combat")
	inst.components.combat:SetDefaultDamage(30)
	inst.components.combat:SetAttackPeriod(1)
	-- retargetfn RetargetFn
	inst.components.combat:SetRetargetFunction(3, RetargetFn)
	inst.components.combat:SetKeepTargetFunction(KeepTargetFn)
	inst.components.combat:SetHurtSound("dontstarve/creatures/hound/hurt")

	--
	inst:AddComponent("timer")
	-- total_day_time = 480
	inst.components.timer:StartTimer("summontime", 480)
	inst:ListenForEvent("timerdone", ontimerdone)

	inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetChanceLootTable("m_hound")

	inst:AddComponent("inspectable")

	inst:ListenForEvent("attacked", OnAttacked)

	-- 位面防御
	inst:AddComponent("planardefense")
	inst.components.planardefense:SetBaseDefense(10)
	-- 位面伤害
	inst:AddComponent("planardamage")
	inst.components.planardamage:SetBaseDamage(15)

	-- 嘲讽
	inst.DoTaunt = DoTaunt

	inst:AddComponent("named")

	return inst
end

local function fnfire(inst)
	local inst = fncommon("hound", "hound_red_ocean")

	inst:AddTag("m_firehound")
	inst:AddTag("hound_buffer")

	if not TheWorld.ismastersim then
		return inst
	end

	inst.components.lootdropper:SetChanceLootTable("m_firehound")

	inst:ListenForEvent("onhitother", function(inst, data)
		local other = data.target
		if other and other.components.health then
			other.components.health:DoDelta(-60, nil, (inst.nameoverride or inst.prefab), true, inst, true)
		end
	end)

	inst:ListenForEvent("death", function(inst)
		local x, y, z = inst.Transform:GetWorldPosition()
		local ents = TheSim:FindEntities(x, y, z, 4, nil, NO_TAGS)
		for i, v in pairs(ents) do
			if v ~= nil and v:IsValid() and v.components.health then
				v.components.health:DoDelta(-1000, nil, (inst.nameoverride or inst.prefab), true, inst, true)
			end
		end
		inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/firehound_explo")
	end)

	inst.AddBuff = AddBuff

	-- 阵营加伤
	inst:AddComponent("damagetypebonus")
	inst.components.damagetypebonus:AddBonus("shadow_aligned", inst, 1.1)
	inst.components.damagetypebonus:AddBonus("lunar_aligned", inst, 1.1)

	inst.components.named:SetName(GetRandomHoundName(inst))

	return inst
end

local function fncold(inst)
	local inst = fncommon("hound", "hound_ice_ocean")

	inst:AddTag("m_icehound")
	inst:AddTag("hound_healer")

	if not TheWorld.ismastersim then
		return inst
	end

	inst.components.lootdropper:SetChanceLootTable("m_icehound")

	inst:ListenForEvent("onhitother", function(inst, data)
		local other = data.target
		-- 增加冰冻
		if other and other.components.freezable then
			other.components.freezable:AddColdness(1)
			other.components.freezable:SpawnShatterFX()
		end
		-- 增加潮湿度
		if other and other.components.moisture then
			other.components.moisture:DoDelta(100, true)
		end
	end)

	inst:ListenForEvent("death", function(inst)
		if not inst.components.freezable then
			MakeMediumFreezableCharacter(inst, "hound_body")
		end
		inst.components.freezable:SpawnShatterFX()
		inst:RemoveComponent("freezable")
		local x, y, z = inst.Transform:GetWorldPosition()
		local ents = TheSim:FindEntities(x, y, z, 4, {
			"freezable",
		}, NO_TAGS)
		for i, v in pairs(ents) do
			if v.components.freezable then
				v.components.freezable:AddColdness(10)
			end
		end

		inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/icehound_explo")
	end)

	inst.DoHeal = DoHeal

	-- 阵营减伤
	inst:AddComponent("damagetyperesist")
	inst.components.damagetyperesist:AddResist("shadow_aligned", inst, 0.9)
	inst.components.damagetyperesist:AddResist("lunar_aligned", inst, 0.9)

	inst.components.named:SetName(GetRandomHoundName(inst))

	return inst
end

return Prefab("m_firehound", fnfire, assets, prefabs), Prefab("m_icehound", fncold, assets, prefabs)
