----------------------------------------------------------------------------------------------------
Function Z32_Q427124MSG_00()--於事件觸發劇情（701584）裡被執行，加在Type5，角色登入時的判斷底下。
	local Player = OwnerID()
	local PlayerLv = ReadRoleValue( Player, EM_RoleValue_LV )
	local RequiredLv = 93
	local TargetQuest = 427124
	local CurrentZoneID = ReadRoleValue( Player, EM_RoleValue_ZoneID )
	local SkillBuff = 500607
	local CheckItem = 542677
	local TestJob = ReadRoleValue( Player, EM_RoleValue_VOC )
	--if TestJob ~= 0 then--測試職業為GM
	if TestJob == 0 then--測試職業不為GM
		--say(Player ,"00")
		return
	end
	if ( CheckID( Player ) == false or
	PlayerLv < RequiredLv or
	CheckCompleteQuest( Player, TargetQuest ) == true ) then
		--say(Player ,"11")
		return
	end
	if CheckAcceptQuest( Player, TargetQuest ) == false then
		ScriptMessage( Player, Player, 2, "[SC_Q427124MSG_00]", 0 )
		if CheckFlag( Player, CheckItem ) == false and
		CurrentZoneID ~= 2 then
			AddBuff( Player, SkillBuff, 0, -1 )
		end
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_BUFF500608_00()--使用技能490605後執行
	local Player = OwnerID()
	local ZoneID = 2
	local x, y, z, dir = 5744.9, 69.1, -4091.4, 329.2
	--local ZoneID = 946
	--local x, y, z, dir = -36.1, -257.2, 82.9, 10.7
	local CheckItem = 542677
	local SkillBuff = 500607
	local Buff_FX = 500629
	SetFlag( Player, CheckItem, 1 )
	CancelBuff( Player, SkillBuff )
	AddBuff( Player, Buff_FX, 0, 12 )
	ChangeZone( Player, ZoneID, -1, x, y+30, z, dir )
End
----------------------------------------------------------------------------------------------------
--執行傳送特效關聯劇情
Function Z32_NPC123673_00()
	local Ctrl = OwnerID()
	SetPlot( Ctrl, "range", "Z32_NPC123673_01", 40 )
End
Function Z32_NPC123673_01()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local Buff_FX = 500629
	if CheckID( Player ) == false then
		return
	end
	if CheckBuff( Player, Buff_FX ) == true then
		SetPlot( Ctrl, "range", "", 0 )
		CallPlot( Ctrl, "Z32_NPC123673_02", Ctrl, Player )
	end
End
Function Z32_NPC123673_02( Ctrl, Player )
	local Buff_FX = 500629
	AddBuff( Ctrl, Buff_FX, 0, 8 )
	MoveToFlagEnabled( Ctrl, false )
	AdjustFaceDir( Ctrl, Player, 0 )
	PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	NpcSay( Ctrl, "[SC_NPC123673_03]" )
	Sleep( 100 )
	MoveToFlagEnabled( Ctrl, true )
	SetPlot( Ctrl, "range", "Z32_NPC123673_01", 40 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123673SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427124
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetSpeakDetail( Player, GetString( "SC_NPC123673_01" ) )
		AddSpeakOption( Player, NPC, "[SC_NPC123673_02]", "Z32_NPC123673SK_01", 0 )
	else
		LoadquestOption( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123673SK_01()
	local Player = OwnerID()
	local ZoneID = 32
	local x, y, z, dir = -12504.7, 112.5, -17415.8, 271.7
	--local ZoneID = 946
	--local x, y, z, dir = -36.1, -257.2, 82.9, 10.7
	local KeyItem = 542620
	local TeleportItem = 548978--開啟裂水台地傳點
	local Immobile = 623132
	local Buff_FX = 500429
	local Buff_FX_02 = 500629
	AddBuff( Player, Immobile, 0, 3 )
	AddBuff( Player, Buff_FX, 0, 2 )
	AddBuff( Player, Buff_FX_02, 0, 20 )
	ChangeZone( Player, ZoneID, -1, x, y+50, z, dir )
	SetFlag( Player, KeyItem, 1 )
	SetFlag( Player, TeleportItem, 1 )
	CloseSpeak( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123678_00()--科蓮娜．溫德索特初始劇情
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--執行"Z32_Q427125ACCEPT_00"的判斷條件
	SetPlot( Ctrl, "range", "Z32_NPC123678_01", 100 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123678_01()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local RequiredQuest = 427124
	local KeyItem = 542620
	local Buff_FX = 500629
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == true and
	CheckBuff( Player, Buff_FX ) == true then
		SetPlot( Ctrl, "range", "", 0 )
		CallPlot( Ctrl, "Z32_NPC123678_02", Ctrl, Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123678_02( Ctrl, Player )
	local Immobile = 623132
	AddBuff( Player, Immobile, 0, 2 )
	MoveToFlagEnabled( Ctrl, false )
	AdjustFaceDir( Ctrl, Player, 0 )
	Sleep( 10 ) PlayMotion( Ctrl, ruFUSION_ACTORSTATE_EMOTE_WAVE )
	Sleep( 10 ) NpcSay( Ctrl, "[SC_Z32NPC123678_2]" )
	Sleep( 30 ) MoveToFlagEnabled( Ctrl, true )
	SetPlot( Ctrl, "range", "Z32_NPC123678_01", 100 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123678SK_00()--科蓮娜．溫德索特對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427124--黑夜前兆
	local KeyItem = 542620--傳送至風鹽堡
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32NPC123678_1]", "Z32_NPC123678SK_01", 0 )
	end
	--LoadquestOption( Player )
	LoadQuestOption( OwnerID() )
End
Function Z32_NPC123678SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427124--黑夜前兆
	local KeyItem = 542620--傳送至風鹽堡
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427125ACCEPT_00()--接受任務"造訪風鹽堡"後執行
	local Ctrl=OwnerID()
	local Player=TargetID()
	local CheckItem = 542677--檢查玩家是否已使用過法術集合490605
	SetFlag( Player, CheckItem, 0 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CallPlot( Ctrl, "Z32_Q427125ACCEPT_01", Ctrl, Player )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427125ACCEPT_01( Ctrl, Player )
	local RequiredQuest = 427125
	local ClientItem = 243239
	local ClientBuff = 500609
	local x, y, z, dir = DW_Location( Ctrl )
	local NPC = CreateObj( 123680, x, y, z, dir, 1 )
	AddToPartition( NPC, 0 )
	MoveToFlagEnabled( NPC, false )
	AddBuff( Player, ClientBuff, 0, 9 )
	AdjustFaceDir( NPC, Player, 0 )
	Sleep( 15 ) NpcSay( NPC, "[SC_Z32NPC123678_3]" )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_CUTE2 )
	Sleep( 25 ) 
	if CheckID( Player ) == true then
		AdjustFaceDir( NPC, Player, -40 )
	end
	SetDefIdleMotion( NPC, ruFUSION_MIME_WALK_FORWARD )
	Sleep( 10 ) DelObj( NPC )
	Sleep( 15 ) WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
--風鹽堡守衛關聯劇情
Function Z32_CASTLE_GUARDIN_00()
	local Ctrl = OwnerID()
	SetPlot( Ctrl, "range", "Z32_CASTLE_GUARDIN_01", 100 )
End
Function Z32_CASTLE_GUARDIN_01()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local NearPlayers = {}
	local KickOutList = {}
	local KickOutListAmount = 0
	local Num = 0
	local RequiredQuest = 427125--造訪風鹽堡
	local PassItem = 243239
	local Immobile = 623132
	NearPlayers = SearchRangePlayer( Ctrl, 150 )
	for i = 0, table.getn( NearPlayers )-1, 1 do
		if ( CheckAcceptQuest( NearPlayers[ i ], RequiredQuest ) == false or
		CountBodyItem( NearPlayers[ i ], PassItem ) ==0 ) then
			if CheckCompleteQuest( NearPlayers[ i ], RequiredQuest ) == false then	
				Num = Num + 1
				table.insert( KickOutList, Num, NearPlayers[ i ] )
				AddBuff( KickOutList[ Num ], Immobile, 0, 2 )
			end
		end
	end
	KickOutListAmount = table.getn( KickOutList )
	if KickOutListAmount == 0 then return
	else		
		SetPlot( Ctrl, "range", "", 0 )
		CallPlot( Ctrl, "Z32_CASTLE_GUARDIN_02", Ctrl, Player, KickOutList )
	end
End
Function Z32_CASTLE_GUARDIN_02( Ctrl, Player, KickOutList )
	local ZoneID = 32
	local x, y, z, dir = -12239.6, 193.0, -16313.6, 312.5
	--local ZoneID = 946
	--local x, y, z, dir = -36.1, -257.2, 82.9, 10.7
	local Buff_FX = 500429
	MoveToFlagEnabled( Ctrl, false )
	Sleep( 05 ) AdjustFaceDir( Ctrl, Player, 0 )
	Sleep( 05 ) SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	NpcSay( Ctrl, "[SC_NPC123683_01]" )
	Sleep( 10 )
	for i = 1, table.getn( KickOutList ), 1 do
		if CheckID( KickOutList[ i ] ) == true then
			AddBuff( Player, Buff_FX, 0, 2 )
			ChangeZone( Player, ZoneID, -1, x, y+50, z, dir )
		end
	end
	Sleep( 20 ) SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_STAND )
	MoveToFlagEnabled( Ctrl, true )
	SetPlot( Ctrl, "range", "Z32_CASTLE_GUARDIN_01", 100 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123679SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427125
	local KeyItem = 548400
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427125_1]", "Z32_NPC123679SK_01", 0 )
	end
	LoadquestOption( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123679SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427125
	local KeyItem = 548400
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
--裂水前線代表關聯劇情
Function Z32_NPC123674_00()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_NPC123674SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427126
	local KeyItem = 542616
	local SpeakStr = "SC_Z32Q427126_1"
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
	else	
		LoadquestOption( Player )
		return
	end
	if CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		if ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
			CallPlot( NPC, "Z32_NPC123674SHOW_00", NPC, Player )
		end
	end
End
Function Z32_NPC123674SHOW_00( NPC, Player )
	MoveToFlagEnabled( NPC, false )
	AdjustFaceDir( NPC, Player, 0 )
	Sleep( 05 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 15 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_KICK )
	Sleep( 20 ) 
	if CheckID( Player ) == true then
		AdjustFaceDir( NPC, Player, 60 )
	end
	Sleep( 10 ) MoveToFlagEnabled( NPC, true )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
--貝奧曲農場代表關聯劇情
Function Z32_NPC123675_00()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_NPC123675SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427126
	local KeyItem = 542617
	local SpeakStr = "SC_Z32Q427126_2"
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
	else	
		LoadquestOption( Player )
		return
	end
	if CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		if ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
			CallPlot( NPC, "Z32_NPC123675SHOW_00", NPC, Player )
		end
	end
End
Function Z32_NPC123675SHOW_00( NPC, Player )
	MoveToFlagEnabled( NPC, false )
	AdjustFaceDir( NPC, Player, 0 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 20 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 10 ) MoveToFlagEnabled( NPC, true )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
--鎮北要塞代表關聯劇情
Function Z32_NPC123676_00()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_NPC123676SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427126
	local KeyItem = 542618
	local SpeakStr = "SC_Z32Q427126_3"
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
	else	
		LoadquestOption( Player )
		return
	end
	if CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		if ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
			CallPlot( NPC, "Z32_NPC123676SHOW_00", NPC, Player )
		end
	end
End
Function Z32_NPC123676SHOW_00( NPC, Player )
	MoveToFlagEnabled( NPC, false )
	AdjustFaceDir( NPC, Player, 0 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 10 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 20 ) MoveToFlagEnabled( NPC, true )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
--格雷恩莊園代表關聯劇情
Function Z32_NPC123677_00()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_NPC123677SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427126
	local KeyItem = 542619
	local SpeakStr = "SC_Z32Q427126_4"
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetSpeakDetail( Player, GetString( SpeakStr ) )
	else	
		LoadquestOption( Player )
		return
	end
	if CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		if ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 then
			WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
			CallPlot( NPC, "Z32_NPC123677SHOW_00", NPC, Player )
		end
	end
End
Function Z32_NPC123677SHOW_00( NPC, Player )
	MoveToFlagEnabled( NPC, false )
	AdjustFaceDir( NPC, Player, 0 )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_CUTE2 )
	Sleep( 30 )
	MoveToFlagEnabled( NPC, true )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123682SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427153
	local KeyItem = 548401
	if ( CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false ) then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427153_1]", "Z32_NPC123682SK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123682SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427153
	local KeyItem = 548401
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_ITEM243241CHECK_00()--使用航海士服檢查
	local Player = OwnerID()
	local RequiredQuest = 427155
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		return true
	else
		return false
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_ITEM243241USED_00()--使用航海士服後變身
	local Player = OwnerID()
	local QuestBuff = 500616
	CastSpell( Player, Player, 850582 )
	AddBuff( Player, QuestBuff, 0, -1 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123687SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427155
	local KeyItem = 549107
	if ( CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false ) then
		SetSpeakDetail( Player, GetString( "SC_Z32Q427155_2" ) )
		AddSpeakOption( Player, NPC, "[SC_Z32Q427155_1]", "Z32_NPC123687SK_01", 0 )
	else
		LoadquestOption( Player )
	end
End
Function Z32_NPC123687SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427155
	local KeyItem = 549107
	local CostumeSuits = 243241
	local CostumeBuff = 500616
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckBuff( Player, CostumeBuff ) == true then
		SetFlag( Player, KeyItem, 1 )
		CancelBuff( Player, CostumeBuff )
		if CountBodyItem( Player, CostumeSuits ) == 1 then
			DelBodyItem( Player, CostumeSuits, 1 )
		end
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
--點擊火藥桶引爆關聯劇情
Function Z32_Q427156TOUCH_CHECK()
	local Player = OwnerID()
	local Gunpowder = TargetID()
	local QuestItem = 243243
	if CountBodyItem( Player, QuestItem ) >= 1 then
		ScriptMessage( Player, Player, 2, "[SC_Z32ITEM243243USED_00]", 0 )
		--DelBodyItem( Player, QuestItem, 1 )
		return true
	end
	return false
End
Function Z32_Q427156TOUCH_USED()
	local Player = OwnerID()
	local Gunpowder = TargetID()
	local QuestTarget = 108932
	local QuestItem = 243243
	DelBodyItem( Player, QuestItem, 1 )
	DW_QietKillOne( Player, 108932 )
	CallPlot( Gunpowder, "Z32_NPC123684EXPLODED_00", Gunpowder, Player )
	return true
End
Function Z32_NPC123684EXPLODED_00( Ctrl, Player )
	local Num = 0
	local DelayTime = 0
	local Gunpowders = {}
	local GunpowderID = 123684
	local ExplodedObj = {}
	local ExplodedSpell = 490607
	local FireID = 123701
	local Fires = {}
	local FireAmount = Rand( 3 ) + 3
	Gunpowders = SearchRangeNPC( Ctrl, 70 )--Ctrl的法術爆炸範圍
	ExplodedObj[ 1 ] = Ctrl
	Num = 2
	for i = 0, table.getn( Gunpowders ), 1 do
		if CheckID( Gunpowders[ i ] ) == true then
			if ReadRoleValue( Gunpowders[ i ], EM_RoleValue_OrgID ) == GunpowderID and
			Gunpowders[ i ] ~= Ctrl then
				table.insert( ExplodedObj, Num, Gunpowders[ i ] )
				Num = Num + 1
			end
		end		
	end
	Num = Rand( 2 ) + 1
	DelayTime = Num*10
	Sleep( DelayTime )
	for j = 1, table.getn( ExplodedObj ), 1 do
		if CheckID( ExplodedObj[ j ] ) == true then
			CastSpell( ExplodedObj[ j ], ExplodedObj[ j ], ExplodedSpell )
			DelayTime = DW_Rand( 6 ) + 5
			Sleep( DelayTime )
		end
	end
	Sleep( 10 ) Fires = Lua_CreateObjToRandownPos( Ctrl, FireID, Num, 120, true )
	for k = 1, table.getn( Fires ), 1 do
		BeginPlot( Fires[ k ], "Z32_NPC123684EXPLODED_01", 0 )
	end
	Sleep( 10 )
	for m = 2, table.getn( ExplodedObj ), 1 do
		if CheckID( ExplodedObj[ m ] ) == true then
			CallPlot( ExplodedObj[ m ], "LuaFunc_ResetObj", ExplodedObj[ m ] )
			DelayTime = DW_Rand( 2 )
			Sleep( DelayTime )
		end
	end
	CallPlot( Ctrl, "LuaFunc_ResetObj", Ctrl )
End
Function Z32_NPC123684EXPLODED_01()
	local Num = DW_Rand( 3 ) + 2
	local DelayTime = Num*10
	Sleep( DelayTime )
	DelObj( OwnerID() )
End
----------------------------------------------------------------------------------------------------
Function Z32_BUFF500617_00()
	local Player = OwnerID()
	local RequiredQuest = 427155
	local CostumeBuff = 500616
	if CheckAcceptQuest( Player, RequiredQuest ) == false then
		CancelBuff( Player, CostumeBuff )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123682_00()
	--將執行"Z32_Q427154COMPLETED_00"的開關初始化
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_Q427154COMPLETED_00()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local Switch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if Switch == 1 then return
	else
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CallPlot( Ctrl, "Z32_Q427154COMPLETED_01", Ctrl, Player )
	end
End
Function Z32_Q427154COMPLETED_01( Ctrl, Player )
	local ObjDBID = 123692
	local x, y, z, dir = DW_Location( Ctrl )
	local NPC = CreateObj( ObjDBID, x, y, z, dir, 1 )
	local ClientBuff = 500618
	local Spell_FX = 850582
	local Buff_FX = 500429
	AddToPartition( NPC, 0 )
	AddBuff( Player, ClientBuff, 0, 4 )
	MoveToFlagEnabled( NPC, false )
	Sleep( 10 ) NpcSay( NPC, "[SC_Z32NPC123692_00]" )
	PlayMotion( NPC, ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( 25 )
	if CheckID( Player ) == true then
		AddBuff( Player, Buff_FX, 0, 2 )
	end
	Sleep( 15 ) DelObj( NPC )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123686_00()
	--將執行"Z32_Q427155ACCEPT_00"的開關初始化
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_Q427155ACCEPT_00()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local Switch = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
	if Switch == 1 then return
	else
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CallPlot( Ctrl, "Z32_Q427155ACCEPT_01", Ctrl, Player )
	end
End
Function Z32_Q427155ACCEPT_01( Ctrl, Player )
	local ObjDBID = 123693
	local x, y, z, dir = DW_Location( Ctrl )
	local NPC = CreateObj( ObjDBID, x, y, z, dir, 1 )
	local ClientBuff = 500619
	AddBuff( Player, ClientBuff, 0, 5 )
	AddToPartition( NPC, 0 )
	MoveToFlagEnabled( NPC, false )
	Sleep( 10 ) NpcSay( NPC, "[SC_Z32NPC123693_00]" )
	if CheckID( Player ) == true then
		AdjustFaceDir( NPC, Player, 60 )
	end
	Sleep( 10 ) SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
	Sleep( 10 ) DelObj( NPC )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123687_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_SNEAK_FORWARD )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123702SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 425061
	local KeyItem = 542678
	if ( CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false ) then
		AddSpeakOption( Player, NPC, "[SC_Z32NPC123702_00]", "Z32_NPC123702SK_01", 0 )
	else
		LoadquestOption( Player )
	end
End
Function Z32_NPC123702SK_01()
	local Player = OwnerID()
	local RequiredQuest = 425061
	local KeyItem = 542678
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		SetSpeakDetail( Player, GetString( "SC_Z32NPC123702_01" ) )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------