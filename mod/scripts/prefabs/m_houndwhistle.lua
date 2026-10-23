local assets = {
	Asset("ANIM", "anim/houndwhistle.zip"),
	Asset("ANIM", "anim/houndwhistle_water.zip"),
}

-- summon
local function OnSummonHound(inst, player)
	local hound_fire = SpawnPrefab("m_firehound")
	local hound_ice = SpawnPrefab("m_icehound")

	local pt = inst:GetPosition()
	local rad = 5

	if hound_fire ~= nil then
		local angle = math.random(2 * PI)
		local pt_fire = pt + Vector3(rad * math.cos(angle), 0, rad * math.sin(angle))
		hound_fire.Transform:SetPosition(pt_fire:Get())
		hound_fire.components.follower:SetLeader(player)
		SpawnPrefab("spawn_fx_tiny").Transform:SetPosition(pt_fire:Get())
	end
	if hound_ice ~= nil then
		local angle = math.random(2 * PI)
		local pt_ice = pt + Vector3(rad * math.cos(angle), 0, rad * math.sin(angle))
		hound_ice.Transform:SetPosition(pt_ice:Get())
		hound_ice.components.follower:SetLeader(player)
		SpawnPrefab("spawn_fx_tiny").Transform:SetPosition(pt_ice:Get())
	end
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst:AddTag("whistle")

	-- tool (from tool component) added to pristine state for optimization
	inst:AddTag("tool")
	inst:AddTag("nosteal")
	-- 幸运
	inst:AddTag("luckitem")

	inst.AnimState:SetBank("hound_whistle")
	inst.AnimState:SetBuild("houndwhistle")
	inst.AnimState:PlayAnimation("idle")

	MakeInventoryFloatable(inst, "small", 0.025, {
		1.1,
		0.7,
		1.1,
	})

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("instrument")
	-- inst.components.instrument.range = TUNING.HORN_NIGHTMARE.RANGE
	inst.components.instrument:SetOnPlayedFn(OnSummonHound)

	inst:AddComponent("inspectable")

	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.PLAY)

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:ChangeImageName("houndwhistle")

	-- 幸运属性
	-- inst:AddComponent("luckitem")
	-- inst.components.luckitem:SetLuck(3)

	MakeHauntableLaunch(inst)

	inst:ListenForEvent("floater_startfloating", function(inst)
		inst.AnimState:PlayAnimation("float")
	end)
	inst:ListenForEvent("floater_stopfloating", function(inst)
		inst.AnimState:PlayAnimation("idle")
	end)

	return inst
end

return Prefab("m_houndwhistle", fn, assets)
