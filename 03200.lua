function Z33_Npc123985MoveAI()
	local Ctrl = OwnerID()
	local FlagID = 781443
	local FlagAmount = GetMoveFlagCount( FlagID )-1
	local CurrentFlagID = 1
	local TargetFlagID = 2
	local CurrentPosX, CurrentPosY, CurrentPosZ, CurrentPosDir = 0
	local TargetPosX, TargetPosY, TargetPosZ, TargetPosDir = 0
	local NeedEscape = false
	local ArriveStatus = false
	local ArriveRange = 20
	local SearchingRange = 50
	local RangePlayer = nil
	local RangeNpc = nil
	local SelectTarget = nil
	local SpeakStr = "[SC_Q427284_3]"
	local RandSpeak = nil
	local RandMotion = nil
	while true do
		NeedEscape = false RangePlayer = {} RangeNpc = {}
		RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
		RangeNpc = SearchRangeNpc( Ctrl, SearchingRange )
		if ( RangePlayer ~= nil and #RangePlayer >= 1 ) or ( RangeNpc ~= nil and #RangeNpc >= 2 ) then
			NeedEscape = true
		end
		if NeedEscape == true then
			WriteRoleValue( Ctrl, EM_RoleValue_IsWalk, 0 )
			SelectTarget = DW_Rand( 4 )
			if SelectTarget == 1 then
				TargetFlagID = CurrentFlagID - 1
			else	TargetFlagID = CurrentFlagID + 1
			end
			RandSpeak = DW_Rand( 3 )
			if RandSpeak == 1 then
				NpcSay( Ctrl, SpeakStr )
			end
		else	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk, 1 )
			if ArriveStatus == true then
				TargetFlagID = CurrentFlagID + 1
			end
			RandSpeak = DW_Rand( 5 )
			if RandSpeak == 1 then
				NpcSay( Ctrl, SpeakStr )
			end
			RandMotion = DW_Rand( 10 )
			if RandMotion == 1 then
				StopMove( Ctrl, true )
				Sleep( 10 )
				PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_IDLE )
				Sleep( 30 )
				StopMove( Ctrl, false )
			end
		end
		if ( TargetFlagID <= 0 or TargetFlagID > FlagAmount ) then
			TargetFlagID = 1
		end
		CurrentPosX = ReadRoleValue( Ctrl, EM_RoleValue_X )
		CurrentPosY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
		CurrentPosZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
		TargetPosX = GetMoveFlagValue( FlagID, TargetFlagID, EM_RoleValue_X )
		TargetPosY = GetMoveFlagValue( FlagID, TargetFlagID, EM_RoleValue_Y )
		TargetPosZ = GetMoveFlagValue( FlagID, TargetFlagID, EM_RoleValue_Z )
		if ( math.abs( CurrentPosX - TargetPosX ) <= ArriveRange and math.abs( CurrentPosY - TargetPosY ) <= ArriveRange and
		math.abs( CurrentPosZ - TargetPosZ ) <= ArriveRange ) then
			ArriveStatus = true
			CurrentFlagID = TargetFlagID
		else
			ArriveStatus = false
			Move( Ctrl, TargetPosX, TargetPosY, TargetPosZ )
		end
		Sleep( 10 )
	end
end
function Z33_Npc123969sk()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = { 427285, 427324, 427332 }
	local KeyItem = 543808
	local QuestBuffID = 502628
	local OptionStr = "[SC_Q427285_1]"--沒問題！放心交給我吧！
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and
			CheckFlag( Player, KeyItem ) == false and
			CheckBuff( Player, QuestBuffID ) == false ) then
				AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123969SK_2", 0 )
				break
			end
		end
	end
	LoadquestOption( Player )
end
function Z33_Npc123969SK_2()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = { 427285, 427324, 427332 }
	local QuestItem = 243246
	local KeyItem = 543808
	local QuestBuffID = 502628
	local BuffFinalLv = -1--最終層數-1代表完全消除
	local BuffTime = 120--時間總長
	local TweakFreq = 2--每2秒進行1次遞減
	local TweakLv = 1--每次遞減1層
	local MsgStr = "[SC_Q427285_2]"
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				ScriptMessage( Player, Player, 0, MsgStr, 0 )
				ScriptMessage( Player, Player, 1, MsgStr, C_SYSTEM )
				DelBodyItem( Player, QuestItem, 1 )
				GiveBodyItem( Player, QuestItem, 1 )
				AddBuff( Player, QuestBuffID, 59, -1 )
				Lua_703182_BuffTweak( Player, QuestBuffID, BuffFinalLv, BuffTime, TweakFreq, TweakLv )
				BeginPlot( Player, "Z33_Q427285OnAction", 0 )
				break
			end		
		end
	end
	CloseSpeak( Player )
end
function Z33_Q427285OnAction()
	local Player = OwnerID()
	local RequireQuestID = { 427285, 427324, 427332 }
	local QuestItemID = 243246
	local QuestBuffID = 502628
	local StopMove = 623132
	local CurrentX, CurrentY, CurrentZ = nil
	local CurrentArea = nil
	local DangerArea = { 310, 320, 324, 330, 340, 350 }
	local QuestStatus = false
	local QuestItemNum = 0
	local QuestBuffCheck = false
	local OnDanger = false
	local MonsterID = 108710
	local MonsterObj = nil
	local OnAttackMonster = nil
	local CreateFreq = 0
	while true do
		QuestStatus = false
		QuestItemNum = 0
		QuestBuffCheck = false
		OnDanger = false
		OnAttackMonster = nil
		for i = 0, #RequireQuestID, 1 do
			if RequireQuestID[ i ] ~= nil then
				if CheckAcceptQuest( Player, RequireQuestID[ i ] ) == true then
					QuestStatus = true
					break
				end
			end
		end
		QuestItemNum = CountBodyItem( Player, QuestItemID )
		QuestBuffCheck = CheckBuff( Player, QuestBuffID )
		if ( QuestStatus == false or QuestItemNum <= 0 or QuestBuffCheck == false ) then
			CancelBuff( Player, QuestBuffID )
			return
		end
		CurrentX = ReadRoleValue( Player, EM_RoleValue_X )
		CurrentY = ReadRoleValue( Player, EM_RoleValue_Y )
		CurrentZ = ReadRoleValue( Player, EM_RoleValue_Z )
		CurrentArea = FindMapID( CurrentX, CurrentY, CurrentZ )
		for j = 0, #DangerArea, 1 do
			if ( DangerArea[ j ] ~= nil and DangerArea[ j ] > 0 ) then
				if DangerArea[ j ] == CurrentArea then
					OnDanger = true
					break
				end
			end
		end
		if OnDanger == true then
			CreateFreq = CreateFreq + 1
			if CreateFreq >= 3 then
				CreateFreq = 0
				MonsterObj = Lua_CreateObjByDir( Player, MonsterID, 40, 0 )
				MoveToFlagEnabled( MonsterObj, false )
				AddToPartition( MonsterObj, 0 )
				CallPlot( MonsterObj, "Z33_Npc108710Behavior", Player )
			end
		else
			CreateFreq = 0
			for k = 0, HateListCount( Player ), 1 do
				OnAttackMonster = HateListInfo( Player, k, EM_HateListInfoType_GItemID )
				if ( OnAttackMonster ~= nil and CheckID( OnAttackMonster ) == true ) and
				ReadRoleValue( OnAttackMonster, EM_RoleValue_OrgID ) == MonsterID then
					AddBuff( OnAttackMonster, StopMove, 0, -1 )
					DelObj( OnAttackMonster )			
				end
			end
		end
		Sleep( 20 )
	end
end
function Z33_Npc108710Behavior( Player )
	local Ctrl = OwnerID()
	local QuestBuffID = 502628
	local StopMove = 623132
	local NoPoki = 544801
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP ), "Lua_424225_LockHP" )
	SetFlag( Ctrl, NoPoki, 1 )
	AddBuff( Ctrl, StopMove, 0, 2 )
	Sleep( 20 )
	LockHP( Ctrl, -1, "" )
	while true do
		if ( Player == nil or CheckID( Player ) ~= true ) or ReadRoleValue( Player, EM_RoleValue_IsDead ) == 1 then
			DelObj( Ctrl )
			return
		end
		if CheckBuff( Player, QuestBuffID ) == false then
			DelObj( Ctrl )
			return
		end
		if ReadRoleValue( Ctrl, EM_RoleValue_IsAttackMode ) == 0 then
			SetAttack( Ctrl, Player )
		end
		Sleep( 20 )
	end
end
function Z33_Npc123970SK()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = { 427285, 427324, 427332 }
	local KeyItem = 543808
	local OptionStr = "[SC_Q427285_3]"--這是你的葡萄酒
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if  ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and CheckFlag( Player, KeyItem ) == false ) then
				AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123970SK_1", 0 )
				break
			end
		end
	end
	LoadquestOption( Player )
end
function Z33_Npc123970SK_1()
	local Player = OwnerID()
	local Npc = TargetID()
	local RequireQuest = { 427285, 427324, 427332 }
	local KeyItem = 543808
	local QuestBuffID = 502628
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if  CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				if CountBodyItem( Player, 243246 ) >= 1 then
					if CheckBuff( Player, QuestBuffID ) == true then
						SetFlag( Player, KeyItem, 1 )
						DelBodyItem( Player, 243246, 1 )--冰釀葡萄酒
						CancelBuff( Player, QuestBuffID )
						LoadquestOption( Player )
						return
					else
						ScriptMessage( Player, Player, 0, "[SC_Q427285_4]", 0 )
						ScriptMessage( Player, Player, 1, "[SC_Q427285_4]", 0 )
						break
					end
				else
					ScriptMessage( Player, Player, 0, "[SC_Q427285_5]", 0 )
					ScriptMessage( Player, Player, 1, "[SC_Q427285_5]", 0 )
					break
				end
			end
		end
	end
	CloseSpeak( Player )
end
function Z33_Npc123986()
	local Ctrl = OwnerID()
	local FXObjID = 123987
	local RangeNpc = SearchRangeNPC( Ctrl, 40 )
	for i = 0, #RangeNpc, 1 do
		if ( RangeNpc[ i ] ~= nil and CheckID( RangeNpc[ i ] ) == true ) then
			if ReadRoleValue( RangeNpc[ i ], EM_RoleValue_OrgID ) == FXObjID then
				DelObj( RangeNpc[ i ] )
			end
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Enhance )
	SetPlot( Ctrl, "touch", "Z33_NPC123986TouchCheck", 20 )
end
function Z33_NPC123986TouchCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local CastStr = "[SC_Q427289_1]"--充能
	local MsgStr = "[SC_Q427289_2]"--無法進行充能！其他人正在為[123986]充能！
	local StopMove = 623132
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Ctrl, Player, 0, MsgStr, 0 )
		ScriptMessage( Ctrl, Player, 1, MsgStr, 0 )
		return
	end
	AddBuff( Player, StopMove, 0, 2 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	SetPlot( Ctrl, "touch", "", 0 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 10, ruFUSION_ACTORSTATE_USE, 0, 0, "Z33_NPC123986TouchEnd" )
end
function Z33_NPC123986TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	local QuestItem = 243248
	local KeyItem = 104101
	local MsgStr = "[SC_Q427289_3]"--充能失敗！你身上沒有[243248]！
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Enhance )
	SetPlot( Ctrl, "touch", "Z33_NPC123986TouchCheck", 20 )
	EndCastBar( Player, CheckStatus )
	if ( CheckStatus > 0 and Player ~= nil and CheckID( Player ) == true ) then
		if CountBodyItem( Player, QuestItem ) >= 1 then
			DW_QietKillOne( Player, KeyItem )
			DelBodyItem( Player, QuestItem, 1 )
			WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
			BeginPlot( Ctrl, "Z33_Q427289Event", 0 )
			return
		else
			ScriptMessage( Ctrl, Player, 0, MsgStr, 0 )
			ScriptMessage( Ctrl, Player, 1, MsgStr, 0 )
		end
	end
end
function Z33_Q427289Event()
	local Ctrl = OwnerID()
	local ReSetTime = 200 + ( DW_Rand( 10 )*10 )
	local x, y, z, dir = DW_Location( Ctrl )
	local FXObjID = 123987
	local FXObj = CreateObj( FXObjID, x, y+10, z, dir, 1 )
	SetModeEx( FXObj, EM_SetModeType_Mark, false )
	SetModeEx( FXObj, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( FXObjID, false )
	AddToPartition( FXObj, 0 )
	Sleep( ReSetTime )
	BeginPlot( Ctrl, "Z33_Npc123986", 0 )
end
function Z33_Npc123988()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_inspect )
	SetPlot( Ctrl, "touch", "Z33_Npc123988TouchCheck", 20 )
end
function Z33_Npc123988TouchCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local CastStr = "[SC_Q427290_1]"--檢視陷阱
	local MsgStr = "[SC_Q427290_2]"--無法進行檢視！其他人正在檢視這個陷阱！
	local StopMove = 623132
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Ctrl, Player, 0, MsgStr, 0 )
		ScriptMessage( Ctrl, Player, 1, MsgStr, 0 )
		return
	end
	AddBuff( Player, StopMove, 0, 3 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	SetPlot( Ctrl, "touch", "", 0 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 30, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "Z33_NPC123988TouchEnd" )
end
function Z33_Npc123988TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	local RequireQuest = { 427290, 427337, 427346 }
	local QuestItemID = 204919
	local BonusItemID = 204920
	local MsgStr1 = "[SC_Q427290_3]"--你似乎什麼也沒有找到！
	local MsgStr2 = "[SC_Q427290_4]"--你在陷阱裡發現了[204920]！
	local BonusLock = 0
	local BonusEvent = nil
	local BonusFound = false
	local QuestStatus = false
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_inspect )
	SetPlot( Ctrl, "touch", "Z33_Npc123988TouchCheck", 20 )
	EndCastBar( Player, CheckStatus )
	if ( CheckStatus <= 0 or Player == nil or CheckID( Player ) == false ) then
		return
	end
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and
			CountBodyItem( Player, QuestItemID ) < 10 ) then
				QuestStatus = true
				BonusEvent = 1
			else
				BonusEvent = DW_Rand( 10 )
			end
		end	
	end
	if BonusEvent == 1  then
		BonusEvent = DW_Rand( 10 )
	end
	if ( BonusEvent == 1 and CheckFlag( Player, BonusLock ) == false ) and
	CountBodyItem( Player, BonusItemID ) == 0 then
		BonusFound = true
		GiveBodyItem( Player, BonusItemID, 1 )
		ScriptMessage( Player, Player, 0, MsgStr2, C_LightGreen )
		ScriptMessage( Player, Player, 1, MsgStr2, C_LightGreen )
	end
	if QuestStatus == true then
		GiveBodyItem( Player, QuestItemID, 1 )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		BeginPlot( Ctrl, "Z33_Npc123988OnReset", 0 )
		return
	end
	if BonusFound == false then
		ScriptMessage( Ctrl, Player, 0, MsgStr1, 0 )
		ScriptMessage( Ctrl, Player, 1, MsgStr1, 0 )
	end
end
function Z33_Npc123988OnReset()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local SmokeFXID = 123989
	local SmokeFXObj = nil
	local SmokeCast = 490869
	SmokeFXObj = CreateObj( SmokeFXID, x, y-8, z, dir, 1 )
	MoveToFlagEnabled( SmokeFXObj, false )
	SetModeEx( SmokeFXObj, EM_SetModeType_Mark, false )
	SetModeEx( SmokeFXObj, EM_SetModeType_Gravity, false )
	AddToPartition( SmokeFXObj, 0 )
	CastSpell( SmokeFXObj, SmokeFXObj, SmokeCast )
	BeginPlot( SmokeFXObj, "Z33_Npc123989OnDestroy", 0 )
	Sleep( 10 )
	CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
end
function Z33_Npc123989OnDestroy()
	Sleep( 40 )
	DelObj( OwnerID() )
end
function Z33_Npc123961SK()
	local Player = OwnerID()
	local Npc = TargetID()
	local BonusItemID = 204920
	local BonusLock = 0
	local OptionStr = "[SC_Q427290_5]"
	if ( CountBodyItem( Player, BonusItemID ) >= 1 and CheckFlag( Player, BonusLock ) == false ) then
		AddSpeakOption( Player, Npc, OptionStr, "Z33_Npc123961SK_1", 0 )
	end
	LoadquestOption( Player )
end
function Z33_Npc123961SK_1()
	local Player = OwnerID()
	local Npc = TargetID()
	local BonusItemID = 204920
	local BonusLock = 544317
	local BonusMoney = 332542
	local BonusExp = 14367230
	local BonusTp = 1436722
	local SpeakStr = "[SC_Q427290_6]"--感謝你！
	local MsgStr1 = "[SC_Q427290_7]"--你獲得了
	local MsgStr2 = "[SC_Q427290_8]"--經驗值
	local MsgStr3 = "[SC_Q427290_9]"--技能點數
	local MsgStr4 = "[SC_Q427290_10]"--獲得了額外的任務獎勵！
	if ( CountBodyItem( Player, BonusItemID ) >= 1 and CheckFlag( Player, BonusLock ) == false ) then
		ScriptMessage( Npc, Player, 1, MsgStr4, C_LightGreen )
		ScriptMessage( Npc, Player, 0, MsgStr4, C_LightGreen )
		AddRoleValue ( Player, EM_RoleValue_Money, BonusMoney )
		AddRoleValue ( Player, EM_RoleValue_EXP, BonusExp )
		AddRoleValue ( Player, EM_RoleValue_TpExp, BonusTp )
		ScriptMessage( Npc, Player, 0, MsgStr1..BonusExp..MsgStr2, 0 )
		ScriptMessage( Npc, Player, 0, MsgStr1..BonusTp..MsgStr3, 0 )
		DelBodyItem( Player, BonusItemID, 1 )
		SetFlag( Player, BonusLock, 1 )
	else
		CloseSpeak( Player )
	end
	SetSpeakDetail( Player, SpeakStr )
end