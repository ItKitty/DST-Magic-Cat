-- This information tells other players more about the mod
name = "[DST]Magic Cat"
author = "NONTAN (Edited BY WYF)"
version = "2.222"
description = "当前[版本󰀝]："
	.. version
	.. "\n󰀒【一旦接受了自己的软弱，那么我就是无敌的！】󰀒"

-- 2.22 爱的力量，增加了箱子猫，后续考虑盐狗，鹦鹉也添加进来
-- 2.21 爱的力量，增加了一些原本的设想
-- 2.2 爱的力量
-- 2.19 增加了启迪碎片给火堆充能无限耐久
-- 2.182 增加了抚摸宠物给礼物
-- 2.181 增加了小恶魔待机动画
-- 2.18 增加了右键熄灭矮星
-- 2.17 宠物喂食不掉饥饿
-- 2.16 想做唱片mod但是又不想改播放机
-- 2.16 补全了表情和图标
-- 2.15 增加了猫书
-- 2.143 给背包加了保鲜功能
-- 2.14 在有勋章的基础上添加了女工技能树
-- 2.13 给施法添加了必须持有书籍才能施法
-- 2.12 给设定和变身增加限制
-- 2.11 新的设定，新的变身
-- 2.10 你无法在我的bgm中打败我
-- 2.09 击杀boss解锁图纸，哨子召唤和老麦召唤小人一样
-- 2.08 增加猫爪右键技能
-- 2.07 增加猫爪
-- 2.06 增加技能图标，ai真是太好用啦，考虑把原本的鱼群和鸟群技能加进去,好像谁有一个蓝图分享技能，更强的一角鲸和鸟群
-- 2.05 优化一下buff和文本
-- 2.04 物品栏施法修改,定身特效修改
-- 2.03 好运猫咪
-- 2.0 护符改名啦！！
-- 1.982 改了一下复苏
-- 1.981 改了一下重量999.99
-- 1.98 改了一些配方，猪鼻的想法挺好，但是用法不方便
-- 1.97 护符删除了护甲，然后新增了无敌机制
-- 1.96 地图传送前置任务增加，考虑 彩，龙鳞，鹿眼，启迪的升级方式要不要修改
-- 1.90 感谢武器成长，现在可以自由地图传送了
-- 1.90 又一次攻克一个难关，旺达表可以升级了，而且也不会被别的影响，唉，啥时候能把勋章的列表学会呢，明明有那么多注释了结果抄都不抄不明白
-- 1.81 第一次知道必须用5的倍数，这个错误是因为在饥荒（Don't Starve Together）的配方系统中，使用角色属性（如SANITY、HEALTH、HUNGER）作为配方材料时，数值必须是5的倍数。你的代码中使用了Ingredient(CHARACTER_INGREDIENT.SANITY, 10)、Ingredient(CHARACTER_INGREDIENT.SANITY, 50)和Ingredient(CHARACTER_INGREDIENT.SANITY, 33)，其中33不是5的倍数，导致了断言错误。
-- 1.80 增加物品栏魔法，好了，这下真的是自带T键了
-- 1.70 增加表情魔法，护符本源功能，移除装备耐久，宠物更多buff
-- 1.69 暮光增加了影袭，终焉增加了定身，护符增加回血，骨盔增加反伤, 增加了内置CD
-- 1.68 增加了快采
-- 1.67 弹性空间可以升级无限背包
-- 1.66 增加了新前期武器，头盔不会爆了
-- 1.65 终极武器改了花里胡哨的技能
-- 1.64 整了溯源表无CD 和文件修改
-- 1.63 整了光棱炮
-- 1.62 整了小动物杀手，限制护符只能玛德琳升级
-- 1.60 整了半天rpc，发现还不如老老实实多问问ai，总算实现武器聊天说话了
-- 1.59 宠物附带特效改了，实在是太超模了
-- 1.58 前期武器还是太超模了，先禁用了，永夜杖数值修改，宠物添加buff
-- 1.56 增加暗影魔法工具
-- 1.55 魔杖改了技能特效
-- 1.54 宠物buff增加效果，武器增加保底机制
-- 1.53 给剔骨鞭新增了一个升级物品，都怪傻逼科雷
-- 1.52 在deepseek的帮助下，实现了护符名字改变，我真是太菜了
-- 1.51 改了一个月的夜视，最终还是采取第一个方案（我真是太菜了）
-- 1.50 添加了老麦特效
-- 1.49 把狗哨添加进来了
-- 1.48 补充了玛德琳的设定和名字
-- 1.4 给宠物增加了不会被主动攻击
-- 1.42 删除部分能力，因为要配套勋章玩
-- 1.43 buff怪增防
-- 1.44 新增武器
-- 1.45 新增武器等级

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

dst_compatible = true -- 兼容联机
dont_starve_compatible = false -- 不兼容单机
reign_of_giants_compatible = false -- 不兼容巨人
all_clients_require_mod = true -- 所有人mod
-- client_only_mod = true  --本地mod

-- The mod's tags displayed on the server list
server_filter_tags = { "character" }

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- priority = -11 --优先级

local alpha = {
	{ description = "B", key = 98 },
	{ description = "C", key = 99 },
	{ description = "G", key = 103 },
	{ description = "J", key = 106 },
	{ description = "K", key = 107 },
	{ description = "R", key = 114 },
	{ description = "T", key = 116 },
	{ description = "V", key = 118 },
	{ description = "X", key = 120 },
	{ description = "Z", key = 122 },
	{ description = "LAlt", key = 308 },
	{ description = "LCtrl", key = 306 },
	{ description = "LShift", key = 304 },
	{ description = "Space", key = 32 },
}
local keyslist = {}
for i = 1, #alpha do
	keyslist[i] = { description = alpha[i].description, data = alpha[i].key }
end

local function divide(label)
	return {
		name = "",
		label = label,
		options = { {
			description = "",
			data = "",
		} },
		default = "",
	}
end

configuration_options = {
	divide("玛德琳技能按键设置"),
	{
		name = "ChargeFireKey",
		label = "ChargeFireKey",
		options = keyslist,
		default = 120, -- "x"
	},
	{
		name = "ChargeIceKey",
		label = "ChargeIceKey",
		options = keyslist,
		default = 99, -- "c"
	},
	{
		name = "ToggleSantiy",
		label = "ToggleSantiy",
		options = keyslist,
		default = 122, -- "z"
	},
	{
		name = "ToggleLight",
		label = "ToggleLight",
		options = keyslist,
		default = 118, -- "v"
	},
	divide("文字拖尾设置"),
	{
		name = "maogugu_trail_lifetime",
		label = "星芒消散时间",
		hover = "保持大小，以透明度逐渐淡出；文字持续时间为此值的 1.8 倍，方便阅读。",
		options = {
			{ description = "短 · 0.9 秒", data = 0.9 },
			{ description = "标准 · 1.35 秒", data = 1.35 },
			{ description = "长 · 1.8 秒", data = 1.8 },
		},
		default = 0.9,
	},
	{
		name = "maogugu_trail_spacing",
		label = "星芒密度",
		hover = "按移动距离发射；静止不会继续生成。",
		options = {
			{ description = "稀疏", data = 1.2 },
			{ description = "标准", data = 0.85 },
			{ description = "丰富", data = 0.6 },
		},
		default = 0.6,
	},
	{
		name = "maogugu_trail_size",
		label = "星星大小",
		hover = "调整四角星和小星光的大小。",
		options = {
			{ description = "小 · 75%", data = 0.75 },
			{ description = "标准", data = 1 },
			{ description = "大 · 125%", data = 1.25 },
		},
		default = 1.25,
	},
	{
		name = "maogugu_trail_text_size",
		label = "文字大小",
		hover = "单独调整“猫菇菇牛逼”五个金色文字的大小。",
		options = {
			{ description = "无 · 0%", data = 0 },
			{ description = "非常小 · 25%", data = 0.25 },
			{ description = "很小 · 50%", data = 0.5 },
			{ description = "小 · 75%", data = 0.75 },
			{ description = "标准 · 100%", data = 1 },
			{ description = "大 · 125%", data = 1.25 },
			{ description = "更大 · 150%", data = 1.5 },
			{ description = "最大 · 200%", data = 2 },
		},
		default = 0.25,
	},
	{
		name = "maogugu_trail_height",
		label = "发射高度",
		hover = "默认从人物背部附近出现；骑牛时自动抬高。",
		options = {
			{ description = "偏低 · 0.85", data = 0.85 },
			{ description = "背部 · 1.1", data = 1.1 },
			{ description = "偏高 · 1.35", data = 1.35 },
		},
		default = 1.35,
	},
	{
		name = "maogugu_trail_glow",
		label = "星芒柔光",
		options = {
			{ description = "关闭辉光", data = 0 },
			{ description = "柔和", data = 0.3 },
			{ description = "明亮", data = 0.8 },
		},
		default = 0.8,
	},
}
