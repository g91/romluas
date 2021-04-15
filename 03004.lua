function AddyMusic_initialize()
	-------------------------------------------------------------
	--	Music
	-------------------------------------------------------------
	AddyMusic = AddyObject:new()
	AddyMusic.class = "Music"

	function AddyMusic:new(_name, _url, _time)
		if not _name or not _url or not _time then DebugMsg(0, 0, "ERROR : AddyMusic:new( _name:String, url:String, _time:Number )") end
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		_inheritor.name = _name
		_inheritor.url = _url
		_inheritor.time = _time
		return _inheritor
	end

	AddyMusicPlayer = AddyEventDispatcher:new()
	AddyMusicPlayer.class = "MusicPlayer"

	function AddyMusicPlayer:new(_owner)
		if not _owner then DebugMsg(0, 0, "ERROR : AddyMusicPlayer:new( owner:Player, music:Music )") end
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		_inheritor.owner = _owner
		_inheritor.music = _music
		_inheritor.id = 0
		_inheritor.is_play = false
		_inheritor.current_time = 0
		return _inheritor
	end

	function AddyMusicPlayer:play(_repeat)
		if self.is_play or not self.music then return end
		self.is_play = true
		self.id = PlayMusicToPlayer(self.owner.GUID, self.music.url, _repeat or false)
		self:dispatchEvent(AddyMusicPlayerEvent:new(AddyMusicPlayerEvent.PlayMusic, self.music))
	end

	function AddyMusicPlayer:stop()
		if not self.is_play then return end
		self.is_play = false
		self.current_time = 0
		StopSound(self.owner.GUID, self.id)
		self:dispatchEvent(AddyMusicPlayerEvent:new(AddyMusicPlayerEvent.StopMusic, self.music))
	end

	function AddyMusicPlayer:changeMusic(_music)
		if self.is_play then self:stop() end
		self.music = _music
	end

	AddyMusicPlayerEvent = AddyEvent:new()
	AddyMusicPlayerEvent.class = "MusicPlayerEvent"
	AddyMusicPlayerEvent.PlayMusic = "AddyMusicPlayerEvent_PlayMusic"
	AddyMusicPlayerEvent.StopMusic = "AddyMusicPlayerEvent_StopMusic"
	AddyMusicPlayerEvent.MusicEnd = "AddyMusicPlayerEvent_MusicEnd"

	function AddyMusicPlayerEvent:new(_type, _music)
		local _inheritor = {}
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key) return self[_key] end
		self.__newindex = function(_object, _key, _value) rawset(_object, _key, _value) end
		_inheritor.type = _type
		_inheritor.music = _music
		return _inheritor
	end

	DebugLog(2, "[ROM Class] AddyMusic initialized")
end