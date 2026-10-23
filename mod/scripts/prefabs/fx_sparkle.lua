local assets = {
    Asset("ANIM", "anim/lifeplant_fx.zip")
}

-- sparkle 吸血闪光：飞向带 "sparkle" 标签的目标，命中后自毁
local function onspawnsparkle(inst)
	local target = TheSim:FindFirstEntityWithTag("sparkle")
	if target == nil then
		inst:Remove()
		return
	end

	-- 原来用 0 秒周期（每帧）；特效几帧内就结束，0.05 秒足够且开销小一个数量级
	local task
	task = inst:DoPeriodicTask(0.05, function()
		if not inst:IsValid() then
			return
		end
		-- 目标可能中途被移除，必须每次检查，否则会一直报错刷屏
		if not target:IsValid() then
			task:Cancel()
			inst:Remove()
			return
		end

		local x, y, z = target.Transform:GetWorldPosition()
		inst.Transform:SetRotation(inst:GetAngleToPoint(x, y, z))
		inst.components.locomotor:WalkForward()
		if target:GetDistanceSqToInst(inst) < 1 then
			task:Cancel()
			inst:Remove()
		end
	end)
end

local function sparklefn(Sim)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    local physics = inst.entity:AddPhysics()
    physics:SetMass(1)
    physics:SetCapsule(0.3, 1)
    inst.Physics:SetFriction(0)
    inst.Physics:SetDamping(5)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank("lifeplant_fx")
    inst.AnimState:SetBuild("lifeplant_fx")
    inst.AnimState:PlayAnimation("single" .. math.random(1, 3), true)

    inst:AddTag("flying")
    inst:AddTag("FX")
    inst:AddTag("NOBLOCK") -- 不妨碍玩家摆放建筑物

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:AddComponent("locomotor")
    -- 3
    inst.components.locomotor.walkspeed = 6
    inst.components.locomotor:SetTriggersCreep(false)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst:DoTaskInTime(0, function()
        onspawnsparkle(inst)
    end)

    inst.OnEntitySleep = function()
        inst:Remove()
    end

    return inst
end
------------------------------------------------------------------

return Prefab("m_sparkle", sparklefn, assets)
