function AddyFlagGroup_initialize()
	-------------------------------------------------------------
	--	FlagGroup & Flag	2013/4/7 editing
	-------------------------------------------------------------
	AddyFlagGroup = AddyObject:new()
	AddyFlagGroup.class = "FlagGroup"
	function AddyFlagGroup:new(_id)
		if not _id then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyFlagGroup:new( _id:number )")
			return false
		end
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		_inheritor.id = _id
		_inheritor:initialize()
		return _inheritor
	end
	function AddyFlagGroup:initialize()
		self.count = GetMoveFlagCount(self.id)
		for index = 0, self.count - 1 do
			self[index] = AddyFlag:new(self.id, index)
		end
	end

	DebugLog(2, "[ROM Class] AddyFlagGroup initialized")

end