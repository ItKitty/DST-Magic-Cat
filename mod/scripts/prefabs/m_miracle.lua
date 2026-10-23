local assets = {}

------------------------ 通用函数 --------------------------------
-- 天光特效
local function AddLightFx(player)
	local x, y, z = player.Transform:GetWorldPosition()
	local light = SpawnPrefab("booklight")
	light.Transform:SetPosition(x, y, z)
	light:SetDuration(3)
end

------------------------ Moon --------------------------------
local function SetMoonPhase(player)
	-- AddLightFx(player)

	if TheWorld.state.moonphase ~= "full" then
		TheWorld:PushEvent("ms_setmoonphase", { moonphase = "full" })
	else
		TheWorld:PushEvent("ms_setmoonphase", { moonphase = "new", iswaxing = true })
	end

	local fx = SpawnPrefab("fx_book_moon")
	if player ~= nil then
		fx.Transform:SetPosition(player.Transform:GetWorldPosition())
		fx.Transform:SetRotation(player.Transform:GetRotation())
	end

	if player and player.components.talker then
		player.components.talker:Say("月相改变了！")
	end
end

------------------------ Granding -----------------------------
-- 促进植物生长的函数
local function accelerateGrowth(plant)
	-- 跳过处于Limbo状态或已枯萎的植物
	if
		not plant:IsValid()
		or plant:IsInLimbo()
		or (plant.components.witherable ~= nil and plant.components.witherable:IsWithered())
	then
		return false
	end
	local AddFx = false

	-- 处理可采集植物
	if plant.components.pickable ~= nil then
		if plant.components.pickable:CanBePicked() and plant.components.pickable.caninteractwith then
			return false
		end
		if plant.components.pickable:FinishGrowing() then
			plant.components.pickable:ConsumeCycles(1) -- magic grow is hard on plants
			AddFx = true
		end
	end

	-- 处理农作物
	if plant.components.crop ~= nil and (plant.components.crop.rate or 0) > 0 then
		if plant.components.crop:DoGrow(1 / plant.components.crop.rate, true) then
			AddFx = true
		end
	end
	-- 处理可生长植物
	if plant.components.growable ~= nil then
		local g = plant.components.growable
		if plant:HasTag("farm_plant") and g.stages then
			-- 农场植物直接设为最大阶段
			plant.is_oversized = true
			if #g.stages - 1 > 1 then
				g:SetStage(#g.stages - 1)
			else
				g:SetStage(4)
			end
		else
			-- 处理魔法生长或树木
			if
				plant.components.growable.magicgrowable
				or ((plant:HasTag("tree") or plant:HasTag("winter_tree")) and not plant:HasTag("stump"))
			then
				if plant.components.simplemagicgrower ~= nil then
					plant.components.simplemagicgrower:StartGrowing()
				elseif plant.components.growable.domagicgrowthfn ~= nil then
					plant.components.growable:DoMagicGrowth()
				else
					plant.components.growable:DoGrowth()
				end
			end
		end
		AddFx = true
	end

	-- 处理可收获的蘑菇农场
	if
		plant.components.harvestable ~= nil
		and plant.components.harvestable:CanBeHarvested()
		and plant:HasTag("mushroom_farm")
	then
		if plant.components.harvestable:IsMagicGrowable() then
			plant.components.harvestable:DoMagicGrowth()
			AddFx = true
		else
			if plant.components.harvestable:Grow() then
				AddFx = true
			end
		end
	end

	if AddFx then
		local _x, _y, _z = plant.Transform:GetWorldPosition()
		local fx = SpawnPrefab("farm_plant_happy")
		fx.Transform:SetScale(2, 2, 2)
		fx.Transform:SetPosition(_x, _y, _z)
	end
end

-- 园艺魔法主函数
local function Gardening(player)
	if player and player.components.talker then
		player.components.talker:Say("万物复苏！")
	end

	-- 获取玩家位置并查找附近的植物
	local x, y, z = player.Transform:GetWorldPosition()
	local nearbyPlants = TheSim:FindEntities(x, y, z, 15, nil, { "pickable", "stump", "withered", "INLIMBO", "barren" })

	-- AddLightFx(player)

	-- 对找到的植物应用生长加速
	if #nearbyPlants > 0 then
		-- 立即加速一个随机植物
		accelerateGrowth(table.remove(nearbyPlants, math.random(#nearbyPlants)))

		-- 对其余植物安排延迟加速
		if #nearbyPlants > 0 then
			local timeInterval = 1 - 1 / (#nearbyPlants + 1)
			for _, plant in ipairs(nearbyPlants) do
				plant:DoTaskInTime(timeInterval * math.random(), accelerateGrowth)
			end
		end
	end
end

------------------------ Curse Removal -----------------------------
local function RemoveMonkeyCurse(player)
	-- AddLightFx(player)

	local curse_removed = false

	-- 移除MONKEY诅咒
	if
		player.components.cursable
		and player.components.cursable.curses.MONKEY
		and player.components.cursable.curses.MONKEY > 0
	then
		player.components.cursable:RemoveCurse("MONKEY", 10) -- 立即移除
		curse_removed = true
	end

	-- 移除wonkey标签
	if player:HasTag("wonkey") then
		player:RemoveTag("wonkey")
		curse_removed = true
	end

	-- 移除背包中的猴子诅咒物品
	if player.components.inventory then
		local curses = player.components.inventory:FindItems(function(item)
			return item:HasTag("monkey_token") or item.prefab == "cursed_monkey_token"
		end)

		for _, curse_item in ipairs(curses) do
			curse_item:Remove()
			curse_removed = true
		end
	end

	-- 播放效果和音效
	if curse_removed then
		player.AnimState:PlayAnimation("curse_success")
		player.SoundEmitter:PlaySound("monkeyisland/monkeyqueen/remove_curse_success")

		if player.components.talker then
			player.components.talker:Say("诅咒被清除了！")
		end
	else
		if player.components.talker then
			player.components.talker:Say("没有诅咒了！")
		end
	end
end

------------------------ Catchfish -----------------------------
local function Catchfish(player)
	local x, y, z = player.Transform:GetWorldPosition()
	local pos = { x = x, y = y, z = z }
	local range = 30

	local SetPosition = function(item, pos)
		local x = pos.x + math.random(-10, 10) * 0.1
		local z = pos.z + math.random(-10, 10) * 0.1
		if item.Physics ~= nil then
			item.Physics:SetActive(true)
			item.Physics:Teleport(x, 0, z)
		else
			item.Transform:SetPosition(x, 0, z)
		end
	end

	-- “夹夹绞盘”可以捞起沉在水中的重物或海洋残骸
	local CLAW_CATCH_MUST_TAGS = { "winchtarget" }
	local salvageable_ents = TheSim:FindEntities(x, 0, z, range, CLAW_CATCH_MUST_TAGS, { "INLIMBO" }, nil)
	for _, salvageable in ipairs(salvageable_ents) do
		if salvageable ~= nil then
			if salvageable.components.winchtarget ~= nil then
				local salvaged_item = salvageable.components.winchtarget:Salvage()

				if salvaged_item ~= nil then
					if player.components.inventory ~= nil then
						player.components.inventory:GiveItem(salvaged_item)
					end

					salvaged_item:PushEvent("on_salvaged")
					SetPosition(salvaged_item, pos)
				end

				salvageable:Remove()
			end
		end
	end

	-- 垂钓海鱼
	local OCEAN_FISHING_MUST_TAGS = { "oceanfishable" }
	local fish_ents = TheSim:FindEntities(x, y, z, range, OCEAN_FISHING_MUST_TAGS, { "INLIMBO" }, nil)
	for _, target in ipairs(fish_ents) do
		if target ~= nil then
			if target.components.oceanfishable ~= nil then
				local src_pos = target:GetPosition()
				local dest_pos = player:GetPosition()
				local catch_vect = dest_pos - src_pos
				local targetpos = src_pos + catch_vect:GetNormalized() * (catch_vect:Length() + (math.random() + 0.5))
				local startpos = target:GetPosition()
				local fish = target.components.oceanfishable:MakeProjectile()
				if fish ~= nil then
					if fish.components.weighable ~= nil then
						fish.components.weighable:SetPlayerAsOwner(player)
						fish.components.weighable:SetWeight(999.99)
					end

					fish.Transform:SetPosition(startpos:Get())
					fish:ForceFacePoint(targetpos:Get())

					if fish.components.complexprojectile ~= nil then
						local distance = math.sqrt((targetpos.x - startpos.x) ^ 2 + (targetpos.z - startpos.z) ^ 2)
						local speed = fish.components.complexprojectile:CalculateMinimumSpeedForDistance(distance, 12)
						fish.components.complexprojectile:SetHorizontalSpeed(speed)
						fish.components.complexprojectile:SetLaunchOffset(Vector3(0, 0.5, 0))
						fish.components.complexprojectile:SetTargetOffset(Vector3(0, 0.2, 0))
						fish.components.complexprojectile:Launch(targetpos, fish)
					end

					player:PushEvent("fishcaught", { fish = fish })
				end
			end
		end
	end

	-- 垂钓河鱼
	local FISHING_MUST_TAGS = { "fishable" }
	local water_ents = TheSim:FindEntities(x, y, z, range, FISHING_MUST_TAGS, { "INLIMBO" }, nil)
	for _, target in ipairs(water_ents) do
		if target ~= nil then
			if target.components.fishable ~= nil then
				local unfishable = target.components.fishable:IsFrozenOver()
				if not unfishable then
					local maxfish = target.components.fishable.maxfish or 10
					local countfish = 0
					while (target.components.fishable.fishleft or 0) > 0 and countfish < maxfish do
						local hookedfish = target.components.fishable:HookFish(player)
						if hookedfish ~= nil then
							local fish = target.components.fishable:RemoveFish(hookedfish)
							if fish ~= nil then
								if fish.components.weighable ~= nil then
									fish.components.weighable:SetPlayerAsOwner(player)
									fish.components.weighable:SetWeight(999.99)
								end
								countfish = countfish + 1

								fish.entity:Show()
								if fish.DynamicShadow ~= nil then
									fish.DynamicShadow:Enable(true)
								end
								fish.persists = true

								SetPosition(fish, pos)
								player:PushEvent("fishingcollect", { fish = fish })
							end
						end
					end
				end
			end
		end
	end

	if player and player.components.talker then
		player.components.talker:Say("大捞特捞！")
	end
end

------------------------ Mutation -----------------------------
local function Mutation(player)
	if player and player.components.talker then
		player.components.talker:Say("月亮突变！")
	end

	local x, y, z = player.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(
		x,
		y,
		z,
		15,
		nil,
		{ "player", "playerghost", "INLIMBO", "dead" },
		{ "halloweenmoonmutable" }
	)

	for k, v in ipairs(ents) do
		x, y, z = v.Transform:GetWorldPosition()

		if v.components.halloweenmoonmutable ~= nil then
			v.components.halloweenmoonmutable:Mutate()
			local fx = SpawnPrefab("halloween_moonpuff")
			fx.Transform:SetPosition(x, y, z)
		end
	end
end

------------------------ Summonfishes -----------------------------
local GNARWAIL_SPAWN_RADIUS = 10
local GNARWAIL_TAGS = { "gnarwail" }
local function testforgnarwail(spawnpoint)
	local offset = FindSwimmableOffset(spawnpoint, math.random() * TWOPI, GNARWAIL_SPAWN_RADIUS)
	local ents =
		TheSim:FindEntities(spawnpoint.x, spawnpoint.y, spawnpoint.z, TUNING.GNARWAIL_TEST_RADIUS, GNARWAIL_TAGS)
	-- 附近最多只存在3只一角鲸
	if #ents < 3 and offset then
		local spawn_x = spawnpoint.x + offset.x
		local spawn_z = spawnpoint.z + offset.z

		-- Make sure a boat didn't roll over our spawn point during the delay
		if TheWorld.Map:GetPlatformAtPoint(spawn_x, spawn_z) == nil then
			local gnarwail = SpawnPrefab("gnarwail")
			gnarwail.Transform:SetPosition(spawn_x, 0, spawn_z)
			gnarwail.sg:GoToState("emerge")
		end
	end
end

local function Summonfishes(player)
	local schoolspawner = TheWorld.components.schoolspawner
	if schoolspawner == nil then
		return false
	end

	local FISH_SPAWN_OFFSET = 10
	local x, y, z = player.Transform:GetWorldPosition()
	local delta_theta = PI2 / 18
	local failed_spawn = 0

	for i = 1, TUNING.BOOK_FISH_AMOUNT do
		local theta = math.random() * TWOPI
		local failed_attempts = 0
		local max_failed_attempts = 36

		while failed_attempts < max_failed_attempts do
			local spawn_offset = Vector3(math.random(1, 3), 0, math.random(1, 3))
			local spawn_point =
				Vector3(x + math.cos(theta) * FISH_SPAWN_OFFSET, 0, z + math.sin(theta) * FISH_SPAWN_OFFSET)
			local num_fish_spawned = schoolspawner:SpawnSchool(spawn_point, player, spawn_offset)

			testforgnarwail(spawn_point)

			if num_fish_spawned == nil or num_fish_spawned == 0 then
				theta = theta + delta_theta
				failed_attempts = failed_attempts + 1

				if failed_attempts >= max_failed_attempts then
					failed_spawn = failed_spawn + 1
				end
			else -- Success
				break
			end
		end
	end

	if failed_spawn >= TUNING.BOOK_FISH_AMOUNT then
		return false
	end

	if player and player.components.talker then
		player.components.talker:Say("鱼群大暴走！")
		local fx = SpawnPrefab("fx_book_fish")
		fx.Transform:SetPosition(x, y, z)
	end
end

------------------------ 通用施法函数 --------------------------------
-- 通用施法函数（放在所有具体法术函数之后）
local function CastSpell(player, spellType)
	if not player or not TheWorld.ismastersim then
		return
	end

	-- 检查施法者条件（可根据需要添加）
	-- if not player:HasTag("madeleine") then
	-- 	return
	-- end

	-- 根据法术类型执行对应的功能
	if spellType == "moon" then
		SetMoonPhase(player)
	elseif spellType == "garden" then
		Gardening(player)
	elseif spellType == "removecurse" then
		RemoveMonkeyCurse(player)
	elseif spellType == "catchfish" then
		Catchfish(player)
	elseif spellType == "mutation" then
		Mutation(player)
	elseif spellType == "summonfishes" then
		Summonfishes(player)
	end
end

------------------------ 物品生成函数 --------------------------------
-- 通用物品生成函数
local function CreateSpellItem(spellType)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst.entity:SetPristine()
	-- 让实体对客户端或只对一个客户端可见
	inst:AddTag("CLASSIFIED")
	inst.persists = false

	inst:DoTaskInTime(0, inst.Remove)

	if not TheWorld.ismastersim then
		return inst
	end

	-- 添加组件
	inst:AddComponent("inventoryitem")

	-- 设置建造回调
	inst.OnBuiltFn = function(inst, builder)
		if builder then
			-- 可以在这里添加施法者条件判断
			-- if builder:HasTag("madeleine") then
			CastSpell(builder, spellType)
			-- end
		end
		inst:Remove()
	end

	return inst
end

------------------------ 返回Prefab --------------------------------
return Prefab("m_setmoonphase", function()
	return CreateSpellItem("moon")
end, assets),
	Prefab("m_garden", function()
		return CreateSpellItem("garden")
	end, assets),
	Prefab("m_removecurse", function()
		return CreateSpellItem("removecurse")
	end, assets),
	Prefab("m_catchfish", function()
		return CreateSpellItem("catchfish")
	end, assets),
	Prefab("m_mutation", function()
		return CreateSpellItem("mutation")
	end, assets),
	Prefab("m_summonfishes", function()
		return CreateSpellItem("summonfishes")
	end, assets)
