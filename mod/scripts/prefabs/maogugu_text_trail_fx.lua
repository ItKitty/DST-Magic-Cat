local STAR_TEXTURE = "fx/maogugu_text_trail_star.tex"
local TEXT_TEXTURE = "fx/maogugu_text_trail_words.tex"
local SHADER = "shaders/vfx_particle_add.ksh"
local assets = { Asset("IMAGE", STAR_TEXTURE), Asset("IMAGE", TEXT_TEXTURE), Asset("SHADER", SHADER) }
local config = TUNING.MAOGUGU_TEXT_TRAIL
local MAX_LIFETIME = config.lifetime * 1.2
local TEXT_LIFETIME = config.lifetime * 1.8
local TEXT_COUNT = 5
local TEXT_UV_WIDTH = 1 / 8
local COLOURS = { "maogugu_text_trail_star_colour", "maogugu_text_trail_dust_colour", "maogugu_text_trail_text_colour" }
local SCALES = { "maogugu_text_trail_star_scale", "maogugu_text_trail_dust_scale", "maogugu_text_trail_text_scale" }

local function InitEnvelopes()
	local bright = 0.8 + config.glow * 0.2
	EnvelopeManager:AddColourEnvelope(COLOURS[1], {
		{ 0, { 1, 0.91, 0.62, 0 } },
		{ 0.1, { 1, 0.9, 0.57, bright } },
		{ 0.35, { 1, 0.8, 0.37, bright * 0.86 } },
		{ 0.65, { 1, 0.69, 0.25, bright * 0.4 } },
		{ 1, { 1, 0.56, 0.17, 0 } },
	})
	EnvelopeManager:AddColourEnvelope(COLOURS[2], {
		{ 0, { 1, 0.96, 0.72, 0 } },
		{ 0.12, { 1, 0.93, 0.63, bright * 0.72 } },
		{ 0.45, { 1, 0.78, 0.38, bright * 0.55 } },
		{ 1, { 1, 0.58, 0.18, 0 } },
	})
	EnvelopeManager:AddColourEnvelope(COLOURS[3], {
		{ 0, { 1, 0.88, 0.4, 0 } },
		{ 0.08, { 1, 0.84, 0.32, bright } },
		{ 0.5, { 1, 0.76, 0.22, bright * 0.8 } },
		{ 1, { 1, 0.59, 0.13, 0 } },
	})
	-- 出生时略微亮起，随后保持大小，只淡出，不收缩成针尖。
	local sizes = { 0.32, 0.11, 0.8 }
	for i = 1, 3 do
		local size = sizes[i] * (i == 3 and config.text_size or config.size)
		EnvelopeManager:AddVector2Envelope(SCALES[i], {
			{ 0, { size * 0.9, size * 0.9 } },
			{ 0.12, { size, size } },
			{ 1, { size, size } },
		})
	end
	InitEnvelopes = nil
end

local function GetHeight(player)
	local rider = player.replica.rider
	return config.height + (rider ~= nil and rider:IsRiding() and 0.7 or 0)
end

local function EmitStar(inst, variant, x, z, dx, dz, height, side)
	if variant == 2 then
		-- 图集前五格为“猫、菇、菇、牛、逼”，后三格透明补齐尺寸；只循环前五格。
		-- 文字不旋转、不随机改变寿命，保证顺序和辨识度。
		local speed = 0.45 * FRAMES
		inst.VFXEffect:AddRotatingParticleUV(
			4 + side,
			TEXT_LIFETIME,
			x - dx * 0.55,
			height,
			z - dz * 0.55,
			-dx * speed,
			0.1 * FRAMES,
			-dz * speed,
			0,
			0,
			inst.text_index * TEXT_UV_WIDTH,
			0
		)
		inst.text_index = (inst.text_index + 1) % TEXT_COUNT
		return
	end
	local scatter = (math.random() - 0.5) * 64 * DEGREES
	-- 按出生时的方向计算漂移速度，随后由原生粒子继续运动。
	local speed = (0.35 + math.random() * 0.45) * FRAMES
	local backward, sideways = math.cos(scatter) * speed, math.sin(scatter) * speed
	local vx, vz = -dx * backward - dz * sideways, -dz * backward + dx * sideways
	local lateral = (math.random() - 0.5) * (variant == 1 and 0.6 or 0.35)
	local px, pz = x - dx * 0.55 - dz * lateral, z - dz * 0.55 + dx * lateral
	local py = height + (math.random() - 0.5) * 0.3
	local life = config.lifetime * (0.8 + math.random() * 0.4)
	local rotation = (math.random() - 0.5) * 65
	local spin = (math.random() - 0.5) * 0.9
	inst.VFXEffect:AddRotatingParticle(
		variant * 2 + side,
		life,
		px,
		py,
		pz,
		vx,
		(0.08 + math.random() * 0.12) * FRAMES,
		vz,
		rotation,
		spin
	)
end

local function ClearPath(inst)
	inst.main_distance = 0
	inst.dust_distance = 0
	inst.idle_time = 0
	inst.move_dx, inst.move_dz = nil, nil
end

local function UpdateTrail(inst)
	local player = inst.owner
	if player == nil then
		return
	end
	if not player:IsValid() then
		inst:Remove()
		return
	end
	local x, y, z = player.Transform:GetWorldPosition()
	local old_x, old_z = inst.last_x, inst.last_z
	inst.Transform:SetPosition(x, y, z)
	inst.last_x, inst.last_z = x, z
	if
		old_x == nil
		or player:IsAsleep()
		or player:IsInLimbo()
		or player:HasTag("playerghost")
		or player:HasTag("dead")
		or not player.entity:IsVisible()
	then
		ClearPath(inst)
		return
	end

	local dx, dz = x - old_x, z - old_z
	local distance = math.sqrt(dx * dx + dz * dz)
	-- 传送不沿整段距离撒星；停步立即停止发射，已有星芒自行淡出。
	if distance > 2 then
		ClearPath(inst)
		return
	elseif distance < 0.003 then
		-- 保留短暂同步停顿前的取样余数，远程玩家不必连续多帧位移才能产生星芒。
		inst.idle_time = inst.idle_time + TheSim:GetTickTime()
		if inst.idle_time >= 0.15 then
			ClearPath(inst)
		end
		return
	end
	inst.idle_time = 0
	dx, dz = dx / distance, dz / distance
	if inst.move_dx ~= nil and inst.move_dx * dx + inst.move_dz * dz < -0.7 then
		ClearPath(inst)
	end
	inst.move_dx, inst.move_dz = dx, dz
	local height = GetHeight(player)
	-- 出生时选择固定排序的发射器，转身不把已出现的星芒全部切换层次。
	local side = player.AnimState:GetCurrentFacing() == 1 and 1 or 0
	local next_main = config.spacing - inst.main_distance
	local count = 0
	while next_main <= distance and count < 8 do
		local px, pz = old_x + dx * next_main - x, old_z + dz * next_main - z
		inst.star_count = inst.star_count + 1
		-- 每三次主体发射出现一个字，配合四角星点缀。
		local variant = inst.star_count % 3 == 0 and 2 or 0
		EmitStar(inst, variant, px, pz, dx, dz, height, side)
		next_main = next_main + config.spacing
		count = count + 1
	end
	inst.main_distance = (inst.main_distance + distance) % config.spacing

	local dust_spacing = config.spacing * 0.45
	local next_dust = dust_spacing - inst.dust_distance
	count = 0
	while next_dust <= distance and count < 12 do
		EmitStar(inst, 1, old_x + dx * next_dust - x, old_z + dz * next_dust - z, dx, dz, height, side)
		next_dust = next_dust + dust_spacing
		count = count + 1
	end
	inst.dust_distance = (inst.dust_distance + distance) % dust_spacing
end

local function AttachToPlayer(inst, player)
	inst.owner = player
	player._maogugu_text_trail_fx = inst
	local x, y, z = player.Transform:GetWorldPosition()
	inst.last_x, inst.last_z = x, z
	inst.Transform:SetPosition(x, y, z)
	inst:ListenForEvent("onremove", function()
		inst:Remove()
	end, player)
end

local function OnRemoveEntity(inst)
	if inst.owner ~= nil and inst.owner._maogugu_text_trail_fx == inst then
		inst.owner._maogugu_text_trail_fx = nil
	end
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst:AddTag("FX")
	inst:AddTag("NOCLICK")
	inst.persists = false
	inst.entity:SetCanSleep(false)
	inst.AttachToPlayer = AttachToPlayer
	inst.OnRemoveEntity = OnRemoveEntity
	inst.main_distance = 0
	inst.dust_distance = 0
	inst.idle_time = 0
	inst.star_count = 0
	inst.text_index = 0
	if TheNet:IsDedicated() then
		return inst
	end
	if InitEnvelopes ~= nil then
		InitEnvelopes()
	end

	local effect = inst.entity:AddVFXEffect()
	effect:InitEmitters(6)
	for variant = 0, 2 do
		local texture = resolvefilepath(variant == 2 and TEXT_TEXTURE or STAR_TEXTURE)
		for side = 0, 1 do
			local emitter = variant * 2 + side
			effect:SetRenderResources(emitter, texture, SHADER)
			effect:SetMaxNumParticles(emitter, variant == 1 and 96 or 48)
			effect:SetMaxLifetime(emitter, variant == 2 and TEXT_LIFETIME or MAX_LIFETIME)
			effect:SetRotationStatus(emitter, true)
			if variant == 2 then
				effect:SetUVFrameSize(emitter, TEXT_UV_WIDTH, 1)
			end
			effect:SetColourEnvelope(emitter, COLOURS[variant + 1])
			effect:SetScaleEnvelope(emitter, SCALES[variant + 1])
			effect:SetBlendMode(emitter, BLENDMODE.Additive)
			effect:EnableBloomPass(emitter, config.glow > 0 and variant ~= 1)
			effect:SetSortOrder(emitter, 0)
			effect:SetSortOffset(emitter, side == 1 and 1 or -1)
			effect:SetFollowEmitter(emitter, false)
			effect:SetKillOnEntityDeath(emitter, true)
		end
	end
	effect:SetRadius(0, 16)
	EmitterManager:AddEmitter(inst, nil, function()
		UpdateTrail(inst)
	end)
	return inst
end

return Prefab("maogugu_text_trail_fx", fn, assets)
