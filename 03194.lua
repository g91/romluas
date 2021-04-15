function Z33_Item204782UseBegin()
	local Player = OwnerID()
	local QuestTarget = 123909
	local MessageStr1 = "[SC_Q426677_01]"
	local MessageStr2 = "[SC_Q427272_2]"
	local CastStr = "[SC_Q427272_1]"
	local SearchingRange = 50
	local RangeObj = SearchRangeNPC( Player, SearchingRange )
	for i = 0, #RangeObj, 1 do
		if ReadRoleValue( RangeObj[ i ], EM_RoleValue_OrgID ) == QuestTarget then
			if ReadRoleValue( RangeObj[ i ], EM_RoleValue_Register1 ) == 1 then
				ScriptMessage( Player, Player, 0, MessageStr1, 0 )
				ScriptMessage( Player, Player, 1, MessageStr1, 0 )
				return false
			end
			WriteRoleValue( RangeObj[ i ], EM_RoleValue_Register1, 1 )
			BeginCastBarEvent( Player, RangeObj[ i ], CastStr, 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_Item204782UseEnd" )
			return true
		end
	end
	ScriptMessage( Player, Player, 0, MessageStr2, 0 )
	ScriptMessage( Player, Player, 1, MessageStr2, 0 )
	return false
end
function Z33_Item204782UseEnd( Player, CheckStatus )
	local QuestTarget = TargetID()
	local KeyItem =103779
	local RequireQuest ={ 427272, 427301, 427311 }
	local QuestStatus = false
	WriteRoleValue( QuestTarget, EM_RoleValue_Register1, 0 )
	EndCastBar( Player, CheckStatus )
	if CheckStatus > 0 then
		for i = 1, #RequireQuest, 1 do
			if CheckAcceptQuest( Player, RequireQuest[ i ] ) == true then
				QuestStatus = true
				WriteRoleValue( QuestTarget, EM_RoleValue_Register1, 1 )
				BeginPlot( QuestTarget, "Z33_Item204782UseEvent", 0 )
			else

			end
		end
		if QuestStatus == true then
			DW_QietKillOne( Player, KeyItem )
		end
	end
end
function Z33_Item204782UseEvent()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local FireID = 123982
	local Fire = CreateObj( FireID, x, y, z, dir, 1 )
	MoveToFlagEnabled( Fire, false )
	AddToPartition( Fire, 0 ) 
	CallPlot( Fire, "Z33_Npc123982Destroy", Fire )
	Sleep( 30 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
end
function Z33_Npc123982Destroy()
	Sleep( 60 )
	DelObj( OwnerID() )
end
function Z33_npc123957()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	BeginPlot( Ctrl, "Z33_CreateNpc123978", 0 )
end
function Z33_Q427273Touch()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local Ctrl = ReadRoleValue( TargetObj, EM_RoleValue_Register1 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	BeginPlot( Ctrl, "Z33_CreateNpc123978", 0 )
	DelObj( TargetObj )
	return true
End
function Z33_CreateNpc123978()
	local Ctrl = OwnerID()
	local ObjID = 123978
	local FlagID = 781440
	local RandFlagNum = DW_Rand( 3 )
	local x, y, z, dir = DW_Location( FlagID, RandFlagNum )
	local QuestObj = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ( QuestObj ~= 0 or CheckID( QuestObj ) == true ) then
		return
	end
	Sleep( 30 )--123978的重生時間
	QuestObj = CreateObj( ObjID, x, y, z, dir, 1 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, QuestObj )
	WriteRoleValue( QuestObj, EM_RoleValue_Register1, Ctrl )
	MoveToFlagEnabled( QuestObj, false )
	AddToPartition( QuestObj, 0 )
end
function Z33_Npc123980()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Unlocked )
	SetPlot( Ctrl, "touch", "Z33_NPC123980TouchCheck", 20 )
end
function Z33_NPC123980TouchCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local ClientBuff = 500594
	local CastStr = "[SC_Q427276_1]"--解鎖
	local MessageStr = "[SC_Q427276_2]"--其他人正在使用這輛貨車！
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Ctrl, Player, 0, MessageStr, 0 )
		ScriptMessage( Ctrl, Player, 1, MessageStr, 0 )
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	SetPlot( Ctrl, "touch", "", 0 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_NPC123980TouchEnd" )
end
function Z33_NPC123980TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Unlocked )
	SetPlot( Ctrl, "touch", "Z33_NPC123980TouchCheck", 20 )
	EndCastBar( Player, CheckStatus )
	if CheckStatus > 0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CallPlot( Ctrl, "Z33_Q427276Event", Player )
	end
end
function Z33_Q427276Event( Player )
	local Ctrl = OwnerID()
	local CarClone = nil
	local x, y, z, dir = DW_Location( Ctrl )
	local CarID = 103780
	local CarKey = 204824
	local StopRecover = 502627
	local MessageStr = "[SC_Q427276_3]"--你身上並沒有車鑰匙！你想做什麼......
	if CountBodyItem( Player, CarKey ) == 1 then
		CarClone = CreateObj( CarID, x, y, z, dir, 1 )
		WriteRoleValue( CarClone, EM_RoleValue_Register1, Player )
		SetModeEx( CarClone, EM_SetModeType_Fight, true )
		SetModeEx( CarClone, EM_SetModeType_Strikback, false )
		SetModeEx( CarClone, EM_SetModeType_HideName, true )
		SetModeEx( CarClone, EM_SetModeType_Searchenemy, false )
		SetModeEx( CarClone, EM_SetModeType_ShowRoleHead, false )
		SetModeEx( CarClone, EM_SetModeType_NotShowHPMP, true )
		AddToPartition( CarClone, 0 )
		LockHP( CarClone, ReadRoleValue( CarClone, EM_RoleValue_MaxHP )*0.05, "Z33_Q427276FailureDestroy" )
		MoveToFlagEnabled( CarClone, false )
		AddBuff( CarClone, StopRecover, 0, -1 )
		CallPlot( CarClone, "Z33_Q427276SetFollow", Player )
	else
		ScriptMessage( Ctrl, Player, 0, MessageStr, 0 )
		ScriptMessage( Ctrl, Player, 1, MessageStr, 0 )
	end
	SetCursorType( Ctrl, eCursor_Unlocked )
	SetPlot( Ctrl, "touch", "Z33_NPC123980TouchCheck", 20 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	return
end
function Z33_Q427276SetFollow( Player )
	local Ctrl = OwnerID()
	local MaxHP = ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )
	local WarningRate = 0
	local Monster = nil
	local SearchingRange = 100
	local StopMove = 623132
	local CarKey = 204824
	local ValidDis = 200
	local StopDis = 40
	local RequireQuest = { 427276 }
	local ClientBuff = 500594
	local MessageStr = "[SC_Q427276_5]"
	local WarningStr = "[SC_Q427276_6]"
	while true do
		SetFollow( Ctrl, 0 ) AddBuff( Ctrl, StopMove, 0, -1 )
		if ( Player == nil or CheckID( Player ) == false ) then
			DelObj( Ctrl )
			return
		end
		if ReadRoleValue( Player, EM_RoleValue_IsDead ) == 1 then
			break
		end
		if CheckDistance( Ctrl, Player, ValidDis ) == false then
			ScriptMessage( Ctrl, Player, 0, MessageStr, 0 )
			ScriptMessage( Ctrl, Player, 1, MessageStr, 0 )
			break
		end
		if CountBodyItem( Player, CarKey ) == 0 then
			break
		end
		for i = 0, #RequireQuest, 1 do
			if RequireQuest[ i ] ~= nil then
				if CheckAcceptQuest( Player, RequireQuest[ i ] ) == false then
					break
				end
			end
		end
		AddBuff( Player, ClientBuff, 0, 5 )
		CurrentHP = ReadRoleValue( Ctrl, EM_RoleValue_HP )
		HPPercent = math.ceil( ( CurrentHP / MaxHP )*100 )
		if HPPercent <= 95 then
			WarningRate = WarningRate + 1
		end
		if HPPercent <= 90 then
			WarningRate = WarningRate + 2
		end
		if WarningRate >= 10 then
			WarningRate = 0
			ScriptMessage( Ctrl, Player, 0, WarningStr..HPPercent.."%", 0 )
			ScriptMessage( Ctrl, Player, 1, WarningStr..HPPercent.."%", 0 )
		end
		Monster = {}
		Monster = SearchRangeNPC( Ctrl, SearchingRange )
		for j = 0, #Monster, 1 do
			if ( Monster[ j ] ~= nil and ReadRoleValue( Monster[ j ], EM_RoleValue_CampID ) == 3 and
			ReadRoleValue( Monster[ j ], EM_RoleValue_IsAttackMode ) == 0 ) then
				SetAttack( Monster[ j ], Ctrl )
			end
		end
		if ( ReadRoleValue( Ctrl, EM_RoleValue_IsAttackMode ) == 0 and CheckDistance( Ctrl, Player, StopDis ) == false ) then
			CancelBuff( Ctrl, StopMove ) SetFollow( Ctrl, Player )
		end
		Sleep( 20 )
	end
	Sleep( 40 ) DelObj( Ctrl )
	return
end
function Z33_Q427276FailureDestroy()
	local Ctrl = OwnerID()
	local Player = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if ( Player ~= nil and CheckID( Player ) == true ) then
		ScriptMessage( Ctrl, Player, 0, "[SC_Q427276_4]", 0 )
		ScriptMessage( Ctrl, Player, 1, "[SC_Q427276_4]", 0 )
	end
	Sleep( 30 )
	DelObj( Ctrl )
	return true
end
function Z33_Npc123968()
	local Ctrl = OwnerID()
	local RequireQuest = { 427276, 427306, 427315 }
	local ClientBuff = 500594
	local CarID = 103780
	local QuestCompleteKey = 543851
	local SearchingRange = 100
	local RangeNpc = {}
	local GuardPlayer = 0
	while true do
		RangeNpc = SearchRangeNPC( Ctrl, SearchingRange )
		for i = 0, #RangeNpc, 1 do
			if ( RangeNpc[ i ] ~= nil and CheckID( RangeNpc[ i ] ) == true ) then
				if ( ReadRoleValue( RangeNpc[ i ], EM_RoleValue_OrgID ) == CarID and
				ReadRoleValue( RangeNpc[ i ], EM_RoleValue_Register1 ) ~= nil ) then
					GuardPlayer = ReadRoleValue( RangeNpc[ i ], EM_RoleValue_Register1 )
					if CheckID( GuardPlayer ) == true then
						for j = 0, #RequireQuest, 1 do
							if RequireQuest[ j ] ~= nil then
								if ( CheckAcceptQuest( GuardPlayer, RequireQuest[ j ] ) == true and
								CheckBuff( GuardPlayer, ClientBuff ) == true and
								CheckFlag( GuardPlayer, QuestCompleteKey ) == false ) then
									SetFlag( GuardPlayer, QuestCompleteKey, 1 )
									DelObj( RangeNpc[ i ] )
								end
							end
						end
					end			
				end
			end
		end
		Sleep( 20 )
	end
end
function Z33_Item204823UseBegin()
	local Player = OwnerID()
	local CastStr = "[SC_Q427277_2]"--偵測能量
	local MsgStr = "[SC_Q427277_3]"--不是在正確的區域使用[204823]！
	if ReadRoleValue( Player, EM_RoleValue_ZoneID ) ~= 33 then
		ScriptMessage( Player, Player, 0, MsgStr, 0 )
		ScriptMessage( Player, Player, 1, MsgStr, 0 )
		return
	end
	BeginCastBarEvent( Player, Player, CastStr, 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_Item204823UseEvent" )
end
function Z33_Item204823UseEvent( Player, CheckStatus )
	EndCastBar( Player, CheckStatus )
	if CheckStatus <= 0 then
		return
	end
	local x, y, z, dir = DW_Location( Player )
	local CurrentLocation = FindMapID( x, y, z )
	local RequireLocation = { 311, 313, 331, 353 }--沼澤, 沼澤, 地窟, 穆牆
	local QuestStatus = false
	local MatchLocation = 0
	local RequireQuest = { 427277, 427307, 427316 }
	local KeyItem_1, KeyItem_2, KeyItem_3 = 542582, 542586, 543860
	local MsgStr = "[SC_Q427277_1]"--[204823]似乎沒有發生任何反應！
	for j = 0, #RequireQuest, 1 do
		if RequireQuest[ j ] ~= nil then
			if CheckAcceptQuest( Player, RequireQuest[ j ] ) == true then
				QuestStatus = true
				break
			end
		end
	end
	if QuestStatus == false then
		ScriptMessage( Player, Player, 0, MsgStr, 0 )
		ScriptMessage( Player, Player, 1, MsgStr, 0 )
		return
	end
	for i = 0, #RequireLocation, 1 do
		if ( RequireLocation[ i ] ~= nil or RequireLocation[ i ] ~= 0 ) then
			if RequireLocation[ i ] == CurrentLocation then
				MatchLocation = CurrentLocation break
			end
		end
	end
	if ( MatchLocation == 311 or MatchLocation == 313 ) and CheckFlag( Player, KeyItem_1 ) == false then
		SetFlag( Player, KeyItem_1, 1 )
	elseif ( MatchLocation == 331 and CheckFlag( Player, KeyItem_2 ) == false ) then
		SetFlag( Player, KeyItem_2, 1 )
	elseif ( MatchLocation == 353 and CheckFlag( Player, KeyItem_3 ) == false ) then
		SetFlag( Player, KeyItem_3, 1 )
	else
		ScriptMessage( Player, Player, 0, MsgStr, 0 )
		ScriptMessage( Player, Player, 1, MsgStr, 0 )
		return	
	end
end
function Z33_Npc123981()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local RangeNpc = SearchRangeNPC( Ctrl, 50 )
	for i = 0, #RangeNpc, 1 do
		if ( RangeNpc[ i ] ~= nil and CheckID( RangeNpc[ i ] ) == true ) then
			if ReadRoleValue( RangeNpc[ i ], EM_RoleValue_OrgID ) == 123984 then
				DelObj( RangeNpc[ i ] )
				break
			end
		end
	end
	SetModeEx( Ctrl, EM_SetModeType_Gravity, false )
	MoveToFlagEnabled( Ctrl, false )
	Move( Ctrl, x, y+12, z )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
end
function Z33_Item243090UseBegin()
	local Player = OwnerID()
	local CastStr = "[SC_Q427281_2]"--佈設魔法石
	BeginCastBarEvent( Player, Player, CastStr, 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_Item243090UseEvent" )
	return true
end
function Z33_Item243090UseEvent( Player, CheckStatus )
	EndCastBar( Player, CheckStatus )
	if CheckStatus <= 0 then
		return
	end
	local Player = OwnerID()
	local RequireQuest = { 427281, 427320, 427328 }
	local QuestStatus = false
	local MsgStr1 = "[SC_Q427281_1]"--範圍內沒有正確的使用目標
	local MsgStr2 = "[SC_Q427281_3]"--這個地點已有足夠的能量
	local RangeNpc = {}
	local SearchingRange = 50
	local MatchNpc = 0
	local KeyItem = 109194
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
	RangeNpc = SearchRangeNPC( Player, SearchingRange )
	for j = 0, #RangeNpc, 1 do
		if ( RangeNpc[ j ] ~= nil and CheckID( RangeNpc[ j ] ) == true ) then
			if ReadRoleValue( RangeNpc[ j ], EM_RoleValue_OrgID ) == 123981 then
				MatchNpc = RangeNpc[ j ]
				break
			end
		end
	end
	if MatchNpc == 0 then
		ScriptMessage( Player, Player, 0, MsgStr1, 0 )
		ScriptMessage( Player, Player, 1, MsgStr1, 0 )
		return
	end
	if ReadRoleValue( MatchNpc, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Player, Player, 0, MsgStr2, 0 )
		ScriptMessage( Player, Player, 1, MsgStr2, 0 )
		return
	end
	WriteRoleValue( MatchNpc, EM_RoleValue_Register1, 1 )
	BeginPlot( MatchNpc, "Z33_Item243090UseEvent_2", 0 )
	DW_QietKillOne( Player, KeyItem )
	return
end
function Z33_Item243090UseEvent_2()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local NpcID = 123984
	local CloneNpc = CreateObj( NpcID, x, y, z, dir, 1 )
	MoveToFlagEnabled( CloneNpc, false )
	SetModeEx( CloneNpc, EM_SetModeType_Mark, false )
	SetModeEx( CloneNpc, EM_SetModeType_Gravity, false )
	AddToPartition( CloneNpc, 0 )
	CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
	return
end
function Z33_Npc108856()
	local Ctrl = OwnerID()
	local MaxHP = ReadRoleValue( Ctrl, EM_RoleValue_HP )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, MaxHP )
	MoveToFlagEnabled( Ctrl, true )
end
function Z33_Npc108856BeginCombat()
	local Ctrl = OwnerID()
	MoveToFlagEnabled( Ctrl, true )
	LockHP( Ctrl, -1, "" )
	return
end
function Z33_Npc108856EndCombat()
	local Ctrl = OwnerID()
	MoveToFlagEnabled( Ctrl, true )
	return
end
function Z33_Npc108856Move()
	local Ctrl = OwnerID()
	local MaxHP = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	local CurrentHP = ReadRoleValue( Ctrl, EM_RoleValue_HP )
	local HPPercent = ( CurrentHP / MaxHP )*100
	local RandMotionIndex = nil
	local InvisibleRate = nil
	local InvisibleTime = nil
	local InvisibleMode = false
	local SearchingRange = 300
	local RangePlayer = SearchRangePlayer( Ctrl, SearchingRange )
	local MotionList = {}
	MotionList[ 1 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE
	MotionList[ 2 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE0
	MotionList[ 3 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE1
	MotionList[ 4 ] = ruFUSION_ACTORSTATE_EMOTE_IDLE2
	MoveToFlagEnabled( Ctrl, false )
	Sleep( 10 )
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )*HPPercent, "Lua_424225_LockHP" )
	if ( RangePlayer ~= nil and #RangePlayer >= 1 ) then
		for i = 0, #RangePlayer, 1 do
			if ( RangePlayer[ i ] ~= nil and CheckID( RangePlayer[ i ] ) == true ) then
				AdjustFaceDir( Ctrl, RangePlayer[ i ], 0 )
				InvisibleRate = DW_Rand( 2 )
				if InvisibleRate == 1 then
					InvisibleMode = true
					--DebugMsg( 0, 0, "InvisibleMode = true" )
				end
				break
			end
		end
	end
	RandMotionIndex = DW_Rand( 4 )
	if InvisibleMode == true then
		PlayMotion( Ctrl, MotionList[ RandMotionIndex ] )
		DelFromPartition( Ctrl )
		InvisibleTime = DW_Rand( 8 )*10+40
		Sleep( InvisibleTime )
		AddToPartition( Ctrl, 0 )
		LockHP( Ctrl, -1, "" )
	else
		LockHP( Ctrl, -1, "" )
		PlayMotion( Ctrl, MotionList[ RandMotionIndex ] )
		Sleep( 30 )
	end
	MoveToFlagEnabled( Ctrl, true )
	return
end
function Z33_Npc123985()
	local Ctrl = OwnerID()
	MoveToFlagEnabled( Ctrl, false )
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP ), "Lua_424225_LockHP" )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Pickup )
	SetPlot( Ctrl, "touch", "Z33_NPC123985TouchCheck", 20 )
	BeginPlot( Ctrl, "Z33_Npc123985MoveAI", 0 )
end
function Z33_Npc123985TouchCheck()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local CastStr = "[SC_Q427284_1]"--捕捉
	local MessageStr = "[SC_Q427284_2]"--其他人也在捕捉咪咪！
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage( Ctrl, Player, 0, MessageStr, 0 )
		ScriptMessage( Ctrl, Player, 1, MessageStr, 0 )
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	SetPlot( Ctrl, "touch", "", 0 )
	BeginCastBarEvent( Player, Ctrl, CastStr, 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Z33_NPC123985TouchEnd" )
end
function Z33_NPC123985TouchEnd( Player, CheckStatus )
	local Ctrl = TargetID()
	local CheckDis = CheckDistance( Player, Ctrl, 20 )
	local MsgStr = "[SC_Q427284_4]"
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetCursorType( Ctrl, eCursor_Pickup )
	SetPlot( Ctrl, "touch", "Z33_NPC123985TouchCheck", 20 )
	EndCastBar( Player, CheckStatus )
	if CheckDis == false then
		ScriptMessage( Ctrl, Player, 0, MsgStr, 0 )
		ScriptMessage( Ctrl, Player, 1, MsgStr, 0 )
		return
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	CallPlot( Ctrl, "Z33_Q427284Event", Player )
end
function Z33_Q427284Event( Player )
	local Ctrl = OwnerID()
	local ClientBuff = 502625
	local RequireQuest = { 427284, 427323, 427331 }
	local KeyItem = 542581
	local SpeakStr = "[SC_Q427284_3]"--喵！
	if ( Player == nil or CheckID( Player ) == false ) then
		return
	end
	for i = 0, #RequireQuest, 1 do
		if ( RequireQuest[ i ] ~= nil and RequireQuest[ i ] > 0 ) then
			if ( CheckAcceptQuest( Player, RequireQuest[ i ] ) == true and
			CheckFlag( Player, KeyItem ) == false ) then
				StopMove( Ctrl, true )
				MoveToFlagEnabled( Ctrl, false )
				AddBuff( Player, ClientBuff, 0, 3 )
				SetFlag( Player, KeyItem, 1 )
				CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
			else
				NpcSay( Ctrl, SpeakStr )
			end
		end
	end
	SetCursorType( Ctrl, eCursor_Pickup )
	SetPlot( Ctrl, "touch", "Z33_NPC123985TouchCheck", 20 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	return
end