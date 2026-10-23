-- recipes2.lua - 配方系统优化版

local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS

-- 添加制作栏
AddRecipeFilter({
	name = "MADELEINETAB2",
	atlas = "images/hud/Miracle.xml",
	image = "Miracle.tex",
	builder_tag = "madeleine",
})
STRINGS.UI.CRAFTING_FILTERS.MADELEINETAB2 = "猫の幻想"
STRINGS.UI.CRAFTING.RECIPEACTION.M_SPELL = "施法"

-- 添加配方函数
local function AddMiracleRecipe(name, book, display_name, description)
	local recipe_data = {
		atlas = "images/inventoryimages/" .. name .. ".xml",
		image = name .. ".tex",
		sg_state = "book", --读书
		-- sg_state = "castspell", --魔杖
		-- sg_state = "spawn_mutated_creature", --变异
		-- sg_state = "cointosscastspell", --猪鼻
		-- sg_state = "mermbuffcast", --鱼人
		builder_tag = "madeleine",
		-- fxover = {
		-- 	bank = "inventory_fx_shadow",
		-- 	build = "inventory_fx_shadow",
		-- 	anim = "idle",
		-- },
		actionstr = "M_SPELL",
	}

	AddRecipe2(
		name,
		-- { Ingredient(book, 0), Ingredient(CHARACTER_INGREDIENT.SANITY, 10) },
		{
			Ingredient("m_book", 0, resolvefilepath_soft("images/inventoryimages/m_book.xml")),
			Ingredient(CHARACTER_INGREDIENT.SANITY, 10),
		},
		TECH.NONE,
		recipe_data,
		{ "MADELEINETAB2" }
	)

	STRINGS.NAMES[name:upper()] = display_name
	STRINGS.RECIPE_DESC[name:upper()] = description
end

-- 添加配方
AddMiracleRecipe("m_setmoonphase", "m_book", "月相", "切换月相。")
AddMiracleRecipe("m_catchfish", "m_book", "捕捞", "不用再钓鱼了。")
AddMiracleRecipe("m_garden", "m_book", "复苏", "万物复苏。")
-- AddMiracleRecipe("m_removecurse", "解咒", "不怕猴子诅咒了。")
AddMiracleRecipe("m_mutation", "m_book", "变异", "月亮改变了一切。")
AddMiracleRecipe("m_summonfishes", "m_book", "唤鱼", "来吧我的鱼儿们。")
