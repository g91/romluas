function AddyPlayer_initialize()
	-------------------------------------------------------------
	--	Player
	-------------------------------------------------------------
	AddyPlayer = AddyRole:new()
	AddyPlayer.class = "Player"
	AddyPlayerEvent = AddyEvent:new()
	AddyPlayerEvent.class = "PlayerEvent"
	AddyPlayerEvent.PlayBGM = "AddyPlayerEvent_PlayBGM"
	AddyPlayerEvent.StopBGM = "AddyPlayerEvent_StopBGM"

	function AddyPlayer:playBGM()
		if ReadRoleValue(self.GUID, EM_LuaValueFlag_IsStopBGM) == 0 then return false end
		WriteRoleValue(self.GUID, EM_LuaValueFlag_IsStopBGM, 0)
		ClientEvent_Range(self.GUID,0,"playmusic")
		self:dispatchEvent(AddyPlayerEvent:new(AddyPlayerEvent.PlayBGM))
		return true
	end

	function AddyPlayer:stopBGM()
		if ReadRoleValue(self.GUID, EM_LuaValueFlag_IsStopBGM) == 1 then return false end
		WriteRoleValue(self.GUID, EM_LuaValueFlag_IsStopBGM, 1)
		ClientEvent_Range(self.GUID, 0, "stopmusic")
		self:dispatchEvent(AddyPlayerEvent:new(AddyPlayerEvent.StopBGM))
		return true
	end

	DebugLog(2, "[ROM Class] AddyPlayer initialized")
end