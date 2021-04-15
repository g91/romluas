----------------------------------------------------------------------------------------------------426671持續追蹤
Function Z28_NPC123061SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426671 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q426671_01]", "Z28_NPC123061SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 426583 )==true and
	CheckFlag( PID, 548433 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426583_04]", "Z28_NPC123061SPEAK_02", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123061SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, "[SC_Q426671_02]" )
	if CheckFlag( PID, 548342 )==false then
		SetFlag( PID, 548342, 1 )
	end
	CloseSpeak( PID )
End
Function Z28_NPC123061SPEAK_02()
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 548433, 1 )
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------426672生命之毒
Function Z28_DelItem243054_00()
	local NPC=OwnerID()
	local PID=TargetID()
	DelBodyItem( PID, 243054, 10 )
	return
End
----------------------------------------------------------------------------------------------------426673以毒攻毒
Function Z28_NPC123067SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( PID, 426673 )==true and
	CheckFlag( PID, 548426 )==false and
	CountBodyItem( PID, 243055 )>=1 ) then
		AddSpeakOption( PID, NPC, "[SC_Q426673_01]", "Z28_NPC123067SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123067SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 243055 )>=1 then
		DelBodyItem( PID, 243055, 1 )
		CastSpell( NPC, NPC, 491673 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_SIT )
		SetSpeakDetail( PID, "[SC_Q426673_02]" )
		SetFlag( PID, 548426, 1 )
		CloseSpeak( PID )
	else	ScriptMessage( PID, PID, 1, "[SC_Q426673_03]", 0 )
		CloseSpeak( PID )
		return
	end
End
----------------------------------------------------------------------------------------------------426674來龍去脈
Function Z28_NPC122805SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426674 )==true and
	CheckFlag( PID, 548427 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426674_01]", "Z28_NPC122805SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC122805SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	LoadquestOption( PID )
	SetFlag( PID, 548427, 1 )
End
----------------------------------------------------------------------------------------------------426675掌握情報
Function Z28_NPC123068_00()
	local NPC=OwnerID()
	local PID=TargetID()
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_CROUCH )
	AddBuff( NPC, 624029, 0, -1 )
	SetPlot( NPC, "range", "Z28_NPC123068_01", 100 ) 
End
Function Z28_NPC123068_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckFlag( PID, 548428 )==false then
		SetFlag( PID, 548428, 1 )
	end
End
Function Z28_NPC123068SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 426675 )==true then
		AddSpeakOption( PID, NPC, "[SC_Q426675_01]", "Z28_NPC123068SPEAK_01", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123068SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail( PID, "[SC_Q426675_02]" )
	if CheckFlag( PID, 548431 )==false then
		SetFlag( PID, 548431, 1 )
	end
	CloseSpeak( PID )
End
----------------------------------------------------------------------------------------------------426677釋放祭品
Function Z28_Q426677TOUCH_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CountBodyItem( PID, 243049 )>=1 then
		if CheckFlag( PID, 548429 )==false then
			if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
				WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
				CallPlot( NPC, "Z28_Q426677TOUCH_01", NPC )
				return true
			else 	ScriptMessage( PID, PID, 1, "[SC_Q426677_01]", 0 )--目前所使用的對象忙碌或重置中！
			end
		else 	ScriptMessage( PID, PID, 1, "[SC_Q426677_02]", 0 )--你已經完成此項任務，無法繼續使用！
		end
	else 	ScriptMessage( PID, PID, 1, "[SC_Q426677_03]", 0 )--使用失敗，你身上沒有[243049]！
	end
	return false
End
Function Z28_Q426677TOUCH_01( Cage )
	local OBJ=SearchRangeNPC( Cage, 50 )
	local PID=SearchRangePlayer ( Cage, 150 )
	local Hostage={}
	local Num=1
	local Rdn=0
	local Amount=0
	DisableQuest( Cage, true )
	for i=0, table.getn( OBJ ), 1 do
		if ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==123065 then
			DelObj( OBJ[i] )--刪除封印特效物件
		elseif ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==123066 then
			table.insert ( Hostage, Num, OBJ[i] )
			Num=Num+1
		end
	end
	Amount=table.getn( Hostage )	
	Sleep( 05 ) PlayMotion( Cage, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )--牢籠播放開啟動作
	for j=1, Amount, 1 do		
		SetDefIdleMotion( Hostage[j], ruFUSION_MIME_RUN_FORWARD )--人質播放跑步動作
		Rdn=DW_Rand( 10 )
		if Rdn==1 then NpcSay( Hostage[j], "[SC_Q426677_04]" )--人質隨機說話
		elseif Rdn==2 then NpcSay( Hostage[j], "[SC_Q426677_05]" )
		elseif Rdn==3 then NpcSay( Hostage[j], "[SC_Q426677_06]" )
		end
		DelObj( Hostage[j] )
	end
	for k=0, table.getn( PID ), 1 do--給予周圍玩家任務完成條件
		if CheckID( PID[k] )==true and
		CheckAcceptQuest( PID[k], 426677 )==true then
			for m=1, Amount, 1 do
				DW_QietKillOne( PID[k], 107951 )
			end
		end
	end
	Sleep( 30 ) PlayMotion( Cage, ruFUSION_ACTORSTATE_ACTIVATE_END )--牢籠播放關閉動作
	Sleep( 330 ) CallPlot( Cage, "Z28_NPC123026_00", Cage )--牢籠呼叫初始劇情
End
Function Z28_NPC123026_00()
	local NPC=OwnerID()
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )
	local x, y, z, dir=DW_Location( NPC )
	local Portal=0
	local Hostage={}
	local Num=DW_Rand( 4 )
	local OBJ=SearchRangeNPC( NPC, 100 )
	for i=0, table.getn( OBJ ), 1 do
		if ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==123065 or
		ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==123066 then
			DelObj( OBJ[i] )
		end
	end
	Portal=CreateObj( 123065, x, y-10, z, dir, 1 )
	SetModeEx( Portal, EM_SetModeType_Show, false )
	SetModeEx( Portal, EM_SetModeType_Save, false )
	SetModeEx( Portal, EM_SetModeType_Gravity, false )
	SetModeEx( Portal, EM_SetModeType_Mark, false )
	SetModeEx( Portal, EM_SetModeType_ShowRoleHead, false )
	SetModeEx( Portal, EM_SetModeType_HideName, true )
	MoveToFlagEnabled( Portal, false )
	AddToPartition( Portal, 0 )
	Hostage[1]=CreateObj( 123066, x+5, y+5, z-10, dir, 1 )
	Hostage[2]=CreateObj( 123066, x-10, y+5, z+5, dir, 1 )
	for j=1, 2, 1 do
		SetModeEx( Hostage[j], EM_SetModeType_Save, false )
		SetModeEx( Hostage[j], EM_SetModeType_Mark, false )
		SetModeEx( Hostage[j], EM_SetModeType_HideName, true )
		MoveToFlagEnabled( Hostage[j], false )
	end
	if Num==1 then
		DelObj( Hostage[1] )
		AddToPartition( Hostage[2], 0 )
	else	AdjustFaceDir( Hostage[1], NPC, 30 )
		AdjustFaceDir( Hostage[2], NPC, 150 )  	
		AddToPartition( Hostage[1], 0 )
		AddToPartition( Hostage[2], 0 )	
	end
	Sleep( 10 )
	SetModeEx( Portal, EM_SetModeType_Show, true )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	DisableQuest( NPC, false )
End
Function Z28_NPC123066_00()
	local NPC=OwnerID()
	local Num=0
	while 1 do
		Num=DW_Rand( 2 )
		if Num==1 then
			SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )			
		else	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_STAND )
		end
		Num=DW_Rand( 4 )*10
		Sleep( 50+Num )
	end
End
----------------------------------------------------------------------------------------------------426678赫夏檔案
Function Z28_NPC123060SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	
	if CheckAcceptQuest( PID, 426678 )==true and
		CheckFlag( PID, 548430 )==false then
		AddSpeakOption( PID, NPC, "[SC_Q426678_01]", "Z28_NPC123060SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 426627 )==true and
		CheckFlag( PID, 548405 )==false then
		AddSpeakOption( PID, NPC, "[SC_Z28Q426627_01]", "LuaPG_426627_Ask", 0 )
	else	LoadquestOption( PID )
	end
	LoadquestOption( PID )
End
Function Z28_NPC123060SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	LoadquestOption( PID )
	SetFlag( PID, 548430, 1 )
End
----------------------------------------------------------------------------------------------------426679一波未平
Function Z28_NPC122957_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_SIT )
End
----------------------------------------------------------------------------------------------------
Function Z28_Q426679Completed_00()
	local Player=TargetID()
	SetFlag( Player, 548432, 1 )
End
----------------------------------------------------------------------------------------------------