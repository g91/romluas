function ChristineMusicListener_initialize()
	Christine.MusicListener = Christine.EventDispatcher:new()
	Christine.MusicListener.class = "MusicListener"

	function Christine.MusicListener:initialize()
		self.list = {}
		self.start_time = 0
		self.current_time = 0
		self.last_time = 0
		self.end_time = 0
		self.delay = 1
		self.is_active = false
	end

	function Christine.MusicListener:add(_player)
		if not _player or not _player.isInheritorOf or not _player:isInheritorOf("Player") then
			self:error(1, "Christine.MusicListener:add( _player:Player )") return false
		end
		for index, player in pairs(self.list) do
			if player == _player then self:error(2, "Christine.MusicListener:add( _player:Player ) has been added") return false end
		end
		table.insert(self.list, _player)
		return true
	end

	function Christine.MusicListener:remove(_player)
		if not _player or not _player.isInheritorOf or not _player:isInheritorOf("Player") then
			self:error(1, "Christine.MusicListener:add( _player:Player )") return false
		end
		for index, _player in pairs(self.list) do
			if player == _player then
				table.remove(self.list, index)
				return true
			end
		end
		self:error(2, "Christine.MusicListener:remove( _player:Player ) not found")
		return false
	end

	function Christine.MusicListener:start()
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

	function Christine.MusicListener:stop()
		if not self.is_active then return false end
		self.end_time = GetSystime(0)
		self.is_active = false
		return self
	end

	function Christine.MusicListener:loop()
		for index, player in pairs(self.list) do
			if player.music_player.music then
				if player.music_player.is_play then player.music_player.current_time = player.music_player.current_time + self.delay end
				if player.music_player.current_time >= player.music_player.music.time then
					player.music_player:stop()
					player:dispatchEvent(Christine.MusicPlayerEvent:new(Christine.MusicPlayerEvent.MUSIC_END))
				end
			end
		end
	end

	function Christine.MusicListener:stop()
		if not self.start_time then return false end
		self.end_time = GetSystime(0)
	end

	DebugLog(2, "[Christine Class] MusicListener initialized")
end