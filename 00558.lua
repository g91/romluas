----------------------------------------------------------------------------------------------------
Function Z32_NPC123176_00()
	local NPC=OwnerID()
	local Switch01=WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )--將"Z32_Q424939ACCEPT_00"的執行條件初始化
End
----------------------------------------------------------------------------------------------------
Function Z32_Q424939ACCEPT_00()--接受任務"前往鎮北要塞"後執行
	local NPC=OwnerID()
	local Player=TargetID()
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
		Sleep( 05 ) NpcSay( NPC, "[SC_NPC123176_00]" )
		Sleep( 35 ) WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123354SPEAK_00()--羅溫．威廉斯
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 424939 )==true and
	CheckFlag( PID, 542603 )==false then
		AddSpeakOption( PID, NPC, "[SC_Z32Q424939_00]", "Z32_NPC123354SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 424992 )==true and
	CountBodyItem( PID, 201592 )>=1 and
	CheckFlag( PID, 542605 )==false then
		AddSpeakOption( PID, NPC, "[SC_Z32Q424992_00]", "Z32_NPC123354SPEAK_02", 0 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123354SPEAK_01()--與鎮北要塞的指揮官會面
	local PID=OwnerID()
	local NPC=TargetID()
	SetFlag( PID, 542603, 1 )
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123354SPEAK_02()--將監工日誌交給羅溫
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 424992 )==true and
	CountBodyItem( PID, 201592 )>=1 and
	CheckFlag( PID, 542605 )==false then
		SetFlag( PID, 542605, 1 )
		DelBodyItem( PID, 201592, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123534SPEAK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local RequireQuest_1 = 424988
	local RequireQuest_2 = 425794
	local KeyItem_1 = 542604
	local KeyItem_2 = 549113
	if CheckAcceptQuest( Player, RequireQuest_1 )==true and
	CheckFlag( Player, KeyItem_1 )==false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q424988_00]", "Z32_NPC123534SPEAK_01", 0 )--退隱遊俠老喬
	elseif CheckAcceptQuest( Player, RequireQuest_2 )==true and
	CheckFlag( Player, KeyItem_2 )==false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q424988_00]", "Z32_NPC123534SPEAK_02", 0 )--永遠的遊俠
	end
	LoadquestOption( Player )
End
Function Z32_NPC123534SPEAK_01()--尋找隱退的遊俠老喬
	local Player=OwnerID()
	local NPC=TargetID()
	local RequireQuest = 424988
	local KeyItem = 542604
	if CheckAcceptQuest( Player, RequireQuest )==true then
		SetFlag( Player, KeyItem, 1 )
	else
		CloseSpeak( Player )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123534SPEAK_02()--永遠的遊俠
	local Player=OwnerID()
	local NPC=TargetID()
	local RequireQuest = 425794
	local QuestItem = 201889
	local KeyItem = 549113
	if CheckAcceptQuest( Player, RequireQuest ) == true and
	CountBodyItem( Player, QuestItem ) > 0 then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, QuestItem, 1 ) 
	else
		CloseSpeak( Player )
	end
	LoadquestOption( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123534MOVE_00()--隱退的遊俠老喬
	local Ctrl = OwnerID()
	local Num = DW_Rand( 3 )
	local Dir = {}
	Dir[ 1 ] = 30
	Dir[ 2 ] = 60
	Dir[ 3 ] = 90
	MoveToFlagEnabled( Ctrl, false )
	SetDefIdleMotion( Ctrl, ruFUSION_MIME_IDLE_COMBAT_1H )
	AdjustFaceDir( Ctrl, Ctrl, Dir[ Num ] ) 
	for i = 1, Num, 1 do
		PlayMotion( Ctrl, ruFUSION_ACTORSTATE_ATTACK_1H )
		Sleep( 10 )
	end
	Sleep( 10 ) MoveToFlagEnabled( Ctrl, true )
End
----------------------------------------------------------------------------------------------------
--隼之團團長關聯對話劇情
Function Z32_NPC123537SPEAK_00()--隼之團團長
	local Player=OwnerID()
	local NPC=TargetID()
	if ( CheckAcceptQuest( Player, 424993 )==true and CountBodyItem( Player, 201592 )>=1 and CheckFlag( Player, 542606 )==false ) then
		AddSpeakOption( Player, NPC, "[SC_Z32Q424993_00]", "Z32_NPC123537SPEAK_01", 0 )
	elseif ( CheckAcceptQuest( Player, 425060 )==true and CheckFlag( Player, 542614 )==false ) then
		AddSpeakOption( Player, NPC, "[SC_Z32Q425060_00]", "Z32_NPC123537SPEAK_02", 0 )
	elseif ( CheckAcceptQuest( Player, 427158 )==true and CheckFlag( Player, 549108 )==false ) then
		AddSpeakOption( Player, NPC, "[SC_Z32Q427158_1]", "Z32_NPC123537SPEAK_03", 0 )
	elseif ( CheckAcceptQuest( Player, 427121 )==true and CountBodyItem(Player, 243253)>0 and CheckFlag(Player, 549114)==false ) then
		AddSpeakOption(Player,NPC, "[SC_Z32Q427121_1]", "LuaPG_427121_Give_Him_Letter_02(1)", 0 )
	end
	LoadquestOption( Player )
End
Function Z32_NPC123537SPEAK_01()--將監工日誌交給團長
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 424993 )==true and
	CountBodyItem( PID, 201592 )>=1 and
	CheckFlag( PID, 542606 )==false then
		SetFlag( PID, 542606, 1 )
		DelBodyItem( PID, 201592, 1 )
	end
	LoadquestOption( PID )
End
Function Z32_NPC123537SPEAK_02()--向團長回報調查結果
	local Player=OwnerID()
	local NPC=TargetID()
	local RequiredQuest = 425060
	local KeyItem = 542614
	if ( CheckAcceptQuest( Player, RequiredQuest )==true and CheckFlag( Player, KeyItem )==false and CountBodyItem( Player, 201593 ) >= 1 ) then
		SetFlag( Player, KeyItem, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
		return
	end
End
Function Z32_NPC123537SPEAK_03()--交出火藥庫存紀錄
	local Player = OwnerID()
	local NPC = TargetID()
	local RequiredQuest = 427158
	local KeyItem = 549108
	if ( CheckAcceptQuest( Player, RequiredQuest )==true and
	CheckFlag( Player, KeyItem )==false and
	CountBodyItem( Player, 243245 ) >= 1 ) then
		SetFlag( Player, KeyItem, 1 )
		DelBodyItem( Player, 243245, 1 )
		LoadquestOption( Player )
	else
		CloseSpeak( Player )
		return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123538_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123538SPEAK_00()
	local Player = OwnerID()
	local NPC = TargetID()
	if CheckAcceptQuest( Player, 424994 ) == true and
	CountBodyItem( Player, 201579 ) >= 1 and
	CheckFlag( Player, 542607 ) == false then
		AddSpeakOption( Player, NPC, "[SC_Z32Q424994_00]", "Z32_NPC123538SPEAK_01", 0 )
	end
	LoadquestOption( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123538SPEAK_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 424994 )==true and
	CountBodyItem( PID, 201579 )>=1 and
	CheckFlag( PID, 542607 )==false then
		SetFlag( PID, 542607, 1 )
		DelBodyItem( PID, 201579, 1 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z32_Q424998ACCEPT_00()--接受任務"未受邀的會議"時執行
	local Ctrl=OwnerID()
	local Player=TargetID()
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		CallPlot( Ctrl, "Z32_Q424998ACCEPT_01", Ctrl, Player )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q424998ACCEPT_01( Ctrl, Player )
	local Players = {}
	local x, y, z, dir = DW_Location( Ctrl )
	local NPC = CreateObj( 123541, x, y, z, dir, 1 )
	Players = SearchRangePlayer( Ctrl, 40 )
	for i = 0, table.getn( Players ), 1 do
		if CheckAcceptQuest( Players[ i ], 424998 ) == true then
			AddBuff( Players[ i ], 500597, 0, 5 )
		end
	end
	AddToPartition( NPC, 0 )
	MoveToFlagEnabled( NPC, false )
	Sleep( 15 ) NpcSay( NPC, "[SC_NPC123538_00]" )
	if CheckID( Player ) == true then
		AdjustFaceDir( NPC, Player, 0 )
	end
	PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep( 15 ) SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
	Sleep( 10 ) DelObj( NPC )
	Sleep( 15 )
	for j = 0, table.getn( Players ), 1 do
		if CheckID( Players[ j ] ) == true and
		CheckBuff( Players[ j ], 500597 ) == true then
			CancelBuff( Players[ j ], 500597 )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123549_00()
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--初始化"Z32_NPC123549_01"的執行條件
	SetPlot( Ctrl, "range", "Z32_NPC123549_01", 120 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123549_01()
	local Player = OwnerID()
	local Ctrl = TargetID()
	if CheckAcceptQuest( Player, 424998 ) == false or
	ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 1 then
		return
	else	SetPlot( Ctrl, "range", "", 0 )
		CallPlot( Ctrl, "Z32_NPC123549_02", Ctrl, Player )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123549_02( Ctrl, Player )
	local Players = {}
	local FlagID = 781413
	local ClientBuff = 500597
	local x, y, z, dir = 0
	local ObjID = 123541
	local NPC = 0
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
	Players = SearchRangePlayer( Ctrl, 150 )
	for i = 0, table.getn( Players ), 1 do
		AddBuff( Players[ i ], ClientBuff, 0, -1 )
	end
	x, y, z, dir = DW_Location( FlagID, 5 )
	NPC = CreateObj( ObjID, x, y, z, dir, 1 )
	AddToPartition( NPC, 0 )
	MoveToFlagEnabled( NPC, false )
	CastSpellPos( NPC, x, y, z, 850582, 0 )		
	PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP01 )
	Sleep( 10 )
	if CheckID( Player ) == true then
		AdjustFaceDir( NPC, Player, 0 )
		AddBuff( Player, 623132, 0, 3 )
	end
	Sleep( 10 ) NpcSay( NPC, "[SC_NPC123541_00]" )
	Sleep( 10 ) PlayMotion( NPC, ruFUSION_ACTORSTATE_BUFF_SP01 )
	Sleep( 20 ) FaceFlag ( NPC, FlagID, 1 ) AdjustDir( NPC, 0 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
	Sleep( 10 ) DelObj( NPC )
	Sleep( 10 )
	for j = 0, table.getn( Players ), 1 do
		if CheckID( Players[ j ] ) == true then
			CancelBuff( Players[ j ], ClientBuff )
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	SetPlot( Ctrl, "range", "Z32_NPC123549_01", 120 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123595_00()--攀登工具
	SetPlot( OwnerID(), "touch", "Z32_NPC123595_01", 30 ) 
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123595_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local FightMode = ReadRoleValue( Player, EM_RoleValue_AttackTargetID ) 
	local Pos = ReadRoleValue( NPC, EM_RoleValue_PID )
	if FightMode == 0 then
		SetPosByFlag( Player, 781413, Pos )		
	end
	return true
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123540_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )--初始化"Z32_Q424999ACCEPT_00"的執行條件
	WriteRoleValue( NPC, EM_RoleValue_Register2, 0 )--初始化"Z32_Q424999SHOW_00"的執行條件
	WriteRoleValue( NPC, EM_RoleValue_Register3, 0 )--初始化"Z32_Q425056ACCEPT_00"的執行條件
	WriteRoleValue( NPC, EM_RoleValue_Register4, 0 )--初始化"Z32_Q425056SHOW_00"的執行條件
	WriteRoleValue( NPC, EM_RoleValue_Register5, 0 )--初始化"Z32_Q425057ACCEPT_00"的執行條件
	SetPlot( NPC, "range", "Z32_NPC123540_01", 40 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123540_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 424998 )==true and
	CheckFlag( PID, 542608 )==false then
		SetFlag( PID, 542608, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q424999ACCEPT_00()--接受任務"惡勢力大聯盟"後執行
	local Ctrl = OwnerID()
	local Player = TargetID()
	local x, y, z, dir = 0
	local ObjID = 123548
	local NPC = 0
	local ClientBuff = 500598
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		x, y, z, dir = DW_Location( Ctrl )
		NPC = CreateObj( ObjID, x, y, z, dir, 1 )
		AddToPartition( NPC, 0 )
		MoveToFlagEnabled( NPC, false )
		AddBuff( Player, ClientBuff, 0, -1 )
		Sleep( 10 )
		if CheckID( Player ) == true then
			AdjustFaceDir( NPC, Player, 0 )
			AddBuff( Player, 623132, 0, 3 )
		end
		Sleep( 10 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		NpcSay( NPC, "[SC_NPC123548_00]" )
		Sleep( 20 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		Sleep( 10 )
		if CheckID( Player ) == true then
			CancelBuff( Player, ClientBuff )
		end
		Sleep( 10 )
		DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q424999COMPLETED_00()--完成任務"惡勢力大聯盟"後執行
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ClientFlag = 542615
	SetFlag( Player, ClientFlag, 1 )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123540SPEAK_00()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 424999 )==true and
	CheckFlag( PID, 542609 )==false then
		AddSpeakOption( PID, NPC, "[SC_Z32Q424999_00]", "Z32_NPC123540SPEAK_01", 0 )
	elseif CheckAcceptQuest( PID, 425056 )==true and
	CheckFlag( PID, 542610 )==false then
		AddSpeakOption( PID, NPC, "[SC_Z32Q425056_00]", "Z32_NPC123540SPEAK_02", 0 )
	end
	LoadquestOption( PID )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123540SPEAK_01()--聽取密會的內容
	local Player=OwnerID()
	local NPC=TargetID()
	local Switch=ReadRoleValue( NPC, EM_RoleValue_Register2 )
	if Switch==0 then
		WriteRoleValue( NPC, EM_RoleValue_Register2, 1 )
		CallPlot( NPC, "Z32_Q424999SHOW_00", NPC )
	else	
		CloseSpeak( Player )
		ScriptMessage( Player, Player, 1,"[SC_424528_3]", 0 )
		return
	end
	SetModeEx( NPC, EM_SetModeType_Mark, false )
	CloseSpeak( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123540SPEAK_02()--繼續聽取密會的內容
	local Player = OwnerID()
	local NPC = TargetID()
	local Switch = ReadRoleValue( NPC, EM_RoleValue_Register4 )
	if Switch == 0 then
		WriteRoleValue( NPC, EM_RoleValue_Register4, 1 )
		CallPlot( NPC, "Z32_Q425056SHOW_00", NPC )
	else	
		CloseSpeak( Player )
		ScriptMessage( Player, Player, 1,"[SC_424528_3]", 0 )
		return
	end
	SetModeEx( NPC, EM_SetModeType_Mark, false )
	CloseSpeak( Player )
End
----------------------------------------------------------------------------------------------------
Function Z32_Q425056ACCEPT_00()--接受任務"以思帖的秘密"後執行
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ObjID = 123554
	local x, y, z, dir = 0
	local NPC = 0
	local ClientFlag = 542615
	local ClientBuff = 500599
	CloseSpeak( Player )
	SetFlag( Player, ClientFlag, 1 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register3 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register3, 1 )
		x, y, z, dir = DW_Location( Ctrl )
		NPC = CreateObj( ObjID, x, y, z, dir, 1 )
		AddToPartition( NPC, 0 )
		MoveToFlagEnabled( NPC, false )
		Sleep( 10 )
		AddBuff( Player, ClientBuff, 0, -1 )
		if CheckID( Player ) == true then
			AdjustFaceDir( NPC, Player, 0 )
			AddBuff( Player, 623132, 0, 3 )
		end
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		Sleep( 10 )
		NpcSay( NPC, "[SC_NPC123554_00]" )
		Sleep( 20 )
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		Sleep( 20 )
		if CheckID( Player ) == true then
			CancelBuff( Player, ClientBuff )
		end
		DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register3, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q425057ACCEPT_00()--接受任務"真相藏於平凡"後執行
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ObjID = 123590
	local x, y, z, dir = 0
	local NPC = 0
	local ClientBuff = 500605
	local FlagID = 781413
	if ReadRoleValue( Ctrl, EM_RoleValue_Register5 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register5, 1 )
		x, y, z, dir = DW_Location( Ctrl )
		NPC = CreateObj( ObjID, x, y, z, dir, 1 )
		AddToPartition( NPC, 0 )
		MoveToFlagEnabled( NPC, false )
		AddBuff( Player, ClientBuff, 0, -1 )
		if CheckID( Player ) == true then
			AdjustFaceDir( NPC, Player, 0 )
			AddBuff( Player, 623132, 0, 3 )
		end
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		Sleep( 10 )
		NpcSay( NPC, "[SC_NPC123590_00]" )
		Sleep( 20 )
		FaceFlag ( NPC, FlagID, 7 )
		AdjustDir( NPC, 180 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
		Sleep( 10 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_BUFF_SP01 )
		Sleep( 10 )
		if CheckID( Player ) == true then
			CancelBuff( Player, ClientBuff )
		end
		DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register5, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q425057TOUCH_00()
	local Player = OwnerID()
	local NPC = TargetID()
	local QuestTarget = 108866
	if CheckID( Player ) == true and CheckID( NPC ) == true then
		DW_QietKillOne( Player, QuestTarget )
		return true
	else	return false
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123550_00()
	local NPC = OwnerID()
	SetPlot( NPC, "range", "Z32_NPC123550_01", 40 )
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123550_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 425057 )==true and
	CheckFlag( PID, 542611 )==false then
		SetFlag( PID, 542611, 1 )
	elseif CheckAcceptQuest( PID, 425059 )==true and
	CheckFlag( PID, 542613 )==false then
		SetFlag( PID, 542613, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123553_00()
	local NPC = OwnerID()
	SetPlot( NPC, "range", "Z32_NPC123553_01", 80 )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )--初始化"Z32_Q425059ACCEPT_00"的執行條件
	SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
End
----------------------------------------------------------------------------------------------------
Function Z32_NPC123553_01()
	local PID=OwnerID()
	local NPC=TargetID()
	if CheckAcceptQuest( PID, 425058 )==true and
	CheckFlag( PID, 542612 )==false then
		SetFlag( PID, 542612, 1 )
	end
End
----------------------------------------------------------------------------------------------------
Function Z32_Q425059ACCEPT_00()
	local Ctrl = OwnerID()
	local Player = TargetID()
	local ObjID = 123591
	local x, y, z, dir = 0
	local NPC = 0
	local ClientBuff = 500606
	local FxBuff = 490604
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 )==0 then
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )
		x, y, z, dir = DW_Location( Ctrl )
		NPC = CreateObj( ObjID, x, y, z, dir, 1 )
		AddToPartition( NPC, 0 )
		MoveToFlagEnabled( NPC, false )
		SetDefIdleMotion( NPC, ruFUSION_MIME_IDLE_COMBAT_1H )
		AddBuff( Player, ClientBuff, 0, -1 )
		if CheckID( Player ) == true then
			AdjustFaceDir( NPC, Player, 0 )
			AddBuff( Player, 623132, 0, 3 )
		end
		PlayMotion( NPC, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		Sleep( 10 )
		NpcSay( NPC, "[SC_NPC123591_00]" )
		Sleep( 20 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_FORWARD )
		Sleep( 10 )
		SetDefIdleMotion( NPC, ruFUSION_MIME_BUFF_SP01 )
		CastSpellPos( NPC, x, y, z, FxBuff, 0 )
		Sleep( 10 )
		if CheckID( Player ) == true then
			CancelBuff( Player, ClientBuff )
		end
		DelObj( NPC )
		WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )
	else	return
	end
End
----------------------------------------------------------------------------------------------------