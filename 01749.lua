-------------------------------------------------------------------------------------
--裂隙邊境(對話選項→傳送)
-------------------------------------------------------------------------------------
function LuaS_423016_0() --掛在NPC身上的對話劇情
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423016)==true	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423016_0]","LuaS_423016_1", 0 )
	end
	if	CheckCompleteQuest(OwnerID(),423016)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423016_2]","LuaS_423016_3", 0 )
	end
end
function LuaS_423016_1() -- LuaS_423016_0的對話選項
	CloseSpeak(OwnerID())
	Say(TargetID(),"[SC_423016_1]")
	AddBuff(OwnerID(),505969,1,3)
end
function LuaS_423016_2() --BUFF：505969結束時進行傳送(特別注意相位層數的問題)
	ChangeZone(TargetID(),9,0,-21427,1476,31347.5,174.7)
end
function LuaS_423016_3() -- LuaS_423016_0的對話選項
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),9,0,-21427,1476,31347.5,174.7)
end
-------------------------------------------------------------------------------------
--無風不起浪(對話選項→完成任務旗標)(完成任務→傳送劇情)
-------------------------------------------------------------------------------------
function LuaS_423017_0()--掛在npc身上的對話劇情
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423017)==true	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_0]","LuaS_423017_1", 0 )
	end
end

function LuaS_423017_1()-- LuaS_423017_0的對話選項
	SetSpeakDetail( OwnerID(),"[SC_423017_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_423017_2", 0 )
end

function LuaS_423017_2()-- LuaS_423017_1的對話選項
	SetSpeakDetail( OwnerID(),"[SC_423017_3]")
	SetFlag(OwnerID(),543589,1)
end

function LuaS_423017_3()--完成任務執行的劇情
	ChangeZone(TargetID(),15,0,19.5,193,5.4,59)
end
-------------------------------------------------------------------------------------
--救人要緊(對擊物件→種怪殺掉→秀出流程並使用物品)
-------------------------------------------------------------------------------------
function LuaS_423020_0()--點擊物件後執行劇情
	if	CountBodyItem(OwnerID(),202967)==0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423020_1]", C_Red )
		return -1
	end
--任務進度記次
	DW_QietKillOne(0,103307)
--工人消失&消失前記錄層數
	WriteRoleValue(TargetID(),EM_RoleValue_PID,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
--生出新的工人
	local NewWorker = Lua_DW_CreateObj("obj",ReadRoleValue(TargetID(),EM_RoleValue_OrgID)+173,TargetID())
	MoveToFlagEnabled(NewWorker , false)
	AdjustFaceDir(NewWorker,OwnerID(),0)
--工人表示感謝
	Say(NewWorker,"[SC_423020_0]")
--讓工人持續判斷
	CallPlot(TargetID(),"LuaS_423020_1",NewWorker)
--扣一個物資
	DelBodyItem(OwnerID(),202967,1)
	return 1
end

function LuaS_423020_1(NewWorker) --判斷是否生出新受傷工人的條件
	sleep(300)
	DelObj(NewWorker)
end
-------------------------------------------------------------------------------------
--亞龍巢穴(對話劇情)
-------------------------------------------------------------------------------------
function LuaS_423022_0() --亞龍屍體的對話劇情
	LoadQuestOption(OwnerID())
	if	CheckFlag(OwnerID(),543682)==false	and
		CheckCompleteQuest(OwnerID(),423022)==false	and
		CheckAcceptQuest(OwnerID(),423022)==true	then
--可以看見摩瑞克的旗標
		SetFlag(OwnerID(),543682,1)
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423022_0]", C_Yellow )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423022_0]", C_Yellow )
	end
end
-------------------------------------------------------------------------------------
--暗巷區的驗屍專家(演戲劇情)
-------------------------------------------------------------------------------------
function LuaS_423024_0()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	DisableQuest(OwnerID(),true)
	AddBuff(TargetID(),506112,1,30)
	local Morack = Lua_DW_CreateObj("obj",114685,OwnerID())
	SetDefIdleMotion(Morack,ruFUSION_MIME_IDLE_STAND_02)
	local Night = Lua_DW_CreateObj("flag",114683,780082,1)
	sleep(20)
	Say(Night,"[SC_423024_0]")
	sleep(25)
	Say(Morack,"[SC_423024_1]")
	sleep(25)
	Say(Night,"[SC_423024_2]")
	CastSpell(Night,TargetID(),495198)
	sleep(15)
	Say(Morack,"[SC_423024_3]")
	sleep(20)
	Say(Night,"[SC_423024_4]")
	sleep(30)
	Say(Morack,"[SC_423024_5]")
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_423024_6]", C_Yellow )
	DelObj(Morack)
	DelObj(Night)
	CancelBuff(TargetID(),506112)
	DisableQuest(OwnerID(),false)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
end

function LuaS_423024_1()
	SetPlot(OwnerID(),"range","LuaS_423024_2",100)
end

function LuaS_423024_2()
	if	CheckCompleteQuest(OwnerID(),422976)==true	and
		CheckCompleteQuest(OwnerID(),422980)==false	then
		if	CheckAcceptQuest(OwnerID(),422977)==true	or
			CheckCompleteQuest(OwnerID(),422977)==true	then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423024_7]", C_Yellow )
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_423024_7]", C_Yellow )
		end
	end
end
--助手的對話劇情
function LuaS_423024_3()
	SetSpeakDetail( OwnerID(),"[SC_423024_9]")
end
-------------------------------------------------------------------------------------
--被油淹死的老鼠(對話劇情+物品使用劇情)
-------------------------------------------------------------------------------------
function LuaS_423025_0() --酒館老闆的對話劇情
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423025)==true	then
		if	CountBodyItem(OwnerID(),203461)==0		or
			CountBodyItem(OwnerID(),203462)==0		then
--(詢問這裡有沒有單賣油和活老鼠)
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423025_0]","LuaS_423025_1", 0 )
		end
	end
end

function LuaS_423025_1() --對話劇情延續
	SetSpeakDetail( OwnerID(),"[SC_423025_1]")
--(付錢)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423025_2]","LuaS_423025_2", 0 )
end

function LuaS_423025_2()
	CloseSpeak(OwnerID())
	AddRoleValue(OwnerID(),EM_RoleValue_Money,-1)
	GiveBodyItem(OwnerID(),203461,1)
	GiveBodyItem(OwnerID(),203462,1)
end

function LuaS_423025_3() --物品使用產生物品劇情(使用後消失)
	if	DW_CheckBackpage(OwnerID(),1)	then
		DelBodyItem(OwnerID(),203461,1)
		GiveBodyItem(OwnerID(),203463,1)
		UseItemDestroy()
	end
end


function LuaS_423025_4() --完成任務的對話劇情
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	DisableQuest(OwnerID(),true)
	AddBuff(TargetID(),506113,1,30)
	local Morack = Lua_DW_CreateObj("obj",114686,OwnerID())
	SetDefIdleMotion(Morack,ruFUSION_MIME_IDLE_STAND_02)
	local Night = Lua_DW_CreateObj("flag",114684,780082,1)
	sleep(15)
	Say(Night,"[SC_423025_3]")
	sleep(15)
	Say(Morack,"[SC_423025_4]")
	sleep(25)
	Say(Night,"[SC_423025_5]")
	CastSpell(Night,Morack,495198)
	sleep(10)
	Say(Morack,"[SC_423025_6]")
	sleep(15)
	Say(Night,"[SC_423025_7]")
	sleep(30)
	DelObj(Morack)
	DelObj(Night)
	CancelBuff(TargetID(),506113)
	DisableQuest(OwnerID(),false)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
end
-------------------------------------------------------------------------------------
--凡事禮為先(對話劇情)
-------------------------------------------------------------------------------------
function LuaS_423053_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423053)==true	then
--(和銀星打招呼)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_0]","LuaS_423053_1", 0 )
	end
--需要接任務也有物品才能觸發
	if	CheckAcceptQuest(OwnerID(),423057)==true	and
		CountBodyItem(OwnerID(),203465)>0	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423057_0]","LuaS_423057_1", 0 )
	end
	if	CheckAcceptQuest(OwnerID(),423058)==true	and
		CheckFlag(OwnerID(),543684)==false		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423058_0]","LuaS_423058_1", 0 )
	end
end
function LuaS_423053_1()
	SetSpeakDetail( OwnerID(),"[SC_423053_1]")
--(詢問亞班諾特殊部隊的蹤跡）
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_2]","LuaS_423053_2", 0 )
end
function LuaS_423053_2()
	SetSpeakDetail( OwnerID(),"[SC_423053_3]")
--(聽下去)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_4]","LuaS_423053_3", 0 )
end
function LuaS_423053_3()
	SetSpeakDetail( OwnerID(),"[SC_423053_5]")
--(耐著性子聽下去)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_6]","LuaS_423053_4", 0 )
end
function LuaS_423053_4()
	SetSpeakDetail( OwnerID(),"[SC_423053_7]")
--......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_8]","LuaS_423053_5", 0 )
end
function LuaS_423053_5()
	SetSpeakDetail( OwnerID(),"[SC_423053_9]")
	SetFlag(OwnerID(),543683,1)
end
-------------------------------------------------------------------------------------
--照子放亮點(對話劇情)
-------------------------------------------------------------------------------------
function LuaS_423053_6()
	SetSpeakDetail( OwnerID(),"[SC_423054_0]")
	if	CheckAcceptQuest(OwnerID(),423054)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_1]","LuaS_423053_7", 0 )
	end
end
function LuaS_423053_7()
	SetSpeakDetail( OwnerID(),"[SC_423054_2]")
	SetFlag(OwnerID(),543742,1)
	if	CountBodyItem(OwnerID(),206461)==true		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_3]","LuaS_423053_8", 0 )
	end
end
function LuaS_423053_8()
	SetSpeakDetail( OwnerID(),"[SC_423054_4]")
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DODGE)
end
function LuaS_423053_9()
	SetSpeakDetail( OwnerID(),"[SC_423054_5]")
	if	CheckAcceptQuest(OwnerID(),423054)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_1]","LuaS_423053_10", 0 )
	end
end
function LuaS_423053_10()
	SetSpeakDetail( OwnerID(),"[SC_423054_6]")
	if	CountBodyItem(OwnerID(),206461)==true		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_3]","LuaS_423053_11", 0 )
	end
end
function LuaS_423053_11()
	SetSpeakDetail( OwnerID(),"[SC_423054_7]")
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_HURT_NORMAL)
end
-------------------------------------------------------------------------------------
--(對話劇情)
-------------------------------------------------------------------------------------
function LuaS_423056_0()
	if	CheckCompleteQuest(OwnerID(),423055)==false	then
		SetSpeakDetail( OwnerID(),"[SC_423056_0]")
		if	CheckAcceptQuest(OwnerID(),423055)==true	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423056_2]","LuaS_423056_1", 0 )
		end
	else
		SetSpeakDetail( OwnerID(),"[SC_423056_1]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423056_3]","LuaS_423056_1", 0 )
	end
end
function LuaS_423056_1()
	LoadQuestOption(OwnerID())
end
-------------------------------------------------------------------------------------
--奇特的香味(對話劇情)
-------------------------------------------------------------------------------------
function LuaS_423057_1()
	SetSpeakDetail( OwnerID(),"[SC_423057_1]")
	SetFlag(OwnerID(),543684,1)
end
function LuaS_423057_2()
	SetPlot(OwnerID(),"range","LuaS_423057_3",50)
end
function LuaS_423057_3()
	local Obj = OwnerID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
		ChangeZone(OwnerID(),15,0,-12149.6,-440,10079.6,337)
	else
		ScriptMessage( Obj, Obj, 1, "[SC_205426_1]", 0 )
	end
end
function LuaS_423057_4()
	SetPlot(OwnerID(),"range","LuaS_423057_5",50)
end

function LuaS_423057_5()
	local Obj = OwnerID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
		ChangeZone(OwnerID(),15,0,-9001.9,-630,1643.6,325)
	else
		ScriptMessage( Obj, Obj, 1, "[SC_205426_1]", 0 )
	end
end
-------------------------------------------------------------------------------------
--避免戰鬥的方法(演戲劇情)
-------------------------------------------------------------------------------------

function LuaS_423058_1()
--關閉對話視窗
	CloseSpeak(OwnerID())
	local Player = {}
	Player = SearchRangePlayer ( OwnerID() , 500 )
	for i=0,table.getn(Player)-1,1 do
		if	CheckAcceptQuest(Player[i],423058)	and
			CheckFlag(Player[i],543685)==false	then
			SetFlag(Player[i],543753,1)
			ScriptMessage( Player[i], Player[i], 2, "[SC_DW_0]", C_Yellow )
		end
	end
--關閉內容物
	DisableQuest(TargetID(),true)
	BeginPlot(TargetID(),"LuaS_423058_2",0)
end
function LuaS_423058_2()
--建立過場用的銀星&摩瑞克
	local Star = Lua_DW_CreateObj("obj",114659,OwnerID())
	local Morack = Lua_DW_CreateObj("flag",114640,780081,1)
	sleep(10)
	Say(Morack,"[SC_423058_1]")
	sleep(20)
	Say(Star,"[SC_423058_2]")
	sleep(25)
	Say(Morack,"[SC_423058_3]")
	sleep(30)
	Say(Star,"[SC_423058_4]")
--建出人馬跑進場
	local Scout = Lua_DW_CreateObj("flag",114894,780081,2)
	WriteRoleValue(Scout,EM_RoleValue_IsWalk,0)
	Hide(Scout)
	Show(Scout,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	sleep(10)
	DW_MoveToFlag( Scout , 780081 , 3,0 , 1 )
	Say(Scout,"[SC_423058_5]")
	sleep(15)
	Say(Star,"[SC_423058_6]")
	CallPlot(OwnerID(),"DW_MoveToFlag",Star , 780081 , 4,0 , 1)
	sleep(10)
	SetDir( Morack, 106 )
	DW_MoveToFlag( Scout , 780081 , 5,0 , 1 )
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423058)==true	then
			SetFlag(Player[i],543685,1)
			SetFlag(Player[i],543753,0)
		end
	end
	DelObj(Star)
	DelObj(Scout)
	DelObj(Morack)
	DisableQuest(OwnerID(),false)
end
function LuaS_423058_3()
	AddBuff(TargetID(),506173,1,-1)
end
-------------------------------------------------------------------------------------
--如法泡製(接任務後給buff)
-------------------------------------------------------------------------------------
function LuaS_423059_0()
	AddBuff(TargetID(),505971,1,7200)
end

function LuaS_423059_1()
	CancelBuff(TargetID(),505971)
end
-------------------------------------------------------------------------------------
--以身試藥(範圍索敵劇情)
-------------------------------------------------------------------------------------
function LuaS_423060_0()--貝西摩斯身上的範圍劇情
	SetPlot(OwnerID(),"range","LuaS_423060_1",200)
end
function LuaS_423060_1()--觸發範圍劇情在玩家身上執行的
	if	CheckBuff(OwnerID(),505970)==false	and
		CheckBuff(OwnerID(),506181)==false	then
		SetAttack(TargetID(),OwnerID())
	else
		if	CheckAcceptQuest(OwnerID(),423060)==true	and
			CheckFlag(OwnerID(),543686)==false		then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423060_0]", C_Yellow )
			SetFlag(OwnerID(),543686,1)
		end
	end
end
function LuaS_423060_2()
	local NPC = SearchRangeNPC ( OwnerID() , 600 )
	local CheckOver = false
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==103444	then
			CheckOver = true
			break
		end
	end
	if	CheckOver == true	then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423060_1]", C_Red )
		return false
	end
end
function LuaS_423060_3()
	AddBuff(OwnerID(),505970,1,30)
end
-------------------------------------------------------------------------------------
--外表是假象(使用物品)
-------------------------------------------------------------------------------------
function LuaS_423062_0()--使用物品執行
	if	DW_CheckMap(OwnerID(),762)	or
		DW_CheckMap(OwnerID(),769)	then
--變身buff(變身)
		if	CastSpell(OwnerID(),OwnerID(),495378)	then
--辨識buff(香味)
			AddBuff(OwnerID(),506181,1,7200)
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423062_0]", 0 )
	end
end

function LuaS_423062_1()
	SetPlot(OwnerID(),"range","LuaS_423062_2",1000)
end

function LuaS_423062_2()
	if	CheckAcceptQuest(OwnerID(),423062)==true	and
		CheckFlag(OwnerID(),543758)==false		then
		SetFlag(OwnerID(),543758,1)
	end
end
--對話劇情
function LuaS_423062_3()
	if	CheckBuff(OwnerID(),505972)==true	then
		LoadQuestOption(OwnerID())
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_423062_1]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_423062_1]", C_Yellow )
	end
end
-------------------------------------------------------------------------------------
--對錶(對話劇情)
-------------------------------------------------------------------------------------
function LuaS_423063_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423063)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423063_0]","LuaS_423063_1", 0 )
	end
end
function LuaS_423063_1()
	SetSpeakDetail( OwnerID(),"[SC_423063_1]")
	SetFlag(OwnerID(),543711,1)
end
-------------------------------------------------------------------------------------
--攻其不備出其不意(對話劇情+演戲)
-------------------------------------------------------------------------------------
function LuaS_423064_0()--摩瑞克對話劇情
	if	CheckBuff(OwnerID(),505972)==true	then
		LoadQuestOption(OwnerID())
		if	CheckAcceptQuest(OwnerID(),423064)==true	and
			CheckFlag(OwnerID(),543712)==false		then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423064_0]","LuaS_423064_1", 0 )
		end
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_423062_1]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_423062_1]", C_Yellow )
	end
end
function LuaS_423064_1()--開始戰鬥
	DisableQuest(TargetID(),true)
	CloseSpeak(OwnerID())
	local MSGP = {}
	MSGP = SearchRangePlayer ( TargetID() , 200 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])			and
			CheckFlag(MSGP[i],543712)==false	then
			SetFlag(MSGP[i],543752,1)
			ScriptMessage( MSGP[i], MSGP[i], 0, "[SC_DW_0]", C_Yellow )
		end
	end
	local New = Lua_DW_CreateObj("obj",114644,TargetID())
	BeginPlot(New,"LuaS_423064_2",0)
	CallPlot(TargetID(),"LuaS_423064_3",New)
end
function LuaS_423064_2()
--德蘭妮、洛克、銀星、人馬族出場
	local Delany = Lua_DW_CreateObj("flag",114652,780552,1)
	local Locke = Lua_DW_CreateObj("flag",114792,780552,2)
	local Star = Lua_DW_CreateObj("flag",114650,780552,3)
	local horseman = {}
	for i=1,12,1 do
		horseman[i] = Lua_DW_CreateObj("flag",114748,780551,i)
		Hide(horseman[i])
		WriteRoleValue(horseman[i],EM_RoleValue_IsWalk,0)
	end
	Hide(Delany)
	Hide(Star)
	WriteRoleValue(Delany,EM_RoleValue_IsWalk,0)
	WriteRoleValue(Star,EM_RoleValue_IsWalk,0)
	Show(Delany,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	Show(Star,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	for i=1,12,1 do
		Show(horseman[i],ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	end
--建立一批新的亞班諾特種部隊和研究員
	local Army = {}
	local Research = {}
	for i=1,7,1 do
		Army[i] = Lua_DW_CreateObj("flag",114790,780553,i)
	end
	for i=1,3,1 do
		Research[i] = Lua_DW_CreateObj("flag",114791,780554,i)
	end
	local MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 300 )
--人馬族的勇士！攻擊！
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i], MSGP[i] , 2, "[SC_423064_1]", C_Yellow )
		end
	end
--所有的人轉向
	for i=1,table.getn(Research),1 do
		SetDir( Research[i], 304 )
	end
	for i=1,table.getn(Army),1 do
		SetDir( Army[i], 304 )
	end
	SetDir( Locke, 304 )
	sleep(20)
--洛克：還差一步所有人的改造就要完成，外面在搞什麼！？
	Yell(Locke,"[SC_423064_2]",3)
-- 銀星&人馬族開始移動
	for i=1,table.getn(horseman),1 do
		CallPlot(horseman[i],"DW_MoveToFlag", horseman[i] , 780556 , i+1,0 , 1)
	end
	DW_MoveToFlag(Star , 780556 , 1,0 , 1)
	AdjustFaceDir(Locke,Star,0)
	AdjustFaceDir(Star,Locke,0)
	for i=1,table.getn(Army),1 do
		AdjustFaceDir(Army[i],Star,0)
	end
	for i=1,table.getn(Research),1 do
		AdjustFaceDir(Research[i],Star,0)
	end
	sleep(20)
	for i=1,table.getn(horseman),1 do
		AdjustFaceDir(horseman[i],Locke,0)
	end

--洛克：哼！原來是銀星那個老傢伙。沒關係，我早就為他準備了特別的節目......
	Yell(Locke,"[SC_423064_3]",3)
	sleep(20)
--洛克：喂！你！把那個人馬帶過來！
	Yell(Locke,"[SC_423064_4]",3)
--德蘭妮離開牢籠
	CallPlot(Delany,"DW_MoveToFlag", Delany , 780552 , 4,0 , 1)
	sleep(25)
--洛克：喂！老頭子！你別激動！我們明天就會離開！
	Yell(Locke,"[SC_423064_5]",3)
--摩瑞克和德蘭妮開始移動
	CallPlot(Delany,"DW_MoveToFlag", Delany , 780552 , 6,0 , 1)
	DW_MoveToFlag(OwnerID() , 780552 , 5, 0 , 1)
--洛克：如果你乖乖配合那麼誰都不會受傷！否則的話......
	Yell(Locke,"[SC_423064_6]",3)
	sleep(20)
--施放突刺
	CastSpell(OwnerID(),Locke,495115)
	sleep(5)
--摩瑞克：否則的話你就要下地獄！
	Yell(OwnerID(),"[SC_423064_7]",3)
	sleep(10)
	AdjustFaceDir(Locke,OwnerID(),0)
--洛克：嗚！你？！
	Yell(Locke,"[SC_423064_8]",3)
	sleep(5)
	PlayMotion(Locke,ruFUSION_ACTORSTATE_HURT_NORMAL)
	sleep(15)
--摩瑞克：這刀是為了我的朋友而刺！你應受的苦楚還不只這些！......
	Yell(OwnerID(),"[SC_423064_9]",3)
	sleep(10)
--中央訊息：摩瑞克似乎感覺到什麼異樣！外頭傳來貝西摩斯的怒吼聲！
	MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 400 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i] , MSGP[i] , 0, "[SC_423064_10]", C_Red )
			ScriptMessage( MSGP[i], MSGP[i] , 2, "[SC_423064_10]", C_Red )
		end
	end
	sleep(15)
--摩瑞克：咦？這不可能的......為什麼會有這麼多的元素之力往這裡來！？
	Yell(OwnerID(),"[SC_423064_11]",3)
--產生亞龍
	local dragan = {}
	local xyz = {-11619,-615,4373}
	for i=1,10,1 do
		if	i%2 ==0	then
			xyz[1] = xyz[1]+10
		else
			xyz[3] = xyz[3] +10
		end
		dragan[i] = Lua_DW_CreateObj("xyz",114751,xyz)
		Hide(dragan[i])
		WriteRoleValue(dragan[i],EM_RoleValue_IsWalk,0)
		Show(dragan[i],0)
--關閉索敵
		SetModeEx(dragan[i],EM_SetModeType_Searchenemy,false) 
--往洛克的位置跑過去
		CallPlot(dragan[i],"DW_MoveToFlag",dragan[i] , 780552 , 2,50 , 1  )
	end
--洛克：管你什麼元素之力，竟敢偷襲我！給我去死吧！
	Yell(Locke,"[SC_423064_12]",3)
--施法：覆岩術
	CastSpell(OwnerID(),OwnerID(),495116)
	sleep(10)
--摩瑞克：覆岩術！
	Yell(OwnerID(),"[SC_423064_13]",3)


	local stone = {}
	local Player = SearchRangePlayer ( OwnerID() , 500 )
--產生覆蓋的岩石
	BeginPlot(Star,"LuaS_423064_4",0)
	BeginPlot(Delany,"LuaS_423064_4",0)
	BeginPlot(OwnerID(),"LuaS_423064_4",0)
	for i=4,table.getn(horseman)+3,1 do
		BeginPlot(horseman[i-3],"LuaS_423064_4",0)
	end
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423064)==true	and
			CheckFlag(Player[i],543712)==false	then
			BeginPlot(Player[i],"LuaS_423064_4",0)
		end
	end
--在所有的人身上附上buff
	AddBuff(OwnerID(),506075,1,-1)
	AddBuff(Star,506075,1,-1)
	AddBuff(Delany,506075,1,-1)
	for i=4,table.getn(horseman)+3,1 do
		AddBuff(horseman[i-3],506075,1,-1)
	end
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423064)==true	and
			CheckFlag(Player[i],543712)==false	then
			AddBuff(Player[i],506075,1,-1)
			AddBuff(Player[i],506277,1,30)
		end
	end
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	SetDefIdleMotion(Star,ruFUSION_MIME_IDLE_STAND_02)
	SetDefIdleMotion(Delany,ruFUSION_MIME_IDLE_STAND_02)
	for i=4,table.getn(horseman)+3,1 do
		SetDefIdleMotion(horseman[i-3],ruFUSION_MIME_IDLE_STAND_02)
	end
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423064)==true	and
			CheckFlag(Player[i],543712)==false	then
			SetDefIdleMotion(Player[i],ruFUSION_MIME_IDLE_STAND_02)
		end
	end

--等待亞龍到達預定位置
	while	true	do
		sleep(1)
		if	CheckDistance(Locke,dragan[1], 100)	then
			for i=1,table.getn(Research),1 do
				SetModeEx(Research[i],EM_SetModeType_Fight,true) 
				SetModeEx(Research[i],EM_SetModeType_Strikback,true) 
			end
			for i=1,table.getn(Army),1 do
				SetModeEx(Army[i],EM_SetModeType_Fight,true) 
				SetModeEx(Army[i],EM_SetModeType_Strikback,true) 
			end
			SetModeEx(Locke,EM_SetModeType_Fight,true) 
			SetModeEx(Locke,EM_SetModeType_Strikback,true) 
			for i=1,table.getn(dragan),1 do
				StopMove(dragan[i],true)
--重開索敵
				SetModeEx(dragan[i],EM_SetModeType_Searchenemy,true) 
				SetModeEx(dragan[i],EM_SetModeType_Fight,true) 
				SetModeEx(dragan[i],EM_SetModeType_Strikback,true) 
			end
			break
		end
	end
--亞龍對洛克衝鋒
--戰鬥部份展開
	for i=table.getn(Research)+1,table.getn(dragan),1 do
		for a=1,table.getn(Research),1 do
			SetAttack(dragan[a],Research[a])
		end
		SetAttack(dragan[i],Locke)
		CastSpell(dragan[i],Locke,495117)
	end
	for b=1,table.getn(Army),1 do
		SetAttack(Army[b],dragan[b])
	end
	local Pass = true
	while	Pass	do
		sleep(15)
		if	CheckID(Locke)==false	then
			for i=1,table.getn(Research),1 do
				if	CheckID(Research[i])==true	then
					break
				end
				if	i==table.getn(Research)	then
					for k=1,table.getn(Army),1 do
						if	CheckID(Army[i])==true	then
							break
						end
					end
					Pass =false
				end
			end
		end
	end
--摩瑞克：Tistainra Pean Roitei！
	Yell(OwnerID(),"[SC_423064_14]",3)
	sleep(30)
--亞龍們低吼著瞪著被岩石包覆的摩瑞克
	MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 400 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i] , MSGP[i] , 0, "[SC_423064_15]", C_Red )
		end
	end
	sleep(10)
	for i=1,table.getn(dragan),1 do
		CallPlot(dragan[i],"DW_MoveToFlag",dragan[i] , 780555 , i,0 , 1)
		WriteRoleValue(dragan[i],EM_RoleValue_LiveTime,3)
	end
	sleep(20)
	local Scout = Lua_DW_CreateObj("flag",114749,780551,3)
	Hide(Scout)
	WriteRoleValue(Scout,EM_RoleValue_IsWalk,0)
	Show(Scout,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
--消除buff並清除岩石
	CancelBuff(OwnerID(),506075)
	CancelBuff(Star,506075)
	CancelBuff(Delany,506075)
	for i=4,table.getn(horseman)+3,1 do
		CancelBuff(horseman[i-3],506075)
	end
	local Rock = SearchRangeNPC ( OwnerID() , 500 )
	for i=0,table.getn(Rock),1 do
		if	ReadRoleValue(Rock[i],EM_RoleValue_OrgID)==114868	then
			DelObj(Rock[i])
		end
	end
--消除變身岩石的buff
	Player = SearchRangePlayer ( OwnerID() , 700 )
	for i=0,table.getn(Player)-1,1 do
		if	CheckBuff(Player[i],506075)==true	then
			CancelBuff(Player[i],506075)
		end
	end
--摩瑞克：呼！差點撐不下去......它們是從哪裡跑出來的！
	Yell(OwnerID(),"[SC_423064_16]",3)
--人馬斥候在銀星身旁耳語了幾句，銀星臉上的表情變了數變。
	DW_MoveToFlag( Scout  , 780552,7 , 0 , 1  )
	MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 400 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i] , MSGP[i] , 0, "[SC_423064_17]", C_Red )
		end
	end
	sleep(20)
--銀星：摩瑞克，等一下回營地之後我有點事跟你說，我先帶德蘭妮．銀星回去。
	Yell(Star,"[SC_423064_18]",3)
--撤離
	CallPlot(Scout,"DW_MoveToFlag",Scout , 780555 , 1,0 , 1)
	CallPlot(star,"DW_MoveToFlag",star , 780555 , 2,0 , 1)
	CallPlot(Delany,"DW_MoveToFlag",Delany , 780555 , 3,0 , 1)
	for i=1,table.getn(horseman),1 do
		CallPlot(horseman[i],"DW_MoveToFlag",horseman[i] , 780555 , i+3,0 , 1)
		WriteRoleValue(horseman[i],EM_RoleValue_LiveTime,3)
	end
	WriteRoleValue(Scout,EM_RoleValue_LiveTime,3)
	WriteRoleValue(star,EM_RoleValue_LiveTime,3)
	WriteRoleValue(Delany,EM_RoleValue_LiveTime,3)
	for i=0,table.getn(Player)-1,1 do
		if	CheckBuff(Player[i],506277)==true	then
			CancelBuff(Player[i],506277)
--給符合條件的人完成旗標
			--say(Player[i], "GOT")
		end
			if	CheckAcceptQuest(Player[i],423064)==true	and
				CheckFlag(Player[i],543712)==false	then
				SetFlag(Player[i],543712,1)
			end
	end
	DelObj(OwnerID())
end

function LuaS_423064_3(Tar)
	while	CheckID(Tar)==true	do
		sleep(10)
	end
	DisableQuest(OwnerID(),false)
	return true
end

function LuaS_423064_4()
	local Rock = Lua_DW_CreateObj("obj",114868,OwnerID(),0)
	SetModeEx(Rock ,EM_SetModeType_Mark,false)
	SetModeEx(Rock,EM_SetModeType_Searchenemy,false)
	SetModeEx(Rock,EM_SetModeType_Fight,false)
	AddToPartition(Rock ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --載入同層
	BeginPlot(Rock,"LuaS_423064_5",0)
	PlayMotion(Rock ,ruFUSION_ACTORSTATE_SPAWN_BEGIN)
end
function LuaS_423064_5()
	while CheckID(TargetID())==true	do
		sleep(10)
	end
	DelObj(OwnerID())
	return true
end

function LuaS_423064_6()
	local Man
	while true do
		sleep(50)
		Man = Lua_DW_CreateObj("flag",114746,780083,1)
		DW_MoveToFlag( Man , 780083 , 2,0 , 1  )
		SetDir( Man, 180 )
		CastSpell(Man,Man,495237)
		sleep(20)
		DelObj(Man)
	end
end

function LuaS_423064_7(obj)
	if	CheckAcceptQuest(obj,423064)==true	then
		if	CheckFlag(obj,543712)==false	then
			return true
		else
			return false
		end
	else
		return	false
	end
end

function LuaS_423064_8()
	SetPlot(OwnerID(),"range","LuaS_423064_9",700)
end

function LuaS_423064_9()
	if	CheckAcceptQuest(OwnerID(),423065)	then
		SetFlag(OwnerID(),543803,1)
	end
end

function LuaS_423065_0()
	CancelBuff(TargetID(),505972)
	return true
end

function LuaS_423066_0()
	Say(OwnerID(),"[SC_423066_0]")
	LuaS_Discowood_Motion_Beg()
end

function LuaS_423066_1()
	Say(OwnerID(),"[SC_423066_1]")
	LuaS_Discowood_Motion_Beg()
end