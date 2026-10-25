-- m_petleash
-- 玛德琳专属宠物的「牵引绳」：负责生成、跟随、存档与清理。
-- 特意不复用原版 petleash：原版那套按 prefab 限制小动物数量，
-- 用了会挤占玩家召唤其它宠物的名额，这里独立记一份就不会互相影响。

local m_petleash = Class(function(self, inst)
	self.inst = inst

	self.petprefab = "m_kitcoon"
	self.pets = {}
	self.maxpets = 1
	self.numpets = 0

	self.onspawnfn = nil
	self.ondespawnfn = nil

	self._onremovepet = function(pet)
		if pet.components.container ~= nil then
			pet.components.container:Close()
			pet.components.container.canbeopened = false
			pet.components.container:DropEverything()
		end
		if self.pets[pet] ~= nil then
			self.pets[pet] = nil
			self.numpets = self.numpets - 1
		end
	end
end)

function m_petleash:SetPetPrefab(prefab)
	self.petprefab = prefab
end

function m_petleash:SetOnSpawnFn(fn)
	self.onspawnfn = fn
end

function m_petleash:SetOnDespawnFn(fn)
	self.ondespawnfn = fn
end

function m_petleash:IsFull()
	return self.numpets >= self.maxpets
end

function m_petleash:GetPets()
	return self.pets
end

function m_petleash:GetFirstPet()
	for _, pet in pairs(self.pets) do
		return pet
	end
	return nil
end

local function LinkPet(self, pet)
	self.pets[pet] = pet
	self.numpets = self.numpets + 1
	self.inst:ListenForEvent("onremove", self._onremovepet, pet)
	pet.persists = false

	if self.inst.components.leader ~= nil then
		self.inst.components.leader:AddFollower(pet)
	elseif pet.components.follower ~= nil then
		pet.components.follower:SetLeader(self.inst)
	end
end

function m_petleash:SpawnPetAt(x, y, z, prefaboverride, skin)
	local petprefab = prefaboverride or self.petprefab
	if self.numpets >= self.maxpets or petprefab == nil then
		return nil
	end

	local pet = SpawnPrefab(petprefab, skin, nil, self.inst.userid)
	if pet == nil then
		return nil
	end

	LinkPet(self, pet)

	if pet.Physics ~= nil then
		pet.Physics:Teleport(x, y, z)
	elseif pet.Transform ~= nil then
		pet.Transform:SetPosition(x, y, z)
	end

	local fx = SpawnPrefab("spawn_fx_small")
	if fx ~= nil then
		fx.Transform:SetPosition(pet.Transform:GetWorldPosition())
		fx.Transform:SetRotation(pet.Transform:GetRotation())
	end

	if self.onspawnfn ~= nil then
		self.onspawnfn(self.inst, pet)
	end

	return pet
end

-- 出生自带：没有存档里的宠物时，在身边生成一只
function m_petleash:EnsurePet()
	if self.numpets >= self.maxpets then
		return self:GetFirstPet()
	end
	if self.inst.components.health ~= nil and self.inst.components.health:IsDead() then
		return nil
	end
	if self.inst:HasTag("playerghost") then
		return nil
	end

	local pt = self.inst:GetPosition()
	local offset = FindWalkableOffset(pt, math.random() * 2 * PI, 2, 8, true, true)
	if offset ~= nil then
		pt = pt + offset
	end

	return self:SpawnPetAt(pt.x, 0, pt.z)
end

function m_petleash:DespawnPet(pet)
	if self.pets[pet] ~= nil then
		if self.ondespawnfn ~= nil then
			self.ondespawnfn(self.inst, pet)
		else
			pet:Remove()
		end
	end
end

function m_petleash:DespawnAllPets()
	local toremove = {}
	for _, pet in pairs(self.pets) do
		table.insert(toremove, pet)
	end
	for _, pet in ipairs(toremove) do
		self:DespawnPet(pet)
	end
end

function m_petleash:OnSave()
	if next(self.pets) ~= nil then
		local data = {}
		for _, pet in pairs(self.pets) do
			pet.temp_save_platform_pos = true
			local saved = pet:GetSaveRecord()
			pet.temp_save_platform_pos = nil
			table.insert(data, saved)
		end
		return { pets = data }
	end
end

function m_petleash:OnLoad(data)
	if data ~= nil and data.pets ~= nil then
		for _, record in ipairs(data.pets) do
			record.is_snapshot_save_record = self.inst.is_snapshot_user_session
			local pet = SpawnSaveRecord(record)
			record.is_snapshot_save_record = nil
			if pet ~= nil then
				LinkPet(self, pet)
				if self.onspawnfn ~= nil then
					self.onspawnfn(self.inst, pet)
				end
			end
		end
		if self.inst.migrationpets ~= nil then
			for _, pet in pairs(self.pets) do
				table.insert(self.inst.migrationpets, pet)
			end
		end
	end
end

function m_petleash:OnRemoveFromEntity()
	for _, pet in pairs(self.pets) do
		self.inst:RemoveEventCallback("onremove", self._onremovepet, pet)
	end
end

m_petleash.OnRemoveEntity = m_petleash.DespawnAllPets

return m_petleash
