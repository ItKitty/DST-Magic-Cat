-- m_infinity_shard
-- 只是个「标记组件」：挂在启迪碎片（alterguardianhatshard）上，
-- 用来给这个道具注册 USEITEM 动作。
-- 注意不能注册在 inventoryitem 上——同一模组内 AddComponentAction 是按
-- 「组件名」做键的，后注册的会覆盖先注册的（护符解锁就是用 inventoryitem）。

local m_infinity_shard = Class(function(self, inst)
	self.inst = inst
end)

return m_infinity_shard