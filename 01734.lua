----------423049
-------------------對話選項
---function LuaS_423049()--
--	LoadQuestOption( OwnerID() )
--	if (CheckAcceptQuest(OwnerID(),423049)==true )and  (CheckFlag(OwnerID(),543726)==false )then
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_1]","LuaS_423049_1",0)----你有想到什麼好方法嗎？
--	end
---end
function LuaS_423049_1()
	SetSpeakDetail(OwnerID(),"[SC_423049_2]")---對了，我曾經從食物堆中找到幾瓶紅紅、藍藍的水！			
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_3]","LuaS_423049_2",0)---好吧！那藥水在哪？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_4]","LuaS_423049_3",0)----不~這實在是太冒險了。
end

function LuaS_423049_2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423049_4", 0)
end
function LuaS_423049_4()
	DisableQuest( OwnerID() , true )
	Yell( OwnerID()  , "[SC_423049_5]" , 3 )-----就放在箱子那邊。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID()  , "[SC_423049_6]" , 3 )-----你可以喝下紅紅的藥水。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	DisableQuest( OwnerID() , false )
end
function LuaS_423049_3()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423049_5", 0) 
end
function LuaS_423049_5()
	DisableQuest( OwnerID() , true )
	Yell( OwnerID()  , "[SC_423049_7]" , 3 )---你不信任我嗎？
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID()  , "[SC_423049_8]" , 3 )---書上說朋友必須互相信任……
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID()  , "[SC_423049_9]" , 3 )----你必須信任我……
----拋擲的動作
	PlayMotion( OwnerID() ,	ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	sleep(10)
	ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423049_10]", 0 )--[114613]拿起紅紅的藥水向你潑灑。
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423049_10]", 0 )--[114613]拿起紅紅的藥水向你潑灑。
	if (CheckID( TargetID() ) == true) and CheckBuff(TargetID(),505987)==false then
		AddBuff( TargetID(), 505987 , 1 , 13)----
	end
	DisableQuest( OwnerID() , false )
end

---藥水的劇情(1)當BUFF結束後  會給旗標
function LuaS_423049_6()----檢查地點。
	if	ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 209 then-----715
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423049_11]", 0 ) --(這個藥水發臭了，你無法使用。)你只能在XXXX使用！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423049_11]", 0 )
		return false
	end
	return true
end

function LuaS_423049_7()--偵測地點
	if	ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) ~= 209 then--------檢查限定某個區域---715
			if CheckBuff( OwnerID() , 505987)==true   then 
				CancelBuff( OwnerID() , 505987 )
			end
			if CheckBuff( OwnerID() ,505988)==true then 
				CancelBuff( OwnerID() , 505988 )
			end
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423049_12]", 0 ) --XXX的藥效飛快減弱。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423049_12]", 0 )
	end
end

function LuaS_423049_8()--給予旗標
		SetFlag( OwnerID() ,543726, 1 )
end



---------423050
----(1)掛在物件上面的初始劇情
function LuaI_423050()---初始劇情
--	local Num = DW_Rand(5)
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
	SetPlot( OwnerID() , "touch" , "LuaS_423050" , 10 )
end

function LuaS_423050()
	local LUA = {"LuaS_423050_1" , "LuaS_423050_2", "LuaS_423050_3", "LuaS_423050_4", "LuaS_423050_5"  }
	local PID = ReadRoleValue( 	TargetID() , EM_RoleValue_PID )
		if	(CheckAcceptQuest(OwnerID(),423050)==true) then
			BeginPlot( OwnerID(), LUA[PID], 0)
		else
			ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_423050_1]", 0 )---[114621]沒有傳來任何聲音。
			ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_423050_1]", 0 )---[114621]沒有傳來任何聲音。
		end
end

function LuaS_423050_1()--換顏色。
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_2]", "0xff67643f" )--稚嫩男聲：我就說廚房有老鼠了，你不信。那麼多的東西不斷的消失。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_2]",  "0xff67643f" )--稚嫩男聲：我就說廚房有老鼠了，你不信。那麼多的東西不斷的消失。
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_3]",  "0xff67643f"  )--低沉男聲：我怎麼可能相信，老鼠會識字?
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_3]",  "0xff67643f"  )--低沉男聲：我怎麼可能相信，老鼠會識字?
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_4]",  "0xff67643f"  )--低沉男聲：你還是趕緊告訴我，你把我珍藏的食譜藏到哪裡去了？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_4]",  "0xff67643f" )--低沉男聲：你還是趕緊告訴我，你把我珍藏的食譜藏到哪裡去了？
		sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_5]",  "0xff67643f" )--低沉男聲：那是我曾祖母流傳下的私房菜，珍貴得很，快還我。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_5]", "0xff67643f"  )--低沉男聲：那是我曾祖母流傳下的私房菜，珍貴得很，快還我。
		sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_6]", "0xff67643f" )--稚嫩男聲：我沒有藏你那啥鬼食譜，真的有老鼠。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_6]",  "0xff67643f" )--稚嫩男聲：我沒有藏你那啥鬼食譜，真的有老鼠。
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_7]", "0xff67643f" )--稚嫩男聲：所以我才在這裡擺放捕鼠夾，只是那夾子雖然夾起來，卻沒夾到那隻老鼠。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_7]",  "0xff67643f" )--稚嫩男聲：所以我才在這裡擺放捕鼠夾，只是那夾子雖然夾起來，卻沒夾到那隻老鼠。
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_8]", "0xff67643f"  )--低沉男聲：不要再為你的罪行狡辯了，趁著我心情還不壞，你最好快點將它交出來。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_8]",  "0xff67643f" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_9]", "0xff67643f"  )--稚嫩男聲：我真的沒有，真的是老鼠…
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_9]",  "0xff67643f"  )
	sleep(30)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end

function LuaS_423050_2()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_10]", "0xff008000")--甜美女聲：噢~好討厭喔！德瑞克，不是說好了在研究室裡不說這個嘛！
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_10]","0xff008000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_11]", "0xff008000" )--磁性男聲：小寶貝～你這麼的美，我怎麼能抵抗你的魅力。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_11]", "0xff008000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_12]", "0xff008000" )--磁性男聲：我說過如果你是[114368]，我願成為你的[114367]啊～
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_12]","0xff008000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_13]","0xff008000")--磁性男聲：為你滅掉一個領主國，也再所不遲啊……
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_13]", "0xff008000" )
	sleep(30)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end

function LuaS_423050_3()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_14]", "0xFFFFFF00" )--焦躁男聲：怎麼了？放不進去嗎？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_14]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_15]", "0xFFFFFF00")--怯懦男聲：嗯……這個姿勢有點難。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_15]", "0xFFFFFF00")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_16]","0xFFFFFF00" )--焦躁男聲：腿都張這麼開了，還放不進去？你到底會不會。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_16]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_17]", "0xFFFFFF00" )--怯懦男聲：真的有點難……張得還不夠開……
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_17]","0xFFFFFF00")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_18]", "0xFFFFFF00")--焦躁男聲：到底要張多開？氣死我了，換我來
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_18]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_19]", "0xFFFFFF00" )--焦躁男聲：嗯……塞不進去。是不是洞太小了。把它撐大一點。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_19]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_20]","0xFFFFFF00" )--怯懦男聲：嗯……不行了，這已經是極限了。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_20]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_21]", "0xFFFFFF00")--焦躁男聲：我不管，一定要做到。今天上面的人說想吃珍珠栗子雞！
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_21]", "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_22]", "0xFFFFFF00" )--焦躁男聲：你覺得現在我們跑去跟他說餡料塞不進去，他會怎樣對我們？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_22]", "0xFFFFFF00" )
	sleep(30)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end
function LuaS_423050_4()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_23]", "0xff8080ff")--憤怒男聲：你們這群廢物到底在做些什麼？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_23]", "0xff8080ff" )	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_24]","0xff8080ff")--[114621]傳來一陣吵雜的金屬的響音。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_24]", "0xff8080ff" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_25]","0xff8080ff")--憤怒男聲：我又輸了……這股力量太弱了！當初你們說什麼能讓我的力量加強，讓我打贏[114367]。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_25]","0xff8080ff" )	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_26]", "0xff8080ff")--憤怒男聲：我現在卻連個冒險者都打不過。你們真理之手到底在搞什麼？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_26]", "0xff8080ff" )	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_27]", "0xff8080ff" )--憤怒男聲：要資金、我給你們資金，說需要龍蛋，我就去搶龍蛋，現在呢？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_27]", "0xff8080ff")	
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_28]","0xff8080ff")--憤怒男聲：我警告你們，這一次，如果沒讓我的力量再度提升，接下來的懲處就不只這些了。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_28]", "0xff8080ff")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_29]", "0xff8080ff"  )--沉穩男聲：[103292]領主，要達到你理想的境界還需要一些時間，你必須配合我們，才能……
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_29]", "0xff8080ff")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_30]", "0xff8080ff")--憤怒男聲：閉嘴，我現在心情不是很好，如果不想死的話，就最好閉上你們的嘴，立刻準備讓我力量提升的工作。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_30]","0xff8080ff")
	sleep(30)
	if (CheckID( OwnerID() ) == true) then
		if (CheckFlag(OwnerID(),543727)==false ) then
			SetFlag( OwnerID() , 543727, 1 )
			SetFlag( OwnerID() , 543729, 1 )
		end
	end
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end
function LuaS_423050_5()
--	SetPlot(  OwnerID()  ,  "touch" , "LuaFunc_Obj_BUSY" , 40  )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_31]", "0xFFF00000" )--輕浮男聲：果然發怒了呢……
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_31]", "0xFFF00000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_32]", "0xFFF00000" )--戲謔男聲：離開時，我就再猜他會忍耐到什麼時候？果然一下子就爆發了～真有趣～
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_32]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_33]", "0xFFF00000" )--輕浮男聲：這下子，真理之手的人可難受了。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_33]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_34]", "0xFFF00000")--戲謔男聲：猴子總是比較衝動嘛～
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_34]", "0xFFF00000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_35]", "0xFFF00000")--戲謔男聲：[103292]或許永遠都不會想到他也有成為實驗體的一天，看著他的蠢樣子，就格外讓人愉悅。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_35]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_36]", "0xFFF00000" )--輕浮男聲：反正資金都已經到手，或許您該找個時候將[103292]幹掉。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_36]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_37]", "0xFFF00000")--戲謔男聲：還不必太急。對了，密拉索森林那邊怎麼樣了？
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_37]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_38]", "0xFFF00000")--輕浮男聲：真理之手的人已經開始進行大量的士兵改造的計畫。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_38]", "0xFFF00000" )
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_39]", "0xFFF00000")--戲謔男聲：哦～進度不錯！龍蛋、龍體還夠嗎？找個時間再去狩獵吧。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_39]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_40]", "0xFFF00000")--輕浮男聲：嗯～我知道了，我會再去尋找亞龍棲息地。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_40]", "0xFFF00000")
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423050_41]", "0xFFF00000" )--戲謔男聲：去吧！我也該去慰問慰問那些真理之手。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423050_41]", "0xFFF00000")
	if (CheckID( OwnerID() ) == true) then
		if (CheckFlag(OwnerID(),543728)==false ) then
			SetFlag( OwnerID() , 543728, 1 )
			SetFlag( OwnerID() , 543729, 1 )
		end
	end
	sleep(20)
--	SetPlot(  OwnerID()  ,  "touch" , "LuaS_423050" , 40  )
end



function LuaS_423050_6()	
	SetPlot( OwnerID(), "range","LuaS_423050_7", 150 )
end
function LuaS_423050_7()---103295
	if	CheckAcceptQuest(OwnerID(),423050)==true and CheckFlag( OwnerID(), 543762 )==false  then
		ScriptMessage(OwnerID() ,  OwnerID(),  1 , "[SC_423050_42]" , 0 )---前方傳來一陣陣女孩的啜氣聲。
		ScriptMessage( OwnerID() ,   OwnerID(), 0 , "[SC_423050_42]" , 0 )---
		SetFlag( OwnerID() , 543762, 1 )	
	end
end






----------------------------------------------------------------------------
----------------543730重要旗標  旗子用780466
function LuaS_423052_0()
    LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423052)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423052_1]","LuaS_423052_1",0)---我準備好了！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423052_2]","LuaS_423052_2",0)---等我一會兒！
	end
end

function LuaS_423052_1()	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423052_3", 0)
end

function LuaS_423052_3()
	DisableQuest( OwnerID() , true )
	Yell( OwnerID() , "[SC_423052_4]" , 3 )--在我帶你到達密拉索森林之前，請先閉上眼吧。
	SLEEP(30)
	Yell( OwnerID() , "[SC_423052_5]" , 3 )--不要害怕......
	SLEEP(20)
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID(), 505990 , 1 , 15)----上目盲的BUFF
		SetPosByFlag( TargetID(), 780466 , 0)
		SetFlag( TargetID() , 543730, 1 )
	end
	DisableQuest( OwnerID() , false )
end

function LuaS_423052_2()
	SetSpeakDetail(OwnerID(),"[SC_423052_6]")---好，我會在這等待你。等你準備好的時候再告訴我說。
end
------------------------------------------------------------------------------

function LuaS_423048_0()-----掛在物品SERVER端劇情...捕抓烏龜任務
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423048 ) == false or CountBodyItem( OwnerID() , 206806 ) >= 4 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if  OrgID ~= 103301 and OrgID ~= 103493 and OrgID ~= 103494 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_0]", 0 ); -----這個[206805]似乎只能對[103301]使用。
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_4]", 0 ); -----距離太過遙遠，無法使用[206805]。
			return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_1]", 0 ); ----[103301]極力掙扎中，你無法順利使用[206805]。
			return false
	end
		
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423048_6]" , 0 )
			return false
	end
	return true
end

function LuaS_423048_1()
	if GiveBodyItem( OwnerID() , 206806 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---正在使用的物品
	end
	Hide(TargetID())
---	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423048_2]", 0 ); -------你抓到[103301]了！
	DELOBJ(TargetID())
end



----範圍劇情  多個  一踏進去  就會出現 烏龜
---

function LuaS_423048_2()---隱形物件。
	SetPlot( OwnerID(), "range","LuaS_423048_3", 150 )
end
function LuaS_423048_3()---
	if	CheckAcceptQuest(OwnerID(),423048)==true and CountBodyItem( OwnerID() , 206806 ) < 4 then
		SetPlot(TargetID(), "range","", 0 )
		BeginPlot(TargetID(),"LuaS_423048_4",0)
	end
end

function LuaS_423048_4()
		local NPC={103301,103493,103494}---亂數生怪
		local KK = math.floor(DW_Rand( 100 )/33 ) +1--math.floor：取整數
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423048_7]" , 0 ) --你聽見了奇怪的聲音。
		sleep(20)
		local Obj = Role:new(TargetID() )
		local BaseX = Obj :X()		
		local BaseY = Obj :Y();		
		local BaseZ = Obj :Z();		
		local BaseDir = Obj:Dir();		
		local DD= CreateObj(NPC[KK], BaseX+50, BaseY, BaseZ+50, BaseDir, 1 )     		      
		AddToPartition( DD,0)    
		SetAttack( DD , TargetID() )          
--		BeginPlot(DD,"LuaQ_421177_Sui",0)
		SLEEP(600)
		SetPlot( OwnerID() , "range","LuaS_423048_3", 150 )
end