-- m_kitcoon 的储物格配置 + 改名/换皮命令
-- 格子布局跟龙鳞箱（dragonflychest）一致：3 列 x 4 行 = 12 格，
-- 任何物品都能放（不可替换的除外），配合 container:EnableInfiniteStackSize 实现无限堆叠。

local containers = require("containers")
local params = containers.params

params.m_kitcoon = deepcopy(params.dragonflychest)

function params.m_kitcoon.itemtestfn(container, item, slot)
	return not item:HasTag("irreplaceable")
end

for _, v in pairs(params) do
	containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end

--------------------------------------------------------------------------
-- 换皮表：短名 -> 原版 kitcoon 的 build
--------------------------------------------------------------------------
local SKINS = {
	base = nil,
	forest = "kitcoon_forest",
	savanna = "kitcoon_savanna",
	deciduous = "kitcoon_deciduous",
	marsh = "kitcoon_marsh",
	grass = "kitcoon_grass",
	rocky = "kitcoon_rocky",
	desert = "kitcoon_desert",
	moon = "kitcoon_moon",
	yot = "kitcoon_yot",
}

local function GetPet(player)
	if player == nil or player.components.m_petleash == nil then
		return nil
	end
	return player.components.m_petleash:GetFirstPet()
end

--------------------------------------------------------------------------
-- /petname <名字>：给宠物改名
--------------------------------------------------------------------------
AddModUserCommand("petname", "petname", {
	prettyname = function()
		return "改名"
	end,
	desc = function()
		return "给玛德琳的浣猫崽改名字，例：/petname 团子"
	end,
	permission = "USER",
	params = { "name" },
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,

	serverfn = function(params_, caller)
		local player = UserToPlayer(caller.userid)
		local pet = GetPet(player)
		if pet == nil then
			if player ~= nil and player.components.talker ~= nil then
				player.components.talker:Say("我的小猫不在身边。")
			end
			return
		end

		local name = params_ ~= nil and params_[1] or nil
		if name == nil or name == "" then
			return
		end

		if pet.components.named ~= nil then
			pet.components.named:SetName(name, player)
		end
	end,
})

--------------------------------------------------------------------------
-- /petskin <皮肤>：换皮肤（base / forest / savanna / deciduous / marsh /
--                    grass / rocky / desert / moon / yot）
--------------------------------------------------------------------------
local SKIN_KEYS = {}
for k in pairs(SKINS) do
	table.insert(SKIN_KEYS, k)
end
table.sort(SKIN_KEYS)

AddModUserCommand("petskin", "petskin", {
	prettyname = function()
		return "换皮肤"
	end,
	desc = function()
		return "给浣猫崽换皮肤，可用：" .. table.concat(SKIN_KEYS, " / ")
	end,
	permission = "USER",
	params = { "skin" },
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,

	serverfn = function(params_, caller)
		local player = UserToPlayer(caller.userid)
		local pet = GetPet(player)
		if pet == nil then
			if player ~= nil and player.components.talker ~= nil then
				player.components.talker:Say("我的小猫不在身边。")
			end
			return
		end

		local key = params_ ~= nil and params_[1] or "base"
		key = string.lower(key)
		if not SKINS[key] and key ~= "base" then
			if player ~= nil and player.components.talker ~= nil then
				player.components.talker:Say("没有这种皮肤。")
			end
			return
		end

		if pet.ApplyKitcoonSkin ~= nil then
			pet:ApplyKitcoonSkin(SKINS[key])
		end
	end,
})
