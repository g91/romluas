----------------------------------------------------------------------------------------------------
Function Z25_NPC121917_01()
	local PID=OwnerID()
	local NPC=TargetID()
	LoadQuestOption( PID )
	if CheckAcceptQuest( PID, 426035 )==true and
	CheckScriptFlag( PID, 547604 )==false then
		AddSpeakOption( PID, NPC, GetString("Z25_QUEST426035_00"), "Z25_NPC121917_02", 0 )
	else return
	end
End
Function Z25_NPC121917_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547604, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_ITEM242217_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426038 )==true then
		return true
	else 	ScriptMessage( PID, PID, 2, "[SC_ITEM242217_00]", C_SYSTEM )
		return false
	end
End
Function Z25_ITEM242217_01()
	local PID=OwnerID()
	Addbuff( PID, 624069, 0, 180 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC121920_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetModeEx( NPC, EM_SetModeType_Show, true )
	SetPlot( NPC, "range", "Z25_NPC121920_01", 40 )
End
Function Z25_NPC121920_01()
	local PID=OwnerID()
	SetScriptFlag( PID, 547602, 1 )
End
Function Z25_NPC121920_02()
	local PID=OwnerID()
	local NPC=TargetID()
	LoadQuestOption( PID )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 and
	CheckAcceptQuest( PID, 426039 )==true and
	CheckScriptFlag( PID, 547603 )==false then
		AddSpeakOption( PID, NPC, GetString("Z25_QUEST426039_00"), "Z25_NPC121920_03", 0 )
	else return
	end
End
Function Z25_NPC121920_03()
	local PID=OwnerID()
	local NPC=TargetID()
	Callplot( NPC, "Z25_NPC121920_04", PID, NPC )
End
Function Z25_NPC121920_04( PID, NPC )
	CloseSpeak( PID )
	CancelBuff( PID, 624069 )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	local NUM=0
	local x, y, z, dir=DW_Location( NPC )
	local MST=CreateObj( 107669, x, y, z, dir, 1 )
	AddToPartition( MST, 0 )
	SetModeEx( NPC, EM_SetModeType_Mark, false )
	SetModeEx( NPC, EM_SetModeType_Show, false )
	SetAttack( MST, PID )
	while 1 do
		Sleep(30)
		if CheckID( MST )==true then
			NUM=NUM+1
		end
		if CheckDistance( NPC, MST, 200 )==true then
			NUM=NUM+1
		end
		if HateListCount( MST )>=1 then
			NUM=NUM+1
		end
		if NUM==3 then
			NUM=0
		else	Delobj( MST )
			Callplot( NPC, "Z25_NPC121920_05", NPC )
			return
		end
	end
End
Function Z25_NPC121920_05( NPC )
	Sleep(30)
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetModeEx( NPC, EM_SetModeType_Mark, true )
	LuaFunc_ResetObj( NPC ) 
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC107669_00()
	SetPlot( OwnerID(), "range", "Z25_NPC121920_01", 40 )
End
Function Z25_NPCDEAD107669_00()
	local NPC=OwnerID()
	local HLC=HateListCount(NPC)
	local PID=0
	for i=0, HLC, 1 do
		PID=HateListInfo( NPC, i, EM_HateListInfoType_GItemID )
		if CheckID( PID )==true and
		CheckAcceptQuest( PID, 426039 )==true and
		CheckScriptFlag( PID, 547603 )==false then
			SetScriptFlag( PID, 547603, 1 )
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPCSPEAK121924_00()
	local PID=OwnerID()
	local NPC=TargetID()
	LoadQuestOption( PID )
	if CheckAcceptQuest( PID, 426041 )==true and CheckScriptFlag( PID, 547684 )==false then
		AddSpeakOption( PID, NPC, GetString("Z25_QUEST426041_00"), "Z25_NPCSPEAK121924_01", 0 )
	elseif CheckAcceptQuest( PID, 426044 )==true and CheckScriptFlag( PID, 547686 )==false then
		AddSpeakOption( PID, NPC, GetString("Z25_QUEST426044_00"), "Z25_NPCSPEAK121924_02", 0 )
	else return
	end
End
Function Z25_NPCSPEAK121924_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547684, 1 )
	CloseSpeak( PID )
End
Function Z25_NPCSPEAK121924_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547686, 1 )
	GiveBodyItem( PID, 547687, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPCSPEAK121925_00()
	local PID=OwnerID()
	local NPC=TargetID()
	LoadQuestOption( PID )
	if CheckAcceptQuest( PID, 426042 )==true and
	CheckScriptFlag( PID, 547685 )==false then
		AddSpeakOption( PID, NPC, GetString("Z25_QUEST426042_00"), "Z25_NPCSPEAK121925_01", 0 )
	else return
	end
End
Function Z25_NPCSPEAK121925_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547685, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC121928_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetPlot( NPC, "range", "Z25_NPC121928_01", 100 )
	AddBuff( NPC, 620874, 0, -1 )
End
Function Z25_NPC121928_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local NUM=0
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		NUM=NUM+1
	end
	if CheckAcceptQuest( PID, 426045 )==true then
		NUM=NUM+1
	end
	if CountBodyItem( PID, 242240 )==0 or CountBodyItem( PID, 242331 )==0 then
		NUM=NUM+1
	end
	if NUM==3 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z25_NPC121928_02", NPC, PID )
	else return
	end
End
Function Z25_NPC121928_02( NPC, PID )
	local NUM=Rand(3)
	local x, y, z, dir=DW_Location( NPC )
	local MST=CreateObj( 107675, x, y, z, dir, 1 )
	AdjustFaceDir( MST, PID, 0 )
	AddToPartition( MST, 0 )
	if NUM==0 then
		NpcSay( MST, "[Z25_QUEST426045_00]" )
	end
	if NUM==1 then
		NpcSay( MST, "[Z25_QUEST426045_01]" )
	end
	if NUM==2 then
		NpcSay( MST, "[Z25_QUEST426045_02]" )
	end
	SetAttack( MST, PID )
	NUM=0
	while 1 do
		Sleep(30)
		if CheckID( MST )==true then
			NUM=NUM+1
		end
		if CheckDistance( NPC, MST, 200 )==true then
			NUM=NUM+1
		end
		if HateListCount( MST )>=1 then
			NUM=NUM+1
		end
		if NUM==3 then
			NUM=0
		else	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )	
			if ReadRoleValue( MST, EM_RoleValue_IsDead )==0 then				
				Delobj( MST )
				return
			else	return
			end
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC121959_00()--º²©¥¦a§Î¶Ë®`
	local NPC=OwnerID()
	SetModeEx( NPC, EM_SetModeType_Show, false )
	SetPlot( NPC, "collision", "Z25_NPC121959_01", 0 )
End
Function Z25_NPC121959_01()
	local PID=OwnerID()
	local NPC=TargetID()
	CastSpell( NPC, NPC, 850664 )
End
Function Z25_NPC121976_00()--º²©¥¦a§Î¶Ë®`
	local NPC=OwnerID()
	SetModeEx( NPC, EM_SetModeType_Show, false )
	SetPlot( NPC, "collision", "Z25_NPC121976_01", 0 )
End
Function Z25_NPC121976_01()
	local PID=OwnerID()
	local NPC=TargetID()
	CastSpell( NPC, NPC, 850665 )
End
Function Z25_NPC121977_00()--º²©¥¦a§Î¶Ë®`
	local NPC=OwnerID()
	SetModeEx( NPC, EM_SetModeType_Show, false )
	SetPlot( NPC, "collision", "Z25_NPC121977_01", 0 )
End
Function Z25_NPC121977_01()
	local PID=OwnerID()
	local NPC=TargetID()
	CastSpell( NPC, NPC, 850666 )
End
----------------------------------------------------------------------------------------------------