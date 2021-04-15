function Z33_Npc123993()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Pickup )
	SetPlot( Ctrl, "touch", "Z33_Npc123993TouchCheck", 20 )
end
function Z33_Npc123993TouchCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local StopMove = 623132
	local QuestStatus = false
	local RequireQuest = { 427292, 427339, 427348 }
	local QuestItem = 205023
	local CastStr = "[SC_Q427292_1]"--釣魚
	local MsgStr1 = "[SC_Q427292_2]"--無法使用！你沒有取得相關任務！
	local MsgStr2 = "[SC_Q427292_5]"--你無法取得更多的【[205023]】！
	local MsgStr3 = "[SC_Q427292_6]"--目標忙碌中！暫時無法使用！
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				QuestStatus = true
			end
		end
	end
	if QuestStatus == false then
		ScriptMessage( Player, Player, 0, MsgStr1, 0 )
		ScriptMessage( Player, Player, 1, MsgStr1, 0 )
		return
	end
	if CountBodyItem( Player, QuestItem ) >= 10 then
		ScriptMessage( Player, Player, 0, MsgStr2, 0 )
		ScriptMessage( Player, Player, 1, MsgStr2, 0 )
		return
	end
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Player, Player, 0, MsgStr3, 0 )
		ScriptMessage( Player, Player, 1, MsgStr3, 0 )
		return
	end
	AddBuff( Player, StopMove, 0, 4 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 45, ruFUSION_ACTORSTATE_FISHING_CAST, ruFUSION_ACTORSTATE_FISHING_REEL, 0, "Z33_NPC123993TouchEnd" )
end
function Z33_Npc123993TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	local RequireQuest = { 427292, 427339, 427348 }
	local QuestItem = 205023
	local MsgStr = "[SC_Q427292_3]"--你似乎什麼也沒有釣到......
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Pickup )
	EndCastBar( Player, CheckStatus )
	if ( CheckStatus <= 0 or Player == nil or CheckID( Player ) == false ) then
		return
	end
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and
			CountBodyItem( Player, QuestItem ) <= 10 ) then
				GiveBodyItem( Player, QuestItem, 1 )
				return
			end
		end
	end
	ScriptMessage( Player, Player, 0, MsgStr, 0 )
	ScriptMessage( Player, Player, 1, MsgStr, 0 )
	return
end
function Z33_Npc123995()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Enhance )
	SetPlot( Ctrl, "touch", "Z33_Npc123995TouchCheck", 20 )
end
function Z33_Npc123995TouchCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local SuccessItem = 204921
	local QuestStatus = false
	local RequireQuest = { 427292, 427339, 427348 }
	local RequireItem = { 205021, 205022, 205023 }
	local CastStr = "[SC_Q427292_11]"--煉藥
	local MsgStr1 = "[SC_Q427292_2]"--無法使用！你沒有取得相關任務！
	local MsgStr2 = "[SC_Q427292_6]"--目標忙碌中！暫時無法使用！
	local MsgStr3 = "[SC_Q427292_7]"--準備的材料不足！無法使用！
	local MsgStr4 = "[SC_Q427292_12]"--你已經取得足夠的【[204921]】！
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				QuestStatus = true
			end
		end
	end
	if QuestStatus == false then
		ScriptMessage( Player, Player, 0, MsgStr1, 0 )
		ScriptMessage( Player, Player, 1, MsgStr1, 0 )
		return
	end
	if CountBodyItem( Player, SuccessItem ) >= 1 then
		ScriptMessage( Player, Player, 0, MsgStr4, 0 )
		ScriptMessage( Player, Player, 1, MsgStr4, 0 )
		return
	end
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Player, Player, 0, MsgStr2, 0 )
		ScriptMessage( Player, Player, 1, MsgStr2, 0 )
		return
	end
	for j = 0, #RequireItem, 1 do
		if ( RequireItem[ j ] ~= nil and RequireItem[ j ] > 0 ) then
			if CountBodyItem( Player, RequireItem[ j ] ) == 0 then
				ScriptMessage( Player, Player, 0, MsgStr3, 0 )
				ScriptMessage( Player, Player, 1, MsgStr3, 0 )
				return
			end
		end
	end
	for k = 0, #RequireItem, 1 do
		if ( RequireItem[ k ] ~= nil and RequireItem[ k ] > 0 ) then
			DelBodyItem( Player, RequireItem[ k ], 1 )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	SetPlot( Ctrl, "touch", "", 0 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 100, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_NPC123995TouchEnd" )
	BeginPlot( Player, "Z33_Q427292AlchemyCounter", 0 )
end
function Z33_Npc123995TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Enhance )
	SetPlot( Ctrl, "touch", "Z33_Npc123995TouchCheck", 20 )
	EndCastBar( Player, CheckStatus )
	return
end
function Z33_Q427292AlchemyCounter()
	local Player = OwnerID()
	local QuestStatus = false
	local RequireQuest = { 427292, 427339, 427348 }
	local QuestBuff = 502633
	local BuffLv = 0
	local SuccessItem = 204921
	local FailureItem = 204923
	local MsgStr1 = "[SC_Q427292_8]"--煉製成功！你取得了【[204921]】！
	local MsgStr2 = "[SC_Q427292_9]"--煉製失敗！你取得了【[204923]】！
	local MsgStr3 = "[SC_Q427292_10]"--使用失敗！你沒有取得相關任務！
	AddBuff( Player, QuestBuff, 0, -1 )
	while true do
		Sleep( 10 )
		if ( CheckBuff( Player, QuestBuff ) == false or BuffLv >= 10 ) then
			break
		end
		AddBuff( Player, QuestBuff, 0, -1 )
		BuffLv = BuffLv + 1
	end
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				QuestStatus = true
				break
			end
		end
	end
	if QuestStatus == true then
		if ( BuffLv >= 3 and BuffLv <= 5 ) then
			GiveBodyItem( Player, SuccessItem, 1 )
			ScriptMessage( Player, Player, 0, MsgStr1, 0 )
			ScriptMessage( Player, Player, 2, MsgStr1, 0 )
		else
			GiveBodyItem( Player, FailureItem, 1 )
			ScriptMessage( Player, Player, 0, MsgStr2, 0 )
			ScriptMessage( Player, Player, 1, MsgStr2, C_SYSTEM )
		end
	else
		ScriptMessage( Player, Player, 0, MsgStr3, 0 )
		ScriptMessage( Player, Player, 1, MsgStr3, 0 )
	end
end
function Z33_Q427294TouchEnd()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local QuestStatus = false
	local RequireQuest = { 427294 }
	local QuestItem = 205020
	local MsgStr = "[SC_Q427294_2]"--你似乎不需要其它資料！
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				QuestStatus = true
			end
		end
	end
	if QuestStatus == true then
		if CountBodyItem( Player, QuestItem ) == 0 then
			DelFromPartition( Ctrl )
			CallPlot( Ctrl, "Z33_Q427294TouchEvent", Player )
			return true
		else
			ScriptMessage( Player, Player, 0, MsgStr, 0 )
			ScriptMessage( Player, Player, 1, MsgStr, 0 )
		end
	end
	return false
end
function Z33_Q427294TouchEvent( Player )
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local MonsterID = 109038
	local Monster = nil
	local SecureRange = 300
	local MsgStr = "[SC_Q427294_1]"--小心！書堆似乎被施放了防護魔咒！
	Sleep( 10 )
	if ( Player == nil or CheckID( Player ) ~= true ) then
		return
	end
	ScriptMessage( Player, Player, 0, MsgStr, 0 )
	ScriptMessage( Player, Player, 2, MsgStr, 0 )
	Monster = CreateObj( MonsterID, x, y, z, dir, 1 )
	SetModeEx( Monster, EM_SetModeType_Searchenemy, false )
	SetModeEx( Monster, EM_SetModeType_Strikback, false )
	SetModeEx( Monster, EM_SetModeType_Fight, false )
	MoveToFlagEnabled( Monster, false )
	Sleep( 10 ) AddToPartition( Monster, 0 )
	if ( Player ~= nil and CheckID( Player ) == true ) then
		AdjustFaceDir( Monster, Player, 0 )
		Sleep( 5 ) 
	end
	PlayMotion( Monster, ruFUSION_ACTORSTATE_BUFF_INSTANT )
	SetModeEx( Monster, EM_SetModeType_Fight, true )
	SetModeEx( Monster, EM_SetModeType_Searchenemy, true )
	SetModeEx( Monster, EM_SetModeType_Strikback, true )
	while true do
		Sleep( 20 )
		StopMove( Monster, true )
		if ( Player == nil or Monster == nil or CheckID( Player ) == false or CheckID( Monster ) == false ) then
			break
		elseif ReadRoleValue( Monster, EM_RoleValue_IsDead ) == 1 then
			Sleep( 120 )
			DelObj( Monster )
			break	
		end 
		if ( CheckDistance( Ctrl, Monster, SecureRange ) == false or
		ReadRoleValue( Monster, EM_RoleValue_AttackTargetID ) == 0 ) then
			SetModeEx( Monster, EM_SetModeType_Searchenemy, false )
			SetModeEx( Monster, EM_SetModeType_Strikback, false )
			SetModeEx( Monster, EM_SetModeType_Fight, false )
			ClearHateList( Monster, -1 )
			Sleep( 10 ) PlayMotion( Monster, ruFUSION_ACTORSTATE_BUFF_INSTANT )
			Sleep( 30 ) DelObj( Monster )
			break
		end
		StopMove( Monster, false )
		SetAttack( Monster, Player )
	end
	Sleep( 30 ) 
	AddToPartition( Ctrl, 0 )
	return
end
function Z33_Npc123971()
	local Ctrl = OwnerID()
	local RuneIDList = { 124012, 124013, 124014, 124015, 124016 }
	local RuneAmount = #RuneIDList
	local Poly = math.ceil( 360/RuneAmount )
	local Radius = 50
	local Angle = 0
	local CurrentX, CurrentY, CurrentZ = nil
	local baseX, baseY, baseZ = nil
	baseX = ReadRoleValue( Ctrl, EM_RoleValue_X )
	baseY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	baseZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local ValidID = nil
	local RunStone = {}
	local RuneIndex = 0
	local RegisterNum = 0
	local CircleID = 124018
	local Circle = nil
	local RangeObj = nil
	local SearchingRange = 100
	RangeObj = SearchRangeNPC( Ctrl, SearchingRange )
	if ( RangeObj ~= nil and #RangeObj ~= 0 ) then
		for i = 0, #RangeObj, 1 do
			if ( RangeObj[ i ] ~= nil and RangeObj[ i ] ~= 0 ) then
				if ReadRoleValue( RangeObj[ i ], EM_RoleValue_OrgID ) == CircleID then
					DelObj( RangeObj[ i ] )
				end
				for j = 0, RuneAmount, 1 do
					if ( RuneIDList[ j ] ~= nil and RuneIDList[ j ] ~= 0 and
					ReadRoleValue( RangeObj[ i ], EM_RoleValue_OrgID ) == RuneIDList[ j ] ) then
						DelObj( RangeObj[ i ] )
					end
				end
			end
		end
	end
	Circle = CreateObj( CircleID, baseX, baseY, baseZ, 0, 1 )
	SetModeEx( Circle, EM_SetModeType_Mark, false )
	SetModeEx( Circle, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( Circle, false )
	AddToPartition( Circle, 0 )
	for RegisterNum = 1, RuneAmount+1, 1 do
		WriteRoleValue( Ctrl, EM_RoleValue_Register+RegisterNum, 0 )
	end
	for k = 0, RuneAmount, 1 do
		if ( RuneIDList[ k ] ~= nil and RuneIDList[ k ] ~= 0 ) then
			ValidID = RuneIDList[ k ]
			Angle = Angle+Poly
			RuneIndex = RuneIndex + 1
			RegisterNum = RuneIndex + 1
			CurrentX = baseX+radius*math.cos( Angle*math.pi/180 )
			CurrentY = baseY
			CurrentZ = baseZ+radius*math.sin( Angle*math.pi/180 )
			RunStone[ RuneIndex ] = CreateObj( ValidID, CurrentX, CurrentY, CurrentZ, 0, 1 )
			MoveToFlagEnabled( RunStone[ RuneIndex ], false )
			AddToPartition( RunStone[ RuneIndex ], 0 )
			WriteRoleValue( Ctrl, EM_RoleValue_Register+RegisterNum, RunStone[ RuneIndex ] )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, RuneAmount )
end
function Z33_Npc123971SK()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequireQuest = { 427293, 427340, 427349 }
	local KeyItem = 544061
	local OptionStr = "[SC_Q427293_1]"--來！讓我們開始吧！
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] ~= 0 ) then
			if ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and
			CheckFlag( Player, KeyItem ) == false ) then
				AddSpeakOption( Player, Ctrl, OptionStr, "Z33_Q427293EventCheck", 0 )
			end
		end
	end
	LoadquestOption( Player )
end
function Z33_Q427293EventCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RangePlayer = nil
	local SearchingRange = 250
	local QuestStatus = false
	local KeyItem = 544061
	local RequireQuest = { 427293, 427340, 427349 }
	local BeginMsg = "[Z33_QUEST_EVENT_BEGIN]"
	local BusyMsg = "[SC_Q427293_2]"
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] ~= 0 ) then
			if ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and
			CheckFlag( Player, KeyItem ) == false ) then
				QuestStatus = true
			end
		end
	end
	if QuestStatus == true then
		if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) ~= 1 then
			RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
			if ( RangePlayer ~= nil and #RangePlayer ~= 0 ) then
				for j = 0, #RangePlayer, 1 do
					if RangePlayer[ j ] ~= nil and CheckID( RangePlayer[ j ] ) == true then
						ScriptMessage( Ctrl, RangePlayer[ j ], 0, BeginMsg, 0 )
						ScriptMessage( Ctrl, RangePlayer[ j ], 2, BeginMsg, 0 )
					end
				end
			end
			CallPlot( Ctrl, "Z33_Q427293OnEvent", Player )		
		else
			ScriptMessage( Player, Player, 0, BusyMsg, 0 )
			ScriptMessage( Player, Player, 1, BusyMsg, 0 )
		end
	end
	CloseSpeak( Player )
end
function Z33_Q427293OnEvent( Player )
	local Ctrl = OwnerID()
	local MainPlayer = Player--開啟這次事件的玩家
	local PartyPlayer = {}--參與這次事件的其他玩家
	local RangePlayer = {}
	local SecureRange = 250
	local CurrentIndex = 1
	local RespondCounter = 0 
	local RuneAmount = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	local RegisterNum = 0
	local RuneStone = {}
	local QuestionAmount = 0
	local RequireQuest = { 427293, 427340, 427349 }
	local QuestStatus = false
	local SuccessBuff = 502634
	local KeyItem = 544061
	local BuffLv = nil
	local RequireLv = 6
	local MagicFx = 490871
	local BuffFx = 621848
	local RandNum = nil
	local EndMsg = "[SC_Q427293_4]"
	local StopMsg = "[SC_Q427293_11]"
	local FailureMsg = "[SC_Q427293_12]"
	local QuestionMsg = "[SC_Q427293_5]"
	local RuneStr = {}
	RuneStr[ 1 ] = "[SC_Q427293_6]"
	RuneStr[ 2 ] = "[SC_Q427293_7]"
	RuneStr[ 3 ] = "[SC_Q427293_8]"
	RuneStr[ 4 ] = "[SC_Q427293_9]"
	RuneStr[ 5 ] = "[SC_Q427293_10]"
	PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CAST_BEGIN )
	AddBuff( Ctrl, BuffFx, 0, -1 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	for i = 1, RuneAmount, 1 do
		RegisterNum = i + 1
		RuneStone[ i ] = ReadRoleValue( Ctrl, EM_RoleValue_Register+RegisterNum )
	end
	Sleep( 30 )
	while true do
		QuestStatus = false
		CurrentIndex = 1
		PartyPlayer = {}
		RangePlayer = SearchRangePlayer( Ctrl, SecureRange )
		if ( RangePlayer ~= nil and #RangePlayer ~= 0 ) then
			for i = 0, #RangePlayer, 1 do
				if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) then
					for j = 0, #RequireQuest, 1 do
						if ( RequireQuest[ j ] ~= nil and RequireQuest[ j ] ~= 0 ) then
							if CheckAcceptQuest( RangePlayer[ i ], RequireQuest[ j ] ) == true then
								PartyPlayer[ CurrentIndex ] = RangePlayer[ i ]
								CurrentIndex = CurrentIndex + 1
							end
						end
					end
				end
			end
		end
		if ( MainPlayer ~= nil and CheckID( MainPlayer ) == true and CheckDistance( MainPlayer, Ctrl, SecureRange ) == true ) then
			for k = 0, #RequireQuest, 1 do
				if ( RequireQuest[ k ] ~= nil and RequireQuest[ k ] ~= 0 ) then
					if CheckAcceptQuest( MainPlayer, RequireQuest[ k ] ) == true then
						QuestStatus = true
					end
				end
			end
		end
		if QuestStatus == false then
			if CheckID( MainPlayer ) == true then
				ScriptMessage( MainPlayer, MainPlayer, 0, StopMsg, 0 )
				ScriptMessage( MainPlayer, MainPlayer, 1, StopMsg, 0 )
				if CheckBuff( MainPlayer, SuccessBuff ) == true then
					CancelBuff( MainPlayer, SuccessBuff )
				end
			end
			break
		end
		RespondCounter = RespondCounter + 1
		if RespondCounter == 1 then	
			RandNum = DW_Rand( RuneAmount )
			for m = 1, #PartyPlayer, 1 do
				ScriptMessage( PartyPlayer[ m ], PartyPlayer[ m ], 0, QuestionMsg..RuneStr[ RandNum ], 0 )
				ScriptMessage( PartyPlayer[ m ], PartyPlayer[ m ], 2, QuestionMsg..RuneStr[ RandNum ], 0 )
			end
			SetPlot( RuneStone[ RandNum ], "touch", "Z33_Q427293OnTouch", 20 )
		end
		if RespondCounter == 3 then
			SetPlot( RuneStone[ RandNum ], "touch", "", 0 )
			WriteRoleValue( RuneStone[ RandNum ], EM_RoleValue_Register, 0 )
			WriteRoleValue( RuneStone[ RandNum ], EM_RoleValue_Register1, 0 )
			WriteRoleValue( RuneStone[ RandNum ], EM_RoleValue_Register2, 0 )
			WriteRoleValue( RuneStone[ RandNum ], EM_RoleValue_Register3, 0 )
			RespondCounter = 0
			QuestionAmount = QuestionAmount + 1
		end
		if QuestionAmount >= 6 then
			break
		end
		Sleep( 20 )
	end
	CastSpell( Ctrl, Ctrl, MagicFx )
	PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CAST_END )
	CancelBuff( Ctrl, BuffFx )
	for p = 1, RuneAmount, 1 do
		SetPlot( RuneStone[ p ], "touch", "", 0 )
		CastSpell( RuneStone[ p ], RuneStone[ p ], MagicFx )
	end
	Sleep( 30 )	
	if QuestStatus == false then
		for r = 1, #PartyPlayer, 1 do
			if ( PartyPlayer[ r ] ~= nil and CheckID( PartyPlayer[ r ] ) == true ) then
				ScriptMessage( PartyPlayer[ r ], PartyPlayer[ r ], 0, StopMsg, 0 )
				ScriptMessage( PartyPlayer[ r ], PartyPlayer[ r ], 1, StopMsg, 0 )
				if CheckBuff( PartyPlayer[ r ], SuccessBuff ) == true then
					CancelBuff( PartyPlayer[ r ], SuccessBuff )
				end
			end
		end
	else
		for y = 1, #PartyPlayer, 1 do
			if ( PartyPlayer[ y ] ~= nil and CheckID( PartyPlayer[ y ] ) == true ) then
				if CheckBuff( PartyPlayer[ y ], SuccessBuff ) == true then
					BuffLv = KS_CheckBuffLV( PartyPlayer[ y ], SuccessBuff )
					if BuffLv >= RequireLv then
						SetFlag( PartyPlayer[ y ], KeyItem, 1 )
					else
						ScriptMessage( PartyPlayer[ y ], PartyPlayer[ y ], 0, FailureMsg, 0 )
						ScriptMessage( PartyPlayer[ y ], PartyPlayer[ y ], 2, FailureMsg, 0 )
					end
					CancelBuff( PartyPlayer[ y ], SuccessBuff )
				else
					ScriptMessage( PartyPlayer[ y ], PartyPlayer[ y ], 0, FailureMsg, 0 )
					ScriptMessage( PartyPlayer[ y ], PartyPlayer[ y ], 2, FailureMsg, 0 )
				end
			end
		end
	end
	Sleep( 40 )
	PartyPlayer = {}
	RangePlayer = SearchRangePlayer( Ctrl, SecureRange )
	if ( RangePlayer ~= nil and #RangePlayer ~= 0 ) then
		for x = 0, #RangePlayer, 1 do
			if ( RangePlayer[ x ] ~= nil and CheckID( RangePlayer[ x ] ) == true ) then
				ScriptMessage( RangePlayer[ x ], RangePlayer[ x ], 0, EndMsg, 0 )
				ScriptMessage( RangePlayer[ x ], RangePlayer[ x ], 2, EndMsg, 0 )
			end
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, RuneAmount )
end
function Z33_Q427293OnTouch()
	local Player = OwnerID()
	local Rune = TargetID()
	local RequireQuest = { 427293, 427340, 427349 }
	local QuestStatus = false
	local RegisterAmount = 3
	local SuccessBuff = 502634
	local MagicFx = 490871
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] ~= 0 ) then
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				QuestStatus = true
			end
		end
	end
	if QuestStatus == false then
		return
	end
	for j = 1, RegisterAmount, 1 do
		if ReadRoleValue( Rune, EM_RoleValue_Register+j ) == Player then
			return
		end
	end
	for k = 1, RegisterAmount, 1 do
		if ReadRoleValue( Rune, EM_RoleValue_Register+k ) == 0 then
			WriteRoleValue( Rune, EM_RoleValue_Register+k, Player )
			AddBuff( Player, SuccessBuff, 0, -1 )
			CastSpell( Rune, Rune, MagicFx )
			return
		end
	end
	return
end