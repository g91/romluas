--z23主線、副本=======================================
--=======================================
--425233  蟻族與元素
---------------------------------------------------------------------------
--FLAG:546244
function LuaPG_425233_Lyth_01()
	local Player = OwnerID()
	local NPC = TargetID()	

	if CheckAcceptQuest(Player, 425233)==true	and
	CheckFlag(Player, 546244)==false		then
		SetSpeakDetail(Player, "[SC_425233_01]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_01]", "LuaPG_425233_Lyth_02(2)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_02]", "LuaPG_425233_Lyth_02(4)", 0)
	else
		LoadQuestOption(Player)	
	end
	LuaPG_425234_Ask()
end

function LuaPG_425233_Lyth_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()	

	if Option==2		then		--問庫勒奇蟻
		SetSpeakDetail(Player, "[SC_425233_02]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_02]", "LuaPG_425233_Lyth_02(4)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_03]", "LuaPG_425233_Lyth_02(3)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_04]", "LuaPG_425233_Lyth_02(1)", 0)

	elseif Option==3	then		--問古老結界
		SetSpeakDetail(Player, "[SC_425233_03]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_01]", "LuaPG_425233_Lyth_02(2)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_02]", "LuaPG_425233_Lyth_02(4)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_04]", "LuaPG_425233_Lyth_02(1)", 0)
				
	elseif Option==4	then		--問龍族
		SetSpeakDetail(Player, "[SC_425233_04]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_01]", "LuaPG_425233_Lyth_02(2)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_04]", "LuaPG_425233_Lyth_02(1)", 0)

	elseif Option==1	then
		CloseSpeak(Player)
		SetFlag(Player, 546244, 1)
	end
end




--=======================================
--425234  生死之界的戰事
---------------------------------------------------------------------------
function LuaPG_425234_Give()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if CheckAcceptQuest(Player, 425234)==true	and
	CountBodyItem(Player, 241326)==1		and
	CheckFlag(Player, 546496)==false		then
		AddSpeakOption(Player, NPC, "[SC_425234_01]", "LuaPG_425234_Give_02", 0)
	end
end

function LuaPG_425234_Give_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	DelBodyItem(Player, 241326, 1)
	SetFlag(Player, 546496, 1)
end

function LuaPG_425234_Ask()
	local Player = OwnerID()
	local NPC = TargetID()

	if CheckAcceptQuest(Player, 425234)==true	and
	CountBodyItem(Player, 241326)==0		and
	CheckFlag(Player, 546496)==false		then
		AddSpeakOption(Player, NPC, "[SC_425234_02]", "LuaPG_425234_Ask_02", 0)
	else
		LoadQuestOption(Player)
	end	
end

function LuaPG_425234_Ask_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 241326, 1)
end


--=======================================
--424941  分裂的庫勒奇蟻族
---------------------------------------------------------------------------
function LuaPG_EnhanceSpeed_01()		--反應爐觸碰劇情
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaPG_EnhanceSpeed_02",30 )
end

function LuaPG_EnhanceSpeed_02()		--各種判斷
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01=ReadRoleValue(Machine, EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)

	if DW_CheckQuestAccept("or",Player,424941,425255,425487,425501)==true	and		----判斷任務條件
	CheckFlag(Player, 546283)==false				and		----判斷FLAG
	CountBodyItem(Player, 241269)>=10				then		----判斷身上的物品
		if Num01 == 0						then		----判斷有沒有人使用
			if  BeginCastBarEvent( Player, Machine ,"[SC_FLOWER]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_EnhanceSpeed_03" ) ~= 1 then
										----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
				ScriptMessage( Player, Player, 1,"[SC_424609_USE_01]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424609_USE_01]", "0xffbf0b2b" )
			end
		end
	else
		ScriptMessage( Player, Player, 0,"[SYS_GAMEMSGEVENT_422]", "0xffbf0b2b" )
	end
end

function LuaPG_EnhanceSpeed_03(Player, CheckStatus)
	local Player = OwnerID()
	local Machine = TargetID()
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			EndCastBar( Player , CheckStatus ) 				--清除施法條
			CallPlot(Machine, "LuaPG_EnhanceSpeed_04", Machine,Player)	--觸發劇情
		else --失敗
			EndCastBar( Player , CheckStatus ) 				--清除施法條
		end
	end
end

function LuaPG_EnhanceSpeed_04(Machine,Player)
	WriteRoleValue(Machine , EM_RoleValue_Register1, 999)	
	Sleep(10)
	DelBodyItem(Player, 241269, 10)
	AddBuff(Machine, 622307, 1, 3)
	SetFlag(Player, 546283, 1)
	WriteRoleValue(Machine , EM_RoleValue_Register1, 0)	
end




--=======================================
--424940  線索的碎片
---------------------------------------------------------------------------
--演員：費羅120706、小囉囉A 120707、小囉囉B 120708
--給玩家看戲的BUFF：622310
--走位：781117	no.3～10
function LuaPG_424940_Show()
	local Player = OwnerID()
	local Fillo = TargetID()

	local Num = ReadRoleValue(Fillo, EM_RoleValue_Register1)

	if CheckAcceptQuest( Player, 424940) == true		 and
	 CheckFlag(Player,546300)==false			and
	CountBodyItem(Player, 241274)==0			then
		if Num > 0					then		----檢查玩家是否有任務 並且現在是否正在演戲		
			SetSpeakDetail(Player, "[SC_424940_03]")			----(正在演戲情況下 給予告知)
		elseif Num == 0				then		----如果暫存值為0
			SetSpeakDetail(Player, "[SC_424940_01]")
			AddSpeakOption(Player, Fillo,"[SC_424940_02]","LuaPG_424940_Show_02",0)
		end
	elseif CheckAcceptQuest( Player, 424940) == true		and		----重拿
	 CheckFlag(Player,546300)==true			and
	CountBodyItem(Player, 241274)==0			then
		if Num > 0					then		
			SetSpeakDetail(Player, "[SC_424940_03]")
		elseif Num == 0				then
			AddSpeakOption(Player, Fillo,"[SC_424940_15]","LuaPG_424940_Show_04",0)
		end											
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424940_Show_04()
	local Player = OwnerID()
	local Fillo = TargetID()

	GiveBodyItem(Player, 241274, 1)
	SetSpeakDetail(Player, "[SC_424940_16]")
end

function LuaPG_424940_Show_02()
	local Player = OwnerID()
	local Fillo = TargetID()
	CloseSpeak( Player )						----關閉對話視窗
	
	WriteRoleValue( Fillo, EM_RoleValue_Register1, 999 )		----上鎖 表示正在演戲	
	BeginPlot( Fillo, "LuaPG_424940_Show_03", 0 )			----接演戲function
end

function LuaPG_424940_Show_03()
	local Fillo = OwnerID()						--掛在NPC身上的演戲劇情
	local QuestID = 424940						--任務編號
	local FinishFlagID = 546300					--完成任務獲得的旗標
	local CheckBuffID = 622310					--檢查是否正在演戲的BUFF
	local CheckRange = 120						--演戲的檢查範圍
	local ActorArray = {}						--(新版修改)演員陣列表
	
	local FlagID = 781117						--旗標ID
	-- 事先把所有會用到的演員產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 120706, FlagID, 3, 1 ) 	--費羅
	ActorArray[2] = CreateObjByFlag( 120707, FlagID, 4, 1 ) 	--小囉囉A
	ActorArray[3] = CreateObjByFlag( 120707, FlagID, 5, 1 ) 	--小囉囉B

	CallPlot( Fillo, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式

	AddToPartition( ActorArray[1], 0 )				--費羅in
	ks_ActSetMode( ActorArray[1] )
	sleep(5)

	local PlayerList = SearchRangePlayer( Fillo, CheckRange )
	local Num01 = table.getn(PlayerList)

	--演戲中
	Yell(ActorArray[1],"[SC_424940_14]",1)
	Sleep(25)
	for i = 0,Num01 do
		if CheckAcceptQuest( PlayerList[i], 424940) == true		 and
		 CheckFlag(PlayerList[i],546300)==false				then
			SetPosByFlag( PlayerList[i], FlagID, 10) 			--將物件傳送至旗標位置
	--		Say(PlayerList[i],"MIAU")
		end
	end
	Sleep(5)
	CastSpell(ActorArray[1], PlayerList[0], 850160)--丟藥水BUFF，純表演用

	for i = 1,Num01 do
		if CheckAcceptQuest( PlayerList[i], 424940) == true		 and
		 CheckFlag(PlayerList[i],546300)==false				then
			AddBuff(PlayerList[i], 622645, 0, 5)
		end
	end

	ScriptMessage( TargetID(), TargetID(), 1,"[SC_424940_04]", "0xffbf0b2b" )
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_424940_04]", "0xffbf0b2b" )		
	Sleep(25)
	
	for i=2,3 do							--小囉囉in
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )		
		WriteRoleValue(ActorArray[i]  ,EM_RoleValue_IsWalk , 0 )
	end
	Sleep(10)
	FA_FaceFlagEX(ActorArray[1], FlagID , 7)
	DW_MoveDirectToFlag( ActorArray[2] , FlagID, 6, 0, 1) 
	DW_MoveToFlag( ActorArray[3] , FlagID, 7, 0, 1)
	FA_FaceFlagEX(ActorArray[2], FlagID , 7)
	FA_FaceFlagEX(ActorArray[3], FlagID , 6)
	Yell(ActorArray[2], "[SC_424940_05]",2)
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)	
	Yell(ActorArray[3], "[SC_424940_06]",2)
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(30)
	Yell(ActorArray[3], "[SC_424940_07]",2)
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	Yell(ActorArray[2], "[SC_424940_08]",2)
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)
	Yell(ActorArray[2], "[SC_424940_09]",2)
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(30)
	Yell(ActorArray[2], "[SC_424940_10]",2)
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(20)
	WriteRoleValue(ActorArray[2]  ,EM_RoleValue_IsWalk , 0 )
	DW_MoveDirectToFlag( ActorArray[2] , FlagID, 8, 0, 1) 
	WriteRoleValue(ActorArray[3]  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( ActorArray[3] , FlagID, 9, 0, 1) 
	DelObj(ActorArray[2])	
	DelObj(ActorArray[3])
	
	Sleep(10)
	Yell(ActorArray[1], "[SC_424940_12]",1)
	Sleep(10)
	for i = 0,Num01 do						--給能量資料
		if CheckAcceptQuest( PlayerList[i], QuestID ) == true	and
		CountBodyItem(PlayerList[i], 241274)==0		then
			GiveBodyItem(PlayerList[i], 241274, 1)
		end
	end
	DelObj(ActorArray[1])

	--戲演完了
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- 給予旗標\物品
end






--=======================================
--424960  阿丟輔助用
---------------------------------------------------------------------------
function LuaPG_424960_Accept()
	local Player = TargetID()
	AddBuff(Player, 622181, 0, -1)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_424960_HELP_01]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_424960_HELP_01]", "0xffbf0b2b" )	
end

function LuaPG_AskForMedicine()
	local Player = OwnerID()
	local NPC = TargetID()
	AddBuff(Player, 622181, 0, -1)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_424960_HELP_01]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_424960_HELP_01]", "0xffbf0b2b" )
	CloseSpeak(Player)	
end



--=======================================
--425283  kors輔助用
---------------------------------------------------------------------------
function LuaPG_425283_delmonster()
	local Element = OwnerID()
	local TotalNPC=EM_RoleValue_Register1;
	local CtrlID=EM_RoleValue_PID;
	local ctrl = ReadRoleValue(Element,CtrlID);
	sleep(500);
 	while 1 do
		local NPC_Num = ReadRoleValue(ctrl,TotalNPC);
		if 	HateListCount(Element)==0	then	----檢查仇很列表，沒有人的話
			WriteRoleValue(ctrl,TotalNPC,NPC_Num-1)
			DelObj(Element);			----刪掉自己
			return;
		end
		sleep(20);
	end
end

function LuaPG_425285_Retake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if CheckAcceptQuest( Player, 425285) == true	and
	CountBodyItem(Player,241484)==0		and
	CountBodyItem(Player,241485)==0		then
		AddSpeakOption(Player, NPC,"[SC_425285_RETAKE]","LuaPG_425285_Retake_01(1)",0)
	elseif CheckAcceptQuest( Player, 425286) == true	and
	CountBodyItem(Player,241486)==0		and
	CheckFlag(Player, 546709)==false		then
		AddSpeakOption(Player, NPC,"[SC_425286_RETAKE]","LuaPG_425285_Retake_01(2)",0)
	elseif CheckAcceptQuest( Player, 425287) == true	and
	CountBodyItem(Player,241487)==0		and
	CountBodyItem(Player,240796)==0		and
	CheckFlag(player, 546723)==false		then
		AddSpeakOption(Player, NPC,"[SC_425286_RETAKE]","LuaPG_425285_Retake_01(3)",0)
	end
end

function LuaPG_425285_Retake_01(Option)
	local Player = OwnerID()
	CloseSpeak(Player)
	if Option==1		then
		GiveBodyItem(Player,241484,1)
	elseif Option==2	then
		GiveBodyItem(Player,241486,1)
	elseif Option==3	then
		GiveBodyItem(Player,241487,1)
	end
end

function LuaPG_425286_ClickCheck()
	local Player = OwnerID()
	if CountBodyItem(Player, 241486)~=0	then
		return true
	else
		ScriptMessage(player,player,0,"[SYS_GAMEMSGEVENT_422]",C_SYSTEM)
		return false
	end
end

function LuaPG_425285_Complete()
	Lua_ZonePE_3th_GetScore(100)
	local Player = TargetID()
	local Leader = OwnerID()
	local Grig = LuaFunc_SearchNPCbyOrgID( Leader, 120649, 180, 0 )
	Tell(Player, Grig, "[SC_425285_01]")
end

function LuaPG_424941_Complete()
	Lua_ZonePE_3th_GetScore(150)
	local Player = TargetID()
	local Grig = OwnerID()
	local Leader = LuaFunc_SearchNPCbyOrgID( Grig, 120578, 180, 0 )
	Tell(Player, Leader, "[SC_424941_01]")
end




--=======================================
--副本=======================================
--424450  過去的手記
---------------------------------------------------------------------------
function LuaPG_424450_Note()	--手記內容
	local Player = OwnerID()
	local Pages = {"[SC_424450_NOTEPAGE_01]", "[SC_424450_NOTEPAGE_02]"}
	FA_Border( Player, Pages)
end

function LuaPG_424450_Ask()		--任務完成後可以找維特．亞貝多問話
	local Player = OwnerID()
	local NPC = TargetID()
	
	LoadQuestOption(Player)
	if CheckCompleteQuest(Player, 424450)==true	and
	CheckCompleteQuest(Player, 424450)==false	then
		AddSpeakOption(Player, NPC, "[SC_424450_ASK_01]", "LuaPG_424450_Ask_02", 0)
	end
end

function LuaPG_424450_Ask_02()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_424450_ASK_02]")
end