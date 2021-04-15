function Z33_QuestEventAccept( FlagID, NpcID1, NpcID2, NpcID3 )
	local Ctrl = OwnerID()
	local Player = TargetID()
	local QuestBuff = 502631
	if ( FlagID == nil or NpcID1 == nil or NpcID2 == nil or NpcID3 == nil ) then
		return
	end
	if CheckBuff( Player, QuestBuff ) == true then
		CancelBuff( Player, QuestBuff )
	end
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		if FlagID == 781439 then
			CallPlot( Ctrl, "Z33_Q427256Event", Player, FlagID, NpcID1, NpcID2, NpcID3 )
		else
			CallPlot( Ctrl, "Z33_SideQuestEvent", FlagID, NpcID1, NpcID2, NpcID3 )
		end
	else
		ScriptMessage( Ctrl, Player, 1, "[Z33_QUEST_EVENT_ALREADY_RUN]", 0 )
		ScriptMessage( Ctrl, Player, 0, "[Z33_QUEST_EVENT_ALREADY_RUN]", C_Red )
	end
	return
end
Function Z33_SideQuestEvent( FlagID, NpcID1, NpcID2, NpcID3 )
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, false )
	local Ctrl = OwnerID()
	local EventCurrentStatus = nil
	local CurrentPhase = 0
	local KeyItem = 0
	local QuestBuff = 502631
	local CurrentBuffLv = nil
	local RequireBuffLv = 5
	local RangePlayers = {}
	local SearchRange = 500
	local Npc = {}
	local RequireQuest = {}
	if FlagID == 781437 then
		RequireQuest = { 427270, 427299, 427309 }
	elseif FlagID == 781438 then
		RequireQuest = { 427279, 427318, 427326 }
	else
		RequireQuest = { 427256, 427287, 427334, 427343 }
	end
	Sleep( 20 )
	SetModeEx( Ctrl, EM_SetModeType_ShowRoleHead, true )
	RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
	for k = 0, #RangePlayers, 1 do
		if RangePlayers[ k ] ~= nil and CheckID( RangePlayers[ k ] ) == true then
			ScriptMessage( RangePlayers[ k ], RangePlayers[ k ], 0, "[Z33_QUEST_EVENT_BEGIN]", 0 )
			ScriptMessage( RangePlayers[ k ], RangePlayers[ k ], 2, "[Z33_QUEST_EVENT_BEGIN]", C_LightGreen )
		end
	end
	Sleep( 35 )
	RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
	for m = 0, #RangePlayers, 1 do
		if RangePlayers[ m ] ~= nil and CheckID( RangePlayers[ m ] ) == true then
			ScriptMessage( RangePlayers[ m ], RangePlayers[ m ], 0, "[Z33_QUEST_EVENT_NOTE_1]", 0 )
			ScriptMessage( RangePlayers[ m ], RangePlayers[ m ], 2, "[Z33_QUEST_EVENT_NOTE_1]", C_LightGreen )
		end
	end
	while 1 do
		CurrentPhase = CurrentPhase + 1--檢查當前階段
		if CurrentPhase >= 7 then
			Sleep( 20 )
			RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
			for r = 0, #RangePlayers, 1 do
				if RangePlayers[ r ] ~= nil and CheckID( RangePlayers[ r ] ) == true then
					ScriptMessage( RangePlayers[ r ], RangePlayers[ r ], 0, "[Z33_QUEST_EVENT_END]", 0 )
					ScriptMessage( RangePlayers[ r ], RangePlayers[ r ], 2, "[Z33_QUEST_EVENT_END]", C_LightGreen )
				end
			end
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
			return
		end
		Npc = Z33_CreateEventNpc( FlagID, NpcID1, NpcID2, NpcID3, CurrentPhase )--從10個旗標當中隨機取8個旗標來生怪
		EventCurrentStatus = false--每2秒檢查當事件的進度
		while 1 do
			EventCurrentStatus = Z33_CheckEventStatus( Npc, RequireQuest, QuestBuff )
			if EventCurrentStatus == true then
				break
			end
			Sleep( 20 )
		end
		if FlagID == 781437 then KeyItem = 103776
		elseif FlagID == 781438 then KeyItem = 103777
		else KeyItem = 103778
		end
		if ( CurrentPhase == 2 or CurrentPhase == 4 or CurrentPhase == 6 ) then
			RangePlayers = {}--發送給周圍接獲任務的玩家當前階段的完成條件
			RangePlayers = SearchRangePlayer( Ctrl, SearchRange )
			for i = 0, #RangePlayers, 1 do
				if ( RangePlayers[ i ] ~= nil and CheckID( RangePlayers[ i ] ) == true ) then
					if CurrentPhase == 2 then
						ScriptMessage( RangePlayers[ i ], RangePlayers[ i ], 0, "[Z33_QUEST_EVENT_NOTE_2]", 0 )
						ScriptMessage( RangePlayers[ i ], RangePlayers[ i ], 1, "[Z33_QUEST_EVENT_NOTE_2]", C_LightGreen )
					elseif CurrentPhase == 4 then
						ScriptMessage( RangePlayers[ i ], RangePlayers[ i ], 0, "[Z33_QUEST_EVENT_NOTE_3]", 0 )
						ScriptMessage( RangePlayers[ i ], RangePlayers[ i ], 1, "[Z33_QUEST_EVENT_NOTE_3]", C_LightGreen )
					end
					for s = 1, #RequireQuest, 1 do
						if ( CheckAcceptQuest( RangePlayers[ i ], RequireQuest[ s ] ) == true and
						CheckBuff( RangePlayers[ i ], QuestBuff ) == true ) then
							CurrentBuffLv = KS_CheckBuffLv( RangePlayers[ i ], QuestBuff )
							if CurrentBuffLv >= RequireBuffLv then
								DW_QietKillOne( RangePlayers[ i ], KeyItem )
								CancelBuff( RangePlayers[ i ], QuestBuff )
							end
						end
					end
				end
			end
		end
		Sleep( 10 )
	end
end
function Z33_CreateEventNpc( FlagID, NpcID1, NpcID2, NpcID3, CurrentPhase )
	local Ctrl = OwnerID()
	local FlagPosIndex = {}
	local CurrentIndexSum = 0
	local x, y, z, dir = nil
	local Npc = nil
	local NpcID = {}
	local NpcAmount = CurrentPhase + 2
	local StopMove = 623132
	while 1 do
		RandNum = DW_Rand( 10 )
		CurrentIndexSum = #FlagPosIndex
		if CurrentIndexSum >= 9 then
			break
		else
			if CurrentIndexSum == 0 then
				FlagPosIndex[ 1 ] = RandNum
			else
				for i = 1, CurrentIndexSum, 1 do
					if RandNum == FlagPosIndex[ i ] then
						RandNum = 0
						break
					end
				end
				if RandNum ~= 0 then
					CurrentIndexSum = CurrentIndexSum+1
					table.insert( FlagPosIndex, CurrentIndexSum, RandNum )
				end
			end
		end
	end
	Npc = {}
	if ( CurrentPhase == 1 or CurrentPhase == 2 ) then NpcID[ 1 ], NpcID[ 2 ] = NpcID1, NpcID1
	elseif ( CurrentPhase == 3 or CurrentPhase == 4 ) then NpcID[ 1 ], NpcID[ 2 ] = NpcID1, NpcID2
	else NpcID[ 1 ], NpcID[ 2 ] = NpcID2, NpcID3
	end
	if NpcAmount >= 7 then
		NpcAmount = 6
	end
	for j = 1, NpcAmount, 1 do
		x, y, z, dir = DW_Location( FlagID, FlagPosIndex[ j ] )
		RandNum = DW_Rand( 2 )
		Npc[ j ] = CreateObj( NpcID[ RandNum ], x, y, z, dir, 1 )
		MoveToFlagEnabled( Npc[ j ], false )
		AddToPartition( Npc[ j ], 0 )
		WriteRoleValue( Npc[ j ], EM_RoleValue_Register1, Ctrl )
		AddBuff( Npc[ j ], 502862, 0, -1 )
		AddBuff( Npc[ j ], StopMove, 0, 3 )
	end
	NpcAmount = #Npc
	if ( FlagID == 781439 and CurrentPhase == 6 ) then--第三區增加一隻任務王
		x, y, z, dir = DW_Location( FlagID, 11 )
		QuestBoss = CreateObj( 109056, x, y, z, dir, 1 )
		MoveToFlagEnabled( QuestBoss, false )
		AddToPartition( QuestBoss, 0 )
		WriteRoleValue( QuestBoss, EM_RoleValue_Register1, Ctrl )
		WriteRoleValue( Ctrl, EM_RoleValue_Register3, QuestBoss )
		AddBuff( QuestBoss, 502862, 0, -1 )
		AddBuff( QuestBoss, StopMove, 0, 3 )
		NpcAmount = NpcAmount + 1
		Npc[ NpcAmount ] = QuestBoss
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, NpcAmount )
	return Npc
end
Function Z33_CheckEventStatus( Npc, RequireQuest, QuestBuff )
	local Ctrl = OwnerID()
	local CurrentNpcCounter = 0
	local GetBuffPlayer = 0
	local HateListSum = 0
	local CombatRange = 500
	local SearchRange = 350
	local AttackTarget = nil
	CurrentNpcCounter = ReadRoleValue( Ctrl, EM_RoleValue_Register2 )
	if ( CurrentNpcCounter == nil or CurrentNpcCounter <= 0 ) then
		WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
		return true
	end
	for i = 1, #Npc, 1 do
		if CheckDistance( Npc[ i ], Ctrl, CombatRange ) == false then
			SetStopAttack( Npc[ i ] )
		end
		HateListSum = HateListCount( Npc[ i ] )
		if ( HateListSum ~= nil and HateListSum ~= 0 ) then
			for j = 0, HateListSum, 1 do
				GetBuffPlayer = HateListInfo( Npc[ i ], j, EM_HateListInfoType_GItemID )
				if ( GetBuffPlayer ~= nil and CheckID( GetBuffPlayer ) == true ) then
					for r = 1, #RequireQuest, 1 do
						if CheckAcceptQuest( GetBuffPlayer, RequireQuest[ r ] ) == true then
							AddBuff( GetBuffPlayer, QuestBuff, 0, -1 )
						end
					end
				end
			end
		end
	end
	return false
end
function Z33_EventNpcOnDead()
	local Npc = OwnerID()
	local Ctrl = ReadRoleValue( Npc, EM_RoleValue_Register1 )
	local CurrentNpcCounter = ReadRoleValue( Ctrl, EM_RoleValue_Register2 )
	CurrentNpcCounter = CurrentNpcCounter-1
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, CurrentNpcCounter )
	return true
end
function Z33_Npc123950()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--事件開關
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )--事件怪物計數
end
function Z33_Npc123950SK()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = {427279}
	for i = 1, #RequireQuest, 1 do
		if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
			AddSpeakOption( Player, Ctrl, "[Z33_QUEST_EVENT_OPTION]", "Z33_EventQuestNpcSK", 0 )
		end
	end
	LoadquestOption( Player )
end
function Z33_Npc123952()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--事件開關
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )--事件怪物計數
end
function Z33_Npc123952SK()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = {427270}
	for i = 1, #RequireQuest, 1 do
		if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
			AddSpeakOption( Player, Ctrl, "[Z33_QUEST_EVENT_OPTION]", "Z33_EventQuestNpcSK", 0 )
		end
	end
	LoadquestOption( Player )
end
function Z33_EventQuestNpcSK()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest ={}
	local QuestArea1 = { 427270, 427299, 427309 }
	local QuestArea2 = { 427279, 427318, 427326 }
	local QuestArea3 = { 427256, 427287, 427334, 427343 }
	local FlagID, NpcID1, NpcID2, NpcID3 = nil
	if ReadRoleValue( Ctrl, EM_RoleValue_OrgID ) == 123952 then
		RequireQuest = QuestArea1
		FlagID, NpcID1, NpcID2, NpcID3 = 781437, 108706, 108845, 108852
	elseif ReadRoleValue( Ctrl, EM_RoleValue_OrgID ) == 123950 then
		RequireQuest = QuestArea2
		FlagID, NpcID1, NpcID2, NpcID3 = 781438, 109044, 109047, 109048
	else	RequireQuest = QuestArea3
		FlagID, NpcID1, NpcID2, NpcID3 = 781439, 109051, 109052, 109054
	end
	for i = 1, #RequireQuest, 1 do
		if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
			if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
				ScriptMessage( Player, Player, 1, "[Z33_QUEST_EVENT_ALREADY_RUN]", 0 )
				ScriptMessage( Player, Player, 0, "[Z33_QUEST_EVENT_ALREADY_RUN]", C_Red )
			else	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
				if ( RequireQuest == QuestArea1 or RequireQuest == QuestArea2 ) then
					CallPlot( Ctrl, "Z33_SideQuestEvent", FlagID, NpcID1, NpcID2, NpcID3 )
				else
					CallPlot( Ctrl, "Z33_Q427256Event", Player, FlagID, NpcID1, NpcID2, NpcID3 )
				end
			end
		end
	end
	CloseSpeak( Player )
	return
end