function AddySystem_initialize()
	-------------------------------------------------------------
	--	System
	-------------------------------------------------------------
	AddySystem = AddyEventDispatcher:new()
	AddySystem.class = "System"
	function AddySystem:new(_name)
		if not _name then DebugMsg(0, 0, "[ERROR] arguments error. AddySystem:new( _name:string )") end
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		_inheritor.name = _name
		_inheritor.alpha = false
		_inheritor.beta = false
		_inheritor.delay = 1
		_inheritor.recipients = {}
		DebugLog(2, _name .. " : AddySystem has build.")
		DebugMsg(0, 0, _name .. " : AddySystem has build.")
		return _inheritor
	end
	function AddySystem:debug(_msg)
		if not self.beta then return end
		if self.recipients[ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)] then
			local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
			DebugMsg(self.recipients[room_id].GUID, self.recipients[room_id].room_id, "[" .. self.name .. "] [" .. room_id .. "] " .. _msg)
		else DebugMsg(0, 0, "[" .. self.name .. "] [" .. ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) .. "] " .. _msg) end
	end
	function AddySystem:log(_msg, _level)
		local _level = _level or 2
		Debuglog(_level, "[" .. self.name .. "] [" .. ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) .. "] " .. _msg)
	end
	function AddySystem:sleep(_delay)
		local _delay = _delay or self.delay
		Sleep(_delay * 10)
	end
	function AddySystem:addRoomRecipient(_room_id, _player)
		self.recipients[_room_id] = _player
	end

	DebugLog(2, "[ROM Class] AddySystem initialized")
end