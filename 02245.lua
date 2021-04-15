----薩滿對話選項
function LuaAS_117512_01()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_117512_01]","LuaAS_117512_02",0)
end

function LuaAS_117512_02()
	SetSpeakDetail(OwnerID(),"[SC_117512_02]")
end

----聆聽歌謠
function LuaAS_423808_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423808) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423808_01]","LuaAS_423808_02",0)
	end
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423809) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423809_01]","LuaAS_423809_02",0)
	end
end

function LuaAS_423808_02()
	SetSpeakDetail(OwnerID(),"[SC_423808_02]")
	SetFlag(OwnerID(),544804,1)
end

----從沒聽過的歌詞
function LuaAS_423809_02() 	
	SetSpeakDetail(OwnerID(),"[SC_423809_02]")
	SetFlag(OwnerID(),544768, 1)
	if 	CheckFlag(OwnerID(),544768) == true and CheckFlag(OwnerID(),544769) == true 	 then
		SetFlag(OwnerID(),544805,1)
	end
end

function LuaAS_423809_03() 	----村民
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423808) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423808_01]","LuaAS_423808_02",0)
	end
	if 	CheckAcceptQuest(OwnerID(),423809) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423809_01]","LuaAS_423809_04",0)
	end
end

function LuaAS_423809_04()
	SetSpeakDetail(OwnerID(),"[SC_423809_03]")
	SetFlag(OwnerID(),544769, 1)
	if 	CheckFlag(OwnerID(),544768) == true and CheckFlag( OwnerID(),544768) == true 	 then
	SetFlag(OwnerID(),544805, 1)
	end
end

function LuaAS_423809_05() 	----族長
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423809) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423809_01]","LuaAS_423809_06",0)
	end
	if	CheckAcceptQuest(OwnerID(),423828)==true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423894_0]","LuaWS_423809_051",0)
		
	end
	
end

function LuaWS_423809_051()
	SetSpeakDetail(OwnerID(),"[SC_423894_1]")
	setflag(OwnerID(),544744,1)
end

function LuaAS_423809_06()
	SetSpeakDetail(OwnerID(),"[SC_423809_04]")
	SetFlag(OwnerID(),544806,1)
end

----千年前的記憶
function LuaAS_423811_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423811) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423811_01]","LuaAS_423811_02",0)
	end
end

function LuaAS_423811_02()
	SetSpeakDetail(OwnerID(),"[SC_423811_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423811_03]","LuaAS_423811_03",0)
end

function LuaAS_423811_03()
	SetSpeakDetail(OwnerID(),"[SC_423811_04]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423811_05]","LuaAS_423811_04",0)
end

function LuaAS_423811_04()
	SetSpeakDetail(OwnerID(),"[SC_423811_06]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423811_07]","LuaAS_423811_05",0)
end

function LuaAS_423811_05()
	SetSpeakDetail(OwnerID(),"[SC_423811_08]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423811_09]","LuaAS_423811_06",0)
end

function LuaAS_423811_06()
	SetSpeakDetail(OwnerID(),"[SC_423811_10]")
	SetFlag(OwnerID(),544765,1)
end

----拿取藥草
function LuaAS_423812_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423812) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423812_01]","LuaAS_423812_02",0)
	end
end

function LuaAS_423812_02()
	SetSpeakDetail(OwnerID(),"[SC_423812_02]")
	GiveBodyItem(OwnerID(),209096,1)
end


----423797
function LuaAS_423797_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423797) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423797_01]","LuaAS_423797_02",0)
	end
end

function LuaAS_423797_02()
	SetSpeakDetail(OwnerID(),"[SC_423797_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423797_03]","LuaAS_423797_03",0)
end

function LuaAS_423797_03()
	SetSpeakDetail(OwnerID(),"[SC_423797_04]")
end