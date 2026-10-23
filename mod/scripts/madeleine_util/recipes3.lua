-- recipes2.lua - 配方系统优化版

local _G = GLOBAL
local TUNING = _G.TUNING
local SpawnPrefab = _G.SpawnPrefab
local TheNet = _G.TheNet
local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()

-- 兼容mod
local moddir = _G.KnownModIndex:GetModsToLoad(true)
local enablemods = {}

for k, dir in pairs(moddir) do
	local info = _G.KnownModIndex:GetModInfo(dir)
	local name = info and info.name or "unknow"
	enablemods[dir] = name
end
-- MOD是否开启
function IsModEnable(name)
	for k, v in pairs(enablemods) do
		if v and (k:match(name) or v:match(name)) then
			return true
		end
	end
	return false
end

AddSimPostInit(function()
	if IsModEnable("能力勋章 Functional Medal") or IsModEnable("workshop%-1909182187") then
		-- 制图桌科技 CARTOGRAPHY_TWO

		-- 空白勋章
		AddRecipe2(
			"blank_certificate",
			{
				Ingredient("goldnugget", 100),
			},
			TECH.CARTOGRAPHY_TWO,
			{ atlas = resolvefilepath_soft("images/blank_certificate.xml"), builder_tag = "madeleine" },
			{ "MADELEINETAB" }
		)
		-- 弯曲的叉子
		AddRecipe2("trinket_17", { Ingredient("goldnugget", 10) }, TECH.CARTOGRAPHY_TWO, {
			builder_tag = "madeleine",
			nounlock = true,
		}, { "MADELEINETAB" })
		-- 格罗姆精华
		AddRecipe2(
			"medal_glommer_essence",
			{ Ingredient("mandrakeberry", 1, resolvefilepath_soft("images/mandrakeberry.xml")) },
			TECH.CARTOGRAPHY_TWO,
			{
				atlas = resolvefilepath_soft("images/medal_glommer_essence.xml"),
				builder_tag = "madeleine",
				nounlock = true,
				numtogive = 3,
			},
			{ "MADELEINETAB" }
		)
		-- 包裹种子
		AddRecipe2("medal_gift_fruit_seed", { Ingredient("medal_gift_fruit", 1) }, TECH.CARTOGRAPHY_TWO, {
			atlas = resolvefilepath_soft("images/medal_gift_fruit_seed.xml"),
			builder_tag = "madeleine",
			nounlock = true,
			numtogive = 3,
		}, { "MADELEINETAB" })
		-- 不朽种子
		AddRecipe2("immortal_fruit_seed", { Ingredient("immortal_fruit", 1) }, TECH.CARTOGRAPHY_TWO, {
			atlas = resolvefilepath_soft("images/immortal_fruit_seed.xml"),
			builder_tag = "madeleine",
			nounlock = true,
			numtogive = 3,
		}, { "MADELEINETAB" })
		-- 杂草种子
		AddRecipe2("medal_weed_seeds", { Ingredient("seeds", 1) }, TECH.CARTOGRAPHY_TWO, {
			atlas = resolvefilepath_soft("images/medal_weed_seeds.xml"),
			builder_tag = "madeleine",
			nounlock = true,
			numtogive = 3,
		}, { "MADELEINETAB" })
		-- 时空灵石
		AddRecipe2("medal_spacetime_lingshi", { Ingredient("townportaltalisman", 1) }, TECH.CARTOGRAPHY_TWO, {
			atlas = resolvefilepath_soft("images/medal_spacetime_lingshi.xml"),
			builder_tag = "madeleine",
			nounlock = true,
		}, { "MADELEINETAB" })
		-- 时空碎片
		AddRecipe2(
			"medal_time_slider",
			{
				Ingredient("thulecite_pieces", 2),
				Ingredient("medal_spacetime_lingshi", 1, resolvefilepath_soft("images/medal_spacetime_lingshi.xml")),
			},
			TECH.CARTOGRAPHY_TWO,
			{
				atlas = resolvefilepath_soft("images/medal_time_slider.xml"),
				builder_tag = "madeleine",
				nounlock = true,
			},
			{ "MADELEINETAB" }
		)
		-- 暗影挑战符
		AddRecipe2(
			"medal_monster_symbol",
			{ Ingredient("nightmarefuel", 3), Ingredient("papyrus", 1) },
			TECH.CARTOGRAPHY_TWO,
			{
				atlas = resolvefilepath_soft("images/medal_monster_symbol.xml"),
				builder_tag = "madeleine",
				nounlock = true,
			},
			{ "MADELEINETAB" }
		)
		-- 零食包装袋
		AddRecipe2("medal_spacetime_snacks_packet", { Ingredient("waxpaper", 1) }, TECH.CARTOGRAPHY_TWO, {
			atlas = resolvefilepath_soft("images/medal_spacetime_snacks_packet.xml"),
			builder_tag = "madeleine",
			nounlock = true,
		}, { "MADELEINETAB" })
		-- 传承书页
		AddRecipe2(
			"medal_inherit_page",
			{
				Ingredient("bottled_moonlight", 1, resolvefilepath_soft("images/bottled_moonlight.xml")),
				Ingredient("papyrus", 1),
			},
			TECH.CARTOGRAPHY_TWO,
			{
				atlas = resolvefilepath_soft("images/medal_inherit_page.xml"),
				builder_tag = "madeleine",
				nounlock = true,
			},
			{ "MADELEINETAB" }
		)
	end
	if IsModEnable("[DST] Legion-棱镜") or IsModEnable("workshop%-1392778117") then
		-- 神木科技 SIVING_ONE
		-- 子圭奇型岩
		AddRecipe2(
			"siving_derivant_item",
			{
				Ingredient("goldnugget", 100),
			},
			TECH.SIVING_ONE,
			{
				atlas = resolvefilepath_soft("images/siving_derivant_item.xml"),
				builder_tag = "madeleine",
				nounlock = true,
			},
			{ "MADELEINETAB" }
		)
	end
end)
