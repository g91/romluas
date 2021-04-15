--z32主線=======================================
--=====================================
--426962 農民聚會
--=====================================
function LuaPG_426962_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426962)==true		and
	CountBodyItem(Player, 243205)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z32Q426962_AN_3]", "LuaPG_426962_Retake_02", 0 )
	end
end


function LuaPG_426962_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243205,1)
end

function LuaPG_426962_Out()
	SetPlot( OwnerID(), "range" , "LuaPG_426962_Out_02" , 30 )
end

function LuaPG_426962_Out_02()
	local Player = OwnerID()
	local NPC = TargetID()
	if CheckBuff(Player, 625491) == false	then
		SAY(NPC, "[SC_Z32Q426962_OUT]")
		ChangeZone( Player, 32, 0, -10398, 344, -13736, 290 )
	end
end

function LuaPG_243205_Check()
	local Player = OwnerID()

--	if DW_CheckMap(Player,214)==false		then	--貝奧曲農場
--		CancelBuff(Player, 625491)
--		ScriptMessage( Player , Player , 1 , "[SC_ITEMRULE_01]" , 0 ) 		----你無法在此區域使用這項物品。
--		ScriptMessage( Player , Player , 0 , "[SC_ITEMRULE_01]" , 0 )
--		return false
--	end
	
	if CheckBuff( Player , 625491 ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_Z32Q426962_CHECK]" , 0 ) 		----你已經換上[242660]了
		ScriptMessage( Player , Player , 0 , "[SC_Z32Q426962_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_423191_D_3]" , 0 ) 	----你無法在騎乘時換裝
			ScriptMessage( Player , Player , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_243205_Use()
	local Player = OwnerID()		--偽裝

	AddBuff(Player ,625491,0,-1)
	ScriptMessage( Player , Player , 1 , "[SC_Z32Q426962_WEAR]" , 0 ) 		----換裝
	ScriptMessage( Player , Player , 0 , "[SC_Z32Q426962_WEAR]" , 0 )
end

--沒有任務要清除BUFF
function LuaPG_625491_Cancel_Check()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426962)==false	--or
--	DW_CheckMap(Player,214)==false			
								then	
		CancelBuff(Player, 625491)
	end
end

--=======================
--	演員：123611 魯莫．戈塞普，123607 布尼爾，123608 莫斯比，123609 艾斯特班，123610 達力
--	buff：625490
--	走位：781404  no.6~
--	EM_RoleValue_Register+1	紀錄表演是否在進行中，"0"=否，"1"=是，"2"=即將開始
--=======================
function LuaPG_Z32_123613_Talk_Main()	--123606 隼之團雀鷹，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
	if CheckAcceptQuest( Player, 426962 ) == true	and
	Checkflag(Player,548976)==false		and
	CheckBuff(Player, 625491)==true		then
	--檢查是否有接任務，有接才顯示表演用的對話
		SetSpeakDetail( Player, "[SC_Z32Q426962_AN_1]" )
		AddSpeakOption( Player, NPC, "[SC_Z32Q426962_AN_2]", "FN_Quest_Acting_plot(426962, 625490, \"LuaPG_Z32_Q426962_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_Z32_Q426962_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 100 )
	local ShowActor = { 123607, 123608, 123609, 123610}
	local BuffID = 625490
	local QuestID = 426962
	local WalkFlag = 781404
	local KeyFlag = 548976	--任務的重要物品

	--參照場上NPC的位置，創造演員NPC
	for i = 0, #NPCTable do	--123611 魯莫．戈塞普晚一點在另外出現
		--這邊因為參照的NPC在資料庫中是連號的123613~123617，所以用了一個偷吃步的方式
		--把編號減去123612來當作ShowActor的索引
		local OrgID = ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID )
		local x, y, z, dir = DW_Location( NPCTable[i] )
		local TempNum = OrgID - 123612
		--Say(NPC, TempNum)
		if TempNum>0 and TempNum<=4	then
			local TempActor = ShowActor[TempNum]
			--Say(NPC, TempActor)
			Actor[TempActor] = CreateObj( TempActor, x, y, z, dir, 1 )
			MoveToFlagEnabled( Actor[TempActor], false )
			AddToPartition( Actor[TempActor], RoomID )
		end
	end

	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do			--給予Client劇情所需要的判斷用buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/zone/000/zone004_night_02.mp3", true )
	end

	Sleep(40)
	--至此所有NPC演員已經準備好，記錄在Actor這個陣列當中
	PlayMotion(Actor[123607],ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say( Actor[123607], "[SC_Z32Q426962_1]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Actor[123611] = CreateObjByFlag( 123611, WalkFlag, 6, 1)
	AddToPartition(Actor[123611], RoomID)
	DW_MoveToFlag( Actor[123611], WalkFlag, 7, 0, 1)
	AdjustFaceDir( Actor[123611], Actor[123609], 0 )
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_WAVE)
	Say( Actor[123611], "[SC_Z32Q426962_2]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say( Actor[123611], "[SC_Z32Q426962_3]" )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say( Actor[123611], "[SC_Z32Q426962_4]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Say( Actor[123611], "[SC_Z32Q426962_5]" )	
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123608], ruFUSION_ACTORSTATE_HURT_NORMAL)
	Say( Actor[123608], "[SC_Z32Q426962_6]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123609], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[123609], "[SC_Z32Q426962_7]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[123611], "[SC_Z32Q426962_8]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[123610], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	Say( Actor[123610], "[SC_Z32Q426962_9]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123608], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( Actor[123608], "[SC_Z32Q426962_10]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123609], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[123609], "[SC_Z32Q426962_11]" )	
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123611], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[123611], "[SC_Z32Q426962_12]" )	
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123611], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Say( Actor[123611], "[SC_Z32Q426962_13]" )	
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123611], ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	Say( Actor[123611], "[SC_Z32Q426962_14]" )	
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123611], ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	Say( Actor[123611], "[SC_Z32Q426962_15]" )
	Sleep( 40 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123611], ruFUSION_MIME_EMOTE_APPROVAL)	
	Say( Actor[123611], "[SC_Z32Q426962_16]" )	
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, KeyFlag, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	--把表演的臨時演員都砍掉
	for i = 123607, 123611 do
		DelObj( Actor[i] )
	end
end


--=====================================
--427096 可疑動向
--=====================================
--	演員：123605 鯊邦度，123611 魯莫．戈塞普
--	buff：625492
--	走位：781404  no.50
--	EM_RoleValue_Register+1	紀錄表演是否在進行中，"0"=否，"1"=是，"2"=即將開始
--=======================
function LuaPG_Z32_123581_Talk_Main()	--隼之團副團長，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
	if CheckAcceptQuest( Player, 427096 ) == true			and
	Checkflag(Player,548977)==false				and
	CheckBuff(Player, 625492)==false				then
	--檢查是否有接任務，有接才顯示表演用的對話
		SetSpeakDetail( Player, "[SC_Z32Q427096_AN_1]" )
		AddSpeakOption( Player, NPC, "[SC_Z32Q427096_AN_2]", "FN_Quest_Acting_plot(427096, 625492, \"LuaPG_Z32_Q427096_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
	elseif DW_CheckQuestAccept("or",Player,427095)==true	and
	CountBodyItem(Player, 243206)==0				then
		LoadQuestOption(Player)
		AddSpeakOption(Player,NPC, "[SC_Z32Q427095_2]", "LuaPG_427095_Retake_02", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_Z32_Q427096_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 300 )
	local BuffID = 625492
	local QuestID = 427096
	local WalkFlag = 781404
	local KeyFlag = 548977	--任務的重要物品

	--參照場上NPC的位置，創造演員NPC
	Actor[123605] = CreateObjByFlag( 123605, WalkFlag, 50, 1)
	Actor[123611] = CreateObjByFlag( 123611, WalkFlag, 51, 1)
	MoveToFlagEnabled( Actor[123605], false )
	MoveToFlagEnabled( Actor[123611], false )

	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do			--給予Client劇情所需要的判斷用buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/dungeon/Pesche/ancient_tales_06_blizzard_of_doom.mp3", true )
	end

	Sleep(40)
	--至此所有NPC演員已經準備好，記錄在Actor這個陣列當中
	ScriptMessage( NPC, 0, 2, "[SC_Z32Q427096_1]", C_SYSTEM )
	Sleep(25)
	ScriptMessage( NPC, 0, 2, "[SC_Z32Q427096_2]", C_SYSTEM )
	AddToPartition(Actor[123605], RoomID)
	AddToPartition(Actor[123611], RoomID)
	Sleep(25)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123605],ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Yell( Actor[123605], "[SC_Z32Q427096_3]" ,3)
	Sleep( 25 )
	DW_MoveDirectToFlag(Actor[123605] , WalkFlag, 52, 0, 1)
	DW_MoveToFlag( Actor[123611] , WalkFlag, 53, 0, 1) 
	AdjustFaceDir( Actor[123605], Actor[123611], 0 )
	AdjustFaceDir( Actor[123611], Actor[123605], 0 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( Actor[123611], "[SC_Z32Q427096_4]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Yell( Actor[123611], "[SC_Z32Q427096_5]" ,3)
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( Actor[123611], "[SC_Z32Q427096_6]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123605], ruFUSION_ACTORSTATE_EMOTE_IDLE)
	Yell( Actor[123605], "[SC_Z32Q427096_7]" ,3)
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123605], ruFUSION_ACTORSTATE_CAST_BEGIN)
	Yell( Actor[123605], "[SC_Z32Q427096_8]" ,3)
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123605], ruFUSION_ACTORSTATE_EMOTE_IDLE )
	Yell( Actor[123605], "[SC_Z32Q427096_9]" ,3)
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[123611], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( Actor[123611], "[SC_Z32Q427096_10]" ,3)
	Sleep( 25 )
	--
	PlayMotion( Actor[123605], ruFUSION_ACTORSTATE_CAST_BEGIN )
	Yell( Actor[123605], "[SC_Z32Q427096_11]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[123605], ruFUSION_ACTORSTATE_BUFF_BEGIN )
	PlayMotion(Actor[123605], ruFUSION_ACTORSTATE_EMOTE_IDLE)
	Yell( Actor[123605], "[SC_Z32Q427096_12]" ,3)
	Sleep( 25 )
	DW_MoveDirectToFlag(Actor[123605] , WalkFlag, 50, 0, 1)
	DW_MoveToFlag( Actor[123611] , WalkFlag, 51, 0, 1) 	
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, KeyFlag, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	--把表演的臨時演員都砍掉
	DelObj( Actor[123605] )
	DelObj( Actor[123611] )
end