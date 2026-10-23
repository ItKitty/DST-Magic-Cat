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

-- 导入模块
modimport("scripts/madeleine_util/assets.lua") -- 资源声明
modimport("scripts/madeleine_util/character.lua") -- 角色配置
modimport("scripts/madeleine_util/recipes.lua") -- 配方系统
modimport("scripts/madeleine_util/recipes2.lua") -- 魔法书配方系统
modimport("scripts/madeleine_util/recipes3.lua") -- 兼容别的模组配方系统

modimport("scripts/strings_madeleine.lua") -- 文本声明
modimport("scripts/madeleine_util/pet_events.lua") -- 宠物事件
modimport("scripts/madeleine_util/shadowtool_states.lua") -- 暗影工具状态管理系统
modimport("scripts/madeleine_util/shadowfx_utils.lua") -- 粒子效果和工具函数
modimport("scripts/madeleine_util/madeleine_util.lua") -- 技能管理
modimport("scripts/madeleine_util/spatialjump_action.lua") -- 空间跳跃动作管理
modimport("scripts/madeleine_util/amulet_action.lua") -- 护符升级管理
modimport("scripts/madeleine_util/player_sg.lua") -- 动作管理
modimport("scripts/madeleine_util/m_inspirationbadge.lua") -- 激励勋章管理
modimport("scripts/madeleine_util/chiropteran.lua") -- 变身管理
modimport("scripts/madeleine_util/critter_perishable.lua") -- 宠物饥饿和礼物管理
modimport("scripts/madeleine_util/extinguish_action.lua") -- 熄灭动作管理
-- modimport("scripts/madeleine_util/m_toggle_soulstaff.lua") -- 灵魂杖管理
modimport("scripts/madeleine_util/m_skill_winona.lua") -- 获取winona技能树管理
-- modimport("scripts/madeleine_util/m_infinity_action.lua") -- 无限充电管理
modimport("scripts/madeleine_util/maogugu_text_trail_fx.lua") -- 文本轨迹特效管理

modimport("scripts/madeleine_util/mechanics.lua") -- 游戏机制HOOK修改
----------------------------------------------------------

----------------------------------------------------------
