-- 技能快捷键：把按键和 RPC 分开
-- 注意：按键 handler 只能注册一次。以前是在每个玩家实体上注册，非玛德琳时把句柄置 nil，
-- 既没移除也没法再取回，换一次角色就会多堆一组 handler，按一下键发好几次 RPC。

local keys_registered = false

local function SendKey(rpc_name)
	local player = ThePlayer
	if player == nil or not player:IsValid() then
		return
	end
	if player.prefab ~= "madeleine" or player:HasTag("playerghost") then
		return
	end
	local screen = TheFrontEnd:GetActiveScreen()
	if screen == nil or screen.name ~= "HUD" then
		return
	end
	SendModRPCToServer(MOD_RPC[modname][rpc_name])
end

local function RegisterKeys()
	if keys_registered or TheInput == nil then
		return
	end
	keys_registered = true

	TheInput:AddKeyDownHandler(TUNING.ChargeFireKey, function()
		SendKey("ChargeFireKey")
	end)
	TheInput:AddKeyDownHandler(TUNING.ChargeIceKey, function()
		SendKey("ChargeIceKey")
	end)
	TheInput:AddKeyDownHandler(TUNING.ToggleSantiy, function()
		SendKey("ToggleSantiy")
	end)
	TheInput:AddKeyDownHandler(TUNING.ToggleLight, function()
		SendKey("ToggleLight")
	end)
end

AddModRPCHandler(modname, "ChargeFireKey", function(player)
	if not player:HasTag("playerghost") and player.components.madeleinetraits then
		local spawncharge = player.components.madeleinetraits.spawncharge
		if spawncharge ~= nil then
			spawncharge:Remove()
			spawncharge = nil
		end
		player.components.madeleinetraits:powerready_fire()
	end
end)

AddModRPCHandler(modname, "ChargeIceKey", function(player)
	if not player:HasTag("playerghost") and player.components.madeleinetraits then
		local spawncharge = player.components.madeleinetraits.spawncharge
		if spawncharge ~= nil then
			spawncharge:Remove()
			spawncharge = nil
		end
		player.components.madeleinetraits:powerready_ice()
	end
end)

AddModRPCHandler(modname, "ToggleSantiy", function(player)
	if not player:HasTag("playerghost") and player.components.madeleinetraits then
		player.components.madeleinetraits:togglesanity()
	end
end)

AddModRPCHandler(modname, "ToggleLight", function(player)
	if not player:HasTag("playerghost") and player.components.madeleinetraits then
		player.components.madeleinetraits:togglelight()
	end
end)

-- 客户端加载时先尝试注册一次（TheInput 通常已经就绪）
RegisterKeys()

-- 兼容 TheInput 还没创建的加载顺序：等玩家实体出现后再补一次，registered 标志保证不会重复注册
AddPlayerPostInit(function(inst)
	if inst == ThePlayer then
		inst:DoTaskInTime(0, RegisterKeys)
	end
end)
