-- m_infinity_shard
-- 只是个「标记组件」：把它挂在启迪碎片（alterguardianhatshard）上，
-- 这样可以用 AddComponentAction("USEITEM", "m_infinity_shard", ...) 给这个道具
-- 注册「对带耐久的装备/建筑使用」的动作，而不用去挂 "stackable" 这种高频组件。

local m_infinity_shard = Class(function(self, inst)
	self.inst = inst
end)

return m_infinity_shard
