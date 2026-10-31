--[[
{
	name,--配方名，一般情况下和需要合成的道具同名
	ingredients,--配方，这边为了区分不同难度的配方，做了嵌套{{正常难度},{简易难度}}，只填一个视为不做难度区分
	tab,--合成栏(已废弃)
	level,--解锁科技
	--placer,--建筑类科技放置时显示的贴图、占位等/也可以配List用于添加更多额外参数，比如不可分解{no_deconstruction = true}
	min_spacing,--最小间距，不填默认为3.2
	nounlock,--不解锁配方，只能在满足科技条件的情况下制作(分类默认都算专属科技站,不需要额外添加了)
	numtogive,--一次性制作的数量，不填默认为1
	builder_tag,--制作者需要拥有的标签
	atlas,--需要用到的图集文件(.xml)，不填默认用images/name.xml
	image,--物品贴图(.tex)，不填默认用name.tex
	testfn,--尝试放下物品时的函数，可用于判断坐标点是否符合预期
	product,--实际合成道具，不填默认取name
	build_mode,--建造模式,水上还是陆地(默认为陆地BUILDMODE.LAND,水上为BUILDMODE.WATER)
	build_distance,--建造距离(玩家距离建造点的距离)
	filters,--制作栏分类列表，格式参考{"SPECIAL_EVENT","CHARACTER"}
	
	--扩展字段
	placer,--建筑类科技放置时显示的贴图、占位等
	filter,--制作栏分类
	description,--覆盖原来的配方描述
	canbuild,--判断制作物品是否满足条件的自定义方法,支持参数(recipe, self.inst, pt, rotation),return 结果,原因
	sg_state,--自定义制作物品的动作(比如吹气球就可以调用吹的动作)
	no_deconstruction,--填true则不可分解(也可以用function)
	require_special_event,--特殊活动(比如冬季盛宴限定之类的)
	dropitem,--制作后直接掉落物品
	actionstr,--把"制作"改成其他的文字
	manufactured,--填true则表示是用制作站制作的，而不是用builder组件来制作(比如万圣节的药水台就是用这个)
	hint_msg,--未解锁时的提示文字索引，例如为xx，调用的字符串即为STRINGS.UI.CRAFTING.XX
	more_data={
		station_tag=xx,
	},--recipe.lua里新增的扩展字段如果modframework的more_data_keys里没有,都可以直接往里面配,省得修改框架了

	--勋章自定义
	needHidden,--简易模式隐藏
	noatlas,--不需要图集文件,用原版物品的时候就不需要自定义贴图了
	noimage,--不需要贴图,用原版物品的时候就不需要自定义贴图了
}
--]]
-----------分类------------
--FAVORITES--收藏
--CRAFTING_STATION--科技站专属
--SPECIAL_EVENT--特殊节日
--MODS--模组物品(所有非科技站解锁的mod物品会自动添加这个标签)

--CHARACTER--人物专属
--TOOLS--工具
--LIGHT--光源
--PROTOTYPERS--科技
--REFINE--精炼
--WEAPONS--武器
--ARMOUR--盔甲
--CLOTHING--服装
--RESTORATION--治疗
--MAGIC--魔法
--DECOR--装饰

--STRUCTURES--建筑
--CONTAINERS--容器
--COOKING--烹饪
--GARDENING--食物、种植
--FISHING--钓鱼
--SEAFARING--航海
--RIDING--骑乘
--WINTER--保暖道具
--SUMMER--避暑道具
--RAIN--雨具
--EVERYTHING--所有

-- recipes.lua - 配方系统

-- local SHIELDRECIPES_NUMBER = GetModConfigData("SHIELDRECIPES_NUMBER")

-- local shieldofterror_recipes = {
--     [0] = {
--         Ingredient("milkywhites", 4),
--         Ingredient("gears", 2),
--         Ingredient("houndstooth", 3),
--     },
--     [1] = {
--         Ingredient("eyemaskhat", 1),
--         Ingredient("milkywhites", 3),
--         Ingredient("gears", 2),
--     },
--     [2] = {
--         Ingredient("eyemaskhat", 1),
--         Ingredient("milkywhites", 5),
--         Ingredient("gears", 2),
--         Ingredient("transistor", 2),
--         Ingredient("trinket_6", 2),
--     },
-- }

-- -- 配方
-- AddRecipe2("shieldofterror",
--     shieldofterror_recipes[SHIELDRECIPES_NUMBER],
--     TECH.LOST,
--     {
--         image = "shieldofterror.tex",--物品贴图(.tex)，不填默认用name.tex
--     },
--     { "WEAPONS", "ARMOUR" }
-- )

local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH

-- 添加制作栏
AddRecipeFilter({
	name = "MADELEINETAB",
	atlas = "images/hud/Amulet.xml",
	image = "Amulet.tex",
	builder_tag = "madeleine",
})

STRINGS.UI.CRAFTING_FILTERS.MADELEINETAB = "猫の装备"

-- 配方模板函数
local function AddMadeleineRecipe(name, ingredients, tech, config, tags)
	return AddRecipe2(name, ingredients, tech, config, tags or { "MADELEINETAB" })
end

-- 护身符配方
AddMadeleineRecipe(
	"m_amulet",
	{
		Ingredient("goldnugget", 3),
		Ingredient("nightmarefuel", 2),
		Ingredient("redgem", 1),
		Ingredient(CHARACTER_INGREDIENT.SANITY, 50),
	},
	TECH.NONE,
	{
		atlas = "images/inventoryimages/ancestorsrelics.xml",
		image = "ancestorsrelics.tex",
		builder_tag = "madeleine",
		description = "m_amulet",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
		-- skinnable = true, --定义为一个有皮肤的配方
	}
)

-- 灵魂法杖配方
AddMadeleineRecipe(
	"m_soulstaff",
	{
		Ingredient("yellowstaff", 1),
		Ingredient("opalstaff", 1),
		Ingredient("staff_lunarplant", 1),
		Ingredient("security_pulse_cage_full", 1),
		Ingredient("shadowheart_infused", 1),
		Ingredient("thurible", 1),
	},
	TECH.SHADOWFORGING_TWO,
	{
		atlas = "images/inventoryimages/soulstaff.xml",
		image = "soulstaff.tex",
		builder_tag = "madeleine",
		description = "m_soulstaff",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	}
)

-- 骨盔
AddMadeleineRecipe(
	"m_bonehat",
	{
		Ingredient("skeletonhat", 1),
		Ingredient("alterguardianhat", 1),
	},
	TECH.LUNARFORGING_TWO,
	{
		image = "skeletonhat.tex",
		builder_tag = "madeleine",
		description = "m_bonehat",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	},
	{ "MADELEINETAB" }
)

-- 镰刀
AddMadeleineRecipe(
	"m_voidcloth_scythe",
	{
		Ingredient("dreadstone", 5),
		Ingredient("voidcloth", 2),
		Ingredient("horrorfuel", 5),
	},
	TECH.SHADOWFORGING_TWO,
	{
		atlas = "images/inventoryimages/m_shadowreaper.xml",
		image = "m_shadowreaper.tex",
		builder_tag = "madeleine",
		description = "m_voidcloth_scythe",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	},
	{ "MADELEINETAB" }
)

-- 猫爪
AddMadeleineRecipe(
	"m_catpaw",
	{
		Ingredient("coontail", 2),
		Ingredient("goldnugget", 3),
		Ingredient("nightmarefuel", 2),
	},
	TECH.NONE,
	{
		atlas = "images/inventoryimages/m_catpaw.xml",
		image = "m_catpaw.tex",
		builder_tag = "madeleine",
		description = "m_catpaw",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	},
	{ "MADELEINETAB" }
)

-- 万用工具
AddMadeleineRecipe(
	"m_shadow_tool",
	{
		Ingredient("nightmarefuel", 6),
		Ingredient("horrorfuel", 3),
		Ingredient("dreadstone", 2),
	},
	TECH.ANCIENT_TWO,
	{
		atlas = "images/inventoryimages/medal_shadow_tool.xml",
		image = "medal_shadow_tool.tex",
		builder_tag = "madeleine", --有标识就没有蓝图
		description = "m_shadow_tool",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	},
	{ "MADELEINETAB" }
)

-- 背包
AddMadeleineRecipe(
	"m_wings",
	{
		Ingredient("batwing", 12),
		Ingredient("dreadstone", 8),
		Ingredient(CHARACTER_INGREDIENT.SANITY, 50),
	},
	TECH.ANCIENT_TWO,
	{
		atlas = "images/inventoryimages/bat_wings.xml",
		image = "bat_wings.tex",
		builder_tag = "madeleine",
		description = "m_wings",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	},
	{ -- "SHADOWFORGING",
		"MADELEINETAB",
	}
)

-- 猫书
AddMadeleineRecipe(
	"m_book",
	{
		Ingredient("book_moon", 1),
		Ingredient("book_web", 1),
		Ingredient("book_horticulture_upgraded", 1),
		Ingredient("book_light_upgraded", 1),
		Ingredient("book_fish", 1),
	},
	TECH.BOOKCRAFT_ONE,
	{
		atlas = "images/inventoryimages/m_book.xml",
		image = "m_book.tex",
		builder_tag = "madeleine",
		description = "m_book",
		fxover = {
			bank = "inventory_fx_shadow",
			build = "inventory_fx_shadow",
			anim = "idle",
		},
	},
	{ "MADELEINETAB" }
)

-- 园艺
AddMadeleineRecipe(
	"book_gardening",
	{ Ingredient("book_silviculture", 1), Ingredient("book_horticulture_upgraded", 1) },
	TECH.BOOKCRAFT_ONE,
	{ builder_tag = "madeleine" },
	{ "MADELEINETAB" }
)
-- local function postinitfn(inst)
-- 	if not TheWorld.ismastersim then
-- 		return inst
-- 	end

-- 	local loots = LootTables["daywalker"]
-- 	if loots then
-- 		table.insert(loots, { "m_shadow_tool_blueprint", 1 })
-- 	end
-- end

-- AddSimPostInit(postinitfn)

-- 新物品配方
AddMadeleineRecipe(
	"m_lightpet",
	{
		Ingredient("moonbutterflywings", 1),
		Ingredient(CHARACTER_INGREDIENT.HEALTH, 10),
	},
	TECH.CELESTIAL_ONE,
	{
		image = "moonbutterfly.tex",
		sg_state = "spawn_mutated_creature",
		actionstr = "TRANSFORM",
		no_deconstruction = true,
		dropitem = true,
		builder_tag = "madeleine",
		product = "m_mutantproxy_lightpet",
		description = "m_lightpet",
		canbuild = function(inst, builder)
			return (builder.components.petleash and not builder.components.petleash:IsFullForPrefab("m_lightpet")),
				"HASPET"
		end,
	},
	{ "MADELEINETAB" }
)

AddMadeleineRecipe(
	"m_darkpet",
	{ Ingredient("batwing", 1), Ingredient(CHARACTER_INGREDIENT.HEALTH, 10) },
	TECH.ANCIENT_TWO,
	{
		image = "bat.tex",
		sg_state = "spawn_mutated_creature",
		actionstr = "TRANSFORM",
		no_deconstruction = true,
		dropitem = true,
		builder_tag = "madeleine",
		product = "m_mutantproxy_darkpet",
		description = "m_darkpet",
		canbuild = function(inst, builder)
			return (builder.components.petleash and not builder.components.petleash:IsFullForPrefab("m_darkpet")),
				"HASPET"
		end,
	},
	{ "MADELEINETAB" }
)

-- 狗王哨子
AddMadeleineRecipe(
	"m_houndwhistle",
	{
		Ingredient("goldnugget", 3),
		Ingredient("nightmarefuel", 5),
		Ingredient("purplegem", 2),
	},
	TECH.NONE,
	{
		image = "houndwhistle.tex",
		no_deconstruction = true, -- 不能被分解
		actionstr = "PERDOFFERING",
		description = "m_houndwhistle",
		builder_tag = "madeleine_warg",
	},
	{ "MADELEINETAB", "WEAPONS" }
)

AddMadeleineRecipe(
	"redgem",
	{ Ingredient("bluegem", 2) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_redgem" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"bluegem",
	{ Ingredient("redgem", 2) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_bluegem" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"purplegem",
	{ Ingredient("redgem", 1), Ingredient("bluegem", 1) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_purplegem" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"orangegem",
	{ Ingredient("purplegem", 3) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_orangegem" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"yellowgem",
	{ Ingredient("orangegem", 3) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_yellowgem" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"greengem",
	{ Ingredient("yellowgem", 3) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_greengem" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"opalpreciousgem",
	{
		Ingredient("redgem", 1),
		Ingredient("bluegem", 1),
		Ingredient("purplegem", 1),
		Ingredient("orangegem", 1),
		Ingredient("yellowgem", 1),
		Ingredient("greengem", 1),
	},
	TECH.MAGIC_TWO,
	{
		builder_tag = "madeleine",
		description = "transmute_opalpreciousgem",
	},
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
AddMadeleineRecipe(
	"horrorfuel",
	{
		Ingredient("nightmarefuel", 3),
		Ingredient(CHARACTER_INGREDIENT.SANITY, 10),
	},
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)

AddMadeleineRecipe(
	"purebrilliance",
	{
		Ingredient("moonglass", 3),
		Ingredient(CHARACTER_INGREDIENT.SANITY, 10),
	},
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)
-- 批量转化
AddMadeleineRecipe(
	"dreadstone",
	{ Ingredient("horrorfuel", 3) },
	TECH.MAGIC_TWO,
	{ builder_tag = "madeleine", description = "transmute_dreadstone" },
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)

AddMadeleineRecipe("transmute_dreadstone", { Ingredient("horrorfuel", 9) }, TECH.MAGIC_TWO, {
	numtogive = 3,
	builder_tag = "madeleine",
	product = "dreadstone",
	image = "dreadstone.tex",
	description = "transmute_dreadstone",
}, { -- "CHARACTER" -- 冒险家物品
	"MADELEINETAB",
})

AddMadeleineRecipe("transmute_purebrilliance", { Ingredient("moonglass_charged", 9) }, TECH.MAGIC_TWO, {
	numtogive = 3,
	builder_tag = "madeleine",
	product = "purebrilliance",
	image = "purebrilliance.tex",
	description = "transmute_purebrilliance",
}, { -- "CHARACTER" -- 冒险家物品
	"MADELEINETAB",
})

-- 树精雕像
AddMadeleineRecipe(
	"leif_idol",
	{
		Ingredient("cutgrass", 3),
		Ingredient("livinglog", 2),
		Ingredient("nightmarefuel", 5),
	},
	TECH.NONE,
	{
		builder_tag = "madeleine_leif",
	},
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)

-- 统帅头盔
AddMadeleineRecipe(
	"wathgrithr_improvedhat",
	{
		Ingredient("goldnugget", 2),
		Ingredient("rocks", 2),
	},
	TECH.NONE,
	{
		builder_tag = "madeleine",
	},
	{ -- "CHARACTER" -- 冒险家物品
		"MADELEINETAB",
	}
)

AddMadeleineRecipe(
	"fishmeat",
	{ Ingredient("fishmeat_small", 2) },
	TECH.NONE,
	{ builder_tag = "madeleine" },
	{ "MADELEINETAB" }
)

AddMadeleineRecipe("fishmeat_small", { Ingredient("fishmeat", 1) }, TECH.NONE, {
	numtogive = 2,
	builder_tag = "madeleine",
}, { "MADELEINETAB" })
-- 红眼冠
AddMadeleineRecipe("cotl_trinket", { Ingredient("goldnugget", 50) }, TECH.NONE, {
	builder_tag = "madeleine",
}, { "MADELEINETAB" })

-- 瓶子
AddMadeleineRecipe("messagebottleempty", { Ingredient("moonglass", 3) }, TECH.NONE, {
	builder_tag = "madeleine",
}, { "MADELEINETAB" })
-- 鹿角
AddMadeleineRecipe("deer_antler", { Ingredient("boneshard", 3) }, TECH.NONE, {
	builder_tag = "madeleine",
	image = "deer_antler1.tex",
}, { "MADELEINETAB" })
-- 火花柜
AddMadeleineRecipe(
	"security_pulse_cage",
	{
		Ingredient("thulecite", 2),
		Ingredient("moonstorm_static_item", 1),
		Ingredient("purebrilliance", 10),
	},
	TECH.NONE,
	{
		builder_tag = "madeleine",
		image = "security_pulse_cage.tex",
	},
	{ "MADELEINETAB" }
)

----------------------------------------------------------

GLOBAL.STRINGS.RECIPE_DESC.FISHMEAT = "化小鱼肉为鱼肉。"
GLOBAL.STRINGS.RECIPE_DESC.FISHMEAT_SMALL = "化鱼肉为小鱼肉。"
GLOBAL.STRINGS.RECIPE_DESC.PUREBRILLIANCE = "给月亮碎片注入能量。"
GLOBAL.STRINGS.RECIPE_DESC.HORRORFUEL = "给噩梦燃料注入能量。"

-- 女巫扫帚（飞行 / 跨海）
AddMadeleineRecipe(
	"m_witchbroom",
	{
		Ingredient("twigs", 2),
		Ingredient("rope", 1),
		Ingredient("cutgrass", 3),
	},
	TECH.NONE,
	{
		-- 附魔扫帚图标：witchbroom_living.tex 也在 images/inventoryimages4.xml 里，
		-- 不写 atlas，让 Recipe 走 GetInventoryItemAtlas(image) 自己找对应的图集
		image = "witchbroom_living.tex",
		builder_tag = "madeleine",
		description = "m_witchbroom",
	},
	{ "MADELEINETAB" }
)
