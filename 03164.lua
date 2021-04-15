----------------------------------------------------------------------------------------------------
Function Z32_NPC108715DEAD_00()--船員的死亡劇情
	local NPC = OwnerID()
	local Player = TargetID()
	local RequireQuest_1 = 427129
	local RequireQuest_2 = 427211
	local KeyItem = 103751
	if CheckAcceptQuest( Player, RequireQuest_1 ) == true or
	CheckAcceptQuest( Player, RequireQuest_2 ) == true then
		DW_QietKillOne( Player, KeyItem )
	end
	MoveToFlagEnabled( NPC, true )
	return true
End
Function Z32_NPC108718DEAD_00()--航海士的死亡劇情
	local NPC = OwnerID()
	local Player = TargetID()
	local RequireQuest_1 = 427129
	local RequireQuest_2 = 427211
	local KeyItem = 103751
	if CheckAcceptQuest( Player, RequireQuest_1 ) == true or
	CheckAcceptQuest( Player, RequireQuest_2 ) == true then
		DW_QietKillOne( Player, KeyItem )
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123765SK_00()--將失竊的文物交給總務官
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427132
	local QuestItem = 203446
	local KeyItem = 542687
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427132_1]", "Z32_NPC123765SK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123765SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427132
	local QuestItem = 203446
	local KeyItem = 542687
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123811SK_00()--將瓶中信交給辛巴
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427133
	local QuestItem = 203447
	local KeyItem = 542681
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427133_1]", "Z32_NPC123811SK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123811SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427133
	local QuestItem = 203447
	local KeyItem = 542681
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427180CITIZEN_00()--將糧票分發給居民
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest1 = 427180
	local RequiredQuest2 = 427217
	local QuestItem = 203723
	local KeyItem = 103752
	if (CheckAcceptQuest( Player, RequiredQuest1 ) == true or
	CheckAcceptQuest( Player, RequiredQuest2 ) == true) and
	CountBodyItem( Player, QuestItem ) >= 1 then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427180_1]", "Z32_Q427180CITIZEN_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_Q427180CITIZEN_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local Index = 502257
	local RequiredQuest = 427180
	local QuestItem = 203723
	local KeyItem = 103752
	local Answer = 0
	if CheckBuff( NPC, Index ) == true then
		Answer = DW_Rand( 3 )
		if Answer == 1 then
			NpcSay( NPC, "[SC_Z32Q427180_2]" )
		elseif Answer == 2 then
			NpcSay( NPC, "[SC_Z32Q427180_3]" )
		else	
			NpcSay( NPC, "[SC_Z32Q427180_4]" )
		end
		CloseSpeak( Player )
		return
	end
	if (CheckAcceptQuest( Player, RequiredQuest1 ) == true or
	CheckAcceptQuest( Player, RequiredQuest2 ) == true) and
	CountBodyItem( Player, QuestItem ) >= 1 then
		AddBuff( NPC, Index, 0, 30 )
		DW_QietKillOne( Player, KeyItem )
		DelBodyItem( Player, QuestItem, 1 )
		NpcSay( NPC, "[SC_Z32Q427180_5]" )
	end
	CloseSpeak( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123803SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest_1 = 427181
	local RequiredQuest_2 = 427182
	local KeyItem_1 = 542682	--與孤兒安諾對話
	local KeyItem_2= 542683	--將裝備交給安諾
	local QuestItem = 203724	-- 隼之團制式裝備
	if CheckAcceptQuest( Player, RequiredQuest_1 ) == true and
	CheckFlag( Player, KeyItem_1 ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427181_1]", "Z32_NPC123803SK_01", 0 )
	end
	if CheckAcceptQuest( Player, RequiredQuest_2 ) == true and
	CheckFlag( Player, KeyItem_2 ) == false and CountBodyItem( Player, QuestItem ) >= 1 then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427181_3]", "Z32_NPC123803SK_02", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123803SK_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427181
	local KeyItem = 542682
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		SetFlag( Player, KeyItem, 1 )
		SetSpeakDetail( Player, GetString("SC_Z32Q427181_2") )
	else	CloseSpeak( Player )
	end
End
Function Z32_NPC123803SK_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427182
	local KeyItem = 542683
	local QuestItem = 203724	-- 隼之團制式裝備
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false and CountBodyItem( Player, QuestItem ) >= 1 then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 ); 
		SetSpeakDetail( Player, GetString("SC_Z32Q427181_4") )
	else	CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123804SK_00()--向隼之團工匠取得隼之團制式裝備
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427182
	local QuestItem = 203724
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) == 0 then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427182_1]", "Z32_NPC123804SK_01", 0 )--東西交出來
	end
	LoadquestOption( Player )
End
Function Z32_NPC123804SK_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest_1 = 427182
	local RequiredQuest_2 = 427183
	local QuestItem = 203724
	if CheckAcceptQuest( Player, RequiredQuest_1 ) ~= true or
	CountBodyItem( Player, QuestItem ) >= 1 then
		CloseSpeak( Player )
	end
	SetSpeakDetail( Player, GetString( "SC_Z32Q427182_2" ) )--幫忙就給
	if CheckCompleteQuest( Player, RequiredQuest_2 ) == true then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427182_3]", "Z32_NPC123804SK_02", 0 )--我已經幫過忙了
	else
		AddSpeakOption( Player, NPC, "[SC_Z32Q427182_4]", "Z32_NPC123804SK_03", 0 )--是要我幫什麼忙
	end	
End
Function Z32_NPC123804SK_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427182
	local QuestItem = 203724
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) == 0 then
		GiveBodyItem( Player, QuestItem, 1 )	
	end
	CloseSpeak( Player )
End
Function Z32_NPC123804SK_03()
	LoadquestOption( OwnerID() )	
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123681SK_00()--與裂水前線隊長對話合作辦案
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427189
	local KeyItem = 542684
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427189_1]", "Z32_NPC123681SK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123681SK_01()
	local Player = OwnerID()
	local RequiredQuest = 427189
	local KeyItem = 542684
	if CheckAcceptQuest( Player, RequiredQuest ) == true then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z30_Q427192COMPLETE_00()--根據玩家性別產生不同任務發展
	local Ctrl = OwnerID()
	local Player = TargetID()
	local Gender = ReadRoleValue( Player, EM_RoleValue_SEX )
	local ClientItem = 542688
	if Gender == 1 then
		SetFlag( Player, ClientItem, 1 )
	end
End
Function Z32_NPC123813_00()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
End
Function Z32_NPC123813SK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427192
	local QuestItem = 203943
	local KeyItem = 542686
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 and
	CheckFlag( Player, KeyItem ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427192_1]", "Z32_NPC123813SK_01", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123813SK_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427192
	local QuestItem = 203943
	local KeyItem = 542686
	local BlankFx = 500429
	local Gender = ReadRoleValue( Player, EM_RoleValue_SEX )
	local ClientItem = 542688
	local ClientBuff = 502258
	if CheckAcceptQuest( Player, RequiredQuest ) == true and
	CountBodyItem( Player, QuestItem ) >= 1 then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 )
		AddBuff( Player, BlankFx, 0, 2 )
	end
	if Gender == 1 then
		AddBuff( Player, ClientBuff, 0, 10 )
		SetFlag( Player, ClientItem, 1 )
	end
	CloseSpeak( Player )
	if ReadRoleValue( NPC, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		CallPlot( NPC, "Z32_NPC123813SK_02", Player, NPC, Gender )
	end
End
Function Z32_NPC123813SK_02( Player, NPC, Gender )
	local Ctrl = NPC
	local Gender = ReadRoleValue( Player, EM_RoleValue_SEX )
	local x, y, z, dir = 0
	local RoleObj = 0
	local RoleID = 123831
	Sleep( 20 )
	DebugMsg( 0, 0, Gender )
	if Gender == 1 then
		x, y, z, dir = DW_Location( Ctrl )
		RoleObj = CreateObj( RoleID, x, y, z, dir, 1 )
		AddToPartition( RoleObj, 0 )
		MoveToFlagEnabled( RoleObj, false )
		if CheckID( Player ) == true then
			AdjustFaceDir( RoleObj, Player, 0 )
		end
		Sleep( 10 ) NpcSay( RoleObj, "[SC_Z32Q427192_3]" )
		PlayMotion( RoleObj, ruFUSION_ACTORSTATE_EMOTE_CRY )
		Sleep( 15 )
		if CheckID( Player ) == true then
			AdjustFaceDir( RoleObj, Player, 100 )
		end
		Sleep( 05 ) SetDefIdleMotion( RoleObj, ruFUSION_MIME_RUN_FORWARD )
		Sleep( 20 ) DelObj( RoleObj )
	else
		MoveToFlagEnabled( Ctrl, false )
		if CheckID( Player ) == true then
			AdjustFaceDir( Ctrl, Player, 0 )
		end
		SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_1H )
		Sleep( 10 ) NpcSay( Ctrl, "[SC_Z32Q427192_2]" )		
		Sleep( 30 ) PlayMotion( Ctrl, ruFUSION_ACTORSTATE_CAST_INSTANT )
		Sleep( 40 ) SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_STAND )
		MoveToFlagEnabled( Ctrl, true )
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC108711DEAD_00()--海盜密探死亡劇情
	local NPC = OwnerID()
	local Player = TargetID()
	local RequireQuest_1 = 427194
	local RequireQuest_2 = 427225
	local KeyItem = 103753
	if CheckAcceptQuest( Player, RequireQuest_1 ) == true or
	CheckAcceptQuest( Player, RequireQuest_2 ) == true then
		DW_QietKillOne( Player, KeyItem )
	end
	return true
End
Function Z32_NPC108712DEAD_00()--無賴水手死亡劇情
	local NPC = OwnerID()
	local Player = TargetID()
	local RequireQuest_1 = 427194
	local RequireQuest_2 = 427225
	local KeyItem = 103753
	if CheckAcceptQuest( Player, RequireQuest_1 ) == true or
	CheckAcceptQuest( Player, RequireQuest_2 ) == true then
		DW_QietKillOne( Player, KeyItem )
	end
	return true
End
----------------------------------------------------------------------------------------------------
--108713海盜術士、108716海盜酒鬼、108717火砲手、108723居民、108724居民死亡劇情
Function Z32_Q427196KILLNPC_00()
	local NPC = OwnerID()
	local Player = TargetID()
	local RequireQuest_1 = 427196
	local RequireQuest_2 = 427227
	local KeyItem = 103754
	if CheckAcceptQuest( Player, RequireQuest_1 ) == true or
	CheckAcceptQuest( Player, RequireQuest_2 ) == true then
		DW_QietKillOne( Player, KeyItem )
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427197TOUCH_00()--在海盜的飲食裡下毒
	local Player = OwnerID()
	local TouchObj = TargetID()
	local FoodID = 123819
	local MushroomsID = 123818
	local QuestItem = 204516
	local KeyItem = 103755
	if CheckID( Player ) == false then
		return false
	end
	if ReadRoleValue( TouchObj, EM_RoleValue_OrgID ) == FoodID then
		if CountBodyItem( Player, QuestItem ) == 0 then
			ScriptMessage( Player, Player, 2, "[SC_Z32Q427197_00]", 0 )--你什麼也沒有滲進去
			return false
		end
		DelBodyItem( Player, QuestItem, 1 )
		DW_QietKillOne( Player, KeyItem )
	elseif ReadRoleValue( TouchObj, EM_RoleValue_OrgID ) == MushroomsID then
		ScriptMessage( Player, Player, 2, "[SC_Z32Q427197_01]", 0 )--取得了蘑菇
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427199TOUCH_00()--將紙條塞入空酒瓶
	local Player = OwnerID()
	local TouchObj = TargetID()
	local QuestItem = 204517
	local KeyItem = 103756
	if CountBodyItem( Player, QuestItem ) == 0 then
		return false
	end
	DelBodyItem( Player, QuestItem, 1 )
	DW_QietKillOne( Player, KeyItem )
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123824_00()
	local Ctrl = OwnerID()
	local x, y, z, dir = DW_Location( Ctrl )
	local BookID = 123867
	local FxID = 123868
	local BookObj = CreateObj( BookID, x, y+8, z, dir, 1 )
	local BookFX = CreateObj( FxID, x, y+8, z, dir, 1 )
	SetModeEx( BookObj, EM_SetModeType_Gravity, false )
	SetModeEx( BookObj, EM_SetModeType_Mark, false )
	SetModeEx( BookFX, EM_SetModeType_Gravity, false )
	SetModeEx( BookFX, EM_SetModeType_Mark, false )
	AddToPartition( BookObj, 0 )
	AddToPartition( BookFX, 0 )
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, BookObj )
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, BookFX )
	SetPlot( Ctrl, "touch", "Z32_Q427135TOUCH_00", 10 )
End
----------------------------------------------------------------------------------------------------
Function Z32_Q427135TOUCH_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local StopMove = 623132
	local BookBuff = {}
	BookBuff[ 1 ] = 501609
	BookBuff[ 2 ] = 502086
	BookBuff[ 3 ] = 502087
	BookBuff[ 4 ] = 502088
	BookBuff[ 5 ] = 502089
	local Num = DW_Rand( 5 )
	AddBuff( Player, StopMove, 0, 6 )
	AddBuff( Player, BookBuff[ Num ], 0, 4 )
	SetPlot( NPC, "touch", "", 0 )
	BeginCastBarEvent( Player, NPC, "[SC_Z32Q427135_03]", 40, ruFUSION_ACTORSTATE_READING_BEGIN, ruFUSION_ACTORSTATE_READING_END, 0, "Z32_Q427135TOUCH_01" )
End
Function Z32_Q427135TOUCH_01( Player, CheckStatus )--取得古代典籍
	local Player = OwnerID()
	local Book = TargetID()
	local BookFX1 = ReadRoleValue( Book, EM_RoleValue_Register1 )
	local BookFX2 = ReadRoleValue( Book, EM_RoleValue_Register2 )
	local QuestItem = 203449
	local RandBuff = 500639
	local BuffPos = 0
	local BuffLv = 0
	local CurrentNum = 0
	local RandNum = 0
	SetPlot( Book, "touch", "Z32_Q427135TOUCH_00", 10 )
	EndCastBar( Player, CheckStatus )
	if CheckStatus <= 0 then
		return
	end
	if CheckID( Player ) == false or CountBodyItem( Player, QuestItem ) >= 5 or
	( CheckAcceptQuest( Player, 427135 ) == false and CheckAcceptQuest( Player, 427215 ) == false ) then
		ScriptMessage( Player, Player, 2, "[SC_Z32Q427135_00]", 0 )
		return
	end
	AddBuff( Player, RandBuff, 0, -1 )
	BuffPos = Lua_BuffPosSearch( Player, RandBuff )
	BuffLv = BuffInfo( Player, BuffPos, EM_BuffInfoType_Power )
	CurrentNum = 4 - BuffLv
	RandNum = DW_Rand( CurrentNum )
	if RandNum == 1  then
		GiveBodyItem( Player, QuestItem, 1 )
		CancelBuff( Player, RandBuff )
	elseif RandNum == 2 or RandNum == 4 then
		ScriptMessage( Player, Player, 2, "[SC_Z32Q427135_01]", 0 )
	elseif RandNum == 3 or RandNum == 5 then
		ScriptMessage( Player, Player, 2, "[SC_Z32Q427135_02]", 0 )		
	end
	if CheckID( BookFX1 ) == true then
		DelObj( BookFX1 )
		WriteRoleValue( Book, EM_RoleValue_Register1, 0 )
	end
	if CheckID( BookFX2 ) == true then
		DelObj( BookFX2 )
		WriteRoleValue( Book, EM_RoleValue_Register2, 0 )
	end
	CallPlot( Book, "LuaFunc_ResetObj", Book )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC103760Combat_00()--戰鬥表演
	local Ctrl = OwnerID()
	LockHP( Ctrl, ReadRoleValue( Ctrl, EM_RoleValue_MaxHP )*0.25 , "Lua_424225_LockHP" )
	SetFlag( Ctrl, 544801, 1 )--關閉帕奇鼠
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_POLEARM )
	local StopMove = 623132
	AddBuff( Ctrl, StopMove, 0, -1 )
	local BaseX, BaseY, BaseZ, dir = DW_Location( Ctrl )
	local Radius = 40
	local RandPoly = DW_Rand( 360 )
	local Degree = RandPoly*math.pi/180
	local x = BaseX+Radius*math.cos( Degree )
	local y = BaseY
	local z = BaseZ+Radius*math.sin( Degree )
	local ObjID = {}
	ObjID[ 1 ] = 103757
	ObjID[ 2 ] = 103758
	ObjID[ 3 ] = 103759
	local RandNum = DW_Rand( #ObjID )
	local Enemy = CreateObj( ObjID[ RandNum ], x, y, z, dir, 1 )
	SetModeEx( Enemy, EM_SetModeType_Fight, false )
	SetModeEx( Enemy, EM_SetModeType_Searchenemy, false )
	SetFlag( Enemy, 544801, 1 )--關閉帕奇鼠
	AddToPartition( Enemy, 0 )
	WriteRoleValue( Enemy, EM_RoleValue_Register1, Ctrl )
	AddBuff( Enemy, StopMove, 0, 2 )
	MoveToFlagEnabled( Enemy, false )
	AdjustFaceDir( Enemy, Ctrl, 0 )
	PlayMotion( Enemy, ruFUSION_ACTORSTATE_COMBAT_2H )
	RandNum = DW_Rand( 5 )
	if RandNum == 1 then
		NpcSay( Enemy, "[SC_NPC103759_1]" )
	end
	LockHP( Enemy, ReadRoleValue( Enemy, EM_RoleValue_MaxHP )*0.33, "Z32_NPC103760Combat_01" )
	Sleep( 20 )
	SetModeEx( Enemy, EM_SetModeType_Fight, true )
	SetModeEx( Enemy, EM_SetModeType_Searchenemy, true )
	SetAttack( Enemy, Ctrl )
End
Function Z32_NPC103760Combat_01()
	local Enemy = OwnerID()
	local Ctrl = ReadRoleValue( Enemy, EM_RoleValue_Register1 )
	if CheckID( Ctrl ) == true then
		BeginPlot( Ctrl, "Z32_NPC103760Combat_00", 0 )
	end
	LockHP( Enemy, -1, "" )
End
----------------------------------------------------------------------------------------------------
Function Z32_SetQuestFlag_00( CurrentFlag, NextFlag, PEScore ) --任務完成後執行
	local NPC = OwnerID()
	local Player = TargetID()
	if ( PEScore ~= nil and PEScore >= 0 ) then
		Lua_ZonePE_3th_GetScore( PEScore )
	end 
	if CheckFlag( Player, CurrentFlag ) == true then --"CurrentFlag"當前身上既有的任務前置條件（重要物品）
		SetFlag( Player, CurrentFlag, 0 )
	end
	SetFlag( Player, NextFlag, 1 ) --"NextFlag"後續任務所需的任務前置條件（重要物品）
	DisableQuest( NPC, false )
End
----------------------------------------------------------------------------------------------------