----------------------------------------------------------------------------------------------------
Function Z32_NPC123843Craft_00()
	local NPC = OwnerID()
	local Num = 0
	MoveToFlagEnabled( NPC, false )
	Num = DW_Rand( 2 )
	Sleep( Num*10 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( 90 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_END )
	Num = DW_Rand( 2 )
	Sleep( Num*10 )
	Num = DW_Rand( 4 )
	if Num == 1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num == 2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num == 3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	end
	Num = DW_Rand( 2 )
	Sleep( 20+Num*10 )
	MoveToFlagEnabled( NPC, true )
end
----------------------------------------------------------------------------------------------------
Function Z32_Q427129TOUCH_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local FlagID = 781408
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local POS = ReadRoleValue ( NPC, EM_RoleValue_PID )
	if CheckID( Player ) == true and NPCOrgID==123844	then
		SetPosByFlag( Player, FlagID, POS )
		return true
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123845_00()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_STAND )
	MoveToFlagEnabled( Ctrl, false )
	Sleep( 10 )
	PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( 40 )
	PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	MoveToFlagEnabled( Ctrl, true )
End
Function Z32_NPC123845MOVE_00()
	local Ctrl = OwnerID()
	local NPC = 0 
	local Num = 0
	local Counter = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	MoveToFlagEnabled( Ctrl, false )
	NPC = SearchRangeNPC( Ctrl, 100 )
	for i = 0, #NPC, 1 do
		if ReadRoleValue( NPC[ i ], EM_RoleValue_IsAttackMode ) == 1 then
			PlayMotion( Ctrl, ruFUSION_ACTORSTATE_NORMAL )
			Sleep( 10 )
			if CheckID( NPC[ i ] ) == true then
				AdjustFaceDir( Ctrl, NPC[ i ], 180 )
			end
			SetDefIdleMotion( Ctrl, ruFUSION_MIME_RUN_FORWARD )
			CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
		end
	end
	Num = DW_Rand( 3 )
	if Counter <= 5+Num then
		Counter = Counter+1
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, Counter )
	else
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
		PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CRAFTING_END )
		Sleep( 30 )
		Num = DW_Rand( 2 )
		if Num == 1 then
			PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		else
			PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		end
		Sleep( 50 )
		PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		Sleep( 40 )
		PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	end
	MoveToFlagEnabled( Ctrl, true )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC108715CombatEnd_00()
	MoveToFlagEnabled( OwnerID(), true )
End
Function Z32_NPC108715SIT_00()
	local NPC = OwnerID()
	local Num = 0
	MoveToFlagEnabled( NPC, false )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_BEGIN )
	Sleep( 20 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_LOOP )
	Num = DW_Rand( 5 )
	Sleep( 250+Num*10 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_END )
	Sleep( 30 )
	Num = DW_Rand( 4 )
	if Num == 1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num == 2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num == 3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	end
	Sleep( 30 )
	MoveToFlagEnabled( NPC, true )
End
Function Z32_NPC108715WALK_00()
	local NPC = OwnerID()
	local Num = 0
	MoveToFlagEnabled( NPC, false )
	Sleep( 20 )
	while 1 do
		Num = DW_Rand( 3 )
		if Num == 1 then
			MoveToFlagEnabled( NPC, true )
			return
		else
			Num = DW_Rand( 4 )
			if Num == 1 then
				PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
			elseif Num == 2 then
				PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
			elseif Num == 3 then
				PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
			else
				PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
			end
			Num = DW_Rand( 2 )
			Sleep( Num*10+30 )
		end
	end
End
Function Z32_NPC108715SPEAK_00()
	local NPC = OwnerID()
	local Num = 0
	MoveToFlagEnabled( NPC, false )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 50 )
	Num = DW_Rand( 2 )
	if Num == 1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	end
	Sleep( 50 )
	Num = DW_Rand( 4 )
	if Num == 1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	elseif Num == 2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num == 3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	end
	Sleep( 40 )
	MoveToFlagEnabled( NPC, true )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123844_00()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local ArrowID = 123846
	local ArrowObj = CreateObj( ArrowID, x, y+30, z, dir, 1 )
	SetModeEx( ArrowObj, EM_SetModeType_Gravity, false )
	SetModeEx( ArrowObj, EM_SetModeType_Mark, false )
	AddToPartition( ArrowObj, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123799_00()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local FXID = 123860
	local FXObj = CreateObj( FXID, x, y+22, z, dir, 1 )
	SetModeEx( FXObj, EM_SetModeType_Gravity, false )
	SetModeEx( FXObj, EM_SetModeType_Mark, false )
	AddToPartition( FXObj, 0 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, FXObj )
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427134TOUCH_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local FXObj = ReadRoleValue( NPC, EM_RoleValue_Register1 )
	if CheckID( FXObj ) == true then
		DelObj( FXObj )
	end
	CallPlot( NPC, "LuaFunc_resetObj", NPC )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123798_00()
	local NPC = OwnerID()
	local BookBuff = {}
	BookBuff[ 1 ] = 501609
	BookBuff[ 2 ] = 502086
	BookBuff[ 3 ] = 502087
	BookBuff[ 4 ] = 502088
	BookBuff[ 5 ] = 502089
	local Num = 0
	SetDefIdleMotion( NPC, ruFUSION_MIME_READING_LOOP )
	while 1 do
		for i = 1, #BookBuff, 1 do
			if CheckBuff( NPC, BookBuff[ i ] ) == true then
				CancelBuff( NPC, BookBuff[ i ] )
			end
		end
		Num = DW_Rand( 5 )
		AddBuff( NPC, BookBuff[ Num ], 0, -1 )
		Sleep( 300+Num*10 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123797_00()
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )
End
----------------------------------------------------------------------------------------------------