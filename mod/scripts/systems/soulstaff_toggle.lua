-- 灵魂法杖：切换「吸血形态」
-- 客户端点轮盘只发 RPC，真正的状态改动与特效启停都在服务端完成（m_soulstaff:SetActive）。

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

	if inst.SetActive == nil then
		return
	end

	-- SetActive 会自己处理「状态没变」的情况
	if not inst.SetActive(inst, on) then
		return
	end

	-- 放在背包里切换是没有特效的，用一句话给个反馈
	if player.components.talker ~= nil then
		player.components.talker:Say(on and "血的味道，回来了。" or "先收起来。")
	end
end)

-- 取 RPC 表必须在 AddModRPCHandler 之后
local TOGGLE_RPC = MOD_RPC[modname]["SoulStaffToggle"]

local ICON_ATLAS = "images/inventoryimages/soulstaff.xml"
local ICON_IMAGE = "soulstaff.tex"
local ICON_SCALE = 0.6
local ICON_RADIUS = 50

local SOULSTAFF_SPELLS = {
	{
		label = "开启吸血形态",
		execute = function(inst)
			SendModRPCToServer(TOGGLE_RPC, inst, true)
		end,
		atlas = ICON_ATLAS,
		normal = ICON_IMAGE,
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},
	{
		label = "关闭吸血形态",
		execute = function(inst)
			SendModRPCToServer(TOGGLE_RPC, inst, false)
		end,
		atlas = ICON_ATLAS,
		normal = ICON_IMAGE,
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},
}

-- 轮盘条目在这里塞进 prefab：prefab 文件跑在全局环境，既没有 modname 也没有 GLOBAL，
-- 直接把发 RPC 的闭包写在 prefab 里会触发 strict.lua 报错。
AddPrefabPostInit("m_soulstaff", function(inst)
	local spellbook = inst.components.spellbook
	if spellbook ~= nil then
		spellbook:SetItems(SOULSTAFF_SPELLS)
	end
end)
