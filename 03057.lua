function ChristineMusicPlayer_initialize()
	Christine.MusicPlayer = Christine.EventDispatcher:new()
	Christine.MusicPlayer.class = "MusicPlayer"

	function Christine.MusicPlayer:new(_owner)
		if not _owner or not _owner.isInheritorOf or not _owner:isInheritorOf("Player") then
			self:error(1, "ERROR : Christine.MusicPlayer:new( _owner:Player )")
		end
		local _inheritor = {}
		_inheritor.owner = _owner
		_inheritor.music = _music
		_inheritor.id = 0
		_inheritor.is_play = false
		_inheritor.current_time = 0
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		return _inheritor
	end

	function Christine.MusicPlayer:play(_repeat)
		if not self.music then self:error(2, "Christine.MusicPlayer:play( _repeat:boolean ) no music") return false end
		if self.is_play then self:error(2, "Christine.MusicPlayer:play( _repeat:boolean ) has been play") return false end
		self.is_play = true
		self.id = PlayMusicToPlayer(self.owner.GUID, self.music.url, _repeat or false)
		self:dispatchEvent(Christine.MusicPlayerEvent:new(Christine.MusicPlayerEvent.PLAY_MUSIC))
		return true
	end

	function Christine.MusicPlayer:stop()
		if not self.is_play then self:error(2, "Christine.MusicPlayer:stop( _repeat:boolean ) has been stop") return false end
		self.is_play = false
		self.current_time = 0
		StopSound(self.owner.GUID, self.id)
		self:dispatchEvent(Christine.MusicPlayerEvent:new(Christine.MusicPlayerEvent.STOP_MUSIC))
		return true
	end

	function Christine.MusicPlayer:addMusic(_music)
		if not _music or not _music.isInheritorOf or not _music:isInheritorOf("Music") then
			self:error(1, "Christine.MusicPlayer:changeMusic( _music:Music )") return false
		end
		if self.music then self:error(2, "Christine.MusicPlayer:play( _repeat:boolean ) already has music") return false end
		self.music = _music
		return true
	end

	function Christine.MusicPlayer:removeMusic()
		if not self.music then self:error(2, "Christine.MusicPlayer:play( _repeat:boolean ) no music") return false end
		self.music = nil
		return true
	end

	function Christine.MusicPlayer:changeMusic(_music)
		if not _music or not _music.isInheritorOf or not _music:isInheritorOf("Music") then
			self:error(1, "Christine.MusicPlayer:changeMusic( _music:Music )") return false
		end
		if self.is_play then self:stop() end
		if self.music then self:removeMusic() end
		self:addMusic(_music)
		return true
	end

	DebugLog(2, "[Christine Class] MusicPlayer initialized")
end