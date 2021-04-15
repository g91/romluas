function AddyFlag_initialize()
	-------------------------------------------------------------
	AddyFlagProperty = {
		x = EM_RoleValue_X,
		y = EM_RoleValue_Y,
		z = EM_RoleValue_Z,
		direction = EM_RoleValue_Dir
	}
	-------------------------------------------------------------
	AddyFlag = AddyObject:new()
	AddyFlag.class = "Flag"
	function AddyFlag:new(_id, _index)
		if not _id or not _index then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyFlag:new( _id:number, _index:number)")
			return false
		end
		local _inheritor =  {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if AddyFlagProperty[_key] then
				return GetMoveFlagValue(_object.id, _object.index, AddyFlagProperty[_key])
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if AddyFlagProperty[_key] then
				DebugMsg(0, 0, "[ERROR] variable namespace error. " .. _key .. " is a key name of FlagProperty.")
				return
			else
				rawset(_object, _key, _value)
				return
			end
		end
		_inheritor.id = _id
		_inheritor.index = _index
		return _inheritor
	end

	function AddyFlag:distanceTo(_role)
		if not _role or not _role.isInheritorOf or not _role:isInheritorOf("Role") then
			DebugMsg(0, 0, "[ERROR] arguments type error. AddyFlag:distanceTo( _role:AddyRole )")
			return false
		end
		local delta_x = (self.x - _role.x)^2
		local delta_y = (self.y - _role.y)^2
		local delta_z = (self.z - _role.z)^2
		return (delta_x + delta_y + delta_z)^0.5
	end

	DebugLog(2, "[ROM Class] AddyFlag initialized")

end