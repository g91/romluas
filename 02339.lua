----424069百密一疏
function LuaAS_424069_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424069) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424069_01]","LuaAS_424069_02",0) 	--將識別證拿給他看
	end
end

function LuaAS_424069_02()
	SetSpeakDetail(OwnerID(),"[SC_424069_02]") 	--......雖然嘮叨了點
	SetFlag(OwnerID(),544873,1)
	if 	CheckFlag(OwnerID(),544873) == true 	and 	CheckFlag(OwnerID(),544874) == true 	and 	CheckFlag(OwnerID(),544875) == true 	then
		SetFlag(OwnerID(),544876,1)
	end
end

function LuaAS_424069_03()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424069) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424069_01]","LuaAS_424069_04",0) 	--將識別證拿給他看
	end
end

function LuaAS_424069_04()
	SetSpeakDetail(OwnerID(),"[SC_424069_03]") 	--(他看了一眼識別證，眉頭緊緊皺著)
	SetFlag(OwnerID(),544874,1)
	if 	CheckFlag(OwnerID(),544873) == true 	and 	CheckFlag(OwnerID(),544874) == true 	and 	CheckFlag(OwnerID(),544875) == true 	then
		SetFlag(OwnerID(),544876,1)
	end
end

function LuaAS_424069_05()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424069) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424069_01]","LuaAS_424069_06",0)	--將識別證拿給他看
	end
end

function LuaAS_424069_06()
	SetSpeakDetail(OwnerID(),"[SC_424069_04]") 	--(看見識別證後，他突然抱頭痛哭)
	SetFlag(OwnerID(),544875,1)
	if 	CheckFlag(OwnerID(),544873) == true 	and 	CheckFlag(OwnerID(),544874) == true 	and 	CheckFlag(OwnerID(),544875) == true 	then
		SetFlag(OwnerID(),544876,1)
	end
end

----424077臨時傳訊員
function LuaAS_424077_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424077) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424077_01]","LuaAS_424077_02",0) 	--居尼爾斯副隊長要我來詢問前線狀況。
	end
end

function LuaAS_424077_02()
	SetSpeakDetail(OwnerID(),"[SC_424077_02]") 	--你可終於來了！我還在想怎麼都沒人來找我詢問戰況呢...
	GiveBodyitem(OwnerID(),209280,1)
	SetFlag(OwnerID(),544893,1)
end

----424078清點物資
function LuaAS_424078_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 1 		then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_01]","LuaAS_424078_02",0) 	--居尼爾斯副隊長要我來清點物資。
	end
end

function LuaAS_424078_02()
	SetSpeakDetail(OwnerID(),"[SC_424078_02]")	--是！目前製作防禦工程用的木材存量沒有問題...
	SetFlag(OwnerID(),544894,1)
end

function LuaAS_424078_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 1 		then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_01]","LuaAS_424078_04",0)
	end
end

function LuaAS_424078_04()
	SetSpeakDetail(OwnerID(),"[SC_424078_04]") 	--是！我們的備用武器及箭矢嚴重不足...
	SetFlag(OwnerID(),544895,1)
end

function LuaAS_424078_05()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 1 		then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_01]","LuaAS_424078_06",0)
	end
end

function LuaAS_424078_06()
	SetSpeakDetail(OwnerID(),"[SC_424078_03]") 	--謝謝你們的關心...
	SetFlag(OwnerID(),544896,1)
end

function LuaAS_424078_07()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424078) == true 	and
		CountBodyItem(OwnerID(),209282) == 0 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424078_05]","LuaAS_424078_08",0)
	end
end

function LuaAS_424078_08()
	SetSpeakDetail(OwnerID(),"[SC_424078_06]")
	GiveBodyItem(OwnerID(),209282,1)
end
----424080新的發現
function LuaAS_424080_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424080) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424080_01]","LuaAS_424080_02",0) 	--我想知道記憶符石詳細的狀況。
	end
end

function LuaAS_424080_02()
	SetSpeakDetail(OwnerID(),"[SC_424080_02]") 	--關於記憶符石目前的狀況
	SetFlag(OwnerID(),544902,1)
end

Function LuaAS_14_Sleeping()
	AddBuff ( OwnerID(), 509062, 0,-1 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
end