function ChristineSkill_initialize()
	Christine.Skill = Christine.Object:new()
	Christine.Skill.class = "Skill"

	function Christine.Skill:initialize()
		self.ready = false
		self.is_lock = false
		self.cd = self.cd or 0
		self.cd_counter = self.cd or 0
	end

	function Christine.Skill:resetCooldown()
		self.ready = true
		self.cd_counter = self.cd
	end

	function Christine.Skill:lock()
		self.is_lock = true
		return self
	end

	function Christine.Skill:unlock()
		self.is_lock = false
		return self
	end

	DebugLog(2, "[Christine Class] Skill initialized")
end