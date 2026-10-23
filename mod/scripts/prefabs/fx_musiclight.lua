local assets = {
	Asset("ANIM", "anim/wx78_shadowdrone_debuffer.zip"),
	Asset("ANIM", "anim/wx78_shadowdrone_harvester.zip"),
}

local prefabs = {
	"globalmapiconunderfog",
}

local brain = require("brains/m_musiclightbrain")

local PATHCAPS = { allowocean = true, ignorecreep = true, ignorewalls = true }

local function CreateShadowFx()
	local inst = CreateEntity()

	inst:AddTag("DECOR")
	inst:AddTag("NOCLICK")
	--[[Non-networked entity]]
	--inst.entity:SetCanSleep(false) --commented out; follow parent sleep instead
	inst.persists = false

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddFollower()

	inst.AnimState:SetBank("wx78_shadowdrone_harvester")
	inst.AnimState:SetBuild("wx78_shadowdrone_harvester")
	inst.AnimState:PlayAnimation("fx_shadow_loop", true)
	inst.AnimState:SetMultColour(1, 1, 1, 0.5)
	inst.AnimState:UsePointFiltering(true)

	return inst
end

local function DoCancelDebuffTarget(inst, target)
	inst.debufftargets[target] = nil
end

local function StopTrackingDebuffTarget(inst, target)
	if inst.debufftargets[target] == true then
		inst.debufftargets[target] = inst:DoTaskInTime(2, DoCancelDebuffTarget, target)
	end
end

local function StartTrackingDebuffTarget(inst, target)
	if Periodic.is_instance(inst.debufftargets[target]) then
		inst.debufftargets[target]:Cancel()
	end
	inst.debufftargets[target] = true
end

local function ClearScanTarget(inst)
	if inst.target then
		inst:RemoveEventCallback("onremove", inst._onscantargetremoved, inst.target)
		inst._onscantargetremoved = nil
		StopTrackingDebuffTarget(inst, inst.target)
		inst.target = nil
	end
end

local function SetScanTarget(inst, target)
	if inst.target == target then
		return
	end

	inst:ClearScanTarget()

	if target and target:IsValid() then
		inst.target = target
		inst._onscantargetremoved = function()
			inst:ClearScanTarget()
		end
		inst:ListenForEvent("onremove", inst._onscantargetremoved, target)
		if inst._scanning then
			StartTrackingDebuffTarget(inst, target)
		end
	end
end

local function GetScanTarget(inst)
	return inst.target
end

local function OnStartScanning(inst)
	inst._scanning = true
	if inst.target then
		StartTrackingDebuffTarget(inst, inst.target)
	end
end

local function OnStopScanning(inst)
	inst._scanning = nil
	if inst.target then
		StopTrackingDebuffTarget(inst, inst.target)
	end
end

local function IsApplyingDebuffTo(inst, target)
	return inst.debufftargets[target] ~= nil
end

local function TryToDropRecipeLoot(inst)
	local recipe = AllRecipes.wx78_shadowdrone_debuffer
	if recipe == nil or recipe.ingredients == nil then
		return
	end

	local pt = inst:GetPosition()
	pt.y = pt.y + 2

	local lootdropper = inst.components.lootdropper or inst:AddComponent("lootdropper")
	lootdropper.y_speed = 4
	lootdropper.y_speed_variance = 3
	lootdropper.spawn_loot_inside_prefab = true

	local dropeverything = inst.components.counter:GetCount("interactions") == 0
	for _, ingredient in ipairs(recipe.ingredients) do
		if ingredient.type ~= "nightmarefuel" or dropeverything then
			local amt = (ingredient.amount == 0 and 0)
				or math.max(1, math.ceil(ingredient.amount * (dropeverything and 1 or 0.5)))
			for _ = 1, amt do
				lootdropper:SpawnLootPrefab(ingredient.type, pt)
			end
		end
	end
end

local function ApplyUse(inst)
	inst.components.counter:Set("interactions", 1)
end

local function OnPlayedFromCat(inst, doer, isairborne)
	if doer and doer:IsValid() and inst:IsNear(doer, 2) then
		inst:PushEvent("deactivate")
	end
end

local function CalcScanRange(inst)
	local bonus = 1
	local owner = inst.components.follower:GetLeader()
	-- if owner and owner.components.skilltreeupdater then
	-- 	if owner.components.skilltreeupdater:IsActivated("wx78_extradronerange") then
	-- 		bonus = bonus + TUNING.SKILLS.WX78.SHADOWDRONE_DEBUFFER_SCAN_RANGE_SKILLBOOST
	-- 	end
	-- 	if owner.components.skilltreeupdater:IsActivated("wx78_circuitry_betabuffs_1") and owner.GetModuleTypeCount then
	-- 		bonus = bonus + owner:GetModuleTypeCount("radar") * TUNING.SKILLS.WX78.RADAR_SHADOWDRONE_DEBUFFER_SCAN_RANGE
	-- 	end
	-- end

	return TUNING.SKILLS.WX78.SHADOWDRONE_DEBUFFER_SCAN_RANGE * 2 + bonus / 3,
		TUNING.SKILLS.WX78.SHADOWDRONE_DEBUFFER_SCAN_RANGE_MAX * 2 + bonus
end

local function OnSave(inst, data)
	data.despawn = inst.sg:HasStateTag("despawn")
end

local function OnLoad(inst, data) --, ents)
	if data and data.despawn then
		inst.sg:GoToState("despawn")
	end
end

---------------------------------------------------------------------------------------
-- 缓存皮肤列表
local function GetCachedSkinList(userid, inst)
	-- 如果已经有缓存且缓存有效，直接返回
	if inst._cached_skin_list and inst._cached_userid == userid then
		return inst._cached_skin_list
	end

	local prefab_name = inst.prefab
	local prefabskins = PREFAB_SKINS[prefab_name]

	-- 构建完整选项：原皮 + 所有可用的皮肤
	-- 原皮用 "$$BASE$$" 特殊标记，因为 nil 在表中不好处理
	local all_options = { "$$BASE$$" } -- 代表原皮

	if prefabskins then
		for _, skin_name in ipairs(prefabskins) do
			local skip_this = PREFAB_SKINS_SHOULD_NOT_SELECT[skin_name] or false

			if SKINS_EVENTLOCK[skin_name] and not IsSpecialEventActive(SKINS_EVENTLOCK[skin_name]) then
				skip_this = true
			end

			if not skip_this then
				if TheInventory:CheckClientOwnership(userid, skin_name) then
					table.insert(all_options, skin_name)
				end
			end
		end
	end

	-- 缓存起来
	inst._cached_userid = userid
	inst._cached_skin_list = all_options
	inst._cached_current_index = 1 -- 当前索引，从原皮开始

	return all_options
end

local function GetNextSkinName(userid, inst)
	-- 获取缓存的皮肤列表
	local skin_list = GetCachedSkinList(userid, inst)

	if not skin_list or #skin_list == 0 then
		return nil
	end

	-- 只有一个原皮可选
	if #skin_list == 1 then
		return nil
	end

	-- 获取当前皮肤，找到当前索引
	local curr_skin = inst.skinname
	local current_index = inst._cached_current_index or 1

	-- 验证当前索引是否正确（防止外部修改了皮肤）
	local expected_skin = skin_list[current_index]
	if expected_skin == "$$BASE$$" then
		expected_skin = nil
	end

	if expected_skin ~= curr_skin then
		-- 当前皮肤与缓存索引不匹配，重新查找索引
		current_index = nil
		for i, skin_name in ipairs(skin_list) do
			local compare_skin = (skin_name == "$$BASE$$") and nil or skin_name
			if compare_skin == curr_skin then
				current_index = i
				break
			end
		end
		if not current_index then
			current_index = 1
		end
	end

	-- 计算下一个索引（循环）
	local next_index = current_index % #skin_list + 1

	-- 保存当前索引（实际上是旧索引，下次会用）
	inst._cached_current_index = current_index

	-- 返回下一个皮肤
	local next_skin = skin_list[next_index]
	if next_skin == "$$BASE$$" then
		return nil -- 原皮
	end
	return next_skin
end

local function StartAutoReskin(inst)
	local leader = inst.components.follower.leader

	if not leader or not leader.userid then
		return
	end

	local userid = leader.userid

	-- 停止之前的任务
	if inst._auto_reskin_task then
		inst._auto_reskin_task:Cancel()
		inst._auto_reskin_task = nil
	end

	-- 预加载皮肤列表
	GetCachedSkinList(userid, inst)

	-- 每2秒换一次皮肤
	inst._auto_reskin_task = inst:DoPeriodicTask(2, function()
		if not inst:IsValid() then
			return
		end

		local next_skin = GetNextSkinName(userid, inst)

		-- 应用皮肤（next_skin 可能是 nil，表示原皮）
		TheSim:ReskinEntity(inst.GUID, inst.skinname, next_skin, nil, userid)

		-- 更新缓存索引到新皮肤的位置
		local skin_list = inst._cached_skin_list
		if skin_list then
			for i, skin_name in ipairs(skin_list) do
				local compare_skin = (skin_name == "$$BASE$$") and nil or skin_name
				if compare_skin == next_skin then
					inst._cached_current_index = i
					break
				end
			end
		end
	end)
end
---------------------------------------------------------------------------------------

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()

	MakeTinyFlyingCharacterPhysics(inst, 50, 0.1)

	inst.Transform:SetFourFaced()

	-- inst.MiniMapEntity:SetIcon("wx78_shadowdrone_debuffer.png")
	-- inst.MiniMapEntity:SetCanUseCache(false)

	inst.DynamicShadow:SetSize(1.2, 0.75)

	inst.AnimState:SetBank("wx78_shadowdrone_debuffer")
	inst.AnimState:SetBuild("wx78_shadowdrone_debuffer")
	inst.AnimState:PlayAnimation("idle_loop", true)
	inst.AnimState:SetSymbolLightOverride("fx_scan_parts", 0.15)
	inst.AnimState:OverrideSymbol("wx78_shadow_explode", "wx78_shadowdrone_harvester", "wx78_shadow_explode")
	-- inst.AnimState:SetSymbolMultColour("fx_scan_parts", 1, 0, 0, 1)

	inst:AddTag("wx78_shadowdrone")
	inst:AddTag("companion")
	inst:AddTag("scarytoprey")
	inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
	inst:AddTag("shadow_aligned")

	if not TheNet:IsDedicated() then
		local fx = CreateShadowFx()
		fx.entity:SetParent(inst.entity)
		fx.Follower:FollowSymbol(inst.GUID, "FOLLOW_SHADOW", 0, 0, 0, true)
	end

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.scrapbook_animoffsety = 100

	inst:AddComponent("maprevealable")
	inst.components.maprevealable:SetIconPrefab("globalmapiconunderfog")

	inst:AddComponent("inspectable")

	local locomotor = inst:AddComponent("locomotor")
	locomotor.walkspeed = TUNING.SKILLS.WX78.SHADOWDRONE_DEBUFFER_WALKSPEED
	locomotor.runspeed = TUNING.SKILLS.WX78.SHADOWDRONE_DEBUFFER_RUNSPEED
	locomotor.directdrive = true -- using directdrive to bypass pathfinding
	locomotor:SetExternalSpeedMultiplier(inst, "run_start", 0) -- hack speed mult to prevent run_start from moving right away (see stategraph)
	locomotor:EnableGroundSpeedMultiplier(false)
	locomotor:SetTriggersCreep(false)
	locomotor.pathcaps = PATHCAPS

	inst:AddComponent("follower")

	inst:AddComponent("knownlocations")

	inst:AddComponent("counter")

	inst:AddComponent("cattoy")
	inst.components.cattoy:SetOnPlay(OnPlayedFromCat)
	inst.components.cattoy:SetBypassLastAirTime(true)

	inst:SetBrain(brain)
	inst:SetStateGraph("SGm_musiclight")

	inst.target = nil
	inst.debufftargets = {}

	inst.SetScanTarget = SetScanTarget
	inst.ClearScanTarget = ClearScanTarget
	inst.GetScanTarget = GetScanTarget
	inst.OnStartScanning = OnStartScanning
	inst.OnStopScanning = OnStopScanning
	inst.IsApplyingDebuffTo = IsApplyingDebuffTo
	inst.TryToDropRecipeLoot = TryToDropRecipeLoot
	inst.ApplyUse = ApplyUse
	inst.CalcScanRange = CalcScanRange
	inst.OnSave = OnSave
	inst.OnLoad = OnLoad

	inst.persists = false

	inst._task = inst:DoTaskInTime(0.5, function()
		StartAutoReskin(inst)
	end)

	return inst
end

PREFAB_SKINS["fx_musiclight"] = PREFAB_SKINS["wx78_shadowdrone_debuffer"]
PREFAB_SKINS_IDS["fx_musiclight"] = PREFAB_SKINS_IDS["wx78_shadowdrone_debuffer"]

return Prefab("fx_musiclight", fn, assets, prefabs)
