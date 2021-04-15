----------------------------------------------------------------------------------------------------
Function Z25_NPC122020_00()
	SetPlot( OwnerID(), "range", "Z25_NPC122020_01", 100 ) 
End
Function Z25_NPC122020_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426033 )==true and
	CheckScriptFlag( PID, 547705 )==false then
		SetScriptFlag( PID, 547705, 1 )
	end
End
Function Z25_QUEST426064_00()
	local NPC=OwnerID()
	local PID=TargetID()
	ScriptMessage( NPC, PID, 2, "[SC_QUEST426064_00]", C_SYSTEM )
End
Function Z25_NPCSPEAK122083_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426064 )==true then
		AddSpeakOption( PID, NPC, "[SC_NPCSPEAK122083_00]", "Z25_NPCSPEAK122083_01", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z25_NPCSPEAK122083_01()
	local PID=OwnerID()
	local NPC=TargetID()
	CloseSpeak( PID )
	SetScriptFlag( PID, 547727, 1 )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z25_NPCSPEAK122083_02", NPC )
	else return
	end
End
Function Z25_NPCSPEAK122083_02()
	local NPC=OwnerID()
	local x, y, z, dir=DW_Location( NPC )
	local NewNPC=CreateObj( 122105, x, y, z, dir, 1 )
	local CAR=0
	local OBJ=SearchRangeNPC( NPC, 100 )
	for i=0, table.getn(OBJ) do
		if ReadRoleValue( OBJ[i], EM_RoleValue_OrgID ) == 122022 then
			CAR=OBJ[i]
		end
	end
	x, y, z, dir=DW_Location( CAR )
	local NewCAR=CreateObj( 122082, x, y, z, dir, 1 )
	AddToPartition( NewNPC, 0 )
	AddToPartition( NewCAR, 0 )
	MoveToFlagEnabled( NewNPC, false )
	MoveToFlagEnabled( NewCAR, false )
	WriteRoleValue( NewNPC, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( NewCAR, EM_RoleValue_IsWalk, 1 )
	CallPlot( NewCAR, "Z25_NPCSPEAK122083_03", NewCAR )
	Sleep(10) SetRoleEquip( NewNPC, EM_EQWearPos_MainHand, 213720, 1 )
	PlayMotion( NewNPC, ruFUSION_ACTORSTATE_UNHOLSTER )
	SetDefIdleMotion( NewNPC, ruFUSION_MIME_WALK_FORWARD )
	LuaFunc_MoveToFlag( NewNPC, 781271, 1, 1 )
	FaceFlag ( NewNPC, 781271, 2 )
	AdjustDir( NewNPC, 0 )
	NpcSay( NewNPC, "[SC_QUEST426064_01]" )
	Sleep(20) LuaFunc_MoveToFlag( NewNPC, 781271, 2, 1 )
	Sleep(10) DelObj( NewNPC )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
Function Z25_NPCSPEAK122083_03()
	local NewCAR=OwnerID()
	Sleep(15) NpcSay( NewCAR, "[SC_QUEST426064_03]" )
	LuaFunc_MoveToFlag( NewCAR, 781271, 3, 1 )
	Sleep(05) SetDefIdleMotion( NewCAR, ruFUSION_MIME_WALK_FORWARD )
	FaceFlag( NewCAR, 781271, 4 )
	AdjustDir( NewCAR, 0 )
	Sleep(10) NpcSay( NewCAR, "[SC_QUEST426064_02]" )
	Sleep(10) LuaFunc_MoveToFlag( NewCAR, 781271, 4, 1 )
	Sleep(10) DelObj( NewCAR )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122023_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_2H )
	SetPlot( NPC, "range", "Z25_NPC122023_01", 100 ) 
End
Function Z25_NPC122023_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426064 )==true and
	CheckScriptFlag( PID, 547706 )==false then
		SetScriptFlag( PID, 547706, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122109_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122024_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_CAST_LOOP )
End
Function Z25_NPCSPEAK122024_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426065 )==true and
	CheckScriptFlag( PID, 547707 )==false then
		AddSpeakOption( PID, NPC, "[SC_QUEST426065_00]", "Z25_NPCSPEAK122024_01", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z25_NPCSPEAK122024_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547707, 1 )
	LoadQuestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122025_00()
	local NPC=OwnerID()
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_SIT_BEGIN, ruFUSION_ACTORSTATE_SIT_LOOP )
	SetPlot( NPC, "range", "Z25_NPC122025_01", 100 )
End
Function Z25_NPC122025_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426099 )==true and
	CheckScriptFlag( PID, 547709 )==false then
		SetScriptFlag( PID, 547709, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_Q426100_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=Rand(5)+1
	if CountBodyItem( PID, 242352 )>=1 then
		DW_QietKillOne( PID, 107625 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_LOOP )
		if Num==1 then
			NpcSay( NPC, "[SC_Q426100_01]" )
		end
		if Num==2 then
			NpcSay( NPC, "[SC_Q426100_02]" )
		end
		if Num==3 then
			NpcSay( NPC, "[SC_Q426100_03]" )
		end
		if Num==4 then
			NpcSay( NPC, "[SC_Q426100_04]" )
		end
		if Num==5 then
			NpcSay( NPC, "[SC_Q426100_04]" )
		end
		return true
	else 	ScriptMessage( PID, PID, 1, "[SC_Q426100_00]", 0 )
		return false
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122026_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_KNOCKDOWN_END )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122040_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z25_NPC122040_01", 100 )
End
Function Z25_NPC122040_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426101 )==true and
	CheckScriptFlag( PID, 547710 )==false then
		SetScriptFlag( PID, 547710, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPCSPEAK122028_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426109 )==true and
	CheckScriptFlag( PID, 547711 )==false then
		AddSpeakOption( PID, NPC, "[SC_KITEM547711_00]", "Z25_KITEM547711_00", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z25_KITEM547711_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547711, 1 )
	LoadQuestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPCSPEAK121861_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426110 )==true and
	CheckScriptFlag( PID, 547712 )==false then
		AddSpeakOption( PID, NPC, "[SC_KITEM547712_00]", "Z25_KITEM547712_00", 0 )
	else	LoadQuestOption( PID )
	end
	if CheckAcceptQuest( PID, 426115 )==true and
	CheckScriptFlag( PID, 547716 )==false then
		AddSpeakOption( PID, NPC, "[SC_KITEM547716_00]", "Z25_KITEM547716_00", 0 )
	else	LoadQuestOption( PID )
	end
End
Function Z25_KITEM547712_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547712, 1 )
	LoadQuestOption( PID )
End
Function Z25_KITEM547716_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547716, 1 )
	LoadQuestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122037_00()
	local NPC=OwnerID()
	Callplot( NPC, "Z25_NPC122037_02", NPC )
	SetPlot( NPC, "range", "Z25_NPC122037_01", 40 )
End
Function Z25_NPC122037_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426111 )==true and
	CheckScriptFlag( PID, 547713 )==false then
		SetScriptFlag( PID, 547713, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122037_02()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122029_00()
	local NPC=OwnerID()
	SetPlot( NPC, "range", "Z25_NPC122029_01", 100 )
End
Function Z25_NPC122029_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426112 )==true and
	CheckScriptFlag( PID, 547714 )==false then
		SetScriptFlag( PID, 547714, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPCSPEAK122030_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426113 )==true and
	CheckScriptFlag( PID, 547715 )==false and
	CountBodyItem( PID, 242359 )>=1 then
		AddSpeakOption( PID, NPC, "[SC_KITEM547715_00]", "Z25_KITEM547715_00", 0 )
	else	LoadQuestOption( PID )
	end
	LoadQuestOption( PID )
End
Function Z25_KITEM547715_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547715, 1 )
	DelBodyItem( PID, 242359, 1 )
	LoadQuestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122075_00()
	SetPlot( OwnerID(), "range", "Z25_NPC122075_01", 100 ) 
End
Function Z25_NPC122075_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426116 )==true and
	CheckScriptFlag( PID, 547717 )==false then
		SetScriptFlag( PID, 547717, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122035_00()
	AddBuff ( OwnerID(), 509422, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122030_00()
	local NPC=OwnerID()
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_SIT_BEGIN, ruFUSION_ACTORSTATE_SIT_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z25_QUEST426115_00()
	local NPC=OwnerID()
	local PID=TargetID()
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		local x, y, z, dir=DW_Location( NPC )
		local NewNPC=CreateObj( 122107, x, y, z, dir, 1 )
		SetModeEx( NewNPC, EM_SetModeType_Save, false )
		SetModeEx( NewNPC, EM_SetModeType_Mark, false )
		SetDefIdleMotion( NewNPC, ruFUSION_MIME_IDLE_COMBAT_1H )
		AddToPartition( NewNPC, 0 )
		PlayMotion( NewNPC, ruFUSION_ACTORSTATE_SIT_END )
		Sleep(15) NpcSay( NewNPC, "[SC_QUEST426115_00]" )
		Sleep(20) PlayMotion( NewNPC, ruFUSION_ACTORSTATE_ATTACK_1H )
		PlayMotion( NewNPC, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(35) NpcSay( NewNPC, "[SC_QUEST426115_01]" )
		Sleep(20) SetDefIdleMotion( NewNPC, ruFUSION_MIME_RUN_FORWARD )
		Sleep(10) DelObj( NewNPC )
		WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122145_00()
	local NPC=OwnerID()
	DisableQuest( NPC, true )
	AddBuff( NPC, 624177, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z25_QOOKIDSPLAY_00()
	local NPC=OwnerID()
	local NUM=Rand(5)
	Sleep(10)
	if NUM==0 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	else	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC122148_00()
	AddBuff( OwnerID(), 624183, 0, -1 ) 
End
----------------------------------------------------------------------------------------------------