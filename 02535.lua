--主線=======================================
--424920  半龍少年的保母
---------------------------------------------------------------------------
function LuaPG_424920_AskFlag()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424920_YUKIN_01]")
	SetFlag(Player, 545814, 1)
end

function LuaPG_424920_AskForHelp()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424920 )==true	and
		CheckFlag(Player, 545814)==true		and
		CheckFlag(Player, 545813)==false		then
			AddSpeakOption(Player, NPC , "[SC_424920_ASK]","LuaPG_424920_Answer", 0)
	end
end

function LuaPG_424920_Answer()
	local Player = OwnerID()
	local NPC = TargetID()

	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )--物件的資料庫編號
	local NPCList = {}
	NPCList[119728] = {"[SC_424920_AL]"; 545813}		--愛兒葛蕾蒂
	NPCList[119721] = {"[SC_424920_IGS]"}			--伊格斯
	
	SetSpeakDetail(Player, NPCList[OrgID][1])
	if	OrgID==119728	then
			SetFlag(Player, 545813, 1)
	end
end


--424920  任務結束表演
---------------------------------------------------------------------------
--演員：吉兒119744、愛兒119745
--走位旗子：781044	no.1～2
--給玩家看戲的BUFF：621123
function LuaPG_424920_Complete()
	local Player = TargetID()
	local Gill = OwnerID()
	local Flag = 781044
	
	local New_Gill = DW_CreateObjEX("obj", 119744, Gill)	----生成演戲吉兒
	ks_ActSetMode( New_Gill )

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,621123,1, 20)
	
	if	Num == 0	then					----如果暫存值為0
		CallPlot(Gill , "LuaPG_424920_Complete_01" , New_Gill , Gill, Player, Flag)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424920_Complete_01(New_Gill , Gill, Player, Flag)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 		----開始演出的標記

	local Al = Lua_DW_CreateObj("flag",119745, Flag, 1)		----產生愛兒
	ks_ActSetMode( Al )
	DW_MoveToFlag( Al , Flag, 2, 0, 1)				----愛兒走來（由781044的1走到2）
	PlayMotion(Al, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	NPCSAY(Al, "[SC_424920_AL_SHOW]")				----愛兒說話
	Sleep(25)
	NPCSAY(Gill, "[SC_424920_GILL_SHOW]")				----吉兒說話
	Sleep(25)

	DelObj( Al )							----刪除演員
	DelObj( New_Gill )

	CancelBuff(Player, 621123)
	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 			----寫回吉兒暫存值
end




--===========================================
--424921  指揮室的方針
---------------------------------------------------------------------------
function LuaPG_424921_Understand_00()
	SetSpeakDetail(OwnerID(), "[SC_424921_01]")
	AddSpeakOption(OwnerID(), TargetID() , "[SC_424921_03]","LuaPG_424921_Understand", 0)
end

function LuaPG_424921_Understand()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424921_02]")
	AddSpeakOption(Player, NPC , "[SC_424480_00]","LuaPG_424921_Understand_01", 0)
end

function LuaPG_424921_Understand_01()
	local Player = OwnerID()
	local NPC = TargetID()
	
	CloseSpeak(Player)
	SetFlag(Player, 545815, 1)

	CallPlot(NPC , "LuaPG_424921_Get_Flag", Player, NPC)
end


--接下任務後的表演
---------------------------------------------------------------------------
--演員：吉兒119748
--走位旗子：781044	no.3
--給玩家看戲的BUFF：621124
function LuaPG_424921_Accept()
	local Player = TargetID()
	local Gill = OwnerID()
	local Flag = 781044

	local New_Gill = DW_CreateObjEX("obj", 119748, Gill)		----生成演戲吉兒
	ks_ActSetMode( New_Gill )

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,621124,1,20)
	
	if	Num == 0	then					----如果暫存值為0
		CallPlot(Gill , "LuaPG_424921_Accept_01" , New_Gill , Gill, Player, Flag)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424921_Accept_01(New_Gill , Gill, Player, Flag)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 		----開始演出的標記

	Sleep(10)
	AdjustFaceDir( New_Gill,Player, 0 )
	NPCSAY(New_Gill, "[SC_424921_GILL_LEAVE]")	
	Sleep(20)	
	DW_MoveToFlag( New_Gill , Flag, 3, 0, 1)			----吉兒走到781044的3
	DelObj(New_Gill)
	CancelBuff(Player, 621124)
	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 		----寫回吉兒暫存值
end

--得到flag後的表演
---------------------------------------------------------------------------
--演員：吉兒119748
--走位旗子：781044	no.4
--給玩家看戲的BUFF：621123
function LuaPG_424921_Get_Flag(Player, NPC)
	local Gill = LuaFunc_SearchNPCbyOrgID( NPC, 119743, 200, 0 )
	local Flag = 781044

	local New_Gill = DW_CreateObjEX("obj", 119748, Gill)		----生成演戲吉兒
	ks_ActSetMode( New_Gill )

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,621123,1,20)
	
	if	Num == 0	then					----如果暫存值為0
		CallPlot(Gill , "LuaPG_424921_Get_Flag_01" , New_Gill , Gill, Player, Flag)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424921_Get_Flag_01(New_Gill , Gill, Player, Flag)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 		----開始演出的標記
	
	DW_MoveToFlag( New_Gill , Flag, 4, 0, 1)				----吉兒走到781044的4
	DelObj(New_Gill)
	CancelBuff(Player, 621123)

	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 			----寫回吉兒暫存值
end


----如果取消任務，BUFF就消失
function LuaPG_424921_Cancel_Buff()
--	Say(OwnerID(),"00")
	if	CheckAcceptQuest(OwnerID(),424921)==false	then
		CancelBuff(OwnerID(),621124)
	end
end

--===========================================
--424922  誕生之地的神秘聲音
---------------------------------------------------------------------------
function LuaPG_424922_Range()
	SetPlot( OwnerID(),"range","LuaPG_424922_Range_01",150 )  	----掛在神秘聲音的隱形球身上	
end

function LuaPG_424922_Range_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local QuestID = 424922
	local FlagID = 545819

	CallPlot(NPC , "LuaPG_424922_Range_02" , Player , NPC, QuestID, FlagID)
end

function LuaPG_424922_Range_02(Player , NPC, QuestID, FlagID)
--	Say(Player,"Player")
--	Say(NPC,"NPC")
	local PlayerList = SearchRangePlayer( NPC, 150 )
	local Num = table.getn(PlayerList)
	for i=0, Num do
--		Say(PlayerList[i], "PlayerList[i]")		
		if CheckAcceptQuest( PlayerList[i], QuestID ) == true and
		CheckCompleteQuest( PlayerList[i], QuestID )==false and
		Checkflag( PlayerList[i], FlagID ) == false then

--			Say(PlayerList[i], "PlayerList[i]")
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_02]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_02]", "0xffbf0b2b" )
			Sleep(30)
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_03]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_03]", "0xffbf0b2b" )
			Sleep(40)
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_04]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_04]", "0xffbf0b2b" )
			Sleep(20)
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_05]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_05]", "0xffbf0b2b" )
			SetFlag(PlayerList[i], FlagID, 1)		
		end
	end
end

function LuaPG_424922_Tell()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545818, 1)
end




--===========================================
--424924  第二次掩護行動
---------------------------------------------------------------------------
--接下任務後的表演
---------------------------------------------------------------------------
--演員：貝赫爾119740
--走位旗子：781044	no.5~6
--給玩家看戲的BUFF：621123
function LuaPG_424924_Accept()
	local Player = TargetID()
	local Yukin = OwnerID()
	local Flag = 781044

	local Num = ReadRoleValue(Yukin, EM_RoleValue_Register1)
	AddBuff( Player,621123,1,20)
	
	if	Num == 0	then					----如果暫存值為0
		CallPlot(Yukin , "LuaPG_424924_Accept_01" , Yukin , Player, Flag)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424924_Accept_01(Yukin , Player, Flag)
	WriteRoleValue(Yukin,EM_RoleValue_Register1,999) 		----開始演出的標記

	local Behel = Lua_DW_CreateObj("flag",119740, Flag, 5)		----生成演戲貝赫爾
	ks_ActSetMode( Behel )
	
	DW_MoveToFlag( Behel , Flag, 6, 0, 1)				----貝赫爾走到781044的6
	DelObj(Behel)
	CancelBuff(Player, 621123)
	WriteRoleValue(Yukin, EM_RoleValue_Register1, 0) 		----寫回尤金暫存值
end




--===========================================
--424925  戰術會議
---------------------------------------------------------------------------
--function LuaPG_424925_Accept()
--	AddBuff(TargetID(), 621664, 1, 35)
--end

--演員：貝赫爾119816、尤金119815、卡特溫119787
--給玩家看戲的BUFF：621127
--走位：781044	no.7～10
function LuaPG_424925_Show()
	local Player = OwnerID()
	local Behel = TargetID()

	local Num = ReadRoleValue(Behel, EM_RoleValue_Register1)

	if CheckAcceptQuest( Player, 424925 ) == true		 and
	 CheckFlag(Player,545816)==false			then
		if Num > 0					then			----檢查玩家是否有任務 並且現在是否正在演戲		
			SetSpeakDetail(Player, "[SC_424925_GREET_02]")			----(正在演戲情況下 給予告知)
		elseif Num == 0				then			----如果暫存值為0
			SetSpeakDetail(Player, "[SC_424925_GREET]")
			AddSpeakOption(Player, Behel,"[SC_424925_GREET_01]","LuaPG_424925_Show_02",0)
		end									----接演戲function	
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424925_Show_02()
	local Player = OwnerID()
	local Behel = TargetID()
	CloseSpeak( Player )								----關閉對話視窗
	
	WriteRoleValue( Behel, EM_RoleValue_Register1, 999 )				----上鎖 表示正在演戲	
	BeginPlot( Behel, "LuaPG_424925_Show_03", 0 )				
end

function LuaPG_424925_Show_03()
	local Behel = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424925				--任務編號
	local FinishFlagID = 545816			--完成任務獲得的旗標
	local CheckBuffID = 621127			--檢查是否正在演戲的BUFF
	local CheckRange = 250				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	
	local FlagID = 781044				--旗標ID
	-- 事先把所有會用到的演員產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 119816, FlagID, 6, 1 ) 	 --貝赫爾
	ActorArray[2] = CreateObjByFlag( 119815, FlagID, 8, 1 ) 	--尤金
	ActorArray[3] = CreateObjByFlag( 119787, FlagID, 9, 1 ) 	--卡特溫

	CallPlot( Behel, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式
	for i=1, 2 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end
	sleep(10)

	--演戲中
	NPCSAY(ActorArray[2], "[SC_424925_MEETING]")		--尤金：好啦！進入正題，剛剛說到哪？
	Sleep(20)
	NPCSAY(ActorArray[2], "[SC_424925_MEETING_01]")	--尤金：對，記起來了。我是要問你為什麼反對我的策略？
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(25)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_02]")	--貝赫爾：尋求真龍在[ZONE_PROCESSING_PLANT_LAPRIG]進行空中戰鬥的可能性？
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_03]")	--貝赫爾：不可否認，真龍的力量強大且令人畏懼，不過如此作法，勢必將本營地的局勢從消極轉為積極。
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(50)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_04]")	--貝赫爾：此舉也必定使監護者被下令全面轉為攻勢，若直接以武力相搏，對我方相當不利。
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(40)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_05]")	--貝赫爾：再者，真龍的毀滅性太強，若是過度破壞，恐怕失去的森林將更難以復原。
	Sleep(50)
	NPCSAY(ActorArray[2], "[SC_424925_MEETING_06]")	--尤金：哈哈！[119726]，承認吧！你否認只是為了森林，但這可不是我們現在應該關心的！
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_AMAZED)
	Sleep(40)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_07]")	--貝赫爾：......尤金．怒牙，我關心所有該關心之事，而你才是該放寬眼界之人。
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(30)
	NPCSAY(ActorArray[2], "[SC_424925_MEETING_08]")	--尤金：我告訴你......
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(10)
	AddToPartition( ActorArray[3], 0 )			--卡特溫出現
	Yell(ActorArray[3], "[SC_424925_MEETING_09]", 3)	--卡特溫：不好了！指揮官！那個半龍人惹事了！
	WriteRoleValue(ActorArray[3]  ,EM_RoleValue_IsWalk , 1 )	--卡特溫跑來
	DW_MoveToFlag( ActorArray[3] , FlagID, 10, 0 ,1) 

	local Player = {}
	local PlayerList = SearchRangePlayer( Behel, CheckRange )
	local Num = table.getn(PlayerList)
	for i=0, Num do
--		Say(PlayerList[i], "PlayerList[i]")		
		if CheckAcceptQuest( PlayerList[i], QuestID ) == true and
		CheckCompleteQuest( PlayerList[i], QuestID )==false and
		Checkflag( PlayerList[i], FlagID ) == false and
		CheckBuff(PlayerList[i], CheckBuffID) == true then
			SetFlag(PlayerList[i], 546092, 0)
			--Say(PlayerList[i], "GOT")
		end
	end

	--戲演完了
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- 給予旗標\物品
end

--勞勃的對話
---------------------------------------------------------------------------
function LuaPG_424925_Complete()
	Lua_ZonePE_3th_GetScore(100)
	Setflag(TargetID(), 545875, 1)
end

function LuaPG_424925_Lobo()
	local Player = OwnerID()
	local NPC = TargetID()	

	if CheckAcceptQuest(Player, 424925 )==true	or
	CheckFlag(Player, 545875 )==true		then
		SetSpeakDetail(Player, "[SC_424925_LOBO]")
	else
		LoadQuestOption(Player)
	end		
end

--===========================================
--424926  無心的傷害
---------------------------------------------------------------------------
function LuaPG_424926_Ask()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424926 )==true	and
		CheckFlag(Player, 545820)==false		then
			SetSpeakDetail(Player, "[SC_424926_EAST]")
			AddSpeakOption(Player, NPC , "[SC_424926_ASK]","LuaPG_424926_Ask_01()", 0)
	end
end

function LuaPG_424926_Ask_01()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424926_EAST_01]")
	AddSpeakOption(Player, NPC , "[SC_424926_ASK_02]","LuaPG_424926_Ask_02()", 0)
end

function LuaPG_424926_Ask_02()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424926_EAST_02]")
	SetFlag(Player, 545820, 1)
end

--任務結束表演
---------------------------------------------------------------------------
--演員：士兵A 119840、士兵B 119839、摩瑞克119779
--走位旗子：781044	no.11~14
--給玩家看戲的BUFF：621139
function LuaPG_424926_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local Flag = 781044

	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	AddBuff( Player,621139,1,20)
	
	local SoldierA = LuaFunc_SearchNPCbyOrgID( NPC, 119841, 200, 0 )
	local SoldierB = LuaFunc_SearchNPCbyOrgID( NPC, 119842, 200, 0 )
	local New_SoldierA = DW_CreateObjEX("obj", 119840, SoldierA)
	local New_SoldierB = DW_CreateObjEX("obj", 119839, SoldierB)	
	local SoldierList = {New_SoldierA, New_SoldierB}

	for Name, value in pairs(SoldierList) do
		ks_ActSetMode(value)
		PlayMotionEX( value,ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
	end

	if	Num == 0	then					----如果暫存值為0
		CallPlot(NPC , "LuaPG_424926_Complete_01" , SoldierList, Player, NPC, Flag)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424926_Complete_01(SoldierList, Player, NPC, Flag)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 		----開始演出的標記

	local Merick = Lua_DW_CreateObj("flag",119779, Flag, 11)		----生成演戲摩瑞克
	ks_ActSetMode( Merick )
	NPCSAY(Merick, "[SC_424926_SHOW]")
	DW_MoveToFlag( Merick , Flag, 12, 0, 1)				----摩瑞克走到781044的12

	for Name, value in pairs(SoldierList) do
		NPCSAY(value, "[SC_424926_SHOW_01]")
	end
	Sleep(30)

	DW_MoveDirectToFlag( SoldierList[1] , Flag, 13, 0, 1) 
	WriteRoleValue(SoldierList[2]  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( SoldierList[2] , Flag, 14, 0, 1) 
	
	Sleep(10)
	DelObj(SoldierList[1])
	DelObj(SoldierList[2])
	DelObj(Merick)

	CancelBuff(Player, 621139)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0) 		----寫回暫存值
end



--===========================================
--424927  灼熱之傷
---------------------------------------------------------------------------
--接下任務後的表演
---------------------------------------------------------------------------
--演員：勞勃119846、摩瑞克119845
--走位旗子：781044	no.15～16
--給玩家看戲的BUFF：621141
function LuaPG_424927_Accept()
	local Player = TargetID()
	local Merick = OwnerID()
	local Flag = 781044
	local Buff = 621141

	local New_Merick = DW_CreateObjEX("obj", 119845, Merick)
	local Lober = DW_CreateObjEX("obj", 119846, LuaFunc_SearchNPCbyOrgID( Merick, 119780, 200, 0 ))
	ks_ActSetMode( New_Merick )

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)
	AddBuff( Player,Buff,1,20)
	
	if	Num == 0	then					----如果暫存值為0
		CallPlot(Merick , "LuaPG_424927_Accept_01" , New_Merick, Merick, Lober, Player, Flag, Buff)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424927_Accept_01(New_Merick, Merick, Lober, Player, Flag, Buff)
	WriteRoleValue(Merick,EM_RoleValue_Register1,999) 		----開始演出的標記

	Sleep(10)
	NPCSAY(New_Merick,"[SC_424927_01]")
	PlayMotion(New_Merick, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(20)
	NPCSAY(Lober, "[SC_424927_02]")
	Sleep(10)

	DW_MoveDirectToFlag( New_Merick , Flag, 13, 0, 1) 
	WriteRoleValue(Lober  ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveToFlag( Lober , Flag, 14, 0, 1)

	DelObj(New_Merick)
	DelObj(Lober)

	CancelBuff(Player, Buff)	
	WriteRoleValue(Merick,EM_RoleValue_Register1,0) 		----寫回暫存值
end


--收集完材料的談話
---------------------------------------------------------------------------
function LuaPG_424927_Collect()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424927_05]" )
	AddSpeakOption(Player, NPC, "[SC_424927_06]", "LuaPG_424927_Collect_01", 0)
end

function LuaPG_424927_Collect_01()
	local Player = OwnerID()

	CloseSpeak(Player)
	SetFlag(Player, 545821, 1)
	DelBodyItem(Player, 240848, 10)
end



--===========================================
--424928  善後處理
---------------------------------------------------------------------------
function LuaPG_424928_Check()		----傷藥確認對象
	local Player = OwnerID()
	local NPC = TargetID()
	local PatientList = {}
	PatientList[119848]=545863
	PatientList[119847]=545862
	PatientList[119836]=545864	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	for key,value in pairs(PatientList) do
		if CheckAcceptQuest(Player, 424928) == true and
		key==OrgID and
		CheckFlag(Player, value)==false then
			ScriptMessage( Player , Player , 1 , "[SC_424928_USE]" , 0 ) 		----你使用了[240852]
			ScriptMessage( Player , Player , 0 , "[SC_424928_USE]" , 0 )
			return true						
		elseif key==OrgID and
		CheckFlag(Player, value)==true then
			ScriptMessage( Player , Player , 1 , "[SC_424928_USE_01]" , 0 ) 	----你已經治療過了
			ScriptMessage( Player , Player , 0 , "[SC_424928_USE_01]" , 0 )
			return false	
		end
	end

	if OrgID~= 119848 or 119847 or 119836 then
		ScriptMessage( Player , Player , 1 , "[SC_424928_USE_02]" , 0 ) 	----請對著正確的傷患使用
		ScriptMessage( Player , Player , 0 , "[SC_424928_USE_02]" , 0 )
		return false			
	end

	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_424928_USE_03]" , 0 ) 		----戰鬥中無法治療
		ScriptMessage( Player , Player , 0 , "[SC_424928_USE_03]" , 0 )
		return false
	end

	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_424928_USE_04]" , 0 ) 	----你無法在騎乘時治療
			ScriptMessage( Player , Player , 0 , "[SC_424928_USE_04]" , 0 )
			return false
		end
	end
end

function LuaPG_424928_Use()
	local Player = OwnerID()
	local NPC = TargetID()

	local PatientList = {}
	PatientList[119848]=545863
	PatientList[119847]=545862
	PatientList[119836]=545864	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	
	DelBodyItem(Player, 240852, 1)
	SetFlag(Player, PatientList[OrgID], 1)	
end

function LuaPG_424928_ReTake()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	repeat 
	GiveBodyitem( Player, 240852, 1 )
	until 
	CountBodyItem( Player, 240852 )==5		
end

--任務結束表演
---------------------------------------------------------------------------
--演員：吉兒119849
--走位旗子：781044	no.17～18
--給玩家看戲的BUFF：621141
function LuaPG_424928_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local Flag = 781044
	local Buff = 621141

	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	AddBuff( Player,Buff,1,20)

	if	Num == 0	then					----如果暫存值為0
		CallPlot(NPC , "LuaPG_424928_Complete_01" , Player, NPC, Flag, Buff)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424928_Complete_01(Player, NPC, Flag, Buff)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 		----開始演出的標記

	local Gill = Lua_DW_CreateObj("flag",119849, Flag, 17)
	ks_ActSetMode( Gill )
	Sleep(10)
	NPCSAY(Gill, "[SC_424928_GILL]")
	DW_MoveToFlag( Gill , Flag, 18, 0, 1)				----走來（由781044的17走到18）
	Sleep(30)
	DelObj(Gill)				

	CancelBuff(Player, Buff)	
	WriteRoleValue(NPC,EM_RoleValue_Register1,0) 			----寫回暫存值
end



--===========================================
--424929  殘酷的消息
---------------------------------------------------------------------------
function LuaPG_424929_Tell()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424929 )==true	and
		CheckFlag(Player, 545865)==false		then
			SetSpeakDetail(Player, "[SC_424929_TELL_00]")
			AddSpeakOption(Player, NPC , "[SC_424929_TELL]","LuaPG_424929_Tell_01", 0)
	end
end

function LuaPG_424929_Tell_01()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424929_TELL_01]")
	AddSpeakOption(Player, NPC , "[SC_424929_TELL_02]","LuaPG_424929_Tell_02", 0)
end

function LuaPG_424929_Tell_02(Player,NPC)
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	SetFlag(Player, 545865, 1)
end



--===========================================
--424930  必須思考的事
---------------------------------------------------------------------------
function LuaPG_424930_Tell()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	SetFlag(Player, 545866, 1)
end

function LuaPG_424930_Complete()
	Setflag(TargetID(), 545875, 0)
end