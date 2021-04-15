
------------------------------------------------------------------------人王傳喚
function Z23_Quest425210_00()
	if CheckFlag( TargetID(), 546506)==False and
	CheckFlag( TargetID(), 546507)==False then
		GiveBodyItem( TargetID(), 546506, 1 )--人王傳喚
		GiveBodyItem( TargetID(), 546507, 1 )--帕普．赫索夫
	end
end
------------------------------------------------------------------------
function Z23_Quest425210_01()
	Lua_ZonePE_3th_GetScore(50)
	SetFlag( TargetID(), 546507, 0 )
	local Controller=SearchRangeNPC( OwnerID(), 200 )
	for i=0,table.getn( Controller ) do
		if ReadRoleValue( Controller[i] , EM_RoleValue_OrgID)==120273 then
			if ReadRoleValue( Controller[i], EM_RoleValue_Register1)==0 then
				CallPlot( Controller[i] , "Z23_Quest425210_02", Controller[i] )
			else 	return
			end
		end
	end
end
------------------------------------------------------------------------
function Z23_Quest425210_02()
	local Controller=OwnerID()
	WriteRoleValue( Controller, EM_RoleValue_Register1 , 1 )
	local NPC= CreateObjByFlag( 120781, 781147, 0 , 1 )
	SetModeEx( NPC, EM_SetModeType_Searchenemy , false )
	SetModeEx( NPC, EM_SetModeType_Fight , false )
	SetModeEx( NPC, EM_SetModeType_Strikback , false )
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead , false )
	SetModeEx( NPC, EM_SetModeType_Mark , false )
	SetModeEx( NPC, EM_SetModeType_HideName , true )
	SetModeEx( NPC, EM_SetModeType_Move , true )
	SetModeEx( NPC, EM_SetModeType_NotShowHPMP, true )
	SetModeEx( NPC, EM_SetModeType_Gravity, true )
	SetModeEx( NPC, EM_SetModeType_Save, true )
	WriteRoleValue( NPC, EM_RoleValue_IsWalk , 0  )
	AddToPartition( NPC, 0 )
	CallPlot( NPC, "Z23_NPC120828_00", NPC, Controller )
end
------------------------------------------------------------------------
function Z23_NPC120828_00( NPC, Controller )--通報士兵
	MoveToFlagEnabled( NPC, false )
	local Captain=SearchRangeNPC( NPC, 250 )
	local ACT01 =0
	local ACT02 =0
	for i=0,table.getn( Captain ) do
		if ReadRoleValue( Captain[i] , EM_RoleValue_OrgID)==120273 then
			ACT01=Captain[i]
		elseif ReadRoleValue( Captain[i] , EM_RoleValue_OrgID)==120825 then
			ACT02=Captain[i]
		end
	end
	AdjustFaceDir( NPC, ACT01, 0 )
	AdjustFaceDir( NPC, ACT02, 0 )
	AdjustFaceDir( ACT01, NPC, 0 )
	AdjustFaceDir( ACT02, NPC, 0 )
	NpcSay( ACT01, "[SC_425210_01]" )--防線似乎有什麼狀況....！
	NpcSay( ACT02, "[SC_425210_01]" )--防線似乎有什麼狀況....！
	Sleep(20)
	NpcSay( NPC, "[SC_425210_02]" )--隊長....不好了！
	LuaFunc_MoveToFlag( NPC, 781147, 1, 0 )
	Sleep(10)		 
	NpcSay( NPC, "[SC_425210_03]" )--敵人已突破我軍的防線，指揮所將會隨時遭到攻擊....！
	Sleep(35)
	NpcSay( ACT01, "[SC_425210_04]" )--哼.....牠們敢！
	NpcSay( ACT02, "[SC_425210_04]" )--哼.....牠們敢！
	Sleep(10)
	WriteRoleValue( Controller, EM_RoleValue_Register1 , 0 )
	DelObj ( NPC )
end
------------------------------------------------------------------------
function Z23_NPC120779_00()--卡拉維．卡薩姆
	SetPlot( OwnerID(),"range","Z23_NPC120779_01",100 )
	MoveToFlagEnabled( OwnerID(), false )
	local ACT={}
	local NPC=SearchRangeNPC(OwnerID(), 100)
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120822 then ACT[1]= NPC[i] end--傑斯．莫克里夫
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120823 then ACT[2]= NPC[i] end--伊崔妮．吉昂特
	end
	while 1 do
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	local Num=Rand(50)
		if Num> 0 and Num<= 25 then
			AdjustFaceDir( OwnerID(), ACT[1], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
		if Num> 26 and Num<= 50 then
			AdjustFaceDir( OwnerID(), ACT[2], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
	Sleep(30)
	end
end
------------------------------------------------------------------------
function Z23_NPC120779_01()--卡拉維．卡薩姆
	if CheckAcceptQuest( OwnerID(), 425210)==TRUE
	and CheckFlag( OwnerID(), 546292)==False then
	GiveBodyItem( OwnerID(), 546292, 1 )
	end
end
------------------------------------------------------------------------
function Z23_NPC120779_02()--卡拉維．卡薩姆
	if CheckAcceptQuest( OwnerID(), 425210)==TRUE
	and CheckFlag( OwnerID(), 546292)==False then
	GiveBodyItem( OwnerID(), 546292, 1 )
	end
	LoadQuestOption( OwnerID() )
end
------------------------------------------------------------------------
function NPC120822_00()--傑斯．莫克里夫
	MoveToFlagEnabled( OwnerID(), false )
	local ACT={}
	local NPC=SearchRangeNPC(OwnerID(), 100)
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120820 then ACT[1]= NPC[i] end--摩瑞克．渥林特
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120823 then ACT[2]= NPC[i] end--伊崔妮．吉昂特
	end
	while 1 do
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	local Num=Rand(50)
		if Num> 0 and Num<= 25 then
			AdjustFaceDir( OwnerID(), ACT[1], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
		if Num> 26 and Num<= 50 then
			AdjustFaceDir( OwnerID(), ACT[2], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
	Sleep(30)
	end
end
------------------------------------------------------------------------
function NPC120823_00()--伊崔妮．吉昂特
	MoveToFlagEnabled( OwnerID(), false )
	local ACT={}
	local NPC=SearchRangeNPC(OwnerID(), 100)
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120779 then ACT[1]= NPC[i] end--卡拉維．卡薩姆
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120822 then ACT[2]= NPC[i] end--傑斯．莫克里夫
	end
	while 1 do
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	local Num=Rand(50)
		if Num> 0 and Num<= 25 then
			AdjustFaceDir( OwnerID(), ACT[1], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
		if Num> 26 and Num<= 50 then
			AdjustFaceDir( OwnerID(), ACT[2], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
	Sleep(30)
	end
end
------------------------------------------------------------------------
function NPC120824_00()--威爾．坎奇斯
	MoveToFlagEnabled( OwnerID(), false )
	local ACT={}
	local NPC=SearchRangeNPC(OwnerID(), 100)
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120822 then ACT[2]= NPC[i] end--傑斯．莫克里夫
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120823 then ACT[1]= NPC[i] end--伊崔妮．吉昂特
	end
	while 1 do
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK) 
	local Num=Rand(50)
		if Num> 0 and Num<= 25 then
			AdjustFaceDir( OwnerID(), ACT[1], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
		if Num> 26 and Num<= 50 then
			AdjustFaceDir( OwnerID(), ACT[2], 0 )
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(Num)
		end
	Sleep(30)
	end
end
------------------------------------------------------------------------
function NPC120825_00()--帕普．赫索夫
	MoveToFlagEnabled( OwnerID(), false )
	local ACT={}
	local NPC=SearchRangeNPC(OwnerID(), 100)
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120779 then ACT[1]= NPC[i] end--卡拉維．卡薩姆
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120822 then ACT[2]= NPC[i] end--傑斯．莫克里夫
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120823 then ACT[3]= NPC[i] end--伊崔妮．吉昂特
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120824 then ACT[4]= NPC[i] end--威爾．坎奇斯
	end
	AdjustFaceDir( OwnerID(), ACT[1], 0 )
	while 1 do
		local Num=Rand(8)+1
		if Num==1 then AdjustFaceDir( OwnerID(), ACT[1], 0 ) end
		if Num==2 then AdjustFaceDir( OwnerID(), ACT[2], 0 ) end
		if Num==3 then AdjustFaceDir( OwnerID(), ACT[3], 0 ) end
		if Num==4 then AdjustFaceDir( OwnerID(), ACT[4], 0 ) end
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Sleep(30)
	end
end
------------------------------------------------------------------------戰事告急
function Z23_NPC120273_00()--帕普．赫索夫
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2 , 0)
end
------------------------------------------------------------------------
function Z23_Quest425211_00()
	CancelBuff( TargetID(), 622649)
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, False )
	GiveBodyItem( TargetID(), 546508, 1 )
	DelBodyItem( TargetID(), 546506, 1 )
	ScriptMessage( OwnerID(), TargetID(), 2, "[SC_425211_00]", C_SYSTEM )
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register2)==0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2 , 1 )
		local x=ReadRoleValue(OwnerID(),EM_RoleValue_X)
		local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		local location={x, y, z}
		local NPC=Lua_DW_CreateObj( "xyz" , 120784, location, 0, 1, 1 )--突襲中控器
		SetModeEx( NPC, EM_SetModeType_Searchenemy , false )
		SetModeEx( NPC, EM_SetModeType_Fight , false )
		SetModeEx( NPC, EM_SetModeType_Strikback , false )
		SetModeEx( NPC, EM_SetModeType_ShowRoleHead , false )
		SetModeEx( NPC, EM_SetModeType_Mark , false )
		SetModeEx( NPC, EM_SetModeType_HideName , true )
		SetModeEx( NPC, EM_SetModeType_Move , false )
		SetModeEx( NPC, EM_SetModeType_NotShowHPMP, true )
		SetModeEx( NPC, EM_SetModeType_Gravity, true )
		SetModeEx( NPC, EM_SetModeType_Save, false )
		AddToPartition( NPC , 0 )
		WriteRoleValue( NPC, EM_RoleValue_Register1, OwnerID() )
	end
	Sleep(10)
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, True )
end
------------------------------------------------------------------------
function Z23_NPC120784_00()--突襲中控器
	local KillID=SearchRangeNPC(OwnerID(), 500)--刪除場上怪物
		for j=0, table.getn(KillID) do
			if ReadRoleValue( KillID[j] , EM_RoleValue_OrgID)==106611 or
			ReadRoleValue( KillID[j] , EM_RoleValue_OrgID)==106612 then
				DelObj( KillID[j] )
			end
		end
	CallPlot( OwnerID(), "Z23_NPC120784_01", OwnerID())--產生與新增怪物
	CallPlot( OwnerID(), "Z23_NPC120784_02", OwnerID())--任務計時器
	CallPlot( OwnerID(), "Z23_NPC120784_03", OwnerID())--任務失敗檢查
end
------------------------------------------------------------------------
function Z23_NPC120784_01()--產生與新增怪物
	local Fighter={106611, 106612}
	local NPC={}
	NPC[1]= CreateObjByFlag( Fighter[1], 781151, 1, 1 )--強化改造戰士
	NPC[2]= CreateObjByFlag( Fighter[2], 781151, 2, 1 )--精銳改造戰士
	NPC[3]= CreateObjByFlag( Fighter[2], 781151, 3, 1 )--精銳改造戰士
	NPC[4]= CreateObjByFlag( Fighter[1], 781151, 4, 1 )--強化改造戰士
	Sleep(20)
	for k=1, 4, 1 do
		AddToPartition( NPC[k], 0 )
		WriteRoleValue( NPC[k], EM_RoleValue_Register1, 1 )
		CallPlot( NPC[k], "Z23_MonsterSet425211_00", NPC[k] )
	end
	for j=1, 10, 1 do
		Sleep(50)
		local Num=0
		local Monster=SearchRangeNPC(OwnerID(), 500)
		for i=0,table.getn(Monster) do
			if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID)==106611 or
			ReadRoleValue( Monster[i] , EM_RoleValue_OrgID)==106612 then
				Num=Num+1
			end
		end
		if Num<=8 then
			local location=Rand(4)+1
			local X=Rand(2)+1
			local NewNPC=CreateObjByFlag( Fighter[X], 781151, location, 1)
			WriteRoleValue( NewNPC, EM_RoleValue_Register1, 1 )
			AddToPartition( NewNPC, 0 )
			CallPlot(NewNPC, "Z23_MonsterSet425211_00",NewNPC)
		end
	end
end
------------------------------------------------------------------------
function Z23_NPC120784_02()
	local Captain=ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	Sleep(500)
	DelFromPartition( Captain )
	ReSetNPCInfo( Captain )
	AddToPartition( Captain, 0 )
	WriteRoleValue( Captain, EM_RoleValue_Register1 , 0 )
	WriteRoleValue( Captain, EM_RoleValue_Register2 , 0 )
	DelObj( OwnerID() )
end
------------------------------------------------------------------------
function Z23_NPC120784_03()
	while 1 do
		local Num=0--宣告1個計次用變數
		local Monster=SearchRangeNPC( OwnerID(), 450 )--尋找劇情影響範圍內的相關怪物數量
		for i=0,table.getn(Monster) do--使用迴圈取得相關怪物數量總數
			if ReadRoleValue( Monster[i] , EM_RoleValue_OrgID)==106611 or
			ReadRoleValue( Monster[i] , EM_RoleValue_OrgID)==106612 then
				Num=Num+1
			end
		end
		if Num>=9 then--當劇情影響範圍內的相關怪物總數大於或等於9時執行以下行為
			local Player=SearchRangePlayer( OwnerID(), 500 )--判斷任務失敗訊息的顯示對象
			for i=0,table.getn(Player) do
				if CheckAcceptQuest( Player[i], 425211 )==TRUE then--擁有任務425211者且
					if CheckScriptFlag( Player[i], 546293 )==false then--擁有重要物品546293者列為顯示對象
						CancelBuff( Player[i], 622649)--被列為任務失敗者刪除其身上的計次Buff
						ScriptMessage( OwnerID(), Player[i], 2, "[SC_425211_01]", C_SYSTEM )--顯示任務失敗訊息
					end
				end		
			end
			local KillID=SearchRangeNPC(OwnerID(), 500)--刪除場上怪物
			for j=0, table.getn(KillID) do
				if ReadRoleValue( KillID[j] , EM_RoleValue_OrgID)==106611 or
				ReadRoleValue( KillID[j] , EM_RoleValue_OrgID)==106612 then
					DelObj( KillID[j] )
				end
			end
			local Captain=ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )--重置任務NPC身上的劇情啟動開關
			WriteRoleValue( Captain, EM_RoleValue_Register1 , 0 )--執行前置任務劇情的開關0為可以執行
			WriteRoleValue( Captain, EM_RoleValue_Register2 , 0 )--產生中控器的開關0為可以產生中控器
			DelObj( OwnerID() )--刪除自己(中控器120784)
		end
	sleep(20)
	end
end
------------------------------------------------------------------------
function Z23_NPCSet425211_00()
	MoveToFlagEnabled( OwnerID(), false )
	SetModeEx( OwnerID(), EM_SetModeType_Searchenemy ,false )
	SetModeEx( OwnerID(), EM_SetModeType_Fight ,false )
	SetModeEx( OwnerID(), EM_SetModeType_Strikback ,false )
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead ,true )
	SetModeEx( OwnerID(), EM_SetModeType_Mark ,true )
	SetModeEx( OwnerID(), EM_SetModeType_HideName ,false)
	SetModeEx( OwnerID(), EM_SetModeType_Move ,false )
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, false )
	SetModeEx( OwnerID(), EM_SetModeType_Gravity, true )
	SetModeEx( OwnerID(), EM_SetModeType_Save, true )

	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==120785 then
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
	end
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==120786 then
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	end
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==120787 then
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	end
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==120788 then
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_2H, ruFUSION_ACTORSTATE_COMBAT_2H)
	end
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==120826 then
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_2H, ruFUSION_ACTORSTATE_COMBAT_2H)
	end
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==120829 then
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H) end
	end
------------------------------------------------------------------------
function Z23_MonsterSet425211_00()
	while 1 do
		LuaFunc_MoveToFlag( OwnerID(), 781147, 1, 40 )
		Sleep(50)
	end
end
------------------------------------------------------------------------從長計議
function Z23_NPC120780_00()--卡拉維．卡薩姆
	SetPlot( OwnerID(),"range","Z23_Quest425212_02",100 )
end
------------------------------------------------------------------------
function Z23_NPC120780_01()
	if 	CheckAcceptQuest( OwnerID(), 425212)==TRUE and
		CheckFlag( OwnerID(), 546294)==False then
		GiveBodyItem( OwnerID(), 546294, 1 )
	end
	LoadQuestOption( OwnerID() )
end
------------------------------------------------------------------------
function Z23_Quest425212_00()
	if CheckFlag( TargetID(), 546509)==False then
		GiveBodyItem( TargetID(), 546509, 1 )
	end
end
------------------------------------------------------------------------
function Z23_Quest425212_01()
	Lua_ZonePE_3th_GetScore(50)
	if CheckFlag( TargetID(), 546509)==True then
		DelBodyItem( TargetID(), 546509, 1 )
	end
end
------------------------------------------------------------------------
function Z23_Quest425212_02()
	if CheckAcceptQuest( OwnerID(), 425212)==TRUE and
	CheckFlag( OwnerID(), 546294)==False then
		local Controller={}
		Controller=SearchRangeNPC ( TargetID(), 100 )
		for i=0,table.getn(Controller) do
			if ReadRoleValue( Controller[i] , EM_RoleValue_OrgID)==120856 then
				ScriptMessage( TargetID(), OwnerID(), 2, "[SC_425212_00]", C_SYSTEM )
				CallPlot( Controller[i], "Z23_Quest425212_03", Controller[i])
			end
		end
	end
end
------------------------------------------------------------------------
function Z23_Quest425212_03()
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register1)==0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1 )
		CallPlot( OwnerID(), "Z23_Quest425212_04",OwnerID())
		local SCMD01=CreateObjByFlag( 120858, 781153, 1 , 1 )
		local SCMD02=CreateObjByFlag( 120858, 781153, 2 , 1 )
		local SCMD03=CreateObjByFlag( 120858, 781153, 3 , 1 )
		local SCMD04=CreateObjByFlag( 120858, 781153, 4 , 1 )
		local SCMD05=CreateObjByFlag( 120858, 781153, 5 , 1 )
		MoveToFlagEnabled( SCMD01, false )
		MoveToFlagEnabled( SCMD02, false )
		MoveToFlagEnabled( SCMD03, false )
		MoveToFlagEnabled( SCMD04, false )
		MoveToFlagEnabled( SCMD05, false )
		WriteRoleValue( SCMD01, EM_RoleValue_IsWalk , 1  )
		WriteRoleValue( SCMD02, EM_RoleValue_IsWalk , 1  )
		WriteRoleValue( SCMD03, EM_RoleValue_IsWalk , 1  )
		WriteRoleValue( SCMD04, EM_RoleValue_IsWalk , 1  )
		WriteRoleValue( SCMD05, EM_RoleValue_IsWalk , 1  )
		Sleep(40)
		AddToPartition( SCMD01, 0 )
		NpcSay( SCMD01, "[SC_425212_01]" ) Sleep(40)
		NpcSay( SCMD01, "[SC_425212_02]" ) Sleep(40)
		AddToPartition( SCMD02, 0 )
		DelObj(SCMD01)
		NpcSay( SCMD02, "[SC_425212_03]" ) Sleep(40)
		AddToPartition( SCMD03, 0 )
		DelObj(SCMD02)
		NpcSay( SCMD03, "[SC_425212_04]" ) Sleep(40)
		NpcSay( SCMD03, "[SC_425212_05]" ) Sleep(40)
		DelObj(SCMD03)
		AddToPartition( SCMD04, 0 )
		NpcSay( SCMD04, "[SC_425212_06]" ) Sleep(40)
		NpcSay( SCMD04, "[SC_425212_07]" ) Sleep(40)
		NpcSay( SCMD04, "[SC_425212_08]" ) Sleep(40)		
		AddToPartition( SCMD05, 0 )
		DelObj(SCMD04)
		NpcSay( SCMD05, "[SC_425212_09]" ) Sleep(40)
		NpcSay( SCMD05, "[SC_425212_10]" ) Sleep(40)
		DelObj(SCMD05)
	end
	local Player={}
	Player=SearchRangePlayer ( OwnerID() , 150 )		
		for i= 0, table.getn(Player), 1 do
			if	CheckAcceptQuest( Player[i], 425212)==TRUE and
				CheckFlag( Player[i], 546294)==False then
				GiveBodyItem( Player[i], 546294, 1 )
			end
		end
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
------------------------------------------------------------------------
function Z23_Quest425212_04()
	local NPC={}
	local ACT={}
	NPC=SearchRangeNPC ( OwnerID(), 100 )
		for i=0,table.getn(NPC) do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120780 then
				ACT[1]=NPC[i]		
			elseif ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120827 then
				ACT[2]=NPC[i]
			elseif ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120830 then
				ACT[3]=NPC[i]
			elseif ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120831 then
				ACT[4]=NPC[i]
				NpcSay( ACT[4], "[SC_425212_11]" ) 
			end
		end
	for i=1, 4, 1 do
		MoveToFlagEnabled( ACT[i], false )
	end
	FaceFlag( ACT[1], 781153, 2 ) AdjustDir( ACT[1], 0 )
	FaceFlag( ACT[2], 781153, 4 ) AdjustDir( ACT[2], 0 )
	FaceFlag( ACT[3], 781153, 1 ) AdjustDir( ACT[3], 0 )
	FaceFlag( ACT[4], 781153, 5 ) AdjustDir( ACT[4], 0 )
	Sleep(450)
	for i=1, 4, 1 do
		FaceFlag( ACT[i], 781153, 6 )
		AdjustDir( ACT[i], 0 )
	end
end
------------------------------------------------------------------------臨危受命
function Z23_NPC120273_01()--帕普．赫索夫
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest( OwnerID(), 425213)==TRUE and
		CheckFlag( OwnerID(), 546295)==False then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425213_00"), "Z23_Quest425213_00", 0 )
	end
	CloseSpeak( OwnerID() )
end
------------------------------------------------------------------------
function Z23_Quest425213_00()
	if 	CheckAcceptQuest( OwnerID(), 425213)==TRUE and
		CheckFlag( OwnerID(), 546295)==False then
		GiveBodyItem( OwnerID(), 546295, 1 )
	end
	CloseSpeak( OwnerID() )
end
------------------------------------------------------------------------天平兩端
function Z23_NPC120833_00()--摩瑞克．渥林特
	SetPlot( OwnerID(),"range","Z23_Quest425218_00",100 )
end
------------------------------------------------------------------------
function Z23_Quest425218_00()
	if CheckAcceptQuest( OwnerID(), 425218)==TRUE then
		GiveBodyItem( OwnerID(), 546296, 1 )
	end
end
------------------------------------------------------------------------
function Z23_NPC120833_01()
	if CheckAcceptQuest( OwnerID(), 425218)==TRUE then
		GiveBodyItem( OwnerID(), 546296, 1 )
	end
	LoadQuestOption( OwnerID() )
end
------------------------------------------------------------------------
function Z23_Quest425218_01()
	AddBuff ( TargetID(), 623344, 0, 16 )
	DelBodyItem( TargetID(), 546520, 1 )
	SetScriptFlag( TargetID(), 546510, 1 )
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register1)==0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1 )
		SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, False )
		local NPC=LuaFunc_CreateObjByObj ( 120859, OwnerID() )
		MoveToFlagEnabled( NPC, false )
		Sleep(10)
		SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, True )
		AddToPartition( NPC, 0 )
		WriteRoleValue( NPC, EM_RoleValue_IsWalk ,1)
		LuaFunc_MoveToFlag( NPC, 781165, 0, 0 )
		Sleep(10)
		NpcSay( NPC, "[SC_425218_01]" )
		WriteRoleValue( NPC, EM_RoleValue_IsWalk ,0)
		Sleep(30)
		LuaFunc_MoveToFlag( NPC, 781165, 1, 0 )
		Sleep(10)
		NpcSay( NPC, "[SC_425218_02]" )
		Sleep(10)
		CallPlot( NPC, "Z23_NPC120859_01",NPC )
		LuaFunc_MoveToFlag( NPC, 781147, 0, 0 )
		Sleep(10)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
	else return
	end
end
------------------------------------------------------------------------
function Z23_NPC120859_01()
	Sleep(15)
	DelObj( OwnerID() )
end
------------------------------------------------------------------------
function Z23_Quest425218_02()
	Lua_ZonePE_3th_GetScore(50)
	SetScriptFlag( TargetID(), 546511, 1 )
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register1)==0 then
		AddBuff ( TargetID(), 622652, 0, 65 )
		CallPlot( OwnerID(), "Z23_Quest425218_03", TargetID() )
	else	local Time=ReadRoleValue( OwnerID(), EM_RoleValue_Register2)
		AddBuff ( TargetID(), 622652, 0, Time)
	end
	CloseSpeak( TargetID() )
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, False )
	DelBodyItem( TargetID(), 546510, 1 )
	DelBodyItem( TargetID(), 546520, 1 )
end
------------------------------------------------------------------------
function Z23_Quest425218_03(Player)
	local Jill
	local Loub
	local Light
	local Dragon
	local Fighter1
	local Fighter2
	local Fxball01
	local Fxball02
	local NPC={}
	WriteRoleValue( OwnerID(), EM_RoleValue_Register, 1 )
	DisableQuest( OwnerID() , False )
	MoveToFlagEnabled( OwnerID(), False )
	CallPlot( OwnerID(), "Z23_Quest425218_04", OwnerID() )
	NPC=SearchRangeNPC ( OwnerID(), 200 )
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120834 then
			Jill=NPC[i]--吉兒
			MoveToFlagEnabled( Jill, False )
			WriteRoleValue( Jill, EM_RoleValue_IsWalk ,0)		
		elseif ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120835 then
			Loub=NPC[i]--勞勃
		elseif ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120902 then
			if Fighter1==nil then 
				Fighter1=NPC[i]
			else 	Fighter2=NPC[i]
			end
		end
	end
	Light=CreateObjByFlag( 120782, 781165, 2, 1 )
	MoveToFlagEnabled( Light, false )
	AdjustFaceDir( Jill, Fighter1, 0 )
	Sleep(10)
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, True )
	NpcSay( Jill, "[SC_425218_12]" )--快讓開，我並不想傷害你們！
	PlayMotion( Jill, ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(20)
	NpcSay( Fighter1, "[SC_425218_11]" )--他害死了我們的夥伴，我們不會讓妳就這樣將他帶走！
	Sleep(20)
	Lua_StopBGM(Player)
	local DragonMc=PlayMusicToPlayer(player,"music/GuildWar/epic_tales_02_JFL_hellwars.mp3", false )--光龍出場音樂
	Sleep(10)
	ScriptMessage( OwnerID(), Player, 2, "[SC_425218_03]", C_SYSTEM )--光龍化身為人形，來到了聯盟駐地....
	Sleep(20)
	AddToPartition( Light, 0 )
	Sleep(15)
	NpcSay( Light, "[SC_425218_04]" )--看來，我找到了造成元素不穩定的原因....
	Sleep(20)
	LuaFunc_MoveToFlag( Light, 781165, 3, 0 )
	Sleep(05)
	AdjustFaceDir(OwnerID(), Light, 0)
	Sleep(05)
	NpcSay( OwnerID(), "[SC_425218_15]" )--光龍......
	Sleep(10)
	NpcSay( Light, "[SC_425218_05]" )--嗯....我希望你們能夠理解....
	Sleep(25)
	NpcSay( Light, "[SC_425218_06]" )--這孩子體內所潛藏的力量具有毀滅性，因此....
	Sleep(25)
	NpcSay( Light, "[SC_425218_14]" )--我不得不做出決定....
	Sleep(15)
	Fxball01=LuaFunc_CreateObjByObj ( 120895, Loub )
	CastSpell( Light, Fxball01, 850236 )
	AdjustFaceDir(OwnerID(), Loub, 0)
	Sleep(10)
	AddBuff ( Fxball01, 622683, 1, -1 )
	ScriptMessage( OwnerID(), Player, 2, "[SC_425218_16]", C_SYSTEM )--此時...光龍開啟了封印法陣......
	AdjustFaceDir(Jill, Light, 0)
	Sleep(05)
	PlayMotion( Jill, ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(05)
	NpcSay( Jill, "[SC_425218_07]" )--快住手，你要對勞勃做什麼！？
	Sleep(10)
	AdjustFaceDir(Fighter1, Light, 0)
	AdjustFaceDir(Fighter2, Light, 0)
	CastSpell( Loub, Loub, 850237 )
	Sleep(20)
	AdjustFaceDir(Jill, Loub, 0)
	Sleep(65)
	CallPlot( Loub, "LuaFunc_ResetObj", Loub )
	Fxball02=LuaFunc_CreateObjByObj ( 120895, Light )
	AddBuff ( Fxball02, 622683, 1, -1 )
	DelObj( Fxball01 )
	NpcSay( Light, "[SC_425218_08]" )--為了不讓過去的浩劫再次重演，我必須將這孩子封印在平衡聖所....
	Sleep(10)
	AdjustFaceDir(OwnerID(), Light, 0)
	Sleep(20)
	ScriptMessage( OwnerID(), Player, 2, "[SC_425218_17]", C_SYSTEM )--光龍將受到封印的[115891]一同帶回了[ZONE_BALENCETEMPLE]......
	Sleep(15)
	DelObj( Light )
	Sleep(15)
	DelObj( Fxball02 )
	Sleep(30)
	LuaFunc_MoveToFlag( Jill, 781165, 4, 0 )
	AdjustFaceDir(Fighter1, Jill, 0)
	AdjustFaceDir(Fighter2, Jill, 0)
	AdjustFaceDir(OwnerID(), Jill, 0)
	Sleep(20)
	NpcSay( Jill, "[SC_425218_13]" )--勞勃........
	Sleep(20)
	PlayMotion( Jill, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Sleep(20)
	AdjustFaceDir(Jill, OwnerID(), 0)
	Sleep(10)
	PlayMotion( Jill, ruFUSION_ACTORSTATE_EMOTE_POINT )
	AdjustFaceDir(OwnerID(), Jill, 0)
	NpcSay( Jill, "[SC_425218_09]" )--你們....這群人....，竟然都無動於衷....
	Sleep(30)
	NpcSay( Jill, "[SC_425218_10]" )--如果....我再也見不到勞勃，我將與你們所有人誓不兩立！
	PlayMotion( Jill, ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(20)
	PlayMotion( Jill, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Sleep(30)
	SetDefIdleMotion( Jill, ruFUSION_MIME_RUN_FORWARD)
	LuaFunc_MoveToFlag( Jill, 781165, 5, 0 )
	CallPlot( Jill, "LuaFunc_ResetObj", Jill )
	CallPlot( Fighter1, "LuaFunc_ResetObj", Fighter1 )
	CallPlot( Fighter2, "LuaFunc_ResetObj", Fighter2)
	StopSound(Player, DragonMc)
	Lua_PlayBGM(Player)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register, 0 )
end
------------------------------------------------------------------------
function Z23_Quest425218_04()
	local Num=64
	for i =1, 64, 1 do
		Num=Num-1
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Num )
	Sleep(10)
	end
end
------------------------------------------------------------------------
function Z23_NPC120834_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND)
	MoveToFlagEnabled(OwnerID(), False ) 
end
------------------------------------------------------------------------
function Z23_NPC120835_00()
	MoveToFlagEnabled(OwnerID(), False )
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	AddBuff( OwnerID(), 620135, 0, -1 )
end
------------------------------------------------------------------------
function Z23_NPC120895_00()
	AddBuff ( OwnerID(), 622683, 1, -1 )
end
------------------------------------------------------------------------
function Z23_NPC120902_00()
	MoveToFlagEnabled(OwnerID(), False )
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
	Sleep(10)
	local NPC={}
	NPC=SearchRangeNPC(OwnerID(), 100)
		for i=0,table.getn(NPC) do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)==120834 then
				Jill=NPC[i]
			end
		end
	AdjustFaceDir( OwnerID(), Jill, 0 )
end
------------------------------------------------------------------------失控邊緣
function Z23_Quest425219_00()
	Lua_ZonePE_3th_GetScore(50)
	if CheckFlag( TargetID(), 546511)==True then
		DelBodyItem( TargetID(), 546511, 1 )
	end
end
------------------------------------------------------------------------
Function Z23_NPCAngerAll_00()
	while 1 do
		CastSpell( OwnerID(), OwnerID(), 499256 )
	Sleep(20) 
	end
End
------------------------------------------------------------------------
Function Z23_Quest425219_01()
	DelBodyItem( OwnerID(), 546520 )
End
------------------------------------------------------------------------檢查帕奇鼠
function Z23_DeMagicCavy_00()
	local num=0
	local npc={106473, 106611, 106612, 106613, 106614, 106617, 106620, 106615, 106616, 106676 }
		for i=1,table.getn(npc) do
			if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==npc[i] then
				num=num+1
			end
		end
		if num>0 then
			SetFlag( OwnerID(), 544801, 1 )--關閉帕奇鼠
		else	SetFlag( OwnerID(), 544801, 0 )--開啟帕奇鼠
		end
end
------------------------------------------------------------------------給予標記用Buff622649
function Z23_GetItem546293_00()
	Lua_ZonePE_3th_GetScore(1)
	if ReadRoleValue( OwnerID(), EM_RoleValue_Register1)==1 then
		local PlayerID=HateListCount( OwnerID() )
		for i=0, PlayerID, 1 do
			local ID=HateListInfo( OwnerID() , i, EM_HateListInfoType_GItemID )
			if CheckAcceptQuest( ID, 425211 )==true then
				local num=rand(2)
				AddBuff ( ID, 622649, num, -1 )
				local Count=Lua_BuffPosSearch( ID, 622649)
				if BuffInfo( ID, Count, EM_BuffInfoType_Power )>=9 then
					SetFlag( ID, 546293, 1 )
					CancelBuff( ID, 622649)
					DelBodyItem( ID, 546508, 1 )
				end
			end
		end
	end
end
------------------------------------------------------------------------
function Z23_CAST623350_00()
	SetScriptFlag( OwnerID(), 546520, 1 )
end
------------------------------------------------------------------------
Function Z23_WMBugChecking_00()
	local BUG=OwnerID()
	local RG1=ReadRoleValue( BUG, EM_RoleValue_Register1 )
	local RG2=ReadRoleValue( BUG, EM_RoleValue_Register2 )
	DebugMsg( 0, 0, "RG1="..RG1..",RG2="..RG2 )
end
------------------------------------------------------------------------