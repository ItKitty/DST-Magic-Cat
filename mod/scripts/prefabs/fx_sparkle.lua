local assets = {
    Asset("ANIM", "anim/lifeplant_fx.zip")
}

-- sparkle 吸血闪光
local function onspawnsparkle(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ent = TheSim:FindFirstEntityWithTag("sparkle")

    if ent then
        inst:DoPeriodicTask(0, function()
            local x2, y2, z2 = ent.Transform:GetWorldPosition()
            local angle = inst:GetAngleToPoint(x2, y2, z2)
            inst.Transform:SetRotation(angle)
            inst.components.locomotor:WalkForward()
            if ent and ent:GetDistanceSqToInst(inst) < 1 then
                inst:Remove()
            end
        end)
    else
        inst:Remove()
    end
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
