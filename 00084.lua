----------------------------------------------------------------------------------------------------
Function Z29_NPC122745_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetPlot( PID, "range", "Z29_Q421635Range_00", 100 )
End
Function Z29_Q421635Range_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckFlag( PID, 540823 )==false and
	CheckAcceptQuest( PID, 421635 )==true then
		SetFlag( PID, 540823, 1 )
	else	return
	end	
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122951SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local NPCID=ReadRoleValue( NPC, EM_RoleValue_OrgID )
	if CheckAcceptQuest( PID, 421636 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q421636_00]", "Z29_Q421636SPEAK_00( "..NPCID.." )", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122952SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local NPCID=ReadRoleValue( NPC, EM_RoleValue_OrgID )
	if CheckAcceptQuest( PID, 421636 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q421636_00]", "Z29_Q421636SPEAK_00( "..NPCID.." )", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122953SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local NPCID=ReadRoleValue( NPC, EM_RoleValue_OrgID )
	if CheckAcceptQuest( PID, 421636 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q421636_00]", "Z29_Q421636SPEAK_00( "..NPCID.." )", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC123023SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local NPCID=ReadRoleValue( NPC, EM_RoleValue_OrgID )
	if CheckAcceptQuest( PID, 421636 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q421636_00]", "Z29_Q421636SPEAK_00( "..NPCID.." )", 0 )
	end
	if ( CheckAcceptQuest( PID, 422757 )==true and
	CheckFlag( PID, 542592 )==true and
	CheckFlag( PID, 542593 )==true and
	CheckFlag( PID, 542594 )==true ) then
		AddSpeakOption( PID, NPC, "[SC_Q422757_00]", "Z29_Q422757SPEAK_00", 0 )
	end
	if ( CheckCompleteQuest( PID, 421640 )==true and
	CheckCompleteQuest( PID, 422755 )==false and
	CheckAcceptQuest( PID, 422755 )==false and
	CheckFlag( PID, 542596 )==false ) then
		AddSpeakOption( PID, NPC, "[SC_Q422755_00]", "Z29_Q422755SPEAK_00", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_Q421636SPEAK_00( NPCID )
	local PID=OwnerID()
	local NPC=TargetID()
	local Index={}
	Index[1]=541872
	Index[2]=541873
	Index[3]=547746
	Index[4]=547747
	local Num=0
	if CheckAcceptQuest( PID, 421636 )==false then
		CloseSpeak( PID )
		return
	end
	if NPCID==122951 then
		SetSpeakDetail( PID, GetString("SC_Q421636_01") )
		if CheckFlag( PID, 541872 )==false then
			SetFlag( PID, 541872, 1 )
			DW_QietKillOne( PID, 107949 )
		else	ScriptMessage( NPC, PID, 1, "[SC_Q421636_05]", 0 )
		end
	end
	if NPCID==122952 then
		SetSpeakDetail( PID, GetString("SC_Q421636_02") )
		if CheckFlag( PID, 541873 )==false then
			SetFlag( PID, 541873, 1 )
			DW_QietKillOne( PID, 107949 )
		else	ScriptMessage( NPC, PID, 1, "[SC_Q421636_05]", 0 )
		end
	end
	if NPCID==122953 then
		SetSpeakDetail( PID, GetString("SC_Q421636_03") )
		if CheckFlag( PID, 547746 )==false then
			SetFlag( PID, 547746, 1 )
			DW_QietKillOne( PID, 107949 )
		else	ScriptMessage( NPC, PID, 1, "[SC_Q421636_05]", 0 )
		end
	end
	if NPCID==123023 then
		SetSpeakDetail( PID, GetString("SC_Q421636_04") )
		if CheckFlag( PID, 547747 )==false then
			SetFlag( PID, 547747, 1 )
			DW_QietKillOne( PID, 107949 )
		else	ScriptMessage( NPC, PID, 1, "[SC_Q421636_05]", 0 )
		end
	end
	for i=1, 4, 1 do
		if CheckFlag( PID, Index[i] )==true then
			Num=Num+1
		end
	end
	if Num==4 then
		SetFlag( PID, 547748, 0 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_Q421637TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 201552 )==0 then
		AddBuff( PID, 623132, 0, 2 )
		ScriptMessage( NPC, PID, 1, "[SC_Q421637_00]", C_SYSTEM )
		SetFlag( PID, 541874, 1 )
		GiveBodyItem( PID, 201552, 1 )
	end
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z29_Q421637TOUCH_01", PID )
	end
	return true
End
Function Z29_Q421637TOUCH_01( PID )
	local Ctrl=OwnerID()
	local x, y, z, dir=DW_Location( Ctrl )
	local NPC=0
	NPC=CreateObj( 103397, x+50, y, z+30, dir, 1 )
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )
	SetModeEx( NPC, EM_SetModeType_Strikback, false )
	SetModeEx( NPC, EM_SetModeType_Fight, false )
	MoveToFlagEnabled( NPC, false )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
	AdjustFaceDir( NPC, PID, 0 )
	AddToPartition( NPC, 0 )
	Sleep( 25 ) NpcSay( NPC, "[SC_Q421637_01]" )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP01 )
	Sleep( 25 ) NpcSay( NPC, "[SC_Q421637_02]" )
	Sleep( 20 ) 
	SetModeEx( NPC, EM_SetModeType_Searchenemy, true )
	SetModeEx( NPC, EM_SetModeType_Strikback, true )
	SetModeEx( NPC, EM_SetModeType_Fight, true )
	SetAttack( NPC, PID )
	while 1 do
		if ReadRoleValue( NPC, EM_RoleValue_IsAttackMode )==0 or
		CheckDistance( Ctrl, NPC, 200 )==false then		
			DelObj( NPC )
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			return
		end
		Sleep( 20 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122792SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421638 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q421638_00]", "Z29_NPC122792SPEAK_01", 0 )
	end
	if CountBodyItem( PID, 201557 )>=1 then
		AddSpeakOption( PID, NPC, "[SC_Q422753_00]", "Z29_NPC122792SPEAK_04", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122792SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q421638_01") )
	AddSpeakOption( PID, NPC, "[SC_Q421638_02]", "Z29_NPC122792SPEAK_02", 0 )
End
Function Z29_NPC122792SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q421638_03") )
	AddSpeakOption( PID, NPC, "[SC_Q421638_04]", "Z29_NPC122792SPEAK_03", 0 )
End
Function Z29_NPC122792SPEAK_03()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421638 )==true and
	CheckFlag( PID, 540824 )==false then
		SetFlag( PID, 540824, 1 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122792SPEAK_04()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 201557 )>=1 then
		SetFlag( PID, 542590, 1 )
		DelBodyItem( PID, 201557, 1 )
		SetSpeakDetail( PID, GetString("SC_Q422753_01") )
	else	CloseSpeak( PID )
		return		
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_ITEM200849_00()
	local PID=OwnerID()
	local Location=SearchRangeNPC ( PID, 20 )
	for i=0, table.getn( Location ), 1 do
		if ReadRoleValue( Location[i], EM_RoleValue_OrgID )==123153 then
			AddBuff ( PID, 621687, 0, 20 )
			SetFlag( PID, 540825, 5 )
			CastSpell( PID, PID, 490490 )
			if ReadRoleValue( Location[i], EM_RoleValue_Register1 )==0 then
				CallPlot( Location[i], "Z29_Q421640Play_00", PID )
			end
			return true
		end
	end
	ScriptMessage( PID, PID, 1, "[SC_ITEM200849_00]", 0 )
	return false
End
Function Z29_Q421640Play_00( PID )
	local Ctrl=OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	local x, y, z, dir=DW_Location( 781369, 1 )
	local NPC=CreateObj( 123152, x, y, z, dir, 1 )
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )
	SetModeEx( NPC, EM_SetModeType_Strikback, false )
	SetModeEx( NPC, EM_SetModeType_Fight, false )
	WriteRoleValue( NPC, EM_RoleValue_IsWalk, 1  )
	Sleep( 35 ) AddToPartition( NPC, 0 )
	MoveToFlagEnabled( NPC, false )
	Sleep( 10 ) NpcSay( NPC, "[SC_Q421640_02]" )
	Sleep( 10 ) LuaFunc_MoveToFlag( NPC, 781369, 2 ,0 )
	AdjustFaceDir( NPC, PID, 0 )
	Sleep( 10 ) NpcSay( NPC, "[SC_Q421640_03]" )
	Sleep( 25 ) NpcSay( NPC, "[SC_Q421640_04]" )
	Sleep( 25 ) FaceFlag( NPC, 781369, 1 )
	AdjustDir( NPC, 0 )
	Sleep( 05 ) SetDefIdleMotion( NPC, ruFUSION_MIME_WALK_FORWARD )
	Sleep( 20 ) DelObj( NPC )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122870_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetPlot( PID, "range", "Z29_Q421641Range_00", 100 )
End
Function Z29_Q421641Range_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 541867, 1 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122870SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421642 )==true and
	CountBodyItem( PID, 201210 )>=1 then
		AddSpeakOption( PID, NPC, "[SC_Q421642_00]", "Z29_NPC122870SPEAK_01", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122870SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421642 )==true and
	CountBodyItem( PID, 201210 )>=1 then
		SetFlag( PID, 541868, 1 )
		DelBodyItem( PID, 201210, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_Q421642Play_00()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local x, y, z, dir = 0
	local NPC = 0
	AddBuff ( Player, 500423, 0, 10 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		x, y, z, dir = DW_Location( Ctrl )
		NPC = CreateObj( 117241, x, y, z, dir-10, 1 )
		AddToPartition( NPC, 0 )
		MoveToFlagEnabled( NPC, false )
		CallPlot( NPC, "Z29_Q421642Play_01", NPC, Ctrl )	
	end
End
Function Z29_Q421642Play_01( NPC, Ctrl )		
	Sleep( 15 ) NpcSay( NPC, "[SC_Q421642_01]" )
	Sleep( 25 ) NpcSay( NPC, "[SC_Q421642_02]" )
	Sleep( 25 ) SetDefIdleMotion( NPC, ruFUSION_MIME_SWIM_FORWARD )
	Sleep( 25 ) WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	DelObj( NPC )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122947SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421643 )==true and
	CountBodyItem( PID, 201550 )>=1 then
		AddSpeakOption( PID, NPC, "[SC_Q421643_00]", "Z29_NPC122947SPEAK_01", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122947SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421643 )==true and
	CountBodyItem( PID, 201550 )>=1 then
		SetFlag( PID, 541869, 1 )
		DelBodyItem( PID, 201550, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122745SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421640 )==true and
	CheckFlag( PID, 547736 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q421640_00]", "Z29_NPC122745SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 421652 )==true and
	CountBodyItem( PID, 201551 )>=1 then
		AddSpeakOption( PID, NPC, "[SC_Q421652_00]", "Z29_NPC122745SPEAK_02", 0 )
	end
	LoadquestOption( PID )
End
Function Z29_NPC122745SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421640 )==true and
	CheckFlag( PID, 547736 )==false then
		SetSpeakDetail( PID, GetString("SC_Q421640_01") )
		SetFlag( PID, 547736, 1 )
	else	CloseSpeak( PID )
		return
	end
End
Function Z29_NPC122745SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421652 )==true and
	CountBodyItem( PID, 201551 )>=1 then
		SetFlag( PID, 541870, 1 )
		DelBodyItem( PID, 201551, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC118567SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421653 )==true and
	CountBodyItem( PID, 201551 )>=1 then
		LoadquestOption( PID )
		AddSpeakOption( PID, NPC, "[SC_Q421653_00]", "Z29_NPC118567SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 426777 )==true then
		SetSpeakDetail( PID, "[SC_Z29Q426777_1]" )
	else
		LoadQuestOption(PID)
	end
End
Function Z29_NPC118567SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 421653 )==true and
	CountBodyItem( PID, 201551 )>=1 then
		SetFlag( PID, 541871, 1 )
		DelBodyItem( PID, 201551, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122951MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 5 )
	Num=Num+3
	for i=1, Num, 1 do
		PlayMotion( NPC, ruFUSION_ACTORSTATE_ATTACK_2H )
		Sleep( 30 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_Q421636ACCEPT_00()
	local Ctrl=OwnerID()
	local PID=TargetID()
	local x, y, z, dir=DW_Location( Ctrl )
	local NPC=0
	AddBuff ( PID, 500424, 0, 12 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )	
		NPC=CreateObj( 117242, x, y, z, dir, 1 )
		SetModeEx( NPC, EM_SetModeType_Searchenemy, false )
		SetModeEx( NPC, EM_SetModeType_Strikback, false )
		SetModeEx( NPC, EM_SetModeType_Fight, false )
		WriteRoleValue( NPC, EM_RoleValue_IsWalk, 1  )
		MoveToFlagEnabled( NPC, false )
		Sleep( 05 ) AddToPartition( NPC, 0 )
		Sleep( 10 ) NpcSay( NPC, "[SC_Q421636_06]" )
		Sleep( 40 ) NpcSay( NPC, "[SC_Q421636_07]" )
		Sleep( 25 ) AdjustFaceDir( NPC, PID, 140 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_WALK_FORWARD )
		Sleep( 10 ) DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	else	CloseSpeak( PID )
		return
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC123153_00()
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	MoveToFlagEnabled( NPC, false )
	SetModeEx( NPC, EM_SetModeType_Gravity, false )
	Move( NPC, x, y+10, z )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC123023MOVE_00()
	local NPC=OwnerID()
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC123023MOVE_01()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num==3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC117244FX_00()
	local NPC=OwnerID()
	AddBuff( NPC, 500425, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122870MOVE_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_SWIM_IDLE )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC103396_SP00()
	local NPC=OwnerID()
	AddBuff( NPC, 623132, 0, -1 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_BOW )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC108242Motion_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 6 )
	local PID={}
	if Num==1 then
		Num=DW_Rand( 2 )
		if Num==1 then
			PID=SearchRangePlayer( NPC, 150 )
			if table.getn( PID )~=0 then
				Num=DW_Rand( 2 )
				if Num==1 then NpcSay( NPC, "[SC_NPC108242_01]" )
				else NpcSay( NPC, "[SC_NPC108242_02]" )
				end
			end
		end
	elseif Num==2 then PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num==3 then PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num==4 then PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	elseif Num==5 then PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	else PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_STRETCH )
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122128FX_00()
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	local SFX=CreateObj( 118826, x, y-20, z, dir, 1 )
	SetModeEx( SFX, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( SFX, false )
	AddToPartition( SFX, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC103396MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 3 )*10
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( Num+30 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC117246_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_SWIM_IDLE )
End
----------------------------------------------------------------------------------------------------