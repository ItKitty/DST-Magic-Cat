local assets = {
	Asset("ANIM", "anim/shadow_bishop.zip"),
}
local CAN_ATTACK = {
	CHOP = false,
	DIG = false,
	HAMMER = false,
	MINE = false,
	ATTACK = true,
}
local ATTACK_TAGS = { "_combat", "_health" }
for k, v in pairs(CAN_ATTACK) do
	table.insert(ATTACK_TAGS, k .. "_workable")
end
local NON_ATTACK_TAGS =
	{ "INLIMBO", "wall", "groundspike", "structure", "playerghost", "companion", "m_pet", "m_hound", "player" }

--[[----------------------------
    Neutralist & Vamprism
----------------------------]]
--
local function KillBats(inst)
	inst.SoundEmitter:KillSound("bats") -- KillSound()
	inst:DoTaskInTime(0.1, function()
		inst.AnimState:PlayAnimation("atk_side_loop_pst") --RemoveBats()
		SpawnPrefab("statue_transition_2").Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst.SoundEmitter:PlaySound("dontstarve/sanity/bishop/attack_1", "bats")
	end)
	inst:DoTaskInTime(0.15, function()
		inst:Remove()
	end)
end

local function BatThink(inst)
	local me = inst.owner
	local chiro = me.components.chiropteran

	if chiro.transformed then
		local x, y, z = inst.Transform:GetWorldPosition()
		local ents = TheSim:FindEntities(x, y, z, TUNING.CHIROPTERAN_RANGE, nil, NON_ATTACK_TAGS, ATTACK_TAGS)

		for i, v in ipairs(ents) do
			if
				v:IsValid()
				and not v:IsInLimbo()
				and v.components.combat
				and (v.components.health and not v.components.health:IsDead())
			then
				if not v:HasTag("player") then
					-- Note that both Batilisk and LV1 Shadow Bishop do 20 damage
					v.components.combat:GetAttacked_Internal(me, TUNING.CHIROPTERAN_DAMAGE, nil)
				elseif v:HasTag("player") and me.components.combat:CanTarget(v) then
					v.components.combat:GetAttacked_Internal(me, TUNING.CHIROPTERAN_DAMAGE_PLAYER, nil)
				end
			end
		end
	else
		KillBats(inst)
	end
end

local function SpawnBats(inst)
	SpawnPrefab("statue_transition_2").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/sanity/bishop/attack_1", "bats")
end

local function fn()
	local inst = CreateEntity()

	--[[Non-networked entity]]
	inst.entity:SetCanSleep(false)
	inst.persists = false

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	--MakeInventoryPhysics(inst)
	--RemovePhysicsColliders(inst)
	inst.entity:AddNetwork()

	inst.AnimState:SetBank("shadow_bishop")
	inst.AnimState:SetBuild("shadow_bishop")
	inst.AnimState:PushAnimation("atk_side_loop_pre", true)
	inst.AnimState:PushAnimation("atk_side_loop", true)
	inst.AnimState:SetFinalOffset(-1)
	inst.Transform:SetScale(1, 1, 1)
	inst.AnimState:SetMultColour(1, 1, 1, 1)

	inst:AddTag("FX")
	inst:AddTag("scarytoprey")

	--Dedicated server does not need to spawn the local fx
	if not TheNet:IsDedicated() then
		inst:DoTaskInTime(0, SpawnBats)
		--inst:DoTaskInTime(4.5, KillSound)
		--inst:DoTaskInTime(5, RemoveBats)
	end

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:DoPeriodicTask(TUNING.CHIROPTERAN_ATTACK_RATE, BatThink)
	inst:ListenForEvent("chiroptera_exitbat", KillBats)

	return inst
end

return Prefab("chiropteran_bats", fn, assets)
