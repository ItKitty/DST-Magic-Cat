-- 变身系统：属性、静音脚步、RPC
-- 动作、状态机与 component action 在 scripts/actions/m_chiropteran_transform.lua

--[[----------------------------
   	Chiropteran Tuning
----------------------------]]
--
TUNING.CHIROPTERAN_RANGE = 2
TUNING.CHIROPTERAN_DAMAGE = 10
TUNING.CHIROPTERAN_DAMAGE_PLAYER = 6
TUNING.CHIROPTERAN_ATTACK_RATE = 0.5

--[[----------------------------
    Silence Footsteps
----------------------------]]
--
local _PlayFootstep = GLOBAL.PlayFootstep
GLOBAL.PlayFootstep = function(inst, ...)
	if inst.nofootsteps and inst.nofootsteps:value() then
		return
	end
	return _PlayFootstep(inst, ...)
end

--[[----------------------------
    Chiropterian Transformations
----------------------------]]
--
-- 客户端点动作时只发 RPC，真正的状态改动在服务端处理
AddModRPCHandler("Wyrdelyn", "rpcEventPusher", function(inst)
	inst:PushEvent("chiroptera_toggle")
end)
