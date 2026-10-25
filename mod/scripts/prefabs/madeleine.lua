local MakePlayerCharacter = require("prefabs/player_common")

local assets = {
	Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset("ANIM", "anim/madeleine.zip"),
	Asset("ANIM", "anim/ghost_madeleine_build.zip"),
	Asset("IMAGE", "images/colour_cubes/beaver_vision_cc.tex"),
}

-- 开局自带
local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
	start_inv[string.lower(k)] = v.MADELEINE
end
local prefabs = FlattenTree(start_inv, true)

--[[----------------------------
    Chiropteran Forming
----------------------------]]
--
local function OnDark(inst)
	inst.components.chiropteran:ForceForm(inst, "dark")
end

local function OnLight(inst)
	inst.components.chiropteran:UnforceForm(inst, "dark")
end

local function OnStarving(inst)
	inst.components.chiropteran:ForceForm(inst, "bloodcrazed")
end

local function OnStopStarving(inst)
	inst.components.chiropteran:UnforceForm(inst, "bloodcrazed")
end

------------------------------------------------------------------------

-- 【贪婪】能力配置
local GREED_CONFIG = {
	NORMAL_CHANCE = 0.3, -- 普通生物30%触发几率
	SPECIAL_CHANCE = 1.0, -- 特殊生物100%触发几率
	HUNGER_COST = 1, -- 每次消耗3点饥饿
	TAG = { "INLIMBO", "wall" }, -- 不触发生物标签
}

-- 特殊生物固定掉落表（100%触发）
local SPECIAL_LOOT = {
	butterfly = "butter", -- 固定掉黄油
	bat = "batwing", -- 固定掉蝙蝠翅膀
	gnarwail = "gnarwail_horn", -- 固定掉落一角鲸的角
	lightninggoat = "lightninggoathorn", -- 固定掉落羊角
	killerbee = "honey", -- 固定掉蜂蜜
}

-- 【新增】击杀后100%添加标签的生物列表（不受概率和饥饿影响）
local TAG_ON_KILL = {
	warg = { tag = "madeleine_warg", msg = "我解锁了狼王哨子图纸！" },
	mutatedwarg = { tag = "madeleine_warg", msg = "我解锁了狼王哨子图纸！" },
	leif = { tag = "madeleine_leif", msg = "我解锁了树精雕像图纸！" },
	leif_sparse = { tag = "madeleine_leif", msg = "我解锁了树精雕像图纸！" },
	mushgnome = { tag = "madeleine_leif", msg = "我解锁了树精雕像图纸！" },
}

-- 核心贪婪掉落函数
local function onkilled(inst, data)
	local victim = data.victim
	if not victim or not victim.components.lootdropper then
		return
	end

	-- 【优先处理】击杀固定生物添加标签（100%触发，不受任何限制）
	local victim_prefab = victim.prefab
	local kill_config = TAG_ON_KILL[victim_prefab]
	if kill_config and not inst:HasTag(kill_config.tag) then
		inst:AddTag(kill_config.tag)

		-- 【新增】保存到持久化数据
		if not inst.madeleine_unlocked_tags then
			inst.madeleine_unlocked_tags = {}
		end
		if not table.contains(inst.madeleine_unlocked_tags, kill_config.tag) then
			table.insert(inst.madeleine_unlocked_tags, kill_config.tag)
		end

		-- 显示解锁图纸的对话
		if inst.components.talker then
			inst.components.talker:Say(kill_config.msg, 2.5)
		end
		local fx = SpawnPrefab("fx_book_research_station")
		fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
		fx.Transform:SetRotation(inst.Transform:GetRotation())
	end

	-- 【贪婪掉落逻辑】检查是否应该跳过（带有epic等标签的生物）
	if victim:HasAnyTag(GREED_CONFIG.TAG) then
		return
	end

	local is_special = SPECIAL_LOOT[victim_prefab] ~= nil
	local trigger_chance = is_special and GREED_CONFIG.SPECIAL_CHANCE or GREED_CONFIG.NORMAL_CHANCE

	-- 检查触发几率
	if math.random() <= trigger_chance then
		-- 检查饥饿值是否足够支付代价
		-- if inst.components.hunger.current > GREED_CONFIG.HUNGER_COST then
		-- 支付代价：消耗饥饿值
		-- inst.components.hunger:DoDelta(-GREED_CONFIG.HUNGER_COST)

		-- 根据生物类型决定掉落
		if is_special then
			-- 特殊生物：100%掉落指定物品
			victim.components.lootdropper:SpawnLootPrefab(SPECIAL_LOOT[victim_prefab])

			-- 视觉反馈
			if inst.components.talker then
				inst.components.talker:Say("这是我应得的！", 1.5)
			end
		else
			-- 普通生物：随机复制2份常规掉落
			local loots = victim.components.lootdropper:GenerateLoot()
			if #loots > 0 then
				local random_loot = loots[math.random(#loots)]
				victim.components.lootdropper:SpawnLootPrefab(random_loot)
				victim.components.lootdropper:SpawnLootPrefab(random_loot)
			end

			-- 视觉反馈
			local fx = SpawnPrefab("carnival_sparkle_fx")
			fx.Transform:SetPosition(victim.Transform:GetWorldPosition())
			if inst.components.talker then
				inst.components.talker:Say("多劳多得！", 1.5)
			end
		end
		-- else
		-- 	-- 饥饿不足时的反馈
		-- 	if inst.components.talker then
		-- 		inst.components.talker:Say("饿...拿不动了", 1.5)
		-- 	end
		-- end
	end
end

local function OnUnEquip(inst, data)
	if inst.components.madeleinetraits.power == 1 and data.eslot == EQUIPSLOTS.HANDS then
		inst.components.madeleinetraits:PowerRemove(inst)
	end
	if data.eslot == (EQUIPSLOTS.NECK or EQUIPSLOTS.BODY) then
		if inst.components.madeleinetraits.setsantiy then
			inst.components.madeleinetraits.setsantiy = false
			inst.components.sanity:SetInducedInsanity(inst, false)
		end
	end
end

local function GetEquippableDapperness(owner, equippable)
	local dapperness = equippable:GetDapperness(owner, owner.components.sanity.no_moisture_penalty)
	return equippable.inst:HasTag("shadow_item") and dapperness * TUNING.WAXWELL_SHADOW_ITEM_RESISTANCE or dapperness
end

local function CustomSanityRateFn(inst)
	local rate = 0
	local phase = TheWorld.state.phase

	if phase == "night" then
		rate = rate + (2 / 60)
	end

	-- Rain recovery (-5/min)
	if TheWorld.state.israining then
		rate = rate - (5 / 60)
	end

	return rate
end

-- 小恶魔待机动画
local soulfx_symbols = {
	"tail",
	"swirl3",
	"swirl2",
	"swirl1",
	"star01",
	"spiral_ripple",
	"spiral",
	"outer_fire",
	"moon_glow2",
	"moon_glow",
	"glow",
	"flame2",
	"blob",
}

-- This initializes for both clients and the host
local common_postinit = function(inst)
	-- 添加 Wortox 的待机动画资源
	inst.AnimState:AddOverrideBuild("player_idles_wortox_naughty")
	-- 添加灵魂球特效（idle_naughty 的视觉元素）
	inst.AnimState:AddOverrideBuild("wortox_soul_ball")
	-- 小恶魔灵魂球
	for _, v in ipairs(soulfx_symbols) do
		inst.AnimState:OverrideSymbol("soulfx_" .. v, "wortox_soul_ball", v)
	end

	inst.soundsname = "wendy"
	-- Minimap icon
	inst.MiniMapEntity:SetIcon("madeleine.tex")
	-- 变身相关
	inst.nofootsteps = net_bool(inst.GUID, "player.nofootsteps")
	inst.nofootsteps:set(false)
end

-- 当人物复活的时候
local function onbecamehuman(inst)
	-- 设置人物的移速（1表示1倍于wilson）
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "madeleine_speed_mod", 1.2)
end
--当人物死亡的时候
local function onbecameghost(inst)
	-- 变成鬼魂的时候移除速度修正
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "madeleine_speed_mod")
end

-- 重载游戏或者生成一个玩家的时候
local function onsave(inst, data)
	-- 保存解锁的标签列表
	if inst.madeleine_unlocked_tags and #inst.madeleine_unlocked_tags > 0 then
		data.madeleine_unlocked_tags = inst.madeleine_unlocked_tags
	end
end
local function onload(inst, data)
	inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
	inst:ListenForEvent("ms_becameghost", onbecameghost)

	if inst:HasTag("playerghost") then
		onbecameghost(inst)
	else
		onbecamehuman(inst)
	end

	-- 恢复解锁标签
	if data and data.madeleine_unlocked_tags then
		inst.madeleine_unlocked_tags = data.madeleine_unlocked_tags
		for _, tag in ipairs(data.madeleine_unlocked_tags) do
			inst:AddTag(tag)
		end
	end
end

-- 图书管理员
local function AddBookmaker(inst)
	inst:AddTag("bookbuilder")
	inst:AddTag("reader")
	inst:AddComponent("reader")
end

-- This initializes for the host only
local master_postinit = function(inst)
	--小恶魔待机动画
	inst.customidleanim = "idle_naughty"

	inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	-- States
	inst.components.health:SetMaxHealth(TUNING.MADELEINE_HEALTH)
	inst.components.hunger:SetMax(TUNING.MADELEINE_HUNGER)
	inst.components.sanity:SetMax(TUNING.MADELEINE_SANITY)
	inst.components.sanity.custom_rate_fn = CustomSanityRateFn

	-- 初始伤害吸收系数为零，也就是护甲=0
	-- inst.components.health.absorb = 0
	-- 火伤倍数
	inst.components.health.fire_damage_scale = 1
	-- 饥饿倍率
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
	-- 夜晚时精神流失速度 比别的角色少0%
	inst.components.sanity.night_drain_mult = 0
	-- 靠近怪物时精神流失速度 比别的角色少25%
	inst.components.sanity.neg_aura_mult = 1.15
	-- 增加精神恢复速度X/分钟 100/(day_time*3), 100/(300*3) = 0.11 和waxwell一样
	inst.components.sanity.dapperness = TUNING.DAPPERNESS_LARGE
	-- 持有暗影物品不受到减san效果
	inst.components.sanity.get_equippable_dappernessfn = GetEquippableDapperness
	-- 保暖为30 seg_time
	inst.components.temperature.inherentinsulation = TUNING.INSULATION_TINY
	-- 隔热为30 seg_time
	inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_TINY
	-- 伤害倍率
	inst.components.combat.damagemultiplier = 1
	-- 免疫查理的进攻次数
	inst.components.grue:SetResistance(3)
	-- 开局自带一级魔法/科技
	inst.components.builder.science_bonus = 1
	inst.components.builder.magic_bonus = 2
	-- 降低魔法物品理智消耗
	inst:AddComponent("staffsanity")
	inst.components.staffsanity:SetMultiplier(TUNING.WANDA_STAFFSANITY_OLD)
	-- 可以吃怪物肉
	-- inst.components.eater.strongstomach = true

	-- 最喜欢鱼类料理,只加饥饿
	-- 鱼汤 37.5*1.66 seafoodgumbo
	-- 炸鱼排 37.5*1.66 fishsticks
	-- 海鲜牛排 37.5*2.66 surfnturf
	-- 酿鱼头 75*1.66 barnaclestuffedfishhead
	-- 海鲜杂烩 112.5*1.33
	local foodaffinity = inst.components.foodaffinity
	-- 炸鱼排 37.5
	foodaffinity:AddPrefabAffinity("fishsticks", 1.33)
	-- foodaffinity:AddFoodtypeAffinity(FOODTYPE.MEAT, 1.33)
	-- foodaffinity:AddFoodtypeAffinity(FOODTYPE.GOODIES, 1.33)
	-- 物品栏有金子回san
	-- inst:AddComponent("itemaffinity")
	-- 猫尾扣san
	-- inst.components.itemaffinity:AddAffinity("coontail", nil, -TUNING.DAPPERNESS_LARGE, 2)

	inst:AddTag("madeleine")

	-- 添加薇克巴顿技能
	AddBookmaker(inst)
	-- 帽子戏法
	inst:AddTag("magician")
	inst:AddComponent("magician")

	-- 专属宠物：浣猫崽（出生自带，跟随、可开储物格）
	-- 用自定义的 m_petleash 而不是原版 petleash，避免占用玩家召唤其它宠物的名额
	inst:AddComponent("m_petleash")
	inst.components.m_petleash:SetPetPrefab("m_kitcoon")
	inst:DoTaskInTime(1, function(inst2)
		if inst2.components.m_petleash ~= nil then
			inst2.components.m_petleash:EnsurePet()
		end
	end)

	-- skill
	inst:AddComponent("madeleinetraits")
	inst:ListenForEvent("powerready_fire", function(inst)
		inst.components.madeleinetraits:PowerReady(inst, "deer_fire_charge")
	end)
	inst:ListenForEvent("powerready_ice", function(inst)
		inst.components.madeleinetraits:PowerReady(inst, "deer_ice_charge")
	end)
	inst:ListenForEvent("togglesanity", function(inst)
		inst.components.madeleinetraits:ToggleSanity(inst)
	end)
	inst:ListenForEvent("togglelight", function(inst)
		inst.components.madeleinetraits:ToggleLight(inst)
	end)
	--表情监听
	inst:ListenForEvent("emote", function(inst, data)
		inst.components.madeleinetraits:EmoteMagicSkill(inst, data)
	end)

	--工作暴击
	inst:AddComponent("critwork")
	--物品栏新鲜度
	inst:AddComponent("preserver")
	-- 幸运属性 没变异了
	-- inst.components.luckuser:SetLuckSource(3, "madeleine_fortune")

	-- 变身
	inst:DoPeriodicTask(1, function()
		if inst.components.chiropteran.transformed then
			inst.components.sanity:DoDelta(-1, true)
		end
	end)
	inst:DoPeriodicTask(0.5, function()
		if
			inst.components.chiropteran.transformed
			and not inst.components.chiropteran.forceformed
			and inst.replica.sanity == 0
		then
			inst.components.chiropteran:ChiropteraStop(inst)
		end
	end)

	inst:AddComponent("chiropteran")
	inst:ListenForEvent("death", function()
		inst.components.chiropteran:ChiropteraStop(inst)
	end)

	-- Carry heavy
	-- inst:ListenForEvent("equip", OnEquip)
	inst:ListenForEvent("unequip", OnUnEquip)

	-- 【核心】监听击杀事件，触发贪婪掉落
	inst:ListenForEvent("killed", onkilled)
	-- 初始化速度
	inst.OnSave = onsave
	inst.OnLoad = onload
	inst.OnNewSpawn = onload
end

return MakePlayerCharacter("madeleine", prefabs, assets, common_postinit, master_postinit, start_inv)
