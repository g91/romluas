----------------------------------------------------------------------------------------------------
Function Z26_ITEM242530CHECK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ReadRoleValue ( NPC, EM_RoleValue_OrgID )==107692 then
		if CheckDistance( PID, NPC, 100 )==true then
			PlayMotion( PID, ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR )
			return true
		end
	else	ScriptMessage( PID, PID, 1, "[SC_ITEM242530USEERROW_00]", 0 )
		return false
	end
End
----------------------------------------------------------------------------------------------------
Function Z26_CAST850772_00()
	local PID=OwnerID()
	local NPC=TargetID()
	CallPlot( NPC, "Z26_CAST850772_01", PID )
	DW_QietKillOne( PID, 107753 )
	return true
End
Function Z26_CAST850772_01(PID)
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	local NewNPC=CreateObj( 122158, x, y, z, dir, 1 )
	SetModeEx( NewNPC, EM_SetModeType_Save, false )
	MoveToFlagEnabled( NewNPC, false )
	AdjustFaceDir( NewNPC, PID, 0 )
	AddToPartition( NewNPC, 0 )
	BeginPlot( NewNPC, "Z26_CAST850772_02", 0 )
	Sleep(10) LuaFunc_ResetObj( NPC )
End
Function Z26_CAST850772_02()
	local NPC=OwnerID()
	local NUM=DW_Rand(3)
	AddBuff( NPC, 624177, 1, -1 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP01 )
	if NUM==1 then
		NPCSay( NPC, "[SC_Z26TREESSPEAK_01]" )
	end
	if NUM==2 then
		NPCSay( NPC, "[SC_Z26TREESSPEAK_02]" )
	end
	if NUM==3 then
		NPCSay( NPC, "[SC_Z26TREESSPEAK_03]" )
	end
	Sleep(40) Delobj( NPC )
End
----------------------------------------------------------------------------------------------------
Function Z24_Q426040TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local Item01={ 242541, 242542, 242543, 242544, 242545 }
	local Item02={}
	local Index=1
	local NUM01=0
	local NUM02=0
	for i=1, 5, 1 do
		if CountBodyItem( PID, Item01[i] )==0 then
			table.insert( Item02, Index, Item01[i] )
			Index=Index+1
		end
	end
	NUM01=table.getn( Item02 )
	if NUM01<3 then
		ScriptMessage( PID, PID, 1, "[SC_Q426040TOUCH_00]", 0 )
		return false
	else	NUM02=DW_Rand( NUM01 )
		GiveBodyItem( PID, Item02[NUM02], 1 )
		return true
	end
end
Function Z26_Q426040ACCEPT_00()
	local PID=TargetID()
	local NPC=OwnerID()
	SetFlag( PID, 548118, 0 )
	SetFlag( PID, 548119, 0 )
	SetFlag( PID, 548120, 0 )
	SetFlag( PID, 548121, 0 )
	SetFlag( PID, 548122, 0 )
End
Function Z26_NPCSPEAK122196_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426040 )==true or
	CheckAcceptQuest( PID, 426376 )==true or
	CheckAcceptQuest( PID, 426396 )==true ) and
	CountBodyItem( PID, 242541 )>=1 and
	CheckScriptFlag( PID, 548118 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426040OPTION_01]", "Z26_Q426040COMPLETE_01", 0 )
	elseif CheckAcceptQuest(PID,426169)==true and
	CountBodyItem(PID, 242585)>0 and
	CheckFlag(PID, 548042)==false then
		AddSpeakOption(PID,NPC, "[SC_Z26Q426169_01]", "LuaPG_426169_GiveEgg_02", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z26_Q426040COMPLETE_01()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107761 )
	DelBodyItem( PID, 242541, 1 )
	SetFlag( PID, 548118, 1 )
	CloseSpeak( PID )
End
Function Z26_NPCSPEAK122197_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426040 )==true or
	CheckAcceptQuest( PID, 426376 )==true or
	CheckAcceptQuest( PID, 426396 )==true ) and
	CountBodyItem( PID, 242542 )>=1 and
	CheckScriptFlag( PID, 548119 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426040OPTION_02]", "Z26_Q426040COMPLETE_02", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z26_Q426040COMPLETE_02()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107761 )
	DelBodyItem( PID, 242542, 1 )
	SetFlag( PID, 548119, 1 )
	CloseSpeak( PID )
End
Function Z26_NPCSPEAK122198_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426040 )==true or
	CheckAcceptQuest( PID, 426376 )==true or
	CheckAcceptQuest( PID, 426396 )==true ) and
	CountBodyItem( PID, 242543 )>=1 and
	CheckScriptFlag( PID, 548120 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426040OPTION_03]", "Z26_Q426040COMPLETE_03", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z26_Q426040COMPLETE_03()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107761 )
	DelBodyItem( PID, 242543, 1 )
	SetFlag( PID, 548120, 1 )
	CloseSpeak( PID )
End
Function Z26_NPCSPEAK122199_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426040 )==true or
	CheckAcceptQuest( PID, 426376 )==true or
	CheckAcceptQuest( PID, 426396 )==true ) and
	CountBodyItem( PID, 242544 )>=1 and
	CheckScriptFlag( PID, 548121 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426040OPTION_04]", "Z26_Q426040COMPLETE_04", 0 )
	else	LoadQuestOption( PID )
	end
	if ( CheckAcceptQuest( PID, 426152 )==true or 
	CheckAcceptQuest( PID, 426382 )==true or 
	CheckAcceptQuest( PID, 426402 )==true ) and
	CountBodyItem( PID, 242620 )>=1 then
		AddSpeakOption( PID, NPC, "[SC_Q426152OPTION_00]", "Z26_Q426152COMPLETE_00", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z26_Q426040COMPLETE_04()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107761 )
	DelBodyItem( PID, 242544, 1 )
	SetFlag( PID, 548121, 1 )
	CloseSpeak( PID )
End
Function Z26_NPCSPEAK122200_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426040 )==true or
	CheckAcceptQuest( PID, 426376 )==true or
	CheckAcceptQuest( PID, 426396 )==true ) and
	CountBodyItem( PID, 242545 )>=1 and
	CheckScriptFlag( PID, 548122 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426040OPTION_05]", "Z26_Q426040COMPLETE_05", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z26_Q426040COMPLETE_05()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107761 )
	DelBodyItem( PID, 242545, 1 )
	SetFlag( PID, 548122, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426104TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	DW_QietKillOne( PID, 107767 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426142COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 242577, -1 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426143COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 242578, -1 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_ITEM242586_00()
	local PID=OwnerID()
	local Index={ 	122212, 122213, 122214, 122215,
			122216, 122217, 122218, 122219	}
	local NPC=SearchRangeNPC( PID, 40 )
	local pos=0
	for i =0, table.getn( NPC ) do
		pos=ReadRoleValue( NPC[i], EM_RoleValue_OrgID )
		if pos==122212 then
			SetPosByFlag( PID, 781275, 1 ) return true
		elseif pos==122213 then
			SetPosByFlag( PID, 781275, 2 ) return true
		elseif pos==122214 then
			SetPosByFlag( PID, 781275, 3 ) return true
		elseif pos==122215 then
			SetPosByFlag( PID, 781275, 2 ) return true
		elseif pos==122216 then
			SetPosByFlag( PID, 781275, 3 ) return true
		elseif pos==122217 then
			SetPosByFlag( PID, 781275, 4 ) return true
		elseif pos==122218 then
			SetPosByFlag( PID, 781275, 5 ) return true
		elseif pos==122219 then
			SetPosByFlag( PID, 781275, 6 ) return true
		end
	end
	ScriptMessage( PID, PID, 1, "[SC_QUEST426150_01]", 0 )
	return false
End
----------------------------------------------------------------------------------------------------
Function Z26_NPC122258_00()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )
End
Function Z26_NPC122258SPEAK_00()
	LoadQuestOption( OwnerID() )
End
Function Z26_Q426152ACCEPT_00()
	local NPC=OwnerID()
	DisableQuest( NPC, true )
	SetModeEx( NPC, EM_SetModeType_Mark, false )
	SetModeEx( NPC, EM_SetModeType_Show, false )
	Sleep( 12000 )
	SetModeEx( NPC, EM_SetModeType_Mark, true )
	DisableQuest( NPC, false )
	SetModeEx( NPC, EM_SetModeType_Show, true )
End
Function Z26_Q426152COMPLETE_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 548064, 1 )
	DelBodyItem( PID, 242620, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426151TOUCH_01()
	local PID=OwnerID()
	if CountBodyItem( OwnerID(), 241035 )>=1 then
		return true
	else	ScriptMessage( PID, PID, 1, "[SC_Q426151_00]", 0 )
		return false
	end
End
Function Z26_Q426151TOUCH_02()
	DelBodyItem( OwnerID(), 241035, 1 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426378COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 242577, -1 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426379COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 242578, -1 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426398COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 242577, -1 )
	Lua_ZonePE_3th_GetScore( 50 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z26_Q426399COMPLETE_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 242578, -1 )
	Lua_ZonePE_3th_GetScore( 50 )
	return
End
----------------------------------------------------------------------------------------------------