-- m_lunge_mirage
-- 穿刺（combat_lunge）的「留影」：复制施法者本人的 build，定格在 lunge_pst 的某一帧，半透明淡出。
-- 思路照石虾王 rocky_boss.lua:262-374 的 mirage：
--   非持久化 FX、复制本体贴图、SetFrame 定格姿势、alpha 渐隐。
-- 区别：
--   · 石虾王的冲刺是连续位移，可以每帧采样；玩家穿刺是一帧内 Teleport，
--     所以在 systems/vanilla_hooks.lua 里按「起点 -> 落点」插值生成。
--   · 这里用 net_string/net_byte 把 build 与定格帧同步给客户端，
--     这样联机时别人也看得到同一套外观（石虾王是纯客户端本地生成）。

local FADE_TIME = 0.35
local START_ALPHA = 0.5

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")
	inst:AddTag("nointerpolate")

	inst.Transform:SetFourFaced()

	-- 服务器写、客户端读：本体 build 名 + 定格帧
	inst._build = net_string(inst.GUID, "m_lunge_mirage.build", "m_lunge_mirage.dirty")
	inst._frame = net_byte(inst.GUID, "m_lunge_mirage.frame", "m_lunge_mirage.dirty")

	inst.AnimState:SetBank("wilson")
	inst.AnimState:PlayAnimation("lunge_pst")
	inst.AnimState:SetMultColour(1, 1, 1, START_ALPHA)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		-- 客户端：网络值到了就套用外观
		local function Apply(inst2)
			local build = inst2._build:value()
			if build ~= nil and build ~= "" then
				inst2.AnimState:SetBuild(build)
			end
			inst2.AnimState:PlayAnimation("lunge_pst")
			inst2.AnimState:SetFrame(inst2._frame:value())
			inst2.AnimState:Pause()
		end

		inst:ListenForEvent("m_lunge_mirage.dirty", Apply)
		-- 进服时网络值可能稍后才到，补一次
		inst:DoTaskInTime(0.1, Apply)

		-- 客户端自己做淡出（服务器会在同一时间删除实体）
		inst._alpha = START_ALPHA
		inst:DoPeriodicTask(1 / 20, function(inst2, dt)
			inst2._alpha = (inst2._alpha or START_ALPHA) - dt * (START_ALPHA / FADE_TIME)
			if inst2._alpha > 0 then
				inst2.AnimState:SetMultColour(1, 1, 1, inst2._alpha)
			end
		end, 1 / 20, 1 / 20)

		return inst
	end

	-- 服务器：设置外观数据，到时间删除
	inst.persists = false

	function inst:SetMirageData(build, frame)
		self._build:set(build or "")
		self._frame:set(math.max(0, math.min(255, frame or 0)))
	end

	inst:DoTaskInTime(FADE_TIME, function(inst2)
		if inst2:IsValid() then
			inst2:Remove()
		end
	end)

	return inst
end

return Prefab("m_lunge_mirage", fn)
