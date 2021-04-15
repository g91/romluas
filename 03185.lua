function Z33_NPC123884SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427122
	local KeyItem = 542966
	local SpeakStr = "SC_Z33Q427122_1"
	if CheckAcceptQuest( Player, RequireQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, GetString( SpeakStr ), "Z33_NPC123884SK_01", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123884SK_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427122
	local KeyItem = 542966
	local SpeakStr1 = "SC_CONTINUE_SPEAK"
	local SpeakStr2 = "SC_Z33Q427122_2"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		SetSpeakDetail( Player, GetString( SpeakStr2 ) )
		AddSpeakOption( Player, NPC, GetString( SpeakStr1 ), "Z33_NPC123884SK_02", 0 )
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123884SK_02()
	LoadquestOption( OwnerID() )
end
function Z33_Npc123887()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
end
function Z33_Q427178Completed()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502338
	local StopMove = 623132
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
		AddBuff( Player, ClientBuff, 0, 12 )
		AddBuff( Player, StopMove, 0, 12 )
		SetModeEx( Ctrl, EM_SetModeType_ShowRoleHead, false )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		BeginPlot( Ctrl, "Z33_Q427178Event", 20 )
	else
		return
	end
end
function Z33_Q427178Event()
	local Ctrl = OwnerID()
	local CompletedQuest = 427178
	local UnAcceptQuest = 427238
	local RangePlayers = nil
	local JoinPlayers = nil
	local SearchRange = 200
	local CurrentIndex = nil
	local StrIndex = 1
	local Cutscene = 500429
	local MessageStr = {}
	MessageStr[ 1 ] = "[SC_Q427178_1]"
	MessageStr[ 2 ] = "[SC_Q427178_2]"
	MessageStr[ 3 ] = "[SC_Q427178_3]"
	SetModeEx( Ctrl, EM_SetModeType_ShowRoleHead, true )
	while 1 do
		RangePlayers = {}
		JoinPlayers = {}
		CurrentIndex = 0
		RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
		for i = 0, #MessageStr, 1 do
			if ( RangePlayers[ i ] ~= nil and
			CheckID( RangePlayers[ i ] ) == true and
			CheckCompleteQuest( RangePlayers[ i ], CompletedQuest ) == true and
			CheckAcceptQuest( RangePlayers[ i ], UnAcceptQuest ) == false ) then
				table.insert( JoinPlayers, CurrentIndex, RangePlayers[ i ] )
				CurrentIndex = CurrentIndex+1
			end
		end
		for j = 0, #JoinPlayers, 1 do
			if ( JoinPlayers[ j ] ~= nil and CheckID( JoinPlayers[ j ] ) == true ) then
				ScriptMessage( Ctrl, JoinPlayers[ j ], 3, MessageStr[ StrIndex ], 0 )
			end
		end
		StrIndex = StrIndex+1
		if StrIndex >= 4 then
			Sleep( 20 )
			for k = 0, #JoinPlayers, 1 do
				if ( JoinPlayers[ k ] ~= nil and CheckID( JoinPlayers[ k ] ) == true ) then
					AddBuff( JoinPlayers[ k ], Cutscene, 0, 2 )
				end
			end
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			return
		end
		Sleep( 30 )
	end
end
function Z33_NPC123909_00()
	local npc = OwnerID()
	WriteRoleValue( npc, EM_RoleValue_Register1, 0 )
	SetCursorType( npc, eCursor_Pickup ) 
	SetPlot( npc, "touch", "Z33_NPC123909TouchCheck", 20 )
	SetModeEx( npc, EM_SetModeType_Mark, true )
	SetDefIdleMotion( npc, ruFUSION_MIME_IDLE_DEAD )
end
function Z33_NPC123909TouchCheck()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local CastStr = "[SC_NPC123909TOUCH_1]"--搜索屍體
	WriteRoleValue( TargetObj, EM_RoleValue_Register1, 1 )
	SetPlot( TargetObj, "touch", "", 0 )
	SetModeEx( TargetObj, EM_SetModeType_Mark, false )
	BeginCastBarEvent( Player, TargetObj, CastStr, 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_NPC123909TouchEnd" )
end
function Z33_NPC123909TouchEnd( Player, CheckStatus )
	local TargetObj = TargetID()
	EndCastBar( Player, CheckStatus )
	if CheckStatus > 0 then
		CallPlot( TargetObj, "Z33_NPC123909TouchEnd_2", TargetObj, Player )
	else
		SetCursorType( TargetObj, eCursor_Pickup )
		SetPlot( TargetObj, "touch", "Z33_NPC123909TouchCheck", 20 )
		WriteRoleValue( TargetObj, EM_RoleValue_Register1, 0 )
		SetModeEx( TargetObj, EM_SetModeType_Mark, true )
	end
	return
end
function Z33_NPC123909TouchEnd_2( TargetObj, Player )
	local Ctrl = TargetObj
	local QuestID = 427238
	local ItemID = 204518
	local KeyItem = 543782
	local RandNum = 0
	local EnemyID = 108860--復生死屍
	local MounseID = 102815--鼠
	local NPC = 0--另創的物件
	local MessageStr1 = "[SC_Q427238_1]"--你已經有足夠的[204518]！
	local MessageStr2 = "[SC_NPC123909TOUCH_2]"--你似乎什麼也沒有發現！
	local MessageStr3 = "[SC_Q427238_4]"--你取得了[204518]！
	local MessageStr4 = "[SC_NPC123909TOUCH_3]"--這具屍體似乎動了一下......
	local QuestStatus = 0
	RandNum = DW_Rand( 10 )		-- 試玩上殭屍跟老鼠出現率太高，因此亂數從4調到10，增加藥水掉落率 2015.08.05
	if CheckZ33Quest( Player, QuestID ) == true then
		if ( CountBodyItem( Player, ItemID ) < 5 and CheckFlag( Player, KeyItem ) == false ) then
			QuestStatus = 1
		else
			ScriptMessage( Player, Player, 0, MessageStr1, 0 )
			ScriptMessage( Player, Player, 1, MessageStr1, 0 )
		end
	end
	AddBuff( Player, 623132, 0, 2 )--使玩家原定定身2秒
	if RandNum == 1 then--創出復生死屍攻擊點擊者
		Sleep( 10 ) ScriptMessage( Player, Player, 1, MessageStr4, C_SYSTEM )
		Sleep( 20 ) NPC = CreateZ33NPCforShow( TargetObj, EnemyID )
		CallPlot( NPC, "Z33_NPC123909TouchEvent_1", NPC, Player )
	elseif RandNum == 2 then--創出老鼠
		Sleep( 10 ) ScriptMessage( Player, Player, 1, MessageStr4, C_SYSTEM )
		Sleep( 20 ) NPC = CreateZ33NPCforShow( TargetObj, MounseID )
		CallPlot( NPC, "Z33_NPC123909TouchEvent_2", NPC, Player )
	else--什麼事也沒發生或取得任務物品
		if QuestStatus == 1 then
			GiveBodyItem( Player, ItemID, 1 )
			ScriptMessage( Player, Player, 0, MessageStr3, 0 )
			ScriptMessage( Player, Player, 2, MessageStr3, 0 )
		else
			Sleep( 10 )
			ScriptMessage( Player, Player, 0, MessageStr2, C_SYSTEM )
			ScriptMessage( Player, Player, 1, MessageStr2, C_SYSTEM )
		end
	end
	CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
	return
end
function Z33_NPC123909TouchEvent_1( Npc, Player )
	if ( Npc == nil or Player == nil ) then
		return
	end
	if ( CheckID( Npc ) == false or CheckID( Player ) == false ) then
		return
	end
	AdjustFaceDir( Npc, Player, 0 )
	AddBuff( Npc, 623132, 0, 3 )--怪物自己使自己無法移動3秒
	SetModeEx( Npc, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Npc, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Npc, EM_SetModeType_Fight, false )--可被攻擊
	Sleep( 20 )
	if CheckID( Player ) == false then
		DelObj( Npc )
	else
		SetModeEx( Npc, EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( Npc, EM_SetModeType_Strikback, true )--反擊
		SetModeEx( Npc, EM_SetModeType_Fight, true )--可被攻擊
		SetAttack( Npc, Player )
	end
	return
end
function Z33_Npc108860CombatEnd()
	local Npc = OwnerID()
	CallPlot( Npc, "Z33_Npc108860CombatEnd_2", Npc )
end
function Z33_Npc108860CombatEnd_2( Npc )
	AddBuff( Npc, 623132, 0, -1 )--怪物自己使自己無法移動
	SetModeEx( Npc, EM_SetModeType_Searchenemy, false )
	SetDefIdleMotion( Npc, ruFUSION_MIME_IDLE_STAND )
	Sleep( 30 )
	if ReadRoleValue( Npc, EM_RoleValue_IsDead ) == 0 then
		DelObj( Npc )
	end
end
function Z33_NPC123909TouchEvent_2( Npc )
	if ( Npc == nil or CheckID( Npc ) == false ) then
		return
	end
	local x, y, z, dir = DW_Location( Npc )
	local dist = 20
	local MovePos = 0
	local Num = 0
	for i = 1, 10, 1 do
		PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		Sleep( 20 )
		if CheckID( Npc ) == false then
			return
		end
		MovePos = DW_Rand( 4 )
		Num = DW_Rand( 10 )
		if MovePos == 1 then
			Move( Npc, x+dist-Num, y, z+dist-Num )
		elseif MovePos == 2 then
			Move( Npc, x+dist-Num, y, z-dist+Num )
		elseif MovePos == 3 then
			Move( Npc, x-dist+Num, y, z+dist-Num )
		else
			Move( Npc, x-dist+Num, y, z-dist+Num )
		end
		Sleep( 50 )
	end
	DelObj( Npc )
	return
end
function Z33_NPC123886SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427238
	local KeyItem = 543782
	local SpeakStr = "SC_Q427238_2"
	if CheckAcceptQuest( Player, RequireQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, GetString( SpeakStr ), "Z33_NPC123886SK_01", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123886SK_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427238
	local BodyItemID = 204518
	local KeyItem = 543782
	local MessageStr1 = "[SC_Q427238_3]"
	local MessageStr2 = "[SC_Q427238_5]"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		if CountBodyItem( Player, BodyItemID ) >= 5 then
			SetFlag( Player, KeyItem, 1 )
			ScriptMessage( Player, Player, 2, MessageStr1, 0 )
			DelBodyItem( Player, BodyItemID, 5 )
		else
			ScriptMessage( Player, Player, 2, MessageStr2, C_Red )
		end
	end
	CloseSpeak( Player )
end
function Z33_NPC123910_00()
	local Ctrl = OwnerID()
	local NpcID = 109041
	local Radius = 35
	local NpcNum = 3
	local QuestNpc = {}
	local SkullID = 123911
	local RangeObj = {}
	local SkullObj = 0
	local StopMove = 623132
	local MagicShow = 490866
	AddBuff( Ctrl, 502646, 0, -1 )--鬼火特效
	RangeObj = SearchRangeNPC( Ctrl, 100 )
	for i = 0, #RangeObj, 1 do
		if ReadRoleValue( RangeObj[ i ], EM_RoleValue_OrgID ) == SkullID then
			DelObj( RangeObj[ i ] )
		end
	end
	QuestNpc = Z33_CreateNpcbyCircle_00( NpcID, Radius, NpcNum )
	for j = 1, #QuestNpc, 1 do
		AddBuff( QuestNpc[ j ], StopMove, 0, -1 )
	end
	while 1 do
		if #QuestNpc == 0 then
			break
		else
			for k = 1, #QuestNpc, 1 do
				if QuestNpc[ k ] == nil or CheckID( QuestNpc[ k ] ) == false or
				ReadRoleValue( QuestNpc[ k ], EM_RoleValue_IsDead ) == 1 then
					table.remove( QuestNpc, k )
				elseif ReadRoleValue( QuestNpc[ k ], EM_RoleValue_AttackTargetID ) == 0 then
					SetStopAttack( QuestNpc[ k ] )
					AdjustFaceDir( QuestNpc[ k ], Ctrl, 0 )
					CastSpell( QuestNpc[ k ], QuestNpc[ k ], MagicShow )
				end
			end
		end
		sleep( 15 )
	end
	SkullObj = CreateZ33NPCforShow( Ctrl, SkullID )
	CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
	return
end
function Z33_Npc123912()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
function Z33_Item204520Used()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local QuestObj = 123912
	local ValidDis = 40
	local KeyItem = 543783
	local MessageStr1 = "[SC_425103_F]"
	local MessageStr2 = "[SC_Z24ITEM241208_02]"
	local MessageStr3 = "[SC_422804]"
	local MessageStr4 = "[SC_Q427240_1]"
	local CastStr = "[SC_Q427240_7]"
	if CheckDistance( Player, TargetObj, ValidDis ) == false then
		ScriptMessage( Player, Player, 1, MessageStr1, 0 )--你距離目標太遠！
		return
	elseif ReadRoleValue( TargetObj, EM_RoleValue_OrgID ) ~= QuestObj then
		ScriptMessage( Player, Player, 1, MessageStr2, 0 )--使用的目標錯誤！
		return
	elseif ReadRoleValue( TargetObj, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Player, Player, 1, MessageStr3, 0 )--目標正在忙碌中！
		return
	elseif CheckFlag( Player, KeyItem ) ==true then
		ScriptMessage( Player, Player, 1, MessageStr4, 0 )--你已經完成了任務！
		return
	end
	WriteRoleValue( TargetObj, EM_RoleValue_Register1, 1 )
	BeginCastBarEvent( Player, TargetObj, CastStr, 15, ruFUSION_ACTORSTATE_USE, ruFUSION_ACTORSTATE_THROW, 0, "Z33_Item204520Used_2" )
end
function Z33_Item204520Used_2( Player, CheckStatus )
	local Tomb = TargetID()
	local QuestItem = 204520
	WriteRoleValue( Tomb, EM_RoleValue_Register1, 0 )
	EndCastBar( Player, CheckStatus )
	if CheckStatus > 0 then
		WriteRoleValue( Tomb, EM_RoleValue_Register1, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		CallPlot( Tomb, "Z33_Item204520Event", Player )
	end
end
function Z33_Item204520Event( Player )
	local Ctrl = OwnerID()
	local CtrlPID = ReadRoleValue( Ctrl, EM_RoleValue_PID )
	local Dis = 20
	local Angle = 0
	local SkullID = { 119875, 123916 }
	local SkullObj = {}
	local BossID = 109043
	local BossObj = 0
	local BuffFx1 = 504763
	local BuffFx2 = 502278
	local StopMove = 623132
	local RangePlayers = nil--table
	local MessageStr1 = "[SC_Q427240_4]"
	local MassageStr2 = "[SC_Q427240_5]"
	local MassageStr3 = "[SC_Q427240_6]"
	local MaxHP = nil
	local CurrentHP = nil
	local HPPercent = nil
	local HateListSum = nil
	local GetKeyPlayer = nil
	local QuestID = 427240
	local KeyItem = 543783
	local Num = nil
	Sleep( 10 )
	Num = DW_Rand( 60 )
	Angle = 150+Num
	for i = 1, #SkullID, 1 do
		SkullObj[ i ] = Lua_CreateObjByDir( Ctrl, SkullID[ i ], Dis, Angle )
		MoveToFlagEnabled( SkullObj[ i ], false )
		AddToPartition( SkullObj[ i ], 0 )
		AddBuff( SkullObj[ 1 ], BuffFx1, 0, -1 )
		Sleep( 05 )
	end
	if CtrlPID ~= 1 then--這似乎不是科諾瓦的墓碑！
		if CheckID( Player ) == true then
			ScriptMessage( Ctrl, Player, 1, MessageStr1, 0 )
		end
		Sleep( 30 )
		DelObj( SkullObj[ 1 ] )
		DelObj( SkullObj[ 2 ] )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
		return
	end
	Sleep( 10 )
	BossObj = Lua_CreateObjByDir( Ctrl, BossID, -Dis, 0 )
	SetModeEx( BossObj, EM_SetModeType_Fight, false )
	SetModeEx( BossObj, EM_SetModeType_Searchenemy, false )
	SetModeEx( BossObj, EM_SetModeType_Strikback, false )
	LockHP( BossObj, ReadRoleValue( BossObj, EM_RoleValue_MaxHP ), "Lua_424225_LockHP" )
	MaxHP = ReadRoleValue( BossObj, EM_RoleValue_MaxHP )
	MoveToFlagEnabled( BossObj, false )
	SetDefIdleMotion( BossObj, ruFUSION_MIME_IDLE_COMBAT_UNARMED )
	if CheckID( Player ) == true then
		AddBuff( Player, StopMove, 0, 3 )
		AdjustFaceDir( BossObj, Player, 0 )
	end
	AddToPartition( BossObj, 0 )
	PlayMotion( BossObj, ruFUSION_ACTORSTATE_BUFF_SP01 )
	Sleep( 10 )
	AddBuff( BossObj, BuffFx2, 0, 1 )
	RangePlayers = SearchRangePlayer( Ctrl, 200 )
	for j = 0, #RangePlayers, 1 do
		ScriptMessage( Ctrl, RangePlayers[ j ], 2, MassageStr2, 0 )
	end
	RangePlayers = nil
	Sleep( 20 )
	SetDefIdleMotion( BossObj, ruFUSION_MIME_IDLE_STAND )
	LockHP( BossObj, ReadRoleValue( BossObj, EM_RoleValue_MaxHP)*0.11, "Lua_424225_LockHP" )
	SetModeEx( BossObj, EM_SetModeType_Fight, true )
	SetModeEx( BossObj, EM_SetModeType_Searchenemy, true )
	SetModeEx( BossObj, EM_SetModeType_Strikback, true )
	while 1 do
		Sleep( 20 )
		CurrentHP = ReadRoleValue( BossObj, EM_RoleValue_HP )
		HPPercent = ( CurrentHP / MaxHP )*100
		if HPPercent <= 11 then
			SetModeEx( BossObj, EM_SetModeType_Mark, false )
			SetModeEx( BossObj, EM_SetModeType_Fight, false )
			SetModeEx( BossObj, EM_SetModeType_Searchenemy, false )
			SetModeEx( BossObj, EM_SetModeType_Strikback, false )
			break
		end
		if ReadRoleValue( BossObj, EM_RoleValue_AttackTargetID ) == 0 then
			AddBuff( BossObj, StopMove, 0, -1 )
			Sleep( 20 )
			DelObj( BossObj )
			DelObj( SkullObj[ 1 ] )
			DelObj( SkullObj[ 2 ] )
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			return
		end
	end
	HateListSum = HateListCount( BossObj )
	for k = 0, HateListSum, 1 do
		GetKeyPlayer = HateListInfo( BossObj, k, EM_HateListInfoType_GItemID ) 
		if ( CheckAcceptQuest( GetKeyPlayer, QuestID ) == true and
		CheckFlag( GetKeyPlayer, KeyItem ) == false ) then
			SetFlag( GetKeyPlayer, KeyItem, 1 )
		end
	end
	SetStopAttack( BossObj )
	Sleep( 10 )
	PlayMotion( BossObj, ruFUSION_ACTORSTATE_BUFF_BEGIN )
	Sleep( 20 )
	RangePlayers = nil;
	RangePlayers = SearchRangePlayer( Ctrl, 200 )
	for m = 0, #RangePlayers, 1 do
		if ( RangePlayers[ m ] ~= nil and CheckID( RangePlayers[ m ] ) == true ) then
			ScriptMessage( Ctrl, RangePlayers[ m ], 1, MassageStr3, C_SYSTEM )
		end
	end
	Sleep( 30 )
	DelObj( BossObj )
	DelObj( SkullObj[ 1 ] )
	DelObj( SkullObj[ 2 ] )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
function Z33_Q427240Completed()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local SmokeFxID = 123947
	local NpcID = 123917
	local SmokeFx = nil
	local Npc = nil
	local ClientBuff = 502347
	if ReadRoleValue( Ctrl, EM_RoleValue_Register2 ) == 0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register2, 1 )
		AddBuff( Player, ClientBuff, 0, 5 )
		SmokeFx = CreateZ33NPCforShow( Ctrl, SmokeFxID )
		Npc = CreateZ33NPCforShow( Ctrl, NpcID )
		CallPlot( SmokeFx, "Z33_Q427240Show", Npc, Ctrl, Player )
	end
	return
end
function Z33_Q427240Show( Npc, Ctrl, Player )
	local SmokeFx = OwnerID()
	local Cutscene = 500429
	if ( Player ~= nil and CheckID( Player ) == true ) then
		AdjustFaceDir( Npc, Player, 0 )
	end
	Sleep( 10 ) NpcSay( Npc, "[SC_Q427240_3]" )
	Sleep( 30 ) DelObj( Npc )
	if ( Player ~= nil and CheckID( Player ) == true ) then
		AddBuff( Player, Cutscene, 0, 2 )
	end
	Sleep( 10 ) WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	DelObj( SmokeFx )
	return
end
function Z33_Q427241Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502348
	local NpcID = 123918
	local Npc = nil
	local FlagID = 781409
	local SpeakStr = "[SC_Q427241_1]"
	local ShowSwitch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ShowSwitch == 1 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	AddBuff( Player, ClientBuff, 0, 7 )
	Npc = CreateZ33NPCforShow( Ctrl, NpcID )
	PlayMotion( Npc, ruFUSION_ACTORSTATE_CROUCH_END )
	Sleep( 15 ) AdjustFaceDir( Npc, Player, 0 )
	Sleep( 05 ) PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) NpcSay( Npc, SpeakStr )
	Sleep( 25 ) FaceFlag ( Npc, FlagID, 1 ) AdjustDir( Npc, 0 )
	LuaFunc_MoveToFlag( Npc, FlagID, 1, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	Sleep( 10 ) DelObj( Npc )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
function Z33_NPC123888SK_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427242
	local KeyItem = 542967
	local SpeakStr = "[SC_Z33Q427242_1]"
	if CheckAcceptQuest( Player, RequireQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, SpeakStr, "Z33_NPC123888SK_2", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123888SK_2()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427242
	local SpeakStr1 = "SC_Z33Q427242_2"
	local SpeakStr2 = "SC_Z33Q427242_3"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		AddSpeakOption( Player, NPC, GetString( SpeakStr2 ), "Z33_NPC123888SK_3", 0 )
		SetSpeakDetail( Player, GetString( SpeakStr1 ) )
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123888SK_3()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427242
	local SpeakStr1 = "SC_Z33Q427242_5"
	local SpeakStr2 = "SC_Z33Q427242_4"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		AddSpeakOption( Player, NPC, GetString( SpeakStr1 ), "Z33_NPC123888SK_4", 0 )
		SetSpeakDetail( Player, GetString( SpeakStr2 ) )
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123888SK_4()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427242
	local KeyItem = 542967
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
end