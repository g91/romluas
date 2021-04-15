
------------------------------------------------------
--遠征隊的使命   對話取得重要旗標
----------------------------------------------------
function LuaS_422499_0()
	LoadQuestOption(OwnerID())
--有任務就看得到
	if	CheckAcceptQuest(OwnerID(),422499)	then
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_422499_0]",  "LuaS_422499_1",  0 )
	end
end

function LuaS_422499_1()
	SetSpeakDetail( OwnerID(), "[SC_422499_1]")
--看訊息同時給任務旗標
	SetFlag(OwnerID(),542947,1)
end


------------------------------------------------
--瘋狂伊莫	對話後進入戰鬥
------------------------------------------------

function LuaS_422502_0() --對話劇情
	LoadQuestOption(OwnerID())
--有任務就看得到
	if	CheckAcceptQuest(OwnerID(),422502)	and
		CheckFlag(OwnerID(),542948)==false	then
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_422502_0]",  "LuaS_422502_1",  0 )
	end
end

function LuaS_422502_1()
	BeginPlot(TargetID(),"LuaS_422502_2",0)
end

function LuaS_422502_2() --接受任務後	觸發劇情
--關閉玩家互動
	DisableQuest(OwnerID(),true)
--隱藏本尊
	Hide(OwnerID())
--建立戰鬥用替身 &防止戰鬥後留存的問題 &指定目標 &完成條件
	local StandIn = Lua_DW_CreateObj("obj",102401,OwnerID())
	SetPlot(StandIn,"dead","LuaS_422502_3",0)
	Say(StandIn,"[SC_422502_1]")
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

function LuaS_422502_3() --死亡劇情 給完成旗標
	local Tar
	for i=0,HateListCount(OwnerID()),1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,422502)	and
			CheckFlag(Tar,542948)==false	then
			SetFlag(Tar,542948,1)
		end
	end
	DelObj(OwnerID())
	return true
end


-----------------------------------------------------------------------

-----------------------------------------------------------------------