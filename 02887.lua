----------------------------------------------------------------------------------------------------
Function Z26_NPC122314_00()
	AddBuff( OwnerID(), 624307, 0, -1 )
End
Function Z26_ITEM242625_00()
	local PID=OwnerID()
	local NPC=SearchRangeNPC( PID, 30 )
	local NUM=table.getn( NPC )
	if NUM==0 then
		ScriptMessage( PID, PID, 1, "[SC_ITEM242625_00]", 0 )
		return false
	else	for i=0, NUM, 1 do
			if ReadRoleValue( NPC[i], EM_RoleValue_OrgID )==122314 and
			CheckBuff( NPC[i], 624307)==true then
				CancelBuff_NoEvent( NPC[i], 624307 )
				SetModeEx( NPC[i], EM_SetModeType_Mark, false )
				SetModeEx( NPC[i], EM_SetModeType_Show, false )
				CallPlot( NPC[i], "Z26_ITEM242625_01", NPC[i] )
				CastSpell( NPC[i], NPC[i], 850909 ) 
				DelBodyItem( PID, 242625, 1 )
				DW_QietKillOne( PID, 107788 )
				return true
			end
		end
		ScriptMessage( PID, PID, 1, "[SC_ITEM242625_00]", 0 )
		return false
	end
End
Function Z26_ITEM242625_01(NPC)
	local Num1=DW_Rand(10)*10
	local Num2=DW_Rand(10)*10
	local Num3=Num1+Num2+300
	Sleep(Num3)
	AddBuff( NPC, 624307, 0, -1 )
	SetModeEx( NPC, EM_SetModeType_Mark, true )
	SetModeEx( NPC, EM_SetModeType_Show, true )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426229COMPLETE_00()
	local PID=OwnerID()
	DelBodyItem( PID, 242621, 10 )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426230COMPLETE_00()
	local PID=OwnerID()
	DelBodyItem( PID, 242622, 10 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122306SPEAK_00()
	LoadquestOption( OwnerID() )
End
Function Z26_NPC122307SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426231 )==true or
	CheckAcceptQuest( PID, 426385 )==true or
	CheckAcceptQuest( PID, 426405 )==true ) and
	CountBodyItem( PID, 242623 )==0 then
		AddSpeakOption( PID, NPC, "[SC_NPC122307SPEAK_00]", "Z26_NPC122307SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z26_NPC122307SPEAK_01()
	local PID=OwnerID()
	GiveBodyItem( PID, 242623, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426233COMPLETE_00()
	local PID=OwnerID()
	DelBodyItem( PID, 242624, 10 )
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122372_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z26_NPC122372_01", 150 )
End
Function Z26_NPC122372_01()
	local PID=OwnerID()
	if ( CheckAcceptQuest( PID, 426235 )==true or
	CheckAcceptQuest( PID, 426389 )==true or
	CheckAcceptQuest( PID, 426409 )==true ) and
	CheckScriptFlag( PID, 548041 )==false then
		SetFlag( PID, 548041, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122311SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426236 )==true or
	CheckAcceptQuest( PID, 426390 )==true or
	CheckAcceptQuest( PID, 426410 )==true ) and
	CheckScriptFlag( PID, 548046 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426236COMPLETE_00]", "Z26_NPC122311SPEAK_01",  0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z26_NPC122311SPEAK_01()
	local PID=OwnerID()
	GiveBodyItem( PID, 548046, 1 )
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426237TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107793 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z26_ITEM242626_CHECK00()
	local PID=OwnerID()
	local Plant=SearchRangeNPC( PID, 120 )
	for i=0, table.getn( Plant ), 1 do
		if ReadRoleValue( Plant[i], EM_RoleValue_OrgID )==122373 then
			ScriptMessage( PID, PID, 1, "[SC_ITEM242626_00]", 0 )
			return false
		end
	end
	return true
End
Function Z26_ITEM242626_USE00()
	local PID=OwnerID()
	local NPC=Lua_CreateObjByDir( PID, 122373, 15, 0 )
	AddToPartition( NPC, 0 )
	Callplot( NPC, "Z26_ITEM242626_USE01", NPC, PID )
	Callplot( NPC, "Z26_ITEM242626_USE02", NPC, PID )
	return true
End
Function Z26_ITEM242626_USE01( NPC, PID )
	local Num=0
	local Monster=0
	while 1 do
		if Num>=11 then
			return
		else	Num=Num+1
			Monster=SearchRangeNPC( NPC, 80 )
			for i=0, table.getn( Monster ), 1 do
				if ReadRoleValue( Monster[i], EM_RoleValue_OrgID )==107721 or
				ReadRoleValue( Monster[i], EM_RoleValue_OrgID )==107722 and
				CheckID( PID )==true then
					DW_QietKillOne( PID, 107796 )
					return
				end
			end
		end
		sleep( 10 )
	end
End
Function Z26_ITEM242626_USE02( NPC, PID )
	CastSpell( NPC, NPC, 850834 ) 
	Sleep( 300 ) DelObj( NPC )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426403COMPLETE_00()
	local PID=OwnerID()
	DelBodyItem( PID, 242621, 10 )
	Lua_ZonePE_3th_GetScore( 50 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426404COMPLETE_00()
	local PID=OwnerID()
	DelBodyItem( PID, 242622, 10 )
	Lua_ZonePE_3th_GetScore( 50 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426407COMPLETE_00()
	local PID=OwnerID()
	DelBodyItem( PID, 242624, 10 )
	Lua_ZonePE_3th_GetScore( 100 )
	return
End
----------------------------------------------------------------------------------------------------