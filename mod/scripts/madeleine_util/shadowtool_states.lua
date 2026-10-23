-- 暗影魔法工具系统（无键盘快捷键版）

local G = GLOBAL
local ACTIONS = G.ACTIONS
local STRINGS = G.STRINGS
local EQUIPSLOTS = G.EQUIPSLOTS

-- =============================================
-- 1. 文本本地化配置（安全扩展模式）
-- =============================================
do
	-- 确保基础表结构存在
	STRINGS.ACTIONS = STRINGS.ACTIONS or {}
	STRINGS.ACTIONS.USESPELLBOOK = STRINGS.ACTIONS.USESPELLBOOK or {}
	STRINGS.ACTIONS.CLOSESPELLBOOK = STRINGS.ACTIONS.CLOSESPELLBOOK or {}

	-- 暗影工具专属文本（中英对照示例）
	local SHADOW_TOOL_TEXTS = {
		USESPELLBOOK = {
			M_SHADOW_TOOL = "切换形态", -- 简体中文
			-- M_SHADOW_TOOL = "Switch Mode", -- English
		},
		CLOSESPELLBOOK = {
			M_SHADOW_TOOL = "取消切换", -- 简体中文
			-- M_SHADOW_TOOL = "Cancel",      -- English
		},
	}

	-- 非破坏性合并文本（保留其他mod的修改）
	for action_type, texts in pairs(SHADOW_TOOL_TEXTS) do
		for key, text in pairs(texts) do
			if not STRINGS.ACTIONS[action_type][key] then
				STRINGS.ACTIONS[action_type][key] = text
			end
		end
	end
end

-- =============================================
-- 2. RPC处理函数
-- =============================================
-- 工具切换RPC处理
AddModRPCHandler("Functional_medal", "ShadowToolSwitch", function(player, inst, idx)
	if not player:HasTag("playerghost") then
		if inst and inst.SwitchTool then
			inst:SwitchTool(idx)
		end
	end
end)

-- =============================================
-- 3. 动作处理器配置
-- =============================================
ACTIONS.USESPELLBOOK.strfn = function(act)
	local tool = act.invobject or act.target
	return tool ~= nil and tool.prefab == "m_shadow_tool" and "M_SHADOW_TOOL"
end

ACTIONS.CLOSESPELLBOOK.strfn = function(act)
	local tool = act.invobject or act.target
	return tool ~= nil and tool.prefab == "m_shadow_tool" and "M_SHADOW_TOOL"
end

-- =============================================
-- 4. 工具状态行为控制
-- =============================================
AddComponentPostInit("spellbook", function(self)
	local oldCanBeUsedBy = self.CanBeUsedBy

	self.CanBeUsedBy = function(self, doer, ...)
		-- 仅当是暗影工具且已装备时允许使用
		if self.inst.prefab == "m_shadow_tool" then
			return self.inst.replica.equippable:IsEquipped() and self.items ~= nil and #self.items > 0
		end

		return oldCanBeUsedBy and oldCanBeUsedBy(self, doer, ...)
	end
end)

-- =============================================
-- 5. 工具使用状态同步（客户端/服务端）
AddStategraphPostInit("wilson", function(sg)
	--使用工具前切换暗影工具形态
	local tool_states = {
		"chop_start", --砍树
		"mine_start", --挖矿
		"dig_start", --铲
		"hammer_start", --锤
		"bugnet_start", --捕捉
	}
	for i, v in ipairs(tool_states) do
		if sg.states[v] then
			local oldonenter = sg.states[v].onenter
			sg.states[v].onenter = function(inst, ...)
				if inst.m_multi_use_tool and inst.components.inventory then
					local handitem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
					if handitem and handitem.prefab == "m_shadow_tool" and handitem.ResetToolAnim then
						handitem:ResetToolAnim(i)
					end
				end
				if oldonenter then
					oldonenter(inst, ...)
				end
			end
		end
	end
end)
