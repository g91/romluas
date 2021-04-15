----------------------------------------------------------------------------------------------------
Function Z30_PirateBattleCtrl_00()
	local NPC=OwnerID()
	SetFlag( NPC, 544801, 1 )
	MoveToFlagEnabled( NPC, false )
	AddBuff( NPC, 623132, 0, -1 )
	LockHP( NPC, ReadRoleValue( NPC, EM_RoleValue_MaxHP )*0.25 , "Lua_424225_LockHP" )
	if ReadRoleValue( NPC, EM_RoleValue_OrgID )==104042 then
		return
	else
		SetPlot( NPC, "range", "Z30_PirateBattleCtrl_01", 80 )
	end
End
Function Z30_PirateBattleCtrl_01()
	local Player=OwnerID()
	local NPC=TargetID()
	local Num=0
	if ReadRoleValue( NPC, EM_RoleValue_IsAttackMode )==0 then
		return
	end
	Num=DW_Rand( 5 )
	if Num==1 then
		NpcSay( NPC, "[Z30_PIRATEBATTLE_01]" )
	elseif Num==2 then
		NpcSay( NPC, "[Z30_PIRATEBATTLE_02]" )
	elseif Num==3 then
		NpcSay( NPC, "[Z30_PIRATEBATTLE_03]" )
	elseif Num==4 then
		NpcSay( NPC, "[Z30_PIRATEBATTLE_04]" )
	elseif Num==5 then
		NpcSay( NPC, "[Z30_PIRATEBATTLE_05]" )
	else
		return
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_BattleSmoke_00()
	AddBuff( OwnerID(), 500578, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC103417MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 2 )
	if Num==1 then PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	else PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC103418MOVE_00()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_JUMP_INPLACE )
End
----------------------------------------------------------------------------------------------------
Function Z30_Q424730TOUCH_00()
	local Player=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand( 3 )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		if Num==1 then
			NpcSay( NPC, "[SC_Q424762_00]" )
		elseif Num==2 then
			NpcSay( NPC, "[SC_Q424762_01]" )
		else
			NpcSay( NPC, "[SC_Q424762_02]" )
		end
		return true
	else	ScriptMessage( NPC, Player, 1, "[SC_422804]", 0 )
		return false
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q424762TOUCH_00()
	local Player=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand( 3 )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		if Num==1 then
			NpcSay( NPC, "[SC_Q424762_00]" )
		elseif Num==2 then
			NpcSay( NPC, "[SC_Q424762_01]" )
		else
			NpcSay( NPC, "[SC_Q424762_02]" )
		end
		return true
	else	ScriptMessage( NPC, Player, 1, "[SC_422804]", 0 )
		return false
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q424730TOUCH_01()
	local Player=OwnerID()
	local NPC=TargetID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	CallPlot( NPC, "Z30_NPC123333TOUCH_00", NPC )
	DW_QietKillOne( Player, 103750 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z30_Q424762TOUCH_01()
	local Player=OwnerID()
	local NPC=TargetID()
	CallPlot( NPC, "Z30_NPC123333TOUCH_00", NPC )
	DW_QietKillOne( Player, 103750 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC123333TOUCH_00( NPC )
	local Num=DW_Rand( 3 )
	CancelBuff( NPC, 500587 )
	Sleep( 05 )
	if Num==1 then
		NpcSay( NPC, "[SC_Q424762_03]" )
	elseif Num==2 then
		NpcSay( NPC, "[SC_Q424762_04]" )
	else	
		NpcSay( NPC, "[SC_Q424762_05]" )
	end
	Sleep( 10 ) SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
	Sleep( 10 ) CallPlot( NPC, "LuaFunc_ResetObj", NPC )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC123480_00()
	local Ctrl=OwnerID()
	local Switch=WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	local x, y, z, dir=DW_Location( Ctrl )
	local NPC={}
	local Sum=0
	local Player={}
	local Index=0
	local FirstAttack=0
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	while 1 do
		Sleep( 35 )
		Sum=0
		NPC=SearchRangeNPC( Ctrl, 400 )
		for i=0, table.getn( NPC ), 1 do
			if ( ReadRoleValue( NPC[ i ], EM_RoleValue_OrgID )==108429 or
			ReadRoleValue( NPC[ i ], EM_RoleValue_OrgID )==108490 ) then
				if ReadRoleValue( NPC[ i ], EM_RoleValue_IsDead )==0 then
					Sum=Sum+1
				end
			end
		end
		Index=0
		Player=SearchRangePlayer( Ctrl, 200 )
		for j=0, table.getn( Player ), 1 do
			if CheckAcceptQuest( Player[ j ], 424723 )==true and
			CheckFlag( Player[ j ], 542601 )==false then
				Index=1
				if ReadRoleValue( Player[ j ], EM_RoleValue_IsAttackMode )==1 then
					AddBuff( Player[ j ], 500586, 0, -1 )
					FirstAttack=Player[ j ]
				end
			end
		end
		Switch=ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
		if ( Switch==0 and Sum<=3 and Index>=1 ) and
		ReadRoleValue( Ctrl, EM_RoleValue_Register2 ) == 0 then
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
			for k=0, table.getn( Player ), 1 do
				ScriptMessage( Ctrl, Player[ k ], 2, "[SC_Q424723_07]", 0 )
			end
			QuestTarget=CreateObj( 103820, x, y, z, dir, 1 )
			WriteRoleValue( QuestTarget, EM_RoleValue_Register1, Ctrl )
			AddToPartition( QuestTarget, 0 )
			MoveToFlagEnabled( QuestTarget, false )
			SetFlag( QuestTarget, 544801, 1 )
			AddBuff( QuestTarget, 623132, 0, -1 )
			LockHP( QuestTarget, ReadRoleValue( QuestTarget, EM_RoleValue_MaxHP)*0.20, "Z30_NPC103820BattleEnd_00" )
			SetAttack( QuestTarget, FirstAttack )
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_ITEM201586_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckID( PID )==false or CheckID( NPC )==false or
	CheckDistance( PID, NPC, 100 ) ==false or
	ReadRoleValue( NPC, EM_RoleValue_OrgID )~=103820 or
	ReadRoleValue( NPC, EM_RoleValue_IsDead )==1 ) then
		return false
	end
	CallPlot( NPC, "Z30_ITEM201586_01", PID, NPC )
	SetFlag( PID, 542601, 1 )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z30_ITEM201586_01( PID, NPC )
	local Ctrl=NPC
	local MainCtrl=ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	local Player={}
	local BuffLV=0
	local Ball=0
	local Hostage=0
	local Katha=0	
	local x, y, z, dir=DW_Location( Ctrl )
	local p, q, r, dirx=DW_Location( 781385, 1 )
	---------------------------------------------------------------------------------------
	Ball=CreateObj( 122702, p, q, r, dirx, 1 )
	Hostage=CreateObj( 123334, x, y-5, z, dir, 1 )
	Katha=CreateObj( 123335, x, y-5, z, dir, 1 )
	AddToPartition( Ball, 0 )
	Sleep( 20 )	
	MoveToFlagEnabled( Katha, false )
	MoveToFlagEnabled( Hostage, false )
	WriteRoleValue( Katha, EM_RoleValue_IsWalk , 0  )
	WriteRoleValue( Hostage, EM_RoleValue_IsWalk , 0  )
	SetDefIdleMotion( Katha, ruFUSION_MIME_IDLE_COMBAT_1H )
	SetDefIdleMotion( Hostage, ruFUSION_MIME_IDLE_COMBAT_1H )
	FaceObj( Katha, Ball )
	AddToPartition( Katha, 0 ) 
	AddToPartition( Hostage, 0 )
	---------------------------------------------------------------------------------------
	WriteRoleValue( MainCtrl, EM_RoleValue_Register2, 1 )
	SetStopAttack( Ctrl )
	SetModeEx( Ctrl, EM_SetModeType_Searchenemy, false )
	SetModeEx( Ctrl, EM_SetModeType_Fight, false )	
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )
	SetModeEx( Ctrl, EM_SetModeType_Show, false )
	SetModeEx( Ctrl, EM_SetModeType_Strikback, false )
	---------------------------------------------------------------------------------------
	Player=SearchRangePlayer( Ctrl, 200 )
	for i=0, table.getn( Player ), 1 do
		BuffLV=KS_CheckBuffLV( Player[ i ], 500586 )
		if CheckAcceptQuest( Player[ i ], 424723 )==true and
		CheckFlag( Player[ i ], 542601 )==false and
		BuffLV>=1 then
			SetFlag( PID, 542601, 1 )
		end
	end
	---------------------------------------------------------------------------------------
	Sleep( 20 ) NpcSay( Katha, "[SC_Q424723_00]" )
	Sleep( 20 ) LuaFunc_MoveToFlag( Katha, 781385, 1, 0 )
	NpcSay( Katha, "[SC_Q424723_01]" )
	Sleep( 20 ) CastSpell( Ball, Ball, 850351 )
	Sleep( 05 ) DelObj( Katha )
	Sleep( 05 ) DelObj( Ball )
	Sleep( 20 ) NpcSay( Hostage, "[SC_Q424723_02]" )
	Sleep( 20 ) FaceFlag( Hostage, 781385, 2 ) AdjustDir( Hostage, 0 )
	SetDefIdleMotion( Hostage, ruFUSION_MIME_RUN_FORWARD )
	Sleep( 20 ) WriteRoleValue( MainCtrl, EM_RoleValue_Register1, 0 )
	WriteRoleValue( MainCtrl, EM_RoleValue_Register2, 0 )
	DelObj( Hostage )
	DelObj( Ctrl )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC103820BattleEnd_00()
	local Katha=OwnerID()
	local MainCtrl=ReadRoleValue( Katha, EM_RoleValue_Register1 )
	Sleep( 20 ) NpcSay( Katha, "[SC_Q424723_03]" )
	Sleep( 25 )
	WriteRoleValue( MainCtrl, EM_RoleValue_Register1, 0 )
	WriteRoleValue( MainCtrl, EM_RoleValue_Register2, 0 )
	DelObj( Katha )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC123333_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_STAND )
	MoveToFlagEnabled( NPC, false )
	AddBuff( NPC, 500587, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC103429MOVE_00()
 	local NPC=OwnerID()
	local Num=DW_Rand( 5 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		Sleep( 30 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	elseif Num==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		Sleep( 30 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num==3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_CAST_BEGIN )
		Sleep( 30 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_CAST_END )
		Sleep( 10 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122709_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_CROUCH_BEGIN )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122554_00()
	local NPC=OwnerID()
	LockHP( NPC, ReadRoleValue( NPC, EM_RoleValue_MaxHP )*0.99 , "Lua_424225_LockHP" )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122710_00()
	local Ctrl=OwnerID()
	local Num=0
	local Player={}
	local x, y, z, dir=DW_Location( Ctrl )
	local Storm=CreateObj( 123352, x, y-6, z, dir, 1 )
	MoveToFlagEnabled( Storm, false )
	SetModeEx( Storm, EM_SetModeType_Save, false )
	SetModeEx( Storm, EM_SetModeType_Mark, false )
	SetModeEx( Storm, EM_SetModeType_Gravity, false )
	AddToPartition( Storm, 0 )
	while 1 do
		CastSpell( Ctrl, Ctrl, 490601 )
		Num=DW_Rand( 2 )
		Sleep( Num )
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122555_00()
	local NPC=OwnerID()
	local Index=WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	Addbuff( NPC, 623374, 0, -1 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_SNEAK_FORWARD )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122555MOVE_00()
	local NPC=OwnerID()
	local Index=ReadRoleValue( NPC, EM_RoleValue_Register1 )
	local Player={}
	local Num=0
	if Index==5 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
		Player=SearchRangePlayer( NPC, 800 )
		for i=0, table.getn( Player ), 1 do
			if ( CheckAcceptquest( Player[ i ], 424723 )==true and
			CheckCompletequest( Player[ i ], 424723 )==false and
			CheckFlag( Player[ i ], 542601 )==true ) then
				Num=DW_Rand( 3 )
				if Num==1 then NpcSay( NPC, "[SC_Q424723_04]" )
				elseif Num==2 then NpcSay( NPC, "[SC_Q424723_05]" )
				else NpcSay( NPC, "[SC_Q424723_06]" )
				end
				break
			end
		end
	else	Index=Index+1
		WriteRoleValue( NPC, EM_RoleValue_Register1, Index )
	end
	Num=DW_Rand( 5 )
	if Num==1 then
		MoveToFlagEnabled( NPC, false )
		SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_BOW )
		Sleep( 05 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_ATTACK_BOW_LOOP )
		Sleep( 45 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_SNEAK_FORWARD )
		MoveToFlagEnabled( NPC, true )
	elseif Num==2 then
		MoveToFlagEnabled( NPC, false )
		SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
		Sleep( 30 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_SNEAK_FORWARD )
		MoveToFlagEnabled( NPC, true )
	else	MoveToFlagEnabled( NPC, false )
		Sleep( 30 )
		MoveToFlagEnabled( NPC, true )
	end
end
----------------------------------------------------------------------------------------------------
Function Z30_NPCTEST999_00()
	CastSpell( OwnerID(), OwnerID(), 490602 )
End
----------------------------------------------------------------------------------------------------
Function WM_NpcGatherloop_00()
	local NPC=OwnerID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_GATHER_LOOP )
End
----------------------------------------------------------------------------------------------------
Function Z30_ITEM201590_00()
	local Player=OwnerID()
	local Num=DW_Rand( 5 )
	local Bonus=DW_Rand( 3 )
	local Stone={}
	Stone[ 1 ]=201571
	Stone[ 2 ]=201572
	Stone[ 3 ]=201573
	Stone[ 4 ]=201574
	Stone[ 5 ]=201575
	if Bonus==3 then
		Bonus=DW_Rand( 3 )
	else
		Bonus=1
	end
	GiveBodyItem( Player, Stone[ Num ], Bonus )
	return true
End
----------------------------------------------------------------------------------------------------