-- assets.lua - 资源文件声明

-- 注意：在《饥荒》模组系统中，Assets 和 PrefabFiles 是特殊的全局表
-- 不需要 return，游戏会自动读取这些表

-- 1. 图像和资源声明
Assets = {
	-- 角色大图资源
	Asset("IMAGE", "bigportraits/madeleine.tex"),
	Asset("ATLAS", "bigportraits/madeleine.xml"),
	Asset("IMAGE", "bigportraits/madeleine_none.tex"),
	Asset("ATLAS", "bigportraits/madeleine_none.xml"),

	-- 头像和界面资源
	Asset("IMAGE", "images/avatars/avatar_madeleine.tex"),
	Asset("ATLAS", "images/avatars/avatar_madeleine.xml"),
	Asset("IMAGE", "images/avatars/self_inspect_madeleine.tex"),
	Asset("ATLAS", "images/avatars/self_inspect_madeleine.xml"),
	Asset("IMAGE", "images/avatars/avatar_ghost_madeleine.tex"),
	Asset("ATLAS", "images/avatars/avatar_ghost_madeleine.xml"),

	-- HUD和界面元素
	Asset("IMAGE", "images/hud/Amulet.tex"),
	Asset("ATLAS", "images/hud/Amulet.xml"),
	Asset("IMAGE", "images/hud/Miracle.tex"),
	Asset("ATLAS", "images/hud/Miracle.xml"),

	-- 存档和选择界面
	Asset("IMAGE", "images/saveslot_portraits/madeleine.tex"),
	Asset("ATLAS", "images/saveslot_portraits/madeleine.xml"),
	Asset("IMAGE", "images/selectscreen_portraits/madeleine.tex"),
	Asset("ATLAS", "images/selectscreen_portraits/madeleine.xml"),
	Asset("IMAGE", "images/names_madeleine.tex"),
	Asset("ATLAS", "images/names_madeleine.xml"),
	Asset("IMAGE", "images/names_gold_cn_madeleine.tex"),
	Asset("ATLAS", "images/names_gold_cn_madeleine.xml"),

	-- 地图图标
	Asset("IMAGE", "images/map_icons/madeleine.tex"),
	Asset("ATLAS", "images/map_icons/madeleine.xml"),

	-- 音频资源
	Asset("SOUNDPACKAGE", "sound/m_sound.fev"),
	Asset("SOUND", "sound/m_sound.fsb"),

	-- 技能图标
	Asset("IMAGE", "images/inventoryimages/m_setmoonphase.tex"),
	Asset("ATLAS", "images/inventoryimages/m_setmoonphase.xml"),
	Asset("IMAGE", "images/inventoryimages/m_garden.tex"),
	Asset("ATLAS", "images/inventoryimages/m_garden.xml"),
	Asset("IMAGE", "images/inventoryimages/m_catchfish.tex"),
	Asset("ATLAS", "images/inventoryimages/m_catchfish.xml"),
	Asset("IMAGE", "images/inventoryimages/m_mutation.tex"),
	Asset("ATLAS", "images/inventoryimages/m_mutation.xml"),
	Asset("IMAGE", "images/inventoryimages/m_summonfishes.tex"),
	Asset("ATLAS", "images/inventoryimages/m_summonfishes.xml"),

	-- 护符
	Asset("ATLAS", "images/inventoryimages/ancestorsrelics.xml"),
	Asset("IMAGE", "images/inventoryimages/ancestorsrelics.tex"),
	-- 工具
	Asset("ATLAS", "images/inventoryimages/medal_shadow_tool.xml"),
	Asset("ATLAS", "images/inventoryimages/medal_shadow_tool_icons.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/medal_shadow_tool.xml", 256),
	-- 法杖
	Asset("IMAGE", "images/inventoryimages/soulstaff.tex"),
	Asset("ATLAS", "images/inventoryimages/soulstaff.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/soulstaff.xml", 256),
	-- 镰刀
	Asset("ATLAS", "images/inventoryimages/m_shadowreaper.xml"),
	Asset("IMAGE", "images/inventoryimages/m_shadowreaper.tex"),
	-- 背包
	Asset("ATLAS", "images/inventoryimages/bat_wings.xml"),
	Asset("IMAGE", "images/inventoryimages/bat_wings.tex"),
	-- 猫爪
	Asset("ATLAS", "images/inventoryimages/m_catpaw.xml"),
	Asset("IMAGE", "images/inventoryimages/m_catpaw.tex"),
	-- 书本
	Asset("ATLAS", "images/inventoryimages/m_book.xml"),
	Asset("IMAGE", "images/inventoryimages/m_book.tex"),
}

-- 2. Prefab文件声明
PrefabFiles = {
	-- 特效
	"fx_projectile",
	"fx_sparkle",
	"fx_bat",
	"fx_light",
	"fx_magical_shadow",
	"fx_magical_weaponsparks",
	"fx_haste",
	"fx_restriction",
	"fx_musiclight",
	"fx_soulstaff_corrupt",
	"fx_catpaw_lunar",

	-- 角色相关
	"madeleine",
	"madeleine_none",

	-- 装备和物品
	"m_amulet",
	"m_pet",
	"m_mutantproxy",
	"m_soulstaff",
	"m_wings",
	"m_bonehat",
	"m_hound",
	"m_houndwhistle",
	"m_shadow_tool",
	"m_voidcloth_scythe",
	"m_catpaw",
	"m_book",

	-- 技能书
	"m_miracle",
	"m_buffs",

	-- 变身
	"chiropteran_bats",

	-- 文本轨迹特效
	"maogugu_text_trail_fx",
}

-- 3. 小地图图标注册
AddMinimapAtlas("images/inventoryimages/bat_wings.xml")
AddMinimapAtlas("images/map_icons/madeleine.xml")

-- 注意：不需要 return 任何内容
-- 游戏会自动读取全局的 Assets 和 PrefabFiles 表
