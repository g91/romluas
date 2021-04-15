function Lua_TouchGuildBank()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	if (ZoneID ~= 402) then
		SetPlot( OwnerID() , "Touch" , "Lua_GuildBankOpen" , 50 );
	else
		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋	
	end
end

function Lua_GuildBankOpen()	--BankSwitchPlot	

--if CheckInMyGuildHouse(OwnerID()) ==True  then

	local BankDoor = LuaFunc_SearchNPCbyOrgID( OwnerID(), 112063 , 350 )  --Search Bank Door
	if ReadRoleValue(  TargetID() , EM_RoleVAlue_PID) < 1 then
		OpenClientMenu( OwnerID() , EM_ClientMenuType_GuildBank )
		BeginPlot( TargetID() , "PlayOpenSwitch_01" , 0 )
		BeginPlot( BankDoor, "PlayOpenSwitch_01" , 0 )
		sleep( 50 )
	else
		BeginPlot( TargetID() , "PlayCloseSwitch_01" , 0 )	
		BeginPlot( BankDoor, "PlayCloseSwitch_01" , 0 )
		sleep( 50 )		
	end
--else
--	ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_BUILD_12]" , 0 )	--你沒有權限
--	sleep( 10 )
--end
end

function PlayOpenSwitch_01()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2 )
end

function PlayCloseSwitch_01()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL)	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function CheckIfOwnGuild()	--CheckIfMyGuildHouse
	if CheckInMyGuildHouse(OwnerID()) ==True  then
		Say( OwnerID() ,"MyGuildHouseTrue") 
	else
		Say( OwnerID() ,"MyGuildHouseFalse") 
	end

if CheckInMyGuildHouse(OwnerID()) ==True  then
		
else
	ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_BUILD_12]" , 0 )	--你沒有權限
end
	
end