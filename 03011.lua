function ChristineRole_initialize()
	Christine.Role = Christine.EventDispatcher:new()
	Christine.Role.class = "Role"
	function Christine.Role:new(_guid)
		local _inheritor =  {}
		if _guid then _inheritor.GUID = _guid end
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if Christine.role_get[_key] then
				return Christine.role_get[_key](_object)
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if Christine.role_set[_key] then
				Christine.role_set[_key](_object, _value)
			else
				rawset(_object, _key, _value)
			end
		end
		_inheritor:systemInit()
		return _inheritor
	end

	function Christine.Role:property(_query)
		for _key, _value in pairs(_query) do
			if Christine.role_set[_key] then Christine.role_set[_key](self, _value)
			else rawset(self, _key, _value) end
		end
		return self
	end

	function Christine.Role:say(_string, _range)
		if type(_string) ~= "string" then self:error(1, "Christine.Role:say( _string:string , _range:number )") return false end
		if _range then
			if type(_range) ~= "number" then self:error(1, "Christine.Role:say( _string:string , _range:number )") return false end
			Yell(self.GUID, tostring(_string), _range)
		else Say(self.GUID, tostring(_string)) end
		return self
	end

	function Christine.Role:tell(_target, _string)
		if not _target or not _target.isInheritorOf or not _target:isInheritorOf("Role") then self:error(1, "Christine.Role:tell( _target:Role , _string:string )") return false end
		if type(_string) ~= "string" then self:error(1, "Christine.Role:tell( _target:Role , _string:string )") return false end
		Tell(self.GUID, _target.GUID, _string)
		return self
	end

	function Christine.Role:playMotion(_motion_id)
		if type(_motion_id) ~= "number" then self:error(1, "Christine.Role:playMotion( _motion_id:number )") return false end
		PlayMotion(self.GUID, _motion_id)
		return self
	end

	function Christine.Role:changeDirection(...)
		if select("#", ...) == 1 and type(select(1, ...)) == "number" then
			AdjustDir(self.GUID, select(1, ...))
			return self
		elseif select("#", ...) == 2 and select(1, ...).isInheritorOf and select(1, ...):isInheritorOf("Role") and type(select(2, ...)) == "number" then
			AdjustFaceDir(self.GUID, select(1, ...).GUID, select(2, ...))
			return self
		else self:error(1, "Christine.Role:changeDirection( _angle:number ) or Christine.Role:changeDirection( _target:Role , _angle:number )") return false end
	end

	function Christine.Role:changePosition(_x, _y, _z, _direction)
		local _x, _y, _z, _direction = _x or 0, _y or 0, _z or 0, _direction or 0
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_direction) ~= "number" then
			self:error(1, "Christine.Role:setPosition( _x:number, _y:number, _z:number, _direction:number ")
			return false
		end
		SetPos(self.GUID, _x, _y, _z, _direction)
		return self
	end

	function Christine.Role:changeZone(_zone_id, _room_id, _x, _y, _z, _direction)
		local _zone_id, _room_id, _x, _y, _z, _direction = _zone_id or 0, _room_id or 0, _x or 0, _y or 0, _z or 0, _direction or 0
		if type(_zone_id) ~= "number" or type(_room_id) ~= "number" or type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_direction) ~= "number" then
			self:error(1, "Christine.Role:changeZone( _zone_id:number, _room_id:number, _x:number, _y:number, _z:number, _direction:number )")
			return false
		end
		ChangeZone(self.GUID, _zone_id, _room_id, _x, _y, _z, _direction)
		return self
	end

	function Christine.Role:position(_query)
		if _query.zone_id or _query.room_id then
			self:changeZone(_query.zone_id or self.zone_id, _query.room_id or self.room_id, _query.x or self.x, _query.y or self.y, _query.z or self.z, _query.direction or self.direction)
		elseif _query.x or _query.y or _query.z then
			self:changePosition(_query.x or self.x, _query.y or self.y, _query.z or self.z, _query.direction or self.direction)
		elseif _query.direction then
			self:changeDirection(_query.direction or self.direction)
		end
		return self
	end

	function Christine.Role:faceTo(_target)
		if not _target.isInheritorOf and _target:isInheritorOf("Role") then self:error(1, "Christine.Role:faceTo( _target:Role )") return false end
		self:changeDirection(_target, 0)
		return self
	end

	function Christine.Role:addToPartition(_room_id)
		local _room_id = _room_id or 0
		if type(_room_id) ~= "number" then self:error(1, "Christine.Role:addToPartition(  _room_id:number )") return false end
		AddToPartition(self.GUID, _room_id)
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.ADD_TO_PARTITION))
		return self
	end

	function Christine.Role:delFromPartition()
		DelFromPartition(self.GUID)
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.DELETE_FROM_PARTITION))
		return self
	end

	function Christine.Role:addBuff(_buff_id, _lv, _time)
		local _lv = _lv or 0
		local _time = _time or -1
		if type(_buff_id) ~= "number" or type(_lv) ~= "number" or type(_time) ~= "number" then
			self:error(1, "Christine.Role:addBuff( _buff_id:number , _lv:number , _time:number )")
			return false
		end
		AddBuff(self.GUID, _buff_id, _lv, _time)
		return self
	end

	function Christine.Role:cancelBuff(_buff_id, _dispatch_event)
		if _dispatch_event == nil then _dispatch_event = true end
		if type(_buff_id) ~= "number" or type(_dispatch_event) ~= "boolean" then self:error(1, "Christine.Role:cancelBuff( _buff_id:number , _dispatch_event:boolean )") return false end
		if _dispatch_event then CancelBuff(self.GUID, _buff_id)
		else CancelBuff_NoEvent(self.GUID, _buff_id) end
		return self
	end

	function Christine.Role:checkBuff(_buff_id)
		if CheckBuff(self.guid, _buff_id) then
			return self
		else
			return false
		end
	end

	function Christine.Role:castSpell(...)
		if select("#", ...) >= 4 then
			CastSpellPos(self.GUID, select(1, ...), select(2, ...), select(3, ...), select(4, ...), select(5, ...) or 1)
			return self
		elseif type(select(1, ...)) == "number" then
			CastSpellLV(self.GUID, self.GUID, select(1, ...), select(2, ...) or 1)
			return self
		elseif type(select(1, ...)) == "table" and select(1, ...).isInheritorOf and select(1, ...):isInheritorOf("Role") then
			CastSpellLV(self.GUID, select(1, ...).GUID, select(2, ...), select(3, ...) or 1)
			return self
		else
			self:error(1, "Christine.Role:castSpell(_magic_id:number, _lv:number) or Christine.Role:castSpell(_target:Role, _magic_id:number, _lv:number) or castSpell(_x:number, _y:number, _z:number, _magic_id:number, _lv:number)")
			return false
		end
	end

	function Christine.Role:systemCastSpell(...)
		if select("#", ...) >= 4 then
			SysCastSpellLv_Pos(self.GUID, select(1, ...), select(2, ...), select(3, ...), select(4, ...), select(5, ...) or 1)
			return self
		elseif type(select(1, ...)) == "number" then
			SysCastSpellLv(self.GUID, self.GUID, select(1, ...), select(2, ...) or 1)
			return self
		elseif select(1, ...).isInheritorOf and select(1, ...):isInheritorOf("Role") then
			SysCastSpellLv(self.GUID, select(1, ...).GUID, select(2, ...), select(3, ...) or 1)
			return self
		else
			self:error(1, "Christine.Role:castSpell(_magic_id:number, _lv:number) or Christine.Role:castSpell(_target:Role, _magic_id:number, _lv:number) or castSpell(_x:number, _y:number, _z:number, _magic_id:number, _lv:number)")
			return false
		end
	end

	function Christine.Role:interruptMagic()
		MagicInterrupt(self.GUID)
		return self
	end

	function Christine.Role:distanceTo(_target)
		if _target and _target.isInheritorOf and _target:isInheritorOf("Role") then
			return GetDistance(self.GUID, _target.GUID)
		elseif _target and _target.isInheritorOf and _target:isInheritorOf("Flag") then
			return (((self.x - _target.x)^2) + ((self.y - _target.y)^2) + ((self.z - _target.z)^2))^0.5
		elseif type(_target) == "table" and _target.x and _target.y and _target.z then
			return (((self.x - _target.x)^2) + ((self.y - _target.y)^2) + ((self.z - _target.z)^2))^0.5
		else
			self:error(1, "Christine.Role:distanceTo( _target:Role or Flag )") return false
		end
	end

	function Christine.Role:beginPlot(_function_name, _delay)
		local _delay = _delay or 0
		if type(_function_name) ~= "string" and type(_delay) ~= "number" then self:error(1, "Christine.Role:beginPlot( _function_name:string , _delay:number )") return false end
		BeginPlot(self.GUID, _function_name, _delay * 10)
		return self
	end

	function Christine.Role:callPlot(_function, ...)
		if CallPlot(self.guid, _function, ...) then
			return self
		else
			return false
		end
	end

	function Christine.Role:addTouchPlot(_callback, _range)
		local _range = _range or 0
		if type(_callback) ~= "string" or type(_range) ~= "number" then self:error(1, "Christine.Role:touchPlot( _callback:string , _range:number )") return false end
		SetPlot(self.GUID, "touch", _callback, _range)
		return self
	end

	function Christine.Role:removeTouchPlot()
		SetPlot(self.GUID, "touch", "", 0)
		return self
	end

	function Christine.Role:addRangePlot(_callback, _range)
		local _range = _range or 0
		if type(_callback) ~= "string" or type(_range) ~= "number" then self:error(1, "Christine.Role:addRangePlot( _callback:string , _range:number )") return false end
		SetPlot(self.GUID, "range", _callback, _range)
		return self
	end

	function Christine.Role:removeRangePlot()
		SetPlot(self.GUID, "range", "", 0)
		return self
	end

	function Christine.Role:addDeadPlot(_callback, _range)
		local _range = _range or 0
		if type(_callback) ~= "string" or type(_range) ~= "number" then self:error(1, "Christine.Role:addDeadPlot( _callback:string , _range:number )") return false end
		SetPlot(self.GUID, "dead", _callback, _range)
		return self
	end

	function Christine.Role:removeDeadPlot()
		SetPlot(self.GUID, "dead", "", 0)
		return self
	end

	function Christine.Role:addCollisionPlot(_callback, _range)
		local _range = _range or 0
		if type(_callback) ~= "string" or type(_range) ~= "number" then self:error(1, "Christine.Role:addCollisionPlot( _callback:string , _range:number )") return false end
		SetPlot(self.GUID, "collision", _callback, _range)
		return self
	end

	function Christine.Role:removeCollisionPlot()
		SetPlot(self.GUID, "collision", "", 0)
		return self
	end

	function Christine.Role:cursorType(_type)
		local _type = _type or 0
		if type(_type) ~= "number" then self:error(1, "Christine.Role:cursorType( _type:number )") return false end
		SetCursorType(self.GUID, _type)
		return self
	end

	 function Christine.Role:idleMotion(_type)
		local _type = _type or 0
		if type(_type) ~= "number" then self:error(1, "Christine.Role:idleMotion( _type:number )") return false end
		SetIdleMotion(self.GUID, _type)
		return self
	end

	function Christine.Role:lockhp(_hp, _function_name)
		if type(_hp) ~= "number" or type(_function_name) ~= "string" then self:error(1, "Christine.Role:lockhp( _hp:number , _function_name:string )") return false end
		LockHP(self.GUID, _hp, _function_name)
		return self
	end

	function Christine.Role:unlockhp()
		LockHP(self.GUID, 0, "")
		return self
	end

	function Christine.Role:kill(_target)
		local _target = _target or self
		if not _target.isInheritorOf or not _target:isInheritorOf("Role") then self:error(1, "Christine.Role:kill( _target:Role )") return false end
		KillID(self.GUID, _target.GUID)
		return self
	end

	function Christine.Role:setFlag(_flag_id, _value)
		SetFlag(self.GUID, _flag_id, _value)
		return self
	end

	function Christine.Role:show_to_room(room_id)
		Show(self.GUID, room_id)
		return self
	end

	function Christine.Role:hide_from_room()
		Hide(self.GUID)
		return self
	end

	function Christine.Role:scriptMessage(msg, opt)
		local opt = opt or {}
		local target = opt.target or { guid = 0 }
		ScriptMessage(self.GUID, target.guid, opt.type or 3, msg, opt.color or 0)
		return self
	end

	DebugLog(2, "[Christine Class] Role initialized")
end