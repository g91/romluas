-----------------------------------------------
--激烈手段 423448
-----------------------------------------------
--玩家攻擊動作的檢查
function LuaS_423448_0()
	local BuffPos
	local BuffPower
--檢查玩家有沒有接受任務
	if	CheckAcceptQuest(TargetID(),423448)	and
		ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==104005	then
--任務：激烈手段
		AddBuff(TargetID(),507212,0,10)
		BuffPos = Lua_BuffPosSearch(TargetID(),507212)
		if	BuffPos~=-1	then
			BuffPower = BuffInfo(TargetID(),BuffPos,EM_BuffInfoType_Power)
DeBugMSG(0,0,"BuffPos="..BuffPos.."####BuffPower="..BuffPower)
--第3次的打擊=>供詞3
			if	BuffPower > 6		then
--符合條件的順便完成任務
				if	CheckFlag(TargetID(),544026)==false		and
					CheckAcceptQuest(TargetID(),423448)==true	then
					SetFlag(TargetID(),544026,1)
				end
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423448_2]", 0 )
				return
			end
--第2次的打擊=>供詞2
			if	BuffPower > 4		then
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423448_1]", 0 )
				return
			end
--第1次的打擊=>供詞1
			if	BuffPower > 2		then
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423448_0]", 0 )
				return
			end
		end
	end
--任務：酒後吐真言
	if	CheckAcceptQuest(TargetID(),423458)	and
		ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==104146	then
		AddBuff(TargetID(),507212,0,10)
		BuffPos = Lua_BuffPosSearch(TargetID(),507212)
		if	BuffPos~=-1	then
			BuffPower = BuffInfo(TargetID(),BuffPos,EM_BuffInfoType_Power)
DeBugMSG(0,0,"BuffPos="..BuffPos.."####BuffPower="..BuffPower)
--可以灌酒了！
			if	BuffPower > 3		then
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423458_0]", 0 )
			end
		end
	end
	return
end
------------------------------------------
--替身官員的死亡劇情
function LuaS_423448_1()
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
	return false
end


-------------------------------------------
--替身官員的對話劇情1
function LuaS_423448_2()
	LoadQuestOption(OwnerID())

	if	CheckAcceptQuest(OwnerID(),423448)==true	and
		CheckFlag(OwnerID(),544026)==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423448_3]","LuaS_423448_3", 0 )
	end
end

-------------------------------------------
--替身官員的對話劇情2(戰鬥前的換人劇情 沙包上場)
function LuaS_423448_3()
	DisableQuest(TargetID(),true)
	CloseSpeak(OwnerID())
	local NewGuy = Lua_DW_CreateObj("obj",104005,TargetID(),0)
--不反擊 不移動
	SetModeEx(NewGuy,EM_SetModeType_Strikback,false) 
	SetModeEx(NewGuy,EM_SetModeType_Move,false) 
	AddToPartition(NewGuy,0)
	SetPlot(NewGuy,"dead","LuaS_423448_1",0)
	AddBuff(NewGuy,507210,0,-1)
	CallPlot(NewGuy,"LuaS_423448_4",TargetID())
	Say(NewGuy,"[SC_423448_4]")
	local BodyGuard = SearchRangeNPC ( OwnerID() , 150 )
	for i=0,table.getn(BodyGuard),1 do
		if	ReadRoleValue(BodyGuard[i],EM_RoleValue_OrgID)==104004	then
			SetAttack(BodyGuard[i],OwnerID())
		end
	end

	DelFromPartition(TargetID())
	DisableQuest(TargetID(),false)
end

-------------------------------------------
--戰鬥結束換人劇情
function LuaS_423448_4(Tar)
	local TempHP = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
DeBugMSG(0,0,"TempHP="..TempHP)
--10秒的發呆期
	sleep(100)
--判斷是否還在戰鬥之中
	while	TempHP>ReadRoleValue(OwnerID(),EM_RoleValue_HP)	do
		TempHP = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
DeBugMSG(0,0,"TempHP="..TempHP)
		if	DW_Rand(2) ==2	then
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			
		else
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		end
		sleep(30)
		if	DW_Rand(2) ==2	then
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			
		else
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		end
		sleep(30)
	end
--離開戰將原本的官員種回來
	AddToPartition(Tar,0)
	DelObj(OwnerID())
end

-----------------------------------------------
--酒後吐真言 423458
-----------------------------------------------
--使用物品的檢查劇情
function LuaS_423458_0()
DeBugMSG(0,0,"1")
--蒙達已經被灌藥
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==115945	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423458_2]", 0 )
		return false
	end
--目標錯誤
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)~=104146	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421101_0]", 0 )
		return false
	end
--確認距離
	if	CheckDistance(OwnerID(),TargetID(), 40)==false	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_102623_17]", 0 )
		return false
	end
--確認進度
	local BuffPos,BuffPower
	BuffPos = Lua_BuffPosSearch(OwnerID(),507212)
	if	BuffPos~=-1	then
		BuffPower = BuffInfo(OwnerID(),BuffPos,EM_BuffInfoType_Power)
		if	BuffPower > 3	then
			return true
		else
--打得還不夠
			PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ROFL)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423458_1]", 0 )
			return false
		end
	else
--打得還不夠
		PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ROFL)
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423458_1]", 0 )
		return false
	end
end

-----------------------------------------------
--使用物品的執行劇情
function LuaS_423458_1()
DeBugMSG(0,0,"2")
	DelFromPartition(TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_423458_3]", 0 )
	local NewGuy = Lua_DW_CreateObj("obj",115945,TargetID())
	CallPlot(NewGuy,"LuaS_423458_3",TargetID())
end


-----------------------------------------------
--蒙達．艾克辛  104146  的初始劇情
function LuaS_423458_2()
--借用官員的不死劇情
	SetPlot(OwnerID(),"dead","LuaS_423448_1",0)
--加上反彈的buff確定進度
	AddBuff(OwnerID(),507210,0,-1)
end


-----------------------------------------------
--誠實的蒙達．艾克辛  115945  的初始劇情
function LuaS_423458_3(Tar)
	AddBuff(OwnerID(),507212,0,60)
	while CheckBuff(OwnerID(),507212)	do
		sleep(20)
	end
	AddToPartition(Tar,0)
	DelObj(OwnerID())
end

-----------------------------------------------
--誠實的蒙達．艾克辛  115945  的對話劇情
function LuaS_423458_4()
	AddBuff(TargetID(),507212,0,60)
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423458)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423458_4]","LuaS_423458_5", 0 )
	end
end

function LuaS_423458_5()
	AddBuff(TargetID(),507212,0,60)
	SetSpeakDetail( OwnerID(),"[SC_423458_5]")
	if	CheckAcceptQuest(OwnerID(),423458)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423458_6]","LuaS_423458_6", 0 )
	end
end

function LuaS_423458_6()
	AddBuff(TargetID(),507212,0,60)
	SetSpeakDetail( OwnerID(),"[SC_423458_7]")
	if	CheckAcceptQuest(OwnerID(),423458)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423458_8]","LuaS_423458_7", 0 )
	end
end

function LuaS_423458_7()
	AddBuff(TargetID(),507212,0,60)
	SetSpeakDetail( OwnerID(),"[SC_423458_9]")
	if	CheckAcceptQuest(OwnerID(),423458)	then
		SetFlag(OwnerID(),544295,1)
	end
end

function LuaS_423458_8()
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
end

-----------------------------------------------
--信號煙火 423459
-----------------------------------------------
--物品檢查劇情
function LuaS_423459_0()
	local NPC = SearchRangeNPC ( OwnerID() , 200 )
	local Morek
--先檢查是否已經有人施放
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115947	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423459_2]", 0 )
			return false
		end
	end
--再檢查摩瑞克的距離是否適中
DeBugMSG(0,0,"table.getn"..table.getn(NPC))
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115946	then
			Morek = NPC[i]
			if	CheckDistance(OwnerID(),Morek, 150)	then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423459_1]", 0 )
				return false
			else
				return true
			end
		end
--都沒人就拉倒！
DeBugMSG(0,0,"i="..i)
		if	i==table.getn(NPC)	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423459_0]", 0 )
			return false
		end
	end
end

--物品使用劇情
function LuaS_423459_1()
	local Fire = {}
	local Director
--先檢查是否已經有人施放
	local NPC = SearchRangeNPC ( OwnerID() , 200 )
	local Morek
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115947	then
			return false
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115946	then
			Morek =  NPC[i]
		end
--都沒人就開始演
		if	i==table.getn(NPC)-1	then
			DisableQuest(Morek,true)
			Director = Lua_DW_CreateObj("flag",115947,780081,1)
--建立隱形球
			Fire[1] = Lua_CreateObjByDir( OwnerID() , 115978 , 25 , 0) 
			Fire[2] = Lua_DW_CreateObj("flag",115978,780081,1)
			Fire[3] = Lua_CreateObjByDir( OwnerID() , 115978 , 25 , 0) 
			Fire[4] = Lua_DW_CreateObj("flag",115978,780081,1)
			AddToPartition(Fire[1],0)
			AddToPartition(Fire[3],0)
--關閉標記等設定
			for i=1,4,1 do
				SetModeEx(Fire[i],EM_SetModeType_Mark,false) 
				SetModeEx(Fire[i],EM_SetModeType_ShowRoleHead,false) 
				SetModeEx(Fire[i],EM_SetModeType_HideName,true) 
				SetModeEx(Fire[i],EM_SetModeType_Gravity,false) 
				SetModeEx(Fire[i],EM_SetModeType_Move,false) 
				WriteRoleValue(Fire[i],EM_RoleValue_LiveTime,4)
			end
--拉高位置
			SetPos(Fire[3] , ReadRoleValue(Fire[1],EM_RoleValue_X), ReadRoleValue(Fire[1],EM_RoleValue_Y)+300, ReadRoleValue(Fire[1],EM_RoleValue_Z) , ReadRoleValue(Fire[1],EM_RoleValue_Dir))
			SetPos(Fire[4] , ReadRoleValue(Fire[2],EM_RoleValue_X), ReadRoleValue(Fire[2],EM_RoleValue_Y)+300, ReadRoleValue(Fire[2],EM_RoleValue_Z) , ReadRoleValue(Fire[2],EM_RoleValue_Dir))
			CallPlot(Director,"LuaS_423459_2",Morek,Fire[1],Fire[2],Fire[3],Fire[4])
		end
	end
end


--任務表演劇情
function LuaS_423459_2(QuestNPC,Fire1,Fire2,Fire3,Fire4)
	local xyz = {5337,600,31037}
	local Morek
	local NPC = QuestNPC

	sleep(10)

--放煙火
	CastSpell(Fire1 ,Fire3 ,494400)
	CastSpell(Fire2 ,Fire4 ,494400)

	sleep(20)
--產生吉兒
	local Morek = Lua_DW_CreateObj("flag",115977,780081,2)
	SetDefIdleMotion(Morek,ruFUSION_MIME_IDLE_STAND_02)
	SetDefIdleMotion(QuestNPC,ruFUSION_MIME_IDLE_STAND_02)
	local Jill = Lua_DW_CreateObj("xyz",115948,xyz)
	AddBuff( Jill, 506984, 4, -1 )
	SetModeEx(Jill,EM_SetModeType_Gravity,false) 
	SetDefIdleMotion(Jill,ruFUSION_MIME_RUN_FORWARD)
	MoveDirect( Jill, 5197 , 400 , 30860 )

	while CheckDistance(Jill,Morek, 100)==false	do
		sleep(2)
	end

--	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)

--	sleep(5)
--落地
--	PlayMotion( Jill, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
--	sleep(3)
	PlayMotion( Jill, ruFUSION_ACTORSTATE_CAST_SP01 )
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_STAND)

	sleep(30)
	Say(Jill,"[SC_423459_3]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	Say(Morek,"[SC_423459_4]")
	sleep(20)
	Say(Jill,"[SC_423459_5]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(30)
	Say(Morek,"[SC_423459_6]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(30)
	Say(Morek,"[SC_423459_7]")
	sleep(20)
	Say(Jill,"[SC_423459_8]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(35)
	Say(Morek,"[SC_423459_9]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(30)
	Say(Jill,"[SC_423459_10]")
--起飛
	PlayMotion(Jill,ruFUSION_MIME_JUMP_UP)
	sleep(5)
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)

	sleep(10)
	MoveDirect( Jill, 5337,600,31037 )
	SetDefIdleMotion(Jill,ruFUSION_MIME_RUN_FORWARD)

	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423459)==true	and
			CheckFlag(Player[i],544296)==false	then
			SetFlag(Player[i],544296,1)
		end
	end
	while CheckDistance(Jill,Morek, 200)	do
		sleep(10)
	end
--清場
	DelObj(Jill)
--給任務旗標
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423459)==true	and
			CheckFlag(Player[i],544296)==false	then
			SetFlag(Player[i],544296,1)
		end
	end
	DelObj(Morek)
	DisableQuest(NPC,false)
	DelObj(OwnerID())
end
-----------------------------------------------
--新線索 423460
-----------------------------------------------
function LuaS_423460_0()
	SetPlot(OwnerID(),"range","LuaS_423460_1",130)
end

function LuaS_423460_1()
	if	CheckAcceptQuest(OwnerID(),423460)==true	and
		CheckFlag(OwnerID(),544303)==false		then
		SetFlag(OwnerID(),544303,1)
	end
end
-----------------------------------------------
--真理之手 423461
-----------------------------------------------
--使用物品檢查戰鬥
function LuaS_423461_0()
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205953_1]", 0 )
		return false
	end
--取消騎乘
	DW_CancelTypeBuff(68)
end
--物品執行上buff
function LuaS_423461_1()
	AddBuff(OwnerID(),507213,1,1800)
end
--範圍劇情
function LuaS_423461_2()
	SetPlot(OwnerID(),"range","LuaS_423461_3",70)
end

function LuaS_423461_3()
	if	CheckBuff(OwnerID(),507213)==false	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423461_5]", 0 )
	end
end
--沾血的文件
function LuaS_423461_4()
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_423461_1]" )
	AddBorderPage( OwnerID(), "[SC_423461_2]" )
	AddBorderPage( OwnerID(), "[SC_423461_3]" )
	ShowBorder( OwnerID(), 0, "[SC_423461_0]" , "ScriptBorder_Texture_Paper" )
end
--文件的觸碰劇情
function LuaS_423461_5()
	SetPlot(OwnerID(),"touch","LuaS_423461_6",50)
end

function LuaS_423461_6()
	if	CountBodyItem(OwnerID(),207753)>0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423461_4]", 0 )
	else
		GiveBodyItem(OwnerID(),207753,1)
	end
end

function LuaS_423461_7()
	SetPlot(OwnerID(),"touch","LuaS_423461_8",50)
end

function LuaS_423461_8()
	if	CountBodyItem(OwnerID(),207752)>0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423461_6]", 0 )
	else
		GiveBodyItem(OwnerID(),207752,1)
	end
end

function LuaS_423461_9()
	CancelBuff(TargetID(),507213)
end
-----------------------------------------------
--遇伏 423462
-----------------------------------------------
--對話劇情
function LuaS_423462_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423462)==true	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423462_0]","LuaS_423462_1", 0 )
	end
end

function LuaS_423462_1()
	DisableQuest(TargetID(),true)
	BeginPlot(TargetID(),"LuaS_423462_2",0)
	CloseSpeak(OwnerID())
end

function LuaS_423462_2()
	MoveToFlagEnabled(OwnerID(), false)
	local Mob = {}

	local Boss
	local Jason
	local xyz = {4965,500,37104}
	local Jill,Lobo


	Say(OwnerID(),"[SC_423462_1]")
	sleep(10)
	ScriptMessage( OwnerID(), 0, 2, "[SC_423462_2]", 0 )
	sleep(10)
--建立怪物
	for i=1,6,1 do
		Mob[i] = Lua_DW_CreateObj("flag",116043,780082,i)
	end
	Boss = Lua_DW_CreateObj("flag",116044,780082,7)
--摩瑞克放法術
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	Say(OwnerID(),"[SC_423462_3]")
	CastSpell(OwnerID(),OwnerID(),494221)
	AddBuff(OwnerID(),507234,1000,-1)

	sleep(20)
--開戰
	for i=1,6,1 do
		SetModeEx(Mob[i],EM_SetModeType_Fight,true) 
		SetModeEx(Mob[i],EM_SetModeType_Strikback,true) 
		SetModeEx(Mob[i],EM_SetModeType_HideName,false) 
		SetModeEx(Mob[i],EM_SetModeType_ShowRoleHead,true) 
		SetAttack(Mob[i],OwnerID())
	end
	SetModeEx(Boss,EM_SetModeType_Fight,true) 
	SetModeEx(Boss,EM_SetModeType_Strikback,true) 
	SetModeEx(Boss,EM_SetModeType_HideName,false) 
	SetModeEx(Boss,EM_SetModeType_ShowRoleHead,true) 
	SetAttack(Boss,OwnerID())

	sleep(30)
--吉兒、勞伯登場
	Jill = Lua_DW_CreateObj("xyz",116042,xyz)
	xyz[1] = xyz[1] + 10
	xyz[3] = xyz[3] + 10
	Lobo = Lua_DW_CreateObj("xyz",116041,xyz)

	AddBuff( Jill, 506984, 6, -1 )
	AddBuff( Lobo, 506984, 6, -1 )

	SetModeEx(Jill,EM_SetModeType_Gravity,false) 
	SetModeEx(Lobo,EM_SetModeType_Gravity,false) 

	SetDefIdleMotion(Jill,ruFUSION_MIME_RUN_FORWARD)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_RUN_FORWARD)


	MoveDirect( Jill, 4993.2 , -21 , 37400 )
	MoveDirect( Lobo, 5026.6 , -24.8 , 37392.8 )
	MoveToFlagEnabled(Jill, false)
	MoveToFlagEnabled(Lobo, false)
	
	while true do
		sleep(2)
		if	ReadRoleValue(jill,EM_RoleValue_Y)<0	then
			break
		end
	end
--落地
	Say(Jill,"[SC_423462_4]")
	PlayMotion( Jill, ruFUSION_ACTORSTATE_CAST_SP01 )
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	PlayMotion( Lobo, ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion(Lobo,ruFUSION_MIME_IDLE_STAND)
	SetModeEx(Lobo,EM_SetModeType_Fight,true) 
	SetModeEx(Lobo,EM_SetModeType_Searchenemy,true) 
	SetModeEx(Lobo,EM_SetModeType_Strikback,true) 
	SetModeEx(Lobo,EM_SetModeType_HideName,false) 
	SetAttack(Lobo,ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID))
	Say(OwnerID(),"[SC_423462_12]")
	sleep(10)
--強森登場
	Jason = Lua_DW_CreateObj("flag",116045,780082,8)
	SetModeEx(Jason,EM_SetModeType_Fight,false) 
	SetModeEx(Jason,EM_SetModeType_Searchenemy,false) 
	SetModeEx(Jason,EM_SetModeType_HideName,true) 
	WriteRoleValue(Jason,EM_RoleValue_IsWalk,1)
	Hide(Jason)
	Show(Jason,0)
--強森移動
	DW_MoveToFlag( Jason,780082 ,9,0 )
	sleep(10)
	Say(Jill,"[SC_423462_5]")
	sleep(20)
--傑森的無語問蒼天
	Say(Jason,"[SC_422713_6]")
	SetModeEx(Jason,EM_SetModeType_HideName,false) 
	SetDefIdleMotion(Jason,ruFUSION_MIME_IDLE_COMBAT_2H)
	sleep(10)
--強森攻擊吉兒閃避
	CastSpell(Jason,Jill,495927)
	sleep(20)
	Say(Jill,"[SC_423462_6]")
	sleep(10)
	Say(OwnerID(),"[SC_423462_13]")
	sleep(10)
--強森一擊ko吉兒
	CastSpell(Jason,Jill,495928)

	SetModeEx(Jason,EM_SetModeType_Fight,true) 
	SetModeEx(Jason,EM_SetModeType_Searchenemy,true) 

	SetModeEx(Jill,EM_SetModeType_Fight,false) 
	SetModeEx(Jill,EM_SetModeType_Searchenemy,false) 
	sleep(20)
	Say(OwnerID(),"[SC_423462_7]")
	Say(Lobo,"[SC_423462_8]")
	AdjustFaceDir(Lobo,Jill,0)
--摩瑞克爆氣變身
	CastSpell(OwnerID(),OwnerID(),495929)
	sleep(10)
--上變龍buff
	AddBuff(OwnerID(),507232,1,-1)
	CancelBuff(OwnerID(),507234)
	AddBuff(OwnerID(),507235,1000,-1)
	sleep(10)
--摩瑞克衝鋒強森
	Say(OwnerID(),"[SC_423462_14]")
	SysCastSpellLv(OwnerID(),OwnerID(),494389,30)
	if	CastSpellLV(OwnerID(),Jason,495934,200)==false	then
		SysCastSpellLv(OwnerID(),Jason,495934,200)
		SysCastSpellLv(OwnerID(),Jason,495933,200)
	end
	local z=0
	while z==0 do
		sleep(10)
--判斷小兵
		for i=1,table.getn(Mob),1 do
			if	CheckID(Mob[i])	then
				if	ReadRoleValue(Mob[i],EM_RoleValue_IsDead)==0	then
					break
				end
			end
			if	i==table.getn(Mob)	then
				z=1
			end
		end
--判斷隊長
		if	z==1	then
			if	CheckID(Boss)		then
				if	ReadRoleValue(Boss,EM_RoleValue_IsDead)==0	then
					z=0
				end
			end
		end
--判斷強森
		if	z==1	then
			if	CheckID(Jason)	then
				if	ReadRoleValue(Jason,EM_RoleValue_IsDead)==0	then
					z=0
				end
			end
		end
	end
	sleep(30)
--移動位置
	DW_MoveToFlag( OwnerID() , 780082 , 10 ,0  )
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
	AdjustFaceDir(OwnerID(),Jill,0)
	AdjustFaceDir(Lobo,Jill,0)
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(15)
	Say(OwnerID(),"[SC_423462_9]")
	sleep(20)
	Say(OwnerID(),"[SC_423462_10]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(10)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_RUN_FORWARD)
	MoveDirect( Lobo, 5213 , 75 , 37230 )
	sleep(20)
	DelObj(Lobo)
	Say(OwnerID(),"[SC_423462_15]")
	sleep(20)
--任務完成 250以內 
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423462)	and
			CheckFlag(Player[i],544300)==false	then
			SetFlag(Player[i],544300,1)
		end
	end
--清場重置
	DelObj(Jill)
	DelObj(Boss)
	Hide(OwnerID())
	for i=1,table.getn(Mob),1 do
		DelObj(Mob[i])
	end
	CancelBuff(OwnerID(),507232)
	sleep(5)
	DelFromPartition(OwnerID())
	ReSetNPCInfo( OwnerID())
	sleep(20)
	AddToPartition(OwnerID(),0)
end

--目標播閃避
function LuaS_423462_3()
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DODGE)
end
--目標播死亡
function LuaS_423462_4()
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DYING)
	SetDefIdleMotion(TargetID(),ruFUSION_MIME_DEATH_LOOP)
end
------------------------------------------------------
--出生劇情
------------------------------------------------------
function LuaS_423462_5()
	sleep(5)
	MoveToFlagEnabled(OwnerID(), true)
	CancelBuff(OwnerID(),507232)
	SetPlot(OwnerID(),"range","LuaS_423460_1",130)
end


------------------------------------------------------
--勞伯收功對話劇情
------------------------------------------------------

function LuaS_423462_6()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423367_0]","LuaS_423462_7", 0 )
end

function LuaS_423462_7()
	SetFlag(OwnerID(),542318,1)
	ChangeZone(OwnerID(),17,0,5834,785,32839,56)
end


------------------------------------------------------
--多瑞安講古秀
------------------------------------------------------
function LuaS_115976_0()
	if	CheckCompleteQuest(OwnerID(),423462)==true	then
		SetSpeakDetail( OwnerID(),"[SC_115976_00]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_01]","LuaS_115976_1", 0 )
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_115976_1()
	SetSpeakDetail( OwnerID(),"[SC_115976_02]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_03]","LuaS_115976_2", 0 )
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_04]","LuaS_115976_3", 0 )
end

function LuaS_115976_2()
	SetSpeakDetail( OwnerID(),"[SC_115976_05]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_07]","LuaS_115976_4", 0 )
end

function LuaS_115976_3()
	SetSpeakDetail( OwnerID(),"[SC_115976_06]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_08]","LuaS_115976_5", 0 )
end

function LuaS_115976_4()
	SetSpeakDetail( OwnerID(),"[SC_115976_09]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_11]","LuaS_115976_6", 0 )
end

function LuaS_115976_5()
	SetSpeakDetail( OwnerID(),"[SC_115976_10]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_12]","LuaS_115976_7", 0 )
end

function LuaS_115976_6()
	SetSpeakDetail( OwnerID(),"[SC_115976_13]")
end

function LuaS_115976_7()
	SetSpeakDetail( OwnerID(),"[SC_115976_14]")
end


------------------------------------------------------------------------------------------
--艾力克免費傳送
------------------------------------------------------------------------------------------
function LuaS_115741_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115741_0]","LuaS_115741_1", 0 )
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115741_2]","LuaS_115741_2", 0 )
end

function LuaS_115741_1()
	SetSpeakDetail( OwnerID(),"[SC_115741_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115741_2]","LuaS_115741_2", 0 )
end

function LuaS_115741_2()
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),16,0,1425,-290,23229,203.6)
end

function LuaS_115742_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115742_0]","LuaS_115742_1", 0 )
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115742_2]","LuaS_115742_2", 0 )
end

function LuaS_115742_1()
	SetSpeakDetail( OwnerID(),"[SC_115742_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115742_2]","LuaS_115742_2", 0 )
end

function LuaS_115742_2()
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),16,0,-6038.8,-138,21658.6,26.9)
end