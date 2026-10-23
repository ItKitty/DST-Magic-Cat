local Madeleinetraits = Class(function(self, inst)
	self.inst = inst
	self.power = 0
	self.powerfx = nil
	self.spawncharge = nil
	self.setsantiy = false
	self.togglenightvision = false
end, nil, {})

--
function Madeleinetraits:PowerRemove(inst, data)
	inst.components.talker:Say("光，熄灭了！")
	inst:RemoveTag("m_ice_charge")
	inst:RemoveTag("m_fire_charge")

	self.power = 0
	self.powerfx = nil

	if self.spawncharge ~= nil then
		self.spawncharge:Remove()
		self.spawncharge = nil
	end

	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")

	inst.components.sanity.dapperness = TUNING.DAPPERNESS_LARGE
end

function Madeleinetraits:PowerReady(inst, powerfx)
	if not inst.components.inventory.equipslots[EQUIPSLOTS.HANDS] then
		inst.components.talker:Say("需要装备来发挥光的力量。")
		return
	end
	local item = inst.components.inventory.equipslots[EQUIPSLOTS.HANDS]
	if item.prefab == "m_soulstaff" then
		if self.power == 1 and self.powerfx == powerfx then
			self:PowerRemove(inst)
		else
			-- inst.components.sanity.dapperness = -TUNING.DAPPERNESS_SUPERHUGE
			-- inst.components.sanity.dapperness = -10
			self.power = 1
			self.powerfx = powerfx
			if powerfx == "deer_fire_charge" then
				inst.components.talker:Say("感受火热！")
				inst:AddTag("m_fire_charge")
				inst:RemoveTag("m_ice_charge")
			elseif powerfx == "deer_ice_charge" then
				inst.components.talker:Say("感受寒冷！")
				inst:AddTag("m_ice_charge")
				inst:RemoveTag("m_fire_charge")
			end
			self.spawncharge = SpawnPrefab(powerfx)
			self.spawncharge.entity:AddFollower()
			self.spawncharge.Follower:FollowSymbol(inst.GUID, "swap_object", 0, -230, 0)
		end
	else
		inst.components.talker:Say("这件装备承载不了光的力量。")
	end
end

function Madeleinetraits:powerready_ice()
	self.inst:PushEvent("powerready_ice")
end

function Madeleinetraits:powerready_fire()
	self.inst:PushEvent("powerready_fire")
end
----------------------------------------------------------

--
function Madeleinetraits:ToggleSanity(inst)
	if not inst.components.inventory.equipslots[EQUIPSLOTS.NECK or EQUIPSLOTS.BODY] then
		inst.components.talker:Say("需要装备来发挥影的力量。")
		return
	end
	local item = inst.components.inventory.equipslots[EQUIPSLOTS.NECK or EQUIPSLOTS.BODY]
	if item.prefab == "m_amulet" and item:HasTag("m_nightmareform") then
		if inst.components.sanity ~= nil then
			inst.components.talker:Say("神魂颠倒！")

			self.setsantiy = not self.setsantiy
			inst.components.sanity:SetInducedInsanity(inst, self.setsantiy)
		end
	else
		inst.components.talker:Say("这件装备承载不了影的力量。")
	end
end

function Madeleinetraits:togglesanity()
	self.inst:PushEvent("togglesanity")
end

function Madeleinetraits:ToggleLight(inst)
	if not inst.components.inventory.equipslots[EQUIPSLOTS.HEAD] then
		inst.components.talker:Say("需要装备来发挥影的力量。")
		return
	end
	local item = inst.components.inventory.equipslots[EQUIPSLOTS.HEAD]
	if item and item.prefab == "m_bonehat" then
		if not self.togglenightvision then
			inst.components.talker:Say("昏暗视觉！")
			local x, y, z = inst.Transform:GetWorldPosition()
			local fx = SpawnPrefab("fx_book_light_upgraded")
			if fx then
				fx.Transform:SetPosition(x, y, z)
			end
			-- 防砂
			item:AddTag("goggles")
			-- 夜视
			item:AddTag("nightvision")
			-- 月暴
			-- item:AddTag("nutrientsvision")
			self.togglenightvision = true
		else
			inst.components.talker:Say("附魔解除！")
			item:RemoveTag("goggles")
			item:RemoveTag("nightvision")
			-- item:RemoveTag("nutrientsvision")

			self.togglenightvision = false
		end

		local hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		inst:PushEvent("unequip", {
			item = hat,
			eslot = EQUIPSLOTS.HEAD,
		})
		inst:PushEvent("equip", {
			item = hat,
			eslot = EQUIPSLOTS.HEAD,
		})
	else
		inst.components.talker:Say("这件装备承载不了影的力量。")
	end
end

function Madeleinetraits:togglelight()
	self.inst:PushEvent("togglelight")
end
----------------------------------------------------------

-------------------------------- 表情施法 ---------------------------------------

--与植物交流
local function TriggerFertilize(inst)
	-- 取消旧任务（避免重复）
	if inst.fert_fx_task then
		inst.fert_fx_task:Cancel()
		inst.fert_fx_task = nil
	end

	-- 初始对话
	inst.components.talker:Say("植物朋友们说它们很高兴！我也很高兴！喵~")

	-- 整合特效播放和施肥逻辑（每1秒执行一次，共10次）
	local duration = 30 -- 总持续时间（秒）
	local interval = 1 -- 任务执行间隔（秒）
	local count = 0

	inst.fert_fx_task = inst:DoPeriodicTask(interval, function()
		count = count + 1

		-- 1. 播放特效（每次循环都生成）
		-- 获取当前位置
		local x, y, z = inst.Transform:GetWorldPosition()
		SpawnPrefab("wx78_musicbox_fx").Transform:SetPosition(x, y, z)

		-- 2. 每3次循环（即每3秒）执行一次施肥（共3次）
		if count % 3 == 0 then
			-- 照料附近作物
			local ents = TheSim:FindEntities(x, y, z, 20, nil, nil, { "tendable_farmplant" })
			for i, v in ipairs(ents) do
				if v.components.farmplanttendable then
					v.components.farmplanttendable:TendTo(inst)
				end
				if v.components.farmplantstress then
					v.components.farmplantstress:Reset()
				end
			end

			-- 施肥和浇水
			local size = 20
			for i = x - size, x + size do
				for j = z - size, z + size do
					if TheWorld.Map:GetTileAtPoint(i, 0, j) == WORLD_TILES.FARMING_SOIL then
						TheWorld.components.farming_manager:AddSoilMoistureAtPoint(i, y, j, 50)
						local _x, _y = TheWorld.Map:GetTileCoordsAtPoint(i, y, j)
						TheWorld.components.farming_manager:AddTileNutrients(_x, _y, 50, 50, 50)
					end
				end
			end
		end

		-- 3. 10秒后停止任务并显示结束对话
		if count >= duration then
			inst.fert_fx_task:Cancel()
			inst.fert_fx_task = nil
		end
	end, 0) -- 立即开始
end

-- 哭就下雨,灭火
local function Forceprecipitation(inst)
	local _x, _y, _z = inst.Transform:GetWorldPosition()
	local fires = TheSim:FindEntities(_x, _y, _z, 20, nil, {
		"INLIMBO",
		"lighter",
	}, {
		"fire",
		"smolder",
	})

	if #fires > 0 then
		for i, fire in ipairs(fires) do
			if fire.components.burnable then
				fire.components.burnable:Extinguish(true, 0)
			end
		end
	end
	-----------------------------------

	TheWorld:PushEvent("ms_forceprecipitation", true)
end
-- 睡眠免疫
local function Sleepimmunity(inst)
	if
		inst.components.grogginess ~= nil
		and not (inst.components.health ~= nil and inst.components.health:IsDead())
		and not inst:HasTag("playerghost")
	then
		inst.components.grogginess:ResetGrogginess()
	end

	inst:AddDebuff("shroomsleepresist", "buff_sleepresistance")
	inst:AddDebuff("shroomsleepimmunity", "buff_sleepimmunity")
end
-- 保持干燥
local function Moistureimmunity(inst)
	TheWorld:PushEvent("ms_forceprecipitation", false)
	inst:AddDebuff("buff_moistureimmunity", "buff_moistureimmunity")
end
-- 准备打架
local function ReadyFight(inst)
	inst.components.sanity:DoDelta(-100)
	-- 羊角冻
	inst:AddDebuff("buff_electricattack", "buff_electricattack")
	-- 辣椒面
	inst:AddDebuff("buff_attack", "buff_attack")
	-- 蒜
	inst:AddDebuff("buff_playerabsorption", "buff_playerabsorption")
	-- 糖豆
	-- inst:AddDebuff("healthregenbuff", "healthregenbuff")
	-- 舒缓茶
	inst:AddDebuff("sweettea_buff", "sweettea_buff")
	-- 月树花茶-使攻击自己的暗影臣民恐慌 30 秒；不会产生波浪·琼斯
	inst:AddDebuff("hermitcrabtea_moon_tree_blossom_buff", "hermitcrabtea_moon_tree_blossom_buff")
	-- 叶子茶-受到疯狂光环的影响降低至10%，持续 3 分钟
	inst:AddDebuff("hermitcrabtea_foliage_buff", "hermitcrabtea_foliage_buff")
end
-- 准备工作
local function ReadyWork(inst)
	inst.components.sanity:DoDelta(-30)
	-- 糖粉
	inst:AddDebuff("buff_workeffectiveness", "buff_workeffectiveness")
end
-- 风之加护
local function ReadySpeed(inst)
	inst.components.sanity:DoDelta(-30)

	local x, y, z = inst.Transform:GetWorldPosition()
	local range = 30
	-- local players = TheSim:FindEntities(x, y, z, range, { "player" }, { "playerghost" })
	local players = FindPlayersInRange(x, y, z, range, true)
	for _, player in ipairs(players) do
		player:AddDebuff("buff_m_windspeed", "buff_m_windspeed")
	end
end

-- 影火攻击
-- 影火攻击
local function DoShadowFire(doer, x, z, rot)
	local fire = SpawnPrefab("willow_shadow_flame")
	fire.Transform:SetRotation(rot)
	fire.Transform:SetPosition(x, 0, z)
	fire:settarget(nil, 50, doer)
end

local function FireBurst(inst, count)
	local radius = 2
	local x, y, z = inst.Transform:GetWorldPosition()
	local theta = inst.Transform:GetRotation() * DEGREES
	local delta = PI2 / count

	for i = 1, count do
		local x1 = x + radius * math.cos(theta)
		local z1 = z - radius * math.sin(theta)
		inst:DoTaskInTime(math.random() * 0.2, DoShadowFire, x1, z1, theta * RADIANS)
		theta = theta + delta
	end
end

local function TryShadowFire(inst)
	local item = inst.components.inventory.equipslots[EQUIPSLOTS.HEAD]
	-- if item and item.prefab == "m_bonehat" and inst.components.inventory:EquipHasTag("m_soulstaff") then
	if item and item.prefab == "m_bonehat" then
		-- 检查san值，不够就直接返回
		local CurrentSan = inst.components.sanity.current or 0
		if CurrentSan < 150 then
			inst.components.talker:Say("喵累了，休息一下！")
			return
		end

		inst.components.sanity:DoDelta(-150)

		inst.components.talker:Say("影之怒火！")

		-- 第一阶段：3个火球（立即发射）
		FireBurst(inst, 3)

		-- 第二阶段：5个火球（3秒后）
		inst:DoTaskInTime(3, function()
			FireBurst(inst, 5)
		end)

		-- 第三阶段：7个火球（6秒后）
		inst:DoTaskInTime(6, function()
			FireBurst(inst, 7)
		end)
	end
end

function PrintTable(tbl, indent)
	indent = indent or 0
	for k, v in pairs(tbl) do
		local formatting = string.rep("  ", indent) .. tostring(k) .. ": "
		if type(v) == "table" then
			-- print(formatting)
			PrintTable(v, indent + 1)
		else
			-- print(formatting .. tostring(v))
		end
	end
end
function Madeleinetraits:EmoteMagicSkill(inst, data)
	if not (inst and data) then
		return
	end
	-- 打印整个 data 表的内容
	-- if data then
	-- 	print("===== Full data content =====")
	-- 	PrintTable(data) -- 使用 PrintTable 递归打印整个 data 表
	-- 	print("=============================")
	-- else
	-- 	print("data is nil or invalid")
	-- end

	-- 获取 anim 的内容（兼容表和字符串）
	local anim = type(data.anim) == "table" and data.anim[1] or data.anim

	-- 判断逻辑
	if type(anim) == "string" then
		if anim:find("carol") then
			-- 对话植物
			TriggerFertilize(inst)
		elseif anim:find("sad") then
			-- 下雨
			Forceprecipitation(inst)
		elseif anim:find("sleepy") then
			-- 免疫瞌睡
			Sleepimmunity(inst)
		elseif anim:find("bonesaw") then
			-- 干燥
			Moistureimmunity(inst)
		elseif anim:find("flex") then
			-- 准备工作
			ReadyWork(inst)
		elseif anim:find("angry") then
			-- 影火攻击
			TryShadowFire(inst)
		elseif anim:find("kiss") then
			-- 准备打架
			ReadyFight(inst)
		elseif anim:find("jumpcheer") then
			-- 加速
			ReadySpeed(inst)
		end
	end
end
----------------------- 表情施法 ---------------------------------------

return Madeleinetraits
