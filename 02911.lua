function AddyItem_initialize()
	-------------------------------------------------------------
	--	Item	還在考慮實用性
	-------------------------------------------------------------
	AddyItemProperty = {
	--	owner_GUID
	--	index
		ORGID = EM_ItemValueType_OrgObjID,
		rune1 = EM_ItemValueType_Rune1,
		rune2 = EM_ItemValueType_Rune2,
		rune3 = EM_ItemValueType_Rune3,
		rune4 = EM_ItemValueType_Rune4,
		inherent1 = EM_ItemValueType_Inherent1,
		inherent2 = EM_ItemValueType_Inherent2,
		inherent3 = EM_ItemValueType_Inherent3,
		inherent4 = EM_ItemValueType_Inherent4,
		inherent5 = EM_ItemValueType_Inherent5,
		inherent6 = EM_ItemValueType_Inherent6,
		level = EM_ItemValueType_Level,
		durable = EM_ItemValueType_Durable,
		max_durable = EM_ItemValueType_MaxDurable
	}
	-------------------------------------------------------------
	AddyItem = AddyObject:new()
	AddyItem.class = "Item"
	function AddyItem:new(_guid, _packet_type, _index)
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if AddyItemProperty[_key] then
				if _object.owner_GUID and _object.index then
					return BuffInfo(_object.owner_GUID, _object.packet_type, _object.index, AddyItemProperty[_key])
				end
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if AddyItemProperty[_key] then
				DebugMsg(0, 0, "[ERROR] variable namespace error. " .. _key .. " is a key name of ItemProperty.")
			else
				rawset(_object, _key, _value)
			end
		end
		_inheritor.owner_GUID = _guid
		_inheritor.packet_type = _packet_type
		_inheritor.index = _index
		return _inheritor
	end

	DebugLog(2, "[ROM Class] AddyItem initialized")

end