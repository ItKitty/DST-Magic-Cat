-- m_stafflight
-- 灵魂法杖火形态召唤的「矮星」。
-- 与原生 stafflight 的区别：不挂 propagator，所以不会烤着周围的建筑和植物，
-- 只保留照明、取暖、烤食物、理智光环和熄灭功能。
-- 独立 prefab，不去 hook 原版，避免影响星杖等其它来源的矮星。

local PULSE_SYNC_PERIOD = 30

local assets = {
	Asset("ANIM", "anim/star_hot.zip"),
}

local function kill_sound(inst)
	inst.SoundEmitter:KillSound("staff_star_loop")
end

local function kill_light(inst)
	inst:PushEvent("onstarkilled")
	inst.AnimState:PlayAnimation("disappear")
	inst:ListenForEvent("animover", kill_sound)
	inst:DoTaskInTime(1, inst.Remove) -- 和原版一致，1 秒后移除
	inst.persists = false
	inst._killed = true
end

local function ontimer(inst, data)
	if data.name == "extinguish" then
		kill_light(inst)
	end
end

local function onpulsetimedirty(inst)
	inst._pulseoffs = inst._pulsetime:value() - inst:GetTimeAlive()
end

local function pulse_light(inst)
	local timealive = inst:GetTimeAlive()

	if inst._ismastersim then
		if timealive - inst._lastpulsesync > PULSE_SYNC_PERIOD then
			inst._pulsetime:set(timealive)
			inst._lastpulsesync = timealive
		else
			inst._pulsetime:set_local(timealive)
		end

		inst.Light:Enable(true)
	end

	local s = math.abs(math.sin(PI * (timealive + inst._pulseoffs) * 0.05))
	local rad = Lerp(11, 12, s)
	local intensity = Lerp(0.8, 0.7, s)
	local falloff = Lerp(0.8, 0.7, s)
	inst.Light:SetFalloff(falloff)
	inst.Light:SetIntensity(intensity)
	inst.Light:SetRadius(rad)
end

local function ForceExtinguish(inst)
	if inst.components.timer:TimerExists("extinguish") then
		inst.components.timer:StopTimer("extinguish")
		kill_light(inst)
	end
end

local function onhaunt(inst)
	if inst.ForceExtinguish ~= nil then
		inst:ForceExtinguish()
	end
	return true
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddNetwork()

	inst._ismastersim = TheWorld.ismastersim
	inst._pulseoffs = 0
	inst._pulsetime = net_float(inst.GUID, "_pulsetime", "pulsetimedirty")

	inst.scrapbook_persishable = TUNING.YELLOWSTAFF_STAR_DURATION
	inst.scrapbook_anim = "idle_loop"

	inst:DoPeriodicTask(0.1, pulse_light)

	inst.Light:SetColour(223 / 255, 208 / 255, 69 / 255)
	inst.Light:Enable(false)
	inst.Light:EnableClientModulation(true)

	inst.AnimState:SetBank("star_hot")
	inst.AnimState:SetBuild("star_hot")
	inst.AnimState:PlayAnimation("appear")
	inst.AnimState:PushAnimation("idle_loop", true)
	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

	-- HASHEATER（来自 heater 组件）提前加到 pristine 状态，优化用
	inst:AddTag("HASHEATER")

	inst:AddTag("ignorewalkableplatforms")
	inst:SetPhysicsRadiusOverride(.5)
	inst.no_wet_prefix = true

	inst:AddTag("staffstar")
	inst:AddTag("cooker")
	inst:AddTag("daylight")
	inst:AddTag("heatstar")

	inst.SoundEmitter:PlaySound("dontstarve/common/staff_star_LP", "staff_star_loop", nil, not inst._ismastersim)

	inst.entity:SetPristine()

	if not inst._ismastersim then
		inst:ListenForEvent("pulsetimedirty", onpulsetimedirty)
		return inst
	end

	inst._pulsetime:set(inst:GetTimeAlive())
	inst._lastpulsesync = inst._pulsetime:value()

	inst:AddComponent("cooker")

	inst:AddComponent("heater")
	inst.components.heater.heat = 100

	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL

	inst.ForceExtinguish = ForceExtinguish
	inst:AddComponent("inspectable")

	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	inst.components.hauntable:SetOnHauntFn(onhaunt)

	inst:AddComponent("timer")
	inst.components.timer:StartTimer("extinguish", TUNING.YELLOWSTAFF_STAR_DURATION)
	inst:ListenForEvent("timerdone", ontimer)

	inst.SoundEmitter:PlaySound("dontstarve/common/staff_star_create")

	return inst
end

return Prefab("m_stafflight", fn, assets)
