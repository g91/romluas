--z29主線=======================================
--=======================================
--426779 閱讀過去
--=======================================
function LuaPG_426779_Note()	--手記內容
	local Player = OwnerID()
	local Pages = {"[SC_Z29Q426779_1]", "[SC_Z29Q426779_2]","[SC_Z29Q426779_3]"}
	FA_Border( Player, Pages, "[SC_Z29Q426779_4]", 548790)
end


--=======================================
--426782 森林內的發現
--=======================================
function LuaPG_426782_Tell()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426782)==true	and
	CheckFlag(Player, 548791)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426782_1]", "LuaPG_426782_Tell_02", 0 )
	end
end

function LuaPG_426782_Tell_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player,548791, 1)
end


--=======================================
--426784 機關與碑文
--=======================================
function LuaPG_426784_Click_Before()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426784)==true	and
	CountBodyItem(Player, 242937)>0			then
		return true
	else
		return false
	end
end

function LuaPG_426784_Click_After()
	local Player = OwnerID()
	local BuffCheck=Lua_BuffPosSearch( Player ,625147)			--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--確認BUFF層數
	DelBodyItem(Player, 242937, 1)
	DW_QietKillOne(Player,108137)		 --靜靜的殺死怪，前者殺死後者，0代表為玩家
	if BuffLv>=8	then
		ScriptMessage(Player,Player,1,"[SC_Z29Q426784_2]", 0 )
		ScriptMessage(Player,Player,0,"[SC_Z29Q426784_2]", 0 )
		SetFlag(Player, 548799, 1)
	else
		AddBuff(Player, 625147, 0, -1)
		--Say(Player, BuffLv)		
	end
 	return 1
end

function LuaPG_426784_DeleteorNot()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426784)==false	then
		CancelBuff(Player, 625147)
	end
end


function LuaPG_426784_Complete()
	CancelBuff(TargetID(), 625147)
end

function LuaPG_426784_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426784)==true	and
	CountBodyItem(Player, 242937)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426784_3]", "LuaPG_426784_Retake_02", 0 )
	end
end

function LuaPG_426784_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242937, 10)
end

--===============接下任務後的表演
--CliBuff:625142
--WalkFlag:781337 no.32~33
function LuaPG_426784_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426784_Accept_02" , NPC, Player, CliBuff)	----接演戲function
	end	
end

function LuaPG_426784_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local Actor = CreateObjByFlag( 123226, WalkFlag, 32, 1)			----生成演戲
	ks_ActSetMode( Actor)
	PlayMotion(Actor, ruFUSION_ACTORSTATE_EMOTE_WAVE)
	NPCSAY(Actor,"[SC_Z29Q426784_1]")
	DW_MoveToFlag( Actor, WalkFlag, 33, 0, 1)
	DelObj(Actor)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426785 千年百年的思念
--=======================================
--CliBuff:625142
--WalkFlag:781337 no.30~31
function LuaPG_426785_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426785_Accept_02" , NPC, Player, CliBuff)	----接演戲function
	end	
end

function LuaPG_426785_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local Actor = CreateObjByFlag( 123231, WalkFlag, 33, 1)			----生成演戲
	ks_ActSetMode( Actor)
	DW_MoveToFlag( Actor, WalkFlag, 31, 0, 1)
	DelObj(Actor)
	ScriptMessage(Player,Player,1,"[SC_Z29Q426785_1]", 0 )
	ScriptMessage(Player,Player,0,"[SC_Z29Q426785_1]", 0 )
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426786 繁星之鑰
--=======================================
--	NPC：123230 威爾．坎奇斯、123237 培姬	表演用：123238 威爾．坎奇斯、123232 培姬
--	625143 clibuff
--	EM_RoleValue_Register+1	紀錄表演是否在進行中，"0"=否，"1"=是，"2"=即將開始
--=======================
function LuaPG_Z29_123230_Talk_Main()	--123230 威爾．坎奇斯，對話劇情
	local Player = OwnerID()
	local NPC = TargetID()
	
	if CheckAcceptQuest( Player, 426786 ) == true and
	Checkflag(Player,548792)==false		then
	--檢查是否有接任務，有接才顯示表演用的對話
		SetSpeakDetail( Player, "[SC_Z29Q426786_1]" )
		AddSpeakOption( Player, NPC, "[SC_Z29Q426786_2]", "FN_Quest_Acting_plot(426786, 625143, \"LuaPG_Z29_Q426786_Act_Main\")", 0 )
		--對話選項CALL的函式，代入參數若為字串則使用 \" 前後夾起來
		--配合通用排隊函式使用，這邊一定要代入主要表演的function字串
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_Z29_Q426786_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 625143
	local QuestID = 426786
	--參照場上NPC的位置，創造演員NPC
	for i = 0, #NPCTable do
		local OrgID = ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID )
		local x, y, z, dir = DW_Location( NPCTable[i] )
		if OrgID == 123230 then
			Actor[1] = CreateObj( 123238, x, y, z, dir, 1 )
		end
		if OrgID == 123237 then
			Actor[2] = CreateObj( 123232, x, y, z, dir, 1 )
		end
		if OrgID == 123237 then
			Actor[3] = NPCTable[i]
		end
	end

	--需要的NPC是123238和123232
	for i = 1, 2 do
		MoveToFlagEnabled( Actor[i], false )
		--
		if i == 1 then	--威爾 蹲下處理
			SetDefIdleMotion(Actor[1], ruFUSION_MIME_CROUCH_LOOP)
		end
		if i == 2 then	--培姬 施法處理
			SetDefIdleMotion( Actor[2], ruFUSION_MIME_RUN_CHARGE2)
			CallPlot(Actor[2], "LuaPG_Z29_123237_03", 0)
			--CastSpell(Actor[2], Actor[3], 851383)
		end
		AddToPartition( Actor[i], RoomID )
	end
	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--給予Client劇情所需要的判斷用buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--撥放音樂相關處理
		Lua_StopBGM( PlayerID )		--停止玩家背景音樂的播放
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/zone/005/zone005_night_01.mp3", true )
	end
	Sleep(40)
	--至此所有NPC演員已經準備好，記錄在Actor這個陣列當中
	Say( Actor[1], "[SC_Z29Q426786_3]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[1], "[SC_Z29Q426786_4]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[1], "[SC_Z29Q426786_5]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[1], "[SC_Z29Q426786_6]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	ScriptMessage( Actor[2], 0, 2, "[SC_Z29Q426786_7]", C_SYSTEM )
	for i = 1, #ActPlayerTable do		--給予水晶的隱藏buff
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548798, 1)
	end
	WriteRoleValue(Actor[2], EM_RoleValue_Register7, 1)		--讓培姬停下法術的值
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	SetDefIdleMotion( Actor[2], ruFUSION_MIME_IDLE_STAND )	
	AdjustFaceDir( Actor[2], Actor[1], 0 )
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Say( Actor[2], "[SC_Z29Q426786_8]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	Say( Actor[2], "[SC_Z29Q426786_9]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[2], "[SC_Z29Q426786_10]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[2], "[SC_Z29Q426786_11]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(10)
	AddBuff(Actor[2], 625145, 0, 3)
	DelObj(Actor[2])
	ScriptMessage( Actor[1], 0, 2, "[SC_Z29Q426786_12]", C_SYSTEM )	
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #ActPlayerTable do		--對玩家的處理
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548792, 1 )	--給予下一個任務的重要物品
		CancelBuff( PlayerID, BuffID )	--刪除Client顯像用buff
		--停止播放劇情bgm 回復原本的bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	DelObj( Actor[1] )
end

--=======================靠近培姬的攻擊效果
function LuaPG_Z29_123237_02()	--培姬周圍火焰鎮退
	local NPC = OwnerID()
	local PlayerList = {}
	CastSpell(NPC, NPC, 851389)
	while 1 do
--		DebugMsg(0,0,"test")
		PlayerList = SearchRangePlayer ( NPC , 35 )
		if #PlayerList~=0	then
			for i=0,#PlayerList do
--				SAY(PlayerList[i],"00")
				CastSpell(NPC, PlayerList[i], 851406)
				ScriptMessage(PlayerList[i],PlayerList[i],1,"[SC_Z29NPC123237_1]", 0 )
				ScriptMessage(PlayerList[i],PlayerList[i],0,"[SC_Z29NPC123237_1]", 0 )
			end
		end
		Sleep(30)
	end
end

function LuaPG_Z29_123237_03()	--對著特效球施放法術
	local NPC = OwnerID()
	local Ball = LuaFunc_SearchNPCbyOrgID( NPC, 123255, 120, 0 )
	local Num
	SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_CHARGE2)
	while 1 do
		Num = ReadRoleValue(NPC,EM_RoleValue_Register7)
		if Num ~=0	then
			break
		else 
			CastSpell(NPC, Ball, 850074)	
		end
		Sleep(10)
	end
end

function LuaPG_Z29_123237_04()	--掛在透明人身上
	AddBuff(OwnerID(), 625144, 0, -1)
end


--=======================傳送
function LuaPG_426786_Up()		--傳到山上
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_426786_Up_02" , 60 )
end

function LuaPG_426786_Up_02()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426786)==true	or
	CheckCompleteQuest(Player, 426786)==true		then
		ChangeZone( Player , 29 , 0 , 12289.9 , 800.4 , 29480.7 , 321 )
	end
end

function LuaPG_426786_Down()		--傳到山下
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_426786_Down_02" , 60 )
end

function LuaPG_426786_Down_02()
	ChangeZone( OwnerID() , 29 , 0 , 12323.6 , -176, 30130.2 , 166 )
end



--=====================================
--421635 木已成舟
--=====================================
--===============接下任務後的表演
--CliBuff:624043
--WalkFlag:781337 no.80~81
function LuaPG_421635_Leave_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local WalkFlag = 781337
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register5)
	if Num == 0	then							--如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register5,999)			
		AddBuff( Player,CliBuff,0, 10)
		local Man = CreateObjByFlag( 123226, WalkFlag, 80, 1)	--生成演戲
		ks_ActSetMode( Man)
		WriteRoleValue(Man, EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( Man, WalkFlag, 81, 0, 1)
		DelObj(Man)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register5,0)
	end
end