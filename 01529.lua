
---------------------------------------
function LuaS_422720_0()--掛在 113265  希波．坎特恩 身上的對話劇情
---------------------------------------
	LoadQuestOption(OwnerID())
--如果有任務的反應
	if	CheckAcceptQuest(OwnerID(),422720)	and
		CountBodyItem(OwnerID(),205838)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422720_0]","LuaS_422720_1", 0 )
	end
end



---------------------------------------
function LuaS_422720_1()
---------------------------------------
--判斷條件
	if	not CheckCompleteQuest(OwnerID(),422567)	then
		SetSpeakDetail( OwnerID(),"[SC_422720_1]")
	else
--如果完成任務鏈
--給予任務物品
--判斷是否給過該物品
		if	CountBodyItem(OwnerID(),205838)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422720_2]")
			GiveBodyItem(OwnerID(),205838,1)
		else
			CloseSpeak(OwnerID())
		end
	end
end


---------------------------------------
function LuaS_422721_1() --蕈人王的對話劇情的後續
---------------------------------------
--判斷條件
	if	not CheckCompleteQuest(OwnerID(),422482)	then
		SetSpeakDetail( OwnerID(),"[SC_422721_1]")
	else
--如果完成任務鏈
--給予任務物品
--判斷是否給過該物品
		if	CountBodyItem(OwnerID(),205839)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422721_2]")
			GiveBodyItem(OwnerID(),205839,1)
		else
			CloseSpeak(OwnerID())
		end
	end
end


---------------------------------------
function LuaS_422721_3()--制式回應
---------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422721_3]")
end


---------------------------------------
function LuaS_422722_0() -- 掛在 113304 契德列．艾斯的對話劇情
---------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422722)	and
		CountBodyItem(OwnerID(),205840)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422722_0]","LuaS_422722_1", 0 )
	end
end

---------------------------------------
function LuaS_422722_1()
---------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422722_1]")
end


---------------------------------------
function LuaS_422722_2()-- 掛在 113288 提帕布斯的對話劇情
---------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422722)	and
		CountBodyItem(OwnerID(),205840)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422722_2]","LuaS_422722_3", 0 )
	end
end



---------------------------------------	
function LuaS_422722_3()
---------------------------------------
--判斷條件
	if	not CheckCompleteQuest(OwnerID(),422604)	then
		SetSpeakDetail( OwnerID(),"[SC_422722_3]")
	else
--如果完成任務鏈
--給予任務物品
--判斷是否給過該物品
		if	CountBodyItem(OwnerID(),205840)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422722_4]")
			GiveBodyItem(OwnerID(),205840,1)
		else
			CloseSpeak(OwnerID())
		end
	end
end


---------------------------------------
function LuaS_422723_0()-- 掛在 113176 潔希琪．諾辛的對話劇情
---------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422723)	and
		CountBodyItem(OwnerID(),205841)<1	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422723_0]","LuaS_422723_1", 0 )
	end
end

--  _1 之後在雜項區

---------------------------------------
function LuaS_422723_1()
---------------------------------------
--判斷條件
--如果完成奪回任務
--給予任務物品
	if	CheckCompleteQuest(OwnerID(),422724)	then
--判斷是否給過該物品
		if	CountBodyItem(OwnerID(),205841)<1		then
			SetSpeakDetail( OwnerID(),"[SC_422723_1]")
			GiveBodyItem(OwnerID(),205841,1)
		else
			CloseSpeak(OwnerID())
		end
	else
--是否完成過殺女蛇人的任務
		if	CheckCompleteQuest(OwnerID(),422441)	then
			SetSpeakDetail( OwnerID(),"[SC_422723_2]")
		else
			SetSpeakDetail( OwnerID(),"[SC_422723_3]")
		end
	end
end

---------------------------------------
function LuaS_113420_0()--柯契夫．維羅 身上的對話劇情
---------------------------------------
	if	CheckFlag(OwnerID(),543283)	then
		SetSpeakDetail( OwnerID(),"[SC_113420_0]")
	else
		LoadQuestOption(OwnerID())
	end
end