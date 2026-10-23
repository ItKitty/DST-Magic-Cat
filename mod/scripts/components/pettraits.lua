local Pettraits = Class(function(self, inst)
	self.inst = inst
end)

function Pettraits:AddFx3(inst, fx, body)
	if inst.addfx3 == nil then
		inst.addfx3 = SpawnPrefab(fx)
		-- inst.addfx3.Transform:SetScale(2.5, 2.5, 2.5)
		inst.addfx3.entity:AddFollower()
	end
	inst.addfx3.entity:SetParent(inst.entity)
	inst.addfx3.Follower:FollowSymbol(inst.GUID, body, 0, 0, 0)
end
function Pettraits:AddFx2(inst, fx, body)
	if inst.addfx2 == nil then
		inst.addfx2 = SpawnPrefab(fx)
		inst.addfx2.Transform:SetScale(2.5, 2.5, 2.5)
		inst.addfx2.entity:AddFollower()
	end
	inst.addfx2.entity:SetParent(inst.entity)
	inst.addfx2.Follower:FollowSymbol(inst.GUID, body, 0, 0, 0)
end

function Pettraits:AddFx(inst, fx, body)
	if inst.addfx == nil then
		inst.addfx = SpawnPrefab(fx)
		inst.addfx.entity:AddFollower()
	end
	inst.addfx.entity:SetParent(inst.entity)
	inst.addfx.Follower:FollowSymbol(inst.GUID, body, 0, 0, 0)
end

return Pettraits
