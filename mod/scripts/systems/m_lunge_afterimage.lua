-- 穿刺残影（纯客户端表现）
-- 参考工坊「龙胆亮银枪」(3817792801) scripts/prefabs/zhaoyun_spear.lua:425-536：
--   · 残影是纯本地、非联网实体，每张自己淡出
--   · 复制外观必须 SetSkin + 逐个 symbol 覆盖（只 SetBuild 时穿皮肤不渲染、护甲也会丢）
--   · 姿势用 owner.AnimState:GetCurrentAnimationHash() + SetTime 精确定格，再 Pause
--
-- 通信方式：不在服务端生成任何新联网实体（会和别的 mod 的 netvar 序列化打架，
-- 客户端日志里会刷 "Error deserializing lua state ... Failed to read net var data"），
-- 改成在玩家身上挂一个 net_event：服务端 push 一下，各客户端自己算开始位置并生成残影。

local LUNGE_LEN = 6.5 -- m_catpaw 的穿刺射程（m_catpaw.lua:100 注释里写的 6.5）

local GHOST_COUNT = 5
local GHOST_LIFETIME = .35
local GHOST_START_ALPHA = .6
local GHOST_SCALE = 1.05

-- 乘色 / 叠加色（淡紫，玛德琳的魔法猫配色）
local GHOST_MULT = { .72, .6, 1 }
local GHOST_ADD = { .15, .08, .35 }

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

	-- 手里那把武器（m_catpaw 的 swap 资源）
	ga:OverrideSymbol("swap_object", "swap_catpaw", "swap_catpaw")
	ga:Show("ARM_carry")
	ga:Hide("ARM_normal")
	ga:Hide("HAT")
	ga:Hide("HAIR_HAT")
	ga:Hide("HEAD_HAT")
	ga:Hide("HEAD_HAT_NOHELM")
	ga:Hide("HEAD_HAT_HELM")

	-- 复制当前动画，时间点错开一点，形成「冲刺过程」的层次
	local animstate = owner.AnimState
	local len = animstate:GetCurrentAnimationLength() or 0
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

-- 客户端：拿到广播后，从落点往身后铺残影（穿刺是一帧 Teleport，只能这么反推）
local function SpawnLungeAfterimages(owner)
	if owner == nil or not owner:IsValid() or owner.AnimState == nil then
		return
	end

	local x, y, z = owner.Transform:GetWorldPosition()
	local rot = owner.Transform:GetRotation()
	local theta = rot * DEGREES
	local dx, dz = math.cos(theta), -math.sin(theta)

	local len = owner.AnimState:GetCurrentAnimationLength() or 0

	for i = 1, GHOST_COUNT do
		local k = i / (GHOST_COUNT + 1)
		SpawnGhost(owner, x - dx * LUNGE_LEN * k, z - dz * LUNGE_LEN * k, rot, -k * len * .5)
	end
end

-- 供 madeleine prefab 的 common_postinit 调用（net_event 必须在 SetPristine 前创建，
-- 所以监听注册写在 madeleine.lua 里，这里只导出生成函数）
M_SpawnLungeAfterimages = SpawnLungeAfterimages
