local m_inspirationbadge = require("widgets/m_inspirationbadge")
AddClassPostConstruct("widgets/statusdisplays", function(self)
	if self.owner and self.owner.prefab == "madeleine" then
		local function reCheckPercent()
			if ThePlayer then
				if ThePlayer.rechecktask then
					ThePlayer.rechecktask:Cancel()
					ThePlayer.rechecktask = nil
				end
				ThePlayer.rechecktask = ThePlayer:DoTaskInTime(0.2, function()
					if ThePlayer and ThePlayer:HasTag("music_buff") then
						self.m_inspirationbadge:SetPercent(1)
					else
						self.m_inspirationbadge:SetPercent(0)
					end
				end)
			end
		end
		self.m_inspirationbadge = self:AddChild(m_inspirationbadge(self.owner, { 151 / 255, 30 / 255, 180 / 255, 1 }))
		self.m_inspirationbadge:SetPosition(self.column5, 20, 0)
		self.m_inspirationbadge:SetPercent(0)

		self.owner:DoTaskInTime(0, function()
			self.m_inspirationbadge:SetPosition(self.stomach:GetPosition() + Vector3(-90, 0, 0))
		end)
		self.m_inspirationbadge.onclick = function()
			if ThePlayer and ThePlayer:HasTag("music_buff") then
				TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
				SendModRPCToServer(MOD_RPC["musicmod"]["playsound"])

				self.m_inspirationbadge:SetPercent(0)
			else
				TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
				SendModRPCToServer(MOD_RPC["musicmod"]["playsound"])

				self.m_inspirationbadge:SetPercent(1)
			end
			reCheckPercent()
		end
	end
end)

local function CreateGroundGlow(player, rotrate)
	local groundglow = SpawnPrefab("hutch_music_light_fx")
	local scale = (math.random() * 0.2 + 1.2) * (math.random() < 0.5 and 1 or -1)
	groundglow.Transform:SetScale(scale, scale, scale)
	groundglow.Follower:FollowSymbol(player.GUID, player.components.combat.hiteffectsymbol, 0, 0, 0)
	groundglow:InitFX(player, {
		rot = math.random(0, 359),
		rotrate = rotrate,
		alpha = math.random(),
		alphadir = math.random() < 0.5,
		alpharate = math.random() * 0.02 + 0.005,
	})
	return groundglow
end

local buff_list = {
	"m_focus_nourish",
	"m_lightfoot_stride",
	"m_iron_will",
}

local function OnTick(player)
	if
		player.components.health ~= nil
		and not player.components.health:IsDead()
		and not player:HasTag("playerghost")
	then
		-- player.components.hunger:DoDelta(-0.25, nil, "musicbuff_task")

		local x, y, z = player.Transform:GetWorldPosition()
		local players = FindPlayersInRange(x, y, z, TUNING.BOOK_TEMPERATURE_RADIUS, true)
		for _, k in ipairs(players) do
			for _, v in ipairs(buff_list) do
				k:AddDebuff("buff_" .. v, "buff_" .. v)
			end
		end

		SpawnPrefab("wx78_musicbox_fx").Transform:SetPosition(x, y, z)
	end
end

local function buff_dirty(player, get)
	if player.musicbuff_task then
		player.musicbuff_task:Cancel()
		player.musicbuff_task = nil
	end
	-- 锁血
	-- local h = player.components.health
	-- if not h then
	-- 	return
	-- end

	if get then
		player:AddTag("music_buff")
		-- 生成音符buff
		player.musicbuff_task = player:DoPeriodicTask(TUNING.JELLYBEAN_TICK_RATE, OnTick)
		-- 生成地面光
		player._groundglows = {
			CreateGroundGlow(player, 0.5),
			CreateGroundGlow(player, -0.5),
			CreateGroundGlow(player, 1),
		}
		-- 生成音乐灯
		for i = 1, 6 do
			local m_musiclight = SpawnPrefab("fx_musiclight")
			m_musiclight.Transform:SetPosition(player.Transform:GetWorldPosition())
			m_musiclight.owner = player
			player.components.leader:AddFollower(m_musiclight)

			m_musiclight:PushEventImmediate("spawned")

			m_musiclight.index = i

			m_musiclight:ListenForEvent("music_buff_over", function()
				m_musiclight:Remove()
			end, player)
		end
		-- 人物发光
		if not player._m_light then
			if player._m_light ~= nil and player._m_light:IsValid() then
				player._m_light:Remove()
			end
			player._m_light = nil

			player._m_light = player.entity:AddLight()
			player._m_light:SetRadius(4)
			player._m_light:SetIntensity(0.5)
			player._m_light:SetFalloff(0.8)
			player._m_light:SetColour(180 / 255, 195 / 255, 225 / 255)
			player._m_light:Enable(true)
		else
			player._m_light:Enable(true)
		end

		-- h:SetMinHealth(1)
	else
		player:RemoveTag("music_buff")
		-- 移除音符buff
		local x, y, z = player.Transform:GetWorldPosition()
		local players = FindPlayersInRange(x, y, z, TUNING.BOOK_TEMPERATURE_RADIUS, true)
		for _, k in ipairs(players) do
			for _, v in ipairs(buff_list) do
				if player:HasDebuff("buff_" .. v) then
					player:RemoveDebuff("buff_" .. v)
				end
			end
		end
		-- 移除地面光
		for i, v in ipairs(player._groundglows) do
			v:Remove()
		end
		player._groundglows = nil
		-- 移除音乐灯
		player:PushEvent("music_buff_over")
		-- 移除人物发光
		if player._m_light then
			player._m_light:Enable(false)
		end
		-- h:SetMinHealth(0)
	end
end
local function OnMakePlayerGhost(player)
	buff_dirty(player, false)
	player:RemoveEventCallback("makeplayerghost", OnMakePlayerGhost)
end
AddModRPCHandler("musicmod", "playsound", function(player)
	if player and player:IsValid() and not player:HasTag("playerghost") then
		player:RemoveEventCallback("makeplayerghost", OnMakePlayerGhost)
		if not player.playingsound_music then
			-- 附近有boss才能播放音乐
			local pos = Vector3(player.Transform:GetWorldPosition())
			local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 30, { "epic" }, { "smallepic" })

			if #ents == 0 then
				local quotes = {
					"我的旋律，只为真正的战士奏响！",
					"待我高歌之时，便是强者殒命之日。可惜，今天没有观众。",
					"想听我唱歌？先拿出值得我开口的实力来!",
				}
				player.components.talker:Say(quotes[math.random(#quotes)])
				return
			end

			local random = math.random(1, 2)
			player.playingsound_music = true
			player.SoundEmitter:PlaySound("m_sound/m_sound/m_music" .. random, "musicmod")
			buff_dirty(player, true)
			player:ListenForEvent("makeplayerghost", OnMakePlayerGhost)
		else
			buff_dirty(player, false)
			player.playingsound_music = false
			player.SoundEmitter:KillSound("musicmod")
		end
	end
end)
