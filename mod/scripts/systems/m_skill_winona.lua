-- modmain_winona_only.lua

GLOBAL.setmetatable(env, {
	__index = function(t, k)
		return GLOBAL.rawget(GLOBAL, k)
	end,
})

local require = GLOBAL.require

-- 加载技能树定义
local skilltreedata_all = require("prefabs/skilltree_defs")
local SKILLTREE_DEFS = skilltreedata_all.SKILLTREE_DEFS

-- ============ 配置：只有 madeleine 可以使用 ============
local ALLOWED_CHARACTER = "madeleine"

-- ============ MOD兼容检测 ============
local moddir = _G.KnownModIndex:GetModsToLoad(true)
local enablemods = {}

for k, dir in pairs(moddir) do
	local info = _G.KnownModIndex:GetModInfo(dir)
	local name = info and info.name or "unknow"
	enablemods[dir] = name
end

function IsModEnable(name)
	for k, v in pairs(enablemods) do
		if v and (k:match(name) or v:match(name)) then
			return true
		end
	end
	return false
end

-- 检测是否开启了能力勋章MOD
local HAS_MEDAL_MOD = IsModEnable("能力勋章 Functional Medal") or IsModEnable("workshop%-1909182187")
if not HAS_MEDAL_MOD then
	return
end

-- 根据是否开启勋章MOD，使用不同的标签
local HANDY_TAG = HAS_MEDAL_MOD and "has_handy_medal"

-- ============ checkcertificate 函数（兼容客户端检测） ============
local function checkcertificate(inst, tag)
	if inst ~= nil and inst:HasTag(tag) then
		return true
	end
	if not TheNet:IsDedicated() and inst == ThePlayer then
		return ThePlayer:HasTag(tag)
	end
	return false
end

-- ============ 核心功能 ============

-- 重写技能激活检测
local function extraskillcheck(self)
	local oldisactivated = self.IsActivated
	self.IsActivated = function(_self, _skill)
		-- 如果原版已激活，直接返回
		if oldisactivated(_self, _skill) then
			return true
		end

		local owner = _self.skilltree and _self.skilltree.owner
		if not owner then
			return false
		end

		-- 检查该技能是否属于薇诺娜的技能树
		if SKILLTREE_DEFS["winona"][_skill] == nil then
			return false
		end

		-- === 条件1：必须是 madeleine 角色 ===
		if owner.prefab ~= ALLOWED_CHARACTER then
			return false
		end

		-- === 条件2：必须佩戴勋章（使用 checkcertificate 检测） ===
		if not checkcertificate(owner, HANDY_TAG) then
			return false
		end

		return true
	end
end

-- 注入技能树检测
AddComponentPostInit("skilltreeupdater", extraskillcheck)

-- ============ 勋章物品标签处理 ============

-- 处理 handy_certificate（能力勋章MOD的勋章）
AddPrefabPostInit("handy_certificate", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	local oldonequip = inst.components.equippable.onequipfn
	inst.components.equippable.onequipfn = function(_inst, _owner, _from_ground)
		oldonequip(_inst, _owner, _from_ground)
		AddMedalComponent(_owner, "inspectaclesparticipant") --好用咱就用
		AddMedalComponent(_owner, "roseinspectableuser")
		AddMedalTag(_owner, "portableengineer")
		AddMedalTag(_owner, "inspectacleshatuser")
	end
	local oldonunequip = inst.components.equippable.onunequipfn
	inst.components.equippable.onunequipfn = function(_inst, _owner)
		oldonunequip(_inst, _owner)
		RemoveMedalComponent(_owner, "inspectaclesparticipant")
		RemoveMedalComponent(_owner, "roseinspectableuser")
		RemoveMedalTag(_owner, "portableengineer")
		RemoveMedalTag(_owner, "inspectacleshatuser")
	end
end)
