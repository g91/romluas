function AddyMusicListener_initialize()
	-------------------------------------------------------------
	--	MusicListener
	-------------------------------------------------------------
	AddyMusicListener = AddyEventDispatcher:new()
	AddyMusicListener.class = "MusicListener"

	function AddyMusicListener:new()
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		_inheritor.list = {}
		_inheritor.start_time = nil
		_inheritor.current_time = nil
		_inheritor.last_time = nil
		_inheritor.end_time = nil
		_inheritor.delay = nil
		return _inheritor
	end

	function AddyMusicListener:add(_music_player)
		if not _music_player or not _music_player.isInheritorOf or not _music_player:isInheritorOf("MusicPlayer") then
			DebugMsg(0, 0, "ERROR : AddyMusicListener:add( music_player:MusicPlayer )")
			return false
		end
		for index, music_player in pairs(self.list) do
			if music_player == _music_player then return false end
		end
		table.insert(self.list, _music_player)
		return true
	end

	function AddyMusicListener:remove(_music_player)
		if not _music_player or not _music_player.isInheritorOf or not _music_player:isInheritorOf("MusicPlayer") then
			DebugMsg(0, 0, "ERROR : AddyMusicListener:remove( music_player:MusicPlayer )")
			return false
		end
		for index, music_player in pairs(self.list) do
			if music_player == _music_player then
				table.remove(self.list, index)
				return true
			end
		end
		return false
	end

	function AddyMusicListener:start()
		if not self.start_time then self.start_time = GetSystime(0) end
		if not self.last_time then self.last_time = GetSystime(0) end
		self.current_time = GetSystime(0)
		self.delay = self.current_time - self.last_time
		for index, music_player in pairs(self.list) do
			if music_player.music then
				if music_player.is_play then music_player.current_time = music_player.current_time + self.delay end
				if music_player.current_time >= music_player.music.time then
					music_player.is_play = false
					music_player.current_time = 0
					music_player:dispatchEvent(AddyMusicPlayerEvent:new(AddyMusicPlayerEvent.MusicEnd, music_player.music))
				end
			end
		end
		self.last_time = GetSystime(0)
	end

	function AddyMusicListener:stop()
		if not self.start_time then return false end
		self.end_time = GetSystime(0)
	end

	DebugLog(2, "[ROM Class] AddyMusicListener initialized")
end