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
STRINGS.CHARACTERS.MADELEINE = require("speech_wickerbottom")
-- STRINGS.CHARACTERS.madeleine = require("speech_madeleine")
-- 添加角色特殊对话
AddSimPostInit(function()
	-- 缺失台词补充
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_CHARLIE_MISSED =
		"喵喵喵？事不过三，敢亮血条吗，查理？！"
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_HUNGRY = "饿了喵~"
	STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HOTSPRING.GENERIC = "好想进去泡一泡啊~"
	-- 旺达表
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_POCKETWATCH_MARK = "这里当锚点很不错喵。"
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "好了，大家动作快点喵！"
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD =
		"当心了，这一跳非同小可！"
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_POCKETWATCH_RECALL = "没有什么能比时空旅行更让喵兴奋了！"
	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_POCKETWATCH_PORTAL = "天空一阵巨响，本可闪亮登场！"
	-- 老麦
	STRINGS.CHARACTERS.WICKERBOTTOM.ACTIONFAIL.CASTAOE.NO_MAX_SANITY = "恐怕我的意志受不了那种重压……"

	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_FLOAT_SWIM_TIRED = "猫累了喵~"

	STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_SHELTER = "大树底下好乘凉喵~"
	-- 潮湿

	-- STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_DAMP = "完了完了，毛要湿了！"
	-- STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_WET = "完了完了，绒毛要湿了！！"
	-- STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_WETTER = "完了完了，皮要湿了！！！"
	-- STRINGS.CHARACTERS.WICKERBOTTOM.ANNOUNCE_SOAKED = "唉，湿透了，就这样吧。"
	STRINGS.CHARACTERS.WICKERBOTTOM.BATTLECRY.SPIDER_WARRIOR = "找死吗？！"

	-- 宠物
	STRINGS.CHARACTERS.WICKERBOTTOM.ACTIONFAIL.BUILD.HASPET = "已经有足够多的伙伴了。"
	-- 珍珠
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
