local assets = {
	Asset("ANIM", "anim/charlieresidue.zip"),
}

local prefabs = {
	"charlie_snap",
	"charlie_snap_solid",
}

-- 创建视觉特效实体（所有人都能看到）
local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork() -- 添加网络组件让所有人同步

	inst.AnimState:SetBank("charlieresidue")
	inst.AnimState:SetBuild("charlieresidue")
	inst.AnimState:PlayAnimation("pre")
	inst.AnimState:PushAnimation("idle", true) -- true表示循环播放
	inst.AnimState:Hide("mouseover")
	inst.AnimState:SetFinalOffset(7)

	-- 添加基础标签
	inst:AddTag("FX") -- 标记为特效
	inst:AddTag("NOCLICK") -- 不可点击
	inst:AddTag("NOBLOCK") -- 不可阻挡

	inst.entity:SetPristine()

	-- 如果不是服务器，直接返回（客户端会自动同步）
	if not TheWorld.ismastersim then
		return inst
	end

	-- 服务器逻辑
	inst.persists = false -- 不保存到存档

	-- 消散函数（供外部调用）
	function inst:Decay()
		if not self._decaying then
			self._decaying = true
			self.AnimState:PlayAnimation("pst")
			self:ListenForEvent("animover", function()
				self:Remove()
			end)
		end
	end

	return inst
end

return Prefab("fx_restriction", fn, assets, prefabs)
