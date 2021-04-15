----------------------------------------------------------------------------------------------------
Function Z28_NPC108229MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 15 )
	if Num==1 then
		NpcSay( NPC, "[SC_NPC108229SPEAK_01]" )
	elseif Num==2 then
		NpcSay( NPC, "[SC_NPC108229SPEAK_02]" )
	else	
		return
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC123162SPEAK_00()--杖之鋼鐵守衛（智慧的考驗）
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426273 )==true or CheckAcceptQuest( PID, 426750 )==true or CheckAcceptQuest( PID, 426757 )==true ) and
	( CountBodyItem( PID, 243059 )==0 and CheckFlag( PID, 548659 )==false ) then
		AddSpeakOption( PID, NPC, "[SC_Q426273_01]", "Z28_NPC123162SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123162SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Switch=ReadRoleValue( NPC, EM_RoleValue_Register1 )
	if Switch==0 then
		CallPlot( NPC, "Z28_Createsteelguard_00", NPC, PID )
	else	return
	end
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC123163SPEAK_00()--刃之鋼鐵守衛（勇氣的考驗）
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426299 )==true or CheckAcceptQuest( PID, 426751 )==true or CheckAcceptQuest( PID, 426758 )==true ) and
	( CountBodyItem( PID, 243060 )==0 and CheckFlag( PID, 548676 )==false ) then
		AddSpeakOption( PID, NPC, "[SC_Q426273_01]", "Z28_NPC123163SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123163SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Switch=ReadRoleValue( NPC, EM_RoleValue_Register1 )
	if Switch==0 then
		CallPlot( NPC, "Z28_Createsteelguard_00", NPC, PID )
	else	return
	end
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC123164SPEAK_00()--斧之鋼鐵守衛（力量的考驗）
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426558 )==true or CheckAcceptQuest( PID, 426752 )==true or CheckAcceptQuest( PID, 426759 )==true ) and
	( CountBodyItem( OwnerID(), 243061 )==0 and CheckFlag( PID, 548677 )==false ) then
		AddSpeakOption( PID, NPC, "[SC_Q426273_01]", "Z28_NPC123164SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123164SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Switch=ReadRoleValue( NPC, EM_RoleValue_Register1 )
	if Switch==0 then
		CallPlot( NPC, "Z28_Createsteelguard_00", NPC, PID )
	else	return
	end
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------創建鋼鐵守衛
Function Z28_Createsteelguard_00( Ctrl, PID )
	local x, y, z, dir=DW_Location( Ctrl )
	local NPC=0
	local Num=0
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	SetModeEx( Ctrl, EM_SetModeType_Show, false )
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )
	if ReadRoleValue( Ctrl, EM_RoleValue_OrgID )==123162 then
		NPC=CreateObj( 107955, x, y, z, dir, 1 )
	elseif ReadRoleValue( Ctrl, EM_RoleValue_OrgID )==123163 then
		NPC=CreateObj( 107954, x, y, z, dir, 1 )
	else 	NPC=CreateObj( 107953, x, y, z, dir, 1 )
	end
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )
	SetModeEx( NPC, EM_SetModeType_Strikback, false )
	SetModeEx( NPC, EM_SetModeType_Fight, false )
	AddToPartition( NPC, 0 )
	SetHateListPoint( NPC, 0, 1 )
	Sleep( 05 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	Sleep( 10 ) AdjustFaceDir( NPC, PID, 0 )
	SetModeEx( NPC, EM_SetModeType_Searchenemy, true )
	SetModeEx( NPC, EM_SetModeType_Strikback, true )
	SetModeEx( NPC, EM_SetModeType_Fight, true )
	SetAttack( NPC, PID )
	while 1 do
		Sleep( 25 )
		if CheckID( NPC )==false or ReadRoleValue( NPC, EM_RoleValue_IsDead )~=0 then
			SetModeEx( Ctrl, EM_SetModeType_Show, true )
			SetModeEx( Ctrl, EM_SetModeType_Mark, true )
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			return
		else
			if ReadRoleValue( NPC, EM_RoleValue_IsAttackMode )==0 or
			CheckDistance( Ctrl, NPC, 250 )==false then		
				DelObj( NPC )		
			end
		end
	end
End
----------------------------------------------------------------------------------------------------化敵為友
Function Z28_NPC123165_00()
	local NPC=OwnerID()
	local Num=0
	local Time=0
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_BOW )
	while 1 do
		Num=DW_Rand( 8 )
		Time=DW_Rand( 6 )*10
		if Num==1 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
		elseif Num==2 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		elseif Num==3 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		elseif Num==4 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
		end
		Sleep( 90+Time )
	end
End
Function Z28_NPC123165SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckCompleteQuest( PID, 426583 )==false and
	CheckFlag( PID, 548429 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426583_01]", "Z28_NPC123165SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 426668 )==true and
	CheckFlag( PID, 548435 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426668_01]", "Z28_NPC123165SPEAK_03", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123165SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, "[SC_Q426583_02]" )
	AddSpeakOption( PID, NPC, "[SC_Q426583_03]", "Z28_NPC123165SPEAK_02", 0 )
End
Function Z28_NPC123165SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckFlag( PID, 548429 )==false then
		SetFlag( PID, 548429, 1 )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123165SPEAK_03()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 242770 )>=1 then
		DelBodyItem( PID, 242770, 1 )
		CastSpell( NPC, NPC, 491673 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_DODGE )
		SetFlag( PID, 548435, 1 )
		LoadquestOption( PID )
	else	ScriptMessage( PID, PID, 1, "[SC_Q426668_02]", 0 )
		CloseSpeak( PID )
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC123063MOVE_00()
	local NPC=OwnerID()
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
End
----------------------------------------------------------------------------------------------------
Function Z28_DelItem240977_00()--感音之眼
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240977, 8 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_DelItem240975_00()--能量裂口
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240975, 8 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_DelItem240974_00()--力量來源
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240974, 10 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_Q426760COMPLETE_00()--PE備用藥劑
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240974, 10 )
	Lua_ZonePE_3th_GetScore( 50 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_Q426761COMPLETE_00()--PE感音之眼
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240977, 8 )
	Lua_ZonePE_3th_GetScore( 100 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_Q426762COMPLETE_00()--PE能量裂口
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240977, 8 )
	Lua_ZonePE_3th_GetScore( 100 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_Q426763COMPLETE_00()--PE力量來源
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 240974, 10 )
	Lua_ZonePE_3th_GetScore( 100 )
	return
End
----------------------------------------------------------------------------------------------------
Function Z28_Q426680TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=0
	if CountBodyItem( PID, 240976 )==0 and
	CountBodyItem( PID, 240975 )==0 then
		ScriptMessage( PID, PID, 1, "[SC_Q426680_01]", 0 )
		return false
	end
	if CountBodyItem( PID, 240976 )==1 and
	CountBodyItem( PID, 240975 )==0 then
		DelBodyItem( PID, 240976, 1 )
		Num=Num+1
	end
	if CountBodyItem( PID, 240976 )==0 and
	CountBodyItem( PID, 240975 )>=1 then
		Num=Num+1
	end
	if Num==1 or Num==2 then
		GiveBodyItem( PID, 240975, 1 )
	return true
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC107947MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
	if Num==1 then
		Num=DW_Rand( 2 )
		if Num==1 then
			PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
		else	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		end
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC107948MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else 
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	end
	Sleep( 35 )
	Num=DW_Rand( 2 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN )
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC107950MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	Sleep( 10 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	elseif Num==3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	else return
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC107946MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 4 )
	Sleep( 10 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC107946_00()
	SetPlot( OwnerID(), "range", "Z28_NPC107946_01", 200 )
End
Function Z28_NPC107946_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand( 9 )
	if Num==1 then
		NpcSay( NPC, "[SC_107946_01]" )
	elseif Num==2 then
		NpcSay( NPC, "[SC_107946_02]" )
	elseif Num==3 then
		NpcSay( NPC, "[SC_107946_03]" )
	else return
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC123056MOVE_00()
	local NPC=OwnerID()
	local Num=DW_Rand( 5 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 10 )
	if Num==1 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE )
	elseif Num==2 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	elseif Num==3 then
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	else 	
		SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_STAND )
		return
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_CreateNPC107947_00()
	local Ctrl=OwnerID()
	local Count=WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z28_CreateNPC107947_01()
	local Ctrl=OwnerID()
	local Count=ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	local Location=DW_Rand( 4 )
	local Index=DW_Rand( 2 )
	local x,y,z,dir=DW_Location( 781344, Location )
	local NpcList={}
	local NPC=0
	NpcList[1]=107947
	NpcList[2]=107948
	if Count<5 then
		NPC=CreateObj( NpcList[Index], x, y, z, dir, 1 )
		AddToPartition( NPC, 0 )
		WriteRoleValue( NPC, EM_RoleValue_Register1, Ctrl )
		Count=Count+1
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, Count )
	end
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC108194BUFF_00()
	local NPC=OwnerID()
	AddBuff( NPC, 623132, 0, -1 )
	LockHP( NPC, ReadRoleValue( NPC, EM_RoleValue_MaxHP)*0.25, "Lua_424225_LockHP" )
End
----------------------------------------------------------------------------------------------------
Function Z28_NPC108195BUFF_00()
	local NPC=OwnerID()
	AddBuff( NPC, 623132, 0, -1 )
	LockHP( NPC, ReadRoleValue( NPC, EM_RoleValue_MaxHP)*0.25, "Lua_424225_LockHP" )
End
----------------------------------------------------------------------------------------------------
Function Z28_Steelguarddead_00()
	local NPC=OwnerID()
	local DBID=ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local Sum=HateListCount( NPC )
	local PID=0
	local KItem=0
	if	DBID==107953 then KItem=548677
	elseif	DBID==107954 then KItem=548676
	else
		KItem=548659
	end
	for i=0, Sum, 1 do
		PID=HateListInfo( NPC, i, EM_HateListInfoType_GItemID )
		SetFlag( PID, KItem, 1 )
	end
	return true
End
----------------------------------------------------------------------------------------------------