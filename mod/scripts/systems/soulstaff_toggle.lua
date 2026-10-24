-- 灵魂法杖：切换「吸血形态」
-- 客户端点轮盘只发 RPC，真正的状态改动与特效启停都在服务端完成。

AddModRPCHandler(modname, "SoulStaffToggle", function(player, inst, on)
	if player == nil or not player:IsValid() or player:HasTag("playerghost") then
		return
	end

	-- 只认灵魂法杖本身，防止客户端拿别的实体来调
	if inst == nil or not inst:IsValid() or inst.prefab ~= "m_soulstaff" then
		return
	end

	-- 必须确实在这个玩家身上（背包或手持都行，装备后才会有实际效果）
	local inventoryitem = inst.components.inventoryitem
	if inventoryitem == nil or inventoryitem:GetGrandOwner() ~= player then
		return
	end

	local machine = inst.components.machine
	if machine == nil then
		return
	end

	if on and not machine:IsOn() then
		machine:TurnOn()
	elseif not on and machine:IsOn() then
		machine:TurnOff()
	else
		return -- 状态没变，不用再喊一句
	end

	-- 放在背包里切换是没有特效的，用一句话给个反馈
	if player.components.talker ~= nil then
		player.components.talker:Say(on and "血的味道，回来了。" or "先收起来。")
	end
end)
