local Hattraits = Class(function(self, inst)
	self.inst = inst
end)

-- 通用功能函数
function Hattraits:CancelTask(task)
	if task then
		task:Cancel()
	end
	return nil
end

------------------------------ 阴影手臂反击 ----------------------------------
local function SpawnShadowHand(owner, attacker)
	if not attacker or not attacker:IsValid() then
		return
	end

	local owner_pos = owner:GetPosition()
	local attacker_pos = attacker:GetPosition()
	local dir = (attacker_pos - owner_pos):GetNormalized()
	local spawn_pos = owner_pos + dir * 1.5

	local hand = SpawnPrefab("stageusher_attackhand")
	if hand then
		hand.Transform:SetPosition(spawn_pos:Get())

		-- 保存原版的SetOwner函数
		local original_setowner = hand.SetOwner

		-- 重写SetOwner，让它什么都不做，避免监听事件
		hand.SetOwner = function() end

		-- 给hand添加战斗组件
		if not hand.components.combat then
			hand:AddComponent("combat")
		end
		hand.components.combat:SetDefaultDamage(40)
		hand.components.combat:SetRange(8)
		hand.components.combat.ignorehitrange = true

		-- 重写伤害检测逻辑，完全绕过原版
		if hand.components.updatelooper then
			local old_update = hand.components.updatelooper.onupdatefn
			hand.components.updatelooper:RemoveOnUpdateFn(old_update)

			hand.components.updatelooper:AddOnUpdateFn(function(inst, dt)
				inst._attack_time = (inst._attack_time or 0) + dt
				if inst._attack_time < 0.2 then
					return
				end
				inst._attack_time = 0

				if inst._target == nil or not inst._target:IsValid() then
					return
				end

				inst._last_hits = inst._last_hits or {}
				local current_time = GetTime()

				local x, y, z = inst.Transform:GetWorldPosition()
				local targets = TheSim:FindEntities(x, y, z, 8, { "_combat" }, {
					"NOCLICK",
					"FX",
					"NOTARGET",
					"ghost",
					"playerghost",
					"INLIMBO",
					"wall",
					"notarget",
					"player",
					"companion",
					"flight",
					"invisible",
					"noattack",
					"hiding",
					"shadowminion",
				})

				for _, target in ipairs(targets) do
					if target ~= owner and target ~= inst then
						local last_hit = inst._last_hits[target]
						if not last_hit or (last_hit + 1) < current_time then
							inst._last_hits[target] = current_time

							if target.components.combat then
								-- 使用手部作为攻击者
								target.components.combat:GetAttacked_Internal(
									inst,
									40,
									nil,
									"electric",
									{ planar = 35 }
								)
							end
						end
					end
				end
			end)
		end

		hand:SetCreepTarget(attacker)
	end

	-- 生成阴影手臂特效
	local arm = SpawnPrefab("stageusher_attackarm")
	if arm then
		arm.Transform:SetPosition(owner_pos:Get())
		arm:FacePoint(attacker_pos:Get())
		arm.AnimState:PlayAnimation("arm_loop" .. tostring(math.random(1, 3)), true)
		arm.components.stretcher:SetStretchTarget(hand)
		arm:DoTaskInTime(3, arm.Remove)
	end

	owner.SoundEmitter:PlaySound("dontstarve/sanity/shadowhand_snuff")

	return hand
end
local function OnOwnerAttacked_ShadowRetaliate(owner, data)
	local attacker = data.attacker
	if attacker and attacker:IsValid() and attacker.components.health and not attacker.components.health:IsDead() then
		SpawnShadowHand(owner, attacker)
	end
end

function Hattraits:SetupRetaliation(inst, owner)
	if not self._retaliation_fn then
		self._retaliation_fn = function(owner, data)
			OnOwnerAttacked_ShadowRetaliate(owner, data)
		end
		self.inst:ListenForEvent("attacked", self._retaliation_fn, owner)
	end
end

function Hattraits:RemoveRetaliation(inst, owner)
	if self._retaliation_fn then
		self.inst:RemoveEventCallback("attacked", self._retaliation_fn, owner)
		self._retaliation_fn = nil
	end
end
------------------------------ 阴影手臂反击 ----------------------------------

------------------------------ 启迪之冠特效 ----------------------------------
-- 位置/大小都在这里调：
-- 偏移量单位是 1/100 世界单位，y 正数往下、负数往上（和原版 weapon fx 的约定一致）
local ALTERGUARDIAN_FX_SCALE = 0.75
local ALTERGUARDIAN_FX_OFFSET_X = 0
local ALTERGUARDIAN_FX_OFFSET_Y = 10
local ALTERGUARDIAN_FX_OFFSET_Z = 0

-- 帽子和光效会一起被强制脱掉（比如上坐骑），0.5 秒查一次兜底
local ALTERGUARDIAN_WATCH_PERIOD = 0.5

local function alterguardian_spawn(inst, owner, is_front)
	local fx = SpawnPrefab("alterguardian_hat_equipped")
	fx:OnActivated(owner, is_front)

	-- OnActivated 里已经 Follow 到 "hair" 且偏移为 0，这里先停掉再按我们要的偏移重新跟随
	fx.Transform:SetScale(ALTERGUARDIAN_FX_SCALE, ALTERGUARDIAN_FX_SCALE, ALTERGUARDIAN_FX_SCALE)
	fx.Follower:StopFollowing()
	fx.Follower:FollowSymbol(
		owner.GUID,
		"hair",
		ALTERGUARDIAN_FX_OFFSET_X,
		ALTERGUARDIAN_FX_OFFSET_Y,
		ALTERGUARDIAN_FX_OFFSET_Z
	)
	-- 前/后两层的遮挡顺序保持原版
	fx.AnimState:SetFinalOffset(is_front and 1 or -1)
	return fx
end

local function alterguardian_remove_fx(fx)
	if fx == nil or not fx:IsValid() then
		return
	end
	-- 原版会先播一段消散动画再 Remove
	if fx.OnDeactivated ~= nil then
		fx:OnDeactivated()
	else
		fx:Remove()
	end
end

local function alterguardian_deactivate(inst)
	if inst._watchtask ~= nil then
		inst._watchtask:Cancel()
		inst._watchtask = nil
	end
	alterguardian_remove_fx(inst._front)
	alterguardian_remove_fx(inst._back)
	inst._front = nil
	inst._back = nil
end

local function alterguardian_should_stop(inst, owner)
	local equippable = inst.components.equippable
	if equippable == nil or not equippable:IsEquipped() then
		return true
	end
	-- 坐在坐骑上时帽子会被强制脱掉，光效也不该留着
	if owner ~= nil and owner:IsValid() and owner.components.rider ~= nil and owner.components.rider:IsRiding() then
		return true
	end
	return false
end

local function alterguardian_activate(inst, owner)
	if inst._front == nil then
		inst._front = alterguardian_spawn(inst, owner, true)
	end
	if inst._back == nil then
		inst._back = alterguardian_spawn(inst, owner, false)
	end

	if inst._watchtask == nil then
		inst._watchtask = inst:DoPeriodicTask(ALTERGUARDIAN_WATCH_PERIOD, function()
			if alterguardian_should_stop(inst, owner) then
				alterguardian_deactivate(inst)
			end
		end)
	end
end

function Hattraits:alterguardian_onequip(inst, owner)
	alterguardian_activate(inst, owner)
end
function Hattraits:alterguardian_onunequip(inst, owner)
	alterguardian_deactivate(inst)
end

------------------------------ 启迪之冠特效 ----------------------------------

return Hattraits
