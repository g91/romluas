function AddyBuff_initialize()
	-------------------------------------------------------------
	--	Buff	
	-------------------------------------------------------------
	AddyBuffProperty = {
	--	owner_GUID
	--	index
		caster_GUID = EM_BuffInfoType_OwnerID,
		ORGID = EM_BuffInfoType_BuffID,
		time = EM_BuffInfoType_Time,
		power = EM_BuffInfoType_Power,
		point = EM_BuffInfoType_Point
	}
	-------------------------------------------------------------
	AddyBuff = AddyObject:new()
	AddyBuff.class = "Buff"
	function AddyBuff:new(_guid, _index)
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if AddyBuffProperty[_key] then
				if _object.owner_GUID and _object.index then
					return BuffInfo(_object.owner_GUID, _object.index, AddyBuffProperty[_key])
				end
			elseif _key == "is_good_buff" then
				return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner_GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 0)
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if AddyBuffProperty[_key] and _key == "is_good_buff" then
				DebugMsg(0, 0, "[ERROR] variable namespace error. " .. _key .. " is a key name of BuffProperty.")
			else
				rawset(_object, _key, _value)
			end
		end
		_inheritor.owner_GUID = _guid
		_inheritor.index = _index
		return _inheritor
	end
	function AddyBuff:remove()
		CancelBuff(self.owner_GUID, ORGID)
	end

	DebugLog(2, "[ROM Class] AddyBuff initialized")
end