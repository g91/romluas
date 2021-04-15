function AddyTeam_initialize()
	AddyTeam = AddyEventDispatcher:new()
	AddyTeam.class = "TeamMove"
	AddyTeamEvent = AddyEvent:new()
	AddyTeamEvent.ChangeAttackTarget = "AddyTeamEvent_ChangeAttackTarget"
	function AddyTeam:new()
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		return _inheritor
	end
	function AddyTeam:add(_npc)
		if not _npc.isInheritorOf and not _npc:isInheritorOf ("Npc") then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeam:add( _npc:Npc )")
			return
		end
		if not self.npcs then self.npcs = {} end
		table.insert(self.npcs, _npc)
	end
	function AddyTeam:remove(_npc)
		if not _npc.isInheritorOf and not _npc:isInheritorOf ("Npc") then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeam:remove( _npc:Npc )")
			return
		end
		if not self.npcs then return end
		for index, npc in pairs(self.npcs) do
			if npc == _npc then table.remove(self.npcs, index) end
		end
	end
	function AddyTeam:attack(_target)
		if not _target.isInheritorOf and not _target:isInheritorOf("Role") then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeam:attack( _target:Role )")
			return
		end
		self.attack_target = _target
		self:dispatchEvent(AddyTeamEvent:new(AddyTeamEvent.ChangeAttackTarget))
		for index, npc in pairs(self.npcs) do npc:attack(self.attack_target) end
	end
	function AddyTeam:move(_x, _y, _z, _delay)
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_delay) ~= "number" then
			DebugMsg(0, 0, "[ERROR] arguments error. AddyTeam:move( _x:number, _y:number, _z:number[, _delay:number] )")
			return
		end
		for index, npc in pairs(self.npcs) do npc:move(_x, _y, _z, 0) end
		if not _delay then _delay = npcs[1]:move(_x, _y, _z)
		else Sleep(_delay) end
	end
	DebugLog(2, "[ROM Class] AddyTeam initialized")
end