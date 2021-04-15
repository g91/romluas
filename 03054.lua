function ChristineFlag_initialize()
	Christine.flag_get = {
		x = function(_object) return GetMoveFlagValue(_object.id, _object.index, EM_RoleValue_X) end,
		y = function(_object) return GetMoveFlagValue(_object.id, _object.index, EM_RoleValue_Y) end,
		z = function(_object) return GetMoveFlagValue(_object.id, _object.index, EM_RoleValue_Z) end,
		direction = function(_object) return GetMoveFlagValue(_object.id, _object.index, EM_RoleValue_Dir) end
	}

	Christine.Flag = Christine.Object:new()
	Christine.Flag.class = "Flag"
	function Christine.Flag:new(_id, _index)
		if type(_id) ~= "number" or type(_index) ~= "number" then self:error(1, "Christine.Flag:new( _id:number, _index:number)") return false end
		local _inheritor =  {}
		_inheritor.id = _id
		_inheritor.index = _index
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if Christine.flag_get[_key] then
				return Christine.flag_get[_key](_object)
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if Christine.flag_get[_key] then
				_object:error(2, "property of flag is read only")
			else
				rawset(_object, _key, _value)
			end
		end
		return _inheritor
	end

	function Christine.Flag:distanceTo(_target)
		if _target and _target.isInheritorOf and (_target:isInheritorOf("Flag") or _target:isInheritorOf("Role")) then
			return (((self.x - _target.x)^2) + ((self.y - _target.y)^2) + ((self.z - _target.z)^2))^0.5
		else
			self:error(1, "Christine.Flag:distanceTo( _role:Role or Flag )") return false
		end
	end

	DebugLog(2, "[Christine Class] Flag initialized")
end