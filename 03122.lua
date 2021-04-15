----------------------------------------------------------------------------------------------------
Function Z29_ITEM201558CHECK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckDistance( PID, NPC, 100 )==true then
		if ( CheckID( NPC )==true and
		ReadRoleValue( NPC, EM_RoleValue_IsDead )==0 and
		ReadRoleValue( NPC, EM_RoleValue_OrgID )==108232 ) then
			return true
		else	ScriptMessage( PID, PID, 1, "[SC_Q422754_01]", 0 )
			return false
		end
	else	ScriptMessage( PID, PID, 1, "[SC_Q422754_00]", 0 )
		return false
	end
End
Function Z29_ITEM201558USE_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local x, y, z, dir=0
	local Monster=0
	if CheckID( PID )==true then
		if CheckID( NPC )==true and 
		ReadRoleValue( NPC, EM_RoleValue_IsDead )==0 and
		ReadRoleValue( NPC, EM_RoleValue_OrgID )==108232 then
			SetAttack( NPC, PID )
			AddBuff( NPC, 623132, 0, 3 )
			x, y, z, dir=DW_Location( NPC )
			Monster=CreateObj( 103410, x, y, z, dir, 1 )
			AddToPartition( Monster, 0 )
			SetAttack( Monster, PID )
			AddBuff( Monster, 500428, 0, 3 )			
			CallPlot( NPC, "LuaFunc_ResetObj", NPC )
			return true
		else	ScriptMessage( NPC, PID, 1, "[SC_Q422754_01]", 0 )
			return false
		end
	else	return false
	end
End
Function Z29_NPC103410_00()
	local NPC=OwnerID()
	Sleep( 30 )
	if ReadRoleValue( NPC, EM_RoleValue_IsAttackMode )==0 then
		DelObj( NPC )
	end
End
Function Z29_NPC103410FIGHT_END()
	local NPC=OwnerID()
	CallPlot(  NPC , "Z29_NPC103410FIGHT_END_02", NPC)
End
Function Z29_NPC103410FIGHT_END_02(NPC)
	Sleep( 80 )
	DelObj( NPC)
End
----------------------------------------------------------------------------------------------------
Function Z29_Q422757TOUCH_00()
	if CheckID( OwnerID() )==false then return false
	else	local PID=OwnerID()
		local NPC=TargetID()
		if CheckAcceptQuest( PID, 422757 ) and
		CountBodyItem( PID, 201563 )>=1 then
			DW_QietKillOne( PID, 103731 )
			DelBodyItem( PID, 201567, 1 )
			return true
		else	return false
		end
	end
End
Function Z29_Q422757SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 422757 )==true and
	CheckFlag( PID, 542592 )==true and CheckFlag( PID, 542593 )==true and CheckFlag( PID, 542594 )==true then
		SetFlag( PID, 542591, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC121529_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_SIT )
	local PID=OwnerID()
	local NPC=TargetID()
	SetPlot( PID, "range", "Z29_Q423091RANGE_00", 100 )
End
Function Z29_Q423091RANGE_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 423091 )==true and
	CheckFlag( PID, 542595 )==false then
		SetFlag( PID, 542595, 1 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_Q422755SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q422755_01") )
	AddSpeakOption( PID, NPC, "[SC_Q422755_02]", "Z29_Q422755SPEAK_01", 0 )
End
Function Z29_Q422755SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q422755_03") )
	AddSpeakOption( PID, NPC, "[SC_Q422755_04]", "Z29_Q422755SPEAK_02", 0 )
End
Function Z29_Q422755SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, GetString("SC_Q422755_05") )
	AddSpeakOption( PID, NPC, "[SC_Q422755_06]", "Z29_Q422755SPEAK_03", 0 )
End
Function Z29_Q422755SPEAK_03()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 542596, 1 )
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z29_Q423095TOUCH_00()
	if CheckID( OwnerID() )==false then return false
	else	local PID=OwnerID()
		local NPC=TargetID()
		local NPCID=ReadRoleValue( NPC, EM_RoleValue_PID )
		local Index=0
		if NPCID==1 then Index=542598
		elseif NPCID==2 then Index=542599
		else Index=542600
		end
		if CheckAcceptQuest( PID, 423095 ) and
		CountBodyItem( PID, 201567 )>=1 and
		CheckFlag( PID, Index )==false then
			DW_QietKillOne( PID, 103406 )
			DelBodyItem( PID, 201567, 1 )
			SetFlag( PID, Index, 1 )
			return true
		else	return false
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_Q423096TOUCH_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local QuestItem = 201568
	if CheckID( Player )==false then
		return false
	end
	if ( CheckAcceptQuest( Player, 423096 ) or
	CheckAcceptQuest( Player, 423678 ) or
	CheckAcceptQuest( Player, 424006 ) ) and
	CountBodyItem( Player, QuestItem ) >=1 then
		DW_QietKillOne( Player, 103407 )
		DelBodyItem( Player, QuestItem, 1 )
		CallPlot( NPC, "Z29_Q423096TOUCH_01", NPC )
		return true
	else	return false
	end
End
Function Z29_Q423096TOUCH_01( Ctrl )
	local NPC=ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	local Num=DW_Rand(10)*10
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )
	SetModeEx( NPC, EM_SetModeType_Show, true )
	Sleep( 300+Num )
	SetModeEx( NPC, EM_SetModeType_Show, false )
	SetModeEx( Ctrl, EM_SetModeType_Mark, true )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC103420DEAD_00()
	local NPC=OwnerID()
	CallPlot( NPC, "Z29_NPC103420DEAD_01", NPC )
	return true
End
Function Z29_NPC103420DEAD_01( NPC )
	CastSpell( NPC, NPC, 494640 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC121525_00()
	AddBuff( OwnerID(), 500568, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC103409MOTION_00()
	local NPC=OwnerID()
	PlayMotion( NPC, ruFUSION_ACTORSTATE_MINING_BEGIN )
	Sleep( 80 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_MINING_END )
End
Function Z29_NPC103409MOTION_01()
	local NPC=OwnerID()
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_BEGIN )
	Sleep( 250 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_SIT_END )
	Sleep( 30 )
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC121527_00()
	local Ctrl=OwnerID()
	local NPC=SearchRangeNPC( Ctrl, 40 )
	for i=0, table.getn( NPC ), 1 do
		if ReadRoleValue( NPC[ i ], EM_RoleValue_OrgID )==121531 then
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, NPC[ i ] )
			SetModeEx( NPC[ i ], EM_SetModeType_Show, false )
			return
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z29_NPC122259_00()
	AddBuff( OwnerID(), 500569, 0, -1 )
End
----------------------------------------------------------------------------------------------------