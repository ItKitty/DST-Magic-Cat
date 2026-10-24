local assets_bats = {
	Asset("ANIM", "anim/shadow_bishop.zip"),
}

local TARGET_TAGS = { "_combat", "locomotor", "_health" }
local TARGET_NOT_TAGS = {
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
}
-- 在文件顶部添加一个表来记录所有被减速的目标
local slowed_targets = {}

local function DoAoEAttack(inst)
	local leader = inst.components.follower.leader

	-- 如果当前有目标，则朝目标移动
	if
		inst._target
		and inst._target:IsValid()
		and not (inst._target.components.health and inst._target.components.health:IsDead())
	then
		local angle = inst:GetAngleToPoint(inst._target:GetPosition())
		inst.Transform:SetRotation(angle)
		inst.components.locomotor:WalkForward(true)
	else
		-- 如果没有目标，则停止移动
		inst.components.locomotor:Stop()
	end

	local x, y, z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x, y, z, 3, TARGET_TAGS, TARGET_NOT_TAGS)

	-- 获取蝙蝠的主人作为真正的攻击者
	local real_attacker = leader or inst

	for i, v in ipairs(ents) do
		if
			v ~= leader
			and v:IsValid()
			and v.components.health
			and not v.components.health:IsDead()
			and v.components.combat
			and v.components.combat:CanBeAttacked()
		then
			-- v.components.combat:GetAttacked_Internal(real_attacker, 25, nil, "electric", { planar = 20 })

			-- 攻击减速
			if v.components.locomotor then
				v.components.locomotor:SetExternalSpeedMultiplier(v, "m_batslow", 0.15)
				-- 记录被减速的目标
				if not slowed_targets[v] then
					slowed_targets[v] = true
					-- 为目标添加监听，当它死亡时从记录中移除
					inst:ListenForEvent("onremove", function()
						slowed_targets[v] = nil
					end, v)
				end
			end

			v:AddDebuff("abigail_vex_debuff", "abigail_vex_shadow_debuff", nil, nil, nil, real_attacker)
		end
	end

	local scale = 1
	local oldscale = inst.cur_scale or 1

	inst.cur_scale = oldscale + (scale > oldscale and 0.12 or scale < oldscale and -0.12 or 0)
	inst.AnimState:SetScale(inst.cur_scale, inst.cur_scale)
end

local function OnBatDoLifetime(inst)
	if inst:IsValid() then
		inst.SoundEmitter:KillSound("attack")

		if inst._aoetask then
			inst._aoetask:Cancel()
			inst._aoetask = nil
		end
		inst.task = nil

		-- 蝙蝠消失时恢复所有被减速的目标的速度
		for target, _ in pairs(slowed_targets) do
			if target:IsValid() and target.components.locomotor then
				target.components.locomotor:RemoveExternalSpeedMultiplier(target, "m_batslow")
			end
		end
		slowed_targets = {} -- 清空记录表

		if inst.components.colourtweener then
			inst.components.colourtweener:StartTween({ 1, 1, 1, 0 }, 1, inst.Remove)
		else
			inst:Remove()
		end
	end
end

local function SetDuration(inst, duration)
	inst.AnimState:SetMultColour(1, 1, 1, 1)

	if inst.task then
		inst.task:Cancel()
	end
	inst.task = inst:DoTaskInTime(duration, OnBatDoLifetime)
end

local function bats()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeGhostPhysics(inst, 1, 1)
	RemovePhysicsColliders(inst)
	inst.Physics:CollidesWith(COLLISION.GROUND)

	inst.AnimState:SetBank("shadow_bishop")
	inst.AnimState:SetBuild("shadow_bishop")
	inst.AnimState:PlayAnimation("atk_side_loop_pre")
	inst.AnimState:PushAnimation("atk_side_loop")

	inst.SoundEmitter:PlaySound("dontstarve/sanity/bishop/attack_1", "attack")

	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
	inst:AddTag("NOCLICK")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("colourtweener")

	inst:AddComponent("locomotor")
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6

	inst:AddComponent("follower")
	inst.components.follower:KeepLeaderOnAttacked()
	inst.components.follower.keepdeadleader = true
	inst.components.follower.keepleaderduringminigame = true

	inst.persists = false

	inst.DoAoEAttack = DoAoEAttack
	inst.SetDuration = SetDuration

	inst:SetDuration(3)
	inst._aoetask = inst:DoPeriodicTask(0.5, DoAoEAttack)
	-- inst:DoTaskInTime(9, inst.Remove)

	return inst
end

return Prefab("m_batsfx", bats, assets_bats)
