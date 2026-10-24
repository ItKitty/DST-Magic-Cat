-- vanilla_hooks.lua - 所有对原版代码的挂接修改都放这里
-- （AddPrefabPostInit / AddComponentPostInit / AddClassPostConstruct 等）

---stafflight
AddPrefabPostInit("stafflight", function(inst)
	if not TheWorld.ismastersim then
		return
	end
	inst:AddTag("fire")
end)
---staffcoldlight
AddPrefabPostInit("staffcoldlight", function(inst)
	if not TheWorld.ismastersim then
		return
	end
	inst:AddTag("fire")
end)
---deer_ice_charge
AddPrefabPostInit("deer_ice_charge", function(inst)
	if not TheWorld.ismastersim then
		return
	end
	inst:AddComponent("heater")
	inst.components.heater.heat = -100
	inst.components.heater:SetThermics(false, true)
	inst:AddTag("fire")
end)

---deer_fire_charge
AddPrefabPostInit("deer_fire_charge", function(inst)
	if not TheWorld.ismastersim then
		return
	end
	inst:AddComponent("heater")
	inst.components.heater.heat = 100
	inst:AddTag("fire")
end)

-------------- 可恶的科雷把龙蝇皮改成不能交易了-----------------------
local AddTradadle = {
	"dragon_scales", -- 龙蝇皮
	"nightmarefuel", -- 噩梦燃料
	"pocketwatch_parts", -- 时间碎片
}
for _, v in ipairs(AddTradadle) do
	AddPrefabPostInit(v, function(inst)
		if not TheWorld.ismastersim then
			return
		end
		-- 确保有tradable组件
		if not inst.components.tradable then
			inst:AddComponent("tradable")
		end
	end)
end
-------------- 可恶的科雷把龙蝇皮改成不能交易了-----------------------
------------------修改玩家体温调整函数---------------------------------
AddComponentPostInit("temperature", function(self)
	local oldSetTemperature = self.SetTemperature

	self.SetTemperature = function(self, value, ...)
		local inventory = self.inst.components.inventory

		-- 装备防过热物品 眼球
		if inventory and inventory:EquipHasTag("m_nooverheat") then
			value = math.min(value, 64)
		end

		-- 装备防冻物品 龙鳞
		if inventory and inventory:EquipHasTag("m_nofreezing") then
			value = math.max(value, 6)
		end

		oldSetTemperature(self, value, ...)
	end
end)
------------------修改玩家体温调整函数---------------------------------

-------------------------采集系统修改------------------------------
AddComponentPostInit("pickable", function(self)
	local oldPick = self.Pick
	local oldFertilize = self.Fertilize

	-- 重写采集方法
	function self:Pick(picker)
		if picker and picker:HasTag("m_greenfinger") then
			local originalNum = self.numtoharvest or 1
			self.numtoharvest = originalNum * 5
			-- 用 pcall 保护：原版 Pick 一旦抛错，不恢复的话这份作物的产量会永久停在 5 倍
			local ok, success, loot = pcall(oldPick, self, picker)
			self.numtoharvest = originalNum
			if not ok then
				error(success)
			end

			-- 只有绿手指采集时才设置巨大作物重量
			if success and loot then
				self.inst:DoTaskInTime(0.05, function()
					local loots = EntityScript.is_instance(loot) and { loot } or loot
					for _, item in ipairs(loots) do
						if item ~= nil and item:IsValid() and item:HasTag("oversized_veggie") then
							item.components.weighable:SetWeight(999.99)
						end
					end
				end)
			end

			return success, loot
		else
			return oldPick(self, picker)
		end
	end

	-- 重写施肥方法
	function self:Fertilize(fertilizer, doer)
		local success = oldFertilize(self, fertilizer, doer)

		if success and doer and doer:HasTag("m_greenfinger") then
			self.transplanted = false
		end

		return success
	end
end)
-------------------------采集系统修改------------------------------

---------------------- 去除防尘黑框 ----------------------------
AddClassPostConstruct("widgets/gogglesover", function(self)
	local old_ToggleGoggles = self.ToggleGoggles
	function self:ToggleGoggles(show, ...)
		if self.owner and self.owner.replica.inventory then
			show = false
		end
		return old_ToggleGoggles(self, show, ...)
	end
end)
---------------------- 去除防尘黑框 ----------------------------

---------------------------- 修改暮光之噬攻击动作 ----------------------------
AddComponentPostInit("combat", function(self, inst)
	---must be a non-nil entity!!!
	function self:P_AOECheck(target)
		if not (target.entity:IsValid() and target.entity:IsVisible()) then
			return false
		end

		if
			target.replica.combat == nil
			or IsEntityDead(target, true)
			or target:HasTag("noplayertarget")
			or self:IsAlly(target)
		then
			return false
		end

		--TODO  PVP???
		local sanity = self.inst.replica.sanity

		if sanity ~= nil and sanity:IsCrazy() or self.inst:HasTag("crazy") then
			--Insane attacker can pretty much attack anything
			return true
		end

		if target:HasAnyTag("shadowcreature", "nightmarecreature") and target:HasTag("locomotor") then
			local victim = target.replica.combat:GetTarget()

			if
				victim == nil
				or (
					victim ~= self.inst
					and target.HostileToPlayerTest ~= nil
					and not target:HostileToPlayerTest(victim)
				)
			then
				return false
			end
		end

		return true
	end
end)

---------------------------- 修改攻击动作 ----------------------------

--hook移速组件,山力叶酱搬重物不掉速
AddComponentPostInit("locomotor", function(self)
	local oldGetSpeedMultiplier = self.GetSpeedMultiplier
	if TheWorld.ismastersim then
		self.GetSpeedMultiplier = function(self, ...)
			if
				self.inst:HasTag("m_strong")
				and not (self.inst.components.rider ~= nil and self.inst.components.rider:IsRiding())
			then
				local mult = self:ExternalSpeedMultiplier()
				if self.inst.components.inventory ~= nil then
					for k, v in pairs(self.inst.components.inventory.equipslots) do
						if v.components.equippable ~= nil then
							local item_speed_mult = v.components.equippable:GetWalkSpeedMult()
							mult = mult * math.max(item_speed_mult, 1)
						end
					end
				end
				return mult * (self:TempGroundSpeedMultiplier() or self.groundspeedmultiplier) * self.throttle
			elseif oldGetSpeedMultiplier then
				return oldGetSpeedMultiplier(self, ...)
			end
		end
	else
		self.GetSpeedMultiplier = function(self, ...)
			if
				self.inst:HasTag("m_strong")
				and not (self.inst.replica.rider and self.inst.replica.rider:IsRiding())
			then
				local mult = self:ExternalSpeedMultiplier()
				local inventory = self.inst.replica.inventory
				if inventory ~= nil then
					for k, v in pairs(inventory:GetEquips()) do
						local inventoryitem = v.replica.inventoryitem
						if inventoryitem ~= nil then
							local item_speed_mult = inventoryitem:GetWalkSpeedMult()
							mult = mult * math.max(item_speed_mult, 1)
						end
					end
				end
				return mult * (self:TempGroundSpeedMultiplier() or self.groundspeedmultiplier) * self.throttle
			elseif oldGetSpeedMultiplier then
				return oldGetSpeedMultiplier(self, ...)
			end
		end
	end
end)

-----------------------------  修改护符hover名字   ----------------------------------------

local materials = {
	-- 宝石类
	redgem = "回血功能",
	bluegem = "水上行走",
	purplegem = "理智光环",
	orangegem = "辅助功能",
	yellowgem = "光照能力",
	greengem = "建筑减耗",
	opalpreciousgem = "位面机制",

	-- 特殊材料
	dragon_scales = "不会过冷",
	deerclops_eyeball = "不会过热",
	alterguardianhatshard = "空间穿梭",

	-- 可以继续添加更多材料
	-- thulecite = "铥矿",
	-- nightmarefuel = "梦魇燃料",
}

for k, v in pairs(materials) do
	AddPrefabPostInit(k, function(inst)
		inst:AddTag("m_amulet_upgradable")

		if not TheWorld.ismastersim then
			return inst
		end
	end)
end

AddClassPostConstruct("widgets/hoverer", function(self)
	-- 保存原始的 SetString 方法
	local old_SetString = self.text.SetString

	self.text.SetString = function(text, str)
		local target = TheInput:GetHUDEntityUnderMouse()
		target = (target and target.widget and target.widget.parent ~= nil and target.widget.parent.item)
			or TheInput:GetWorldEntityUnderMouse()
			or nil
		-- 检查目标是否是 m_amulet
		if target and target.entity ~= nil then
			if target.prefab ~= nil then
				if target.prefab == "m_amulet" and target.replica.amulettraits then
					-- 获取 amulettraits 组件
					local amulettraits = target.replica.amulettraits
					if amulettraits then
						-- 从 amulettraits 获取技能数据
						local skills = amulettraits:GetData() or {}

						-- 遍历所有可能的技能
						-- for gem, name in pairs(materials) do
						-- 	if skills[gem] then
						-- 		str = str .. string.format("\n%s：已解锁", name)
						-- 	else
						-- 		str = str .. string.format("\n%s：未解锁", name)
						-- 	end
						-- end

						-- 收集未解锁技能
						local locked_skills = {}
						for gem, name in pairs(materials) do
							if not skills[gem] then
								table.insert(locked_skills, name)
							end
						end

						-- 每4个换行显示
						if #locked_skills > 0 then
							str = str .. "\n未解锁："
							for i, skill_name in ipairs(locked_skills) do
								if i > 1 then
									if (i - 1) % 4 == 0 then -- 每4个换行
										str = str .. "\n        " -- 对齐
									else
										str = str .. "、"
									end
								end
								str = str .. skill_name
							end
						else
							str = str .. "\n十全十美！"
						end
					end
				end
			end
		end

		return old_SetString(text, str)
	end
end)

-----------------------------  修改护符hover名字   ----------------------------------------

------------------------- 启迪之冠的 gestalt 击杀归属 -----------------------------
-- 投射物攻击时 attacker 是它自己，所以 "killed" 事件推在 gestalt 上，玩家收不到。
-- 这里转发一份给主人，让玩家身上的击杀监听（贪婪掉落等）也能触发。
AddPrefabPostInit("alterguardianhat_projectile", function(inst)
	if not TheWorld.ismastersim then
		return
	end

	inst:ListenForEvent("killed", function(proxy, data)
		local follower = proxy.components.follower
		local leader = follower ~= nil and follower:GetLeader() or nil
		if leader ~= nil and leader:HasTag("player") then
			leader:PushEvent("killed", data)
		end
	end)
end)

------------------------- 灵魂法杖轮盘图标边框 -----------------------------
-- 轮盘是 widgets/wheel.lua 用 ImageButton 画的，每个图标只有一张图，没有边框层。
-- 工坊 m_shadow_tool 的「黑框」其实是画在 medal_shadow_tool_icons 贴图里的，
-- 不能直接套到别的图标上，所以这里在控件层自己加一层。
--
-- 两种模式，改 MODE 就行：
--   "circle"  圆底：用 vanilla 的 button_icons/circle.tex 垫一个灰圆
--   "outline" 描边：把图标自己复制一圈、涂黑淡化，形成贴合武器形状的边
-- 追求「边缘绝对均匀」用 outline；想要圆形底座用 circle。
local SOULSTAFF_ICON_FRAME_MODE = "circle"

-- circle 模式参数
local SOULSTAFF_ICON_BG_SCALE = 2 -- 圆框相对图标最长边的倍数
local SOULSTAFF_ICON_BG_COLOUR = { 0.78, 0.78, 0.78, 0.7 } -- 浅灰
local SOULSTAFF_ICON_BG_OFFSET = { 0, -12 } -- 圆框微调偏移（贴图里的圆心不一定是正中）

-- outline 模式参数
local SOULSTAFF_ICON_OUTLINE_ALPHA = 0.5 -- 描边深浅（黑色渐变到灰）
local SOULSTAFF_ICON_OUTLINE_RATIO = 0.06 -- 描边外扩比例（相对图标最长边）
local SOULSTAFF_ICON_OUTLINE_DIRS = 12 -- 采样方向数，越多越圆滑

local function AddCircleFrame(v, icon)
	local bg = GLOBAL.Image("images/button_icons.xml", "circle.tex")
	bg:SetTint(
		SOULSTAFF_ICON_BG_COLOUR[1],
		SOULSTAFF_ICON_BG_COLOUR[2],
		SOULSTAFF_ICON_BG_COLOUR[3],
		SOULSTAFF_ICON_BG_COLOUR[4]
	)
	v.widget:AddChild(bg)

	-- 用最长边做直径，保证竖长的武器图也能被整个圆框盖住
	local w, h = icon:GetSize()
	local diameter = math.max(w, h) * SOULSTAFF_ICON_BG_SCALE
	bg:ScaleToSize(diameter, diameter)
	bg:SetPosition(SOULSTAFF_ICON_BG_OFFSET[1], SOULSTAFF_ICON_BG_OFFSET[2])
	bg:MoveToBack()
end

local function AddOutlineFrame(v, icon)
	local w, h = icon:GetSize()
	local radius = math.max(w, h) * SOULSTAFF_ICON_OUTLINE_RATIO

	for i = 1, SOULSTAFF_ICON_OUTLINE_DIRS do
		local angle = (i - 1) / SOULSTAFF_ICON_OUTLINE_DIRS * 2 * math.pi
		local ghost = GLOBAL.Image(v.atlas, v.normal)
		-- 乘黑：不管武器原色是什么，边缘都是黑；alpha 直接用 tint 的第四位，
		-- Image 没有 SetAlpha 方法（会报 attempt to call method 'SetAlpha'）
		ghost:SetTint(0, 0, 0, SOULSTAFF_ICON_OUTLINE_ALPHA)
		v.widget:AddChild(ghost)
		ghost:ScaleToSize(w, h)
		ghost:SetPosition(math.cos(angle) * radius, math.sin(angle) * radius)
		ghost:MoveToBack()
	end
end

AddClassPostConstruct("screens/playerhud", function(self)
	local old_OpenSpellWheel = self.OpenSpellWheel
	self.OpenSpellWheel = function(this, invobject, items, radius, focus_radius, bgdata)
		local ret = old_OpenSpellWheel(this, invobject, items, radius, focus_radius, bgdata)

		if invobject ~= nil and invobject.prefab == "m_soulstaff" then
			local wheel = this.controls ~= nil and this.controls.spellwheel or nil
			local dataset = wheel ~= nil and wheel.items ~= nil and wheel.items.root or nil

			for _, v in ipairs(dataset or {}) do
				local icon = v.widget ~= nil and v.widget.image or nil
				if icon ~= nil and v.atlas ~= nil and v.normal ~= nil then
					if SOULSTAFF_ICON_FRAME_MODE == "outline" then
						AddOutlineFrame(v, icon)
					else
						AddCircleFrame(v, icon)
					end
				end
			end
		end

		return ret
	end
end)