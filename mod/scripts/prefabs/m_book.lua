local assets = {
	Asset("ANIM", "anim/m_book.zip"),
}

local function OnReadBook(inst, doer) end

-- 物品主函数（创建实体）
local function fn()
	-- 创建一个新实体
	local inst = CreateEntity()

	-- 给实体添加基础组件
	inst.entity:AddTransform() -- 位置变换组件（必须有）
	inst.entity:AddAnimState() -- 动画显示组件
	inst.entity:AddNetwork() -- 网络同步组件（联机必备）
	inst.entity:AddSoundEmitter() -- 声音播放组件

	-- 设置物品物理属性（背包可拾取）
	MakeInventoryPhysics(inst)

	-- 设置动画
	inst.AnimState:SetBank("m_book") -- 动画Bank名
	inst.AnimState:SetBuild("m_book") -- 动画素材名
	inst.AnimState:PlayAnimation("idle") -- 播放动画

	-- 设置物品漂浮效果
	MakeInventoryFloatable(inst, "small")

	-- 注释掉的标签（原作者备用）
	--inst:AddTag("lg_danyao")

	-- 网络同步初始化完成
	inst.entity:SetPristine()

	-- 客户端只负责显示，不执行逻辑
	if not TheWorld.ismastersim then
		return inst
	end

	------------------------------------------
	-- 以下是 服务端 逻辑组件
	------------------------------------------

	-- 添加可检查组件（能鼠标查看）
	inst:AddComponent("inspectable")

	-- 添加背包物品组件
	inst:AddComponent("inventoryitem")
	-- 设置背包图标名称
	inst.components.inventoryitem.imagename = "m_book"
	-- 设置背包图标所在图集路径
	inst.components.inventoryitem.atlasname = "images/inventoryimages/m_book.xml"

	-- 添加可擦除纸张组件
	inst:AddComponent("erasablepaper")

	-- 添加简易书本组件（支持右键阅读）
	inst:AddComponent("simplebook")
	-- 设置阅读触发函数
	inst.components.simplebook.onreadfn = OnReadBook

	-- 注释掉的堆叠组件（原作者不想让它堆叠）
	--inst:AddComponent("stackable")
	--inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

	-- 设置可被鬼魂作祟（游戏标准逻辑）
	MakeHauntableLaunch(inst)

	-- 返回创建好的实体
	return inst
end

-- 注册该物品到游戏
return Prefab("m_book", fn, assets)
