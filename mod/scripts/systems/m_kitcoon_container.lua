-- m_kitcoon 的储物格配置
-- 布局跟龙鳞箱（dragonflychest）一致：3 列 x 4 行 = 12 格，
-- 任何物品都能放（不可替换的除外），配合 container:EnableInfiniteStackSize 实现无限堆叠。

local containers = require("containers")
local params = containers.params

params.m_kitcoon = deepcopy(params.dragonflychest)

function params.m_kitcoon.itemtestfn(container, item, slot)
	return not item:HasTag("irreplaceable")
end

for _, v in pairs(params) do
	containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
