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

-- 灵魂法杖腐化光效的实时调参（控制台用，不用退出重进）：
--   M_SOULSTAFF_CORRUPT(缩放, x, y, z)
--   M_SOULSTAFF_CORRUPT(0.5, 0, -20, 0)
-- 偏移单位 1/100 世界单位，y 正数往下、负数往上
-- 注意：不预先建表——只有调用了这个命令才会覆盖 m_soulstaff 里的 CORRUPT_FX_DEFAULT，
-- 这样直接改 prefab 里的默认值是有效的（重启世界后恢复默认）。
GLOBAL.M_SOULSTAFF_CORRUPT = function(scale, x, y, z)
	GLOBAL.M_SOULSTAFF_CORRUPT_TUNING = {
		scale = scale or 0.5,
		x = x or 0,
		y = y or 0,
		z = z or 0,
	}
	local tuning = GLOBAL.M_SOULSTAFF_CORRUPT_TUNING

	local player = GLOBAL.ThePlayer
	local inventory = player ~= nil and player.components.inventory or nil
	local staff = inventory ~= nil and inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HAND) or nil
	if staff ~= nil and staff.RefreshCorruptFX ~= nil then
		staff:RefreshCorruptFX()
	end

	print(string.format("[soulstaff] fx scale=%.2f x=%s y=%s z=%s", tuning.scale, tostring(tuning.x), tostring(tuning.y), tostring(tuning.z)))
end

-- 右键提示文字：原版 USESPELLBOOK 显示的是「阅读」，这里只把灵魂法杖改成「切换形态」
local old_stroverridefn = ACTIONS.USESPELLBOOK.stroverridefn
ACTIONS.USESPELLBOOK.stroverridefn = function(buffaction)
	local item = buffaction.invobject or buffaction.target
	if item ~= nil and item:HasTag("m_soulstaff") then
		return "切换形态"
	end
	if old_stroverridefn ~= nil then
		return old_stroverridefn(buffaction)
	end
end

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
