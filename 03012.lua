function ChristinePlayer_initialize()
	Christine.Player = Christine.Role:new()
	Christine.Player.class = "Player"

	function Christine.Player:initialize()
		self.music_player = Christine.MusicPlayer:new(self)
	end

	function Christine.Player:playBGM()
		if not self.is_stop_bgm then return false end
		self.is_stop_bgm = false
		ClientEvent_Range(self.GUID,0,"playmusic")
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.PLAY_BGM))
		return self
	end

	function Christine.Player:stopBGM()
		if self.is_stop_bgm then return false end
		self.is_stop_bgm = true
		ClientEvent_Range(self.GUID, 0, "stopmusic")
		self:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.STOP_BGM))
		return self
	end

	function Christine.Player:playMusic(_music, _repeat)
		if self.music_player.is_play then return false end
		if not _music or not _music.isInheritorOf or not _music:isInheritorOf("Music") then
			self:error(1, "Christine.Player:playMusic( _music:Music, _repeat:boolean )") return false
		end
		self.music_player:changeMusic(_music)
		self.music_player:play()
	end

	function Christine.Player:stopMusic()
		if not self.music_player.is_play then return false end
		self.music_player:stop()
	end

	function Christine.Player:alert(_string)
		if type(_string) ~= "string" then self:error(1, "Christine.Role:alert( _string:string )") return false end
		ScriptMessage(self.GUID, self.GUID, 1, _string, 0)
		return self
	end

	function Christine.Player:message(_string, _color)
		local _color = _color or 0
		if type(_string) ~= "string" or type(_color) ~= "number" then self:error(1, "Christine.Role:message( _string:string , _color:number )") return false end
		ScriptMessage(self.GUID, self.GUID, 2, _string, _color)
		return self
	end

	function Christine.Player:loadQuestOption()
		LoadQuestOption(self.GUID)
		return self
	end

	DebugLog(2, "[Christine Class] Player initialized")
end