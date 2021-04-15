function AddySkill_initialize()
	-------------------------------------------------------------
	--	Skill
	-------------------------------------------------------------
	--AddySkillProperty = {
	--	ready = false,
	--	is_lock = false,
	--	cd_counter = 0
	--}
	-------------------------------------------------------------
	AddySkill = AddyObject:new()
	AddySkill.class = "Skill"
	function AddySkill:new()
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
	function AddySkill:colddown(_delay)
		if self.cd_counter then
			self.cd_counter = self.cd_counter - _delay
			if self.cd_counter <= 0 then
				self.ready = true
				self.cd_counter = self.cd
			end
		end
	end
	function AddySkill:lock()
		self.is_lock = true
	end
	function AddySkill:unlock()
		self.is_lock = false
	end

	DebugLog(2, "[ROM Class] AddySkill initialized")
end