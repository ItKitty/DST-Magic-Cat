-- utils.lua - 工具函数

-- 函数装饰器，用于增强原有函数
local function FnDecorator(obj, key, beforeFn, afterFn, isUseBeforeReturn)
	assert(type(obj) == "table")
	assert(beforeFn == nil or type(beforeFn) == "function", "beforeFn must be nil or a function")
	assert(afterFn == nil or type(afterFn) == "function", "afterFn must be nil or a function")

	local oldVal = obj[key]

	obj[key] = function(...)
		local retTab, isSkipOld, newParam, r

		if beforeFn then
			retTab, isSkipOld, newParam = beforeFn(...)
		end

		if type(oldVal) == "function" and not isSkipOld then
			if newParam ~= nil then
				r = { oldVal(unpack(newParam)) }
			else
				r = { oldVal(...) }
			end

			if not isUseBeforeReturn then
				retTab = r
			end
		end

		retTab = retTab or {} -- 就算原函数不存在我也不希望是nil

		if afterFn then
			retTab = afterFn(retTab, ...) or {}
		end

		return unpack(retTab)
	end
end

-- 物品粒子效果增强
local function SetIsEquipAfter(retTab, self, isequip)
	local m_shadowfx = isequip and self.item:HasTag("m_item")

	if not self.showequipshadowfx == m_shadowfx then
		self.showequipshadowfx = m_shadowfx or nil
		self:ToggleShadowFX()
	end
end

-- 应用物品粒子效果增强
AddClassPostConstruct("widgets/itemtile", function(self)
	FnDecorator(self, "SetIsEquip", nil, SetIsEquipAfter)
end)

return {
	FnDecorator = FnDecorator,
	SetIsEquipAfter = SetIsEquipAfter,
}
