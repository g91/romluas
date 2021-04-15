function AddyObject_initialize()
	-------------------------------------------------------------
	--	Object
	-------------------------------------------------------------
	AddyObject = {}
	AddyObject.class = "Object"
	function AddyObject:new()
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		return _inheritor
	end
	function AddyObject:isInheritorOf(_class_name)
		local mt = self
		local result = false
		while mt and not result do
			if mt.class == _class_name then result = true end
			mt = getmetatable(mt)
		end
		return result
	end
	function AddyObject:copy()
		return copy(self)
	end

	DebugLog(2, "[ROM Class] AddyObject initialized")
end