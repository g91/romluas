----------------------------------------------------------------------------------------------------
Function Z25_NPC121787_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 425851 )==true and
	CountBodyItem( PID, 242174 )>=1 and
	CheckScriptFlag( PID, 547542 )==false then
		AddSpeakOption( PID, NPC, "[SC_QUEST425851_00]", "Z25_NPC121787_02", 0 )
	end
	LoadQuestOption( PID )
End
Function Z25_NPC121787_02()
	local PID=OwnerID()
	local NPC=TargetID()
	DelBodyItem( PID, 242174, -1 )
	SetScriptFlag( PID, 547542, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_QUEST425866_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 242145 )==0 then
		ScriptMessage( PID, PID, 1, "[SC_QUEST425866_00]", 0 )
	else	DW_QietKillOne( PID, 107626 )
		CallPlot( NPC, "Z25_FX121872_00", NPC )
	end
	return true
End
Function Z25_FX121872_00()
	local x, y, z, dir=DW_Location( OwnerID() )
	local SFX=CreateObj( 121872, x, y, z, dir, 1 )
	MoveToFlagEnabled( SFX, false )
	SetModeEx( SFX, EM_SetModeType_Mark, false )
	SetModeEx( SFX, EM_SetModeType_Save, false )
	AddToPartition( SFX, 0 )
	AddBuff( SFX, 623988, 0, -1 )
	Sleep( 270 ) DelObj( SFX )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC121820_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 425868 )==true and
	CountBodyItem( PID, 242176 )>=1 and
	CheckScriptFlag( PID, 547564 )==false then
		AddSpeakOption( PID, NPC, "[SC_QUEST425868_00]", "Z25_NPC121820_02", 0 )
	end
	if CheckAcceptQuest( PID, 426037 )==true and
	CountBodyItem( PID, 242217 )>=1 and
	CheckScriptFlag( PID, 547605 )==false then
		AddSpeakOption( PID, NPC, "[Z25_QUEST426037_00]", "Z25_NPC121820_03", 0 )
	end
	LoadQuestOption( PID )
End
Function Z25_NPC121820_02()
	local PID=OwnerID()
	local NPC=TargetID()
	DelBodyItem( PID, 242176, -1 )
	SetScriptFlag( PID, 547564, 1 )
	CloseSpeak( PID )
End
Function Z25_NPC121820_03()
	local PID=OwnerID()
	local NPC=TargetID()
	SetScriptFlag( PID, 547605, 1 )
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z25_QUEST425850_00()
	local PID=OwnerID()
	local NPC=TargetID()
	return true
End
Function Z25_QUEST425850_01()
	local PID=OwnerID()
	local NPC=TargetID()
	DelBodyItem( PID, 242173, 1 )
	GiveBodyItem( PID, 242174, 1 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC121788_01()--§Æ¨È¯÷¯S§ø¶Ç°e©¹ÄmÆF²½¾Â
	local PID=OwnerID()
	local NPC=TargetID()
	LoadQuestOption( PID )
	AddSpeakOption( PID, NPC, "[SC_NPC121788_00]", "Z25_NPC121788_02", 0 )
End
Function Z25_NPC121788_02()
	local PID=OwnerID()
	local NPC=TargetID()
	CloseSpeak( PID )
	SetPos( PID, -9681.3, 1698.3, -9403.9, 274.4 )
End
----------------------------------------------------------------------------------------------------
Function Z25_NPC107508_MOVE00()
	local SRD=OwnerID()
	SetDefIdleMotion( SRD, ruFUSION_MIME_IDLE_COMBAT_1H )
	local FXB=0
	local NUM=Rand(3)
	if NUM==0 then
		FXB=Lua_CreateObjByDir( SRD, 121904, 30, 0 )
		AddToPartition( FXB, 0 )
		MoveToFlagEnabled( FXB, false )
		SetModeEx( FXB, EM_SetModeType_Mark, false )
		Callplot( FXB, "Z25_NPC107508_MOVE01", FXB )
		NUM=Rand(4)
		if NUM==0 then
			NpcSay( SRD, "[SC_NPC107508_00]" )
		end
		if NUM==1 then
			NpcSay( SRD, "[SC_NPC107508_01]" )
		end
		if NUM==2 then
			NpcSay( SRD, "[SC_NPC107508_02]" )
		end
		CastSpell( SRD, FXB, 850634 )
	else return
	end
End
Function Z25_NPC107508_MOVE01()
	local FXB=OwnerID()
	Sleep( 100 )
	DelObj( FXB )
End
----------------------------------------------------------------------------------------------------
Function Z25_ALTAROFSOULS_BATTLE00()
	local Ctrl=OwnerID()
	local x, y, z, dir=DW_Location( Ctrl )
	local NUM=0
	local MSTR=0
	local SNPC=0
	NUM=DW_Rand(4)
	if NUM==1 then MSTR=CreateObj( 107487, x+20, y, z+20, dir, 1 ) end
	if NUM==2 then MSTR=CreateObj( 107487, x+20, y, z-20, dir, 1 ) end
	if NUM==3 then MSTR=CreateObj( 107487, x-20, y, z+20, dir, 1 ) end
	if NUM==4 then MSTR=CreateObj( 107487, x-20, y, z-20, dir, 1 ) end
	MoveToFlagEnabled( MSTR, false )
	AdjustFaceDir( MSTR, Ctrl, 0 )
	NUM=DW_Rand(4)
	if NUM==1 then SNPC=CreateObj( 107636, x+20, y, z+20, dir, 1 ) end
	if NUM==2 then SNPC=CreateObj( 107636, x+20, y, z-20, dir, 1 ) end
	if NUM==3 then SNPC=CreateObj( 107636, x-20, y, z+20, dir, 1 ) end
	if NUM==4 then SNPC=CreateObj( 107636, x-20, y, z-20, dir, 1 ) end
	MoveToFlagEnabled( SNPC, false )
	AdjustFaceDir( SNPC, Ctrl, 0 )
	AddToPartition( MSTR, 0 )
	AddToPartition( SNPC, 0 )
	AddBuff( MSTR, 623132, 0, -1 )
	AddBuff( Ctrl, 624042, 0, -1 )
	SetDefIdleMotion( SNPC, ruFUSION_MIME_IDLE_COMBAT_1H )
	while 1 do
		if CheckID( MSTR )==false then
			NUM=DW_Rand(4)
			if NUM==1 then MSTR=CreateObj( 107487, x+20, y, z+20, dir, 1 ) end
			if NUM==2 then MSTR=CreateObj( 107487, x+20, y, z-20, dir, 1 ) end
			if NUM==3 then MSTR=CreateObj( 107487, x-20, y, z+20, dir, 1 ) end
			if NUM==4 then MSTR=CreateObj( 107487, x-20, y, z-20, dir, 1 ) end
			MoveToFlagEnabled( MSTR, false )
			AdjustFaceDir( MSTR, Ctrl, 0 )
			AddToPartition( MSTR, 0 )
			AddBuff( MSTR, 623132, 0, -1 )
		end
		if CheckID( SNPC )==false then
			NUM=DW_Rand(4)
			if NUM==1 then SNPC=CreateObj( 107636, x+20, y, z+20, dir, 1 ) end
			if NUM==2 then SNPC=CreateObj( 107636, x+20, y, z-20, dir, 1 ) end
			if NUM==3 then SNPC=CreateObj( 107636, x-20, y, z+20, dir, 1 ) end
			if NUM==4 then SNPC=CreateObj( 107636, x-20, y, z-20, dir, 1 ) end
			MoveToFlagEnabled( SNPC, false )
			AdjustFaceDir( SNPC, Ctrl, 0 )
			AddToPartition( SNPC, 0 )
			SetDefIdleMotion( SNPC, ruFUSION_MIME_IDLE_COMBAT_1H )
		end
		if CheckID( MSTR )==true and CheckID( SNPC )==true then
			SetAttack( MSTR, SNPC )
			SetAttack( SNPC, MSTR )
		end
	sleep(30)
	end
end
----------------------------------------------------------------------------------------------------