local CritWork = Class(function(self, inst)
	self.inst = inst
	self.enabled = false
	self.chance = 0.75 -- 默认75%秒杀概率
	self.original_multiplier_fn = nil -- 保存原始工作乘数函数
end)

-- 设置秒杀概率 (0~1)
function CritWork:SetChance(new_chance)
	self.chance = math.clamp(new_chance, 0, 1)
end

-- 启用秒杀功能
function CritWork:Enable()
	if not self.enabled then
		self.enabled = true
		-- 保存原始函数（避免覆盖其他MOD）
		self.original_multiplier_fn = self.inst.components.workmultiplier.specialmultfn

		self.inst.components.workmultiplier:SetSpecialMultiplierFn(function(...)
			return self:OnWork(...)
		end)
	end
end

-- 禁用秒杀功能（恢复原始设置）
function CritWork:Disable()
	if self.enabled then
		self.enabled = false
		-- 恢复原始函数或清除
		self.inst.components.workmultiplier:SetSpecialMultiplierFn(self.original_multiplier_fn)
		self.original_multiplier_fn = nil
	end
end

-- 秒杀逻辑核心
function CritWork:OnWork(inst, action, target, tool, numworks, recoil)
	-- 基础条件检测
	if recoil or numworks == 0 then
		return nil -- 不干预正常逻辑
	end

	-- 触发秒杀
	if math.random() < self.chance then
		-- 播放音效（兼容客户端）
		if inst.player_classified ~= nil then
			inst.player_classified.playworkcritsound:push()
		end
		return 99999 -- 秒杀乘数
	end

	-- 不触发时返回原始函数结果（如果存在）
	if self.original_multiplier_fn ~= nil then
		return self.original_multiplier_fn(inst, action, target, tool, numworks, recoil)
	end
	return nil
end

-- 安全销毁组件
function CritWork:OnRemoveFromEntity()
	self:Disable() -- 自动禁用功能
end

return CritWork
