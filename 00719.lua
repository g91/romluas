function Lua_DailyQuest_CLS()
	ResetObjDailyQuest( OwnerID() )
	ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_DAILYQUEST_CLS_OK") , C_SYSTEM )	--�M���C����Ȧ��\�I
end