function Z33_Npc123913Ctrl()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetPlot( Ctrl, "range", "Z33_Q427245Event_1", 200 )
end
function Z33_Q427245Event_1()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = 427245
	local KeyItem = 542968
	local ShowSwitch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ( CheckAcceptQuest( Player, RequireQuest ) == false or CheckFlag( Player, KeyItem ) == true or ShowSwitch == 1 ) then
		return
	end
	SetPlot( Ctrl, "range", "", 0 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	BeginPlot( Ctrl, "Z33_Q427245Check", 0 )
	BeginPlot( Ctrl, "Z33_Q427245Event_2", 1 )
End
function Z33_Q427245Event_2()
	local Ctrl = OwnerID()
	local RangePlayers = nil
	local Range = 250
	local BossID = 123919
	local BossObj = nil
	local CastFx = 490867
	local BuffFx1 = 502288
	local BuffFx2 = 500429
	local StopMove = 623132
	local StrColor = C_Red
	local MessageStr1 = "[SC_Q427245_1]"--不再成為威脅...
	local MessageStr2 = "[SC_Q427245_2]"--沒人是我們的對手...
	local MessageStr3 = "[SC_Q427245_3]"--和你們合作...
	local MessageStr4 = "[SC_Q427245_4]"--老鼠混進來了...
	local MessageStr5 = "[SC_Q427245_5]"--準備...受死吧...
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for i = 0, #RangePlayers, 1 do
		if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) == true ) then
			AddBuff( RangePlayers[ i ], StopMove, 0, 3 )
			ScriptMessage( Ctrl, RangePlayers[ i ], 2, MessageStr1, StrColor )
			ScriptMessage( Ctrl, RangePlayers[ i ], 0, MessageStr1, 0 )
		end
	end
	RangePlayers = nil
	Sleep( 35 )
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for j = 0, #RangePlayers, 1 do
		if ( RangePlayers[ j ] ~= nil and CheckID( RangePlayers[ j ] ) == true ) then
			ScriptMessage( Ctrl, RangePlayers[ j ], 2, MessageStr2, StrColor )
			ScriptMessage( Ctrl, RangePlayers[ j ], 0, MessageStr2, 0 )
		end
	end
	RangePlayers = nil
	Sleep( 35 )
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for k = 0, #RangePlayers, 1 do
		if ( RangePlayers[ k ] ~= nil and CheckID( RangePlayers[ k ] ) == true ) then
			ScriptMessage( Ctrl, RangePlayers[ k ], 2, MessageStr3, StrColor )
			ScriptMessage( Ctrl, RangePlayers[ k ], 0, MessageStr3, 0 )
		end
	end
	RangePlayers = nil
	Sleep( 35 )
	BossObj = CreateZ33NPCforShow( Ctrl, BossID )
	LockHP( BossObj, ReadRoleValue( BossObj, EM_RoleValue_MaxHP ), "Lua_424225_LockHP" )
	SetModeEx( BossObj, EM_SetModeType_Mark, false )
	AddBuff( BossObj, BuffFx1, 0, -1 )
	Sleep( 20  )
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for m = 0, #RangePlayers, 1 do
		if ( RangePlayers[ m ] ~= nil and CheckID( RangePlayers[ m ] ) == true ) then
			ScriptMessage( Ctrl, RangePlayers[ m ], 2, MessageStr4, StrColor )
			ScriptMessage( Ctrl, RangePlayers[ m ], 0, MessageStr4, 0 )
			AdjustFaceDir( BossObj, RangePlayers[ m ], 0 )
		end
	end
	RangePlayers = nil
	Sleep( 20 )
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for n = 0, #RangePlayers, 1 do
		if ( RangePlayers[ n ] ~= nil and CheckID( RangePlayers[ n ] ) == true ) then
			ScriptMessage( Ctrl, RangePlayers[ n ], 2, MessageStr5, StrColor )
			ScriptMessage( Ctrl, RangePlayers[ n ], 0, MessageStr5, 0 )
		end
	end
	RangePlayers = nil
	CastSpell( BossObj, BossObj, CastFx )
	Sleep( 40 )
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for p = 0, #RangePlayers, 1 do
		if ( RangePlayers[ p ] ~= nil and CheckID( RangePlayers[ p ] ) == true ) then
			AddBuff( RangePlayers[ p ], BuffFx2, 0, 5 )		
		end
	end
	DelObj( BossObj )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	Sleep( 100 )
	SetPlot( Ctrl, "range", "Z33_Q427245Event_1", 200 )
end
function Z33_Q427245Check()
	local Ctrl = OwnerID()
	local RangePlayers = nil
	local Range = 200
	local Num = nil
	local StopMove = 623132
	local RequireQuest = 427245
	local KeyItem = 542968
	local QuestBuff = 502297
	local GetKeyPlayers = nil
	local MessageStr = "[SC_Q427245_6]"--被突然的攻擊...
	while 1 do
		RangePlayers = nil
		if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
			break
		end
		RangePlayers = SearchRangePlayer( Ctrl, Range )
		for i = 0, #RangePlayers, 1 do
			AddBuff( RangePlayers[ i ], StopMove, 0, 2 )
			if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) == true ) then
				if ( CheckAcceptQuest( RangePlayers[ i ], RequireQuest ) == true and
				CheckFlag( RangePlayers[ i ], KeyItem ) == false ) then
					AddBuff( RangePlayers[ i ], QuestBuff, 0, -1 )
				end
			end
		end
		Sleep( 10 )
	end
	Sleep( 10 )
	Num = 0
	RangePlayers = {}
	GetKeyPlayers = {}
	RangePlayers = SearchRangePlayer( Ctrl, Range )
	for j = 0, #RangePlayers, 1 do
		if ( RangePlayers[ j ] ~= nil and CheckID( RangePlayers[ j ] ) == true ) then
			ScriptMessage( Ctrl, RangePlayers[ j ], 2, MessageStr, 0 )
			ScriptMessage( Ctrl, RangePlayers[ j ], 0, MessageStr, 0 )
		end
	end
	Sleep( 20 )
	for m = 0, #RangePlayers, 1 do
		if ( RangePlayers[ m ] ~= nil and CheckID( RangePlayers[ m ] ) == true ) then
			QuestBuffPos = Lua_BuffPosSearch( RangePlayers[ m ], QuestBuff )
			QuestBuffLv = BuffInfo( RangePlayers[ m ], QuestBuffPos, EM_BuffInfoType_Power )
			if QuestBuffLv >= 10 then
				table.insert( GetKeyPlayers, Num, RangePlayers[ m ] )
				CancelBuff( GetKeyPlayers[ Num ], QuestBuff )
				ChangeZone( GetKeyPlayers[ Num ], 33, 0, -10413, 870, 1825, 180 )
				Num = Num+1
			end
		end
	end
	Sleep( 30 )
	for k = 0, #GetKeyPlayers, 1 do
		if ( GetKeyPlayers[ k ] ~= nil and CheckID( GetKeyPlayers[ k ] ) == true ) then
			SetFlag( GetKeyPlayers[ k ], KeyItem, 1 )
		end
	end
	return
end
function Z33_NPC123890SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427246
	local SpeakKey = 543167--開啟對話
	local KeyItem1 = 543784
	local KeyItem2 = 543785
	local KeyItem3 = 543786
	local OptionStr1 = "SC_Z33Q427246_1"
	local OptionStr2 = "SC_Z33Q427246_3"
	local OptionStr3 = "SC_Z33Q427246_4"
	local OptionStr4 = "SC_Z33Q427246_5"
	if CheckAcceptQuest( Player, RequireQuest ) == false or
	( CheckFlag( Player, KeyItem1 ) == true and
	CheckFlag( Player, KeyItem2 ) == true and
	CheckFlag( Player, KeyItem3 ) == true ) then
		LoadquestOption( Player )
		return
	end
	if CheckFlag( Player, SpeakKey ) == false then
		AddSpeakOption( Player, NPC, GetString( OptionStr1 ), "Z33_NPC123890SK_01", 0 )
	else
		AddSpeakOption( Player, NPC, GetString( OptionStr2 ), "Z33_NPC123890SK_02", 0 )
		AddSpeakOption( Player, NPC, GetString( OptionStr3 ), "Z33_NPC123890SK_03", 0 )
		AddSpeakOption( Player, NPC, GetString( OptionStr4 ), "Z33_NPC123890SK_04", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123890SK_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427246
	local SpeakKey = 543167
	local DetailStr = "SC_Z33Q427246_2"
	local OptionStr1 = "SC_Z33Q427246_3"--神器和英雄
	local OptionStr2 = "SC_Z33Q427246_4"--盧瑟之殞
	local OptionStr3 = "SC_Z33Q427246_5"--巨魔王
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetFlag( Player, SpeakKey, 1 )
		SetSpeakDetail( Player, GetString( DetailStr ) )
		AddSpeakOption( Player, NPC, GetString( OptionStr1 ), "Z33_NPC123890SK_02", 0 )
		AddSpeakOption( Player, NPC, GetString( OptionStr2 ), "Z33_NPC123890SK_03", 0 )
		AddSpeakOption( Player, NPC, GetString( OptionStr3 ), "Z33_NPC123890SK_04", 0 )
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123890SK_02()--三神器和三英雄
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427246
	local KeyItem = 543784
	local DetailStr = "SC_Z33Q427246_6"
	local OptionStr = "SO_BACK"--返回
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetSpeakDetail( Player, GetString( DetailStr ) )
		AddSpeakOption( Player, NPC, GetString( OptionStr ), "Z33_NPC123890SK_00", 0 )
		if CheckFlag( Player, KeyItem ) == false then
			SetFlag( Player, KeyItem, 1 )
		end
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123890SK_03()--盧瑟之殞
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427246
	local KeyItem = 543785
	local DetailStr = "SC_Z33Q427246_7"
	local OptionStr = "SO_BACK"--返回
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetSpeakDetail( Player, GetString( DetailStr ) )
		AddSpeakOption( Player, NPC, GetString( OptionStr ), "Z33_NPC123890SK_00", 0 )
		if CheckFlag( Player, KeyItem ) == false then
			SetFlag( Player, KeyItem, 1 )
		end
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123890SK_04()--巨魔王
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427246
	local KeyItem = 543786
	local DetailStr = "SC_Z33Q427246_8"
	local OptionStr = "SO_BACK"--返回
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetSpeakDetail( Player, GetString( DetailStr ) )
		AddSpeakOption( Player, NPC, GetString( OptionStr ), "Z33_NPC123890SK_00", 0 )
		if CheckFlag( Player, KeyItem ) == false then
			SetFlag( Player, KeyItem, 1 )
		end
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123891()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
function Z33_Q427247Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502348
	local NpcID = 123920
	local Npc = nil
	local FlagID = 781409
	local SpeakStr = "[SC_Q427247_1]"
	local ShowSwitch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ShowSwitch == 1 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	AddBuff( Player, ClientBuff, 0, 8 )
	Npc = CreateZ33NPCforShow( Ctrl, NpcID )
	AdjustFaceDir( Npc, Player, 0 )
	Sleep( 05 ) PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) NpcSay( Npc, SpeakStr )
	Sleep( 25 ) FaceFlag ( Npc, FlagID, 2 ) AdjustDir( Npc, 0 )
	Sleep( 05 ) LuaFunc_MoveToFlag( Npc, FlagID, 2, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	DelObj( Npc )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
function Z33_NPC123889SK()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427247
	local KeyItem = 543168
	local OptionStr = "SC_Q427247_2"
	if CheckAcceptQuest( Player, RequireQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, GetString( OptionStr ), "Z33_NPC123892SK_1", 0 )
	end
	LoadquestOption( Player )
end
function Z33_NPC123892SK_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427247
	local QuestItem =204522
	local KeyItem = 543168
	local OptionStr = "SC_CONTINUE_SPEAK"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 ) then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123889()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
function Z33_Q427248Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502624
	local NpcID = 123921
	local Npc = nil
	local FlagID = 781409
	local FlagNum = 3
	local SpeakStr1 = "[SC_Q427248_1]"
	local SpeakStr2 = "[SC_Q427248_2]"
	local ShowSwitch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ShowSwitch == 1 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	AddBuff( Player, ClientBuff, 0, 9 )
	Npc = CreateZ33NPCforShow( Ctrl, NpcID )
	AdjustFaceDir( Npc, Player, 0 )
	Sleep( 05 ) PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) NpcSay( Npc, SpeakStr1 )
	Sleep( 30 ) FaceFlag ( Npc, FlagID, FlagNum ) AdjustDir( Npc, 0 )
	Sleep( 05 ) NpcSay( Npc, SpeakStr2 )
	Sleep( 05 ) LuaFunc_MoveToFlag( Npc, FlagID, FlagNum, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	DelObj( Npc )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
function Z33_NPC123892()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
function Z33_Q427249Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502589
	local NpcID = 123922
	local Npc = nil
	local FlagID = 781409
	local FlagNum = 4
	local SpeakStr = "[SC_Q427249_1]"
	local ShowSwitch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ShowSwitch == 1 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	AddBuff( Player, ClientBuff, 0, 9 )
	Npc = CreateZ33NPCforShow( Ctrl, NpcID )
	AdjustFaceDir( Npc, Player, 0 )
	Sleep( 05 ) PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) NpcSay( Npc, SpeakStr )
	Sleep( 30 ) FaceFlag ( Npc, FlagID, FlagNum ) AdjustDir( Npc, 0 )
	Sleep( 05 ) LuaFunc_MoveToFlag( Npc, FlagID, FlagNum, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	DelObj( Npc )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
function Z33_Npc123895()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_MINING_LOOP )
	MoveToFlagEnabled( Ctrl, true )
end
function Z33_NPC123895SK_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest1 = 427250
	local RequireQuest2 = 427251
	local KeyItem1 = 543169
	local KeyItem2 = 543183
	local CheckKey = 543808
	local OptionStr1 = "[SC_Q427250_1]"
	local OptionStr2 = "[SC_Q427251_2]"
	local OptionStr3 = "[SC_Q427251_3]"
	if CheckAcceptQuest( Player, RequireQuest1 ) == true and
	CheckFlag( Player, KeyItem1 ) == false then
		AddSpeakOption( Player, NPC, OptionStr1, "Z33_NPC123895SK_2", 0 )
	elseif ( CheckAcceptQuest( Player, RequireQuest2 ) == true and CheckFlag( Player, KeyItem2 ) == false ) then
		if CheckFlag( Player, CheckKey ) == false then
			AddSpeakOption( Player, NPC, OptionStr2, "Z33_NPC123895SK_4", 0 )
		else
			AddSpeakOption( Player, NPC, OptionStr3, "Z33_NPC123895SK_4", 0 )
		end
	end
	LoadquestOption( Player )
end
function Z33_NPC123895SK_2()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427250
	local KeyItem = 543169
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
		if ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 then
			MoveToFlagEnabled( NPC, false )
			SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_STAND )
			CallPlot( NPC, "Z33_NPC123895SK_3", Player )
		end
	else
		CloseSpeak( Player )
	end
end
function Z33_NPC123895SK_3( Player )
	local Ctrl = OwnerID()
	local RandTime = nil
	local RandMotion = nil
	local MotionType = {}
	MotionType[ 1 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE0
	MotionType[ 2 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE1
	MotionType[ 3 ] = ruFUSION_ACTORSTATE_NORMAL
	Sleep( 05 )
	PlayMotion( Ctrl, MotionType[ 1 ] )
	Sleep( 20 )
	if ( Player ~= nil and CheckID( Player ) ) == true then
		AdjustFaceDir( Ctrl, Player, 0 )
	end
	for i = 1, 3, 1 do
		RandTime = DW_Rand( 5 )*10
		Sleep( 50+RandTime )
		RandMotion = DW_Rand( 3 )
		PlayMotion( Ctrl, MotionType[ RandMotion ] )
	end
	MoveToFlagEnabled( Ctrl, true )
	Sleep( 20 )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_MINING_LOOP )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_NPC123895SK_4()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427251
	local KeyItem = 543183
	local CheckKey = 543808
	local Follower = 123923
	local Follower_ID = 123923
	if ( CheckAcceptQuest( Player, RequireQuest ) == false or
	CheckFlag( Player, KeyItem ) == true ) then
		return
	end
	SetFlag( Player, CheckKey, 1 )
	CloseSpeak( Player )
	Follower = CreateZ33NPCforShow( NPC, Follower_ID )
	WriteRoleValue( Follower, EM_RoleValue_Register1, Player )
	CallPlot( Follower, "Z33_Q427251Event", Player )
end
function Z33_Q427251Event( Player )
	local Follower = OwnerID()
	local ClientFlag = 543839
	local RequireQuest = 427251
	local SaveDis = 200
	local ActBuff = 502298
	local BuffLv = nil
 	local StopMove = 623132
	local RandStr = nil
	local SpeakStr = {}
	SpeakStr[ 1 ] = "[SC_Q427251_4]"
	SpeakStr[ 2 ] = "[SC_Q427251_5]"
	SpeakStr[ 3 ] = "[SC_Q427251_6]"
	SpeakStr[ 4 ] = "[SC_Q427251_7]"
	SpeakStr[ 5 ] = "[SC_Q427251_10]"
	local MessageStr = {}
	MessageStr[ 1 ] = "[SC_Q427251_8]"
	MessageStr[ 2 ] = "[SC_Q427251_9]"
	SetFlag( Player, ClientFlag, 1 )
	while 1 do
		if ( Player == nil or CheckID( Player ) == false ) then
			break
		elseif CheckAcceptQuest( Player, RequireQuest ) == false then
			break
		elseif ReadRoleValue( Follower, EM_RoleValue_Register1 ) == 0 then
			AdjustFaceDir( Follower, Player, 0 )
			NpcSay( Follower, SpeakStr[ 5 ] )
			break
		elseif CheckDistance( Follower, Player, SaveDis ) == false then
			ScriptMessage( Follower, Player, 1, MessageStr[ 1 ], 0 )
			ScriptMessage( Follower, Player, 0, MessageStr[ 1 ], 0 )	
			break
		elseif CheckBuff( Player, ActBuff ) == true then
			BuffLv = KS_CheckBuffLV( Player, ActBuff )
			if BuffLv >= 30 then
				ScriptMessage( Follower, Player, 1, MessageStr[ 2 ], 0 )
				ScriptMessage( Follower, Player, 0, MessageStr[ 2 ], 0 )
				break
			end
		end
		AddBuff( Player, ActBuff, 0, -1 )
		RandStr = DW_Rand( 20 )
		if RandStr <= 4 then
			SetFollow( Follower, 0 )
			AdjustFaceDir( Follower, Player, 0 )
			Sleep( 10 ) NpcSay( Follower, SpeakStr[ RandStr ] )
			Sleep( 10 )
			if RandStr <= 2 then
				PlayMotion( Follower, ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
			end
			Sleep( 10 )
		end
		Sleep( 10 ) SetFollow( Follower, Player )
		Sleep( 10 )
	end
	SetFollow( Follower, 0 )
	Sleep( 10 ) AddBuff( Follower, StopMove, 0, -1 )
	PlayMotion( Follower, ruFUSION_ACTORSTATE_EMOTE_TIRED )
	Sleep( 30 ) DelObj( Follower )
	if CheckID( Player ) == true then
		SetFlag( Player, ClientFlag, 0 )
	end
	return
end
function Z33_Q427251Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local RandSpeak = DW_Rand( 2 )
	local CheckKey = 543808
	CloseSpeak( Player )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	MoveToFlagEnabled( Ctrl, false )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_STAND )
	Sleep( 10 )
	AdjustFaceDir( Ctrl, Player, 0 )
	if CheckFlag( Player, CheckKey ) == false then
		RandSpeak = 1
	end
	if RandSpeak == 1 then
		NpcSay( Ctrl, "[SC_Q427251_1]" )
	end
	Sleep( 50 )
	MoveToFlagEnabled( Ctrl, true )
	Sleep( 25 )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_MINING_LOOP )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_Npc123924Ctrl()
	local Ctrl = OwnerID()
	local Player = nil
	local RequireQuest = 427251
	local KeyItem = 543183
	local QuestObj = nil
	local Follower_ID = 123923
	local Range = 100
	while 1 do
		QuestObj = SearchRangeNPC( Ctrl, Range )
		for i = 0, #QuestObj, 1 do
			if ReadRoleValue( QuestObj[ i ], EM_RoleValue_OrgID ) == Follower_ID then
				Player = ReadRoleValue( QuestObj[ i ], EM_RoleValue_Register1 )
				WriteRoleValue( QuestObj[ i ], EM_RoleValue_Register1, 0 )
				if ( Player ~= nil and CheckID( Player ) == true ) then
					if ( CheckAcceptQuest( Player, RequireQuest ) == true and
					CheckFlag( Player, KeyItem ) == false ) then
						SetFlag( Player, KeyItem, 1 )
					end
				end
			end
		end
		Sleep( 20 )
	end
end
function Z33_NPC123894()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end
function Z33_Q427252Accept()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientBuff = 502603
	local ShowSwitch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	local ShowFlag = 781410
	local x, y, z, dir = nil
	local NpcID = {}
	NpcID[ 1 ] = 123925
	NpcID[ 2 ] = 123926
	local NPC = {}
	if ShowSwitch == 1 then
		return
	end
	AddBuff( Player, ClientBuff, 0, 15 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	for i = 1, #NpcID, 1 do
		x, y, z, dir = DW_Location( ShowFlag, i )
		NPC[ i ] = CreateObj( NpcID[ i ], x, y, z, dir, 1 )
		AddToPartition( NPC[ i ], 0 )
		MoveToFlagEnabled( NPC[ i ], false )
		CallPlot( NPC[ i ], "Z33_Q427252Accept_2", Ctrl, Player, i )
	end
end
function Z33_Q427252Accept_2( Ctrl, Player, Num )
	local Npc = OwnerID()
	local ShowFlag = 781410
	local SpeakStr1 = "[SC_Q427252_1]" 
	local SpeakStr2 = "[SC_Q427252_2]" 
	Sleep( 10 )
	if Player ~= nil and CheckID( Player ) == true then
		AdjustFaceDir( Npc, Player, 0 )
	end
	Sleep( 10 )
	if Num == 1 then
		PlayMotion( Npc, ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		Sleep( 25 ) NpcSay( Npc, SpeakStr1 )
		Sleep( 25 ) NpcSay( Npc, SpeakStr2 )
		Sleep( 25 )
	else
		Sleep( 110 )
	end
	LuaFunc_MoveToFlag( Npc, ShowFlag, Num+2, 0 )
	SetDefIdleMotion( Npc, ruFUSION_MIME_WALK_FORWARD )
	Sleep( 10 )
	if Num == 2 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	end
	DelObj( Npc )
	return
end
function Z33_NPC123893()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register3, 0 )
end
function Z33_NPC123893SK()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest1 = 427252
	local RequireQuest2 = 427265
	local RequireQuest3 = 427259
	local KeyItem1 = 543184
	local KeyItem2 = 543525
	local KeyItem3 = 204549--符文之水
	local QuestItem = 204548--空的容器
	local ShowSwitch = ReadRoleValue( NPC, EM_RoleValue_Register1 )
	local OptionStr1 = "[SC_Q427252_3]"
	local OptionStr2 = "[SC_Q427265_2]"
	local OptionStr3 = "[SC_Q427259_6]"--我想再次取得空的容器
	if ( CheckAcceptQuest( Player, RequireQuest1 ) == true and CheckFlag( Player, KeyItem1 ) == false and ShowSwitch == 0 ) then
		AddSpeakOption( Player, NPC, OptionStr1, "Z33_NPC123893SK_1", 0 )
	elseif ( CheckAcceptQuest( Player, RequireQuest2 ) == true and CheckFlag( Player, KeyItem2 ) == false ) then
		AddSpeakOption( Player, NPC, OptionStr2, "Z33_NPC123893SK_2", 0 )
	elseif ( CheckAcceptQuest( Player, RequireQuest3 ) == true and CountBodyItem( Player, QuestItem ) == 0 and CountBodyItem( Player, KeyItem3 ) == 0 ) then
		AddSpeakOption( Player, NPC, OptionStr3, "Z33_NPC123893SK_4", 0 )
	end
	LoadquestOption( Player )
end