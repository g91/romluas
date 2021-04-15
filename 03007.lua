function ChristineSystem_initialize()

	Christine.System = Christine.EventDispatcher:new()
	Christine.System.class = "System"

	function Christine.System:new(_name, _alpha, _beta)
		if type(_name) ~= "string" then self:error(1, "Christine.System:new( _name:string )") return false end
		local _inheritor = {}
		_inheritor.name = _name
		_inheritor.alpha = _alpha or false
		_inheritor.beta = _beta or false
		_inheritor.delay = 1
		_inheritor.recipients = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		_inheritor:debug("create")
		return _inheritor
	end

	function Christine.System:debug(_message)
		if not self.beta then return false end
		if self.recipients[ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)] then
			local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
			DebugMsg(self.recipients[room_id].GUID, self.recipients[room_id].room_id, "[" .. self.name .. "] [" .. room_id .. "] " .. _message or "")
		else
			DebugMsg(0, 0, "[" .. self.name .. "] [" .. ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) .. "] " .. _message or "")
		end
		return self
	end

	function Christine.System:log(_message, _level)
		Debuglog(_level or 2, "[" .. self.name .. "] [" .. ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) .. "] " .. _message or "")
		return self
	end

	function Christine.System:sleep(_delay)
		Sleep((_delay or self.delay) * 10)
		return self
	end

	function Christine.System:addRoomRecipient(_room_id, _player)
		self.recipients[_room_id] = _player
		return self
	end

	DebugLog(2, "[Christine Class] System initialized")
end