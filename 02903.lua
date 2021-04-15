function AddyNpc_initialize()
	-------------------------------------------------------------
	--	Npc
	-------------------------------------------------------------
	AddyNpc = AddyRole:new()
	AddyNpc.class = "Npc"
	-- ///物件移動
	function AddyNpc:move(_x, _y, _z, _delay)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyNpc:move( _x:number, _y:number, _z:number, _delay:number )")
			return
		end
		local _moving_time = Move(self.GUID, _x, _y, _z)
		local _delay = _delay or _moving_time
		Sleep(_delay)
	end
	function AddyNpc:moveDirect(_x, _y, _z, _delay)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyNpc:move( _x:number, _y:number, _z:number, _delay:number )")
			return
		end
		local _moving_time = MoveDirect(self.GUID, _x, _y, _z)
		local _delay = _delay or _moving_time
		Sleep(_delay)
	end
	function AddyNpc:stopMove(_immediately)
		local _immediately = _immediately or false
		StopMove(self.GUID, _immediately)
	end
	function AddyNpc:setFollow(_target)
		local _target = _target
		if type(_target) == "table" then _target = _target.GUID end
		SetFollow(self.GUID, _target)
	end
	-- ///物件處理
	function AddyNpc:create(_org_id, _x, _y, _z, _direction)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		local _direction = _direction or 0
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_direction) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyNpc:create( _org_id:number, _x:number, _y:number, _z:number, _direction:number )")
			return
		end
		self.GUID = CreateObj(_org_id, _x, _y, _z, _direction, 1)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.Create))
	end
	function AddyNpc:delete()
		DelObj(self.GUID)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.Delete))
	end
	function AddyNpc:reset()
		ReSetNPCInfo(self.GUID)
	end
	function AddyNpc:attack(_target)
		local _target = _target
		if type(_target) == "table" then _target = _target.GUID end
		SetAttack(self.GUID, _target)
	end
	function AddyNpc:stopAttack()
		SetStopAttack(self.GUID)
	end
	function AddyNpc:addTouchListener(_function_name, _range)
		if not _function_name or not _range then DebugMsg(0, 0, "[ERROR] arguments error : AddyNpc:addTouchListener( function_name:String, range:Number )") end
		SetPlot(self.GUID, "touch", _function_name, _range)
	end
	function AddyNpc:removeTouchListener()
		SetPlot(self.GUID, "touch", "", 0)
	end

	DebugLog(2, "[ROM Class] AddyNpc initialized")

end