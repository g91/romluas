function AddyQuestNpc_initialize()
	-------------------------------------------------------------
	--	QuestNpc
	-------------------------------------------------------------
	AddyQuestNpc = AddyNpc:new()
	AddyQuestNpc.class = "QuestNpc"
	-- ///對話系統
	function AddyQuestNpc:addSpeakOption(_string, _callback, _icon_id, _target)
		local _icon_id = _icon_id or 0
		local _target = _target or OwnerID()
		if type(_target) == "table" then _target = _target.GUID end
		if type(_string) ~= "string" or type(_callback) ~= "string" or type(_icon_id) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyQuestNpc:addSpeakOption( _content:string, _callback:string[, _icon_id:number] )")
			return
		end
		AddSpeakOption(_target, self.GUID, _string, _callback, _icon_id)
	end
	function AddyQuestNpc:closeSpeak()
		CloseSpeak(OwnerID())
	end
	function AddyQuestNpc:setSpeakDetail(_string)
		if type(_string) ~= "string" then
			DebugMsg(0, 0, "[ERROR] type error. AddyQuestNpc:setSpeakDetail( _content:string )")
			return
		end
		SetSpeakDetail(OwnerID(), _string)
	end
	function AddyQuestNpc:loadQuestOption()
		LoadQuestOption(OwnerID())
	end

	DebugLog(2, "[ROM Class] AddyQuestNpc initialized")

end