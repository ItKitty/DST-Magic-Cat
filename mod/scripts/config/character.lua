-- character.lua - 角色相关配置

local STRINGS = GLOBAL.STRINGS

-- 角色皮肤设置（修复人物大图显示）
GLOBAL.PREFAB_SKINS["madeleine"] = { "madeleine_none" }

-- 角色字符串配置
STRINGS.CHARACTER_TITLES.madeleine = "弦歌巫师"
STRINGS.CHARACTER_ABOUTME.madeleine =
	"玛德琳是一只神奇的猫咪，\n她来到永恒大陆是为了追求更强大的魔法。"
STRINGS.CHARACTER_NAMES.madeleine = "玛德琳"
STRINGS.CHARACTER_DESCRIPTIONS.madeleine =
	"*博学\n*曾经在女巫世界中生活过\n*有自己的演奏风格\n*贪婪"
STRINGS.CHARACTER_QUOTES.madeleine = '"我是来享受的，不是来坐牢的！"'
STRINGS.CHARACTER_BIOS.madeleine = {
	{ title = "生日", desc = "11月6号" },
	{ title = "最喜欢的食物", desc = "炸鱼排" },
	{ title = "名言", desc = "前进之路，曲折又漫长" },
	{
		title = "厚积薄发",
		desc = "谁也不知道玛德琳从哪里来，要从哪里去。她身手敏捷，博学多识，为了追求更强大的宝石魔法不远千里来到永恒大陆，她从不畏惧挑战。现在，好戏开场了！",
	},
}

-- 角色生存能力
STRINGS.CHARACTER_SURVIVABILITY.madeleine = "一旦接受了自己的软弱，\n那么我就是无敌的。"

-- The character's name as appears in-game
STRINGS.NAMES.MADELEINE = "玛德琳"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MADELEINE = {
	GENERIC = "早安~%s!",
	ATTACKER = "%s看起来很狡猾……",
	MURDERER = "凶手！",
	REVIVER = "%s，鬼的朋友。",
	GHOST = "%s需要一颗心。",
	FIRESTARTER = "可恶！……%s在烧我的毛。",
}

-- 角色属性配置
GLOBAL.TUNING.MADELEINE_HEALTH = 150
GLOBAL.TUNING.MADELEINE_HUNGER = 175
GLOBAL.TUNING.MADELEINE_SANITY = 300

-- 初始物品
GLOBAL.TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.MADELEINE = {
	"redgem",
	"nightmarefuel",
	"nightmarefuel",
	"nightmarefuel",
	"fishsticks",
	"fishsticks",
	"fishsticks",
	"m_catpaw",
}
GLOBAL.TUNING.STARTING_ITEM_IMAGE_OVERRIDE["m_catpaw"] = {
	atlas = "images/inventoryimages/m_catpaw.xml",
	image = "m_catpaw.tex",
}

-- 自定义对话
-- 台词表在 scripts/speech_madeleine.lua（由 tools/build_madeleine_speech.py 生成）
-- 角色专属的特殊台词写在该文件顶部的 SPECIAL 表里，会覆盖下面的同名条目
STRINGS.CHARACTERS.MADELEINE = require("speech_madeleine")

-- 其它不属于角色台词表的字符串
AddSimPostInit(function()
	-- 珍珠（隐士）的对话，与角色台词表无关
	STRINGS.HERMITCRAB_ANNOUNCE_ROYALTY = {
		"哎呀，你看起来很位高权重啊。",
		"我没想到自己还能遇见皇室。",
		"向陛下致敬。",
	}
end)

local ghost_skin = {
	{
		type = "ghost_skin",
		anim_bank = "ghost",
		idle_anim = "idle",
		scale = 0.75,
		offset = { 0, -25 },
	},
}

-- Let the game know character is male, female, or robot
AddModCharacter("madeleine", "FEMALE", ghost_skin)
