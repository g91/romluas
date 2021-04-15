--=======================
--	腳本：封印與約定
--	122631 吉兒．艾克辛
--				EM_RoleValue_Register+1	紀錄表演是否在進行中，"0"=否，"1"=是，"2"=即將開始
--=======================
function Z26_FN_122631_Talk_Main()	--122631 吉兒．艾克辛，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
	if CheckAcceptQuest( Player, 426268 ) == true and
	Checkflag(Player,548185)==false		then
	--檢查是否有接任務，有接才顯示表演用的對話
		SetSpeakDetail( Player, "[SC_Z26Q426268_AN_1]" )
		AddSpeakOption( Player, NPC, "[SC_Z26Q426268_AN_2]", "FN_Quest_Acting_plot(426268, 624547, \"Z26_FN_Q426268_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
	else
		LoadQuestOption(Player)
--		SetSpeakDetail( Player, "[SC_Z26Q426268_ AN_3]" )
	end
end

--
function Z26_FN_Q426268_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 624547
	local QuestID = 426268
	--參照場上NPC的位置，創造演員NPC
	for i = 0, #NPCTable do
		local OrgID = ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID )
		local x, y, z, dir = DW_Location( NPCTable[i] )
		if OrgID == 122631 then
			Actor[122640] = CreateObj( 122640, x, y, z, dir, 1 )
		end
		if OrgID == 122633 then
			Actor[122642] = CreateObj( 122642, x, y, z, dir, 1 )
		end
		if OrgID == 122628 then
			Actor[122639] = CreateObj( 122639, x, y, z, dir, 1 )
		end
		if OrgID == 122630 then
			Actor[122638] = CreateObj( 122638, x, y, z, dir, 1 )
		end
	end
	--勞勃特別處理，參照的是旗標位置
	local x, y, z, dir = DW_Location( 781320, 11 )
	Actor[122641] = CreateObj( 122641, x, y, z, dir, 1 )
	--需要的NPC是122638~122642
	for i = 122638, 122642 do
		MoveToFlagEnabled( Actor[i], false )
		AddToPartition( Actor[i], RoomID )
		--
		if i == 122641 then	--勞勃 特別處理
			Hide( Actor[i] )						--開場要先Hide起來
			SetModeEx( Actor[i], EM_SetModeType_Gravity, false )	--劇情中會浮空，所以取消重力
		end
		if i == 122640 then	--吉兒 特別處理
			SetModeEx( Actor[i], EM_SetModeType_Gravity, false )	--劇情中會浮空，所以取消重力
		end
	end
	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--給予Client劇情所需要的判斷用buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/zone/018/mystic_01_SIV_land_of_the_dead.mp3", true )
	end
	Sleep(40)
	--至此所有NPC演員已經準備好，記錄在Actor這個陣列當中，以他們的OrgID當索引值
	AdjustFaceDir( Actor[122640], Actor[122638], 0 )
	PlayMotion( Actor[122640], ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Say( Actor[122640], "[SC_Z26Q426268_01]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	AdjustFaceDir( Actor[122642], Actor[122640], 0 )
	PlayMotion( Actor[122642], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122642], "[SC_Z26Q426268_02]" )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122638], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[122638], "[SC_Z26Q426268_03]" )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotionEX( Actor[122640], ruFUSION_MIME_JUMP_UP, ruFUSION_MIME_JUMP_LOOP )
	--SetDefIdleMotion( Actor[122640], ruFUSION_MIME_JUMP_LOOP )
	SetDefIdleMotion( Actor[122640], ruFUSION_MIME_RUN_FORWARD )
	LuaFunc_MoveToFlag( Actor[122640], 781320 , 12 ,0 )
	Say( Actor[122640], "[SC_Z26Q426268_04]" )
	Sleep( 10 )
	SetDefIdleMotion( Actor[122640], ruFUSION_MIME_JUMP_LOOP )
	Sleep( 15 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	SetDefIdleMotion( Actor[122640], ruFUSION_MIME_RUN_FORWARD )
	LuaFunc_MoveToFlag( Actor[122640], 781320 , 13 ,0 )
	Say( Actor[122640], "[SC_Z26Q426268_05]" )
	Sleep( 10 )
	SetDefIdleMotion( Actor[122640], ruFUSION_MIME_JUMP_LOOP )
	Sleep( 15 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotionEX( Actor[122641], ruFUSION_MIME_JUMP_UP, ruFUSION_MIME_JUMP_LOOP )
	SetDefIdleMotion( Actor[122641], ruFUSION_MIME_JUMP_LOOP )
	Show( Actor[122641], RoomID )
	Say( Actor[122641], "[SC_Z26Q426268_06]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	SetDefIdleMotion( Actor[122640], ruFUSION_MIME_RUN_FORWARD )
	DW_MoveDirectToFlag(Actor[122640], 781320, 14, 0, 1)
	--LuaFunc_MoveToFlag( Actor[122640], 781320, 14, 0 )
	SetDefIdleMotion( Actor[122641], ruFUSION_MIME_RUN_FORWARD )
	DW_MoveToFlag( Actor[122641] , 781320, 15, 0, 1)
	--LuaFunc_MoveToFlag( Actor[122641], 781320, 15, 0 )
	Sleep( 10 )
	PlayMotionEX( Actor[122640], ruFUSION_MIME_JUMP_DOWN, ruFUSION_ACTORSTATE_NORMAL )
	PlayMotionEX( Actor[122641], ruFUSION_MIME_JUMP_DOWN, ruFUSION_ACTORSTATE_NORMAL )
	Sleep( 5 )
	SetDefIdleMotion( Actor[122640], ruFUSION_ACTORSTATE_NORMAL )
	SetDefIdleMotion( Actor[122641], ruFUSION_ACTORSTATE_NORMAL )
	AdjustFaceDir( Actor[122640], Actor[122641], 0 )
	AdjustFaceDir( Actor[122641], Actor[122640], 0 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	local SE_Table = {}
	for i = 1, 6 do
		local Angle = 60*i
		local Dx, Dy, Dz, Ddir = DW_Location( 781320, 15 )
		local Nx,Ny,Nz,Ndir = DW_NewLocation( Angle, 50, Dx, Dy, Dz, Ddir )
		SE_Table[i] = CreateObj( 117286, Nx, Ny, Nz, Ndir, 1 )
		SetModeEx( SE_Table[i], EM_SetModeType_Mark, false )	--標記
		SetModeEx( SE_Table[i], EM_SetModeType_Move, false )	--移動
		SetModeEx( SE_Table[i], EM_SetModeType_HideName, true )	--血條
		AddToPartition( SE_Table[i], RoomID )
		AddBuff( SE_Table[i], 624289, 0, -1 )
	end
	--
	ScriptMessage( Actor[122640], 0, 2, "[SC_Z26Q426268_07]", C_SYSTEM )
	Sleep( 25 )
	--
	PlayMotion( Actor[122641], ruFUSION_ACTORSTATE_EMOTE_CRY )
	Say( Actor[122641], "[SC_Z26Q426268_08]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122640], ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	Say( Actor[122640], "[SC_Z26Q426268_09]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[122641], ruFUSION_ACTORSTATE_EMOTE_CRY )
	Say( Actor[122641], "[SC_Z26Q426268_10]" )
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122641], ruFUSION_ACTORSTATE_EMOTE_CRY )
	Say( Actor[122641], "[SC_Z26Q426268_11]" )
	Sleep( 35 )
	--
	PlayMotion( Actor[122641], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122640], "[SC_Z26Q426268_12]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122641], "[SC_Z26Q426268_13]" )
	Sleep( 25 )
	--
	for i = 1, #SE_Table do
		CancelBuff( SE_Table[i], 624289 )
		AddBuff( SE_Table[i], 624290, 0, -1 )
	end
	--
	PlayMotion( Actor[122638], ruFUSION_ACTORSTATE_ATTACK_1H_SP )
	Say( Actor[122638], "[SC_Z26Q426268_14]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	CastSpell( SE_Table[1], SE_Table[1], 850864 )
	Sleep( 7 )
	DelObj( SE_Table[1] )
	--
	PlayMotion( Actor[122639], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122639], "[SC_Z26Q426268_15]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[122641], ruFUSION_ACTORSTATE_EMOTE_CRY )
	Say( Actor[122641], "[SC_Z26Q426268_16]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122641], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122640], "[SC_Z26Q426268_17]" )
	Sleep( 25 )
	--
	CastSpell( SE_Table[2], SE_Table[2], 850864 )
	Sleep( 7 )
	DelObj( SE_Table[2] )
	--
	PlayMotion( Actor[122638], ruFUSION_ACTORSTATE_ATTACK_1H_SP )
	Say( Actor[122638], "[SC_Z26Q426268_18]" )
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122641], "[SC_Z26Q426268_19]" )
	Sleep( 15 )
	--
	PlayMotion( Actor[122640], ruFUSION_ACTORSTATE_EMOTE_CRY )
	Say( Actor[122640], "[SC_Z26Q426268_20]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	CastSpell( Actor[122640], Actor[122641], 850864 )
	Sleep( 10 )
	Hide( Actor[122641] )
	Sleep( 15 )
	--
	PlayMotion( Actor[122638], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122638], "[SC_Z26Q426268_21]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122640], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[122640], "[SC_Z26Q426268_22]" )
	Sleep( 40 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #SE_Table do
		if CheckID( SE_Table[i] ) == true then
			DelObj( SE_Table[i] )
		end
	end
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548185, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	for i = 122638, 122642 do
		DelObj( Actor[i] )
	end
end

--====================================
--	腳本：邁向未來的腳步
--====================================

function Z26_FN_122678_Talk_Main()	--122678 卡拉維．卡薩姆，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
	if CheckAcceptQuest( Player, 426271 ) == true and
	Checkflag(Player,548208)==false	then
	--檢查是否有接任務，有接才顯示表演用的對話
		SetSpeakDetail( Player, "[SC_Z26Q426271_AN_01]" )
		AddSpeakOption( Player, NPC, "[SC_Z26Q426271_AN_02]", "FN_Quest_Acting_plot(426271, 624535, \"Z26_FN_Q426271_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
	else
--		SetSpeakDetail( Player, "[SC_Z26Q426271_AN_03]" )
		LoadQuestOption(Player)
	end
end

--
function Z26_FN_Q426271_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 624535
	local QuestID = 426271
	--參照場上NPC的位置，創造演員NPC
	local ShowActor = { 122650, 122667, 122668, 122664, 122665, 122666, 122669, 122670 }
	for i = 0, #NPCTable do
		--這邊因為參照的NPC在資料庫中是連號的122671~122678，所以用了一個偷吃步的方式
		--把編號減去122670來當作ShowActor的索引
		local OrgID = ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID )
		if OrgID >= 122671 and OrgID <= 122678 then
			local x, y, z, dir = DW_Location( NPCTable[i] )
			local TempNum = OrgID - 122670
			local TempActor = ShowActor[TempNum]
			Actor[TempActor] = CreateObj( TempActor, x, y, z, dir, 1 )
			MoveToFlagEnabled( Actor[TempActor], false )
			AddToPartition( Actor[TempActor], RoomID )
		end
	end
	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do			--對參與劇情的玩家做一些設定
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )	--給予Client劇情所需要的判斷用buff
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/zone/015/Day/orchestral_maintheme_16_braintroopers.mp3", true )
	end
	Sleep(40)
	--至此所有NPC演員已經準備好，記錄在Actor這個陣列當中，以他們的OrgID當索引值
	PlayMotion( Actor[122669], ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	Say( Actor[122669], "[SC_Z26Q426271_01]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122670], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[122670], "[SC_Z26Q426271_02]" )
	Sleep( 35 )
	--
	PlayMotion( Actor[122670], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122670], "[SC_Z26Q426271_03]" )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122665], ruFUSION_ACTORSTATE_EMOTE_THINK )
	Say( Actor[122665], "[SC_Z26Q426271_04]" )
	Sleep( 30 )
	--
	PlayMotion( Actor[122665], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122665], "[SC_Z26Q426271_05]" )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	AdjustFaceDir( Actor[122670], Actor[122666], 0 )
	Sleep( 5 )
	PlayMotion( Actor[122670], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( Actor[122670], "[SC_Z26Q426271_06]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[122666], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122666], "[SC_Z26Q426271_07]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122666], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122666], "[SC_Z26Q426271_08]" )
	Sleep( 30 )
	--
	AdjustFaceDir( Actor[122670], Actor[122667], 0 )
	Sleep( 5 )
	PlayMotion( Actor[122667], ruFUSION_ACTORSTATE_EMOTE_THINK )
	Say( Actor[122667], "[SC_Z26Q426271_09]" )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122664], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122664], "[SC_Z26Q426271_10]" )
	Sleep( 30 )
	--
	AdjustFaceDir( Actor[122664], Actor[122667], 0 )
	Sleep( 5 )
	PlayMotion( Actor[122664], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122664], "[SC_Z26Q426271_11]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122667], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	Say( Actor[122667], "[SC_Z26Q426271_12]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[122650], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122650], "[SC_Z26Q426271_13]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122650], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122650], "[SC_Z26Q426271_14]" )
	Sleep( 40 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122650], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[122650], "[SC_Z26Q426271_15]" )
	Sleep( 35 )
	--
	PlayMotion( Actor[122650], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122650], "[SC_Z26Q426271_16]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	local Tx, Ty, Tz, Tdir = DW_Location( 781320, 30 )
	Move( Actor[122650], Tx, Ty, Tz )
	Move( Actor[122668], Tx, Ty, Tz )
	Sleep( 15 )
	DelObj( Actor[122650] )
	DelObj( Actor[122668] )
	--
	PlayMotion( Actor[122669], ruFUSION_ACTORSTATE_EMOTE_STRETCH )
	Say( Actor[122669], "[SC_Z26Q426271_17]" )
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122670], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	Say( Actor[122670], "[SC_Z26Q426271_18]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548208, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	--把表演的臨時演員都砍掉
	for i = 122664, 122670 do
		DelObj( Actor[i] )
	end
	DelObj( Actor[122650] )
end