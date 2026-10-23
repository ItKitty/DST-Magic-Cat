local function OnAmuletTraits(self, inst)
	local data = self._data:value()
	if data ~= nil then
		self.data = json.decode(data)
	end
end

local Amulettraits = Class(function(self, inst)
	self.inst = inst
	self._data = net_string(inst.GUID, "m_amulet.traits", "OnAmuletTraits")

	self.inst:ListenForEvent("OnAmuletTraits", function(inst)
		OnAmuletTraits(self, inst)
	end)
end)

function Amulettraits:SyncData(data)
	self._data:set(data)
end

function Amulettraits:GetData()
	return self.data or {}
end

return Amulettraits
