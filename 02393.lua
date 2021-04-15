----424216 使節的下落
function LuaAS_424216_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424216) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_01]","LuaAS_424216_02",0) 	----「大將軍」蘭斯希望你盡快啟程出使艾翁，
	end
end

function LuaAS_424216_02()
	SetSpeakDetail(OwnerID(),"[SC_424216_02]") 	----這個時期出使艾翁...？
	SetFlag(OwnerID(),545101,1)
end

function LuaAS_424216_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424216) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_03]","LuaAS_424216_04",0) 	----「大將軍」蘭斯希望你盡快啟程出使夏多爾
	end
end

function LuaAS_424216_04()
	SetSpeakDetail(OwnerID(),"[SC_424216_04]") 	----要我出使夏多爾？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_05]","LuaAS_424216_05",0)  	----是的，我沒有聽錯。
end

function LuaAS_424216_05()
	SetSpeakDetail(OwnerID(),"[SC_424216_06]") 	----這樣呀...好吧，我會盡快前往夏多爾達成使命。
	SetFlag(OwnerID(),545102,1)
end

function LuaAS_424216_06()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424216) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424216_08]","LuaAS_424216_07",0) 	----「大將軍」蘭斯希望你盡快啟程出使萊慕恩
	end
end

function LuaAS_424216_07()
	SetSpeakDetail(OwnerID(),"[SC_424216_09]") 	----要我到萊慕恩嗎？
	SetFlag(OwnerID(),545104,1)
end

----424217  萬全的準備
function LuaAS_424217_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424217) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424217_01]","LuaAS_424217_02",0) 	----大將軍蘭斯要我來詢問妳是否已完成妳的工作。
	end
end

function LuaAS_424217_02()
	SetSpeakDetail(OwnerID(),"[SC_424217_02]") 	----唔？
	SetFlag(OwnerID(),545105,1)
end

function LuaAS_424217_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424217) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424217_01]","LuaAS_424217_04",0) 	----大將軍蘭斯要我來詢問妳是否已完成妳的工作。
	end
end

function LuaAS_424217_04()
	SetSpeakDetail(OwnerID(),"[SC_424217_03]") 	----啊...你問錯人了，我負責的工作並不是這個。
end

----424220  敲邊鼓
function LuaAS_424220_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_02",0) 	----請問您對出兵一事的看法？
	end
end

function LuaAS_424220_02()
	SetSpeakDetail(OwnerID(),"[SC_424220_02]") 	----我能明白陛下想保護人民的心情
	SetFlag(OwnerID(),545108,1)
end

function LuaAS_424220_03()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_04",0) 	----請問您對出兵一事的看法？
	end
end

function LuaAS_424220_04()
	SetSpeakDetail(OwnerID(),"[SC_424220_03]") 	----夏多爾一直是個尊重生命的國家
	SetFlag(OwnerID(),545109,1)
end

function LuaAS_424220_05()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_06",0) 	----請問您對出兵一事的看法？
	end
end

function LuaAS_424220_06()
	SetSpeakDetail(OwnerID(),"[SC_424220_04]") 	----小時候母親教我打獵時
	SetFlag(OwnerID(),545110,1)
end

function LuaAS_424220_07()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424220) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424220_01]","LuaAS_424220_08",0) 	----請問您對出兵一事的看法？
	end
end

function LuaAS_424220_08()
	SetSpeakDetail(OwnerID(),"[SC_424220_05]") 	----寶藏獵人在出手前
	SetFlag(OwnerID(),545111,1)
end

----424224  使節團的異狀
function LuaAS_424224_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424224) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424224_01]","LuaAS_424224_02",0) 	----紅色的果實是誰拿過來的？
	end
end

function LuaAS_424224_02()
	SetSpeakDetail(OwnerID(),"[SC_424224_02]") 	----當初使節團經過希尼斯特之地時
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424224_03]","LuaAS_424224_03",0) 	----(將神賜之果的真相告訴他。)
end

function LuaAS_424224_03()
	SetSpeakDetail(OwnerID(),"[SC_424224_04]") 	----什麼！？
	SetFlag(OwnerID(),545114,1)
end

----424228  神賜之果的下落
function LuaAS_424228_01()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ) 	----我想看看你賣的東西
	if 	CheckAcceptQuest(OwnerID(),424228) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424228_01]","LuaAS_424228_02",0) 	----你們是不是有賣一種外表鮮紅的果實？
	end
end

function LuaAS_424228_02()
	SetSpeakDetail(OwnerID(),"[SC_424228_02]") 	----啊，你是指那些「神賜之果嗎」？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424228_03]","LuaAS_424228_03",0) 	----兜售神賜之果的商人很常來嗎？
end

function LuaAS_424228_03()
	SetSpeakDetail(OwnerID(),"[SC_424228_04]") 	----沒有，他固定半個月會出現一次
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424228_05]","LuaAS_424228_04",0) ----那名商人上次來到紅土丘陵是什麼時候？
end

function LuaAS_424228_04()
	SetSpeakDetail(OwnerID(),"[SC_424228_06]") 	----我想想
	SetFlag(OwnerID(),545095,1)
end

----424231  騎士的心聲
function LuaAS_424231_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424231) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_01]","LuaAS_424231_02",0) 	----你還好嗎？
	end
end

function LuaAS_424231_02()
	SetSpeakDetail(OwnerID(),"[SC_424231_02]") 	----我知道現在任務期間
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_03]","LuaAS_424231_03",0) 	----嗯...或許你願意讓我聽聽你的煩惱？
end

function LuaAS_424231_03()
	SetSpeakDetail(OwnerID(),"[SC_424231_04]") 	----謝謝你，特使大人。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_05]","LuaAS_424231_04",0) 	----對這種水性楊花的女人，你不該如此執著。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_07]","LuaAS_424231_05",0) 	----愛就是要包容他的一切，他都已經是你的妻子了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_09]","LuaAS_424231_06",0) 	----......
end

function LuaAS_424231_04()
	SetSpeakDetail(OwnerID(),"[SC_424231_06]") 	----可是，你不懂
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_07]","LuaAS_424231_05",0) 	----愛就是要包容他的一切，他都已經是你的妻子了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_09]","LuaAS_424231_06",0) 	----......
	SetFlag(OwnerID(),545097,1)
end

function LuaAS_424231_05()
	SetSpeakDetail(OwnerID(),"[SC_424231_08]") 	----我明白，我也想這樣
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_05]","LuaAS_424231_04",0) 	----對這種水性楊花的女人，你不該如此執著。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_09]","LuaAS_424231_06",0) 	----......
	SetFlag(OwnerID(),545097,1)
end

function LuaAS_424231_06()
	SetSpeakDetail(OwnerID(),"[SC_424231_10]") 	----特使大人，你或許是覺得我很傻
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_05]","LuaAS_424231_04",0) 	----對這種水性楊花的女人，你不該如此執著。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424231_07]","LuaAS_424231_05",0) 	----愛就是要包容他的一切，他都已經是你的妻子了。
	SetFlag(OwnerID(),545097,1)
end

------傳送
function LuaS_424213_GotoZone_15_start()
	if 	CheckAcceptQuest(OwnerID(),424213) == true		then
		SysCastSpellLv(OwnerID(),OwnerID(),495735,1)  	
		ChangeZone(OwnerID() , 15 , 0 , -3996.7 , 14.0 , 5048.0 , 255.3)
	end
end

function LuaS_424223_GotoZone_20_start()
	if 	CheckAcceptQuest(OwnerID(),424223) == true 	then
		SysCastSpellLv(OwnerID(),OwnerID(),495735,1)  
		ChangeZone(OwnerID() , 20 , 0 , -11860.0 , 778.6 , 42152.4 , 50.5)
	end
end

------424223 前往紅土丘陵
function LuaAS_424223_01()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),424223) == true 	and
		CountBodyItem(OwnerID(),209473) == 0 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424213_01]","LuaAS_424223_02",0)
	end
	if 	CheckAcceptQuest(OwnerID(),424214) == true 	and
		CountBodyItem(OwnerID(),209413) == 0 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424214_01]","LuaAS_424214_01")
	end
end

function LuaAS_424223_02()
	SetSpeakDetail(OwnerID(),"[SC_424223_01]")
	GiveBodyItem(OwnerID(),209473,1)
end

function LuaAS_424214_01()
	SetSpeakDetail(OwnerID(),"[SC_424214_02]")
	GiveBodyItem(OwnerID(),209413,1)
end