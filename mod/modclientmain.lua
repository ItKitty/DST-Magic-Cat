-- !!This file is only used by Mods in Menu!!
GLOBAL.setmetatable(env, {
	__index = function(t, k)
		return GLOBAL.rawget(GLOBAL, k)
	end,
})

PrefabFiles = {
	"madeleine_none",
}

Assets = {
	Asset("IMAGE", "images/saveslot_portraits/madeleine.tex"),
	Asset("ATLAS", "images/saveslot_portraits/madeleine.xml"),

	Asset("IMAGE", "images/selectscreen_portraits/madeleine.tex"),
	Asset("ATLAS", "images/selectscreen_portraits/madeleine.xml"),

	Asset("IMAGE", "bigportraits/madeleine.tex"),
	Asset("ATLAS", "bigportraits/madeleine.xml"),

	Asset("IMAGE", "bigportraits/madeleine_none.tex"), -- 人物大图（椭圆的那个）
	Asset("ATLAS", "bigportraits/madeleine_none.xml"),

	Asset("IMAGE", "images/names_madeleine.tex"),
	Asset("ATLAS", "images/names_madeleine.xml"),

	Asset("IMAGE", "images/names_gold_cn_madeleine.tex"),
	Asset("ATLAS", "images/names_gold_cn_madeleine.xml"),

	Asset("IMAGE", "images/avatars/self_inspect_madeleine.tex"), -- 人物检查按钮的图片
	Asset("ATLAS", "images/avatars/self_inspect_madeleine.xml"),

	Asset("IMAGE", "images/map_icons/madeleine.tex"),
	Asset("ATLAS", "images/map_icons/madeleine.xml"),

	Asset("IMAGE", "images/avatars/avatar_madeleine.tex"),
	Asset("ATLAS", "images/avatars/avatar_madeleine.xml"),

	Asset("IMAGE", "images/avatars/avatar_ghost_madeleine.tex"),
	Asset("ATLAS", "images/avatars/avatar_ghost_madeleine.xml"),
	-- 武器贴图
	Asset("IMAGE", "images/inventoryimages/m_catpaw.tex"),
	Asset("ATLAS", "images/inventoryimages/m_catpaw.xml"),
}

-- The character's name as appears in-game
STRINGS.NAMES.MADELEINE = "玛德琳"
STRINGS.SKIN_NAMES.madeleine_none = "玛德琳"
STRINGS.SKIN_DESCRIPTIONS.madeleine_none = "玛德琳的新衣。"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MADELEINE = {
	GENERIC = "早安~%s!",
	ATTACKER = "%s看起来很狡猾……",
	MURDERER = "凶手！",
	REVIVER = "%s，鬼的朋友。",
	GHOST = "%s需要一颗心。",
	FIRESTARTER = "可恶！……%s在烧我的毛。",
}

-- Stats
TUNING.MADELEINE_HEALTH = 150
TUNING.MADELEINE_HUNGER = 150
TUNING.MADELEINE_SANITY = 300

STRINGS.CHARACTER_SURVIVABILITY.madeleine = "一旦接受了自己的软弱，\n那么我就是无敌的。"

-- The character select screen lines
STRINGS.CHARACTER_TITLES.madeleine = "弦歌巫师"
STRINGS.CHARACTER_ABOUTME.madeleine =
	"玛德琳是一只神奇的猫咪，\n她来到永恒大陆是为了追求更强大的魔法。"
STRINGS.CHARACTER_NAMES.madeleine = "玛德琳"
STRINGS.CHARACTER_DESCRIPTIONS.madeleine =
	"*博学\n*曾经在女巫世界中生活过\n*有自己的演奏风格\n*贪婪"
STRINGS.CHARACTER_QUOTES.madeleine = '"我是来享受的，不是来坐牢的！"'

STRINGS.CHARACTER_BIOS.madeleine = {
	{
		title = "生日",
		desc = "11月6号",
	},
	{
		title = "最喜欢的食物",
		desc = "炸鱼排",
	},
	{
		title = "名言",
		desc = "前进之路，曲折又漫长",
	},
	{
		title = "厚积薄发",
		desc = "谁也不知道玛德琳从哪里来，要从哪里去。她身手敏捷，博学多识，为了追求更强大的宝石魔法不远千里来到永恒大陆，她从不畏惧挑战。现在，好戏开场了！",
	},
}

-- Custom starting items
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["m_catpaw"] = {
	atlas = "images/inventoryimages/m_catpaw.xml",
	image = "m_catpaw.tex",
}

for _, starting_items in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
	starting_items.MADELEINE = {
		"redgem",
		"nightmarefuel",
		"nightmarefuel",
		"nightmarefuel",
		"fishsticks",
		"fishsticks",
		"fishsticks",
		"m_catpaw",
	}
end

local ghost_skin = {
	{
		type = "ghost_skin",
		anim_bank = "ghost",
		idle_anim = "idle",
		scale = 0.75,
		offset = { 0, -25 },
	},
}

AddModCharacter("madeleine", "FEMALE", ghost_skin)
