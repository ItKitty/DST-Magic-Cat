local ThePlayer = GLOBAL.ThePlayer
local TheInput = GLOBAL.TheInput

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

local madeleine_handlers = {}
AddPlayerPostInit(function(inst)
	inst:DoTaskInTime(0, function()
		if inst == GLOBAL.ThePlayer then
			if inst.prefab == "madeleine" then
				madeleine_handlers[0] = TheInput:AddKeyDownHandler(TUNING.ChargeFireKey, function()
					local screen = GLOBAL.TheFrontEnd:GetActiveScreen()
					local IsHUDActive = screen and screen.name == "HUD"
					if inst:IsValid() and IsHUDActive then
						SendModRPCToServer(MOD_RPC[modname]["ChargeFireKey"])
					end
				end)
				madeleine_handlers[1] = TheInput:AddKeyDownHandler(TUNING.ChargeIceKey, function()
					local screen = GLOBAL.TheFrontEnd:GetActiveScreen()
					local IsHUDActive = screen and screen.name == "HUD"
					if inst:IsValid() and IsHUDActive then
						SendModRPCToServer(MOD_RPC[modname]["ChargeIceKey"])
					end
				end)
				madeleine_handlers[2] = TheInput:AddKeyDownHandler(TUNING.ToggleSantiy, function()
					local screen = GLOBAL.TheFrontEnd:GetActiveScreen()
					local IsHUDActive = screen and screen.name == "HUD"
					if inst:IsValid() and IsHUDActive then
						SendModRPCToServer(MOD_RPC[modname]["ToggleSantiy"])
					end
				end)
				madeleine_handlers[3] = TheInput:AddKeyDownHandler(TUNING.ToggleLight, function()
					local screen = GLOBAL.TheFrontEnd:GetActiveScreen()
					local IsHUDActive = screen and screen.name == "HUD"
					if inst:IsValid() and IsHUDActive then
						SendModRPCToServer(MOD_RPC[modname]["ToggleLight"])
					end
				end)
			else
				madeleine_handlers[0] = nil
				madeleine_handlers[1] = nil
				madeleine_handlers[2] = nil
				madeleine_handlers[3] = nil
			end
		end
	end)
end)
