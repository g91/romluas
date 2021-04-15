function AddyTeamMove_initialize()
	AddyTeamMove = AddyEventDispatcher:new()
	AddyTeamMove.class = "TeamMove"
	AddyTeamMoveEvent = AddyEvent:new()
	AddyTeamMoveEvent.Arrived = "AddyTeamMoveEvent_Arrived"
	AddyTeamMoveEvent.AllArrived = "AddyTeamMoveEvent_AllArived"
	function AddyTeamMove:new(_flag_group)
		if not _flag_group or not _flag_group.isInheritorOf or not _flag_group:isInheritorOf("FlagGroup") then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeamMove:new( _flag_group:FlagGroup )")
			return
		end
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		_inheritor.route_flag = _flag_group
		_inheritor.move_tolerance = 25 
		_inheritor.ai_tolerance = 25
		_inheritor.is_active = false
		_inheritor.is_all_arrived = false
		_inheritor.delay = 1
		_inheritor.npcs = {}
		return _inheritor
	end
	function AddyTeamMove:add(_role)
		if not _role.isInheritorOf or not _role:isInheritorOf("Npc") then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeamMove:add( _role:Role )")
			return
		end
		if not self.npcs then self.npcs = {} end
		_role.move_target = nil
		self.is_all_arrived = false
		table.insert(self.npcs, _role)
	end
	function AddyTeamMove:remove(_role)
		if not self.npcs then return end
		if not _role.isInheritorOf and not _role:isInheritorOf("Role") then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeamMove:add( _role:Role )")
			return
		end
		for index, npc in pairs(self.npcs) do
			if npc == _role then table.remove(self.npcs, index) end
		end
	end
	function AddyTeamMove:start()
		local guid_maker = AddyGUIDMaker:new()
		self.GUID = guid_maker:produce()
		if not AddyGlobalTeamMove then AddyGlobalTeamMove = {} end
		AddyGlobalTeamMove[self.GUID] = self
		self.is_active = true
		CallPlot(self.GUID, "AddyTeamMoveLoop")
	end
	function AddyTeamMove:stop()
		local guid_maker = AddyGUIDMaker:new()
		AddyGlobalTeamMove[self.GUID] = nil
		guid_maker:recover(self.GUID)
		self.is_active = false
	end
	function AddyTeamMoveLoop()
		local self = AddyGlobalTeamMove[OwnerID()]
		while self.is_active do
			for index, npc in pairs(self.npcs) do
				if npc.hp <= 0 or not CheckID(npc.GUID) then
					npc:dispatchEvent(AddyEvent:new(AddyRoleEvent.Die))
					table.remove(self.npcs, index)
				elseif not npc.hate_list or #npc.hate_list <= 0 then
					if not npc.move_target then npc.move_target = 1 end
					for flag_index, flag in ipairs(self.route_flag) do
						if flag:distanceTo(npc) < self.route_flag[npc.move_target]:distanceTo(npc) and flag_index > npc.move_target then npc.move_target = flag_index end
					end
					if self.route_flag[npc.move_target]:distanceTo(npc) < self.ai_tolerance then npc.move_target = npc.move_target + 1 end
					if npc.move_target > #self.route_flag then
						npc.move_target = nil
						npc:dispatchEvent(AddyEvent:new(AddyTeamMoveEvent.Arrived))
						table.remove(self.npcs, index)
					else npc:move(self.route_flag[npc.move_target].x - self.move_tolerance + RandRange(1, self.move_tolerance * 2), self.route_flag[npc.move_target].y, self.route_flag[npc.move_target].z - self.move_tolerance + RandRange(1, self.move_tolerance * 2), 0) end
				else npc.move_target = nil end
			end
			if not self.is_all_arrived and #self.npcs <= 0 then
				is_all_arrived = true
				self:dispatchEvent(AddyEvent:new(AddyTeamMoveEvent.AllArrived))
			end
			Sleep(self.delay * 10)
		end
	end
	DebugLog(2, "[ROM Class] AddyTeamMove initialized")
end