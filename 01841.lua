
-------------------------------------------------------------
--檢查劇情 沒完成任務的人不歡迎他
-------------------------------------------------------------
function LuaS_423257_DW_01()
	local AllPlayer = {}
	local AllPlayerAmount = 0
	local Monster = {}
	while true do
--檢查該區域的每個玩家
		AllPlayerAmount = SetSearchAllPlayer(0)
		for i=1,AllPlayerAmount,1 do
			AllPlayer[i] = GetSearchResult()
			if	DW_CheckMap(AllPlayer[i],825)		then
--檢查旗標
				if	CheckFlag(AllPlayer[i],543984)==false	and
					CheckBuff(AllPlayer[i],506708)==false	and
--檢查還活著
					ReadRoleValue(AllPlayer[i],EM_RoleValue_IsDead)==0	then

--確定怪物數未超過標準
					Monster = SearchRangeNPC ( AllPlayer[i] , 200 )
					if	table.getn(Monster)<12		then
						BeginPlot(AllPlayer[i],"LuaS_423257_DW_05",0)
					end
				end
			end
		end
		sleep(80)
	end
end

------------------------------------------------------------------
--範圍判斷
------------------------------------------------------------------
function LuaS_423257_DW_02()
--建立替身
	local Trick  = Lua_DW_CreateObj("obj",115438,OwnerID())
	DisableQuest(Trick,true)
--範圍內的玩家需要buff
	local Player = {}
	while ReadRoleValue(OwnerID(),EM_RoleValue_PID)==1 do
		Player = SearchRangePlayer ( OwnerID() , 250 )
		for i=0,table.getn(Player)-1,1 do
			if	CheckAcceptQuest(Player[i],423257)==true	and
				CheckFlag(Player[i],544011)==false		then
				AddBuff(Player[i],506708,1,5)
			end
		end
		sleep(40)
	end
	DelObj(Trick)
	MoveToFlagEnabled(OwnerID(), true )
	DelFromPartition(OwnerID())
	ReSetNPCInfo( OwnerID() )
	AddToPartition(OwnerID(),0)
end
------------------------------------------------------------------
--npc的起點
------------------------------------------------------------------
function LuaS_423257_DW_03()
	MoveToFlagEnabled(OwnerID(), false)
	DisableQuest(OwnerID(),false)
end


------------------------------------------------------------------
--npc的終點
------------------------------------------------------------------
function LuaS_423257_DW_04()
	LuaS_423257_7()
	local Player = {}
	Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player)-1,1 do
		if	CheckAcceptQuest(Player[i],423257)==true	and
			CheckFlag(Player[i],544011)==false		then
			SetFlag(Player[i],544011,1)
			SetFlag(Player[i],543984,1)
		end
	end
	MoveToFlagEnabled(OwnerID(), false)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end

function LuaS_423257_DW_05()
	local Chepuray = {}
--設4隻卻普瑞圍攻
	Chepuray = Lua_Davis_BornByMultilateral( 103832 , 4 , 130 )
	for x=1,table.getn(Chepuray),1 do
--卻普瑞離開戰鬥就消失
		SetPlot(Chepuray[x],"dead","LuaS_423257_DW_06",0)
		SetAttack(Chepuray[x],OwnerID())
		CallPlot(Chepuray[x],"LuaFunc_Obj_Suicide",30)
	end
end
function LuaS_423257_DW_06()
	DelObj(OwnerID())
	return false
end
------------------------------------------------------------------
--讓範圍劇情
------------------------------------------------------------------
function LuaS_423257_DW_07()
	SetPlot(OwnerID(),"range","LuaS_423257_DW_08",100)
end

function LuaS_423257_DW_08()
	if	CheckAcceptQuest(OwnerID(),423257)==true	and
		CheckFlag(OwnerID(),544011)==false		then
		SetFlag(OwnerID(),544011,1)
		SetFlag(OwnerID(),543984,1)
	end
end
------------------------------------------------------------------
--423257	和螢火對話
------------------------------------------------------------------
function LuaS_423257_0()
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),423257)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_0]","LuaS_423257_1",0)
		--「請告訴我，你怎麼會在這裡？」
	end
end

function LuaS_423257_1()
	SetSpeakDetail(OwnerID(),"[SC_423257_1]")
	--因為晨星告訴我，在這個谷地裡，有我最渴求的寶藏，所以我來了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_2]","LuaS_423257_2",0)
	--「你與晨星......是朋友？」
end

function LuaS_423257_2()
	SetSpeakDetail(OwnerID(),"[SC_423257_3]")
	--我們認識。
	--你準備進谷了嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_4]","LuaS_423257_3",0)
	--「我還是想自己試試。」
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_5]","LuaS_423257_4",0)
	--「帶我進去吧。」
end

function LuaS_423257_3()
	CloseSpeak(OwnerID())
end

function LuaS_423257_4()
--關任務
	DisableQuest(TargetID(),true)
--暗示進行中
	BeginPlot(TargetID(),"LuaS_423257_DW_02",0)
	WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
--關對話
	CloseSpeak(OwnerID())
--消除對話移動延遲
	SetDelayPatrolTime( TargetID(), 0 )
--開始移動
	MoveToFlagEnabled(TargetID(), true)
	Say(TargetID(),"[SC_423256_0]")
end

function LuaS_423257_5()
	Say(OwnerID(),"[SC_423256_1]")
end

function LuaS_423257_6()
	Say(OwnerID(),"[SC_423256_2]")
end

function LuaS_423257_7()
	Say(OwnerID(),"[SC_423256_3]")
end