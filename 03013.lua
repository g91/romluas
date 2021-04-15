function ChristineNpc_initialize()
	Christine.Npc = Christine.Role:new()
	Christine.Npc.class = "Npc"

	function Christine.Npc:initialize()
		
	end

	function Christine.Npc:move(_x, _y, _z, _delay)
		local _x, _y, _z, _delay = _x or 0, _y or 0, _z or 0, _delay or false
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_delay) ~= "boolean" then
			self:error(1, "Christine.Npc:move( _x:number, _y:number, _z:number, _delay:boolean )") return false
		end
		if _delay then Sleep(Move(self.GUID, _x, _y, _z)) else Move(self.GUID, _x, _y, _z) end
		return self
	end

	function Christine.Npc:moveDirect(_x, _y, _z, _delay)
		local _x, _y, _z, _delay = _x or 0, _y or 0, _z or 0, _delay or false
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_delay) ~= "boolean" then
			self:error(1, "Christine.Npc:moveDirect( _x:number, _y:number, _z:number, _delay:boolean )") return false
		end
		if _delay then Sleep(MoveDirect(self.GUID, _x, _y, _z)) else MoveDirect(self.GUID, _x, _y, _z) end
	end

	function Christine.Npc:stopMove(_immediately)
		StopMove(self.GUID, _immediately or false)
		return self
	end

	function Christine.Npc:follow(_target)
		if not _target.isInheritorOf or not target:isInheritorOf("Role") then self:error(1, "Christine.Npc:follow( _target:Role )") return false end
		SetFollow(self.GUID, _target.GUID)
		return self
	end

	function Christine.Npc:create(_org_id, _x, _y, _z, _direction)
		local _x, _y, _z, _direction = _x or 0, _y or 0, _z or 0, _direction or 0
		if type(_org_id) ~= "number" or type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_direction) ~= "number" then
			self:error(1, "Christine.Npc:create( _org_id:number, _x:number, _y:number, _z:number, _direction:number )") return false
		end
		self.GUID = CreateObj(_org_id, _x, _y, _z, _direction, 1)
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.CREATE))
		return self
	end

	function Christine.Npc:delete()
		DelObj(self.GUID)
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.DELETE))
		return self
	end

	function Christine.Npc:reset()
		ReSetNPCInfo(self.GUID)
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.RESET))
		return self
	end

	function Christine.Npc:attack(_target)
		if not _target.isInheritorOf or not _target:isInheritorOf("Role") then self:error(1, "Christine.Npc:attack( _target:Role )") return false end
		SetAttack(self.GUID, _target.GUID)
		return self
	end

	function Christine.Npc:stopAttack()
		SetStopAttack(self.GUID)
		return self
	end

	function Christine.Npc:addSpeakOption(_query)
		AddSpeakOption(_query.target or OwnerID(), self.GUID, _query.string or "", _query.callback or "", _query.icon_id or 0)
		return self
	end

	function Christine.Npc:closeSpeak()
		CloseSpeak(OwnerID())
		return self
	end

	function Christine.Npc:setSpeakDetail(_string)
		SetSpeakDetail(OwnerID(), _string or "")
		return self
	end

	function Christine.Npc:loadQuestOption()
		LoadQuestOption(OwnerID())
		return self
	end

	function Christine.Npc:unhate(_target)
		if not _target.isInheritorOf or not target:isInheritorOf("Role") then self:error(1, "Christine.Npc:unhate( _target:Role )") return false end
		ClearHateList(self.GUID, _target)
		return self
	end

	function Christine.Npc:hate(_target, _value)
		if not _target or not _target.isInheritorOf or not _target:isInheritorOf("Role") then self:error(1, "Christine.Npc:hate( _target:Role )") return false end
		_target:systemCastSpell(self, 495751, _value)
		return self
	end

	function Christine.Npc:addSkill(_name, _skill)
		if type(_name) ~= "string" or not _skill or not _skill.isInheritorOf or not _skill:isInheritorOf("Skill") then
			self:error(1, "Christine.Npc:addSkill( _name:string, _skill:Skillm _lock:Boolean)") return false
		end
		self.skill = self.skill or {}
		self.skill[_name] = _skill:new()
		return self.skill[_name]
	end

	function Christine.Npc:removeSkill(_name)
		if type(_name) ~= "string" then self:error(1, "Christine.Npc:removeSkill( _name:string )") return false end
		if not self.skill or not self.skill[_name] then self:error(2, "Christine.Npc:removeSkill(_name) skill not found") return false end
		self.skill[_name] = nil
		return self
	end

	function Christine.Npc:useSkill(_name, ...)
		if not self.skill or not self.skill[_name] then return false end
		if self.skill[_name].is_lock then return false end
		if self.skill[_name].ready then
			if self.skill[_name]:active(self, ...) then
				self.skill[_name].ready = false
				return self
			else
				self.skill[_name].ready = true
			end
		end
		return false
	end

	function Christine.Npc:defaultIdleMotion(motion_id)
		SetDefIdleMotion(self.GUID, motion_id)
		return self
	end

	function Christine.Npc:setRoute(_route_flag)
		
	end

	function Christine.Npc:startRoute()
	end

	function Christine.Npc:stopRoute()
	end

	DebugLog(2, "[Christine Class] Npc initialized")
end