function LuaFunc_AddQuestTitle( questTable, titleID )
	-- 每一定時間，掃描一次。

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local info;
	info = {};
	info.questTable = questTable;
	info.titleID = titleID;

	for i,v in ipairs( questTable ) do

		if( not g_QuestTitleTable[v] )then
			g_QuestTitleTable[v] = {};
		end

		table.insert( g_QuestTitleTable[v], info );
	end
	table.insert( g_QuestTitleInfoTable, info );

end

function LuaFunc_CheckQuestTitle( questID )

	if( not g_QuestTitleTable[questID] )then
		return;
	end

	local getNewTitleCount = 0;
	local check;
	local i,v;
	local ii,vv;
	for i,v in ipairs( g_QuestTitleTable[questID] ) do

		if( 0 == CountBodyItem( OwnerID(), v.titleID ) )then

			check = true;
			for ii,vv in ipairs( v.questTable ) do
				
				if( ( vv >= 530000 and CountBodyItem( OwnerID(), vv ) > 0 ) or --稱號
				    CheckCompleteQuest( OwnerID(), vv ) )then
				else
					check = false;
					break;
				end
			end

			if( check )then		
				GiveBodyItem( OwnerID(), v.titleID  , 1 );  --給稱號
				getNewTitleCount = getNewTitleCount  + 1;
			end
		end
	end	
	return getNewTitleCount;
end

function LuaFunc_CheckAllQuestTitle()
	-- 按下檢查時瞬間檢查。

	local getNewTitleCount = 0
	getNewTitleCount = getNewTitleCount + Lua_Hao_TitleSys_Click_Check( OwnerID() )

	local check;

	local i,v;
	local ii,vv;
	for i,v in ipairs( g_QuestTitleInfoTable ) do
		if( 0 == CountBodyItem( OwnerID(), v.titleID ) )then
			check = true;
			for ii,vv in ipairs( v.questTable ) do
				if( ( vv >= 530000 and CountBodyItem( OwnerID(), vv ) > 0 ) or --稱號
				    CheckCompleteQuest( OwnerID(), vv ) )then
				else
					check = false;
					break;
				end
			end
			if( check )then
				GiveBodyItem( OwnerID(), v.titleID  , 1 );  --給稱號
				getNewTitleCount = getNewTitleCount + 1;
			end
		end
	end
	return getNewTitleCount;
end