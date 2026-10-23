-- events.lua - 事件处理系统

-- 宠物系统事件
local function OnMakePet(inst, pet)
	if pet.prefab == "m_lightpet" then
		SpawnPrefab("archive_lockbox_player_fx").Transform:SetPosition(pet.Transform:GetWorldPosition())
	elseif pet.prefab == "m_darkpet" then
		SpawnPrefab("shadow_shield2").Transform:SetPosition(pet.Transform:GetWorldPosition())
	end
	inst.components.leader:AddFollower(pet)
	inst:AddDebuff("buff_" .. pet.prefab, "buff_" .. pet.prefab)
end

-- 初始化玩家事件监听
AddPlayerPostInit(function(inst)
	if not TheWorld.ismastersim then
		return
	end

	inst:DoTaskInTime(0, function()
		if inst.components.petleash == nil then
			inst:AddComponent("petleash")
		end

		local petleash = inst.components.petleash
		petleash:SetOnSpawnFn(OnMakePet)
		petleash:SetMaxPetsForPrefab("m_lightpet", 1)
		petleash:SetMaxPetsForPrefab("m_darkpet", 1)

		inst:ListenForEvent("ms_playerreroll", function()
			for _, v in pairs(inst.components.petleash:GetPets()) do
				if v:HasTag("m_pet") then
					v:RemoveMPets()
				end
			end
		end)

		inst:ListenForEvent("death", function()
			for _, v in pairs(inst.components.petleash:GetPets()) do
				if v:HasTag("m_pet") then
					v:RemoveMPets()
				end
			end
		end)
	end)
end)
