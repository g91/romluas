function AddyEvent_initialize()
	-------------------------------------------------------------
	--	Event
	-------------------------------------------------------------
	AddyEvent = AddyObject:new()
	AddyEvent.class = "Event"
	function AddyEvent:new(_type)
		local _inheritor = {}
		_inheritor.type = _type
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		return _inheritor
	end

	DebugLog(2, "[ROM Class] AddyEvent initialized")
end