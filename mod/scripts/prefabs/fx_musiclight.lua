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
-- 皮肤轮换
-- 规则：
--   · 皮肤列表按 owner 缓存（6 盏灯共享一份），并定期重建，兼顾会话中解锁皮肤
--   · 只由一个 driver 定时统一换肤，避免 6 个 timer / 同帧 6 次 ReskinEntity
--   · 每盏灯按 GUID 错开一个偏移，换肤时是“波浪”而不是整片一起闪
--   · 换完必须回写 pet.skinname，否则下一轮会一直判定成原皮（旧实现就卡在这）
---------------------------------------------------------------------------------------

local BASE_SKIN = "$$BASE$$"
local SKIN_CACHE_TTL = 60 -- 秒，定期重建列表

local function BuildSkinList(userid)
	local all_options = { BASE_SKIN }

	local prefabskins = PREFAB_SKINS["fx_musiclight"]
	if prefabskins ~= nil then
		for _, skin_name in ipairs(prefabskins) do
			local skip_this = PREFAB_SKINS_SHOULD_NOT_SELECT[skin_name] or false

			if SKINS_EVENTLOCK[skin_name] and not IsSpecialEventActive(SKINS_EVENTLOCK[skin_name]) then
				skip_this = true
			end

			if not skip_this and TheInventory:CheckClientOwnership(userid, skin_name) then
				table.insert(all_options, skin_name)
			end
		end
	end

	return all_options
end

local function GetSharedSkinList(leader)
	local now = GetTime()
	if
		leader._musiclight_skin_list ~= nil
		and leader._musiclight_skin_userid == leader.userid
		and now - (leader._musiclight_skin_time or 0) < SKIN_CACHE_TTL
	then
		return leader._musiclight_skin_list
	end

	local list = BuildSkinList(leader.userid)
	leader._musiclight_skin_userid = leader.userid
	leader._musiclight_skin_list = list
	leader._musiclight_skin_time = now
	return list
end

local function StopReskinDriver(leader)
	if leader._musiclight_reskin_task ~= nil then
		leader._musiclight_reskin_task:Cancel()
		leader._musiclight_reskin_task = nil
	end
end

local function GetMusicLights(leader)
	local lights = {}
	local leadercomp = leader.components.leader
	if leadercomp ~= nil then
		-- 音乐灯是用 leader:AddFollower 挂上的，不在 petleash 里
		for ent in pairs(leadercomp.followers) do
			if ent.prefab == "fx_musiclight" and ent:IsValid() then
				table.insert(lights, ent)
			end
		end
	end
	return lights
end

local function ReskinMusicLights(leader)
	local pets = GetMusicLights(leader)
	if #pets == 0 then
		-- buff 已经结束，没人需要换了
		StopReskinDriver(leader)
		return
	end

	local list = GetSharedSkinList(leader)
	local count = #list
	if count <= 1 then
		return
	end

	leader._musiclight_skin_step = (leader._musiclight_skin_step or 0) + 1
	local step = leader._musiclight_skin_step

	for _, pet in ipairs(pets) do
		-- 6 盏灯统一颜色：同一轮用同一个索引
		local next_skin = list[(step % count) + 1]
		if next_skin == BASE_SKIN then
			next_skin = nil
		end

		if next_skin ~= pet.skinname then
			TheSim:ReskinEntity(pet.GUID, pet.skinname, next_skin, nil, leader.userid)
			pet.skinname = next_skin
		end
	end
end

local function StartAutoReskin(inst)
	local leader = inst.components.follower.leader
	if leader == nil or leader.userid == nil then
		return
	end

	-- 只有第一盏灯负责建 driver，后面的灯直接复用
	-- 即使当前只有原皮也开着，这样会话中解锁皮肤后（缓存 60 秒重建）能自动开始轮换
	if leader._musiclight_reskin_task == nil then
		leader._musiclight_reskin_task = leader:DoPeriodicTask(2, function()
			if leader:IsValid() then
				ReskinMusicLights(leader)
			end
		end)
	end
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
