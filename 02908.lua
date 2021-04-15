function AddyBoss_initialize()
	-------------------------------------------------------------
	--	Boss
	-------------------------------------------------------------
	AddyBoss = AddyMonster:new()
	AddyBoss.class = "Boss"
	function AddyBoss:addSkill(_name, _skill)
		if not _skill then return end
		if _skill.class ~= "Skill" then
			DebugMsg(0, 0, "[ERROR] type error. AddyBoss:addSkill( _name:string, _skill:Skill)")
			return
		end
		if self.skill == nil then self.skill = {} end
		self.skill[_name] = _skill:new()
		self.skill[_name].ready = false
		self.skill[_name].is_lock = false
		self.skill[_name].cd_counter = self.cd or 0
	end
	function removeSkill(_name)
		if not self.skill[_name] then
			DebugMsg(0, 0, "[ERROR] skill not found. AddyBoss:removeSkill( skill_name )")
			return false
		end
		self.skill[_name] = nil
	end
	function AddyBoss:useSkill(_name, _argument)
		if not self.skill[_name] then
			DebugMsg(0, 0, "[ERROR] not found this skill : AddyBoss:useSkill( skill_name )")
			return false
		end
		if self.skill[_name].is_lock then return false end
		if self.skill[_name].ready then
--			self.skill[_name].ready = false
--			if self.skill[_name].active then
--				self.skill[_name]:active(self, _argument)
--			end
			if self.skill[_name]:active(self, _argument) == false then
				self.skill[_name].ready = true
				return false
			else self.skill[_name].ready = false end
			return true
		end
	end

	DebugLog(2, "[ROM Class] AddyBoss initialized")
end