-- seg_time = 30
GLOBAL.setmetatable(env, {
	__index = function(t, k)
		return GLOBAL.rawget(GLOBAL, k)
	end,
})

TUNING.ChargeFireKey = GetModConfigData("ChargeFireKey")
TUNING.ChargeIceKey = GetModConfigData("ChargeIceKey")
TUNING.ToggleSantiy = GetModConfigData("ToggleSantiy")
TUNING.ToggleLight = GetModConfigData("ToggleLight")

-- 导入复制组件
AddReplicableComponent("amulettraits")
AddReplicableComponent("chiropteran")

-- 配置：资源声明、角色属性、配方
modimport("scripts/config/assets.lua") -- 资源与 PrefabFiles 声明
modimport("scripts/config/character.lua") -- 角色配置
modimport("scripts/config/recipes.lua") -- 配方系统
modimport("scripts/config/recipes2.lua") -- 魔法书配方系统
modimport("scripts/config/recipes3.lua") -- 兼容别的模组配方系统

-- 文本声明
modimport("scripts/strings_madeleine.lua")

-- 系统：玩法逻辑、动作与 hook（加载顺序不要随意调整，后面的会覆盖前面的行为）
modimport("scripts/systems/pet_events.lua") -- 宠物事件
modimport("scripts/systems/shadowtool_states.lua") -- 暗影工具状态管理
modimport("scripts/systems/shadowfx.lua") -- 暗影粒子效果与工具函数
modimport("scripts/systems/hotkeys.lua") -- 技能快捷键与 RPC
modimport("scripts/systems/soulstaff_toggle.lua") -- 灵魂法杖：吸血形态开关的 RPC
modimport("scripts/systems/spatialjump_action.lua") -- 空间跳跃动作
modimport("scripts/systems/amulet_action.lua") -- 护符升级动作
modimport("scripts/systems/player_sg.lua") -- 玩家状态机动作
modimport("scripts/systems/m_inspirationbadge.lua") -- 激励勋章
modimport("scripts/systems/chiropteran.lua") -- 变身管理
modimport("scripts/systems/critter_perishable.lua") -- 宠物饥饿与礼物
modimport("scripts/systems/extinguish_action.lua") -- 熄灭动作
modimport("scripts/systems/m_infinity_action.lua") -- 无限充能动作（启迪碎片）
modimport("scripts/systems/m_kitcoon_container.lua") -- 浣猫崽：储物格 + 改名/换皮命令
modimport("scripts/systems/m_skill_winona.lua") -- 薇诺娜技能树兼容
modimport("scripts/systems/maogugu_text_trail_fx.lua") -- 文本轨迹特效

-- 放在最后：所有对原版代码的挂接修改（AddPrefabPostInit / AddComponentPostInit / AddClassPostConstruct）
modimport("scripts/systems/vanilla_hooks.lua")
