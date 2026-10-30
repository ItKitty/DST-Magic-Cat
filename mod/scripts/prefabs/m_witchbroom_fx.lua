-- m_witchbroom_fx - 女巫扫帚飞行特效（原版拖尾 + 维多利亚星屑，合并版）
--
-- 结构照原版 prefabs/witchbroom.lua:209-303 的 witchbroom_fx：
--   · 本体是个挂在玩家身上的 FX 实体；
--   · 每 FRAMES*5 检查一次持有者的 sg 是否有 "moving" 标签，
--     只有移动中才从对象池里取一个 witchbroom_trail 拖尾铺在当前位置；
--   · 原地悬停时什么都不产生。
--
-- 在同样的"只有移动才出现"条件下，额外加一份维多利亚手杖的星屑粒子：
-- 移动时按固定密度发射，静止时完全不发射（原版 cane_victorian_fx 静止还有 5pps，
-- 这里直接归零，避免站着也一直闪）。

local assets = {
	Asset("ANIM", "anim/witchbroom_trail.zip"),
	Asset("IMAGE", "fx/sparkle.tex"),
	Asset("SHADER", "shaders/vfx_particle_add.ksh"),
}

--------------------------------------------------------------------------
-- 拖尾（照原版 witchbroom_fx）
--------------------------------------------------------------------------
local function trail_OnAnimOver(inst)
	if inst.owner and inst.owner:IsValid() and inst.owner.trail_pool then
		inst:RemoveFromScene()
		table.insert(inst.owner.trail_pool, inst)
	else
		inst:Remove()
	end
end

local function CreateTrailFx()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()

	inst:AddTag("FX")
	--[[Non-networked entity]]
	inst.entity:SetCanSleep(false)
	inst.persists = false

	inst.AnimState:SetBank("witchbroom_trail")
	inst.AnimState:SetBuild("witchbroom_trail")
	inst.RestartFx = function()
		inst.AnimState:PlayAnimation("witchbroom_trail" .. math.random(3))
		if math.random() < .5 then
			inst.AnimState:SetScale(-1, 1)
		end
	end
	inst:RestartFx()

	inst:ListenForEvent("animover", trail_OnAnimOver)

	return inst
end

local function GetPooledTrailFx(inst)
	local fx = table.remove(inst.trail_pool)
	if fx ~= nil then
		fx:ReturnToScene()
		fx:RestartFx()
	else
		fx = CreateTrailFx()
		fx.owner = inst
	end
	return fx
end

local function IsOwnerMoving(inst)
	local owner = inst.entity:GetParent()
	if owner == nil then
		return false
	end
	if owner.sg then
		return owner.sg:HasStateTag("moving")
	end
	return owner:HasTag("moving")
end

local function fx_DoTrail(inst)
	if not IsOwnerMoving(inst) then
		return
	end

	local owner = inst.entity:GetParent()
	if owner == nil then
		return
	end

	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = GetPooledTrailFx(inst)
	fx.Transform:SetPosition(x, y, z)
end

--------------------------------------------------------------------------
-- 星屑（自建，只有移动时发射）
--------------------------------------------------------------------------
local SPARKLE_TEXTURE = "fx/sparkle.tex"
local ADD_SHADER = "shaders/vfx_particle_add.ksh"

local COLOUR_ENVELOPE_NAME = "m_witchbroom_sparkle_colourenvelope"
local SCALE_ENVELOPE_NAME = "m_witchbroom_sparkle_scaleenvelope"

local SPARKLE_PPS = 45      -- 移动时的粒子数/秒
local MAX_LIFETIME = 1.75

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

local function CreateSparkleEmitter(inst)
	if InitEnvelope ~= nil then
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

	local sphere_emitter = CreateSphereEmitter(.25)
	local per_tick = SPARKLE_PPS * TheSim:GetTickTime()
	local num_to_emit = 0

	EmitterManager:AddEmitter(inst, nil, function()
		if not IsOwnerMoving(inst) then
			num_to_emit = 0
			return
		end

		num_to_emit = num_to_emit + per_tick * math.random() * 3
		while num_to_emit > 1 do
			emit_sparkle_fn(effect, sphere_emitter)
			num_to_emit = num_to_emit - 1
		end
	end)
end

--------------------------------------------------------------------------

local function fxfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddNetwork()

	inst:AddTag("FX")

	if not TheNet:IsDedicated() then
		inst.trail_pool = {}
		inst.trail_task = inst:DoPeriodicTask(FRAMES * 5, fx_DoTrail)
		CreateSparkleEmitter(inst)
	end

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.persists = false

	return inst
end

return Prefab("m_witchbroom_fx", fxfn, assets)
