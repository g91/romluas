

--================================================================================
--和木匠換東西
--================================================================================
function LuaZ13WS_423845_117706()
	local Obj = OwnerID()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423845)==true		and
		CheckCompleteQuest(OwnerID(),423845)==false	and
		CountBodyItem(Obj,209475)>=10			and
		CountBodyItem(OwnerID(),201753)<10		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423845_0]","LuaZ13WS_423845_1",0)
		--你好，聽說可以拿10隻[105176]跟你換10份[201753]。
	end
end 

function LuaZ13WS_423845_1()
	local Obj = OwnerID()
	if	CountBodyItem(Obj,209475)>=10		then
		DelBodyItem(Obj,209475,10)
		SetSpeakDetail(OwnerID(),"[SC_423845_1]")
	--嗯，是啊，別問我要那些[105176]是做什麼的，如果你想跟我換[201753]，最好什麼都別問，好奇心得用在對的地方，我只是個沒什麼故事的老木匠，拿了東西就走吧。
		GiveBodyItem(OwnerID(),201753,10)
	else
		CloseSpeak(Obj)
	end
end 



--================================================================================
--與記憶核心對話(在凡蓋德)
--================================================================================
function LuaZ13WS_423848_117653()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423848)==true		and
		CheckCompleteQuest(OwnerID(),423848)==false	and
		Checkflag(OwnerID(),544778)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423848_0]","LuaZ13WS_423848_117653_1",0)
		--你所謂的目標是什麼？	--
	end 
end

function LuaZ13WS_423848_117653_1()
	SetSpeakDetail(OwnerID(),"[SC_423848_1]")	
	--目標即鑲嵌於生命體內的禁忌符文，摧毀禁忌符文的宿主──魔族。
	--第一目標，力量等級為極度危險的禁忌符文。所在地點為東2687...西458...南10058...北54，超出現有地圖記載之外，資訊不足，無法判定。
	--加寬禁忌符文能量偵測標準，重新掃描福羅斯特島，開始......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423848_2]","LuaZ13WS_423848_117653_2",0)
	--島上有你的目標？
end 


function LuaZ13WS_423848_117653_2()

	BeginPlot(TargetID(),"LuaZ13WS_423848_117653_3",0)
--say(OwnerID(),"0..0")
--say(TargetID(),"1..1")
	CloseSpeak(OwnerID())
end

function LuaZ13WS_423848_117653_3()
--say(OwnerID(),"0..0")
--say(TargetID(),"3..3")
	Say(OwnerID(),"[SC_423848_3]")
	--嗶嗶嗶！第二目標發現！力量等級為高度危險。
	Sleep(30)
	Say(OwnerID(),"[SC_423848_4]")
	--以現有地圖分析，在寒冰城堡之中。未至危險等級之目標共搜尋到257個...嗶嗶嗶......
	Sleep(40)
	Say(OwnerID(),"[SC_423848_5]")
	--判斷中，第一目標危險等級高於第二目標，第一目標獲得優先處置排序。其餘目標暫時不予追蹤。
	SetFlag(TargetID(),544778,1)
	
	
end 




