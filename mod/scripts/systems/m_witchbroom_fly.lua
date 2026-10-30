-- m_witchbroom_fly - 女巫扫帚的飞行系统
--
-- 复刻自工坊模组「女巫扫帚飞行」(3828144951) 的 modmain.lua，只把目标换成我们的
-- m_witchbroom（它的做法是 hook 原版 witchbroom，这里 hook 我们自己的扫帚）。
-- 具体逻辑照抄：
--   · 手持扫帚时把玩家碰撞掩码换成 WATER_MASK（去掉 WORLD -> 能跨海岸线/地形），
--     打开 allowocean 寻路，并临时关掉 drownable；
--   · ShouldFly：没骑牛、没死、不在船上、不在洞穴（SKIP_CAVE=false 所以洞穴也算）；
--   · 服务端 / 本地客户端各跑一次 SyncPlayer（每 3 秒 + 进游戏立刻一次）；
--   · 状态机新增 idle_witchbroom（骑扫帚待机，播 run_witchbroom_loop），
--     并把 idle / run_start / run_flyingbroom_start / run_stop 接到扫帚状态上，
--     跳过 _pre / _pst 让动画无缝。
-- 扫帚的拖尾 / 星屑仍在 prefabs/m_witchbroom.lua 里，和这里互不干扰。

local EQUIPSLOTS = GLOBAL.EQUIPSLOTS
local COLLISION = GLOBAL.COLLISION
local unpack = GLOBAL.unpack

-- 注意：物品自己带 "flyingbroom" 标签（原版 SGwilson 靠它播骑扫帚动画），
-- 但这里不用标签做判定 —— 标签只有活体原版 witchbroom 也会有，用了就会连带影响它。
local BROOM_PREFAB = "m_witchbroom"
local WATERWALK_TAG = "witchbroom_waterwalk"

local IDLE_STATE = "idle_witchbroom"
local IDLE_ANIM = "run_witchbroom_loop" -- 用扫帚 loop 当骑乘坐姿
local SYNC_PERIOD = 3
local SKIP_CAVE = false

-- 玩家默认碰撞掩码
local PLAYER_MASK = {
	COLLISION.WORLD,
	COLLISION.OBSTACLES,
	COLLISION.SMALLOBSTACLES,
	COLLISION.CHARACTERS,
	COLLISION.GIANTS,
}

-- 水上行走掩码：取消 WORLD 就能跨过海岸线
local WATER_MASK = {
	COLLISION.GROUND,
	COLLISION.OBSTACLES,
	COLLISION.SMALLOBSTACLES,
	COLLISION.CHARACTERS,
	COLLISION.GIANTS,
}

local function IsMasterSim()
	return GLOBAL.TheWorld ~= nil and GLOBAL.TheWorld.ismastersim
end

local function GetHandItem(inst)
	local inv = inst.components.inventory
	if inv ~= nil then
		return inv:GetEquippedItem(EQUIPSLOTS.HANDS)
	end
	local rinv = inst.replica ~= nil and inst.replica.inventory or nil
	if rinv ~= nil then
		return rinv:GetEquippedItem(EQUIPSLOTS.HANDS)
	end
	return nil
end

-- 只认本模组的扫帚；原版 witchbroom（包括活体形态）完全不参与本系统
local function IsEnchantedBroom(item)
	return item ~= nil and item:IsValid() and item.prefab == BROOM_PREFAB
end

local function IsRiding(inst)
	local rider = inst.components.rider
	if rider ~= nil then
		return rider:IsRiding() == true
	end
	local rrider = inst.replica ~= nil and inst.replica.rider or nil
	return rrider ~= nil and rrider:IsRiding() == true
end

local function IsDeadOrGhost(inst)
	if inst:HasTag("playerghost") then
		return true
	end
	local health = inst.components.health
	return health ~= nil and health:IsDead()
end

-- 当前是否应该处于「骑扫帚」状态
local function ShouldFly(inst)
	if inst == nil or not inst:IsValid() or inst.Physics == nil then
		return false
	end
	if IsDeadOrGhost(inst) or IsRiding(inst) then
		return false
	end
	if inst._dsrowing_water_walk then
		return false
	end
	if SKIP_CAVE and GLOBAL.TheWorld ~= nil and GLOBAL.TheWorld:HasTag("cave") then
		return false
	end
	return IsEnchantedBroom(GetHandItem(inst))
end

--------------------------------------------------------------------------
-- 水上行走
--------------------------------------------------------------------------
local function SetWaterWalk(inst, enable, force)
	if inst == nil or not inst:IsValid() or inst.Physics == nil then
		return
	end
	if not force and inst._witchbroom_waterwalk == enable then
		return
	end
	inst._witchbroom_waterwalk = enable

	-- 1) 物理掩码
	inst.Physics:SetCollisionMask(unpack(enable and WATER_MASK or PLAYER_MASK))

	-- 2) 允许海洋寻路
	local locomotor = inst.components.locomotor
	if locomotor ~= nil then
		if enable then
			locomotor.pathcaps = { allowocean = true }
		else
			locomotor.pathcaps = nil
		end
	end

	-- 3) 跳过溺水判定（只动玩家的 drownable，恢复时还原原值）
	local drownable = inst.components.drownable
	if drownable ~= nil then
		if enable then
			local prev = drownable.enabled
			inst._witchbroom_prev_drownable = (prev == nil) and true or prev
			drownable.enabled = false
		else
			drownable.enabled = inst._witchbroom_prev_drownable ~= nil and inst._witchbroom_prev_drownable or true
			inst._witchbroom_prev_drownable = nil
		end
	end

	if enable then
		inst:AddTag(WATERWALK_TAG)
	else
		inst:RemoveTag(WATERWALK_TAG)
	end
end

--------------------------------------------------------------------------
-- 状态同步：拿到扫帚就开，拿掉就关（equip 时机立刻生效 + 周期兜底）
--------------------------------------------------------------------------
local function SyncPlayer(inst)
	if inst == nil or not inst:IsValid() then
		return
	end
	if not IsMasterSim() and inst ~= GLOBAL.ThePlayer then
		-- 客户端只同步自己，保证本地移动预测不会卡在海岸线
		return
	end

	local want = ShouldFly(inst)
	SetWaterWalk(inst, want)

	-- 服务端：扫帚没了却还卡在扫帚 idle，退回普通 idle
	if
		IsMasterSim()
		and not want
		and inst.sg ~= nil
		and inst.sg.currentstate ~= nil
		and inst.sg.currentstate.name == IDLE_STATE
	then
		inst.sg:GoToState("idle")
	end
end

AddPlayerPostInit(function(inst)
	if inst.Physics == nil then
		return
	end
	inst:DoPeriodicTask(SYNC_PERIOD, function()
		SyncPlayer(inst)
	end)
	inst:DoTaskInTime(0, function()
		SyncPlayer(inst)
	end)
end)

--------------------------------------------------------------------------
-- 扫帚本体：onequip / onunequip / onremove 钩子
--------------------------------------------------------------------------
AddPrefabPostInit(BROOM_PREFAB, function(inst)
	if not IsMasterSim() then
		return
	end

	local function ApplyToOwner(owner, want)
		if owner ~= nil and owner:IsValid() and owner.Physics ~= nil then
			SetWaterWalk(owner, want, true)
		end
	end

	local function WantsFlyFor(owner)
		return owner ~= nil
			and not IsRiding(owner)
			and not IsDeadOrGhost(owner)
			and not (SKIP_CAVE and GLOBAL.TheWorld ~= nil and GLOBAL.TheWorld:HasTag("cave"))
			and not owner._dsrowing_water_walk
	end

	local equippable = inst.components.equippable
	if equippable ~= nil then
		local old_onequip = equippable.onequipfn
		equippable.onequipfn = function(broom, owner, ...)
			if old_onequip ~= nil then
				old_onequip(broom, owner, ...)
			end
			if IsEnchantedBroom(broom) and WantsFlyFor(owner) then
				ApplyToOwner(owner, true)
			end
		end

		local old_onunequip = equippable.onunequipfn
		equippable.onunequipfn = function(broom, owner, ...)
			if old_onunequip ~= nil then
				old_onunequip(broom, owner, ...)
			end
			ApplyToOwner(owner, false)
		end
	end

	-- 耐久耗尽被删除时兜底
	inst:ListenForEvent("onremove", function(broom)
		local item = broom.components.inventoryitem
		local owner = item ~= nil and item.owner or nil
		ApplyToOwner(owner, false)
	end)
end)

--------------------------------------------------------------------------
-- 状态机：idle_witchbroom + 移动状态拦截（不播 _pre / _pst，保证连贯）
--------------------------------------------------------------------------
local function ConfigureBroomFly(inst, enable)
	local locomotor = inst.components.locomotor
	if locomotor ~= nil then
		locomotor:EnableGroundSpeedMultiplier(not enable)
	end
	if IsMasterSim() then
		if enable then
			inst:AddTag("notraptrigger")
		else
			inst:RemoveTag("notraptrigger")
		end
	end
end

local function AddBroomStates(sg)
	if sg == nil or sg.states == nil or sg.states[IDLE_STATE] ~= nil then
		return
	end
	local states = sg.states
	local idle = states["idle"]
	if idle == nil then
		return
	end

	local old_idle_onenter = idle.onenter
	local idle_events = idle.events

	------------------------------------------------------------------
	-- 新状态：站着骑扫帚，播 run_witchbroom_loop
	------------------------------------------------------------------
	states[IDLE_STATE] = GLOBAL.State{
		name = IDLE_STATE,
		tags = { "canrotate" },

		onenter = function(inst, pushanim)
			if inst.entity.SetIsPredictingMovement ~= nil then
				inst.entity:SetIsPredictingMovement(false)
			end
			if inst.sg.lasttags == nil or not inst.sg.lasttags["busy"] then
				inst.components.locomotor:StopMoving()
			else
				inst.components.locomotor:Stop()
			end
			inst:ClearBufferedAction()
			inst.sg.statemem.ignoresandstorm = true

			if not inst.AnimState:IsCurrentAnimation(IDLE_ANIM) then
				inst.AnimState:PlayAnimation(IDLE_ANIM, true)
			end
			ConfigureBroomFly(inst, true)
		end,

		onexit = function(inst)
			ConfigureBroomFly(inst, false)
			if inst.entity.SetIsPredictingMovement ~= nil then
				inst.entity:SetIsPredictingMovement(true)
			end
		end,

		events = idle_events,
	}

	------------------------------------------------------------------
	-- 拦截 idle.onenter
	------------------------------------------------------------------
	idle.onenter = function(inst, pushanim, ...)
		old_idle_onenter(inst, pushanim, ...)
		if pushanim == "cancel" or pushanim == "noanim" then
			return
		end
		if inst.sg.currentstate == idle and ShouldFly(inst) then
			inst.sg:GoToState(IDLE_STATE)
		end
	end

	------------------------------------------------------------------
	-- ① 起步：跳过 run_witchbroom_pre，直接进 loop 状态
	------------------------------------------------------------------
	local run_start = states["run_start"]
	if run_start ~= nil then
		local old_onenter = run_start.onenter
		run_start.onenter = function(inst, ...)
			if ShouldFly(inst) then
				inst.sg:GoToState("run_flyingbroom")
				return
			end
			old_onenter(inst, ...)
		end
	end

	------------------------------------------------------------------
	-- ② 已经在跑时才掏出扫帚的路径，也跳过 pre
	------------------------------------------------------------------
	local broom_start = states["run_flyingbroom_start"]
	if broom_start ~= nil then
		local old_onenter = broom_start.onenter
		broom_start.onenter = function(inst, ...)
			if ShouldFly(inst) then
				inst.sg:GoToState("run_flyingbroom")
				return
			end
			old_onenter(inst, ...)
		end
	end

	------------------------------------------------------------------
	-- ③ 停下：跳过 run_witchbroom_pst，直接回 idle_witchbroom
	------------------------------------------------------------------
	local run_stop = states["run_stop"]
	if run_stop ~= nil then
		local old_onenter = run_stop.onenter
		run_stop.onenter = function(inst, ...)
			local frombroom = inst.sg.lasttags ~= nil and inst.sg.lasttags["flyingonbroom"] == true
			if frombroom and ShouldFly(inst) then
				inst.components.locomotor:Stop()
				inst:ClearBufferedAction()
				inst.sg:GoToState(IDLE_STATE)
				return
			end
			old_onenter(inst, ...)
		end
	end
end

AddStategraphPostInit("wilson", AddBroomStates)
AddStategraphPostInit("wilson_client", AddBroomStates)
