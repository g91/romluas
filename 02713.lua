---------------------------------------------------------
--		NPC對話			--
---------------------------------------------------------
--StageManager	EM_RoleValue_Register1 = 記錄報名人數
--			EM_RoleValue_Register2 = 記錄報名者
--			EM_RoleValue_Register9 = 記錄可不可以啟動	0表示可以 1表示玩家挑戰中 2表示NPC表演中
--			EM_RoleValue_Register10 = 記錄表演狀態	0表示沒事  -1表示挑戰失敗 -2表示玩家中途報名
--
--Player		EM_RoleValue_Register7 = 用來紀錄玩家分數
--			EM_RoleValue_Register8 = 判斷玩家是否答對 0 表示還沒 1表示答對
--			EM_RoleValue_Register9 = 在玩家身上記錄現在是否輪到他演出, 寫為1表示該他了
--			EM_RoleValue_Register10 = 記錄玩家現在應該說哪句台詞


function FN_FairyTale2012_StageManager()	--起始對話
	--OwnerID = 玩家
	--TargetID = NPC
	local StageManager = TargetID()
	local Player = OwnerID()
	local Enable = ReadRoleValue(StageManager, EM_RoleValue_Register9)
	
	if Enable == 1 then
		SetSpeakDetail(Player,"[FN_FAIRYTALE2012_SPEAKUNABLE]")
	elseif CheckFlag(Player, 541322) == true then
		SetSpeakDetail(Player,"[FN_FAIRYTALE2012_ALREADYPLAY]")
	else
		SetSpeakDetail(Player,"[FN_FAIRYTALE2012_SPEAK01]")
		AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER02]","FN_FairyTale2012_Register",0)
	end
	if Enable == 0 then	--NPC不在表演中、玩家也沒有挑戰中 才顯示此選項
		AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER05]","FN_FairyTale2012_NPCActor",0)	--我想看彩排
	end
	AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER01]","FN_FairyTale2012_Rule",0)
end

function FN_FairyTale2012_Rule()	--說明規則
	local StageManager = TargetID()
	local Player = OwnerID()

	SetSpeakDetail(Player,"[FN_FAIRYTALE2012_RULE]")
end

function FN_FairyTale2012_Register()	--詢問報名
	local StageManager = TargetID()
	local Player = OwnerID()

	SetSpeakDetail(Player,"[FN_FAIRYTALE2012_SPEAK02]")
	AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER03]","FN_FairyTale2012_SingleActor",0)
	AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER04]","FN_FairyTale2012_PartyActor",0)
end

function FN_FairyTale2012_SingleActor()	--決定單排
	local StageManager = TargetID()
	local Player = OwnerID()

	WriteRoleValue(StageManager, EM_RoleValue_Register1, 1)
	WriteRoleValue(StageManager, EM_RoleValue_Register2, Player)
	CallPlot(StageManager, "FN_FairyTale2012_Show")
	--
	WriteRoleValue(StageManager, EM_RoleValue_Register10, -2)	--表示玩家中途報名 打斷NPC表演
	CloseSpeak(Player)
end

function FN_FairyTale2012_PartyActor()		--決定團排
	local StageManager = TargetID()
	local Player = OwnerID()
	local PartyNum = GetPartyID(Player , -1)
	if PartyNum > 4 then PartyNum = 4 end	--玩家隊伍超過4人則設定為最大4人，以免出錯

	if PartyNum == 0 then
		ScriptMessage( StageManager , Player , 1, "[FN_FAIRYTALE2012_NOTTEAM]", 0 )
	else
		WriteRoleValue(StageManager, EM_RoleValue_Register1, PartyNum)
		WriteRoleValue(StageManager, EM_RoleValue_Register2, Player)
		CallPlot(StageManager, "FN_FairyTale2012_Show")
	end
	WriteRoleValue(StageManager, EM_RoleValue_Register10, -2)	--表示玩家中途報名 打斷NPC表演
	CloseSpeak(Player)
end

function FN_FairyTale2012_NPCActor()		--決定NPC綵排
	local StageManager = TargetID()
	local Player = OwnerID()
	local PartyNum = GetPartyID(Player , -1)

	WriteRoleValue(StageManager, EM_RoleValue_Register1, 0)
	--WriteRoleValue(StageManager, EM_RoleValue_Register2, Player)
	CallPlot(StageManager, "FN_FairyTale2012_Show")
	CloseSpeak(Player)
end
---------------------------------------------------------
--		活動主體			--
---------------------------------------------------------
function FN_FairyTale2012_Show()		
	local StageManager = OwnerID()

	local PartyNum = ReadRoleValue(StageManager, EM_RoleValue_Register1)	--記錄玩家參加的人數, 順便當作判斷這次表演是玩家活動還是NPC表演
	local Register = ReadRoleValue(StageManager, EM_RoleValue_Register2)	--記錄報名的玩家
	local StageActor = FN_FairyTale2012_SetActor(PartyNum, Register)		--安排真正上台的演員

	local ActorStepNum = 0
	local ActorStep ={1, 4, 3, 4, 2, 3, 1, 2, 4, 2, 1, 3, 4, 2, 4, 1, 3, 2, 3, 1, 2, 1, 4, 3} 	--演員登板順序

--	if ReadRoleValue(StageManager, EM_RoleValue_Register9) == 2 then		--EM_RoleValue_Register9 == 2 表示NPC表演中，不斷間隔1秒重新CallPlot直到彩排被成功中斷
--		Sleep(10)
--		CallPlot(StageManager, "FN_FairyTale2012_Show")
--		return
--	else
		WriteRoleValue(StageManager, EM_RoleValue_Register10, 0)		--重設表演的狀態檢查	0表示沒事 -1表示玩家表演失敗
		if PartyNum == 0 then
			WriteRoleValue(StageManager, EM_RoleValue_Register9, 2)	--NPC彩排中
		else
			WriteRoleValue(StageManager, EM_RoleValue_Register9, 1)	--把NPC寫為表演中不要受到打擾
		end

--	end


	--台詞
	local LinesTable = {}		--台詞
	for i=1,4 do			--每句台詞初始設定
		LinesTable[i] = {}
		for y=1,6 do
			LinesTable[i][y] = "[".."FN_FAIRYTALE2012_STRING0"..i.."_0"..y.."]"
		end
	end
	local LinesNum = {0, 0, 0, 0}	--記錄每個演員要說第幾句台詞
	--
	while true do
		ActorStepNum = ActorStepNum + 1		--演戲步驟
		local ActorWho = ActorStep[ActorStepNum]	--第幾號上場演員, 這個local純粹是方便閱讀
		--旁白額外處理
		if ActorStepNum == 1 or ActorStepNum == 14 then
			FN_FairyTale2012_Aside(StageManager, ActorStepNum)
		end
		--進行表演
		LinesNum[ActorWho] = LinesNum[ActorWho] + 1
		FN_FairyTale2012_ActorCheck(StageActor[ActorWho] , LinesTable[ActorWho][LinesNum[ActorWho]], LinesNum[ActorWho]+1, StageManager)
		--
		Sleep(45)
		--檢查表演是不是演完、失敗或是中斷
		if ActorStepNum == 24 or ReadRoleValue(StageManager, EM_RoleValue_Register10) == -1 or ReadRoleValue(StageManager, EM_RoleValue_Register10) == -2 then
			FN_FairyTale2012_Finish(StageManager, PartyNum, StageActor, ActorStepNum)
			return
		end
	end
end
---------------------------------------------------------
--		每步驟演員執行			--
---------------------------------------------------------
function FN_FairyTale2012_ActorCheck(Actor, Line, LinesNum, StageManager)	--每次輪到演員時執行這個
--參數1 = 登板的演員 , 參數2 = 要說的台詞, 參數3 = 台詞號碼, 參數4 = 舞臺經理
	local time = 0

	if ReadRoleValue(Actor, EM_RoleValue_IsNPC) == 0 then	--如果登板的是玩家
		WriteRoleValue(Actor, EM_RoleValue_Register8, 0)		--Register8 判斷玩家是否答對 0 表示還沒 1表示答對
		WriteRoleValue(Actor, EM_RoleValue_Register9, 1)		--在玩家身上記錄現在是否輪到他演出, 寫為1表示該他了
		WriteRoleValue(Actor, EM_RoleValue_Register10, LinesNum)	--記錄玩家現在應該說哪句台詞
	end

	while true do	--迴圈檢查玩家表演狀態
		if ReadRoleValue(Actor, EM_RoleValue_Register8) == 1 or ReadRoleValue(Actor, EM_RoleValue_IsNPC) == 1 then	--表示玩家答對了 / 或是演員是NPC
			PlayMotion( Actor,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			Say(Actor, Line)	--答對了就幫他說台詞
			--
			FN_FairyTale2012_ScoreCount(Actor, time)
			WriteRoleValue(Actor, EM_RoleValue_Register9, 0)	--在玩家身上記錄現在是否輪到他演出, 寫為0表示現在不是他該上場
			return
		else
			if time == 100 then	--超過時間 失敗
				WriteRoleValue(StageManager, EM_RoleValue_Register10, -1)
				return
			elseif time == 65 then	--該提醒玩家了
				Tell( Actor, StageManager, "[FN_FAIRYTALE2012_TELL]" )
			end
		end
		--
		Sleep(5)
		time = time + 5
	end
end
---------------------------------------------------------
--		玩家說台詞技能			--
---------------------------------------------------------
function FN_FairyTale2012_ActorSay()
	local Actor = OwnerID()
	local IsMe = ReadRoleValue(Actor, EM_RoleValue_Register9)	--判斷現在是否輪到玩家演出, 寫為1表示該他了
	local WhatLines = ReadRoleValue(Actor, EM_RoleValue_Register10)	--判斷要說哪句台詞

	--EM_RoleValue_Register7 用來紀錄玩家分數

	if IsMe == 1 then
		WriteRoleValue(Actor, EM_RoleValue_Register8, 1)	--Register8 判斷玩家是否答對 0 表示還沒 1表示答對
	else
		local Score = ReadRoleValue(Actor, EM_RoleValue_Register7)
		ScriptMessage( Actor, Actor, 1, "[FN_FAIRYTALE2012_WRONG]", 0 )
		if Score >= 60 then
			WriteRoleValue(Actor, EM_RoleValue_Register7, Score-60)
		else
			WriteRoleValue(Actor, EM_RoleValue_Register7, 0)
		end
	end
	
end
---------------------------------------------------------
--		玩家台詞答對&分數計算	--
---------------------------------------------------------
function FN_FairyTale2012_ScoreCount(Actor, time)
	if ReadRoleValue(Actor, EM_RoleValue_IsNPC) == 1 then return end	--NPC不算分
	--
	local ScoreString
	local BaseScore = 100
	local NowScore = ReadRoleValue(Actor, EM_RoleValue_Register7)
	local TimeTable = {10, 30, 60, 100}
	local StringTable = {"[FN_FAIRYTALE2012_SCORESTRING_10]", "[FN_FAIRYTALE2012_SCORESTRING_40]", "[FN_FAIRYTALE2012_SCORESTRING_60]", "[FN_FAIRYTALE2012_SCORESTRING_100]"}
	
	for i=1, table.getn(TimeTable) do	--以玩家花費的時間來判斷給予玩家何種稱讚
		if time <= TimeTable[i] then 
			ScoreString = StringTable[i] 
			ScriptMessage( Actor, Actor, 2, ScoreString, C_SYSTEM )
			break
		end
	end
	--
	if time <= 10 then BaseScore = 150 end	--玩家表現超好的話，基礎分數提高
	NowScore = NowScore + (BaseScore - time)
	WriteRoleValue(Actor, EM_RoleValue_Register7, NowScore)	--Register7 記錄玩家分數

end
---------------------------------------------------------
--		演出玩家設定			--
---------------------------------------------------------
function FN_FairyTale2012_SetActor(PartyNum, Register)	--參數1 = 幾個玩家參與活動, 參數2 = 報名者ID
	local StageManager = OwnerID()
	local RoomID = ReadRoleValue(StageManager, EM_RoleValue_RoomID)
	local NpcActor = {121156,121157,121158,121159}	--NPC演員表
	local StageActor = {0, 0, 0, 0}
	local ActorWhoString = {"[FN_FAIRYTALE2012_ACTORWHO1]","[FN_FAIRYTALE2012_ACTORWHO2]","[FN_FAIRYTALE2012_ACTORWHO3]","[FN_FAIRYTALE2012_ACTORWHO4]"}
	if PartyNum == 1 then	--單人
		local who =DW_Rand(4) 
		StageActor[who] = Register
	elseif PartyNum > 1 then	--多人
		local ActorPlace = DW_Rand(4)
		for i = 1, PartyNum do
			if ActorPlace > 4 then ActorPlace = 1 end
			local who = 5-ActorPlace
			StageActor[who] = GetPartyID(Register , i)
			--
			ActorPlace = ActorPlace +1
		end
	end
	for i = 1, table.getn(StageActor) do	
		if StageActor[i] == 0 then	--NPC補上沒人的位置
			StageActor[i] = CreateObjByFlag( NpcActor[i], 781179, i, 1 )
			AddToPartition( StageActor[i], RoomID )
			DisableQuest(StageActor[i], true)
		else				-- 是玩家的話作一些設定
			WriteRoleValue(StageActor[i], EM_RoleValue_Register7, 0) 			--把玩家的分數重設為0
			SetPosByFlag( StageActor[i], 781179, i )						--把玩家傳送到演出位置
			AddBuff(StageActor[i], 501043, 0, 250)						--給玩家活動用Buff
			Tell( StageActor[i], StageManager, ActorWhoString[i] )				--告訴玩家他演誰
			ScriptMessage( StageManager, StageActor[i], 2, ActorWhoString[i], C_SYSTEM )	--告訴玩家他演誰
		end
	end

	return StageActor
end
---------------------------------------------------------
--		演出結束			--
---------------------------------------------------------
function FN_FairyTale2012_Finish(StageManager, PartyNum, StageActor, ActorStepNum)
	if ReadRoleValue(StageManager, EM_RoleValue_Register10) == -1 then	--演出失敗或是被中斷
		PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(StageManager, "[FN_FAIRYTALE2012_SHOWBREAK]")
	elseif ReadRoleValue(StageManager, EM_RoleValue_Register10) == -2 then
		PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(StageManager, "[FN_FAIRYTALE2012_SHOWJOIN]")	
	elseif ActorStepNum == 24 then
		Say(StageManager, "[FN_FAIRYTALE2012_FINISH03]")
		PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		Sleep(25)
		if PartyNum ~= 0 then	--看這次演出是有玩家參與還是NPC綵排
			Say(StageManager, "[FN_FAIRYTALE2012_FINISH01]")
		else
			Say(StageManager, "[FN_FAIRYTALE2012_FINISH02]")			
		end
	end
	----
	local ScorePartyBonus = {10, 12, 14, 16}	--組隊參加的分數獎勵倍率
	local ScoreTable = {1999, 4000, 8000, 10000, 11000, 12000, 13000, 15000}
	local TitleCheck = true

	for i=1,table.getn(StageActor) do
		if ReadRoleValue(StageActor[i], EM_RoleValue_IsPlayer) == 1 then
			local PlayerScore = ReadRoleValue(StageActor[i], EM_RoleValue_Register7)
			PlayerScore = PlayerScore * ScorePartyBonus[PartyNum]
			if ActorStepNum == 24 and ReadRoleValue(StageManager, EM_RoleValue_Register10) ~= -1 then PlayerScore = PlayerScore + 125 end
			ScriptMessage( StageActor[i], StageActor[i], 2, "[FN_FAIRYTALE2012_GOTSCORE][$SETVAR1="..PlayerScore.."]", C_SYSTEM )
			ScriptMessage( StageActor[i], StageActor[i], 0, "[FN_FAIRYTALE2012_GOTSCORE][$SETVAR1="..PlayerScore.."]", C_SYSTEM )
			CancelBuff(StageActor[i], 501043)
			--
			if PlayerScore <13850 then TitleCheck = false end	--稱號門檻檢查
			--
			if CheckFlag(StageActor[i], 541322) == false then
				for h=1,7 do
					if  PlayerScore > ScoreTable[h] and PlayerScore <= ScoreTable[h+1] then
						SetFlag(StageActor[i], 541322, 1)	--每日旗標
						GiveBodyItem(StageActor[i], 240059, h)
						Lua_Festival_08_All(StageActor[i])	--全勤
						break
					end
				end
			end
		else
			DelObj(StageActor[i])
		end
	end
	WriteRoleValue(StageManager, EM_RoleValue_Register9, 0)	--讓舞台經理變為可以啟動
	--隱藏稱號
	if TitleCheck == true and  PartyNum == 4 then
		for i=1,table.getn(StageActor) do
			GiveBodyItem( StageActor[i], 530793, 1 )
		end
	end
end

---------------------------------------------------------
--		旁白				--
---------------------------------------------------------
function FN_FairyTale2012_Aside(StageManager, ActorStepNum)
	PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	if ActorStepNum == 1 then
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE01_1]")
		Sleep(40)
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE01_2]")
	elseif ActorStepNum == 14 then
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE02]")
		Sleep(40)
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE03]")
		Sleep(40)
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE04]")
	end
	Sleep(50)
end

---------------------------------------------------------
--		測試指令				--
---------------------------------------------------------
function FN_FairyTale2012_Cheat(cheat)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register7, cheat)
end

