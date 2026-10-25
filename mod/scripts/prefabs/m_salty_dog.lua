-- m_salty_dog
-- 护符召唤的盐狗：保留积盐 / 下水 / 抖盐掉地上，只捡盐，不给它生命值、不带碰撞体积。
-- 由 m_amulet 在「护符带巨鹿眼球」时召唤，脱下护符就消失。

local brain = require("brains/m_saltydogbrain")

local assets = {
	Asset("ANIM", "anim/salty_dog.zip"),
	Asset("ANIM", "anim/pupington_basic.zip"),
	Asset("ANIM", "anim/pupington_emotes.zip"),
	Asset("ANIM", "anim/pupington_traits.zip"),
	Asset("ANIM", "anim/pupington_jump.zip"),
	Asset("ANIM", "anim/pupington_basic_water.zip"),
}

local prefabs = {
	"saltrock",
}

-- 水里积盐更快
local IN_WATER_SALT_RATE = 0.5

local function UpdateSaltVisuals(inst)
	local count = 0
	local counter = inst.components.counter
	if counter ~= nil then
		count = math.min(
			math.floor(((counter:GetCount("salty") - 1) * 2 / TUNING.SALTY_DOG_MAX_SALT_COUNT) + 1.001),
			2
		)
	end

	if count > 0 then
		inst.AnimState:OverrideSymbol("body", "salty_dog", "body_stage" .. count)
		inst.AnimState:OverrideSymbol("body_overlay", "salty_dog", "body_overlay_stage" .. count)
	else
		inst.AnimState:ClearOverrideSymbol("body")
		inst.AnimState:ClearOverrideSymbol("body_overlay")
	end
end

local function IsInWater(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
	return TheWorld.Map:IsOceanAtPoint(x, y, z, false)
end

local function StartSaltTimer(inst)
	local interval = TUNING.SALTY_DOG_TIME_TO_SALT
	if IsInWater(inst) then
		interval = interval * IN_WATER_SALT_RATE
	end
	inst.components.timer:StartTimer("salty", interval)
end

-- 把身上的盐抖到地上
local function ShedSalt(inst)
	local counter = inst.components.counter
	local count = counter ~= nil and counter:GetCount("salty") or 0
	if count <= 0 then
		return
	end

	counter:Clear("salty")
	UpdateSaltVisuals(inst)

	local x, y, z = inst.Transform:GetWorldPosition()
	for i = 1, count do
		local salt = SpawnPrefab("saltrock")
		if salt ~= nil then
			local ox = math.random() * 1.6 - 0.8
			local oz = math.random() * 1.6 - 0.8
			salt.Transform:SetPosition(x + ox, 0, z + oz)
		end
	end

	inst.SoundEmitter:PlaySound("winter2025/saltydog/salt_shake")
end

local function OnTimerDone(inst, data)
	if data == nil or data.name ~= "salty" then
		return
	end

	local counter = inst.components.counter
	if counter:GetCount("salty") < TUNING.SALTY_DOG_MAX_SALT_COUNT then
		counter:Increment("salty", 1)
		UpdateSaltVisuals(inst)
	end

	StartSaltTimer(inst)
end

local function OnEnterWater(inst)
	-- 下水后改成更快的积盐节奏（StartTimer 会覆盖同名计时器）
	StartSaltTimer(inst)
end

local function OnExitWater(inst)
	-- 上岸恢复原来的积盐节奏
	StartSaltTimer(inst)
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

	-- 无碰撞体积
	MakeGhostPhysics(inst, 1, .5)
	RemovePhysicsColliders(inst)

	inst.DynamicShadow:SetSize(1, .5)
	inst.Transform:SetFourFaced()

	inst.AnimState:SetBank("pupington")
	inst.AnimState:SetBuild("salty_dog")
	inst.AnimState:PlayAnimation("idle_loop", true)
	inst.AnimState:OverrideSymbol("water_ripple", "pupington_basic_water", "water_ripple")
	inst.AnimState:OverrideSymbol("water_shadow", "pupington_basic_water", "water_shadow")

	inst:AddTag("animal")
	inst:AddTag("smallcreature")
	inst:AddTag("companion")
	inst:AddTag("untrappable")
	inst:AddTag("noplayertarget")
	inst:AddTag("NOBLOCK")
	inst:AddTag("notraptrigger")
	inst:AddTag("noauradamage")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.persists = false

	inst:AddComponent("locomotor")
	inst.components.locomotor.walkspeed = TUNING.POLLY_ROGERS_WALK_SPEED
	inst.components.locomotor.runspeed = TUNING.POLLY_ROGERS_RUN_SPEED
	inst.components.locomotor:SetTriggersCreep(false)
	inst.components.locomotor:SetAllowPlatformHopping(true)
	-- 允许把海面当路径（原版 polly/salty dog 都这么设），否则它永远走不进水
	inst.components.locomotor.pathcaps = { allowocean = true }

	-- 上下水的 hop_pre 状态会直接读 components.embarker（commonstates.lua:1039）
	inst:AddComponent("embarker")
	inst.components.embarker.embark_speed = inst.components.locomotor.runspeed

	inst:AddComponent("inventory")
	inst.components.inventory.maxslots = 1

	inst:AddComponent("follower")
	inst.components.follower:KeepLeaderOnAttacked()

	inst:AddComponent("inspectable")

	inst:AddComponent("counter")
	inst:AddComponent("timer")
	inst:ListenForEvent("timerdone", OnTimerDone)

	inst:AddComponent("amphibiouscreature")
	inst.components.amphibiouscreature:SetBanks("pupington", "pupington_water")
	inst.components.amphibiouscreature:SetEnterWaterFn(OnEnterWater)
	inst.components.amphibiouscreature:SetExitWaterFn(OnExitWater)
	inst.components.amphibiouscreature:SetTransitionDistance(0.5)

	inst.ShedSalt = ShedSalt
	inst.UpdateSaltVisuals = UpdateSaltVisuals
	inst.IsInWater = IsInWater

	inst:SetStateGraph("SGm_salty_dog")
	inst:SetBrain(brain)

	-- 出现 / 消失交给状态机的 summon / desummon（水花 + 跳跃，可参考 SGm_salty_dog）
	inst.PlaySummonAppear = function(inst2)
		inst2:PushEvent("summon")
	end

	inst.PlaySummonDespawn = function(inst2)
		inst2:PushEvent("desummon")
	end

	StartSaltTimer(inst)

	return inst
end

return Prefab("m_salty_dog", fn, assets, prefabs)
