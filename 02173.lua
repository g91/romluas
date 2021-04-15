
------------------------------------------------------------
--坎貝爾小鎮守衛對抗殭屍的劇情
function LuaS_104868_DW00()
	local Obj = OwnerID()
	local MyDir = ReadRoleValue(Obj,EM_RoleValue_Dir)
	if	MyDir<100	or MyDir<320	then
		SetDir( Obj, 200+DW_Rand(50) )
	end
	sleep(20)
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_COMBAT_1H)
	local Zombe = Lua_CreateObjByDir( Obj , 104861 , 170 , 0) 
	AddToPartition(Zombe,0)
	WriteRoleValue(Zombe,EM_RoleValue_IsWalk,1)
	Hide(Zombe)
	Show(Zombe,0)
	DW_MoveRand(Zombe,10,1,Obj)
	CallPlot(Zombe,"LuaFunc_Obj_Suicide",100)

end
------------------------------------------------------------
--恐怖的愛麗絲
--姑且一試
--永不放棄
function Luas_116979()
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckAcceptQuest( Obj, 423706 ) == true	and CheckFlag(Obj,544637)==false	then--接受【恐怖的愛麗絲】任務才出現的對話選項
		SetSpeakDetail(Obj,"[SC_116979_0]")
		AddSpeakOption( Obj ,	Target ,"[SC_423706_1]", "LuaS_423706_1", 0 )--(將手指放上裝置。)
		AddSpeakOption( Obj ,	Target ,"[SC_423706_2]", "LuaS_423706_2", 0 )--(不管它。)
		return
	end

	if	CheckAcceptQuest( Obj, 423707 )==true	or
		CheckAcceptQuest( Obj, 423708 )==true	then--接受【姑且一試】任務才出現的對話選項
		LuaS_423707_1(Obj)--判斷應出現哪些對話選項
		return
	end
	LoadQuestOption( Obj )--無特殊任務需求=>載入模版
end
function LuaS_423706_1()
	local Obj = OwnerID()
	SetSpeakDetail(Obj,"[SC_423706_3]")
	SetFlag(Obj,544637,1)--給予完成任務的旗標
end

function LuaS_423706_2()
	CloseSpeak(OwnerID())--關閉對話
end


function LuaS_423707_1(Obj)

	if	CountBodyItem(Obj,208552)>=2	and CountBodyItem(Obj,208553)>=2	and CountBodyItem(Obj,208554)>=2	and CountBodyItem(Obj,208555)>=2	then--如果條件完成
		LoadQuestOption(Obj)
	else--身上經過改造的殘塊還不夠
		if	CountBodyItem(Obj,208551)==0		then
			SetSpeakDetail( Obj,"[SC_116979_1]")--沒有任何材料
		else
			SetSpeakDetail( Obj,"[SC_116979_2]")--有一些材料
			AddSpeakOption(Obj,Obj,"[SC_116979_3]","LuaS_423707_2", 0 )--轉換材料
		end
	end
end

function LuaS_423707_2()
--將所有材料一次轉化
	local Player = OwnerID()
	local MeatLoafID=208551
	AddBuff(Player,506098,1,2)--畫面全黑+無法動彈 2秒
	CloseSpeak(Player)
	
	local MeatLoafNum = CountBodyItem(Player,MeatLoafID)
	if	MeatLoafNum==0	then--如果玩家把物品丟掉
		return--跳掉不執行
	elseif MeatLoafNum>20 then
		MeatLoafNum=20;
	end

	local Source = { 208552, 208553, 208554, 208555 }
	local ChangeResult = {}
	for SourceType=1, MeatLoafNum do
		local RandResultSN = DW_Rand(table.getn(Source))
		table.insert( ChangeResult, Source[RandResultSN] )
	end

	ScriptMessage( Player, Player, 2, "[SC_116979_4]",0 )--中央黃字：費了一番力氣你終於將這些屍塊處理完畢......
	DelBodyItem( Player, 208551, MeatLoafNum )
	for Num=1,MeatLoafNum,1 do
		GiveBodyItem( Player, ChangeResult[Num], 1 )
	end
end

function LuaS_423707_3()
	AddBuff(TargetID(),506098,1,2)--畫面全黑+無法動彈 2秒
	sleep(5)
--完成任務時的轉換
	local Obj = OwnerID()
	local KeyItem = {544656,544657,544658,544659}--對應的重要物品
	local MyOrgID = ReadRoleValue(Obj,EM_RoleValue_OrgID)
	local Num
	if	MyOrgID==116979	then
		Num = 1
	else
		Num = MyOrgID - 117091
	end
	local Initial = {1,2,3,4}--初始化編號
	table.remove(Initial,Num)--剔除自己的編號
	local NewNum = Initial[DW_Rand(table.getn(Initial))]--取出下一個

	BeginPlot(TargetID(),"LuaS_423707_4",20)
	for i=1,table.getn(KeyItem),1 do
		SetFlag(TargetID(),KeyItem[i],0)
	end
	SetFlag(TargetID(),KeyItem[NewNum],1)--開啟屬於該任務的重要物品

end
function LuaS_423707_4()
	local Obj = OwnerID()
	local String = {}--字串表
	String[1] = "[SC_116979_5]"
	String[2] = "[SC_116979_6]"
	String[3] = "[SC_116979_7]"
	String[4] = "[SC_116979_8]"
	local KeyItem = {544656,544657,544658,544659}--對應的重要物品
	for i=1,4,1 do
		if	CheckFlag(Obj,KeyItem[i])==true	then
			ScriptMessage( Obj, Obj, 2, String[i] , 0 )
		end
	end
end

------------------------------------------------------------
--被捨棄的記憶
--頂尖的表演者們
--羞於見人
--得以瞑目


function LuaS_423741_SetPlot()
	local Obj = OwnerID()
	SetPlot(Obj,"range","LuaS_423741_RangePlotTrig",100)--100的範圍劇情
end

function LuaS_423741_RangePlotTrig()
	local Obj = OwnerID()--玩家
	local Target = TargetID()--觸發點
	if	CheckAcceptQuest(Obj,423741)==false	or--沒接【羞於見人】
		CheckFlag(Obj,544660)==true	or--已經有「仔細觀察的結果」
		ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	or--死了
		CheckBuff(Obj,508183)	or--如果有基本法術「仔細觀察」代表已經在進行中
		ReadRoleValue(Obj,EM_RoleValue_Y)/10~=ReadRoleValue(Target,EM_RoleValue_Y)/10	then--高度相差太多
		--ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--警告訊息：你現在還不能使用！
		return--不予理會
	end
	AddBuff(Obj,508183,1,4)--仔細觀察
	ScriptMessage( Obj, Obj, 2, "[SC_423741_0]", 0 )--中央黃字：這裡就是被改造物集中的地方......
	sleep(25)
	ScriptMessage( Obj, Obj, 2, "[SC_423741_1]", C_Yellow )--左下訊息框-黃字：你仔細的觀察裡頭的.....「東西」？
	sleep(25)
	ScriptMessage( Obj, Obj, 1, "[SC_423741_2]", C_Yellow )--左下訊息框-黃字：很明顯的，從這些畸形的屍塊上根本分辨不出它們的主人是什麼樣子！
	SetFlag(Obj,544660,1)--得到仔細觀察的結果
	CancelBuff(Obj,508183)--讓玩家自由
end
------------------------------------------------------------
--抓殭屍！
--要抓「活的」
function LuaS_423735_ItemCheck()
	local Obj = OwnerID()--玩家
	local Target = TargetID()--使用對象
	local TargetOrgID = ReadRoleValue(Target,EM_RoleValue_OrgID)
	if	(CheckAcceptQuest(Obj,423735)==false and CheckAcceptQuest(Obj,423736)==false)	then--沒有接【抓殭屍！】和【要抓「活的」】
		ScriptMessage( Obj, Obj, 1, "[SAY_200938_0]", 0 )--你並未擁有此任務。
	elseif	(TargetOrgID~=104859 and TargetOrgID~=104707 and TargetOrgID~=104708 and TargetOrgID~=104861)	then--目標不是墓園的殭屍
		ScriptMessage( Obj, Obj, 1, "[ST_201250_3]", 0 )--目標錯誤
	elseif	CheckBuff(Target,508184)	then--目標已經在「傳送信標鎖定中」
		ScriptMessage( Obj, Obj, 1, "[SC_ALREADY_USED]", 0 )--目標已被使用過
	elseif	(ReadRoleValue(Target,EM_RoleValue_HP)/ReadRoleValue(Target,EM_RoleValue_MaxHP))>0.5	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--警告訊息：你現在還不能使用！
	elseif	CheckDistance(Obj,Target, 150)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--警告訊息：你現在還不能使用！
	elseif	(ReadRoleValue(Target,EM_RoleValue_IsDead)==1 or ReadRoleValue(Obj,EM_RoleValue_IsDead)==1)	then
		ScriptMessage( Obj, Obj, 1, "[SC_101614_2]", 0 )--警告訊息：你現在還不能使用！
	else
		DW_CancelTypeBuff(68)--取消自己的騎乘
		return true
	end
	return false--不予理會
end

function LuaS_423735_ItemExecute()
	local Obj = OwnerID()--玩家
	local Target = TargetID()--使用對象
	BeginPlot(Target,"LuaS_423735_ExecutePlot",0)
	AdjustFaceDir(Obj,Target,0)
	SetAttack(Target,Obj)
end

function LuaS_423735_ExecutePlot()
	local Obj = OwnerID()--殭屍
	local Target = TargetID()--玩家
	AddBuff(Obj,508184,1,6)--傳送信標鎖定中
	AddBuff(Obj,508483,1,20)--狂暴(變大)
	sleep(50)
	SysCastSpellLv(Obj,Obj,495735,1)--傳送術
	sleep(10)
	if	Target~=nil	and CheckID(Target)==true	then
		SetFlag(Target,544661,1)--玩家得到「成功傳送殭屍」的重要物品
	end
	CallPlot(Obj,"LuaFunc_ResetObj",Obj)--進行重生
end
------------------------------------------------------------
--前進黑沼神廟
--安放傳送信標
--警戒四周
--突然現身的敵人
--救出研究員
function LuaS_423701_RangePlot()
--設定範圍劇情
	local Obj = OwnerID()
	SetPlot(Obj,"range","LuaS_423701_TrigExecute",150)--範圍劇情
end

function LuaS_423701_TrigExecute()
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckFlag(Obj,544648)==false	and
		CheckAcceptQuest(Obj,423701)==true	then
		BeginPlot(Target,"LuaS_423701_EndlessPlot",0) --在隱形物件上執行迴圈劇情
	end
end

function LuaS_423701_EndlessPlot()
--執行範圍劇情
	local Obj = OwnerID()
	SetPlot(Obj,"range","",0)--關閉範圍劇情=>以免重複觸發
	local Avan = DW_CreateObjEX("flag",104991,780088,1)--中
	local Tael = DW_CreateObjEX("flag",104992,780088,2,1,20)--左
	local Layna = DW_CreateObjEX("flag",104993,780088,3,1,20)--右
	DW_UnFight(Avan,true)--關閉戰鬥
	DW_UnFight(Tael,true)
	DW_UnFight(Layna,true)
	PlayMotion(Tael,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(Tael,"[SC_423701_01]")--你們快來看，有好多石碑。
	sleep(20)
	local Spider = DW_CreateObjEX("flag",104856,780088,4,0)--鬼母蛛
	WriteRoleValue(Spider,EM_RoleValue_IsWalk,0)
	Lua_ObjDontTouch( Spider )
	DW_UnFight(Spider,true)
	AddToPartition(Spider,0)
	PlayMotion(Avan,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Avan,"[SC_423701_02]")--太驚人了，這裡的石碑跟外面散落殘敗的石碑完全不一樣，數量非常多。
	DW_MoveToFlag( Spider,780088 , 5 , 0 ,1  )
	AdjustFaceDir(Spider,Avan,0)
	--sleep(5)
	PlayMotion(Spider,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep(5)
	SysCastSpellLv(Spider,Avan,493864,1)--殺死
	AdjustFaceDir(Tael,Avan,0)
	AdjustFaceDir(Layna,Avan,0)
	Say(Layna,"[SC_423701_03]")--不！艾文！
	CallPlot(Obj,"LuaS_423701_NPCPlot",Avan,Tael,Layna)
	sleep(5)
	local SearchResult = SearchRangePlayer ( Obj , 200 )
	for i=0,table.getn(SearchResult),1 do
		local Temp = SearchResult[i]
		if	Temp ~= -1	and
			ReadRoleValue(Temp,EM_RoleValue_IsPlayer)==1	and
			ReadRoleValue(Temp,EM_RoleValue_IsDead)==0	then
			SetAttack(Spider,Temp)
			break
		end
	end
	DW_UnFight(Spider,false)
	Lua_ObjDontTouch( Spider,false )
	sleep(50)
	while	true	do
		if	HateListCount(Spider)==0	and
			ReadRoleValue(Spider,EM_RoleValue_AttackTargetID)==0	then --鬼母蜘離開戰鬥
			break
		end
		if	CheckID(Spider)==false	or
			ReadRoleValue(Spider,EM_RoleValue_IsDead)==1	then --蜘蛛被解決
			break --跳出迴圈
		end
		sleep(20)
	end
	DelObj(Spider) --刪除
	sleep(30)
	SetPlot(Obj,"range","LuaS_423701_TrigExecute",150)--重開範圍劇情
end


function LuaS_423701_NPCPlot(Avan,Tael,Layna)
	PlayMotion(Tael,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	PlayMotion(Layna,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(20)
	Say(Tael,"[SC_423701_04]")
	sleep(15)
	--SysCastSpellLv(Tael,Avan,495735,1)
	SysCastSpellLv(Tael,Tael,495735,1)
	SysCastSpellLv(Layna,Layna,495735,1)
	WriteRoleValue(Avan,EM_RoleValue_LiveTime,2)
	WriteRoleValue(Tael,EM_RoleValue_LiveTime,2)
	WriteRoleValue(Layna,EM_RoleValue_LiveTime,2)
	local SearchResult = SearchRangePlayer ( Avan , 250 )
	for i=0,table.getn(SearchResult),1 do
		local Temp = SearchResult[i]
		if	CheckAcceptQuest(Temp,423701)==true	then
			SetFlag(Temp,544648,1)
		end
	end
end

function LuaS_423702_Talk()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,423702)==true	and
		CheckFlag(Obj,544649)==false		and
		CountBodyItem(Obj,208559)==0		then
		GiveBodyItem(Obj,208559,1)--補發任務道具
	end
end

function LuaS_423702_AfterClick()
	local Obj = OwnerID()
	local Target = TargetID()
	AddBuff(Obj,508337,1,-1)
	DelBodyItem(Obj,208559,1)
	local SearchResult = SearchRangeNPC ( Obj , 300 )
	for i=0,table.getn(SearchResult),1 do
		local Temp = SearchResult[i]
		if	ReadRoleValue(Temp,EM_RoleValue_OrgID)==116975	then
			SysCastSpellLv(Temp,Temp,495735,1)--傳送術
		end
	end
	BeginPlot(Obj,"LuaS_423702_ClientChange",15)--叫玩家執行
	return 1
end

function LuaS_423702_ClientChange()
	local Obj = OwnerID()--玩家
	if	CheckAcceptQuest(Obj,423702)==true	and
		CheckBuff(Obj,508337)==true	then
		CancelBuff(Obj,508337)
		SetFlag(Obj,544662,1)--看不到髒石碑
	end
end

function LuaS_423702_RangePlot()
	local Obj = OwnerID()
	SetPlot(Obj,"range","LuaS_423702_ClientChange",300)
end


function LuaS_423703_SetPlot()
	local Obj = OwnerID()
	AddBuff(Obj,505453,0,-1)
	SetPlot(Obj,"range","LuaS_423703_RangeExecute",300)
end

function LuaS_423703_RangeExecute()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,423703)==true	and
		CheckFlag(Obj,544650)==false	then
		SetFlag(Obj,544650,1)
		ScriptMessage( Obj, Obj, 2, "[SC_423703_02]", 0 )--蜘蛛突然加速爬行速度，快到你再也無法跟上，牠就這樣消失在你眼前。
	end
end


function LuaS_423703_QuestAccept()
	local Obj = OwnerID()
	local Target = TargetID()
	ScriptMessage( Target, Target, 1, "[SC_423703_01]", 0 )
	ScriptMessage( Target, Target, 0, "[SC_423703_01]", C_Red )
end


function LuaS_423705_Idle()
	local Obj = OwnerID()
	AddBuff(Obj,505974,1,-1)
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND_02)
end

function LuaS_423705_AfterQuest()
	local Obj = OwnerID()
	local Target = TargetID()
	SysCastSpellLv(Obj,Obj,495735,1)
	AddBuff(Target,508188,1,2)
end

------------------------------------------------------------
--項鍊的下落
--在另一個世界相會

function LuaS_423713_ClickItem()
	local Obj = OwnerID()
	local Target = TargetID()
	if	ReadRoleValue(Target,EM_RoleValue_OrgID)==117037 	then
		ScriptMessage( Obj, Obj, 2, "[SC_423713_09]", C_Red )
		ScriptMessage( Obj, Obj, 0, "[SC_423713_09]", C_Red )
	else
		GiveBodyItem(Obj,208490,1)
	end
	return true
end


function LuaS_423716_AfterQuest()
	local Obj = OwnerID()
	local Target = TargetID()
	AddBuff(Obj,508187,1,2)
	AddBuff(Target,508188,1,2)
end
------------------------------------------------------------
--惡作劇

function LuaS_423733_AfterClick()
	local Obj = OwnerID()--玩家
	local Target = TargetID()
	DelBodyItem(Obj,208561,1)
	local Temp = Lua_CreateObjByDir( Target , 110987 , 100 , 0) 
	Lua_ObjDontTouch( Temp )
	SetModeEx(Temp,EM_SetModeType_Show,false) 
	AddToPartition(Temp,0)
	CallPlot(Temp,"LuaS_423733_Click",TargetID())
	return 1
end

function LuaS_423733_Click(Target)
	local Obj = OwnerID()
	local JokeType = {}
	JokeType[1] =LuaS_423733_Rand1
	JokeType[2] =LuaS_423733_Rand2
	local RandResult = DW_Rand(table.getn(JokeType))
	JokeType[RandResult](Target)--隨機挑選表演模式  Target 是桶子
end

function LuaS_423733_GeneralRand(Temp,Target)
	WriteRoleValue(Temp,EM_RoleValue_IsWalk,0)
	Lua_ObjDontTouch( Temp )
	AddToPartition(Temp,0)
	FaceObj( Temp, Target)
	sleep(20)
	PlayMotion(Temp,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(15)
	PlayMotion(Temp,ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep(10)
	PlayMotion(Temp,ruFUSION_ACTORSTATE_EMOTE_DRINK)
	sleep(15)
	PlayMotion(Temp,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(15)
end

function LuaS_423733_Rand1(Target)
	local Obj = OwnerID()
	local Temp = DW_CreateObjEX("obj",117083,Obj,0,30)
	LuaS_423733_GeneralRand(Temp,Target)
	Say(Temp,"[SC_423733_03]")
	PlayMotion(Temp,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)--
	sleep(20)
	Say(Temp,"[SC_423733_04]")
	DW_MoveRand(Temp,30,1,780087,1)
	WriteRoleValue(Temp,EM_RoleValue_LiveTime,3)
	DelObj(Obj)
end

function LuaS_423733_Rand2(Target)
	local Obj = OwnerID()
	local Temp = DW_CreateObjEX("obj",117086,Obj,0,30)
	LuaS_423733_GeneralRand(Temp,Target)
	ScriptMessage( Temp, 0, 2, "[SC_423733_05]", 0 )
	sleep(20)
	PlayMotion(Temp,ruFUSION_ACTORSTATE_EMOTE_PROVOKE)
	Say(Temp,"[SC_423733_06]")
	sleep(15)
	DW_MoveRand(Temp,30,1,780087,1)
	WriteRoleValue(Temp,EM_RoleValue_LiveTime,3)
	DelObj(Obj)
end

------------------------------------------------------------
--格拉夫少主
function LuaS_423758_AfterQuest()
	local Obj = OwnerID()
	Say(Obj,"[SC_423758_08]")
end


--實驗精神
--印證想法
function LuaS_423759_AfterQuest()
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckCompleteQuest(Target,423760)==true	then
		Say(Obj,"[SC_423759_4]")
	else
		Say(Obj,"[SC_423759_1]")
	end
end

function LuaS_423760_AfterQuest()
	local Obj = OwnerID()
	local Target = TargetID()
	if	CheckCompleteQuest(Target,423759)==true	then
		Say(Obj,"[SC_423759_2]")
	else
		Say(Obj,"[SC_423759_3]")
	end
	SetFlag(Target,544663,0)-- 關閉 544663 接了任務
end


function LuaS_423759_CheckItem()
	local Obj = OwnerID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1	then
		ScriptMessage( Obj, Obj, 1, "[SC_USECHECK_BATTLE_0]", 0 )--戰鬥中不能用
	elseif	DW_CheckDis(Obj,780085,1,350)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_421324_1]", 0 )--不在目標區域內
	elseif	CheckAcceptQuest(Obj,423759)==false	then
		ScriptMessage( Obj, Obj, 1, "[SAY_200938_0]", 0 )--你並未擁有此任務。
	else
		return true
	end
	return false
end

function LuaS_423759_UseExecute()
	local Obj = OwnerID()
	UseItemDestroy()
	GiveBodyItem(Obj,208432,1)
	ScriptMessage( Obj, Obj, 1, "[SC_423759_5]", C_Yellow )
end


function LuaS_423760_CheckItem()
	local Obj = OwnerID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1	then
		ScriptMessage( Obj, Obj, 1, "[SC_USECHECK_BATTLE_0]", 0 )--戰鬥中不能用
	elseif	DW_CheckDis(Obj,780084,1,550)==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_421324_1]", 0 )--不在目標區域內
	elseif	CheckAcceptQuest(Obj,423760)==false	then
		ScriptMessage( Obj, Obj, 1, "[SAY_200938_0]", 0 )--你並未擁有此任務。
	else
		return true
	end
	return false
end

function LuaS_423760_UseExecute()
	local Obj = OwnerID()
	UseItemDestroy()
	GiveBodyItem(Obj,208491,1)
	ScriptMessage( Obj, Obj, 1, "[SC_423759_5]", C_Yellow )
end

------------------------------------------------------------
--新的嘗試

function LuaS_423738_Talk()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,423738)==true	then
		AddSpeakOption(Obj,Obj,"[SC_423738_1]","LuaS_423738_Talk_1", 0 )
		AddSpeakOption(Obj,Obj,"[SC_423738_3]","LuaS_423738_Talk_2", 0 )
	end
end

function LuaS_423738_Talk_1()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_423738_2]")
	AddSpeakOption(Obj,Obj,"[SC_423738_3]","LuaS_423738_Talk_2", 0 )
end

function LuaS_423738_Talk_2()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_423738_4]")
	AddSpeakOption(Obj,Obj,"[SC_423738_1]","LuaS_423738_Talk_1", 0 )
end

------------------------------------------------------------
--想偷襲的恐狼

function LuaS_104867_WantToGo()
	local Obj = OwnerID()
	local MaxHP = ReadRoleValue(Obj,EM_RoleValue_MaxHP)
	while	true	do
		sleep(10)
		if	(ReadRoleValue(Obj,EM_RoleValue_HP)/MaxHP)<=0.5	then
			break
		end
	end
	CallPlot(Obj,"LuaFunc_ResetObj",Obj)
end


------------------------------------------------------------
--格拉夫古堡信使

function LuaS_104855_Reset()
	local Obj = OwnerID()
	CallPlot(Obj,"LuaFunc_ResetObj",Obj)
end
------------------------------------------------------------
function NPC_105019()	--zone19阻擋通往Zone20的npc的物件產生劇情
	AddBuff(OwnerID(),507613,0,-1)
end

function Zone_block()	--zone19阻擋通往Zone20用劇情 會把玩家傳到重生點
	local hp = ReadRoleValue(TargetID(),EM_RoleValue_HP)
	--
	if CheckBuff(TargetID(),500663) == FALSE then
		AddBuff(TargetID(),500663,0,5)
		ScriptMessage(TargetID() ,  TargetID(), 1,"[STRING_105019_1]",0)
		BeginPlot(TargetID(),"Zone_block_Teleport",50)
	end
end

function Zone_block_Teleport()
	local hp = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
	ChangeZone( OwnerID(), 19 , 0 , -7247, 638 , 45425 , 230)
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,hp*0.1)
	Sleep(20)
	ScriptMessage(OwnerID() ,  OwnerID(), 1,"[STRING_105019_2]",0)
	ScriptMessage(OwnerID() ,  OwnerID(), 0,"[STRING_105019_2]",0)
end