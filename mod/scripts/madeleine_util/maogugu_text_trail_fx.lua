GLOBAL.TUNING.MAOGUGU_TEXT_TRAIL = {
	-- 金色文字拖尾参数，文字和星星分别调整大小。
	lifetime = GetModConfigData("maogugu_trail_lifetime") or 1.35,
	spacing = GetModConfigData("maogugu_trail_spacing") or 0.85,
	size = GetModConfigData("maogugu_trail_size") or 1,
	text_size = GetModConfigData("maogugu_trail_text_size") or 1,
	height = GetModConfigData("maogugu_trail_height") or 1.1,
	glow = GetModConfigData("maogugu_trail_glow") or 0.3,
}

AddPlayerPostInit(function(inst)
	if GLOBAL.TheNet:IsDedicated() then
		return
	end

	-- 每个客户端各自绘制附近玩家的特效，不联网同步每一颗粒子。
	inst:DoTaskInTime(0, function(player)
		if inst == GLOBAL.ThePlayer then
			if inst.prefab == "madeleine" then
				if player:IsValid() and player._maogugu_text_trail_fx == nil then
					local fx = GLOBAL.SpawnPrefab("maogugu_text_trail_fx")
					if fx then
						fx:AttachToPlayer(player)
					end
				end
			end
		end
	end)
end)
