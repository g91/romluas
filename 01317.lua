function LuaS_420909_0() --箱子上的觸碰劇情
	SetPlot(OwnerID() , "touch" , "LuaS_420909_1" , 45 )
end

function LuaS_420909_1() --還沒完成任務&沒有這玩意
	if	not	CheckCompleteQuest( OwnerID(), 420910 )		and
		CountBodyItem(OwnerID() , 204395 ) < 1			then
		GiveBodyItem(OwnerID() , 204395 , 1); -- 給東西
		Say(OwnerID(),"[SC_420909_0]")
	end
	if	CountBodyItem(OwnerID(),204212) < 5	then
		GiveBodyItem(OwnerID(),204212,1)
	end
end

function LuaS_420909_2()
	if	not	CheckCompleteQuest( OwnerID(), 420910 )		and
		CountBodyItem(OwnerID() , 204395 ) < 1			then
		GiveBodyItem(OwnerID() , 204395 , 1); -- 給東西
		Say(OwnerID(),"[SC_420909_0]")
	end
	return 1
end

function LuaS_420910_0() -- 石碑介面接任
	ClearBorder(OwnerID());
	AddBorderPage(OwnerID(),GetQuestDetail(420910,1));
	ShowBorder( OwnerID(),420910,"[420910]","ScriptBorder_Texture_Paper");
end

function LuaS_420911_0() -- 宣告全域變數
	Zone7_420911 = 0
	SetPlot(OwnerID(),"range","LuaS_420917_0",100)
end

function LuaS_420911_1() -- 掛死亡劇情
	SetPlot(OwnerID(),"dead","LuaS_420911_2",0)
end

function LuaS_420911_2() 
	Zone7_420911 = Zone7_420911 +1 --增加計數
	if	Zone7_420911 > 35	then   --到達數量後....


		local Count = SetSearchAllNPC(0)
		local NPC = {}
		local HowMany = 0
		for i = 1 , Count do
			NPC[i] = GetSearchResult()
		end
		for i = 1, Count do
			if ReadRoleValue(NPC[i] ,EM_RoleValue_OrgID) == 101784 then
				HowMany = HowMany + 1
			end
		end
		if HowMany < 1 then
			Zone7_420911 = 0	-- 歸零
			local buysome = Lua_DW_CreateObj("flag",101784 , 780088 , 1) 
			BeginPlot(buysome , "LuaS_420911_3" , 0)
			ScriptMessage( OwnerID(), -1, 0, "[SC_420911_0]", 0 ); -- 拉扣獸之祖拜桑出現在魚嘴灣！
			ScriptMessage( OwnerID(), -1, 2, "[SC_420911_0]", 0 ); -- 拉扣獸之祖拜桑出現在魚嘴灣！
		end

	end
	return true
end

function LuaS_420911_3() -- 10分鐘後消失
	local sec = 0
	while	true	do
		sleep(10)
		sec = sec +1
		if	sec > 600	and
			ReadRoleValue(OwnerID() , EM_RoleValue_IsAttackMode)then
			DelObj(OwnerID())
		end
	end
end


function LuaS_420917_0() --限時判斷
	if	CountBodyItem(OwnerID(),204209)>9	then
		if	CheckBuff(OwnerID(),503154)	then
			SetFlag(OwnerID(),542512,1)
			return
		end
	end
	SetFlag(OwnerID(),542512,0)
end

function LuaS_420917_1()
	AddBuff(TargetID(),503154,0,600)
end

function LuaS_420917_2()
	CancelBuff(TargetID(),503154)
	SetPlot(OwnerID(),"range","LuaS_420917_0",100)
end


function LuaS_420918_0()
	BeginPlot(OwnerID(),"LuaS_420918_1",0)
end

function LuaS_420918_1()
	Say(OwnerID(),"[SC_420918_0]") -- 沒想到我這種沒用的傢伙還有人願意幫我……謝謝你，朋友。
	sleep(20)
	Say(OwnerID(),"[SC_420918_1]") --也許我可以回去看看她……不知道她嫁人了沒有。
	sleep(40)
end

function LuaS_420920_0()
	SetPlot(OwnerID(),"range","LuaS_420920_1",170)
end

function LuaS_420920_1()
	if	not CheckCompleteQuest( OwnerID(), 420920 )	and
		not CheckFlag(OwnerID(),542473)		and
		CheckAcceptQuest(OwnerID(),420920 )		then
		SetFlag(OwnerID() , 542473 , 1)
		Say(OwnerID() ,"[SC_420920_0]") -- 他們在進行什麼儀式？我最好快點告訴拉魯卡這件事……
	end
end


function LuaS_420921_0()
	SetPlot(OwnerID(),"dead","LuaS_420921_1",0)
end

function LuaS_420921_1()
	local Player = {}
	local HateSome  -- 仇恨表內的人
	for i = 0 , HateListCount( OwnerID() ) do
		HateSome = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	not CheckCompleteQuest( HateSome  , 420921 )  then
			SetFlag( HateSome , 542474 , 1 )
		end
	end
end



function LuaS_420923_0() --使用前檢查是不是在zone7
	local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	if	Lua_ExGetZone( OwnerID()) == 7	then
		if	X < 15800	and
			X > 15000	and
			Z < 15700	and
			Z > 14500	then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 )
		return false
	end
end

function LuaS_420923_1() --偽裝成海盜
	AddBuff(OwnerID() , 503152 , 1 , 60 )
end

function LuaS_420923_2() --隱形偵測
	SetPlot(OwnerID() , "Range" , "LuaS_420923_3" , 70)
end

function LuaS_420923_3()
	if	CheckAcceptQuest( OwnerID() , 420923 )		then
		if 	CheckBuff( OwnerID() , 503152) 		and
			CheckFlag(OwnerID() , 542475)==false	then --有buff

			SetPlot(TargetID() , "Range" , "" , 0) --取消範圍劇情
			BeginPlot(TargetID() , "LuaS_420923_4" , 0) -- show time
		end
	end
end

function LuaS_420923_4()
	local Gick = Lua_DW_CreateObj("obj" , 101709 , OwnerID() ) 
	SetPlot(Gick , "dead" , "LuaS_420923_5" , 0) -- 先寫遺書
	WriteRoleValue(Gick,EM_RoleValue_PID, TargetID())
	BeginPlot(Gick , "LuaS_420923_6" , 0) -- 準備翻臉
	FaceObj( Gick , TargetID() );
	Say(Gick , "[SC_420921_1]") -- 怎麼搞的，上次"毒蛇"不是叫你們不要突然會面嗎？這麼短的時間我們不能更換裝備！上次害我們差點曝露身份還不夠嗎？等等……我沒見過你！
	while 	CheckID(Gick) 	do
		sleep(10)
	end
	SetPlot(OwnerID() , "Range" , "LuaS_420923_3" , 70) -- 最後要回復
end

function LuaS_420923_5() -- 有接任務，有打就有份
	local Player = {}
	local HateSome
	for i = 0 , HateListCount( OwnerID() ) do
		HateSome = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(  HateSome , 420923 )  then
			SetFlag( HateSome , 542475 , 1 )
			GiveBodyItem(HateSome,204396,1)
		end
	end
	return true
end

function LuaS_420923_6() -- 識破以後就抄傢伙
	sleep(40)
	SetRoleCamp(OwnerID() , "Monster")
	Hide(OwnerID())
	Show(OwnerID() , 0)
	SetAttack(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_PID))
	Say(OwnerID() , "[SC_420920_2]") --你休想活著回去報告！
	BeginPlot(OwnerID() , "LuaS_Discowood_CheckPeace" , 0) -- 沒人看戲就消失
end


function LuaS_420927_0() --和流浪漢的對話
	LoadQuestOption( OwnerID() );
	SetSpeakDetail( OwnerID(), "[SC_420927_5]") --咳……救救我！
	if	CheckCompleteQuest(OwnerID(),420914)	then
		SetSpeakDetail( OwnerID(), "[SC_420927_2]");--謝謝，你真是好人
	end

	if	CheckCompleteQuest(OwnerID(),420915)	then
		SetSpeakDetail( OwnerID(), "[SC_420927_3]"); -- 唉…這輩字都別想了
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420927_6]" ,  "LuaS_420927_2",  0 ) --你要小心
	end

	if	CheckCompleteQuest(OwnerID(),420914)	then
		SetSpeakDetail( OwnerID(), "[SC_420927_4]"); --  謝謝你，我終於可以回到人類據點……
	end
	if	CheckAcceptQuest( OwnerID(), 420927 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420927_0]" ,  "LuaS_420927_1",  0 ); -- (詢問他受箭傷的症狀是否和畢昂描述的相符）
	end
end

function LuaS_420927_1()
	SetSpeakDetail( OwnerID(), "[SC_420927_1]"); -- 對！沒錯，那個時候我還以為自己快掛了！
	SetFlag(OwnerID(),542477,1)
end


function LuaS_420927_2()
	SetSpeakDetail( OwnerID(), "[SC_420927_7]") --沒問題
end

function LuaS_420928_0() -- 和拉魯卡的對話
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420928 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420928_0]" ,  "LuaS_420928_1",  0 ); -- (跟他拿基克的裝備）
	end
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_5",  0 ); -- (出示證明，並檢查他的裝備)
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_13]" ,  "LuaS_420930_10",  0 ); -- (請他將在外面巡邏的喬安召回)
	end
end

function LuaS_420930_5()
	SetSpeakDetail( OwnerID(), "[SC_420930_5]"); -- 拉魯卡的證詞
	SetFlag(OwnerID(),542501,1)
end


function LuaS_420928_1()
	SetSpeakDetail( OwnerID(), "[SC_420928_1]"); --拉魯卡拿基克的裝備給你
	if	CountBodyItem(OwnerID() , 204397) < 1	then
		GiveBodyItem(OwnerID() , 204397 ,1 )
	end
end

function LuaS_420929_0()
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420929 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420929_0]" ,  "LuaS_420929_1",  0 ); -- (詢問關於被領貨者射殺的海盜)
	end
end

function LuaS_420929_1()
	SetSpeakDetail( OwnerID(), "[SC_420929_1]"); -- 坦奇加的回答
end

function LuaS_420929_2() --掛在海盜屍體上的
	SetPlot(OwnerID(),"touch","LuaS_420929_3",50)
	AddBuff(OwnerID(),503165,0,-1)
	LuaP_Dead()
end

function LuaS_420929_3()
	if	not CheckAcceptQuest( OwnerID(), 420929 ) 	then
		return
	end

	if	CountBodyItem(OwnerID(),204398)<1	then
		GiveBodyItem(OwnerID(),204398,1)
	end
end


function LuaS_420930_0() --喬安
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_1",  0 );
	end
end

function LuaS_420930_1()
	SetSpeakDetail( OwnerID(), "[SC_420930_1]");
	SetFlag(OwnerID(),542478,1)
end

function LuaS_420930_2() --凱菲司
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_3",  0 );
	end
end

function LuaS_420930_3()
	SetSpeakDetail( OwnerID(), "[SC_420930_3]");
	SetFlag(OwnerID(),542500,1)
end



function LuaS_420930_6() -- 安東
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_7",  0 );
	end
end

function LuaS_420930_7()
	SetSpeakDetail( OwnerID(), "[SC_420930_7]");
	SetFlag(OwnerID(),542502,1)
end

function LuaS_420930_8() -- 提斯蘭
	LoadQuestOption( OwnerID() );
	if	CheckAcceptQuest( OwnerID(), 420930 ) 	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_420930_4]" ,  "LuaS_420930_9",  0 );
	end
end

function LuaS_420930_9()
	SetSpeakDetail( OwnerID(), "[SC_420930_9]");
	SetFlag(OwnerID(),542503,1)
end

function LuaS_420930_10() --任務420930的拉魯卡對話劇情
	CloseSpeak(OwnerID());
	DisableQuest( TargetID() , true )
	MoveToFlagEnabled( TargetID(), true )--go
	SetDelayPatrolTime( TargetID(), 0 )
end

function LuaS_420930_11() --拉魯卡路徑2
	MoveToFlagEnabled( OwnerID(), false )--stop
	Say(OwnerID(),"[SC_420930_10]") --這麼剛好，他剛好回營地來!
	sleep(20)
	local Joan = Lua_DW_CreateObj("flag" , 112569 , 780088 , 2)
	Say(Joan , "[SC_420930_11]") -- 啊？有人找我？
	for i=1,30 do
		sleep(10)
	end
	Say(Joan , "[SC_420930_12]") -- 閒話聊太久了，巡邏時間！
	sleep(10)
	DelObj(Joan)
	MoveToFlagEnabled( OwnerID(), true )--go
end



function LuaS_420931_0()
	BeginPlot(TargetID(),"LuaS_420931_1",0)
	return 1
end

function LuaS_420931_1()
	DisableQuest( OwnerID() , true )
	local Joan = Lua_DW_CreateObj("flag",101734,780088 , 3)
	SetPlot(Joan,"dead","LuaS_420931_2",0)
	Yell(Joan ,"[SC_420931_0]",2) -- 沒想到會被你找到！不過沒關係……死人是不會說話的！
	SetAttack(Joan,TargetID())
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,Joan)
	BeginPlot(OwnerID(),"LuaS_420931_3",0)
	sleep(20)
	Say(TargetID(),"[SC_420931_5]") -- 沒用!
end

function LuaS_420931_2()
	Say(TargetID(),"[SC_420931_1]") --原來毒蛇就是基克，得趕快告訴畢昂這件事……
	local Player = {}
	local HateSome  -- 仇恨表內的人
	for i = 0 , HateListCount( OwnerID() ) do
		HateSome = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	not CheckCompleteQuest( HateSome  , 420931 )  then
			GiveBodyItem( HateSome , 204399 , 1 )
			SetFlag(HateSome,542488,1)
		end
	end
end

function LuaS_420931_3()
	local Joan = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while	CheckID(Joan)	do
		sleep(10)
	end
	DisableQuest( OwnerID() , false )
end

function LuaS_420931_4()
	if	Lua_ExGetZone( OwnerID()) == 7	then
		local tips = Lua_DW_CreateObj("obj" , 112399, OwnerID(),0)
		Lua_ObjDontTouch(tips)
		SetModeEx( tips , EM_SetModeType_Gravity , false ) 
		AddToPartition(tips,0)
		AddBuff(tips,502924,1,-1)
		BeginPlot(tips,"LuaS_420931_5",0)
		BeginPlot(tips,"LuaS_420931_6",0)
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 ) --你無法在此區域使用該物品
		return false
	end
end

function LuaS_420931_5()
--	LuaFunc_MoveToFlag( OwnerID() , 780088 , 4 ,0 )
	local FlagX = GetMoveFlagValue( 780088 , 4 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( 780088 , 4 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( 780088 , 4 , EM_RoleValue_Z )
	MoveDirect( OwnerID(), FlagX , FlagY , FlagZ )
	sleep(15)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_X)/10 == FlagX/10		and
		ReadRoleValue(OwnerID(),EM_RoleValue_Z)/10 == FlagZ/10		then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_420931_2]", 0 ) --追蹤器指向這裡……
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_420931_2]", 0 ) --追蹤器指向這裡……
	end
end

function LuaS_420931_6()
	sleep(20)
	DelObj(OwnerID())	
end

function LuaS_420931_7()
	BeginPlot(OwnerID(),"LuaS_420931_8",0)
	return 1
end

function LuaS_420931_8()
	Say(OwnerID(),"[SC_420931_3]") --這裡的土似乎是新的……
	sleep(20)
	Say(OwnerID(),"[SC_420931_4]") --警備隊的裝備！畢昂的懷疑沒錯……警備隊裡還有內奸！
end