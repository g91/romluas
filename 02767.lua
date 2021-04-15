--==============425713 年輕的真龍導師 ==============--

function Lv70_ES_Q1_QA()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425713) == true and CheckFlag(OwnerID(),547089) == false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_424969_B]", "Lv70_ES_Q1_Lesson_1", 0 )
	end
	LoadQuestOption(OwnerID())
end

function Lv70_ES_Q1_Lesson_1()
	SetSpeakDetail(OwnerID(),"[SC_425713_STORY_1]")
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_THANKSGIVING_21]", "Lv70_ES_Q1_Lesson_2",0 )
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Lesson_2()
	SetSpeakDetail(OwnerID(),"[SC_425713_STORY_2]")
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_THANKSGIVING_21]", "Lv70_ES_Q1_QUEST_1", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]", "Lv70_ES_Q1_Lesson_1", 0 )
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Quest_1()
	SetSpeakDetail(OwnerID(),"[SC_425713_QUEST_1]")
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_1_A]", "Lv70_ES_Q1_Quest_2(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_1_B]", "Lv70_ES_Q1_Quest_2(1)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_1_C]", "Lv70_ES_Q1_Quest_2(0)", 0 )
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Quest_2(Num)
	SetSpeakDetail(OwnerID(),"[SC_425713_QUEST_2]")
	if Num == 1 then
		SetFlag(OwnerID(),547090,1)
	end
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_2_A]", "Lv70_ES_Q1_Quest_3(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_2_B]", "Lv70_ES_Q1_Quest_3(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_2_C]", "Lv70_ES_Q1_Quest_3(1)", 0 )
	else
		CloseSpeak(OwnerID())
	end	
end

function Lv70_ES_Q1_Quest_3(Num)
	SetSpeakDetail(OwnerID(),"[SC_425713_QUEST_3]")
	if Num == 1 then
		SetFlag(OwnerID(),547091,1)
	end
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_3_A]", "Lv70_ES_Q1_Quest_4(1)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_3_B]", "Lv70_ES_Q1_Quest_4(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_3_C]", "Lv70_ES_Q1_Quest_4(0)", 0 )
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Quest_4(Num)
	SetSpeakDetail(OwnerID(),"[SC_425713_QUEST_4]")
	if Num == 1 then
		SetFlag(OwnerID(),547092,1)
	end
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_4_A]", "Lv70_ES_Q1_Quest_5(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_4_B]", "Lv70_ES_Q1_Quest_5(1)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_4_C]", "Lv70_ES_Q1_Quest_5(0)", 0 )	
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Quest_5(Num)
	SetSpeakDetail(OwnerID(),"[SC_425713_QUEST_5]")
	if Num == 1 then
		SetFlag(OwnerID(),547093,1)
	end
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_5_A]", "Lv70_ES_Q1_Quest_FINISH(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_5_B]", "Lv70_ES_Q1_Quest_FINISH(0)", 0 )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_QUEST_5_C]", "Lv70_ES_Q1_Quest_FINISH(1)", 0 )	
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Quest_FINISH(Num )
	SetSpeakDetail(OwnerID(),"[SC_425713_FINISH]")
	if Num == 1 then
		SetFlag(OwnerID(),547094,1)
	end
	if CheckAcceptQuest(OwnerID(),425713) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_425713_SCORE]", "Lv70_ES_Q1_Quest_SCORE", 0 )
	else
		CloseSpeak(OwnerID())
	end
end

function Lv70_ES_Q1_Quest_SCORE()
	local key = { 547090 , 547091 , 547092 , 547093 , 547094 }
	local TempKeyPool = {}
	local KeyCheck = 0 	
	if CheckAcceptQuest(OwnerID(),425713) == true then
		for checkkey = 1,5 do
			if CheckFlag(OwnerID(),key[checkkey])==true then
				KeyCheck = KeyCheck +1
			end
		end
	end
	if KeyCheck == 5 then
		SetSpeakDetail(OwnerID(),"[SC_425713_SUCCESS]")
		SetFlag(OwnerID(),547089,1)	
		for keynum = 1,5 do 
		SetFlag(OwnerID(),key[keynum],0)
		end
	else
		SetSpeakDetail(OwnerID(),"[SC_425713_FAIL]")	
		for keynum = 1,5 do 
			SetFlag(OwnerID(),key[keynum],0)
		end		
	end
end

--==============425715 夢行之眠前的心願==============--

function LV70_ES_Q2_0()
	local Player = OwnerID()
	local NPC = TargetID( )
	local DramaCheck = ReadRoleValue(NPC,EM_RoleValue_Register9)

	if CheckAcceptQuest(Player,425715) == true and CheckFlag(Player,547095) == false then	--Q2
		AddSpeakOption( Player, NPC, "[SC_425715_1]", "LV70_ES_Q2_1", 0 )
	elseif  CheckAcceptQuest(Player,425716) == true and CountBodyItem(Player,241651)<30 and CheckBuff(Player,623533)==false   then	--Q3
		AddSpeakOption( Player,NPC, "[SC_425716_2]", "LV70_ES_Q3_1", 0)
	elseif CheckAcceptQuest(player,425717)==true and CheckFlag(player,547096)==false then	--Q4
		if DramaCheck==0 then
        			Lua_AND_RANGEPLAYER(player,Npc,425717)
			AddSpeakOption(Player,player,"[SO_110378_2]","LV70_ES_Q4_Drama_Start",0)		--第一個開啟者
		elseif DramaCheck >0 then
			AddSpeakOption(Player,player,"[SO_110378_2]","LV70_ES_Q4_Drama_AlreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end	
	LoadQuestOption(Player)
end

function LV70_ES_Q2_1()
	SetSpeakDetail(OwnerID(),"[SC_425715_2]")
	SetFlag(OwnerID(),547095,1)
end

function LV70_ES_Q2_FINISH()
	Tell(TargetID(),OwnerID(),"[SC_425715_3]")
end

--==============425716 守護夢行之眠==============--

function LV70_ES_Q3_1()	--對話
	local Player = OwnerID()
	local NPC = TargetID( )
	local plive = ReadRoleValue(player,EM_RoleValue_IsDead)
	local TBuffPos 
	local TBuffInfo
	TBuffPos = Lua_BuffPosSearch(Player,623529)
	TBuffInfo = BuffInfo( Player , TBuffPos , EM_BuffInfoType_Power )
 	if plive==0 then
		if TBuffInfo>= 9 and CheckBuff(Player,623533)==false then
			SetSpeakDetail(Player,"[SC_425716_1]")
			GiveBodyItem(Player,241651,1)
			CastSpell(Npc,Player,850393)		
		else
			SetSpeakDetail(Player,"[SC_425716_3]")		
		end	
	else
		CloseSpeak(player)
	end
end

function LV70_ES_MonsterDeath()
	local monsterlist= {}
	monsterlist = DW_HateRemain( 0 )
	for Player=1,table.getn(monsterlist) do
		if CheckAcceptQuest(monsterlist[Player],425716) == true then
			SysCastSpellLv( OwnerID(),monsterlist[Player], 850391,0 )
		end
	end
end

function LV70_ES_Q3_CancelBuff()	
	CancelBuff(OwnerID(),623529)
	return true
end

function LV70_ES_buff_checkQuest()
	if CheckAcceptQuest(TargetID(),425716)==true then
		return true
	else 
		return false
	end
end
--==============425716 喚醒==============--
function LV70_ES_Q4_Drama_Start()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,9)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425717] = Globle_An_TempPlayerPool[425717] or {};
	Globle_An_TempPlayerPool[425717].playerID = {};
	Globle_An_TempPlayerPool[425717].npc = {};
	Globle_An_TempPlayerPool[425717].music = {};
	table.insert(Globle_An_TempPlayerPool[425717].playerID,player)

	CallPlot(player,"LV70_ES_Q4_Actor",player,npc)
end

function LV70_ES_Q4_Actor(player,npc)

	local FlagNum =781193
	local ActorNum = {}
		ActorNum[0] = 121342
		ActorNum[1] = 121452		
	local ActorPool = {}	

	for key,value in pairs(ActorNum) do
		ActorPool[key]=CreateObjByFlag( value,FlagNum,key,1 )
		table.insert(Globle_An_TempPlayerPool[425717].npc,ActorPool[key])
	end

	CallPlot(ActorPool[0],"LV70_ES_Q4_SHOW",ActorPool,player,Npc)
end

function LV70_ES_Q4_SHOW(ActorPool,player,npc)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	PlayMotionEX(ActorPool[1], ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	AddToPartition(ActorPool[0],XRoomID)
	AddToPartition(ActorPool[1],XRoomID)
	sleep(35)
	AddBuff(player,623540,0,-1)
	Lua_StopBGM(player)
	local TempPlayer = Globle_An_TempPlayerPool[425717].playerID
	local SoundID = PlaySoundToPlayer( player, "music/character selection_02(1).mp3", false )
	Globle_An_TempPlayerPool[425717].music[SoundID] = player
	sleep(10)
	CastSpell(ActorPool[0],ActorPool[1],850392)
	for index,value in pairs(TempPlayer) do
		ScriptMessage(value,value,2,"[SC_425717_0]",0)	
	end
	PlayMotion(ActorPool[0],ruFUSION_ACTORSTATE_CAST_LOOP)
	CallPlot(ActorPool[0],"LV70_ES_Q4_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(30)
	for index,value in pairs(TempPlayer) do
		ScriptMessage(value,value,2,"[SC_425717_1]",0)	
	end
	CallPlot(ActorPool[0],"LV70_ES_Q4_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(30)
	for index,value in pairs(TempPlayer) do
		ScriptMessage(value,value,2,"[SC_425717_3]",0)	
	end
	CallPlot(ActorPool[0],"LV70_ES_Q4_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	for index,value in pairs(TempPlayer) do
		ScriptMessage(value,value,2,"[SC_425717_2]",0)	
	end
	CallPlot(ActorPool[0],"LV70_ES_Q4_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	PlayMotion(ActorPool[1], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	for index,value in pairs(TempPlayer) do
		ScriptMessage(value,value,2,"[SC_425717_4]",0)	
	end
	CallPlot(ActorPool[0],"LV70_ES_Q4_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	WriteRoleValue(npc,EM_rolevalue_register9,0)
	LV70_ES_Q4_PlayerReward()
	CancelBuff(player,623540)
	CallPlot(ActorPool[0],"LV70_ES_Q4_QuestEnd",ActorPool[0],player,npc,ActorPool)
end

function LV70_ES_Q4_PlayerReward()
	for index,value in pairs(Globle_An_TempPlayerPool[425717].music) do
		StopSound(value,index)
		PlaySoundToPlayer( value, "music/title.mp3", false )
	end
	for key,value in pairs(Globle_An_TempPlayerPool[425717].playerID) do
		Lua_PlayBGM(value)
		if CheckAcceptQuest(value,425717)==true and
			CheckDistance(value,OwnerID(),250)==true and 
			CheckBuff(value,623540)==true then
			SetFlag(value,547096,1)
			SetFlag(value,547127,1)
			SetFlag(value,547128,1)
			CancelBuff(value,623540)
			table.remove(Globle_An_TempPlayerPool[425717].playerID,value)
		end
	end
end

function LV70_ES_Q4_QuestEnd(Actor,player,npc,ActorPool)
	local TempPlayerID = Globle_An_TempPlayerPool[425717].playerID
	for key,value in pairs(TempPlayerID) do
		Lua_PlayBGM(value)
		CancelBuff(value,623540)
	end
	for index,value in pairs(Globle_An_TempPlayerPool[425717].music) do
		StopSound(value,index)
	end
	Globle_An_TempPlayerPool[425717].music = nil
	Globle_An_TempPlayerPool[425717].playerID =nil	
	Globle_An_TempPlayerPool[425717].npc =nil
	Globle_An_TempPlayerPool[425717] =nil
	WriteRoleValue(npc,EM_rolevalue_register9,0)

	for key,value in pairs(ActorPool) do
		DelObj(value)
	end
	DelObj(Actor)
end

function LV70_ES_Q4_PlayerCheck(Actor,player,npc,ActorPool)
	local TempPlayerID = Globle_An_TempPlayerPool[425717].playerID
	local QuestTF = 0
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425717)==false then
			QuestTF = QuestTF +1
		end

		if CheckDistance(value,Actor,100)==false then
			DisTF = DisTF +1
		end

		if QuestTF>=1 or DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,623540)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Actor,"LV70_ES_Q4_QuestEnd",Actor,player,npc,ActorPool)
	end
end

function LV70_ES_Q4_Drama_AlreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LV70_ES_Q4_Yes","LV70_ES_Q4_No")
end

function LV70_ES_Q4_Yes()
	local player = OwnerID()
	if Globle_An_TempPlayerPool[425717] ~= nil then
		AddBuff(player,623540,0,-1)
		local SoundID = PlaySoundToPlayer( player, "music/character selection_02(1).mp3", false )
		Globle_An_TempPlayerPool[425717].music[SoundID] = player
		table.insert(Globle_An_TempPlayerPool[425717].playerID,player)
	else
		return
	end
end

function LV70_ES_Q4_No()
	return
end

function Lv70_ES_Q4_FINISH()
	local Player = TargetID()
	SetFlag(Player,547127,1)
end


function LV70_ES_Q5_SETPLOT()
	setplot(OwnerID(),"range","LV70_ES_Q5_GETKEYITEM",40)
end

function LV70_ES_Q5_GETKEYITEM()
	local Player = OwnerID()
	local Ctrl = TargetID()
	local CtrlP = ReadRoleValue(Ctrl,EM_RoleValue_PID)
	local X = 0
	local Y = 0
	if CheckAcceptQuest(Player,425718) == true   then
		X = X+1
	end	
	if CountBodyItem(Player,241652)>0   then
		Y = Y+1
	end
	if X>0 and Y>0 then
		if CtrlP==0 then
			SetFlag(Player,547087,1)
		elseif CtrlP==1 then
			SetFlag(Player,547088,1)
		end
	end
end

function LuaV_LV70_ES_LASTSHOW()
	AddBuff(TargetID(),623540,0,4)
	CastSpell(OwnerID(),OwnerID(),494224)
	sleep(20)
	local Dragon = LuaFunc_createObjByObj( 121452 , OwnerID() )
	PlayMotion(Dragon, ruFUSION_ACTORSTATE_SLEEP_BEGIN)
	sleep(10)
	AddBuff(Dragon,622610,0,1)
	sleep(5)
	DelObj(Dragon)
	sleep(5)
	CancelBuff(TargetID(),623540)
end

-----------------------------------------------學習精英技能的對話選項-----------------------------------------------
function LuaV_LV70_ES_learnskill_0()
	if CheckCompleteQuest(OwnerID(),425719)==true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_425719_0]","LuaV_LV70_ES_learnskill_1",0)
	end
	LoadQuestOption(OwnerID())
end

function LuaV_LV70_ES_learnskill_1()
	local Player = OwnerID()
	local MainVoc= ReadRoleValue(Player,EM_RoleValue_VOC)
	local SubVoc= ReadRoleValue(Player,EM_RoleValue_VOC_SUB)
	local CheckState = LV70_Learning_Script()
	if CheckState == true then
 		Lua_240780_SrvScript()
		ScriptMessage(OwnerID(),OwnerID(),2,"[SC_425719_1]",0)
	else
		CloseSpeak(Player)
		return 
	--	ScriptMessage(OwnerID(),OwnerID(),2,"[SC_425719_2]",0)
	end
	CloseSpeak(OwnerID())
end

function LV70_Learning_Script()--物品使用檢查
	local Player=OwnerID();
	local SubVoc=ReadRoleValue(Player,EM_RoleValue_VOC_SUB);
	if SubVoc==-1 then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_NOSUBVOC]", 0 );--警告訊息：你沒有副職！請裝備你的副職，若是沒有副職請尋找一個。
		return false;
	end
	local subLv = ReadRoleValue(OwnerID(),EM_RoleValue_LV_SUB)
	local mainLv =  ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if mainLv<70 or subLv<70 then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_LVTOOLOW]", 0 );--警告訊息：使用條件不符
		ScriptMessage(Player,Player,2,"[SC_425719_2]",0);--警告訊息：似乎還不是時候
		return false;
	end
	local MainVoc=ReadRoleValue(Player,EM_RoleValue_VOC);
--	if MainVoc==9 or MainVoc==10 or SubVoc==9 or SubVoc==10 then
--		ScriptMessage( Player, Player, 1, "[SYS_GAMEMSGEVENT_422]", 0 );--警告訊息：使用條件不符
--		return false;
--	end
	local NextLevelScale= Lua_Across10Lv_CheckKeyItem(MainVoc,SubVoc)  -- 待學技能的下個級別(目前主副組合)
	if NextLevelScale==70 then
		return true;
	elseif  NextLevelScale>70 then
		ScriptMessage(Player,Player,1,"[SC_SYSWARNING_HADBEENHIGHEST]",0);--警告訊息：你已經學會此組合的所有技能！目前沒有更多的內容可供你學習。
		return false;
	else
		ScriptMessage( Player, Player, 1, "[SC_SYS_NEEDLEAD]", 0 );--警告訊息：尚未完成前一階段技能的學習
		ScriptMessage(Player,Player,2,"[SC_425719_2]",0);--警告訊息：似乎還不是時候
		return false;
	end
	local NextPairLvScale=Lua_Across10Lv_CheckLv(MainVoc,SubVoc) --人物雙職業的下個級別
	if NextPairLvScale<=NextLevelScale then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_LVTOOLOW]", 0 );--警告訊息：你的等級不足，請確認你符合學習此技能的門檻。
		return false;
	end
	NextLevelScale= Lua_Across10Lv_CheckKeyItem(SubVoc , MainVoc)  -- 待學技能的下個級別(相反主副組合)
	if NextPairLvScale<=NextLevelScale then
		ScriptMessage( Player, Player, 1, "[SC_SYSWARNING_LVTOOLOW]", 0 );--警告訊息：你的等級不足，請確認你符合學習此技能的門檻。
		return false;
	end
	local checkbeforeLv50 = DW_EliteSkill_tBackDoor()
	DebugMsg(0,0,"checkbeforeLv50="..checkbeforeLv50)
	if checkbeforeLv50==false then
		DebugMsg(0,0,"checkbeforeLv50="..checkbeforeLv50)
		ScriptMessage( Player, Player, 1, "[SYS_GAMEMSGEVENT_422]", 0 );--警告訊息：使用條件不符
		return false;
	end
	return true;
end

--==--
function Lv60_Es_Flag_Test()
	local Player=OwnerID();
	local MainVoc=ReadRoleValue(Player,EM_RoleValue_VOC);
	local SubVoc=ReadRoleValue(Player,EM_RoleValue_VOC_SUB);
	local NextLevelScale= Lua_Across10Lv_CheckKeyItem(MainVoc,SubVoc)  -- 待學技能的下個級別(目前主副組合)
	if CheckCompleteQuest(player,425709)==true and NextLevelScale==60 then
		Lua_Across10Lv_GetKeyItem(NextLevelScale)
		CastSpell(Player,Player,491010 )
		ScriptMessage( Player, Player, 3, "[SC_111454_9]", C_YELLOW )--恭喜你！你學到新的技能！
		return;	
	else
		LoadQuestOption(player)
		--ScriptMessage( Player, Player, 1, "[SYS_GAMEMSGEVENT_422]", 0 );--警告訊息：使用條件不符
		return
	end
	LoadQuestOption(player)
end

function Lv60_Es_AllFlag_Test()
	local player = OwnerID()
	local Skilltable = {}
	Skilltable[1]=546730
	Skilltable[2]=546732
	Skilltable[3]=546734
	Skilltable[4]=546736
	Skilltable[5]=546738
	Skilltable[6]=546740
	Skilltable[7]=546742
	Skilltable[8]=546744
	Skilltable[9]=546746
	Skilltable[10]=546748
	Skilltable[11]=546750
	Skilltable[12]=546752
	Skilltable[13]=546754
	Skilltable[14]=546756
	Skilltable[15]=546758
	Skilltable[16]=546760
	Skilltable[17]=546762
	Skilltable[18]=546764
	Skilltable[19]=546766
	Skilltable[20]=546768
	Skilltable[21]=546770
	Skilltable[22]=546772
	Skilltable[23]=546774
	Skilltable[24]=546776
	Skilltable[25]=546778
	Skilltable[26]=546780
	Skilltable[27]=546782
	Skilltable[28]=546784
	Skilltable[29]=546786
	Skilltable[30]=546788
	Skilltable[31]=546790
	Skilltable[32]=546792
	Skilltable[33]=546794
	Skilltable[34]=546797
	Skilltable[35]=546799
	Skilltable[36]=546801
	Skilltable[37]=546803
	Skilltable[38]=546805
	Skilltable[39]=546807
	Skilltable[40]=546809
	Skilltable[41]=546811
	Skilltable[42]=546813
	Skilltable[43]=546815
	Skilltable[44]=546817
	Skilltable[45]=546819
	Skilltable[46]=546821
	Skilltable[47]=546823
	Skilltable[48]=546825
	Skilltable[49]=546827
	Skilltable[50]=546829
	Skilltable[51]=546831
	Skilltable[52]=546833
	Skilltable[53]=546835
	Skilltable[54]=546837
	Skilltable[55]=546839
	Skilltable[56]=546841
	Skilltable[57]=546843
	Skilltable[58]=546845
	Skilltable[59]=546847
	Skilltable[60]=546849
	Skilltable[61]=546851
	Skilltable[62]=546853
	Skilltable[63]=546855
	Skilltable[64]=546857
	Skilltable[65]=546859
	Skilltable[66]=546861
	for i=1,66 do 
		SetFlag(player,Skilltable[i],1)
	end
end