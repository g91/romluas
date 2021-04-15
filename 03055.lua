function ChristineFlagGroup_initialize()
	Christine.FlagGroup = Christine.Object:new()
	Christine.FlagGroup.class = "FlagGroup"
	function Christine.FlagGroup:new(_id)
		if type(_id) ~= "number" then
			self:error(1, "Christine.FlagGroup:new( _id:number )") return false
		end
		local _inheritor = {}
		_inheritor.id = _id
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		_inheritor:initialize()
		return _inheritor
	end
	function Christine.FlagGroup:initialize()
		self.count = GetMoveFlagCount(self.id)
		for index = 0, self.count - 1 do
			self[index] = Christine.Flag:new(self.id, index)
		end
	end

	DebugLog(2, "[Christine Class] FlagGroup initialized")
end