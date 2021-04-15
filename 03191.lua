function Z33_NPC123893SK_1()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427252
	local KeyItem = 543184
	local MessageStr = "[SC_Q427252_10]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		if ( ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 and
		ReadRoleValue( NPC, EM_RoleValue_Register2 ) == 0 ) then
			WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
			WriteRoleValue( NPC, EM_RoleValue_Register2, 1 )
			BeginPlot( NPC, "Z33_Q427252Event", 0 )
			BeginPlot( NPC, "Z33_Q427252EventCheck", 1 )
		else
			ScriptMessage( Player, Player, 1, MessageStr, 0 )
		end
	end
	CloseSpeak( Player )
	return	
end
function Z33_NPC123893SK_2()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = 427265
	local KeyItem = 543525
	local SpeakStr = "SC_Q427265_3"
	local OptionStr = "[SC_Q427265_4]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
		AddSpeakOption( Player, Ctrl, OptionStr, "Z33_NPC123893SK_3", 0 )
	end
end
function Z33_NPC123893SK_3()
	local Player = OwnerID()
	local ClientBuff = 502608
	local RangePlayers = nil
	local SearchRange = 200
	local Ctrl = TargetID()
	local RequireQuest = 427265
	local KeyItem = 543525
	local MessageStr = "[SC_Q427252_10]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		if ReadRoleValue( Ctrl, EM_RoleValue_Register3 ) == 0 then
			RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
			for i = 0, #RangePlayers, 1 do
				if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) == true ) then
					AddBuff( RangePlayers[ i ], ClientBuff, 0, 45 )
				end
			end
			WriteRoleValue( Ctrl, EM_RoleValue_Register3, 1 )
			BeginPlot( Ctrl, "Z33_Q427265Event", 0 )
		else
			ScriptMessage( Player, Player, 3, MessageStr, C_Red )
		end
	end
	CloseSpeak( Player )
end
function Z33_NPC123893SK_4()
	local Player = OwnerID()
	local RequireQuest = 427259
	local KeyItem = 204549--符文之水
	local QuestItem = 204548--空的容器
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CountBodyItem( Player, QuestItem ) == 0 and CountBodyItem( Player, KeyItem ) == 0 ) then
		GiveBodyItem( Player, QuestItem, 1 )
	end
	CloseSpeak( Player )
end
function Z33_Q427252Event()
	local Ctrl = OwnerID()
	local RequireQuest = 427252
	local KeyItem = 543184
	local x, y, z, dir = nil
	local ShowFlag = 781411
	local CurrentIndex = nil
	local NpcObj = {}
	local NpcID = {}
	NpcID[ 1 ] = 123928--奎托克．鐵鬚
	NpcID[ 2 ] = 123929--寇葛拉．炎砧
	NpcID[ 3 ] = 123930--莫妥曼．炎砧
	local SpeakStr = {}
	SpeakStr[ 1 ] = "[SC_Q427252_4]"--不太對勁
	SpeakStr[ 2 ] = "[SC_Q427252_11]"--你怎麼了
	SpeakStr[ 3 ] = "[SC_Q427252_5]"--身體痛苦
	SpeakStr[ 4 ] = "[SC_Q427252_7]"--兒子！
	SpeakStr[ 5 ] = "[SC_Q427252_6]"--巨魔下咒
	SpeakStr[ 6 ] = "[SC_Q427252_8]"--啊啊啊！
	SpeakStr[ 7 ] = "[SC_Q427252_12]"--這究竟是
	local FxBuff1 = 502328
	local FxBuff2 = 502327
	local FxCast = 490868
	local FxID = {}
	FxID[ 1 ] = 123932
	FxID[ 2 ] = 123931
	local FxObj = {}
	for i = 1, #NpcID, 1 do
		CurrentIndex = i
		x, y, z, dir = DW_Location( ShowFlag, CurrentIndex )
		NpcObj[ CurrentIndex ] = CreateObj( NpcID[ CurrentIndex ], x, y, z, dir, 1 )
		AddToPartition( NpcObj[ CurrentIndex ], 0 )
		MoveToFlagEnabled( NpcObj[ CurrentIndex ], false )
	end
	for j = 1, #FxID, 1 do
		CurrentIndex = j
		x, y, z, dir = DW_Location( NpcObj[ 3 ] )
		FxObj[ CurrentIndex ] = CreateObj( FxID[ CurrentIndex ], x, y, z, dir, 1 )
	end
	Sleep( 10 ) AdjustFaceDir( NpcObj[ 1 ], NpcObj[ 2 ], 0 )
	Sleep( 10 ) NpcSay( NpcObj[ 1 ], SpeakStr[ 1 ] )
	Sleep( 10 ) AddToPartition( FxObj[ 1 ], 0 )
	Sleep( 20 ) AddBuff( NpcObj[ 3 ], FxBuff1, 0, -1 )
	Sleep( 15 ) AdjustFaceDir( NpcObj[ 2 ], NpcObj[ 3 ], 0 )
	Sleep( 10 ) NpcSay( NpcObj[ 2 ], SpeakStr[ 2 ] )
	SetDefIdleMotion( NpcObj[ 2 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 10 ) AdjustFaceDir( NpcObj[ 1 ], NpcObj[ 3 ], 0 )
	Sleep( 10 ) SetDefIdleMotion( NpcObj[ 1 ], ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep( 20 ) NpcSay( NpcObj[ 3 ], SpeakStr[ 3 ] )
	Sleep( 20 ) NpcSay( NpcObj[ 2 ], SpeakStr[ 7 ] )
	Sleep( 20 ) NpcSay( NpcObj[ 1 ], SpeakStr[ 5 ] )
	Sleep( 30 ) NpcSay( NpcObj[ 3 ], SpeakStr[ 6 ] )
	Sleep( 10 ) AddBuff( NpcObj[ 3 ], FxBuff2, 0, -1 )
	Sleep( 10 ) NpcSay( NpcObj[ 2 ], SpeakStr[ 4 ] )
	Sleep( 10 ) AddToPartition( FxObj[ 2 ], 0 )
	Sleep( 15 ) CastSpell( FxObj[ 2 ], FxObj[ 2 ], FxCast )
	DelObj( NpcObj[ 3 ] )
	CastSpell( NpcObj[ 1 ], NpcObj[ 1 ], 490870 )
	CastSpell( NpcObj[ 2 ], NpcObj[ 2 ], 490870 )
	Sleep( 20 ) WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	Sleep( 20 )
	for k = 1, 2, 1 do
		DelObj( NpcObj[ k ] )
		DelObj( FxObj[ k ] )
	end
	return
end
function Z33_Q427252EventCheck()
	local Ctrl = OwnerID()
	local RangePlayers = {}
	local Range = 100
	local ClientBuff = 502604
 	local StopMove = 623132
	local Cutscene = 500429
	local RequireQuest = 427252
	local KeyItem = 543184
	local GetKeyPlayers = nil
	local Index =nil
	local ShowBuff = 502318
	local BuffLv = nil
	local RequireLv = 10
	local MessageStr = "[SC_Q427252_9]"
	while 1 do
		RangePlayers = SearchRangePlayer( Ctrl, Range )
		GetKeyPlayers = {}
		Index = 1
		for i = 0, #RangePlayers, 1 do
			if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) == true ) then
				AddBuff( RangePlayers[ i ], StopMove, 0, 3 )
				if ( CheckAcceptQuest( RangePlayers[ i ], RequireQuest ) == true and
				CheckFlag( RangePlayers[ i ], KeyItem ) == false ) then
					AddBuff( RangePlayers[ i ], ClientBuff, 0, 2 )
					AddBuff( RangePlayers[ i ], ShowBuff, 0, -1 )
					table.insert( GetKeyPlayers, Index, RangePlayers[ i ] )
					Index = Index + 1
				end
			end
		end
		if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
			break
		end
		Sleep( 20 )
	end
	for j = 1, #GetKeyPlayers, 1 do
		if ( GetKeyPlayers[ j ] ~= nil and CheckID( GetKeyPlayers[ j ] ) == true ) then
			AddBuff( GetKeyPlayers[ j ], Cutscene, 0, 3 )
			ScriptMessage( GetKeyPlayers[ j ], GetKeyPlayers[ j ], 0, MessageStr, 0 )
			ScriptMessage( GetKeyPlayers[ j ], GetKeyPlayers[ j ], 2, MessageStr, 0 )
		end
	end
	Sleep( 20 )
	for k = 1, #GetKeyPlayers, 1 do
		if ( GetKeyPlayers[ k ] ~= nil and CheckID( GetKeyPlayers[ k ] ) == true ) then
			BuffLv = KS_CheckBuffLV( GetKeyPlayers[ k ], ShowBuff )
			if BuffLv >= RequireLv then
				SetFlag( GetKeyPlayers[ k ], KeyItem, 1 )
			end
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	return
end
function Z33_Npc123897SK()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest1 = 427254
	local RequireQuest2 = 427266
	local KeyItem1 = 543185
	local KeyItem2 = 543556
	local QuestItem = 204551
	local OptionStr1 = "[SC_Q427254_1]"
	local OptionStr2 = "[SC_Q427266_1]"
	if ( CheckAcceptQuest( Player, RequireQuest1 ) == true and CheckFlag( Player, KeyItem1 ) == false ) then
		AddSpeakOption( Player, Npc, OptionStr1, "Z33_Npc123897SK_2", 0 )
	elseif ( CheckAcceptQuest( Player, RequireQuest2 ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem2 ) == false ) then
		AddSpeakOption( Player, Npc, OptionStr2, "Z33_Npc123897SK_3", 0 )
	end
	LoadquestOption( Player )
end
function Z33_Npc123897SK_2()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427254
	local KeyItem = 543185
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
end
function Z33_Npc123897SK_3()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427266
	local QuestItem = 204551
	local KeyItem = 543556
	local SpeakStr = "[SC_Q427266_2]"
	local OptionStr = "[SC_Q427266_3]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false ) then
		SetSpeakDetail( Player, SpeakStr )
		AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123897SK_4", 0 )
	else
		CloseSpeak( Player )
	end
end
function Z33_Npc123897SK_4()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427266
	local KeyItem = 543556
	local QuestItem = 204551
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false ) then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		LoadQuestOption( Player )
	else
		CloseSpeak( Player )
	end
end
function Z33_Npc123898()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--事件開關
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )--計每波怪物數量使用
	WriteRoleValue( Ctrl, EM_RoleValue_Register3, 0 )--巴伐茍斯的GID
end
function Z33_Npc123898SK()
	local Player = OwnerID()
	local Npc = TargetID()
	local MainQuest = 427256
	local KeyItem = 543809
	local SideQuest = { 427287, 427334, 427343 }
	local OptionStr = nil
	if ( CheckAcceptQuest( Player, MainQuest ) == true and CheckFlag( Player, KeyItem ) == false ) then
		OptionStr = "[SC_Q427256_1]"
	else	for i = 0, #SideQuest, 1 do
			if ( SideQuest[ i ] ~= nil and SideQuest[ i ] ~= 0 ) then
				if CheckAcceptQuest( Player, SideQuest[ i ] ) == true then
					OptionStr = "[Z33_QUEST_EVENT_OPTION]"
				end				
			end
		end
	end
	if OptionStr ~= nil then
		AddSpeakOption( Player, Npc, OptionStr, "Z33_EventQuestNpcSK", 0 )
	end
	LoadquestOption( Player )
end
function Z33_Q427256Event( Player, FlagID, NpcID1, NpcID2, NpcID3 )
	local Ctrl = OwnerID()
	local Index = nil
	local CurrentPlayer = nil
	local CurrentNpc = nil
	local Wizard = {}
	local InsertPos = 0
	local QuestBoss = nil
	local BossHateAmount = nil
	local GetKeyPlayer = {}
	DisableQuest( Ctrl, true )
	PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep( 15 ) CurrentPlayer = SearchRangePlayer( Ctrl, 1000 )
	for Index = 0, #CurrentPlayer, 1 do
		if ( CurrentPlayer[ Index ] ~= nil and CheckID( CurrentPlayer[ Index ] ) == true ) then
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 0, "[SC_Q427256_2]", 0 )
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 2, "[SC_Q427256_2]", C_LightGreen )
		end
	end
	Sleep( 15 )  CurrentNpc = SearchRangeNpc( Ctrl, 1000 )
	for Index = 0, #CurrentNpc, 1 do
		if ( CurrentNpc[ Index ] ~= nil and CheckID( CurrentNpc[ Index ] ) == true ) then
			if ( ReadRoleValue( CurrentNpc[ Index ], EM_RoleValue_OrgID ) == 124098 or
			ReadRoleValue( CurrentNpc[ Index ], EM_RoleValue_OrgID ) == 124099 ) then
				DelFromPartition( CurrentNpc[ Index ] )
				table.insert( Wizard, InsertPos, CurrentNpc[ Index ] )
				InsertPos = InsertPos + 1
			end
		end
	end
	Sleep( 25 ) CurrentPlayer = SearchRangePlayer( Ctrl, 1000 )
	for Index = 0, #CurrentPlayer, 1 do
		if ( CurrentPlayer[ Index ] ~= nil and CheckID( CurrentPlayer[ Index ] ) == true ) then
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 0, "[SC_Q427256_3]", 0 )
			ScriptMessage( CurrentPlayer[ Index ], CurrentPlayer[ Index ], 2, "[SC_Q427256_3]", C_LightGreen )
		end
	end
	Sleep( 10 ) CallPlot( Ctrl, "Z33_SideQuestEvent", FlagID, NpcID1, NpcID2, NpcID3 )
	DisableQuest( Ctrl, false )
	while true do
		Sleep( 10 )
		if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( Ctrl, EM_RoleValue_Register3, 0 )
			for Index = 0, #Wizard, 1 do
				if ( Wizard[ Index ] ~= nil and Wizard[ Index ] ~= 0 ) then
					AddToPartition( Wizard[ Index ], 0 )
				end
			end
			return
		end
		if ( QuestBoss == nil or QuestBoss == 0 ) then
			QuestBoss = ReadRoleValue( Ctrl, EM_RoleValue_Register3 )
		end
		if ReadRoleValue( QuestBoss, EM_RoleValue_IsDead ) == 0 then
			CurrentPlayer = nil
			BossHateAmount = HateListCount( QuestBoss )
			if ( BossHateAmount ~= nil and BossHateAmount ~= 0 ) then
				for Index = 0, BossHateAmount, 1 do
					CurrentPlayer = HateListInfo( QuestBoss, Index, EM_HateListInfoType_GItemID )
					table.insert( GetKeyPlayer, Index, CurrentPlayer )
				end
			end
		else	if ( GetKeyPlayer ~= nil and #GetKeyPlayer ~= 0 ) then
				for Index = 0, #GetKeyPlayer, 1 do
					if ( GetKeyPlayer[ Index ] ~= nil and CheckID( GetKeyPlayer[ Index ] ) == true ) then
						if ( CheckAcceptQuest( GetKeyPlayer[ Index ], 427256 ) == true and
						CheckFlag( GetKeyPlayer[ Index ], 543809 ) == false ) then
							SetFlag( GetKeyPlayer[ Index ], 543809, 1 )
						end
					end
				end
			end
		end
	end
	return
end
function Z33_NPC123899SK()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427259
	local QuestItem = 204549
	local SpeakStr = "SC_Q427259_2"
	local OptionStr = "[SC_Q427259_3]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CountBodyItem( Player, QuestItem ) == 0 ) then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
		AddSpeakOption( Player, NPC, OptionStr, "Z33_NPC123899SK_2", 0 )
	else
		LoadquestOption( Player )
	end
end
function Z33_NPC123899SK_2()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest = 427259
	local QuestItem = 204549
	local Cutscene = 500429
	local MessageStr = "[SC_Q427259_5]"
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and CountBodyItem( Player, QuestItem ) == 0 ) then
		AddBuff( Player, Cutscene, 0, 1 )
		ChangeZone( Player, 33, 0, -6273, 1036, -2974, 0 )
	else
		ScriptMessage( Player, Player, 0, MessageStr, 0 )
		ScriptMessage( Player, Player, 1, MessageStr, 0 )
		CloseSpeak( Player )
	end
end
function Z33_Npc123935()
	local Ctrl = OwnerID()
	local CurrentPosX = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local CurrentPosY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local CurrentPosZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local FxObjID = 124017
	local FxObj = CreateObj( FxObjID, CurrentPosX, CurrentPosY, CurrentPosZ, 0, 1 )
	SetModeEx( FxObj, EM_SetModeType_Save, false )
	SetModeEx( FxObj, EM_SetModeType_Mark, false )
	SetModeEx( FxObj, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( FxObj, false )
	AddToPartition( FxObj, 0 )
	SetPlot( Ctrl, "touch", "Z33_Npc123935TouchBegin", 40 )
end
function Z33_Npc123935TouchBegin()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local CastStr = "[SC_Q427259_4]"
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )
	SetPlot( Ctrl, "touch", "", 0 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 20, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "Z33_NPC123935TouchEnd" )
end
function Z33_Npc123935TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	local Cutscene = 500429
	SetModeEx( Ctrl, EM_SetModeType_Mark, true )
	SetPlot( Ctrl, "touch", "Z33_Npc123935TouchBegin", 40 )
	EndCastBar( Player, CheckStatus )
	if CheckStatus > 0 then
		AddBuff( Player, Cutscene, 0, 1 )
		ChangeZone( Player, 33, 0, -6339, 809, -2672, 98 )
	end
end
function Z33_Q427259Touch()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local RequireQuest = 427259
	local ConsumeItem = 204548
	local QuestItem = 204549
	if ( CheckAcceptQuest( Player, RequireQuest ) == true and
	CountBodyItem( Player, ConsumeItem ) == 1 and
	CountBodyItem( Player, QuestItem ) == 0 ) then
		GiveBodyItem( Player, QuestItem, 1 )
		DelBodyItem( Player, ConsumeItem, 1 )
		return true
	end
	return false
End
function Z33_Npc123902()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--開關範圍劇情（「我下令撤出並且封鎖此區，是哪個不怕死的擅闖進來！」）
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	SetPlot( Ctrl, "range", "Z33_Npc123902_2", 100 )
end
function Z33_Npc123902_2()
	local Player = OwnerID()
	local Ctrl = TargetID()
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	BeginPlot( Ctrl, "Z33_Q427261Event", 0 )
end
function Z33_Q427261Event()
	local Ctrl = OwnerID()
	local RangePlayers = {}
	local SearchRange = 100
	local RequireQuest = 427261
	local QuestFlag = 543287
 	local StopMove = 623132
	local MessageStr = "[SC_Q427261_1]"
	RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
	for i = 0, #RangePlayers, 1 do
		if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) ==true and
		CheckAcceptQuest( RangePlayers[ i ], RequireQuest ) == true and
		CheckFlag( RangePlayers[ i ], QuestFlag ) == false ) then
			AddBuff( RangePlayers[ i ], StopMove, 0, 3 )
			SetFlag( RangePlayers[ i ], QuestFlag, 1 )
			ScriptMessage( RangePlayers[ i ], RangePlayers[ i ], 2, MessageStr, C_Red )
			ScriptMessage( RangePlayers[ i ], RangePlayers[ i ], 0, MessageStr, 0 )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_Npc123902SK()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427262
	local KeyItem = 543524
	local SpeakStr = "SC_Q427262_1"
	local OptionStr = "[SC_Q427262_2]"
	if CheckAcceptQuest( Player, RequireQuest ) == true and CheckFlag( Player, KeyItem ) == false then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
		AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123902SK_2", 0 )
	else
		LoadquestOption( Player )
	end
end
function Z33_Npc123902SK_2()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427262
	local SpeakStr = "SC_Q427262_3"
	local OptionStr = "[SC_Q427262_4]"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
		AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123902SK_3", 0 )
	else
		CloseSpeak( Player )
	end
end
function Z33_Npc123902SK_3()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427262
	local SpeakStr = "SC_Q427262_5"
	local OptionStr = "[SC_Q427262_6]"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
		AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123902SK_4", 0 )
	else
		CloseSpeak( Player )
	end
end
function Z33_Npc123902SK_4()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = 427262
	local KeyItem = 543524
	local SpeakStr = "SC_Q427262_7"
	local OptionStr = "[SC_CONTINUE_SPEAK]"
	if CheckAcceptQuest( Player, RequireQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
		AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123902SK_5", 0 )
		SetFlag( Player, KeyItem, 1 )
	else
		CloseSpeak( Player )
	end
end
function Z33_Npc123902SK_5()
	LoadQuestOption( OwnerID() )
end