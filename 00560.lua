----------------------------------------------------------------------------------------------------
Function Z32_NPC123592SLAVE_00()--奴役
	local Ctrl = OwnerID()
	local PlayerAmount = 0
	local Player = {}
	local QuestPlayer = {}
	local Quests = 425064
	local KeyItem = 108864
	local NPC = {}
	local BossDBID = 108849
	local BossGitemID = 0
	local DelayTime = DW_Rand( 3 )*10
	local Num = 0
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )*0.25, "Lua_424225_LockHP" )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	Sleep( DelayTime )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_MINING_LOOP )
	while 1 do
		Sleep( 20 )
		Num = 0
		BossGitemID = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
		if BossGitemID == 0 or CheckID( BossGitemID ) == false then
			NPC = SearchRangeNpc( Ctrl, 100 )
			for i = 0, table.getn( NPC ), 1 do
				if ReadRoleValue( NPC[ i ], EM_RoleValue_OrgID ) == BossDBID then
					WriteRoleValue( Ctrl, EM_RoleValue_Register1, NPC[ i ] )
				end
			end
		else	if ReadRoleValue ( BossGitemID, EM_RoleValue_IsDead ) == 0 then				
				if CheckID( BossGitemID ) == true then
					Player = {}
					QuestPlayer = {}
					for j = 0, HateListCount( BossGitemID )-1, 1 do
						Player = HateListInfo( BossGitemID, j, EM_HateListInfoType_GItemID )
						if CheckID( Player ) == true and (CheckAcceptQuest( Player, Quests1 ) == true or CheckAcceptQuest( Player, Quests2 ) == true) then
							table.insert ( QuestPlayer, Player )
						end
					end
				end
			else	for k = 1, #QuestPlayer, 1 do
					DW_QietKillOne( QuestPlayer[ k ], KeyItem )
				end
				MoveToFlagEnabled( Ctrl, false )
				SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_POLEARM )
				Sleep( 05 ) AdjustFaceDir( Ctrl, BossGitemID, 0 )
				DelayTime = DW_Rand( 2 )*10
				Sleep( DelayTime )
				Num = DW_Rand( 3 )
				if Num == 1 then
					NpcSay( Ctrl, "[SC_Q425064_1]" )
					PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_VICTORY )
				elseif Num == 2 then
					NpcSay( Ctrl, "[SC_Q425064_2]" )
					Sleep( 10 )
					AdjustFaceDir( Ctrl, BossGitemID, 180 )
					SetDefIdleMotion( Ctrl, ruFUSION_MIME_RUN_FORWARD )
				elseif Num == 3 then
					Sleep( 10 )
					AdjustFaceDir( Ctrl, BossGitemID, 180 )
					SetDefIdleMotion( Ctrl, ruFUSION_MIME_RUN_FORWARD )
				end
				Sleep( DelayTime )
				MoveToFlagEnabled( Ctrl, true )
				Callplot( Ctrl, "LuaFunc_ResetObj", Ctrl )
			end
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC108849MOVE_00()
	local Ctrl = OwnerID()
	local NPC = {}
	local SlaveDBID = 123592
	local SlaveGitemID = {}
	local SlaveAmount = 0
	local YellingTarget = 0
	local Num = DW_Rand( 6 )
	MoveToFlagEnabled( Ctrl, false )
	if Num ~= 1 then
		MoveToFlagEnabled( Ctrl, true )
		return
	else	NPC = SearchRangeNPC( Ctrl, 100 )
		Num = 1
		for i = 0, table.getn( NPC ), 1 do
			if ReadRoleValue( NPC[ i ], EM_RoleValue_OrgID ) == SlaveDBID then
				SlaveGitemID[ Num ] = NPC[ i ]
				Num = Num + 1
			end
		end
	end
	SlaveAmount = table.getn( SlaveGitemID )
	if SlaveAmount ~= 0 then
		CallPlot( Ctrl, "Z32_NPC108849MOVE_01", Ctrl, SlaveAmount, YellingTarget, SlaveGitemID )
	end
	return
End
Function Z32_NPC108849MOVE_01( Ctrl, SlaveAmount, YellingTarget, SlaveGitemID )
	local Num = DW_Rand( SlaveAmount )
	YellingTarget = SlaveGitemID[ Num ]
	AdjustFaceDir( Ctrl, YellingTarget, 0 )
	Sleep( 10 ) SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_UNARMED )
	Num = DW_Rand( 2 )
	if Num ==1 then
		NpcSay( Ctrl, "[SC_NPC108849_00]" )
	else
		NpcSay( Ctrl, "[SC_NPC108849_01]" )
	end
	Sleep( 35 ) SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_STAND )
	MoveToFlagEnabled( Ctrl, true )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC108849CombateEnd_00()
	local Ctrl = OwnerID()
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_STAND )
	MoveToFlagEnabled( Ctrl, true )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_Q425062TOUCH_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local KeyItem = 108870
	DW_QietKillOne( Player, KeyItem )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC108873DEAD_00()
	local NPC = OwnerID()
	local Player = TargetID()
	local KeyItem = 108870
	DW_QietKillOne( Player, KeyItem )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123705_00()
	local NPC = OwnerID()
	local unRecover = 502707
	local NoMouse = 544801
	local x, y, z, dir = DW_Location( NPC )
	local SmokeID = 121306
	local SmokeObj = 0	
	SetFlag( NPC, NoMouse, 1 )
	AddBuff( NPC, unRecover, 0, -1 )
	SetModeEx( NPC, EM_SetModeType_NotShowHPMP, true )
	if ReadRoleValue( NPC, EM_RoleValue_OrgID ) == 103571 then
		SmokeObj = CreateObj( SmokeID, x, y+70, z, dir, 1 )
		SetModeEx( SmokeObj, EM_SetModeType_Gravity, false )
		SetModeEx( SmokeObj, EM_SetModeType_Mark, false )
		SetModeEx( SmokeObj, EM_SetModeType_NotShowHPMP , true )
		AddToPartition( SmokeObj, 0 )
		WriteRoleValue( NPC, EM_RoleValue_Register1, SmokeObj )
	end	
End
Function Z32_NPC123705DEAD_00()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local KeyItem = 103432
	local ObjID = 119875
	local x, y, z, dir = DW_Location( Ctrl )
	local FxBall = CreateObj( ObjID, x, y, z, dir, 1 )
	local SmokeObj = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	LockHP( FxBall, ReadRoleValue( FxBall, EM_RoleValue_MaxHP )*0.9, "Lua_424225_LockHP" )
	AddToPartition( FxBall, 0 )
	CallPlot( FxBall, "Z32_NPC103571EXPLODED_01", FxBall )
	DW_QietKillOne( Player, KeyItem )
	if CheckID( SmokeObj ) == true then
		DelObj( SmokeObj )
	end
	return true
End
Function Z32_NPC103571EXPLODED_01( Ctrl )
	local ExplodedSpell = 490608
	CastSpell( Ctrl, Ctrl, ExplodedSpell )
	Sleep( 25 )
	DelObj( Ctrl )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123758SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest_1 = 425266
	local RequiredQuest_2 = 427191
	local KeyItem_1 = 549112
	local KeyItem_2 = 542685
	local QuestItem = 203942
	if CheckAcceptQuest( Player, RequiredQuest_1 ) == true and
	CheckFlag( Player, KeyItem_1 ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q425266_1]", "Z32_NPC123758SK_01", 0 )
	end
	if CheckAcceptQuest( Player, RequiredQuest_2 ) == true and
	CheckFlag( Player, KeyItem_2 ) == false and
	CountBodyItem( Player, QuestItem ) >= 1 then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427191_1]", "Z32_NPC123758SK_02", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123758SK_01()
	local Player = OwnerID()
	local RequiredQuest = 425266
	local KeyItem = 549112
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
Function Z32_NPC123758SK_02()
	local Player = OwnerID()
	local RequiredQuest = 427191
	local KeyItem = 542685
	local QuestItem = 203942
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q425394TOUCH_00()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local RequireQuest1 = 425394
	local RequireQuest2 = 427203
	local CageID = 123712
	local FishID = 123713
	local RepairCage = 108997
	local CatchFish = 108999
	if CheckAcceptQuest( Player, RequireQuest1 ) == true or
	CheckAcceptQuest( Player, RequireQuest2 ) == true then
		if ReadRoleValue( TargetObj, EM_RoleValue_OrgID ) == CageID then
			DW_QietKillOne( Player, RepairCage )
			PlayMotion( TargetObj, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
			BeginPlot( TargetObj, "Z32_NPC123712_00", 380 )
		elseif ReadRoleValue( TargetObj, EM_RoleValue_OrgID ) == FishID then
			DW_QietKillOne( Player, CatchFish )
		end
	else
		return false
	end
	return true
End
Function Z32_NPC123712_00()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123720_00()--馴養的波西
	local Percy = OwnerID()
	WriteRoleValue( Percy, EM_RoleValue_Register1, 0 )--波西散發臭味的開關
	LockHP( Percy, ReadRoleValue( Percy, EM_RoleValue_MaxHP)*100, "Lua_424225_LockHP" )
End
----------------------------------------------------------------------------------------------------
Function Z32_ITEM201936CHECK_00()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local PercyID = 123720
	local Debuff = 500638
	if ReadRoleValue( TargetObj, EM_RoleValue_OrgID ) == PercyID and
	CheckBuff( TargetObj, Debuff ) == true then
		return true
	else
		ScriptMessage( Player, Player, 1, "[SC_Z32ITEM201936FALSE_1]", 0 )
		return false
	end
End
Function Z32_BUFF500637_00()
	local Player = OwnerID()
	local Percy = TargetID()
	local x, y, z, dir = DW_Location( Percy )
	local FxBallId = 123763
	local FxBallObj = 0
	DW_QietKillOne( Player, 103434 )
	FxBallObj = CreateObj( FxBallId, x, y-30, z, dir, 1 )
	SetModeEx( FxBallObj, EM_SetModeType_Gravity, false )
	AddToPartition( FxBallObj, 0 )
	CallPlot( FxBallObj, "Z32_BUFF500637_01",FxBallObj, Percy )
	return true
End
Function Z32_BUFF500637_01( FxBallObj, Percy )
	local FxMagic = 490610
	local Debuff = 500638
	local StopMove = 623132
	if CheckBuff( Percy, Debuff ) == true then
		AddBuff( Percy, StopMove, 0, 3 )
		CastSpell( FxBallObj, FxBallObj, FxMagic )
		CancelBuff( Percy, Debuff )
		Sleep( 30 )
	end	
	DelObj( FxBallObj )
End
Function Z32_CombatCount103574_00()
	local NPC = OwnerID()
	for i = 1, 15, 1 do
		Sleep( 20 )
		if ReadRoleValue( NPC, EM_RoleValue_AttackTargetID ) == 1  then
			return
		end
	end
	DelObj( NPC )
End
Function Z32_NPC123720MOVE_00()--重置臭味
	local Percy = OwnerID()
	local Debuff = 500638
	local Counter = ReadRoleValue( Percy, EM_RoleValue_Register1 )
	local CurrentNum = 0
	local RandNum = 0
	if CheckBuff( Percy, Debuff ) == true then
		return
	end
	CurrentNum = 11 - Counter
	RandNum = DW_Rand( CurrentNum )
	if RandNum == 1 then
		WriteRoleValue( Percy, EM_RoleValue_Register1, 0 )
		AddBuff( Percy, Debuff, 0, -1 )
	else
		Counter = Counter +1
		WriteRoleValue( Percy, EM_RoleValue_Register1, Counter )
	end	
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123718SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 425988
	local QuestItem = 201890
	local KeyItem = 542679
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q425266_1]", "Z32_NPC123718SK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123718SK_01()
	local Player = OwnerID()
	local RequiredQuest = 425988
	local QuestItem = 201890
	local KeyItem = 542679
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 then
		DelBodyItem( Player, QuestItem, 1 )
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q426072TOUCH_00()
	local Player = OwnerID()
	local TargetObj = TargetID()
	local RequireQuest1 = 426072
	local RequireQuest2 = 427205
	local Num = 0
	local QuestItem = {}
	QuestItem[ 1 ] = 201891
	QuestItem[ 2 ] = 201933
	if CheckAcceptQuest( Player, RequireQuest1 ) == false and
	CheckAcceptQuest( Player, RequireQuest2 ) == false then
		return false
	end
	Num = DW_Rand( 2 )
	if CountBodyItem( Player, QuestItem[ Num ] ) < 5 then
		GiveBodyItem( Player, QuestItem[ Num ], 1 )
	else
		table.remove( QuestItem, Num )
		GiveBodyItem( Player, QuestItem[ 1 ], 1 )
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC108844MOVE_00()
	local Ctrl = OwnerID()
	local NPC = {}
	local Tool = 0
	local Num = 0
	NPC = SearchRangeNPC( Ctrl, 40 )
	for i = 0, #NPC, 1 do
		if ReadRoleValue( NPC[ i ], EM_RoleValue_OrgID) == 103571 then
			 Tool = NPC[ i ]
		end
	end
	if CheckID( Tool ) == true then
		MoveToFlagEnabled( Ctrl, false )
		PlayMotion( Ctrl, ruFUSION_ACTORSTATE_MINING_BEGIN )
		Num = DW_Rand( 10 )
		Sleep( Num*10+100 )
		PlayMotion( Ctrl, ruFUSION_ACTORSTATE_MINING_END )
		Sleep( 20 )
		MoveToFlagEnabled( Ctrl, true )
	else
		return
	end
End
Function Z32_NPC108844CombatEnd_00()
	MoveToFlagEnabled( OwnerID(), true )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123879_00()
	local Ctrl = OwnerID()
	local StopMove = 623132
	local NpcId = 123881
	local Dis = 20
	local NpcObj = Lua_CreateObjByDir( Ctrl, NpcId, Dis, 0 )
	AddToPartition( NpcObj, 0 )
	CallPlot( NpcObj, "Z32_NPC123881Combat_00", NpcObj, Ctrl, StopMove )
	SetModeEx( Ctrl, EM_SetModeType_HideName, true )
	SetModeEx( Ctrl, EM_SetModeType_NotShowHPMP, true )
	MoveToFlagEnabled( Ctrl, false )
	AdjustFaceDir( Ctrl, NpcObj, 0 )
	AddBuff( Ctrl, StopMove, 0, -1 )
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )*1, "Lua_424225_LockHP" )
	while 1 do
		Sleep( 20 )
		if CheckID( NpcObj ) == true then
			SetAttack( Ctrl, NpcObj )
		else
			return
		end
	end
End
Function Z32_NPC123881Combat_00( NpcObj, Ctrl, StopMove )
	SetModeEx( NpcObj, EM_SetModeType_Mark, false )
	SetModeEx( NpcObj, EM_SetModeType_HideName, true )
	SetModeEx( NpcObj, EM_SetModeType_ShowRoleHead, false )
	SetModeEx( NpcObj, EM_SetModeType_NotShowHPMP, true )
	SetModeEx( NpcObj, EM_SetModeType_Strikback, true )
	SetModeEx( NpcObj, EM_SetModeType_Searchenemy, true )
	SetModeEx( NpcObj, EM_SetModeType_Fight, true )
	MoveToFlagEnabled( NpcObj, false )
	AdjustFaceDir( NpcObj, Ctrl, 0 )
	AddBuff( NpcObj, StopMove, 0, -1 )
	LockHP( NpcObj, ReadRoleValue( NpcObj, EM_RoleValue_MaxHP )*1, "Lua_424225_LockHP" )
	while 1 do
		Sleep( 20 )
		if CheckID( Ctrl ) == true then
			SetAttack( NpcObj, Ctrl )
		else
			DelObj( NpcObj )
			return
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123807_00()
	local Plant = OwnerID()
	SetFlag( Plant, 544801, 1 )
	SetModeEx( Plant, EM_SetModeType_Fight, true )
End
Function Z32_Q427186TOUCH_01()
	local Player = OwnerID()
	local Plant = TargetID()
	local FxBuff = 502277
	local KillBuff = 621301
 	AddBuff( Player, FxBuff, 0, 5 )
 	AddBuff( Plant, KillBuff, 0, -1 )
	return true
End
Function Z32_Q427186TOUCH_02()
	local Player = OwnerID()
	local Plant = TargetID()
	if ReadRoleValue( Plant, EM_RoleValue_IsDead ) == 1 then
		return false
	end
	return true
End
Function Z32_NPC103775MOVE_00()
	local Ctrl = OwnerID()
	local SearchObj = {}
	local PlantID = 123807
	local FxBallID = 119306
	local FxBall = 0
	local x, y, z, dir = 0
	local KillBuff = 621301
	local Num = 0
	SearchObj = SearchRangeNPC( Ctrl, 100 )
	for i = 0, #SearchObj, 1 do
		if ReadRoleValue( SearchObj[ i ], EM_RoleValue_OrgID ) == PlantID then
			Num = DW_Rand( 4 )
			if Num == 1 then
				NpcSay( Ctrl, "[SC_FIREDAY_EV2_12]" )
			end
			SetAttack( Ctrl, SearchObj[ i ] )
			x, y, z, dir = DW_Location( SearchObj[ i ] )
			FxBall = CreateObj( FxBallID, x, y, z, dir, 1 )
			SetModeEx( FxBall, EM_SetModeType_Mark, false )
			AddToPartition( FxBall, 0 )
			AddBuff( FxBall, KillBuff, 0, -1 )
			BeginPlot( FxBall, "Z32_NPC103775MOVE_01", 50 )
			return
		end
	end
End
Function Z32_NPC103775MOVE_01()
	DelObj( OwnerID() )
End
Function Z32_Buff621300Check_00()
	if CheckBuff( TargetID(), 621301 ) == true then
		return true
	end
	return false
End
Function Z32_Buff502268Check_00()
	if CheckBuff( TargetID(), 502277 ) == true then
		return true
	end
	return false
End
----------------------------------------------------------------------------------------------------
Function Z32_CombatShow_00()
	local Ctrl = OwnerID()
	local BaseX, BaseY, BaseZ, dir = DW_Location( Ctrl )
	local Radius = 40
	local Poly = 360
	local x = BaseX+Radius*math.cos( Poly*math.pi/180 )
	local y = BaseY
	local z = BaseZ+Radius*math.sin( Poly*math.pi/180 )
	local StopMove = 623132
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, x )
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, y )
	WriteRoleValue( Ctrl, EM_RoleValue_Register3, z )
	WriteRoleValue( Ctrl, EM_RoleValue_Register4, dir )
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )*0.33, "Lua_424225_LockHP" )
	AddBuff( Ctrl, StopMove, 0, -1 )
	SetModeEx( Ctrl, EM_SetModeType_Fight, true )
	CallPlot( Ctrl, "Z32_CombatShow_01", Ctrl )
End
Function Z32_CombatShow_01( Ctrl )
	local RangeObj = {}
	local IndexID = {}
	local Enemy = 0
	local SearchDIS = 200
	local x = ReadRoleValue( Ctrl, EM_RoleValue_Register1, x )
	local y = ReadRoleValue( Ctrl, EM_RoleValue_Register2, y )
	local z = ReadRoleValue( Ctrl, EM_RoleValue_Register3, z )
	local dir = ReadRoleValue( Ctrl, EM_RoleValue_Register4, dir )
	local StopMouse = 544801
	local Num = 1
	RangeObj = SearchRangeNPC( Ctrl, SearchDIS )
	if #RangeObj == 0 then
		return
	end
	for i = 0, #RangeObj, 1 do
		if ReadRoleValue( RangeObj[ i ], EM_RoleValue_CampID ) == 3 then
			IndexID[ Num ] = ReadRoleValue( RangeObj[ i ], EM_RoleValue_OrgID )
			Num = Num + 1
		end
	end
	Num = DW_Rand( #IndexID ) 
	Enemy = CreateObj( IndexID[ Num ], x, y, z, dir, 1 )
	AddToPartition( Enemy, 0 )
	LockHP( Enemy, ReadRoleValue( Enemy, EM_RoleValue_MaxHP)*0.25, "Z32_CombatShow_02" )
	WriteRoleValue( Enemy, EM_RoleValue_Register1, Ctrl )
	MoveToFlagEnabled( Enemy, false )
	SetFlag( Enemy, StopMouse, 1 )
	SetModeEx( Enemy, EM_SetModeType_Fight, true )
	SetAttack( Enemy, Ctrl )
End
Function Z32_CombatShow_02()
	local Enemy = OwnerID()
	local Ctrl = ReadRoleValue( Enemy, EM_RoleValue_Register1 )
	CallPlot( Ctrl, "Z32_CombatShow_01", Ctrl )
	LockHP( Enemy, -1, "" )
End
----------------------------------------------------------------------------------------------------
Function Z30_NPC122938MOVE_00()
	local NPC = OwnerID()
	local Num = DW_Rand( 10 )
	local Motion01 = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD
	local Motion02 = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	MoveToFlagEnabled( NPC, false )
	if Num == 1 then
		NpcSay( NPC, "[SC_Z30_TALK3_2]" )
		PlayMotion( NPC, Motion01 )
	else
		PlayMotion( NPC, Motion02 )
	end
	Sleep( 30 )
	MoveToFlagEnabled( NPC, true )
End
Function Z30_NPC122916MOVE_00()
	local NPC = OwnerID()
	local Num = DW_Rand( 5 )
	if Num == 1 then
		MoveToFlagEnabled( NPC, false )
		NpcSay( NPC, "[SC_Z24ALLY_1]" )
		Sleep( 30 )
		MoveToFlagEnabled( NPC, true )
	end
End
Function Z30_NPC122940_00()
	local NPC = OwnerID()
	local Num = 0
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
	Num = DW_Rand( 2 )
	if Num == 1 then
		SetRoleEquip( NPC, EM_EQWearPos_MainHand, 214550, 1 )
	else
		SetRoleEquip( NPC, EM_EQWearPos_SecondHand, 214550, 1 )
	end
	while 1 do
		Num = DW_Rand( 10 )
		if Num == 1 then
			NpcSay( NPC, "[SC_Z21ROBBERY_01]" )
		end
		Sleep( 30 )
	end
End
Function Z30_NPC108508MOVE_00()
	local NPC = OwnerID()
	local Num = DW_Rand( 10 )
	if Num == 1 then
		MoveToFlagEnabled( NPC, false )
		NpcSay( NPC, "[SC_Z21ROBBERY_01]" )
		Sleep( 30 )
		MoveToFlagEnabled( NPC, true )
	end
End
Function Z30_NPC108508MOVE_01()
	local NPC = OwnerID()
	local Num = DW_Rand( 10 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_SIT_LOOP )
	while 1 do
		if Num == 1 then
			NpcSay( NPC, "[SC_Z30_TALK3_2]" )
		end
		Sleep( 30 )
	end
End
----------------------------------------------------------------------------------------------------
function Z32_NpcBurningFx()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local Smoke = CreateObj( 124094, x, y-10, z, dir, 1 )
	local Flame = nil
	local BurningFx = 490874
	local Index = 0
	local CurrentNpc = 0
	local BurningStatus = 0
	local OnReset = true
	local RandNum = 0
	local RangeNpc = SearchRangeNPC( Ctrl, 100 )
	for Index = 0, #RangeNpc, 1 do
		if ( RangeNpc[ Index ] ~= nil and CheckID( RangeNpc[ Index ] ) == true ) then
			if ( ReadRoleValue( RangeNpc[ Index ], EM_RoleValue_OrgID ) == 124094 or
			ReadRoleValue( RangeNpc[ Index ], EM_RoleValue_OrgID ) == 123759 ) then
				DelObj( RangeNpc[ Index ] )
			end
		end
	end
	MoveToFlagEnabled( Ctrl, false )
	SetModeEx( Smoke, EM_SetModeType_Mark, false )
	SetModeEx( Smoke, EM_SetModeType_Gravity, false )
	AddToPartition( Smoke, 0 )--冒煙
	while true do
		RangeNpc = SearchRangeNPC( Ctrl, 50 )
		if BurningStatus == 0 then--未起火
			if  #RangeNpc >= 3 then
				for Index = 0, #RangeNpc, 1 do
					if ( CheckID( RangeNpc[ Index ] ) == true and ReadRoleValue( RangeNpc[ Index ], EM_RoleValue_AttackTargetID ) ~= 0 ) then
						CurrentNpc = RangeNpc[ Index ]
						CastSpell( Ctrl, Ctrl, BurningFx )
						Flame = CreateObj( 123759, x, y-1, z, dir, 1 )
						SetModeEx( Flame, EM_SetModeType_Mark, false )
						SetModeEx( Flame, EM_SetModeType_Gravity, false )
						AddToPartition( Flame, 0 )
						BurningStatus = 1
						break
					end
				end
			end
		else	OnReset = true
			for Index = 0, #RangeNpc, 1 do
				if ( CheckID( RangeNpc[ Index ] ) == true and RangeNpc[ Index ] == CurrentNpc ) then
					OnReset = false
					break
				end
			end
			BurningStatus = BurningStatus + 1
			--DebugMsg( 0, 0, "BurningStatus : "..BurningStatus.." / ".."OnReset : "..tostring( OnReset ) )
			RandNum = DW_Rand( 5 )
			if ( BurningStatus >= RandNum + 5 and OnReset == true ) then
				CurrentNpc = 0
				BurningStatus = 0
				DelObj( Flame )
				Sleep( 100 )
			end
		end
		Sleep( 30 )
	end
end
----------------------------------------------------------------------------------------------------