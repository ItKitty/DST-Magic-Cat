-- m_lunge_mirage
-- 穿刺残影的「同步触发器」。
--
-- 参考工坊「龙胆亮银枪」(3817792801) scripts/prefabs/zhaoyun_spear.lua:425-536 的做法：
--   · 残影（ghost）本身是**纯客户端、非联网**实体，每张自己淡出；
--   · 复制外观要 SetSkin + 逐个 symbol 覆盖（只 SetBuild 时穿皮肤不渲染、护甲也丢）；
--   · 姿势用 owner.AnimState:GetCurrentAnimationHash() + SetTime 精确定格，然后 Pause。
--
-- 我们只需要「穿刺的那一下」，所以不挂常驻发射器，而是：
--   服务端在 combat_lunge 里生成这个触发器，把「主人 + 起点 + 终点 + 朝向」写进网络变量；
--   各客户端收到后，沿起终点插值生成 3~5 张本地残影。
-- 这样网络只同步 5 个 float + 1 个 entity，残影外观/姿势都在本地算。

local GHOST_COUNT_MAX = 5
local GHOST_SPACING = 1.1
local GHOST_LIFETIME = 0.35
local GHOST_START_ALPHA = 0.6
local GHOST_SCALE = 1.05

-- 乘色 / 叠加色：淡紫（玛德琳的魔法猫配色）
local GHOST_MULT = { 0.72, 0.6, 1.0 }
local GHOST_ADD = { 0.15, 0.08, 0.35 }

-- 复制玩家外观时需要覆盖的部位（照 zhaoyun_spear.lua:434-455）
local PLAYER_SYMBOLS = {
	"arm_lower",
	"arm_upper",
	"arm_upper_skin",
	"beard",
	"cheeks",
	"face",
	"foot",
	"hair",
	"hair_hat",
	"hairfront",
	"hairpigtails",
	"hand",
	"headbase",
	"headbase_hat",
	"leg",
	"skirt",
	"tail",
	"torso",
	"torso_pelvis",
}

local function CopyPlayerLook(ga, owner)
	local animstate = owner.AnimState

	-- 皮肤贴图必须用 SetSkin，直接 SetBuild(GetBuild()) 在穿皮肤时不会渲染
	local skin_build = animstate:GetSkinBuild()
	if skin_build ~= nil and skin_build ~= "" then
		ga:SetSkin(skin_build, owner.prefab)
	else
		ga:SetBuild(animstate:GetBuild())
	end

	for _, v in ipairs(PLAYER_SYMBOLS) do
		if animstate:BuildHasSymbol(v) and ga:BuildHasSymbol(v) then
			local build, sym = animstate:GetSymbolOverride(v)
			if build then
				if animstate:IsSkinBuild(build) then
					ga:OverrideSkinSymbol(v, build, sym)
				else
					ga:OverrideSymbol(v, build, sym)
				end
			end
		end
	end
end

-- 生成一张本地残影（非联网、不占网络）
local function SpawnGhost(owner, x, z, rot, time_offset)
	local ghost = CreateEntity()

	ghost.entity:SetCanSleep(false)
	ghost.persists = false
	ghost:AddTag("FX")
	ghost:AddTag("NOCLICK")

	ghost.entity:AddTransform()
	ghost.entity:AddAnimState()

	ghost.Transform:SetFourFaced()
	ghost.Transform:SetPosition(x, 0, z)
	ghost.Transform:SetRotation(rot)
	local sx, sy, sz = owner.Transform:GetScale()
	ghost.Transform:SetScale(sx * GHOST_SCALE, sy * GHOST_SCALE, sz * GHOST_SCALE)

	local ga = ghost.AnimState
	ga:SetBank("wilson")
	CopyPlayerLook(ga, owner)

	-- 手里的武器（m_catpaw 的 swap 资源）
	ga:OverrideSymbol("swap_object", "swap_catpaw", "swap_catpaw")
	ga:Show("ARM_carry")
	ga:Hide("ARM_normal")
	ga:Hide("HAT")
	ga:Hide("HAIR_HAT")
	ga:Hide("HEAD_HAT")
	ga:Hide("HEAD_HAT_NOHELM")
	ga:Hide("HEAD_HAT_HELM")

	-- 复制当前动画，并把时间点错开一点，形成「冲刺过程」的层次
	local animstate = owner.AnimState
	local len = animstate:GetCurrentAnimationLength()
	local t = math.clamp(animstate:GetCurrentAnimationTime() + time_offset, 0, math.max(0, len - .01))
	ga:PlayAnimation(animstate:GetCurrentAnimationHash())
	ga:SetTime(t)
	ga:Pause()

	ghost._alpha = GHOST_START_ALPHA
	ga:SetMultColour(GHOST_MULT[1], GHOST_MULT[2], GHOST_MULT[3], ghost._alpha)
	ga:SetAddColour(GHOST_ADD[1], GHOST_ADD[2], GHOST_ADD[3], 0)
	ga:SetLightOverride(.4)
	ga:SetFinalOffset(-1)

	ghost:DoPeriodicTask(FRAMES, function(g)
		g._alpha = g._alpha - FRAMES / GHOST_LIFETIME * .6
		if g._alpha <= 0 then
			g:Remove()
		else
			g.AnimState:SetMultColour(GHOST_MULT[1], GHOST_MULT[2], GHOST_MULT[3], g._alpha)
		end
	end)
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")

	-- 服务端写、客户端读
	inst._owner = net_entity(inst.GUID, "m_lunge_mirage.owner", "m_lunge_mirage.dirty")
	inst._sx = net_float(inst.GUID, "m_lunge_mirage.sx", "m_lunge_mirage.dirty")
	inst._sz = net_float(inst.GUID, "m_lunge_mirage.sz", "m_lunge_mirage.dirty")
	inst._ex = net_float(inst.GUID, "m_lunge_mirage.ex", "m_lunge_mirage.dirty")
	inst._ez = net_float(inst.GUID, "m_lunge_mirage.ez", "m_lunge_mirage.dirty")
	inst._rot = net_float(inst.GUID, "m_lunge_mirage.rot", "m_lunge_mirage.dirty")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		local spawned = false

		local function TrySpawn()
			if spawned then
				return
			end

			local owner = inst._owner:value()
			if owner == nil or not owner:IsValid() then
				return
			end

			spawned = true

			local sx, sz = inst._sx:value(), inst._sz:value()
			local ex, ez = inst._ex:value(), inst._ez:value()
			local rot = inst._rot:value()

			local dx, dz = ex - sx, ez - sz
			local dist = math.sqrt(dx * dx + dz * dz)
			if dist <= 0 then
				return
			end

			local count = math.min(GHOST_COUNT_MAX, math.max(1, math.floor(dist / GHOST_SPACING)))
			local len = owner.AnimState:GetCurrentAnimationLength()
			for i = 1, count do
				local k = i / (count + 1)
				SpawnGhost(owner, sx + dx * k, sz + dz * k, rot, k * len * 0.5)
			end
		end

		inst:ListenForEvent("m_lunge_mirage.dirty", TrySpawn)
		-- 进服 / 网络值稍后才到的兜底
		inst:DoTaskInTime(0.05, TrySpawn)

		return inst
	end

	inst.persists = false

	function inst:SetLungeData(owner, sx, sz, ex, ez, rot)
		self._owner:set(owner)
		self._sx:set(sx or 0)
		self._sz:set(sz or 0)
		self._ex:set(ex or 0)
		self._ez:set(ez or 0)
		self._rot:set(rot or 0)
	end

	-- 客户端读到数据后就不再需要这个触发器了
	inst:DoTaskInTime(0.5, function(inst2)
		if inst2:IsValid() then
			inst2:Remove()
		end
	end)

	return inst
end

return Prefab("m_lunge_mirage", fn)
