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
modimport("scripts/config/recipes/m_recipes_gear.lua") -- 配方系统（猫の装备栏）
modimport("scripts/config/recipes/m_recipes_spells.lua") -- 魔法书配方（猫の幻想栏）
modimport("scripts/config/recipes/m_recipes_compat.lua") -- 兼容别的模组配方系统

-- 文本声明
modimport("scripts/strings_madeleine.lua")

-- 系统：玩法逻辑、输入与 RPC（加载顺序不要随意调整，后面的会覆盖前面的行为）
modimport("scripts/systems/pet_events.lua") -- 宠物事件
modimport("scripts/systems/shadowtool_states.lua") -- 暗影工具状态管理
modimport("scripts/systems/shadowfx.lua") -- 暗影粒子效果与工具函数
modimport("scripts/systems/hotkeys.lua") -- 技能快捷键与 RPC
modimport("scripts/systems/soulstaff_toggle.lua") -- 灵魂法杖：吸血形态开关的 RPC

-- 动作：一个动作一个文件（定义 + SG handler + component action 都放同一个文件）
-- 注意：AddAction 的调用顺序决定 action.code，而原版 ACTIONS_MAP_REMAP 是按 code 索引的
-- （ACTIVATE=4 / BLINK=21 / TOSS=214）。所以不要重排下面动作的顺序，新增动作请追加在
-- m_spatialjump_action 之后，避免把它的 code 顶到 4 而覆盖原版地图交互。
modimport("scripts/actions/m_spatialjump_action.lua") -- 空间跳跃动作
modimport("scripts/actions/m_amulet_action.lua") -- 护符升级动作

modimport("scripts/systems/m_inspirationbadge.lua") -- 激励勋章
modimport("scripts/systems/chiropteran.lua") -- 变身：属性、静音脚步、RPC
modimport("scripts/actions/m_chiropteran_transform.lua") -- 变身/变回动作与状态机（code 3/4）
modimport("scripts/systems/critter_perishable.lua") -- 宠物饥饿与礼物

modimport("scripts/actions/m_extinguish_action.lua") -- 熄灭动作
modimport("scripts/actions/m_infinity_action.lua") -- 无限充能动作（启迪碎片）

modimport("scripts/systems/m_kitcoon_container.lua") -- 浣猫崽：储物格 + 改名/换皮命令
modimport("scripts/systems/m_skill_winona.lua") -- 薇诺娜技能树兼容
modimport("scripts/systems/maogugu_text_trail_fx.lua") -- 文本轨迹特效

-- 放在最后：所有对原版代码的挂接修改（AddPrefabPostInit / AddComponentPostInit / AddClassPostConstruct）
modimport("scripts/systems/m_witchbroom_fly.lua") -- 女巫扫帚飞行（照搬工坊 3828144951）
modimport("scripts/patches/m_vanilla_hooks.lua")

-- 状态机补丁放在最末：它会包裹 wilson / wilson_client 的 ATTACK、受击和落地状态，
-- 必须晚于其它 SG 相关改动加载
modimport("scripts/patches/m_player_sg.lua") -- 玩家状态机动作
