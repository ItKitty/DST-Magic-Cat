-- m_victorian_sparkle_fx - 维多利亚手杖星屑（站立时也持续发光版）
--
-- 抄自原版 prefabs/cane_victorian_fx.lua，只改一处：
-- 原版粒子密度按移动速度在 [5, 50] pps 之间插值，站着几乎看不见；
-- 这里把下限提高，站立时也有稳定的星屑（默认 25 pps，移动时 60 pps）。
--
-- 包络名字改成 m_ 前缀：EnvelopeManager 的 key 是全局的，
-- 沿用原版名字会和原版手杖的包络互相覆盖。

local SPARKLE_TEXTURE = "fx/sparkle.tex"
local ADD_SHADER = "shaders/vfx_particle_add.ksh"

local COLOUR_ENVELOPE_NAME = "m_victorian_sparkle_colourenvelope"
local SCALE_ENVELOPE_NAME = "m_victorian_sparkle_scaleenvelope"

local MIN_PPS = 25   -- 站立时的粒子数/秒
local MAX_PPS = 60   -- 全速移动时的粒子数/秒
local MAX_LIFETIME = 1.75

local assets = {
	Asset("IMAGE", SPARKLE_TEXTURE),
	Asset("SHADER", ADD_SHADER),
}

local function IntColour(r, g, b, a)
	return { r / 255, g / 255, b / 255, a / 255 }
end

local function InitEnvelope()
	local envs = {}
	local t = 0
	local step = .15
	while t + step + .01 < 1 do
		table.insert(envs, { t, IntColour(255, 255, 150, 255) })
		t = t + step
		table.insert(envs, { t, IntColour(255, 255, 150, 0) })
		t = t + .01
	end
	table.insert(envs, { 1, IntColour(255, 255, 150, 0) })

	EnvelopeManager:AddColourEnvelope(COLOUR_ENVELOPE_NAME, envs)

	local sparkle_max_scale = .4
	EnvelopeManager:AddVector2Envelope(
		SCALE_ENVELOPE_NAME,
		{
			{ 0, { sparkle_max_scale, sparkle_max_scale } },
			{ 1, { sparkle_max_scale * .5, sparkle_max_scale * .5 } },
		}
	)

	InitEnvelope = nil
	IntColour = nil
end

local function emit_sparkle_fn(effect, sphere_emitter)
	local vx, vy, vz = .012 * UnitRand(), 0, .012 * UnitRand()
	local lifetime = MAX_LIFETIME * (.7 + UnitRand() * .3)
	local px, py, pz = sphere_emitter()

	local angle = math.random() * 360
	local uv_offset = math.random(0, 3) * .25
	local ang_vel = (UnitRand() - 1) * 5

	effect:AddRotatingParticleUV(
		0,
		lifetime,
		px, py, pz,
		vx, vy, vz,
		angle, ang_vel,
		uv_offset, 0
	)
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddNetwork()

	inst:AddTag("FX")

	inst.entity:SetPristine()

	inst.persists = false

	-- 专服不需要本地粒子
	if TheNet:IsDedicated() then
		return inst
	elseif InitEnvelope ~= nil then
		InitEnvelope()
	end

	local effect = inst.entity:AddVFXEffect()
	effect:InitEmitters(1)

	effect:SetRenderResources(0, SPARKLE_TEXTURE, ADD_SHADER)
	effect:SetRotationStatus(0, true)
	effect:SetUVFrameSize(0, .25, 1)
	effect:SetMaxNumParticles(0, 256)
	effect:SetMaxLifetime(0, MAX_LIFETIME)
	effect:SetColourEnvelope(0, COLOUR_ENVELOPE_NAME)
	effect:SetScaleEnvelope(0, SCALE_ENVELOPE_NAME)
	effect:SetBlendMode(0, BLENDMODE.Additive)
	effect:EnableBloomPass(0, true)
	effect:SetSortOrder(0, 0)
	effect:SetSortOffset(0, 2)

	local tick_time = TheSim:GetTickTime()

	local low_per_tick = MIN_PPS * tick_time
	local high_per_tick = MAX_PPS * tick_time
	local num_to_emit = 0

	local sphere_emitter = CreateSphereEmitter(.25)
	inst.last_pos = inst:GetPosition()

	EmitterManager:AddEmitter(inst, nil, function()
		local dist_moved = inst:GetPosition() - inst.last_pos
		local move = math.clamp(dist_moved:Length() * 6, 0, 1)

		local per_tick = Lerp(low_per_tick, high_per_tick, move)

		inst.last_pos = inst:GetPosition()

		num_to_emit = num_to_emit + per_tick * math.random() * 3
		while num_to_emit > 1 do
			emit_sparkle_fn(effect, sphere_emitter)
			num_to_emit = num_to_emit - 1
		end
	end)

	return inst
end

return Prefab("m_victorian_sparkle_fx", fn, assets)
