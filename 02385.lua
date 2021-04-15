--------------------------------------------------------------------------------------------------
function LuaS_dr424293_01()								--救命如救火！選項
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckAcceptQuest( own,  424293 )==true then
			AddSpeakOption(own,tar,"[SC_424293_03]","LuaS_dr424293_02",0)
		elseif
		  CheckAcceptQuest(own,424294)==true and
	 	  CheckCompleteQuest(own,424302)==true and
		  CountBodyItem(own,240247)==0 and
		  CountBodyItem(own,240222)==0 then
		 	 AddSpeakOption(own,obj,"[SC_424422_0]","LuaQ_drcheckbag_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr424293_02()	  							--喘口氣
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424293_01_1]" )
	AddSpeakOption(own,tar,"[SC_424293_01]","LuaS_dr424293_02_1",0)
end


function LuaS_dr424293_02_1()	  						--所以大舉出兵這件事是真的？
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424293_02_1]" )
	AddSpeakOption(own,tar,"[SC_424293_02]","LuaS_dr424293_02_2",0)
end

function LuaS_dr424293_02_2() 	 						--所以說你主人常跟矮人接觸？
	local own = OwnerID()
	SetSpeakDetail( own, "[SC_424293_03_1]" )
	GiveBodyItem( own, 545079, 1 )
end


function LuaQ_drcheckbag_1()							--玩家丟了加美美酒後，可再給藥粉
	local own= OwnerID()
	SetSpeakDetail(own,"[SC_424422_1]")
	GiveBodyItem(own,240222,1)
end
--------------------------------------------------------------------------------------------------

function LuaS_118480_0() 								--信箱
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]", "LuaS_118480_1", 0 ) --/*開啟信箱
end

function LuaS_118480_1()
	CloseSpeak( OwnerID() )
	MyOpenMail()	
end

--------------------------------------------------------------------------------------------------

function LuaQ_dr424294_0()								--檢查有無烈酒
	local own=OwnerID()
	if CountBodyItem(own,240212)>0 then
		return true
	else
	ScriptMessage(own, own, 2 ,"[SC_424294_01]" , 1)
		return false
	end
end	

function LuaQ_dr424294_1()	--刪除一般烈酒給加味的
	local own=OwnerID()
	DelBodyItem(own,240212,1)
	GiveBodyItem(own,240247,1)
end

--------------------------------------------------------------------------------------------------

function LuaQ_dr424294_2()								--守衛有酒才有此選項
	local own= OwnerID()
	local obj=TargetID()
	LoadQuestOption(own)
	if CountBodyItem(own,240247)>0 then
		AddSpeakOption(own,obj,"[SC_424294_2]","LuaQ_dr424294_2_1",0)
	else
	LoadQuestOption(own)
	end
end

function LuaQ_dr424294_2_1()
	local own=OwnerID()
	local obj=TargetID()
	PlayMotion(obj,118)
	sleep(50)
	Say(obj,"[SC_424294_2_1]")
	sleep(50)
	addbuff(obj,620026,0,120)
	addbuff(own,620027,0,120)
	DisableQuest( obj , true ) 
	sleep(50)
	PlayMotionEX(obj,9,10)
	CloseSpeak(own)
	BeginPlot(obj,"LuaQ_dr424294_2_2",0)
end

function LuaQ_dr424294_2_2()
	local own = OwnerID()
	Sleep(1200)
	DisableQuest( own , false ) 
	PlayMotion(own,0)
end

-----------------------------------------------------------
function LuaS_dr118685()										--副團長常駐台詞
	while 1 do
		Sleep(200)
		npcSay(OwnerID(),"[SC_118687_1]")
		Sleep(200)
		npcSay(OwnerID(),"[SC_118687_2]")
		Sleep(200)
		npcSay(OwnerID(),"[SC_118687_3]")
	end
end
-----------------------------------------------------------

function LuaS_dr424304_0()								
	local own =OwnerID()
	local obj = TargetID()
		LoadQuestOption(own)
		if CheckCompleteQuest(own,424304)==true and CheckCompleteQuest(own,424305)==false then
			AddSpeakOption(own,obj,"[SC_424304_1]","LuaS_dr424304_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr424304_1()
	local own =OwnerID()
	SetSpeakDetail(own,"[SC_424304_2]")
	GiveBodyItem(own,545082,1)
	AddBuff(own,620113,1,10)
	BeginPlot(own,"LuaQ_dr424304_drama01",0)
end

function LuaQ_dr424304_drama01()
		local Cmonster =Lua_DW_CreateObj( "flag" ,118481,  780950  , 0 , 1 , 1 )
		DW_MoveDirectToFlag( Cmonster ,  780950  , 1 , 1  )
		say(Cmonster,"[SC_424304_2]")
		sleep(50)
		DelObj(Cmonster)
end

function LuaS_dr118482_0()										--外面
	local own =OwnerID()
	local obj = TargetID()
		LoadQuestOption(own)
		if CheckCompleteQuest(own,424304)==true  then
			AddSpeakOption(own,obj,"[SC_118482_1]","LuaS_dr118482_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr118482_1()
	local own =OwnerID()
	SetSpeakDetail(own,"[SC_118482_2]")
	if	CountBodyItem(own,545084)>=1 then
	DelBodyItem(own,545084,1)
	else
	GiveBodyItem(own,545083,1)
	AddSpeakOption(own,obj,"[SC_118482_3]","LuaS_dr118482_2",0)
	end
end

function LuaS_dr118482_2()
	SetPos(OwnerID(),-11510,442,36729,256)
end

-----------------------------------------------------------
function LuaQ_drgoout_0()						--傳出來
	SetPlot(OwnerID(),"range","LuaQ_drgoout_1",35)
end

function LuaQ_drgoout_1()
	SetPos(OwnerID(),-9177,486,36731,273)
end
-------------------------------------------------------------

function LuaS_dr118315_01()						
	local own = OwnerID()
	LoadQuestOption(own)
end


-------------------------------------------------------------喀洛恩居民的對話-------------------------------------------------------------
function LuaS_drresident_1()
	while 1 do
		Sleep(100)
		npcsay(OwnerID(),"[SC_RESIDENT_01]")		--我身後的礦石只要一袋麥粉就全是你的了！
		sleep(100)
		npcsay(OwnerID(),"[SC_RESIDENT_02]")		--好心的人阿，幫幫忙吧，家裡人餓好幾天了！
		Sleep(100)
	end
end


function LuaS_drresident_2()
	while 1 do
		Sleep(120)
		npcsay(OwnerID(),"[SC_RESIDENT_03]")		--這些礦石全都是開挖掘到的[208234]！幫幫忙只要一袋麥粉就好！
		sleep(80)
		npcsay(OwnerID(),"[SC_RESIDENT_04]")		--幫個忙吧，小孩子餓不得阿！
		Sleep(100)
	end
end

function LuaS_drresident_3()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_05]")		--媽媽每次跟阿姨們聊天就沒完沒了！
end
function LuaS_drresident_4()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_06]")		--媽媽！肚字餓了！
end

function LuaS_drresident_5()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_07]")		--噬骨者幼獸藏老鼠，雌噬骨者藏庫蘭奇～嚕嚕嚕...
end

function LuaS_drresident_6()
		sleep(50)
		npcsay(OwnerID(),"[SC_RESIDENT_08]")		--她好厲害...唱歌真好聽...我也要像她一樣...
end

function LuaS_drresident_7()
		npcsay(OwnerID(),"[SC_RESIDENT_09]")		--宣～亡～者～不許動！你們再賴皮！以後不跟你們玩了！
end

function LuaS_drresident_8()
		npcsay(OwnerID(),"[SC_RESIDENT_10]")		--嘻嘻！別管她，只要別當[105668]就好！
end

function LuaS_drresident_9()
		npcsay(OwnerID(),"[SC_RESIDENT_11]")		--嘻嘻！
end

function LuaS_drresident_10()
		npcsay(OwnerID(),"[SC_RESIDENT_12]")		--來看看阿！全城最好的東西都在這阿！
end

function LuaS_drresident_11()
		npcsay(OwnerID(),"[SC_RESIDENT_13]")		--聽說你家女兒加入了喀洛恩騎士團阿？
		sleep(40)
		npcsay(OwnerID(),"[SC_RESIDENT_15]")		--你說說嗎？是不是阿？
end

function LuaS_drresident_12()
		npcsay(OwnerID(),"[SC_RESIDENT_14]")		--真是厲害阿！聽說[118312]大人還沒結婚，不會是因為[118312]大人，你女兒才加入的吧？
end

function LuaS_drresident_13()
		npcsay(OwnerID(),"[SC_RESIDENT_16]")		--胡說！我...我女兒，才不是因為[118312]大人才加入喀洛恩騎士團的！
end

function LuaS_drresident_14()
		npcsay(OwnerID(),"[SC_RESIDENT_17]")		--我們是撼地王的後裔！
end

function LuaS_drresident_15()
		npcsay(OwnerID(),"[SC_RESIDENT_18]")			--拜託！有沒有人能聽到我的聲音？
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaQ_dr118733_01()							 --給箱子的男孩
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424305)==true 
	and CountBodyItem(O_ID,240291)==0 then
		AddSpeakOption(O_ID,T_ID,"[SC_118733_01]","LuaQ_dr118733_02",0)   	--這些不要的箱子，可以給我嗎？
	else
		LoadQuestOption(O_ID)
	end
end

function LuaQ_dr118733_02()
	local O_ID=OwnerID()
	SetSpeakDetail(O_ID,"[SC_118733_02]")					--真的嗎？你真是幫了我一個大忙！這下不用擔心被媽媽打屁股了！
	GiveBodyItem(O_ID,240291,3)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaS_dr118485_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424305)==true then
	AddSpeakOption(O_ID,T_ID,"[SC_118485_01]","LuaS_dr118485_02",0)   	 --想詢問...[105782]。
	AddSpeakOption(O_ID,T_ID,"[SC_118485_02]","LuaS_dr118485_03",0)  	 --想詢問...[105783]。
	AddSpeakOption(O_ID,T_ID,"[SC_118485_03]","LuaS_dr118485_04",0)   	 --想詢問...[105784]。
	else
	LoadQuestOption(O_ID)
	end
end

function LuaS_dr118485_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_04]")				--[105782]，藏身於前城區，土環內，虛幻身形，讓你不易察覺。
end

function LuaS_dr118485_03()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_05]")				--[105783]，藏身於此屋外的高台上，此高台無墊腳物難登上，[118733]似乎能幫上忙。
end

function LuaS_dr118485_04()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_06]")				--[105784]，善設庇護法陣，藏身於後城區，木工旁，火把全部熄滅才能傷害他。
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaQ_118714_00()							--波拉提斯給包包
	LoadQuestOption(OwnerID())
		if CheckAcceptQuest(OwnerID(),424399)==true and
		   CheckCompleteQuest(OwnerID(),424400)==true and
		   CountBodyItem(OwnerID(),240289)==0 then
		   AddSpeakOption(OwnerID(),TargetID(),"[SC_118714_0]","LuaQ_118714_01",0)	
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaQ_118714_01()
	SetSpeakDetail(OwnerID(),"[SC_118714_1]")
	GiveBodyItem(OwnerID(),240289,1)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------