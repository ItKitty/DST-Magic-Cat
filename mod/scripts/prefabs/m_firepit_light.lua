-- m_firepit_light
-- 无限充能后的火堆用它来「假装自己是矮星」：
--   · 带 lightsource / daylight 标签 —— 农场作物在夜里会把它当成光源继续生长
--   · 自带一盏暖色灯 —— 夜里照明
-- 由 m_infinity_charge 组件在充能时生成，跟着火堆走；火堆没了就一起移除。

local LIGHT_RADIUS = 8
local LIGHT_COLOUR = { 1, 0.78, 0.45 }
local FOLLOW_PERIOD = 0.5

local assets = {}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddLight()
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")
	inst:AddTag("lightsource")
	inst:AddTag("daylight")

	inst.Light:SetColour(LIGHT_COLOUR[1], LIGHT_COLOUR[2], LIGHT_COLOUR[3])
	inst.Light:SetIntensity(0.8)
	inst.Light:SetFalloff(0.9)
	inst.Light:SetRadius(LIGHT_RADIUS)
	inst.Light:Enable(true)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	-- 跟随它绑定的火堆（位置由服务端更新，客户端通过 Transform 同步看到）
	inst.follow_target = nil
	inst._followtask = inst:DoPeriodicTask(FOLLOW_PERIOD, function(light)
		local target = light.follow_target
		if target == nil or not target:IsValid() then
			light.follow_target = nil
			if light._followtask ~= nil then
				light._followtask:Cancel()
				light._followtask = nil
			end
			light:Remove()
			return
		end
		light.Transform:SetPosition(target.Transform:GetWorldPosition())
	end)

	inst.persists = false

	return inst
end

return Prefab("m_firepit_light", fn, assets)
