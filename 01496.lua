function Lua_System_QuestComplete( ObjID, QuestID )
	--if CountBodyItem( ObjID , 543310) == 0 then
	--	LuaFunc_CheckAllQuestTitle()
	--	SetFlag( ObjID , 543310,1 )
	--else
		LuaFunc_CheckQuestTitle( QuestID )
	--end
end