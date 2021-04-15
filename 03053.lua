function ChristineBattleListener_initialize()
	Christine.BattleListener = Christine.EventDispatcher:new()
	Christine.BattleListener.class = "BattleListener"

	function Christine.BattleListener:initialize()
		self.list = {}
		self.start_time = 0
		self.current_time = 0
		self.last_time = 0
		self.end_time = 0
		self.delay = 1
		self.is_active = false
		self.auto_colddown_skill = true
		self.auto_refresh_players_list = true
		self.kick_out_player_delay = 0
		self.players = {}
		self._kick_out_list = {}
	end

	function Christine.BattleListener:start()
		self.current_time = GetSystime(0)
		if self.is_active then
			self.delay = self.current_time - self.last_time
			self:loop()
		else
			self.start_time = GetSystime(0)
			self.is_active = true
		end
		self.duration_time = self.current_time - self.start_time

		self.last_time = GetSystime(0)
		return self
	end

	function Christine.BattleListener:stop()
		if not self.is_active then return false end
		self.end_time = GetSystime(0)
		self.is_active = false
		return self
	end

	function Christine.BattleListener:add(_npc)
		if not _npc or not _npc.isInheritorOf or not _npc:isInheritorOf("Npc") then self:error(1, "Christine.BattleListener:add( _npc:Npc )") return false end
		 for index, npc in pairs(self.list) do
			if npc == _npc then return self end
		end
		table.insert(self.list, _npc)
		return self
	end

	function Christine.BattleListener:remove(_npc)
		if not _npc or not _npc.isInheritorOf or not _npc:isInheritorOf("Npc") then self:error(1, "Christine.BattleListener:remove( _npc:Npc )") return false end
		for index, npc in pairs(self.list) do
			if npc == _npc then
				table.remove(self.list, index)
				break
			end
		end
		return self
	end

	function Christine.BattleListener:loop()
		for index, npc in pairs(self.list) do
			----------------------------------------------------------------
			--	冷卻技能
			----------------------------------------------------------------
			if self.auto_colddown_skill and npc.skill then self:coldDownSkill(npc, self.delay) end
			----------------------------------------------------------------
			--	刷新玩家
			----------------------------------------------------------------
			if self.auto_refresh_players_list then self:refreshPlayersList(npc) end
		end
	end

	function Christine.BattleListener:autoColdDownSkill()
		self.auto_colddown_skill = true
	end

	function Christine.BattleListener:preventAutoColdDownSkill()
		self.auto_colddown_skill = false
	end

	function Christine.BattleListener:coldDownSkill(npc, delay)
		for name, skill in pairs(npc.skill) do
			if not skill.is_lock then
				if skill.cd_counter > 0 then
					skill.cd_counter = skill.cd_counter - delay
				else
					if skill.inactive then skill:inactive(npc) end
					if not skill.ready then
						skill.ready = true
						skill.cd_counter = skill.cd
					end
				end
			end
		end
	end

	function Christine.BattleListener:autoRefreshPlayersList(_delay)
		if self.auto_refresh_players_list then self:error(2, "players list has kept be refresh.") return end
		self.auto_refresh_players_list = true
		self.kick_out_player_delay = _delay or 5
		self.players = {}
		self._kick_out_list = {}
	end

	function Christine.BattleListener:preventAutoRefreshPlayersList()
		self.auto_refresh_players_list = false
		self.kick_out_player_delay = nil
		self.players = nil
		self._kick_out_list = nil
	end

	function Christine.BattleListener:refreshPlayersList(npc)
		for hater_index, hater in pairs(npc.hate_list) do
			if hater.is_player then
				if #self.players > 0 then
					for player_index, player in pairs(self.players) do
						if player.GUID == hater.GUID then
							player.last_check_time = self.current_time
							break
						elseif player_index == #self.players then
							hater.last_check_time = self.current_time
							if hater.is_player then table.insert(self.players, hater) end
						end
					end
				else
					hater.last_check_time = self.current_time
					if hater.is_player then table.insert(self.players, hater) end
				end
			end
		end
		for player_index, player in pairs(self.players) do
			if player.last_check_time then
				if self.current_time - player.last_check_time > self.kick_out_player_delay then
					table.insert(self._kick_out_list, player)
				end
			else player.last_check_time = self.current_time end
		end
		for kick_out_player_index, kick_out_player in pairs(self._kick_out_list) do
			for player_index, player in pairs(self.players) do
				if kick_out_player == player then
					table.remove(self.players, player_index)
					break
				end
			end
		end
	end

	DebugLog(2, "[Christine Class] BattleListener initialized")

end