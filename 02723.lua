------------------------------------------------------------------------消滅元素制裁者
Function Z24_ELEMENTALPUNISHER_DEAD()
	local EPR=OwnerID()
	local PlayerID=TargetID()
	if CheckAcceptQuest( PlayerID, 425625 ) or
	CheckAcceptQuest( PlayerID, 425662 ) or
	CheckAcceptQuest( PlayerID, 425647 ) then
		DW_QietKillOne( PlayerID, 107111 )
	end
	if ReadRoleValue( EPR, EM_RoleValue_Register9 )==0 then
		WriteRoleValue( EPR, EM_RoleValue_Register9, 1 )
		local FireElement=0
		local x, y, z, dir=DW_Location( EPR )
		local FireElement=CreateObj( 107113, x, y, z, dir, 1 )
		SetModeEx( FireElement, EM_SetModeType_Searchenemy, false )
		SetModeEx( FireElement, EM_SetModeType_Strikback, false )
		AddToPartition( FireElement, 0 )
		WriteRoleValue( EPR, EM_RoleValue_Register9, 0 )
	End
	return true
End
------------------------------------------------------------------------消滅原型制裁者
Function Z24_PROTOTYPEPUNISHER_DEAD()
	if CheckAcceptQuest( TargetID(), 425626 ) or
	CheckAcceptQuest( TargetID(), 425663 ) or
	CheckAcceptQuest( TargetID(), 425648 ) then
		DW_QietKillOne( TargetID(), 107112 )
	end
End
------------------------------------------------------------------------憤怒火元素初始劇情
Function Z24_NPC107113_00()
	local FireElement=OwnerID()
	local num=0
	AddBuff( FireElement, 623800, 0, -1 )
	PlayMotion( FireElement, ruFUSION_ACTORSTATE_CAST_SP01 )
	Sleep(20)
	SetModeEx( FireElement, EM_SetModeType_Searchenemy, true )
	SetModeEx( FireElement, EM_SetModeType_Strikback, true )
End
------------------------------------------------------------------------憤怒火元素離開戰鬥後劇情
Function Z24_NPC107113_01()
	Callplot(OwnerID(),"Z24_NPC107113_02",0)
End
Function Z24_NPC107113_02()
	local FireElement=OwnerID()
	local num=0
	while 1 do
		if ReadRoleValue( FireElement, EM_RoleValue_IsAttackMode )==0 then
			num=num+1
			if num==30 then
				Delobj(FireElement)
			end
		else 	num=0
		end
		Sleep(10)
	end
End
------------------------------------------------------------------------使用聖樹氣息
Function Z24_CAST623136_00()
	if CheckDistance( OwnerID(), TargetID(), 100 )~=TRUE then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Z24ITEM241208_01]", 0 )--與目標的距離過遠！
		return false
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)~=107113 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Z24ITEM241208_02]", 0 )--使用的目標錯誤！
		return false
	end
end
Function Z24_CAST623136_01()
	DW_QietKillOne( OwnerID(), 107115 )
	SetStopAttack( TargetID() ) 
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_CAST_SP01 )
	Delobj(TargetID())
end
------------------------------------------------------------------------使用風花之籽
Function Z24_CAST623137_00()
	local HealthVine=0
	local SickVine=0
	local Num=0
	local WindSoul=0
	local NPC=SearchRangeNPC ( OwnerID() ,50 )
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)==121307 and
		CheckBuff( NPC[i], 623785 )==true then
			SickVine=NPC[i]
			Num=Num+1
		end
	end
	if Num==0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Z24ITEM241275_00]", 0 )--附近沒有需要修復的[121308]，使用失敗！
		Return
	end
	if Num>=1 then
		PlayMotion( OwnerID(), 115 )
		local X=ReadRoleValue( OwnerID(), EM_RoleValue_X )
		local Y=ReadRoleValue( OwnerID(), EM_RoleValue_Y )
		local Z=ReadRoleValue( OwnerID(), EM_RoleValue_Z )
		local location={x,y+10,z}
		WindSoul=Lua_DW_CreateObj( "xyz", 107130, location, 0, 1, 1 )
		SetModeEx( WindSoul, EM_SetModeType_Searchenemy , false )--不索敵
		SetModeEx( WindSoul, EM_SetModeType_Fight , false )--不可砍殺攻擊
		SetModeEx( WindSoul, EM_SetModeType_Strikback , false )--不反擊
		SetModeEx( WindSoul, EM_SetModeType_ShowRoleHead, false )--不顯示頭像框
		SetModeEx( WindSoul, EM_SetModeType_Mark, false )--不標記
		SetModeEx( WindSoul, EM_SetModeType_HideName , false )--顯示名稱
		SetModeEx( WindSoul, EM_SetModeType_Move , false )--無法移動
		SetModeEx( WindSoul, EM_SetModeType_NotShowHPMP, false )--顯示血量
		SetModeEx( WindSoul, EM_SetModeType_Gravity, false )--有重力
		SetModeEx( WindSoul, EM_SetModeType_Save, false )--不儲存
		AdjustFaceDir( WindSoul, SickVine, 0 )
		AddToPartition( WindSoul, 0 )
		WriteRoleValue( WindSoul, EM_RoleValue_Register1, OwnerID() )
		CallPlot( WindSoul, "Z24_CAST623137_01",SickVine )
	end
end
------------------------------------------------------------------------
Function Z24_CAST623137_01( SickVine )
	PlayMotion( OwnerID(), 20 )
	Sleep(10) PlayMotion( OwnerID(), 120 )
	Sleep(10) CastSpell( OwnerID(), SickVine, 850349 )
	Sleep(40) PlayMotion( OwnerID(), 121 )
	Sleep(30) CancelBuff( SickVine, 623785 ) AddBuff ( SickVine, 623744, 0, -1 )
	Sleep(05) DW_QietKillOne( ReadRoleValue( OwnerID(), EM_RoleValue_Register1 ), 107116 )
	Sleep(20) DelObj( OwnerID() )
end
------------------------------------------------------------------------諧和之藤
function z24_npc121307_00()
	local vine=ownerid()
	local BuffPos=0
	local BuffLv=0
	local num=0
	num=rand(3)
	if num>=1 then
		AddBuff ( vine, 623744, 0, -1 )
	else
		AddBuff ( vine, 623785, 0, -1 )
	end
	while 1 do
		sleep(50)
		num=rand(6)
		if CheckBuff( vine, 623744 )==true then
			AddBuff ( vine, 623744, 0, -1 )
			BuffPos=Lua_BuffPosSearch( vine, 623744 )
			BuffLv=BuffInfo( vine, BuffPos, EM_BuffInfoType_Power )
				if BuffLv>=15+num then
					CancelBuff( vine, 623744 )
					AddBuff ( vine, 623785, 0, -1 )
				end
		else
			AddBuff ( vine, 623785, 0, -1 )
			BuffPos=Lua_BuffPosSearch( vine, 623785 )
			BuffLv=BuffInfo( vine, BuffPos, EM_BuffInfoType_Power )
				if BuffLv>=15+num then
					CancelBuff( vine, 623785 )
					AddBuff ( vine, 623744, 0, -1 )
				end
		end
	end
end
------------------------------------------------------------------------使用冰雪之籽
Function Z24_CAST623138_00()
	PlayMotion( OwnerID(), 115 )
	local X=ReadRoleValue( OwnerID(), EM_RoleValue_X )
	local Y=ReadRoleValue( OwnerID(), EM_RoleValue_Y )
	local Z=ReadRoleValue( OwnerID(), EM_RoleValue_Z )
	local location={x,y+12,z}
	local locationFx={x,y,z}
	local IceSoul=Lua_DW_CreateObj( "xyz", 107131, location, 0, 1, 1 )
	local IceSoulFx=Lua_DW_CreateObj( "xyz", 121309, locationFx, 0, 1, 1 )
	SetModeEx( IceSoul, EM_SetModeType_Searchenemy , true )--不索敵
	SetModeEx( IceSoul, EM_SetModeType_Strikback , false )--不反擊
	SetModeEx( IceSoul, EM_SetModeType_ShowRoleHead, false )--不顯示頭像框
	SetModeEx( IceSoul, EM_SetModeType_Mark, false )--不標記
	SetModeEx( IceSoul, EM_SetModeType_HideName , false )--顯示名稱
	SetModeEx( IceSoul, EM_SetModeType_Move , false )--無法移動
	SetModeEx( IceSoul, EM_SetModeType_NotShowHPMP, false )--顯示血量
	SetModeEx( IceSoul, EM_SetModeType_Gravity, false )--有重力
	SetModeEx( IceSoul, EM_SetModeType_Save, false )--不儲存
	SetModeEx( IceSoulFx, EM_SetModeType_Searchenemy, false )--不索敵
	SetModeEx( IceSoulFx, EM_SetModeType_Fight , false )--不可砍殺攻擊
	SetModeEx( IceSoulFx, EM_SetModeType_Strikback , false )--不反擊
	SetModeEx( IceSoulFx, EM_SetModeType_ShowRoleHead, false )--不顯示頭像框
	SetModeEx( IceSoulFx, EM_SetModeType_Mark, false )--不標記
	SetModeEx( IceSoulFx, EM_SetModeType_HideName , true )--不顯示名稱
	SetModeEx( IceSoulFx, EM_SetModeType_Move , false )--無法移動
	SetModeEx( IceSoulFx, EM_SetModeType_NotShowHPMP, true )--不顯示血量
	SetModeEx( IceSoulFx, EM_SetModeType_Gravity, false )--有重力
	SetModeEx( IceSoulFx, EM_SetModeType_Save, false )--不儲存
	AddToPartition( IceSoul, 0 )
	AddToPartition( IceSoulFx, 0 )
	CallPlot( IceSoul, "Z24_CAST623138_01",OwnerID(), IceSoulFx )
End
------------------------------------------------------------------------
Function Z24_CAST623138_01(Player, IceSoulFx)
	local num=0
	local monster={}
	AddBuff( OwnerID(), 621602, 0, -1 )
	for i= 1, 5, 1 do
		monster=SearchRangeNPC ( OwnerID() ,100 )
		for i=0,table.getn(monster) do
			if ReadRoleValue( monster[i], EM_RoleValue_OrgID)==107109 or
			ReadRoleValue( monster[i], EM_RoleValue_OrgID)==107110 then
				num=num+1
			end
		end
	PlayMotion( OwnerID(), 122 )
	sleep(5)
	CastSpell( IceSoulFx, IceSoulFx, 850350 )
	sleep(15) 	if num==1 then DW_QietKillOne( Player, 107129 ) end
	end
	sleep(30)
	DelObj( IceSoulFx )
	DelObj( OwnerID() )
end
------------------------------------------------------------------------
Function Z24_CAST623138_02()
	local Punisher=TargetID()
	if ReadRoleValue( Punisher, EM_RoleValue_OrgID)==107109 or
	ReadRoleValue( Punisher, EM_RoleValue_OrgID)==107110 then
		return true
	else	return false
	end
end
------------------------------------------------------------------------使用緩滯之籽
function Z24_CAST622925_00()
	local num=0
	local core=0
	local npc=SearchRangeNPC ( OwnerID() ,120 )
	for i=0, table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID)==121541 then
			core=npc[i]
			num=num+1
		end
	end
	if num==0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Z24QUEST425631_00]", 0 )--你附近沒有[121541]！
	end
	if num>=1 then
		if ReadRoleValue( core, EM_RoleValue_Register1 )==0 then
			WriteRoleValue( core, EM_RoleValue_Register1, 1 )
			CallPlot( core, "Z24_ResetNPC121541_00", core )
			DW_QietKillOne( OwnerID(), 107210 )
			PlayMotion( OwnerID(), 115 )
		else	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Z24QUEST425631_01]", 0 )--你附近的[121541]目前已受到弱化！
		end
	end
end
------------------------------------------------------------------------
Function Z24_ResetNPC121541_00()
	local Core=OwnerID()
	local Num=Rand(20)+1
	SetModeEx( Core, EM_SetModeType_Show, false )
	SetModeEx( Core, EM_SetModeType_Mark, false )
	Sleep(450+Num*10)
	SetModeEx( Core, EM_SetModeType_Show, true )
	SetModeEx( Core, EM_SetModeType_Mark, true )
	WriteRoleValue( Core, EM_RoleValue_Register1, 0 )
End
------------------------------------------------------------------------
Function Z24_NPC120112_Motion00()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_BEGIN )
	Sleep(90) PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_END )	
end
------------------------------------------------------------------------
Function Z24_NPC121546_00()
	CallPlot( TargetID(), "Z24_NPC121546_01",TargetID() )
	return true
End
Function Z24_NPC121546_01()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SPAWN_BEGIN )
	Sleep(05) PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN )
	Sleep(50)	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_END )
End
------------------------------------------------------------------------
Function Z24_CAST623721_00()
	local PlayerID=OwnerID()
	local ElementPunisher=TargetID()
	local Num=0
	if CheckDistance( PlayerID, ElementPunisher, 100 )~=TRUE then
		ScriptMessage( PlayerID, PlayerID, 1, "[SC_Z24ITEM241208_01]", 0 )--與目標的距離過遠！
		return false
	end
	if ReadRoleValue( ElementPunisher, EM_RoleValue_OrgID )==107109 and
	ReadRoleValue( ElementPunisher, EM_RoleValue_IsDead)==0 then
		DW_QietKillOne( PlayerID, 106852 )
		Num=1
		CallPlot( ElementPunisher, "Z24_CAST623721_01", Num )
	end
	if ReadRoleValue( ElementPunisher, EM_RoleValue_OrgID )==107110 and
	ReadRoleValue( ElementPunisher, EM_RoleValue_IsDead)==0 then
		DW_QietKillOne( PlayerID, 106852 )
		Num=2
		CallPlot( ElementPunisher, "Z24_CAST623721_01", Num )
	end
	if Num==0 then
		ScriptMessage( PlayerID, PlayerID, 1, "[SC_Z24ITEM241208_02]", 0 )--使用的目標錯誤！
	end
	return
End
Function Z24_CAST623721_01(Num)
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register9 )==0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 1 )
		local ElementPunisher=OwnerID()
		local NormalPunisher=0
		local Deviation=10+rand(10)
		local x, y, z, dir=DW_Location( ElementPunisher )
		local FireElement=CreateObj( 107113, x+Deviation, y, z+Deviation, dir, 1 )
		if Num==1 then
			NormalPunisher=CreateObj( 121713, x, y, z, dir, 1 )
		else	NormalPunisher=CreateObj( 121714, x, y, z, dir, 1 )
		end
		SetModeEx( NormalPunisher, EM_SetModeType_Searchenemy, false )
		SetModeEx( NormalPunisher, EM_SetModeType_Fight, false )
		SetModeEx( NormalPunisher, EM_SetModeType_Strikback, false )
		AddToPartition( NormalPunisher, 0 )
		AddToPartition( FireElement, 0 )
		SetRandMove( FireElement, 40, 3, 40 ) 
		PlayMotion( NormalPunisher, ruFUSION_ACTORSTATE_DYING )
		CallPlot( NormalPunisher,"Z24_CAST623721_02", NormalPunisher )
		CallPlot( ElementPunisher,"LuaFunc_ResetObj", ElementPunisher )
	else return
	end
End
Function Z24_CAST623721_02(NormalPunisher)
	for i=1, 3, 1 do
		Sleep(25) 
		NpcSay( NormalPunisher, "[SC_Z24PUNISHERDETACH_01]" )
	end
	NpcSay( NormalPunisher, "[SC_Z24PUNISHERDETACH_02]" )
	AddBuff ( NormalPunisher, 623135, 0, -1 )
	Sleep(55) Delobj(OwnerID())
End
------------------------------------------------------------------------
Function Z24_Cast623806_00()
	local Punisher=OwnerID()
	local FireElement=TargetID()
	CallPlot( FireElement, "Z24_Cast623806_01", FireElement, Punisher )
End
Function Z24_Cast623806_01(FireElement, Punisher)
	local x, y, z, dir=DW_Location( FireElement )
	local Circle=CreateObj( 121308, x, y+20, z, dir, 1 )
	SetModeEx( Circle, EM_SetModeType_Gravity, false )
	SetModeEx( Circle, EM_SetModeType_Mark, false )
	SetModeEx( Circle, EM_SetModeType_HideName, true )
	SetModeEx( Circle, EM_SetModeType_NotShowHPMP, true )
	SetModeEx( Circle, EM_SetModeType_SearchenemyIgnore, true )
	WriteRoleValue( Circle, EM_RoleValue_IsWalk, 0  )
	MoveToFlagEnabled( Circle, false )
	AddToPartition( Circle, 0 )
	Sleep(20)
	CallPlot( Circle,"Z24_Cast623806_02", Circle, Punisher )
	Delobj(FireElement)
End
Function Z24_Cast623806_02(Circle, Punisher)
	AddBuff( Punisher, 623132, 0, 4 )
	local x, y, z, dir=DW_Location( Punisher )
	MoveDirect( Circle, x, y+20, z )
	Sleep(15)
	PlayMotion( Punisher, ruFUSION_ACTORSTATE_BUFF_SP01 )
	DelObj( Circle )
End
------------------------------------------------------------------------