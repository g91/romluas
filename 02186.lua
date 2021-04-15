----清除威脅、縫補口袋破洞
function LuaS_423732_01()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西	
	if	CheckAcceptQuest(OwnerID(),423732) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_02]","LuaS_423732_02",0)	----(詢問關於口袋。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_04]","LuaS_423732_03",0)	----(詢問關於傭兵。)
	end

end

function LuaS_423732_02()
	SetSpeakDetail(OwnerID(),"[SC_423730_03]")	----如果商人賺大錢，口袋就會變大！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_04]","LuaS_423732_03",0)	----(詢問關於傭兵。)
end

function LuaS_423732_03()
	SetSpeakDetail(OwnerID(),"[SC_423730_05]")	----哼，哼！這些可惡的人類傭兵，欺騙善良的商人說自己武藝高強，讓善良的商人花大錢雇用他們，結果他們還不是被怪物打得落花流水了啊！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423730_02]","LuaS_423732_02",0)	----(詢問關於口袋。)
end


----提供協助
function LuaS_423724_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423724) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_01]","LuaS_423724_02",0)	----(詢問為什麼需要消毒草。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_03]","LuaS_423724_03",0)	----(詢問去哪裡找消毒草。)
	end
end

function LuaS_423724_02()
	SetSpeakDetail(OwnerID(),"[SC_423724_02]")	----你應該能看到我有很多弟兄都受傷了吧？不趕緊穩定他們的傷勢，如果開始發燒就糟了！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_03]","LuaS_423724_03",0)	----(詢問去哪裡找消毒草。)
end

function LuaS_423724_03()
	SetSpeakDetail(OwnerID(),"[SC_423724_04]")	----[ZONE_QUIET_HOWL_PLAINS]上到處都有，只是附近往往有怪物等著我們，否則我早就去採回來給弟兄們治傷了！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423724_01]","LuaS_423724_02",0)	----(詢問為什麼需要消毒草。)
end

----母親的紀念物
function LuaS_423712_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423712) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423712_01]","LuaS_423712_02",0)	----(詢問事情經過。)
	end
end

function LuaS_423712_02()
	SetSpeakDetail(OwnerID(),"[SC_423712_02]")	----媽媽去工作之前，把爸爸給她的項鍊送給我，說我想媽媽的時候可以拿出來戴。我戴著項鍊出門玩，結果賴恩看到後就把它搶走了，還藏起來。......
end


----項鍊埋藏處
function LuaS_423713_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423713) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_01]","LuaS_423713_02",0)	----(詢問他把[116987]的項鍊藏去哪裡？)
	end
end

function LuaS_423713_02()
	SetSpeakDetail(OwnerID(),"[SC_423713_02]")	----(他一臉不在乎的樣子)什麼項鍊啊？本大爺聽都沒聽過。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_03]","LuaS_423713_03",0)	----([116987]說你把她的項鍊拿走了。)
end

function LuaS_423713_03()
	SetSpeakDetail(OwnerID(),"[SC_423713_04]")	----(他雙手環胸，把頭抬地高高的，臉別向一旁)那個沒有爸爸的傢伙，本大爺才懶得動她的東西。我沒有藏項鍊，沒有就是沒有！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_05]","LuaS_423713_04",0)	----(...你再不說，我就要[116569]把你抓走！)
end

function LuaS_423713_04()
	SetSpeakDetail(OwnerID(),"[SC_423713_06]")	----(賴恩一聽臉色瞬間轉為害怕，放聲大哭)嗚哇...！我不要被抓走...！我不要被[116569]抓走啦...！好可怕喔...媽媽...媽媽...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423713_07]","LuaS_423713_05",0)	----(那快告訴我，[116987]的項鍊你藏去哪？)
end

function LuaS_423713_05()
	SetSpeakDetail(OwnerID(),"[SC_423713_08]")	----嗚嗚...我忘記了啦...我只記得我在村子外面隨便找了一棵樹下，挖了洞就埋進去了...哪棵樹我不知道了啦...不要讓我被[116569]抓走啦...嗚哇...
end


----替伊芙報仇
function LuaS_423715_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423715) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423715_02]","LuaS_423715_02",0)	----(請妳冷靜，我能理解妳的心情，但是妳已經...)
	end
end

function LuaS_423715_02()
	SetSpeakDetail(OwnerID(),"[SC_423715_03]")
end


----健康飲食
function LuaS_423722_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423722) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423722_01]","LuaS_423722_02",0)	----(詢問收集食物的原因。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423722_03]","LuaS_423722_03",0)	----(詢問收集的地點。)
	end
end

function LuaS_423722_02()
	SetSpeakDetail(OwnerID(),"[SC_423722_02]")	----我想離開這個牢籠，但是以我的身體狀況，根本無法穿越警衛的巡邏網，回到[ZONE_CAMPBELL_TOWNSHIP]。......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423722_03]","LuaS_423722_03",0)	----(詢問收集的地點。)
end

function LuaS_423722_03()
	SetSpeakDetail(OwnerID(),"[SC_423722_04]")	----在[ZONE_QUIET_HOWL_PLAINS]有充沛的食物來源，你到那裡採摘十株[208547]，在往[ZONE_MYZENA_CITY]的路上狩獵五塊[208548]回來給我就好了。
	AddSpeakOption(OwnerID().TargetID(),"[SC_423722_01]","LuaS_423722_02",0)	----(詢問收集食物的原因。)
end


----頂尖的表演者們

------團長部分
function LuaS_423740_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423740) == true 	then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_02",0)	----(詢問頂尖表演者。)
	end
end

function LuaS_423740_02()
	SetSpeakDetail(OwnerID(),"[SC_423740_02]")	----他們是在各項節目中表演技藝精湛的表演者，比起一般的表演者，更能勝任各項複雜、高難度的演出，是本團的驕傲。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_03]","LuaS_423740_03",0)	----(詢問頂尖表演者的演出時段。)
end

function LuaS_423740_03()
	SetSpeakDetail(OwnerID(),"[SC_423740_04]")	----本團最引以為傲的表演者們平時是不會在馬戲團內參與表演節目的，只有在特殊時節、或者他們本人要求時才有機會看到他們精采的演出。
	SetFlag(OwnerID(),544651,1)
end

------觀眾部分
function LuaS_423740_04()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423740) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_05",0)	----(詢問頂尖表演者。)
	end
end

function LuaS_423740_05()
	SetSpeakDetail(OwnerID(),"[SC_423740_05]")	----他們的表演真得很精采！我看了一次雜耍師「凱厄斯」的表演後，就成為了馬戲團的忠實觀眾！......
	SetFlag(OwnerID(),544652,1)
end

function LuaS_423740_06()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_07",0)	----(詢問頂尖表演者。)
end

function LuaS_423740_07()
	SetSpeakDetail(OwnerID(),"[SC_423740_06]")	----每一位的節目都很棒，但我最愛的還是魔術師「黑帽」的表演。......
end

function LuaS_423740_08()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_01]","LuaS_423740_09",0)	----(詢問頂尖表演者。)
end

function LuaS_423740_09()
	SetSpeakDetail(OwnerID(),"[SC_423740_07]")	----我們家族世代都很喜歡馬戲團的表演，尤其是那些佼佼者們的演出，總是讓我們大開眼界。
end

------亡魂部分
function LuaS_423740_10()
	if	CheckAcceptQuest(OwnerID(),423740) == true 	and
		CheckFlag(OwnerID(),544651)==true	and
		CheckFlag(OwnerID(),544652)==true	then
		SetSpeakDetail(OwnerID(),"[SC_423740_08]") 	----你有打聽到哪些事情嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_09]","LuaS_423740_11",0)	----(告訴他有關魔術師「黑帽」的事蹟。)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_11]","LuaS_423740_12",0)	----(告訴他有關雜耍師「凱厄斯」的事蹟。)
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_423740_11()
	SetSpeakDetail(OwnerID(),"[SC_423740_10]")	----我曾看過他的表演。那頂帽子似乎深不見底，好像不管什麼東西都可以從帽子裡跑出來，當他揮動斗篷時就有奇蹟發生。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_11]","LuaS_423740_12",0)	----(告訴他有關雜耍師「凱厄斯」的事蹟。)
end

function LuaS_423740_12()
	SetSpeakDetail(OwnerID(),"[SC_423740_12]")	----奇怪...好像有什麼畫面從腦中閃過...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_13]","LuaS_423740_13",0)	----(詢問亡魂的狀況。)
end

function LuaS_423740_13()
	SetSpeakDetail(OwnerID(),"[SC_423740_14]")	----我剛剛腦中閃過凱厄斯站在我面前，拿著飛刀露出邪笑的畫面，不知為何記憶中的我覺得非常害怕......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423740_15]","LuaS_423740_15",0)	----(你還好嗎？)
end

function LuaS_423740_15()
	local Obj = OwnerID()
	SetSpeakDetail(Obj,"[SC_423740_16]")	----...我想我...已經想起我死亡的過程了。......
	AddSpeakOption(Obj,Obj,"[SC_423740_17]","LuaS_423740_16", 0 )
end

function LuaS_423740_16()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
end

----有心無力
function LuaS_423727_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423727) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423727_01]","LuaS_423727_02",0)	----(詢問無力的原因。)
	end
end

function LuaS_423727_02()
	SetSpeakDetail(OwnerID(),"[SC_423727_02]")	----最近這幾年有時會覺得身體特別累，以為是生了病，結果醫生卻說我身體好得很。......
end

----要抓活的
function LuaS_423736_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423736) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423736_01]","LuaS_423736_02",0)	----(引起他的注意。)
	end
end

function LuaS_423736_02()
	SetSpeakDetail(OwnerID(),"[SC_423736_02]")	----嘿！你在......喔，原來是你啊！聽著，我很感激你幫我的忙，但是你可以不要打擾我的研究嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423736_03]","LuaS_423736_03",0)	----(詢問他的研究內容。)
end

function LuaS_423736_03()
	SetSpeakDetail(OwnerID(),"[SC_423736_04]")	----我在......呃，其實我不太想詳細解釋給你聽，因為我覺得講完天就黑了。總之，我在分析為什麼這些傢伙死後又會爬起來！聽起來就很厲害對吧？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423736_05]","LuaS_423736_04",0)	----(詢問是否有進展。)
end

function LuaS_423736_04()
	SetSpeakDetail(OwnerID(),"[SC_423736_06]") 	----我是很懷疑你是否真的能理解......
end


----頂級的馬戲團
function LuaS_423756_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423756) == true 		and
		CheckCompleteQuest(OwnerID(),423756) == false	and
		(CountBodyItem(OwnerID(),208557)) < 1			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423756_01]","LuaS_423756_02",0) 	----(我把貨物弄丟了......)
	end
end

function LuaS_423756_02()
	SetSpeakDetail(OwnerID(),"[SC_423756_02]")  	----弄丟了？真拿你沒辦法......
	GiveBodyItem(OwnerID(),208557,1)
end

----救人要緊、有效的解毒方法
function LuaS_423718_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423718) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423718_01]","LuaS_423718_02",0) 	----(詢問為什麼需要藥草。)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423718_03]","LuaS_423718_03",0) 	----(詢問哪裡可以找到解毒草。)
	end
	if	CheckAcceptQuest(OwnerID(),423720) == true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423720_01]","LuaS_423720_02",0) 	----(詢問收集蜘蛛毒囊的理由。)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423720_03]","LuaS_423720_03",0) 	----(詢問蜘蛛毒囊的取得地點。)
	end
end

function LuaS_423718_02()
	SetSpeakDetail(OwnerID(),"[SC_423718_02]") 	----我們艾力克研究團在此處研究[ZONE_BLACK_MARSH_TEMPLE]，不幸在調查過程中，有許多人在[ZONE_LAKESIDE_CEMETERY]附近遭到[104861]的攻擊。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423718_03]","LuaS_423718_03",0) 	----(詢問哪裡可以找到解毒草。)
end

function LuaS_423718_03()
	SetSpeakDetail(OwnerID(),"[SC_423718_04]") 	----解毒草就生長在黑沼湖畔，並不是非常難找，麻煩的是那些在岸邊的鱷魚。
end

function LuaS_423720_02()
	SetSpeakDetail(OwnerID(),"[SC_423720_02]") 	----解毒草只能用來暫緩毒性發作，要清除身上的屍毒就必須另尋他法。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423720_03]","LuaS_423720_03",0) 	----(詢問蜘蛛毒囊的取得地點。)
end

function LuaS_423720_03()
	SetSpeakDetail(OwnerID(),"[SC_423720_04]") 	----[ZONE_BLACK_MARSH_TEMPLE]附近有許多[104704]，你從牠們身上就能取得毒囊，不過在收集的過程中要注意牠們的攻擊。
end

----跳舞
function LuaAS_Dance_01()
	While 1	do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE)
		Sleep(35)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_DANCE)
		Sleep(50)
	end
end

----受傷
Function LuaAS_Sleeping()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
	while 	1 	do
		NPCSAY(OwnerID(),"[SC_423724_05]")
		Sleep(150)
		NPCSAY(OwnerID(),"[SC_423724_06]")
		Sleep(150)
	end
end

function LuaAS_Sleeping_01()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
	while 	1 	do
		NPCSAY(OwnerID(),"[SC_423724_06]")
		Sleep(100)
		NPCSAY(OwnerID(),"[SC_423724_07]")
		Sleep(100)
	end
end

----鎮長

function LuaAS_423758_01()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_01]","LuaAS_423758_02",0) 	----(詢問坎貝爾小鎮的過去。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_03]","LuaAS_423758_03",0) 	----(詢問湖畔墓園。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_05]","LuaAS_423758_04",0) 	----(詢問月亮馬戲團。)
end

function LuaAS_423758_02()
	SetSpeakDetail(OwnerID(),"[SC_423758_02]") 	----曾經在這片土地上，奇怪的瘟疫橫行，不管是誰都對這情況束手無策，許多人寶貴的性命因此消逝，也造成了許多廢棄的村子。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_03]","LuaAS_423758_03",0) 	----(詢問湖畔墓園。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_05]","LuaAS_423758_04",0) 	----(詢問月亮馬戲團。)
end

function LuaAS_423758_03()
	local Obj = OwnerID()
	if	CheckCompleteQuest(Obj,423758)==true	then
		SetSpeakDetail(OwnerID(),"[SC_423758_07]")--完成任務後
	else
		SetSpeakDetail(OwnerID(),"[SC_423758_04]") 	----該座墓園是為了紀念在三百年多前，為了阻止瘟疫蔓延卻失敗，不幸病逝的克魯瑪．格拉夫少主而建。
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_01]","LuaAS_423758_02",0) 	----(詢問坎貝爾小鎮的過去。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_05]","LuaAS_423758_04",0) 	----(詢問月亮馬戲團。)
end

function LuaAS_423758_04()
	SetSpeakDetail(OwnerID(),"[SC_423758_06]") 	----月亮馬戲團由我們格拉夫古堡的赫爾．格拉夫領主所出資建立的常駐型馬戲團。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_01]","LuaAS_423758_02",0) 	----(詢問坎貝爾小鎮的過去。)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423758_03]","LuaAS_423758_03",0) 	----(詢問湖畔墓園。)
end