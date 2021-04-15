function Z33_Npc124091()
	local MasterCtrl = OwnerID()
	WriteRoleValue( MasterCtrl, EM_RoleValue_Register1, 0 )
	AddBuff( MasterCtrl, 502644, 0, -1 )
end
function Z33_Npc124095()--鬼手
	local Ctrl = OwnerID()
	local RandNum = nil
	local x, y, z, dir = DW_Location( Ctrl )
	MoveToFlagEnabled( Ctrl, false )
	SetModeEx( Ctrl, EM_SetModeType_Gravity, false )
	RandNum = DW_Rand( 2 )
	if RandNum == 1 then--隨機將自身圖形放大1.2倍
		AddBuff( Ctrl, 509568, 0, -1 )
	end
	Sleep( 05 )
	RandNum = DW_Rand( 5 )
	if RandNum <= 2 then--隨機顯示左右鬼手
		RandNum = DW_Rand( 10 )*10
		if RandNum == 1 then
			Sleep( RandNum ) AddBuff( Ctrl, 502640, 0, 2 )
		else
			Sleep( RandNum ) AddBuff( Ctrl, 502643, 0, 2 )
		end
	end
	Sleep( 05 ) Move( Ctrl, x, y-20, z )
	RandNum = DW_Rand( 3 )*10
	Sleep( RandNum ) CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
end
function Z33_Q427263Touch()
	local Player = OwnerID()
	local MasterCtrl = TargetID()
	local x, y, z, dir = nil
	local EventCtrl = nil
	if ( CheckAcceptQuest( Player, 427263 ) == true and CheckFlag( Player, 543810 ) == false ) then
		if ReadRoleValue( MasterCtrl, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( MasterCtrl, EM_RoleValue_Register1, 1 )
			x, y, z, dir = DW_Location( MasterCtrl )
			EventCtrl = CreateObj( 124089, x, y, z, dir, 1 )
			AddToPartition( EventCtrl, 0 )
			WriteRoleValue( EventCtrl, EM_RoleValue_Register1, MasterCtrl )
			CallPlot( EventCtrl, "Z33_Q427263Event", Player )
			DelFromPartition( MasterCtrl ) 
			return true
		else
			ScriptMessage( Player, Player, 0, "[SC_Q427293_2]", 0 )--事件正在進行中
			ScriptMessage( Player, Player, 1, "[SC_Q427293_2]", 0 )
		end
	end
	return false
end
function Z33_Q427263Event( Player )
	local EventCtrl = OwnerID()
	local MasterCtrl = ReadRoleValue( EventCtrl, EM_RoleValue_Register1 ) 
	local MasterPlayer = Player
	local CheckingBuff = 502639
	local CurrentPlayer = {}--暫用變數
	local Index = 0--暫用變數
	local KeyItem = 546066--無意義
	local CombatResult = 0
	local SecureRange = 300
	local x, y, z, dir = DW_Location( 781409, 5 )
	local QuestBoss = CreateObj( 109068, x, y, z, dir, 1 )
	local BeginMsg1 = "[SC_Q427263_4]"
	local BeginMsg2 = "[SC_Q427263_5]"
	local ResultMsg = {}
	ResultMsg[ 1 ] = "[SC_Q427263_1]"
	ResultMsg[ 2 ] = "[SC_Q427263_2]"
	ResultMsg[ 3 ] = "[SC_Q427263_3]"
	LockHP( QuestBoss, ReadRoleValue( QuestBoss, EM_RoleValue_MaxHP ), "Lua_424225_LockHP" )
	SetModeEx( QuestBoss, EM_SetModeType_Searchenemy, false )
	SetModeEx( QuestBoss, EM_SetModeType_Fight, false )
	SetModeEx( QuestBoss, EM_SetModeType_Strikback, false )
	SetModeEx( QuestBoss, EM_SetModeType_Move, false )
	MoveToFlagEnabled( QuestBoss, false )
	Sleep( 20 )
	CurrentPlayer = SearchRangePlayer( EventCtrl, SecureRange )
	for Index = 0, #CurrentPlayer, 1 do
		if ( CurrentPlayer[ Index ] ~= nil and CheckID( CurrentPlayer[ Index ] ) == true ) then
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 0, BeginMsg1, 0 )
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 1, BeginMsg1, C_LightGreen )
		end
	end
	Sleep( 30 ) AddToPartition( QuestBoss, 0 )
	PlayMotion( QuestBoss, ruFUSION_ACTORSTATE_COMBAT_UNARMED )
	PlayMotion( QuestBoss, ruFUSION_ACTORSTATE_CAST_SP01 )
	Sleep( 40 )
	Index = 0
	CurrentPlayer = {}
	CurrentPlayer = SearchRangePlayer( EventCtrl, SecureRange )
	for Index = 0, #CurrentPlayer, 1 do
		if ( CurrentPlayer[ Index ] ~= nil and CheckID( CurrentPlayer[ Index ] ) == true ) then
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 0, BeginMsg2, 0 )
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 2, BeginMsg2, C_LightGreen )
		end
	end
	Sleep( 20 )
	SetModeEx( QuestBoss, EM_SetModeType_Searchenemy, true )
	SetModeEx( QuestBoss, EM_SetModeType_Fight, true )
	SetModeEx( QuestBoss, EM_SetModeType_Strikback, true )
	SetModeEx( QuestBoss, EM_SetModeType_Move, true )
	LockHP( QuestBoss, 0, "" )
	SetAttack( QuestBoss, MasterPlayer )
	while true do--戰鬥檢查
		Sleep( 20 )
		if ReadRoleValue( QuestBoss, EM_RoleValue_IsDead ) == 1 then--Boss死亡
			KeyItem = 543810--將原無意義重要物品改寫為任務完成條件
			CombatResult = 1 break--成功完成事件！
		else
			Index = 0
			CurrentPlayer = {}
			for Index = 0, HateListCount( QuestBoss ), 1 do
				CurrentPlayer = HateListInfo( QuestBoss, Index, EM_HateListInfoType_GItemID )
				if ( CurrentPlayer ~= nil and CheckID( CurrentPlayer ) == true ) then
					AddBuff( CurrentPlayer, CheckingBuff, 0, -1 )
				end	
			end
		end
		if ( CheckID( MasterPlayer ) == false or CheckAcceptQuest( MasterPlayer, 427263 ) == false ) then
			CombatResult = 2 break--啟動事件的玩家離開，事件已停止！
		end
		if ( CheckDistance( QuestBoss, EventCtrl, SecureRange ) == false or ReadRoleValue( QuestBoss, EM_RoleValue_AttackTargetID ) == 0 ) then
			CombatResult = 3 break--[109068]失去了攻擊目標，事件已停止！
		end
	end
	CurrentPlayer = {}
	CurrentPlayer = SearchRangePlayer( EventCtrl, SecureRange )
	for Index = 0, #CurrentPlayer, 1 do
		if ( CurrentPlayer[ Index ] ~= nil and CheckID( CurrentPlayer[ Index ] ) == true ) then
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 0, ResultMsg[ CombatResult ], 0 )
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 1, ResultMsg[ CombatResult ], C_LightGreen )
			if ( CheckAcceptQuest( CurrentPlayer[ Index ], 427263 ) == true and CheckBuff( CurrentPlayer[ Index ], CheckingBuff ) == true ) then
				SetFlag( CurrentPlayer[ Index ], KeyItem, 1 )
			end
		end
	end
	Sleep( 30 ) DelObj( QuestBoss )
	WriteRoleValue( MasterCtrl, EM_RoleValue_Register1, 0 )
	CallPlot( MasterCtrl, "LuaFunc_ResetObj", MasterCtrl )
	DelObj( EventCtrl )
	return
end
function Z33_Npc109068OnDead()
	return true
end
function Z33_NPC123900SK()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427264
	local KeyItem = 543838
	local OptionStr = "[SC_Q427264_2]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		AddSpeakOption( Player, NPC, OptionStr, "Z33_NPC123900SK_1", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123900SK_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427264
	local KeyItem = 543838
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
	else
		CloseSpeak( Player )
		return
	end
	LoadquestOption( Player )
end
function Z33_Q427264Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	ScriptMessage( Player, Player, 0, "[SC_Q427264_1]", 0 )
	ScriptMessage( Player, Player, 1, "[SC_Q427264_1]", C_LightGreen )
end
function Z33_NPC123900()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
function Z33_Q427265Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502607
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) ~= 0 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	AddBuff( Player, ClientBuff, 0, 12 )
	CallPlot( Ctrl, "Z33_Q427265Cutscene", Player )
End
function Z33_Q427265Cutscene( Player )
	local Ctrl = OwnerID()
	local NpcID = 123937
	local PosFlag = 781409
	local Npc = CreateZ33NPCforShow( Ctrl, NpcID )
	Sleep( 15 )
	if ( Player~= nil and CheckID( Player ) == true ) then
		AdjustFaceDir( Npc, Player, 0 )
	end
	Sleep( 10 )
	NpcSay( Npc, "[SC_Q427265_1]" )
	Sleep( 20 )
	LuaFunc_MoveToFlag( Npc, PosFlag, 6, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	DelObj( Npc)
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_Q427265Event()
	local Ctrl = OwnerID()
	local RequireQuest = 427265
	local KeyItem = 543525
	local RangePlayers = nil
	local SearchRange = 200
	local PosFlag = 781409
	local FlagIndex = 7
	local x, y, z, dir = nil
	local NpcID = {}
	NpcID[ 1 ] = 123938--阿克索
	NpcID[ 2 ] = 123939--矮人王
	NpcID[ 3 ] = 123940--老學者
	NpcID[ 4 ] = 123941--大鐵匠
	NpcID[ 5 ] = 124085--附魔特效物件
	local Npc = {}
	local CastFx1 = 852151
	local CastFx2 = 490872
	local Cutscene = 500429
	local MessageStr = "[SC_Q427265_14]"
	for i = 1, #NpcID-1, 1 do
		x, y, z, dir = DW_Location( PosFlag, FlagIndex )
		Npc[ i ] = CreateObj( NpcID[ i ], x, y, z, dir, 1 )
		MoveToFlagEnabled( Npc[ i ], false )
		WriteRoleValue( Npc[ i ], EM_RoleValue_IsWalk, 1 )
		AddToPartition( Npc[ i ], 0 )
		FlagIndex = FlagIndex + 1
	end
	Sleep( 15 ) LuaFunc_MoveToFlag( Npc[ 1 ], PosFlag, 11, 0 )
	Sleep( 15 ) NpcSay( Npc[ 1 ], "[SC_Q427265_15]" )  --嗯
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD ) 
	Sleep( 25 ) AdjustFaceDir( Npc[ 1 ], Npc[ 4 ], 0 )
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 05 ) NpcSay( Npc[ 1 ], "[SC_Q427265_5]" )  --不用擔心
	Sleep( 10 ) AdjustFaceDir( Npc[ 4 ], Npc[ 1 ], 0 )
	Sleep( 10 ) PlayMotion( Npc[ 4 ], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep( 05 ) NpcSay( Npc[ 4 ], "[SC_Q427265_7]" )  --是什麼意思
	Sleep( 20 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) NpcSay( Npc[ 1 ], "[SC_Q427265_6]" )  --少高尚靈魂
	Sleep( 30 ) AdjustFaceDir( Npc[ 2 ], Npc[ 1 ], 0 )
	Sleep( 10 ) NpcSay( Npc[ 2 ], "[SC_Q427265_8]" )  --只有這辦法
	Sleep( 25 ) AdjustFaceDir( Npc[ 1 ], Npc[ 2 ], 0 )
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) NpcSay( Npc[ 1 ], "[SC_Q427265_9]" )  --讓家族覺醒
	Sleep( 35 ) FaceFlag( Npc[ 1 ], PosFlag, 11 ) AdjustDir( Npc[ 1 ], 180 )
	Sleep( 15 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_STRETCH )
	Sleep( 30 ) NpcSay( Npc[ 1 ], "[SC_Q427265_10]" )--還給矮人了
	Sleep( 30 ) CastSpell( Npc[ 1 ], Npc[ 1 ], CastFx1 )
	Sleep( 05 ) AdjustFaceDir( Npc[ 3 ], Npc[ 1 ], 0 )
	Sleep( 05 ) PlayMotion( Npc[ 3 ], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Sleep( 05 ) NpcSay( Npc[ 3 ], "[SC_Q427265_13]" )--你快住手	
	Sleep( 25 ) NpcSay( Npc[ 1 ], "[SC_Q427265_11]" )--再試著相信
	Sleep( 30 ) NpcSay( Npc[ 1 ], "[SC_Q427265_12]" )--為大眾犧牲
	x, y, z, dir = DW_Location( Npc[ 1 ] )
	Npc[ 5 ] = CreateObj( NpcID[ 5 ], x, y, z, dir, 1 )
	MoveToFlagEnabled( Npc[ 5 ], false )
	AddToPartition( Npc[ 5 ], 0 )
	Sleep( 20 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_CHANNEL_END )
	CastSpell( Npc[ 5 ], Npc[ 5 ], CastFx2 )
	Sleep( 05 ) DelObj( Npc[ 1 ] )
	Sleep( 15 ) 
	RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
	for k = 0, #RangePlayers, 1 do
		if ( RangePlayers[ k ]~= nil and CheckID( RangePlayers[ k ] ) == true ) then
			if ( CheckAcceptQuest( RangePlayers[ k ], RequireQuest ) == true and CheckFlag( RangePlayers[ k ], KeyItem ) == false ) then
				SetFlag( RangePlayers[ k ], KeyItem, 1 )
				AddBuff( RangePlayers[ k ], Cutscene, 0, 2 )
				ScriptMessage( Ctrl, RangePlayers[ k ], 2, MessageStr, 0 )
				ScriptMessage( Ctrl, RangePlayers[ k ], 0, MessageStr, 0 )
			end
		end
	end
	Sleep( 30 ) 
	for j = 1, #Npc, 1 do
		DelObj( Npc[ j ] )
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register3, 0 )
end
function Z33_Npc124082FX()
	local FxNpc = OwnerID()
	local BaseX = ReadRoleValue( FxNpc, EM_RoleValue_X )
	local BaseY = ReadRoleValue( FxNpc, EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( FxNpc, EM_RoleValue_Z )
	MoveToFlagEnabled( FxNpc, false )
	SetModeEx( FxNpc, EM_SetModeType_Mark, false )
	SetModeEx( FxNpc, EM_SetModeType_Gravity, false )
	Move( FxNpc, BaseX, BaseY+10, BaseZ )
	return
end
function Z33_Q427267Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502609
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		return
	end
	AddBuff( Player, ClientBuff, 0, 10 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	CallPlot( Ctrl, "Z33_Q427267Accept1", Player )
end
function Z33_Q427267Accept1( Player )
	local Ctrl = OwnerID()
	local PosFlag = 781409
	local NpcID = 123942
	local Npc = nil
	local SpeakStr = "[SC_427267_1]"
	Npc = CreateZ33NPCforShow( Ctrl, NpcID )
	Sleep( 10 ) AdjustFaceDir( Npc, Player, 0 )
	Sleep( 10 ) NpcSay( Npc, SpeakStr )
	PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 15 ) AdjustFaceDir( Npc, PosFlag, 12 )
	LuaFunc_MoveToFlag( Npc, PosFlag, 12, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	Sleep( 10 ) DelObj( Npc )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_NPC123907()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
function Z33_NPC123907SK()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427268
	local KeyItem = 543781
	local OptionStr = "[SC_Q427268_01]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		AddSpeakOption( Player, NPC, OptionStr, "Z33_NPC123907SK_1", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123907SK_1()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = 427268
	local KeyItem = 543781
	local MessageStr = "[SC_Q427252_10]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
			CallPlot( Ctrl, "Z33_Q427268ShowPlay", Player )
		else
			ScriptMessage( Player, Player, 3, MessageStr, C_Red )
		end
	end
end
function Z33_Q427268ShowPlay( Player )
	CloseSpeak( Player )
	local Ctrl = OwnerID()
	local PosFlag = 781409
	local FlagIndex = 13
	local NpcID = {}
	NpcID[ 1 ] = 123943--札德　( Flag13 )
	NpcID[ 2 ] = 123944--阿克索( Flag14 )
	NpcID[ 3 ] = 123945--雷心　( Flag15 )
	NpcID[ 4 ] = 123946--鐵鬚　( Flag16 )
	local x, y, z, dir = nil
	local Npc = {}
	for i = 1, 4, 1 do
		x, y, z, dir = DW_Location( PosFlag, FlagIndex )
		Npc[ i ] = CreateObj( NpcID[ i ], x, y, z, dir, 1 )
		AddToPartition( Npc[ i ], 0 )
		MoveToFlagEnabled( Npc[ i ], false )
		FlagIndex = FlagIndex + 1
	end
	CallPlot( Ctrl, "Z33_Q427268ShowCheck", Npc )
	Sleep( 10 ) AdjustFaceDir( Npc[ 1 ], Npc[ 3 ], 0 )
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 15 ) NpcSay( Npc[ 1 ], "[SC_Q427268_02]" ) --剛說到哪
	Sleep( 30 ) AdjustFaceDir( Npc[ 2 ], Npc[ 1 ], 0 )
	Sleep( 05 ) PlayMotion( Npc[ 2 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) NpcSay( Npc[ 2 ], "[SC_Q427268_03]" ) --正在討論
	Sleep( 35 ) AdjustFaceDir( Npc[ 1 ], Npc[ 2 ], 0 )
	Sleep( 10 ) NpcSay( Npc[ 1 ], "[SC_Q427268_04]" ) --等確認了
	Sleep( 35 ) AdjustFaceDir( Npc[ 1 ], Npc[ 3 ], 0 )
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) NpcSay( Npc[ 1 ], "[SC_Q427268_05]" ) --各自問題
	Sleep( 40 ) NpcSay( Npc[ 3 ], "[SC_Q427268_06]" ) --匯集兵力
	Sleep( 35 ) AdjustFaceDir( Npc[ 2 ], Npc[ 3 ], 0 )
	Sleep( 10 ) NpcSay( Npc[ 2 ], "[SC_Q427268_07]" ) --法師研究
	Sleep( 05 ) PlayMotion( Npc[ 2 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 25 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 20 ) NpcSay( Npc[ 1 ], "[SC_Q427268_08]" ) --分頭行事
	Sleep( 05 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 ) AdjustFaceDir( Npc[ 2 ], Npc[ 1 ], 0 )
	Sleep( 05 ) PlayMotion( Npc[ 2 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) NpcSay( Npc[ 2 ], "[SC_Q427268_09]" ) --心情不錯
	Sleep( 35 ) AdjustFaceDir( Npc[ 1 ], Npc[ 2 ], 0 )
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 05 ) NpcSay( Npc[ 1 ], "[SC_Q427268_10]" ) --團結一起
	Sleep( 35 ) PlayMotion( Npc[ 3 ], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep( 05 ) NpcSay( Npc[ 3 ], "[SC_Q427268_11]" ) --抵抗外敵
	Sleep( 10 ) AdjustFaceDir( Npc[ 1 ], Npc[ 3 ], 0 ) AdjustFaceDir( Npc[ 2 ], Npc[ 3 ], 0 )
	Sleep( 40 ) NpcSay( Npc[ 3 ], "[SC_Q427268_12]" ) --站在此地
	Sleep( 35 ) NpcSay( Npc[ 1 ], "[SC_Q427268_13]" ) --讓你失望
	Sleep( 05 ) PlayMotion( Npc[ 1 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 20 ) PlayMotion( Npc[ 2 ], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 20 ) NpcSay( Npc[ 2 ], "[SC_Q427268_14]" ) --獲得友誼
	Sleep( 05 ) PlayMotion( Npc[ 2 ], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 40 ) NpcSay( Npc[ 3 ], "[SC_Q427268_15]" ) --到此為止
	Sleep( 35 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_Q427268ShowCheck( Npc )
	local Ctrl = OwnerID()
	local RequireQuest = 427268
	local KeyItem = 543781
	local ShowCheckBuff = 502337
	local CurrentBuffLv = nil
	local RequiredBuffLv = 20
	local SearchRange = 200
	local RangePlayers = nil
	local GetKeyPlayers = nil
	local CurrentIndex = nil
	local StopMove = 623132
	local Cutscene = 500429
	local ClientBuff = 502623
	while 1 do
		RangePlayers = {}
		GetKeyPlayers = {}
		CurrentIndex = 1
		RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
		for i = 0, #RangePlayers, 1 do
			if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) == true and
			CheckAcceptQuest( RangePlayers[ i ], RequireQuest ) == true and
			CheckFlag( RangePlayers[ i ], KeyItem ) == false ) then
				AddBuff( RangePlayers[ i ], ClientBuff, 0, 3 )
				AddBuff( RangePlayers[ i ], StopMove, 0, 3 )
				table.insert( GetKeyPlayers, CurrentIndex, RangePlayers[ i ] )
				CurrentIndex = CurrentIndex + 1
			end
		end
		if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
			for m = 0, #GetKeyPlayers, 1 do
				if ( GetKeyPlayers[ m ] ~= nil and CheckID( GetKeyPlayers[ m ] ) == true ) then
					AddBuff( GetKeyPlayers[ m ], Cutscene, 0, 3 )
				end		
			end
			break
		else
			for j = 1, #GetKeyPlayers, 1 do
				AddBuff( GetKeyPlayers[ j ], ShowCheckBuff, 0, -1 )
			end
		end
		Sleep( 20 )
	end
	for k = 1, #GetKeyPlayers, 1 do
		CurrentBuffLv = 0
		if CheckBuff( GetKeyPlayers[ k ], ShowCheckBuff ) == true then
			CurrentBuffLv = KS_CheckBuffLv( GetKeyPlayers[ k ], ShowCheckBuff )
			if CurrentBuffLv >= RequiredBuffLv then
				SetFlag( GetKeyPlayers[ k ], KeyItem, 1 )
				CancelBuff( GetKeyPlayers[ k ], ShowCheckBuff )
			else
				CancelBuff( GetKeyPlayers[ k ], ShowCheckBuff )
				ScriptMessage( GetKeyPlayers[ k ], GetKeyPlayers[ k ], 0, "[SC_Q427268_17]", 0 )
				ScriptMessage( GetKeyPlayers[ k ], GetKeyPlayers[ k ], 1, "[SC_Q427268_17]", 0 )
			end
		end		
	end
	for m = 1, #Npc, 1 do
		if ( Npc[ m ] ~= nil and CheckID( Npc[ m ] ) == true ) then
			DelObj( Npc[ m ] )
		end
	end
end
function Z33_Npc124071()
	local Ctrl = OwnerID()
	SetPlot( Ctrl, "touch", "Z33_Npc124071TouchEvent", 40 ) 
end
function Z33_Npc124071TouchEvent()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = 427268
	local PermitStatus = false
	local Cutscene = 500429
	local MessageStr = "[SC_Q427268_16]"--你目前沒有使用的權限！
	if ( CheckAcceptQuest( Player, RequireQuest ) == true or
	CheckCompleteQuest( Player, RequireQuest ) == true or
	ReadRoleValue( Player, EM_RoleValue_IsAttackMode ) == 0 ) then
		PermitStatus = true
	end
	if PermitStatus == false then
		ScriptMessage( Player, Player, 0, MessageStr, 0 )
		ScriptMessage( Player, Player, 1, MessageStr, 0 )
		return
	end
	AddBuff( Player, Cutscene, 0, 2 )
	Sleep( 15 )
	ChangeZone( Player, 33, 0, -8557.6, 831.6, 912.5, 34.2 )
	return
end
function Z33_Npc124072()
	local Ctrl = OwnerID()
	local x = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local y = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local z = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local PortalID = 124075
	local FxObj = CreateObj( PortalID, x, y, z, 0, 1 )
	SetModeEx( FxObj, EM_SetModeType_Save, false )
	SetModeEx( FxObj, EM_SetModeType_Mark, false )
	SetModeEx( FxObj, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( FxObj, false )
	AddToPartition( FxObj, 0 )
	SetPlot( Ctrl, "touch", "Z33_Npc124072TouchEvent", 20 )
end
function Z33_Npc124072TouchEvent()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local Cutscene = 500429
	local FxBuff = 502638
	AddBuff( Player, Cutscene, 0, 2 )
	AddBuff( Player, FxBuff, 0, 8 )
	Sleep( 10 )
	ChangeZone( Player, 33, 0, -8125, 492, 525, 44 )
	return
end
function Z33_Npc124076()
	local Ctrl = OwnerID()
	local x = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local y = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local z = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local PortalID = 124075
	local FxObj = CreateObj( PortalID, x, y, z, 0, 1 )
	SetModeEx( FxObj, EM_SetModeType_Save, false )
	SetModeEx( FxObj, EM_SetModeType_Mark, false )
	SetModeEx( FxObj, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( FxObj, false )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, FxObj )
	SetPlot( Ctrl, "range", "Z33_Npc124076FxCheck", 20 )
end
function Z33_Npc124076FxCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	if CheckBuff( Player, 502638 ) == true then
		SetPlot( Ctrl, "range", "", 0 )
		BeginPlot( Ctrl, "Z33_Npc124076FxBegin", 0 )
	end
	return
end
function Z33_Npc124076FxBegin()
	local Ctrl = OwnerID()
	local FxObj = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	AddToPartition( FxObj, 0 )
	Sleep( 40 )
	DelObj( FxObj )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	BeginPlot( Ctrl, "Z33_Npc124076", 0 )
end