--=======================
--	腳本：危機
--	122652 威爾．坎奇斯
--				EM_RoleValue_Register+1	紀錄表演是否在進行中，"0"=否，"1"=是，"2"=即將開始
--=======================
function Z26_FN_122652_Talk_Main()	--122652 威爾．坎奇斯，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
--	if CheckAcceptQuest( Player, 426312 ) == true then
	--檢查是否有接任務，有接才顯示表演用的對話
		AddSpeakOption( Player, NPC, "[SC_424532_1]", "FN_Quest_Acting_plot(426312, 623824, \"Z26_FN_Q426312_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
--	else
--		SetSpeakDetail( Player, "[SC_Z26_Q426312_0]" )
--	end
end

--
function Z26_FN_Q426312_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	--local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 623824
	local QuestID = 426312
	local PlayMusic = "music/zone/019/zone/day/LHL_07_APF_magic_and_might.mp3"
	local x, y, z, dir = DW_Location( NPC )
	--參照旗標場781248，0~5位置，創造演員NPC
	local ActorOrgID = { 122682, 122683, 122684, 122685, 122686 }
	ActorOrgID[0] = 122680	--設定索引0太麻煩了，所以這邊再額外塞進去
	for i = 0, 5 do
		local ActorID = ActorOrgID[i]
		local x, y, z, dir = DW_Location( 781248, i )
		Actor[ActorID] = CreateObj( ActorID, x, y, z, dir, 1 )
		--
		MoveToFlagEnabled( Actor[ActorID], false )
		AddToPartition( Actor[ActorID], RoomID )
		--創建之後，這邊是對演員的一些處理
		if ActorID == 122683 then	--摩瑞克 特別處理
			SetDefIdleMotion( Actor[ActorID], ruFUSION_MIME_DEATH_LOOP ) --播放躺下動作
		end
		if ActorID == 122685 or ActorID == 122686 or ActorID == 122682 then	--吉兒 / 卡拉維 / 邦喀雷姆斯 特別處理
			Hide( Actor[ActorID] )
			SetModeEx( Actor[ActorID], EM_SetModeType_Gravity, false )	--劇情中會浮空，所以取消重力
			WriteRoleValue( Actor[ActorID], EM_RoleValue_IsWalk, 0 )
			addbuff( Actor[ActorID], 506984, 1, -1 )
		end
	end
	--對看表演玩家的處理
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--給予Client劇情所需要的判斷用buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, PlayMusic, true )
	end
	Sleep(20)
	--
	x, y, z, dir = DW_Location( 781248, 1 )
	Move( Actor[122680], x, y, z )
	ScriptMessage( Actor[122680], 0, 2, "[SC_Z26_Q426312_1]", C_SYSTEM )
	Sleep(5)
	--
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122680], "[SC_Z26_Q426312_2]" )
	Sleep(30)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122680], "[SC_Z26_Q426312_3]" )
	Sleep( 30 )
	--
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_THINK )
	Say( Actor[122684], "[SC_Z26_Q426312_4]" )
	Sleep( 10 )
	AdjustFaceDir( Actor[122684], Actor[122680], 0 )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(20)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_5]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Sleep( 30 )
	--
	Say( Actor[122684], "[SC_Z26_Q426312_6]" )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_7]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 25 )
	--
	Say( Actor[122684], "[SC_Z26_Q426312_8]" )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_9]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Sleep( 25 )
	--
	Say( Actor[122684], "[SC_Z26_Q426312_10]" )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_11]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Sleep( 30 )
	--
	Say( Actor[122680], "[SC_Z26_Q426312_12]" )			--我不想再繼續這令我不愉快的對話了！
	CastSpell( Actor[122680], Actor[122680], 491999 )		--施放法術，炸裂，眾人倒地。
	Sleep( 40 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_13]" )
	CastSpell( Actor[122680], Actor[122680], 492295 )
	AddBuff( Actor[122680], 624290, 0, -1 )
	--吉兒&卡拉維 出場阻止 賽琳伊菲斯
--	SetPosByFlag( Actor[122686], 781248, 5 )
--	SetPosByFlag( Actor[122685], 781248, 4 )
	Show( Actor[122685], RoomID )
	Show( Actor[122686], RoomID )
	SetDefIdleMotion( Actor[122685], ruFUSION_MIME_JUMP_LOOP )		--讓吉兒保持滯空
	SetDefIdleMotion( Actor[122686], ruFUSION_MIME_JUMP_LOOP )		--讓卡拉維保持從天而降的蹲姿
	--
	x, y, z, dir = DW_Location( 781248, 6 )
	MoveDirect( Actor[122686], x, y, z )
	sleep(25)
	SetPos( Actor[122686], x, y, z, dir )
	AdjustFaceDir( Actor[122686], Actor[122680], 0 )
	PlayMotion( Actor[122686], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	SysCastSpellLv( Actor[122686], Actor[122686], 492296, 0 )			--卡拉維施放光罩			
	Say( Actor[122686], "[SC_Z26_Q426312_14]" )
	Sleep( 5 )
	SetDefIdleMotion( Actor[122686], ruFUSION_MIME_IDLE_COMBAT_2H )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	SetDefIdleMotion( Actor[122685], ruFUSION_MIME_RUN_FORWARD )		--讓吉兒開始飛下來
	x, y, z, dir = DW_Location( 781248, 7 )
	Move( Actor[122685], x, y, z )
	--
	AdjustFaceDir( Actor[122680], Actor[122686], 0 )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122680], "[SC_Z26_Q426312_15]" )
	Sleep( 25 )
	--
	SetDefIdleMotion( Actor[122685], ruFUSION_MIME_IDLE_STAND )		--吉兒應該飛到定點了 把動作調回來
	AdjustFaceDir( Actor[122685], Actor[122680], 0 )
	--
	Say( Actor[122680], "[SC_Z26_Q426312_16]" )	
	CastSpell( Actor[122680], Actor[122680], 492295 )
	Sleep( 15 )
	MagicInterrupt( Actor[122680] )
	Sleep( 15 )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_HURT_NORMAL )
	Sleep( 5 )
	Say( Actor[122680], "[SC_Z26_Q426312_17]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	CancelBuff( Actor[122680], 624290 )
	AddBuff( Actor[122680], 624289, 0, -1 )
	Say( Actor[122680], "[SC_Z26_Q426312_18]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 35 )
	--
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_HURT_NORMAL )
	SetDefIdleMotion( Actor[122680], ruFUSION_MIME_SLUMBER )
	Sleep( 5 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	CancelBuff( Actor[122680], 624289 )
	AddBuff( Actor[122680], 624290, 0, -1 )
	Say( Actor[122680], "[SC_Z26_Q426312_19]" )
	Sleep( 15 )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_DYING )
	SetDefIdleMotion( Actor[122680], ruFUSION_MIME_DEATH_LOOP )
	Sleep( 13 )
	--
	x, y, z, dir= DW_Location( Actor[122680] )
	SetPos( Actor[122682], x, y, z, dir )
	SetDefIdleMotion( Actor[122682], ruFUSION_MIME_CROUCH_LOOP )
	Show( Actor[122682], RoomID )
	CancelBuff( Actor[122680], 624290 )
	AddBuff( Actor[122682], 624289, 0, -1 )
	Sleep( 20 )
	Say( Actor[122682], "[SC_Z26_Q426312_20]" )
	DelObj( Actor[122680] )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122682], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Actor[122682], ruFUSION_MIME_IDLE_STAND )
	Say( Actor[122682], "[SC_Z26_Q426312_21]" )
	Sleep( 50 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--======================
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548216, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	for i = 122682, 122686 do
		DelObj( Actor[i] )
	end
	DelObj( Actor[122680] )
end

function Z26_FN_Q426312_Spell502111_Hit()
	local Tar = TargetID()
	
	if CheckBuff( Tar, 623824 ) == true then
		return true
	elseif ReadRoleValue( Tar, EM_RoleValue_OrgID ) == 122684 then
		return true
	elseif ReadRoleValue( Tar, EM_RoleValue_OrgID ) == 122733 then
		return true
	end
	return false
end

--=======================
--	腳本：封印儀式
--	122657 邦喀雷姆斯
--				EM_RoleValue_Register+1	紀錄表演是否在進行中，"0"=否，"1"=是，"2"=即將開始
--=======================
function Z26_FN_122657_Talk_Main()	--122657 邦喀雷姆斯，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
--	if CheckAcceptQuest( Player, 426312 ) == true then
	--檢查是否有接任務，有接才顯示表演用的對話
		AddSpeakOption( Player, NPC, "[SC_424532_4]", "FN_Quest_Acting_plot(426316, 623824, \"Z26_FN_Q426316_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
--	else
--		SetSpeakDetail( Player, "[SC_Z26_Q426312_0]" )
--	end
end

--
function Z26_FN_Q426316_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	--local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 623824
	local QuestID = 426316
	local PlayMusic = "music/dungeon/the_gates_of_hell.mp3"
	local x, y, z, dir = DW_Location( NPC )
	--參照旗標場781248，10~15位置，創造演員NPC
	for i = 10, 15 do
		local ActorID = 122721+i
		local x, y, z, dir = DW_Location( 781248, i )
		Actor[ActorID] = CreateObj( ActorID, x, y, z, dir, 1 )
		--
		MoveToFlagEnabled( Actor[ActorID], false )
		AddToPartition( Actor[ActorID], RoomID )
		--創建之後，這邊是對演員的一些處理
		if ActorID == 122736 or ActorID == 122735 or ActorID == 122731 then	--吉兒 / 卡拉維 / 賽琳伊菲斯 特別處理
			Hide( Actor[ActorID] )
			SetModeEx( Actor[ActorID], EM_SetModeType_Gravity, false )	--劇情中會浮空，所以取消重力
			WriteRoleValue( Actor[ActorID], EM_RoleValue_IsWalk, 0 )
			addbuff( Actor[ActorID], 506984, 1, -1 )
		end
	end
	--對看表演玩家的處理
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--給予Client劇情所需要的判斷用buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, PlayMusic, true )
	end
	--==========================主要表演開始==========================
	Sleep( 20 )
	--//
	Say( Actor[122732], "[SC_Q426316_5]" )				--"派特克洛斯，請你先確認一下..."
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(30)
	--//
	Say( Actor[122734], "[SC_Q426316_6]" )				--"不過就是這點小事..."
	PlayMotion( Actor[122734], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	--
	x, y, z, dir = DW_Location( 781248, 16 )
	Move( Actor[122734], x, y, z )
	Sleep(30)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122734], ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Say( Actor[122734], "[SC_Q426316_7]" )				--"要是那個臭妞又出來作亂..."
	Sleep(30)
	--// 邦喀雷姆斯倒下 創建賽琳伊菲斯
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_DYING )
	SetDefIdleMotion( Actor[122732], ruFUSION_MIME_DEATH_LOOP )
	Sleep( 5 )
	SetDefIdleMotion( Actor[122731], ruFUSION_MIME_CROUCH_LOOP )
	Show( Actor[122731], RoomID )
	Say( Actor[122731], "[SC_Q426316_9]" )				--"喔？你想怎樣不留情？"
	AddBuff( Actor[122731], 624290, 0, -1 )
	Sleep( 10 )
	Hide( Actor[122732] )
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Actor[122731], ruFUSION_MIME_IDLE_STAND )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--// 賽琳伊菲斯對玩家跟摩瑞克施法綑綁
	PlayMotion( Actor[122733], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122733], "[SC_Q426316_8]" )				--"小心！"
	Sleep( 5 )
	AdjustFaceDir( Actor[122731], Actor[122733], 0 )
	Say( Actor[122731], "[SC_Q426316_10]" )				--"噓！摩瑞克，你總是如此多話..."
	CastSpell( Actor[122731], Actor[122731], 492297 )
	Sleep( 20 )
	--//
	AdjustFaceDir( Actor[122734], Actor[122731], 0 )
	SetDefIdleMotion( Actor[122734], ruFUSION_MIME_IDLE_COMBAT_2H )
	Say( Actor[122734], "[SC_Q426316_10_1]" )				--"賽琳伊菲斯！"
	Sleep( 5 )
	AdjustFaceDir( Actor[122731], Actor[122734], 0 )
	CastSpell( Actor[122731], Actor[122734], 492304 )			--賽琳伊菲斯攻擊派特克洛斯
	Say( Actor[122731], "[SC_Q426316_10_2]" )				--"吵死了！你這條老火龍！"
	Sleep( 20 )
	Say( Actor[122734], "[SC_Q426316_8_1]" )				--"呃啊啊啊！"
	PlayMotion( Actor[122734], ruFUSION_ACTORSTATE_HURT_NORMAL )
	SetDefIdleMotion( Actor[122734], ruFUSION_MIME_CROUCH_LOOP )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_CUTE3 )
	Say( Actor[122731], "[SC_Q426316_11]" )				--"真是可悲啊...派特克洛斯..."
	Sleep(30)
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122731], "[SC_Q426316_12]" )				--"還是說，你其實一直都不信任他？"
	Sleep(20)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122731], "[SC_Q426316_12_1]" )				--"只因為他是平衡神使，龍族的領導者所以才不得不聽從的？"
	Sleep(30)
	--//
	Say( Actor[122734], "[SC_Q426316_13]" )				--"呸......"
	ScriptMessage( Actor[122734], 0, 3, "[SC_Q426316_13_1]", 0 )		--(派特克洛斯朝地上淬了一口鮮血)
	Sleep(25)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	Say( Actor[122734], "[SC_Q426316_13_2]" )				--"我還有一筆帳要跟你算..."
	Sleep(25)
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122731], "[SC_Q426316_14]" )				--"你也太大驚小怪了吧！"
	Sleep(32)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	Say( Actor[122734], "[SC_Q426316_14_1]" )				--"妳...！"
	Sleep(15)
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122731], "[SC_Q426316_15]" )				--"算了...我馬上就會讓你跟他團聚了！"
	Sleep(25)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	CastSpell( Actor[122731], Actor[122731], 492305 )
	AddBuff( Actor[122731], 624290, 0, -1 )
	--// 吉兒&卡拉維 出場阻止 賽琳伊菲斯
	Show( Actor[122736], RoomID )	--吉兒．艾克辛
	Show( Actor[122735], RoomID )	--卡拉維．卡薩姆
	SetDefIdleMotion( Actor[122736], ruFUSION_MIME_JUMP_LOOP )		--讓吉兒保持滯空
	SetDefIdleMotion( Actor[122735], ruFUSION_MIME_JUMP_LOOP )		--讓卡拉維保持從天而降的蹲姿
	--
	x, y, z, dir = DW_Location( 781248, 17 )
	MoveDirect( Actor[122735], x, y, z )
	sleep(25)
	SetPos( Actor[122735], x, y, z, dir )
	AdjustFaceDir( Actor[122735], Actor[122731], 0 )
	SetDefIdleMotion( Actor[122735], ruFUSION_MIME_IDLE_COMBAT_2H )
--	Say( Actor[122735], "[SC_BELLATIADUPLICATION_FOURTH_BOSS_21]" )	--"來自遠古的巨劍啊... 伊蘭薩爾..."
	sleep( 5 )
	CastSpell( Actor[122735], Actor[122731], 492306 )
	sleep( 5 )
	Say( Actor[122731], "[SC_Q426316_16_1]" )					--"又是你！"
	Sleep( 20 )
	Say( Actor[122735], "[SC_Q426316_17]" )					--"淨化吧！"
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	Say( Actor[122731], "[SC_Q426316_18]" )					--"你......！啊！"
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_HURT_NORMAL )
	Sleep( 15 )
	--// 賽琳伊菲斯倒下 創建邦喀雷姆斯 吉兒飛下來
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_DYING )
	SetDefIdleMotion( Actor[122731], ruFUSION_MIME_DEATH_LOOP )
	Sleep( 10 )
	--↓吉兒這時飛下來
	SetDefIdleMotion( Actor[122736], ruFUSION_MIME_RUN_FORWARD )
	x, y, z, dir = DW_Location( 781248, 18 )
	MoveDirect( Actor[122736], x, y, z )
	--↑
	SetDefIdleMotion( Actor[122732], ruFUSION_MIME_CROUCH_LOOP )
	Show( Actor[122732], RoomID )
	Sleep( 10 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--↓吉兒站到火龍旁邊
	SetPos( Actor[122736], x, y, z, dir )
	AdjustFaceDir( Actor[122736], Actor[122734], 0 )
	--↑
	DelObj( Actor[122731] )
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Actor[122732], ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion( Actor[122734], ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion( Actor[122735], ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion( Actor[122736], ruFUSION_MIME_IDLE_STAND )
	Sleep( 10 )
	--//
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		CancelBuff( PlayerID, 622004 )	--刪除定身
	end
	--//
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122732], "[SC_Q426316_19]" )					--"我太大意了..."
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122732], "[SC_Q426316_19_1]" )					--"謝謝你，卡拉維．卡薩姆..."
	Sleep( 32 )
	--//
	Say( Actor[122734], "[SC_Q426316_19_2]" )					--"我說，邦喀雷姆斯，你就不能直接滅了那臭妞嗎？"
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[122732], "[SC_Q426316_20]" )					--"不，現在還不行..."
	Sleep( 50 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--==========================主要表演結束==========================
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548221, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	for i = 122731, 122736 do
		DelObj( Actor[i] )
	end
end