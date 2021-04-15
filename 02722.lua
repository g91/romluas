------------------------------------------------------------------------
Function Z24_NPC121111_01()--安德斯．索恩對話劇情
	if CheckAcceptQuest( OwnerID(),425400 )==true then
		SetSpeakDetail( OwnerID(), "[SC_QUEST425400_01]" )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_QUEST425400_04]", "Z24_NPC121111_02", 0 )
	else LoadQuestOption( OwnerID() )
	end
	if CheckAcceptQuest( OwnerID(), 425659 )==true or
	CheckAcceptQuest( OwnerID(), 425669 )==true then
		if CountBodyItem( OwnerID(), 241357 )>=1 then
			SetSpeakDetail( OwnerID(), "[SC_QUEST425400_01]" )
			AddSpeakOption( OwnerID(), TargetID(), "[SC_QUEST425400_04]", "Z24_NPC121111_03", 0 )
		else LoadQuestOption( OwnerID() )
		end
	else LoadQuestOption( OwnerID() )
	end
End
------------------------------------------------------------------------
Function Z24_NPC121111_02()--影像傳送魔法劇情跳板
	if CountBodyItem( OwnerID(), 241327 )>=1 or
	CheckFlag( OwnerID(), 546512 )==true then
		if ReadRoleValue( TargetID(), EM_RoleValue_Register1)==0 then
			WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
			SetModeEx( TargetID(), EM_SetModeType_ShowRoleHead, false )
			DisableQuest( TargetID(), true )
			CallPlot( TargetID(), "Z24_Quest425400_00", OwnerID() )
			DelBodyItem( OwnerID(), 241327, 1 )
			GiveBodyItem( OwnerID(), 546512, 1 )
			CloseSpeak( OwnerID() )
		else ScriptMessage( OwnerID(), OwnerID(), 2, "[SAY_NPC_BUSY]", C_SYSTEM )--目標正在忙碌中
		end
	else SetSpeakDetail( OwnerID(), "[SC_QUEST425400_00]" )
	end
End
------------------------------------------------------------------------
function Z24_NPC121111_03()
	local num=0
	if CountBodyItem( OwnerID(), 241327 )>=1 then
		num=num+1
	else 	SetSpeakDetail( OwnerID(), "[SC_QUEST425400_00]" )
	end
	if CountBodyItem( OwnerID(), 241357 )>=1 then
		num=num+1
	else ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_424151_2]", C_SYSTEM )
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1)==0 then
		num=num+1
	else ScriptMessage( OwnerID(), OwnerID(), 2, "[SAY_NPC_BUSY]", C_SYSTEM )
	end
	if num>=3 then
		CallPlot( TargetID(), "Z24_NPC121111_04", OwnerID() )
	end
end
------------------------------------------------------------------------
function Z24_NPC121111_04(PlayerID)
	local Anders=ownerid()
	local npc={}
	local machine=0
	local fxball=0
	DW_QietKillOne( PlayerID, 106618 )
	DelBodyItem( PlayerID, 241327, 1 )
	DelBodyItem( PlayerID, 241357, 1 )
	WriteRoleValue( Anders, EM_RoleValue_Register1, 1 )
	SetModeEx( Anders, EM_SetModeType_ShowRoleHead, false )
	DisableQuest( Anders, true )
	CloseSpeak( PlayerID )
	npc=SearchRangeNpc( Anders, 100 )
	for i=0,table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID)==121127 then
			fxball=npc[i]
		end
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID)==121126 then
			machine=npc[i]
		end
	end
	AdjustFaceDir( Anders, machine, 0 )
	PlayMotion( Anders, 131 )
	CastSpell( fxball, fxball, 850335 )
	sleep(20) PlayMotion( OwnerID(), 133 )
	sleep(10) AdjustFaceDir( Anders, machine, -120 )
	DisableQuest( Anders, false )
	SetModeEx( Anders, EM_SetModeType_ShowRoleHead, true )
	WriteRoleValue( Anders, EM_RoleValue_Register1, 0 )
end
------------------------------------------------------------------------
Function Z24_Quest425400_00(Player)--開啟影像傳送魔法
	local ACT01=0--影像傳送特效球
	local ACT02=0--元素學派首席
	local ACT03=0--影像傳送儀器
	MoveToFlagEnabled( OwnerID(), false )
	local Scholar=SearchRangeNPC ( OwnerID() ,100 ) 
	for i=0,table.getn(Scholar) do
		if ReadRoleValue( Scholar[i], EM_RoleValue_OrgID)==121127 then
			ACT01=Scholar[i]
		end
		if ReadRoleValue( Scholar[i], EM_RoleValue_OrgID)==121126 then
			ACT03=Scholar[i]
		end
	end
	Sleep(15)
	AdjustFaceDir( OwnerID(), ACT03, 0 )
	ScriptMessage( OwnerID(), Player, 2, "[SC_QUEST425400_02]", C_SYSTEM )--賢者之眼研究員－[121116]正在開啟影像傳送！
	Sleep(05)
	PlayMotion( OwnerID(), 131 )
	Sleep(55)
	local x=ReadRoleValue(ACT01,EM_RoleValue_X)
	local y=ReadRoleValue(ACT01,EM_RoleValue_Y)
	local z=ReadRoleValue(ACT01,EM_RoleValue_Z)
	local location={x,y-20,z}
	ACT02=Lua_DW_CreateObj( "xyz", 121112, location, 0, 1, 1 )
	SetModeEx( ACT02, EM_SetModeType_Searchenemy , false )-- 索敵
	SetModeEx( ACT02, EM_SetModeType_Fight , false )-- 可砍殺攻擊
	SetModeEx( ACT02, EM_SetModeType_Strikback , false )-- 反擊
	SetModeEx( ACT02, EM_SetModeType_ShowRoleHead, true )-- 頭像框
	SetModeEx( ACT02, EM_SetModeType_Mark, true )-- 標記
	SetModeEx( ACT02, EM_SetModeType_HideName , false )-- 名稱
	SetModeEx( ACT02, EM_SetModeType_Move , false )-- 移動
	SetModeEx( ACT02, EM_SetModeType_NotShowHPMP, false )-- HP
	SetModeEx( ACT02, EM_SetModeType_Gravity, false )--重力
	SetModeEx( ACT02, EM_SetModeType_Save, false )--儲存
	AddBuff ( ACT02, 623135, 0, 30)
	SetDefIdleMotion( ACT02, ruFUSION_MIME_EMOTE_SPEAK)
	AdjustFaceDir( ACT02, Player, 0 )
	AddToPartition( ACT02, 0 )
	CallPlot( ACT02, "Z24_NPC121112_00", ACT02 )
	Sleep(155)
	ScriptMessage( OwnerID(), Player, 2, "[SC_QUEST425400_03]", C_SYSTEM )--聖樹果實的能量即將耗盡，影像傳送結束！
	Sleep(55)
	DelObj ( ACT02 )
	Sleep(30)
	PlayMotion( OwnerID(), 133 )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, true )--恢復開啟頭像框
	DisableQuest( OwnerID(), false )
	Sleep(15)
	AdjustFaceDir( OwnerID(), ACT03, -120 )
	MoveToFlagEnabled( OwnerID(), true )
End
------------------------------------------------------------------------
Function Z24_Quest425400_01()
	local Will=OwnerID()
	local Player=TargetID()
	local Switch=ReadRoleValue( Will, EM_RoleValue_Register1 )
	if Switch==1 then return
	else	WriteRoleValue( Will, EM_RoleValue_Register1, 1 )
		AddBuff( Player, 623382, 0, 15 )
		local x, y, z, dir=DW_Location( Will )
		local TempWill=CreateObj( 121353, x, y, z, dir, 1 )
		SetModeEx( TempWill, EM_SetModeType_Mark, false )
		SetModeEx( TempWill, EM_SetModeType_ShowRoleHead, false )
		SetModeEx( TempWill, EM_SetModeType_HideName , true )
		SetModeEx( TempWill, EM_SetModeType_NotShowHPMP, true )
		SetModeEx( TempWill, EM_SetModeType_Save, false )
		MoveToFlagEnabled( TempWill, false )
		WriteRoleValue( TempWill, EM_RoleValue_IsWalk, 1 )
		AddToPartition( TempWill, 0 )
		Sleep(15) NpcSay( TempWill, "[SC_QUEST425400_05]" )
		Sleep(20) LuaFunc_MoveToFlag( TempWill, 781211, 0, 0 )
		AdjustFaceDir( TempWill, Player, 0 )
		Sleep(05) NpcSay( TempWill, "[SC_QUEST425400_06]" )
		Sleep(30) FaceFlag( TempWill, 781211, 1 ) AdjustDir( TempWill, 0 )
		SetDefIdleMotion( TempWill, ruFUSION_MIME_WALK_FORWARD )
		Sleep(10) DelObj( TempWill )
		WriteRoleValue( Will, EM_RoleValue_Register1, 0 )
	end
End
------------------------------------------------------------------------
Function Z24_Quest425400_02()
	local Tannis=OwnerID()
	local Player=TargetID()
	local Fxball=0
	local Switch=0
	local NPC=SearchRangeNPC ( Tannis, 50 )
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)==121127 then
			Fxball=NPC[i]
		end
	end
	Switch=ReadRoleValue( Fxball, EM_RoleValue_Register1 )
	if Switch==1 then
		return
	else	WriteRoleValue( Fxball, EM_RoleValue_Register1, 1 )
		Callplot( Fxball, "Z24_Quest425400_03", Fxball, Player )
	end
	AddBuff( Player, 623388, 0, 10 )
end
Function Z24_Quest425400_03(Fxball, Player)
	local Ria=0
	Ria=CreateObjByFlag( 121115, 781186, 0 , 1 )
	WriteRoleValue( Ria, EM_RoleValue_IsWalk, 0 )
	MoveToFlagEnabled( Ria, false )
	SetDefIdleMotion( Ria, ruFUSION_MIME_RUN_FORWARD )
	AddToPartition( Ria, 0 )
	Sleep(15) SetDefIdleMotion( Ria, ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep(10) NpcSay( Ria, "[SC_QUEST425400_07]" )
	Sleep(10) LuaFunc_MoveToFlag( Ria, 781186, 1, 0 )
	AdjustFaceDir( Ria, Player, 0 )
	Sleep(10) NpcSay( Ria, "[SC_QUEST425400_08]" )
	Sleep(35) Delobj( Ria )
	WriteRoleValue( Fxball, EM_RoleValue_Register1, 0 )
End
------------------------------------------------------------------------
Function Z24_NPC121112_00()
	local Tannis=OwnerID()
	local PlayerID={}
	Sleep(20)
	while 1 do
		Sleep(10)
		PlayerID=SearchRangePlayer( Tannis, 100 )
		for sn=0, table.getn(PlayerID), 1 do
			if  CheckAcceptQuest( PlayerID[sn], 425400 )==true then
				if CountBodyItem( PlayerID[sn], 546514 )==0 then
					SetScriptFlag( PlayerID[sn], 546514, 1 )
				end
			end
		end
	end
End
------------------------------------------------------------------------
Function Z24_Quest425401_01()
	local Ria=OwnerID()
	local Player=TargetID()
	local TempRia=0
	local Switch=ReadRoleValue( Ria, EM_RoleValue_Register1 )
	if Switch==1 then return
	else	WriteRoleValue( Ria, EM_RoleValue_Register1, 1 )
		AddBuff( Player, 623392, 0, 15 )	
		TempRia=CreateObjByFlag( 121117, 781186, 1, 1 )
		WriteRoleValue( TempRia, EM_RoleValue_IsWalk, 0 )
		MoveToFlagEnabled( TempRia, false )
		SetDefIdleMotion( TempRia, ruFUSION_MIME_IDLE_COMBAT_1H )
		Sleep(05) FaceFlag ( TempRia, 781186, 0 )
		AddToPartition( TempRia, 0 )
		Sleep(10) NpcSay( TempRia, "[SC_QUEST425401_00]" )
		LuaFunc_MoveToFlag( TempRia, 781186, 0, 0 )
		Sleep(10) NpcSay( TempRia, "[SC_QUEST425401_01]" )
		Sleep(20) SetDefIdleMotion( TempRia, ruFUSION_MIME_RUN_FORWARD )
		Sleep(05) Delobj( TempRia )
		WriteRoleValue( Ria, EM_RoleValue_Register1, 0 )
	End
End
------------------------------------------------------------------------
Function Z24_NPC121114_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_CROUCH_LOOP )
End
------------------------------------------------------------------------
Function Z24_NPC121114_01()
	local Player=OwnerID()
	local Ria=TargetID()
	LoadQuestOption( Player )
	if CheckAcceptQuest( Player, 425401 )==true then
		DW_QietKillOne( Player, 107114 )
	else LoadQuestOption( Player )
	end
	if CheckAcceptQuest( Player, 425623 )==true and
	CheckScriptFlag( Player, 546513 )==false then
		AddSpeakOption( Player, Ria, GetString("SC_QUEST425623_11"), "Z24_NPC121114_02", 0 )
	end
End
------------------------------------------------------------------------啟動按鈕"SC_QUEST425623_11"後執行
Function Z24_NPC121114_02()
	local PlayerID=OwnerID()
	CloseSpeak( PlayerID )
	CallPlot( TargetID(), "Z24_Quest425623_00", PlayerID )
End
------------------------------------------------------------------------
Function Z24_Quest425623_00(PlayerID)
	local MainRia=OwnerID()
	local NPC={}
	local MainSoldier=0
	local TempSoldier=0
	local Status=ReadRoleValue( MainRia, EM_RoleValue_Register1 )--讀出劇情開關的狀態
	if Status==1 then
		ScriptMessage( MainRia, PlayerID, 1, "[SC_TARGETBUSY_DW]", 0 )--目標執行劇情中！
		return
	else	WriteRoleValue( MainRia, EM_RoleValue_Register1, 1 )--啟動劇情開關
		NPC=SearchRangeNPC ( MainRia, 100 ) 
		for i=0,table.getn(NPC) do
			if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)==106850 then
				MainSoldier=NPC[i]
			end
		end
		SetModeEx( MainSoldier, EM_SetModeType_ShowRoleHead, False )--關閉自身頭相框
		local x, y, z, dir=DW_Location(MainSoldier)
		TempSoldier=CreateObj( 106850, x, y, z, dir, 1 )--創建創建戰鬥用瑞亞
		MoveToFlagEnabled( TempSoldier, false )--關閉戰鬥用瑞亞巡邏劇情
		WriteRoleValue( TempSoldier, EM_RoleValue_IsWalk, 0 ) --設定戰鬥用瑞亞移動動作為跑步
		SetFlag( TempSoldier, 544801, 1 )--關閉帕奇鼠
		AddToPartition( TempSoldier, 0 )--將戰鬥用瑞亞加入場景
		LockHP( TempSoldier, ReadRoleValue( TempSoldier, EM_RoleValue_MaxHP)*0.20, "" )--鎖定戰鬥用瑞亞血量
		SetModeEx( MainSoldier, EM_SetModeType_Show, false )--隱藏任務用瑞亞
		SetModeEx( TempSoldier, EM_SetModeType_Searchenemy, false )
		SetModeEx( TempSoldier, EM_SetModeType_Fight, false )
		SetModeEx( TempSoldier, EM_SetModeType_Strikback, false )
		SetModeEx( MainSoldier, EM_SetModeType_Mark, false )--關閉任務用瑞亞標記
		SetModeEx( MainSoldier, EM_SetModeType_SearchenemyIgnore, true )--關閉任務用瑞亞世界搜尋
		CallPlot( MainSoldier, "Z24_Quest425623_01", MainSoldier, TempSoldier, MainRia )--佈置戰鬥場景
		PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_COMBAT_1H )--單手戰姿
		CallPlot( TempSoldier, "Z24_Quest425623_02", MainSoldier, TempSoldier, MainRia )--戰鬥用瑞亞劇情01
	end
end
------------------------------------------------------------------------佈置戰鬥場景
Function Z24_Quest425623_01(MainSoldier, TempSoldier, MainRia )
	local NPC={}--宣告一組NPC陣列
	NPC[1]=CreateObjByFlag( 113606, 781192, 8, 1 )--創建威爾．坎奇斯
	NPC[2]=CreateObjByFlag( 107132, 781192, 4, 1 )--創建傀儡戰士
	NPC[3]=CreateObjByFlag( 107133, 781192, 5, 1 )--創建傀儡戰士
	NPC[4]=CreateObjByFlag( 107132, 781192, 6, 1 )--創建傀儡戰士
	NPC[5]=CreateObjByFlag( 107133, 781192, 7, 1 )--創建傀儡戰士
	for i=1, 5 do--設定物件資料
		SetModeEx( NPC[i], EM_SetModeType_Mark, true )--顯示標記
		SetModeEx( NPC[i], EM_SetModeType_Save, false )--不儲存
		SetModeEx( NPC[i], EM_SetModeType_Revive, false )--不重生
		SetModeEx( NPC[i], EM_SetModeType_Obstruct, false )--無阻擋
		SetModeEx( NPC[i], EM_SetModeType_Strikback, false )--不反擊
		SetModeEx( NPC[i], EM_SetModeType_Fight, false )--不可砍殺
		SetModeEx( NPC[i], EM_SetModeType_Gravity, true )--有重力
		SetModeEx( NPC[i], EM_SetModeType_Move, false )--不可移動
		SetModeEx( NPC[i], EM_SetModeType_ShowRoleHead, true )--顯示頭框
		SetModeEx( NPC[i], EM_SetModeType_HideName, false )--顯示名稱
		SetModeEx( NPC[i], EM_SetModeType_NotShowHPMP, false )--顯示血條
		SetFlag( NPC[i], 544801, 1 )--關閉帕奇鼠
		MoveToFlagEnabled( NPC[i], false )--關閉巡邏劇情
		WriteRoleValue( NPC[i], EM_RoleValue_IsWalk, 0 )--設定跑步動作
		AddToPartition( NPC[i], 0 )--將威爾．坎奇斯&傀儡戰士加入場景
		WriteRoleValue( NPC[i], EM_RoleValue_Register1, NPC[1] )--在敵人身上寫入威爾．坎奇斯的GUID
		WriteRoleValue( NPC[i], EM_RoleValue_Register2, 0 )--在威爾．坎奇斯&敵人身上寫入自身戰鬥表演狀態
		if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)~=113606 then
			CallPlot( NPC[i], "Z24_Quest425623_MonsterMotion00", OwnerID() )--令敵方NPC播放挑釁動作
		end
	end
	SetModeEx( NPC[1], EM_SetModeType_Searchenemy , false )--威爾．坎奇斯不可索敵
	LockHP( NPC[1], ReadRoleValue( NPC[1], EM_RoleValue_MaxHP)*0.20, "" )--鎖定威爾．坎奇斯血量
	WriteRoleValue( NPC[1], EM_RoleValue_Register1, 4 )--在威爾．坎奇斯身上寫入當前敵人數量
	SetRoleEquip( NPC[1], EM_EQWearPos_MainHand, 212781, 1 )--威爾．坎奇斯裝備主武器
	SetRoleEquip( NPC[1], EM_EQWearPos_SecondHand, 212779, 1 )--威爾．坎奇斯裝備副武器
	PlayMotionEX( NPC[1], ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD )
	CallPlot( NPC[1], "Z24_NPC107214_00", MainSoldier, TempSoldier, MainRia )--令威爾．坎奇斯執行對敵數量判斷及給予完成任務條件
End
------------------------------------------------------------------------戰鬥用瑞亞劇情01
Function Z24_Quest425623_02(MainSoldier, TempSoldier, MainRia )
	SetModeEx( TempSoldier, EM_SetModeType_Searchenemy , false )
	SetModeEx( TempSoldier, EM_SetModeType_Fight, false )
	SetModeEx( TempSoldier, EM_SetModeType_Strikback, false )
	sleep(15)	NpcSay( MainRia, "[SC_QUEST425623_00]" )--對白字串
	sleep(10)	LuaFunc_MoveToFlag( TempSoldier, 781192, 1, 0 )--使戰鬥用瑞亞移動指定旗子1
	sleep(05)	CastSpell( TempSoldier, TempSoldier, 850421 )
	sleep(40)	NpcSay( TempSoldier, "[SC_QUEST425623_01]" )--對白字串
	sleep(20)	NpcSay( TempSoldier, "[SC_QUEST425623_02]"  )--對白字串
	sleep(20)	LuaFunc_MoveToFlag( TempSoldier, 781192, 2, 0 )--使戰鬥用瑞亞移動指定旗子2
	sleep(10)	NpcSay( TempSoldier, "[SC_QUEST425623_03]" )--對白字串
	sleep(20)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	SetModeEx( TempSoldier, EM_SetModeType_Searchenemy, true )
	SetModeEx( TempSoldier, EM_SetModeType_Fight, true )
	SetModeEx( TempSoldier, EM_SetModeType_Strikback, true )
	sleep(20)	CallPlot( TempSoldier, "Z24_Quest425623_BeginCombat00", TempSoldier )--啟動任務425623戰鬥劇情
	local time=0
	sleep(10)
	while 1 do
		if ReadRoleValue( TempSoldier, EM_RoleValue_AttackTargetID ) ~= 0 then
			PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
			CastSpell( TempSoldier, TempSoldier, 850421 )
		end
		time=rand(5)
		sleep(310+time*10)
	end
End
------------------------------------------------------------------------威爾．坎奇斯執行對敵數量判斷及給予完成任務條件
Function Z24_NPC107214_00(MainSoldier, TempSoldier, MainRia )
	local Will=OwnerID()
	local PlayerID={}
	local BuffPos=0
	local BuffLv=0
	local Num=0
	local Motion=0
	while 1 do--每秒讀出存於威爾．坎奇斯身上的敵人數量
		Num=ReadRoleValue( Will, EM_RoleValue_Register1 )
		if num==0 then
			PlayerID=SearchRangePlayer( Will, 500 )
			if PlayerID~=0 then 
				for sn=0, table.getn(PlayerID), 1 do
					BuffPos=Lua_BuffPosSearch( PlayerID[sn], 623343 ) 
					BuffLv=BuffInfo( PlayerID[sn], BuffPos, EM_BuffInfoType_Power )
					if BuffLv>=2 and CheckAcceptQuest( PlayerID[sn], 425623 ) then
						SetScriptFlag( PlayerID[sn], 546513, 1 )--給予完成任務條件
						CancelBuff_NoEvent( PlayerID[sn], 623343 ) 
					end
				end
				SetStopAttack(TempSoldier)
				local x, y, z, dir=DW_Location(TempSoldier)
				PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
				Sleep(20)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_HOLSTER )
				Sleep(05)	SetRoleEquip( TempSoldier, EM_EQWearPos_MainHand, 212076 , 1 )
					SetRoleEquip( TempSoldier, EM_EQWearPos_SecondHand, 212076 , 1 )
				Sleep(10) DelObj(TempSoldier)
				TempSoldier=CreateObj( 121467, x, y, z, dir, 1 )--創建戰鬥用瑞亞
				MoveToFlagEnabled( TempSoldier, false )--關閉戰鬥用瑞亞巡邏劇情
				WriteRoleValue( TempSoldier, EM_RoleValue_IsWalk, 0 ) --設定戰鬥用瑞亞移動動作為跑步
				AddToPartition( TempSoldier, 0 )--將戰鬥用瑞亞加入場景
				CallPlot( TempSoldier, "Z24_Quest425623_03", MainSoldier, Will, PlayerID, MainRia )--執行消滅敵人後續劇情
				return
			end
		end
		sleep(10)
	end
end
------------------------------------------------------------------------消滅敵人後續劇情
Function Z24_Quest425623_03( MainSoldier, Will, PlayerID, MainRia )
	local TempSoldier=OwnerID()
	local NPC=0
	local Player=0
	Sleep(10)	LuaFunc_MoveToFlag( TempSoldier, 781192, 9, 0 )
	FaceFlag ( TempSoldier, 781192 , 8 ) AdjustDir( TempSoldier, 0 )
	Sleep(05)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
		PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_CROUCH_LOOP )
	Sleep(20)	NpcSay( TempSoldier, "[SC_QUEST425623_04]" )
	Sleep(20)	DelObj(Will)
	NPC=SearchRangeNPC( TempSoldier, 200 ) 
	for j=0, table.getn(NPC) do
		if ReadRoleValue( NPC[j], EM_RoleValue_OrgID)==121468 then
			Will=NPC[j]
			SetModeEx( Will, EM_SetModeType_Mark, false )
		end
	end
	Sleep(5)
	for k=0, table.getn(PlayerID) do
		if PlayerID[k]~=nil then
			if CheckAcceptQuest( PlayerID[k], 425623 )==true and
			CheckScriptFlag( PlayerID[k], 546513 )==true then
				SetScriptFlag( PlayerID[k], 547186, 1 )--給予可見Client威爾重要物品
				SetScriptFlag( PlayerID[k], 547188, 0 )
			end
		end
	end
	Sleep(20)	NpcSay( Will, "[SC_QUEST425623_05]" )
	Sleep(20)	AdjustFaceDir( Will, TempSoldier, 0 )
	Sleep(10)	PlayMotion( Will, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(10)	NpcSay( Will, "[SC_QUEST425623_06]" )
	Sleep(30)	NpcSay( Will, "[SC_QUEST425623_07]" )
	PlayerID=SearchRangePlayer( OwnerID(), 150 )
		if PlayerID~=0 then
			for i=0, table.getn(PlayerID) do
				if CheckAcceptQuest( PlayerID[i], 425623 ) and
				CheckScriptFlag( PlayerID[i], 546513 ) then
					Player=PlayerID[i]
				end
			end
		end
	Sleep(40)	NpcSay( Will, "[SC_QUEST425623_08]" )
	Sleep(10)	NpcSay( Will, "[SC_QUEST425623_09]" )
	Sleep(10)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_CROUCH_END )
	Sleep(10)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep(10)	NpcSay( TempSoldier, "[SC_QUEST425623_10]" )--對白字串
	CallPlot( Will, "Z24_ResetNPC121114_00", MainSoldier, TempSoldier, Will, MainRia )--重置425623任務用瑞亞
	Sleep(10)	FaceFlag( Will, 781192 , 5 ) AdjustDir( Will, 0 )
	SetModeEx( Will, EM_SetModeType_Mark, true )
	Sleep(10) LuaFunc_MoveToFlag( TempSoldier, 781192, 1, 0 )
End
------------------------------------------------------------------------
Function Z24_Quest425623_04()
	SetScriptFlag( TargetID(), 547187, 1 )
End
------------------------------------------------------------------------重置425623任務用瑞亞
Function Z24_ResetNPC121114_00(MainSoldier, TempSoldier, Will, MainRia )
	Sleep(20)	SetDefIdleMotion( TempSoldier, ruFUSION_MIME_RUN_FORWARD )
	Sleep(05)	SetModeEx( MainSoldier, EM_SetModeType_Mark, true )--開啟任務用瑞亞標記
	SetModeEx( MainSoldier, EM_SetModeType_ShowRoleHead, true )--開啟自身頭相框
	WriteRoleValue( MainRia, EM_RoleValue_Register1, 0 )--啟動劇情開關
	SetModeEx( MainSoldier, EM_SetModeType_Show, true )--顯示任務用瑞亞
	SetModeEx( MainSoldier, EM_SetModeType_SearchenemyIgnore, false )--開啟任務用瑞亞搜尋
	DelObj(TempSoldier)
end
------------------------------------------------------------------------任務425623敵人死亡劇情
Function Z24_Quest425623_MonsterDead00()
	local Will=ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )--讀出存於自身的威爾．坎奇斯GUID
	local num=ReadRoleValue( Will, EM_RoleValue_Register1 )--讀出存於威爾．坎奇斯身上的敵人數量
	num=num-1--計算現有敵人數量
	WriteRoleValue( Will, EM_RoleValue_Register1, num )--將現有敵人數量寫回威爾．坎奇斯身上
	local ListHate={}
	local HateID=0
	ListHate=HateListCount(OwnerID())--取得仇恨列表內物件數量
	if ListHate==0 then return
	else 	for sn=0, ListHate, 1 do
			HateID=HateListInfo(OwnerID(), sn, EM_HateListInfoType_GItemID)
			AddBuff( HateID, 623343, 0, -1 )--給予所有存在於敵人仇恨表的玩家BUFF作為標記
		end
	end
End
------------------------------------------------------------------------任務425623敵人挑釁動作
Function Z24_Quest425623_MonsterMotion00()
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==107214 then return
	else	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_COMBAT_1H )
		local num=0
		local motion=0
		local time=0
		local mode=0
		while 1 do
			mode=ReadRoleValue( OwnerID(), EM_RoleValue_Register2 )
			if mode==1 then
				PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_COMBAT_1H ) return
			else	motion=Rand(5)
				time=Rand(2)+1
				if motion==0 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_COMBAT_2H ) end
				if motion==1 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_1H ) end
				if motion==2 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP01 ) end
				if motion==3 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02 ) end
				if motion==4 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 ) end
				sleep(15+time*10)
				num=num+1
			end
		end
	end
End
------------------------------------------------------------------------任務425623啟動戰鬥
Function Z24_Quest425623_BeginCombat00()
	local NPC={}
	NPC=SearchRangeNPC ( OwnerID(), 200 )
	for sn=0, table.getn(NPC) do
		if ReadRoleValue( NPC[sn], EM_RoleValue_OrgID)==107132 or
		ReadRoleValue( NPC[sn], EM_RoleValue_OrgID)==107133 then
			ReadRoleValue( NPC[sn], EM_RoleValue_Register2 )
			WriteRoleValue( NPC[sn], EM_RoleValue_Register2, 1 )
			SetModeEx( NPC[sn], EM_SetModeType_Move, true )--開啟移動
			SetModeEx( NPC[sn], EM_SetModeType_Strikback, true )--開啟反擊
			SetModeEx( NPC[sn], EM_SetModeType_Fight, true )--開啟砍殺
			SetAttack( NPC[sn], OwnerID() )
			CastSpell( OwnerID(), NPC[sn], 850506 )
		end
	end
end
------------------------------------------------------------------------
Function Z24_NPC121190_01()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425624 )==true then
		DW_QietKillOne( OwnerID(), 107128 )
	else LoadQuestOption( OwnerID() )
	end
End
------------------------------------------------------------------------
Function Z24_Q425624Client_00()
	local Player=TargetID()
	SetScriptFlag( Player, 547186, 0 )
	SetScriptFlag( Player, 547187, 0 )
End
------------------------------------------------------------------------
Function Z24_Buff623342_Check00()
	if CheckAcceptQuest( TargetID(), 425623 )==true or
	ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106850 then
		return true
	else	return false
	end
End
Function Z24_Buff623342_Check01()
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106850 then
		return true
	else	return false
	end
End
------------------------------------------------------------------------