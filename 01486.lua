
--「安撫」阿爾文

function LuaS_421958_0() --接受任務後	觸發劇情
--關閉玩家互動
	DisableQuest(OwnerID(),true)
--隱藏本尊
	Hide(OwnerID())
--建立戰鬥用替身 &防止戰鬥後留存的問題 &指定目標 &完成條件
	local StandIn = Lua_DW_CreateObj("obj",102354,OwnerID())
	SetPlot(StandIn,"dead","LuaS_421958_1",0)
	Say(StandIn,"[SC_421958_0]")
	BeginPlot(StandIn,"LuaS_Discowood_CheckPeace",0)
	SetAttack(StandIn,TargetID())
--檢查何時結束
	while	CheckID(StandIn)	do
		sleep(10)
	end
--現出本尊	&重啟互動
	Show(OwnerID(),0)
	DisableQuest(OwnerID(),false)
end

function LuaS_421958_1() --死亡劇情 給完成旗標
	local Tar
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,421958)	and
			CheckFlag(Tar,542913)==false	then
			SetFlag(Tar,542913,1)
		end
	end
	DelObj(OwnerID())
	return true
end


--調查巨猿山埋東西  使用 780091旗  1號

function LuaS_422559_0() --物件上的初始	範圍劇情
	SetPlot(OwnerID(),"range","LuaS_422559_1",150)
end

function LuaS_422559_1() -- 範圍劇情	執行
--觸碰者是否	有接任務&尚未完成
	if	CheckAcceptQuest(OwnerID(),422559)	and
		CheckFlag(OwnerID(),542915)==false	then
--顯示字串提示
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422559]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422559]", 0 );
--給予完成任務旗標
		SetFlag(OwnerID(),542915,1)
	end
end

function LuaS_422559_2()--物品使用	檢查劇情
--判斷距離是否過遠
	if	not	DW_CheckDis(OwnerID(),780091,1,150)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SYS_TOUCH_TARGET_TOFAR]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SYS_TOUCH_TARGET_TOFAR]",0)
		return false
	end
	return true
end


function LuaS_422559_3()--物品使用	執行劇情
--給予完成旗標
	SetFlag(OwnerID(),542914,1)
--劇情表現	種出一個土堆
	local StandIn = Lua_DW_CreateObj("obj",113266,OwnerID())
	BeginPlot(StandIn,"LuaS_Discowood_CheckPeace",0)
--字串回饋
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422559_1]", 0 );
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422559_1]", 0 );
	return true
end


--點墓碑婆婆發表演說


function LuaS_421962_2()-- 點擊物件後執行
--刪掉花束
	DelBodyItem(OwnerID(),205646,1)
--關閉NPC互動
	DisableQuest(TargetID(),true)
--種出演戲的阿婆	&關閉互動	&開始移動
	local Older = Lua_DW_CreateObj("flag",113272,780091,2)
	DisableQuest(Older,true)
--執行下一段劇情 &傳入墓碑id
	WriteRoleValue(Older,EM_RoleValue_PID,OwnerID())
	CallPlot(Older,"LuaS_421962_3",TargetID())
	Say(Older,"[SC_421962_7]")
--模版觸發
	return 1
end

function LuaS_421962_3(Rock)-- 持續的表演
	local Tar = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--移動到指定位置
	DW_MoveToFlag( OwnerID(),780091,3,0,1)
	Say(OwnerID(),"[SC_421962_8]")
--給予完成旗標	&重新顯像
	SetFlag(Tar,542928,1)
--找出NPC 重新載入
--	local NPC = SearchRangeNPC(OwnerID(),100)
--	for i=0,table.getn(NPC)-1,1 do
--		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 113283	then
--			Hide(NPC[i])
--			Show(NPC[i],0)
--		end
--	end
--重啟墓碑NPC互動
	DisableQuest(Rock,false)
	DelObj(OwnerID())
end



--純對話劇情

function LuaS_422570_0()--掛在任務NPC的對話劇情
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422570)	and
		CheckFlag(OwnerID(),542917)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422570_1]","LuaS_422570_1",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422570_2]","LuaS_422570_2",0)
	end
end

function LuaS_422570_1()
	SetSpeakDetail(OwnerID(),"[SC_422570_3]")
	SetFlag(OwnerID(),542917,1)
end

function LuaS_422570_2()
	SetSpeakDetail(OwnerID(),"[SC_422570_4]")	
end


--純對話劇情

--掛在亞爾弗列德任務NPC的對話劇情
function LuaS_422572_0() --掛在亞爾弗列德任務NPC的對話劇情
	LoadQuestOption(OwnerID())

	if	CheckAcceptQuest(OwnerID(),422572)	and
		CheckFlag(OwnerID(),542923)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422572]","LuaS_422572_1",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422572_1]","LuaS_422572_2",0)
	end

	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_0]","LuaS_422897_1",0)				--我把自然之石帶回來了，隱士和米娜薇絲說過…
	end

	if	(CheckAcceptQuest(OwnerID(),422842)==true ) 		and
		(CheckCompleteQuest( OwnerID() , 422842) == false ) 	and
		(CheckFlag(OwnerID(),543468)== false)			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422842_0]","LuaS_422842_1",0) 		--「波多村的元素混亂，會是禁制之壁開啟的關係嗎？」
	end

	if	(CheckAcceptQuest(OwnerID(),422855)==true ) 		and
		(CheckCompleteQuest( OwnerID() , 422855) == false )	and
		(CheckFlag(OwnerID(),543427)==false)		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422855_0]","LuaS_422855_1",0) 		--「還沒有，我準備等一下去拜訪她。」
	end

end

function LuaS_422572_1()
	SetSpeakDetail(OwnerID(),"[SC_422572_2]")
	SetFlag(OwnerID(),542923,1)
end

function LuaS_422572_2()
	SetSpeakDetail(OwnerID(),"[SC_422572_3]")	
end




-- 任務完成才出現的袋子

function LuaS_422568_1()--掛在物品使用	執行劇情	給物品
	GiveBodyItem(OwnerID(),205614,1)
	GiveBodyItem(OwnerID(),205615,1)
	GiveBodyItem(OwnerID(),205616,1)
end


function LuaS_422568_2() --掛在物品使用	執行劇情	取得任務
--初始化石碑介面
	ClearBorder( OwnerID())	
--石碑內容
	AddBorderPage( OwnerID(), GetQuestDetail(422568,1))
--石碑標題
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422568, str ,"ScriptBorder_Texture_Paper" )
end

function LuaS_422568_3() --觸碰劇情
	SetPlot(OwnerID(),"touch","LuaS_422568_4",50)
end

function LuaS_422568_4() --觸碰劇情執行
--使用物品
	GiveBodyItem(OwnerID(),205617,1)
--重新載入
--	Hide(TargetID())
--	Show(TargetID(),0)
end


--422565


function LuaS_422565_0()--掛在物品使用	執行劇情	取得任務
	SetFlag(OwnerID(),542916,1)
--初始化石碑介面
	ClearBorder( OwnerID())	
--石碑內容
	AddBorderPage( OwnerID(), GetQuestDetail(422566,1))
--石碑標題
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ShowBorder( OwnerID(), 422566, str , "ScriptBorder_Texture_Paper" )
end

function LuaS_422565_1()--初始劇情	掛上觸碰劇情
	SetPlot(OwnerID(),"touch","LuaS_422565_2",50)
end

function LuaS_422565_2()--觸碰劇情的執行劇情
--避免重複觸發
	SetPlot(TargetID(),"touch","",0)
--先檢查任務階段 &完成條件
	if	CheckAcceptQuest(OwnerID(),422565)	and
		CheckFlag(OwnerID(),542916)==false	then
		SetFlag(OwnerID(),542916,1)
	end
--先檢查任務階段 &完成條件
	if	CheckAcceptQuest(OwnerID(),422566)==false	and
		CheckCompleteQuest(OwnerID(),422566)==false	and
		CountBodyItem(OwnerID(),205598)<1		then
		GiveBodyItem(OwnerID(),205598,1)
	end
--重啟觸發
	SetPlot(TargetID(),"touch","LuaS_422565_2",50)
end

--問答題三選一


--掛在米娜薇絲任務NPC的對話劇情
function LuaS_421962_4() --掛在任務NPC的對話劇情
	LoadQuestOption(OwnerID())
--如果有接任務卻還沒完成
	if	CheckAcceptQuest(OwnerID(),421962)	and
		CheckFlag(OwnerID(),542930)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_421962_1]","LuaS_421962_5",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_421962_2]","LuaS_421962_6",0)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_421962_3]","LuaS_421962_7",0)
	end

	if (CheckAcceptQuest(OwnerID(),422628)==true )and(CheckCompleteQuest( OwnerID() , 422628) == false )then	--太初之所副本任務
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422628_1",0)
	end

	if ( CheckAcceptQuest(OwnerID(),422876)==true) and (CheckBuff( OwnerID() , 505441)== true) then
		SetFlag( OwnerID() , 543505, 1 )
	end

	if (CheckBuff( OwnerID() , 505441)== false)and( CheckAcceptQuest(OwnerID(),422876)==true) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696_101]" , C_SYSTEM ) --你已經超時間，請放棄任務重新來過
	end

	if	(CheckAcceptQuest(OwnerID(),422841)==true )		and					--史詩四任務
		(CheckCompleteQuest( OwnerID() , 422841) == false ) 	and
		(CheckFlag(OwnerID(),543467)==false)  		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422841_0]","LuaS_422841_2",0) 		--「能為[113282]女士您效勞，是我的榮幸。」
	end

	if	(CheckAcceptQuest(OwnerID(),422844)==true ) 		and
		(CheckCompleteQuest( OwnerID() , 422844) == false )	 and
		(CheckFlag(OwnerID(),543541)==false)  		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422844_0]","LuaS_422844_1",0)		--「記得，但是[113274]長老說，拿走聖劍的是英雄席格斯啊。」
	end


end

function LuaS_421962_5()
	SetSpeakDetail(OwnerID(),"[SC_421962_4]")
	SetFlag(OwnerID(),542930,1)
end

function LuaS_421962_6()
	SetSpeakDetail(OwnerID(),"[SC_421962_5]")
end

function LuaS_421962_7()
	SetSpeakDetail(OwnerID(),"[SC_421962_6]")
end



--錯誤的引導

function LuaS_422575_1()
	SetSpeakDetail(OwnerID(),"[SC_422575_1]")
	SetFlag(OwnerID(),542936,1)
end



--猴子的習性	422554	& 422555	使用旗號	780092	1(籃子)	2(小猴子出生點)	3(猴子走到籃子旁的點)	4(往這個點逃走)

function LuaS_422554_0() -- 完成任務劇情
--關閉互動
	DisableQuest(OwnerID(),true)
--放下籃子	&台詞
	local Bag = Lua_DW_CreateObj("flag",113329  ,780092,1)
	Say(OwnerID(),"[SC_422554_1]")
	sleep(15)
--創造小猴	&移動	&拿取	&逃走	&刪掉
	local Monkey = Lua_DW_CreateObj("flag",113256,780092,2 )
	DW_MoveToFlag( Monkey , 780092 , 3 , 0 ,1 )
	PlayMotion(Monkey,ruFUSION_ACTORSTATE_CAST_INSTANT)
	sleep(10)
	BeginPlot(Monkey,"LuaS_422554_1",0)
	sleep(15)
	DelObj(Monkey)
--台詞		&刪去籃子
	Say(OwnerID(),"[SC_422554_2]")
	sleep(15)
	DelObj(Bag)
--重啟互動
	DisableQuest(OwnerID(),false)
end


function LuaS_422554_1() --移動呼叫劇情
--移動到指定位置
	DW_MoveToFlag( OwnerID() , 780092 , 4 , 0 ,1 )
end



function LuaS_422555_0()  --接受任務劇情
--關閉互動
	DisableQuest(OwnerID(),true)
--放下籃子	&台詞
	local Bag = Lua_DW_CreateObj("flag",113329  ,780092,1)
	Say(OwnerID(),"[SC_422554_3]")
	sleep(15)
--創造小猴	&移動	&拿取	&逃走	&刪掉
	local Monkey = Lua_DW_CreateObj("flag",113256,780092,2 )
	DW_MoveToFlag( Monkey , 780092 , 3 , 0 ,1 )
	PlayMotion(Monkey,ruFUSION_ACTORSTATE_CAST_INSTANT)
	sleep(10)
	BeginPlot(Monkey,"LuaS_422554_1",0)
	sleep(15)
	DelObj(Monkey)
--台詞		&刪去籃子
	Say(OwnerID(),"[SC_422554_4]")
--完成旗標
	SetFlag(TargetID(),542922,1)
	sleep(15)
	DelObj(Bag)
--重啟互動
	DisableQuest(OwnerID(),false)
end
