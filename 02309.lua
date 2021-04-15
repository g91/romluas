---------------------------------------------------------------------------
--424111  大嘴巴的冒險者
---------------------------------------------------------------------------
function LuaPG_424111_talktoJ()  ----跟小約翰說話
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_01]")       ----……不是我想嚇你……
		SetFlag(OwnerID() ,544879, 1 )
	elseif
	
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then   ----讓小約翰喝水
		SetSpeakDetail(OwnerID(),"[SC_424114_J]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_J_flag",0)   ----隨機做動作

	else
		LoadQuestOption( OwnerID() )

	end

end

function LuaPG_424111_talktoR()  ----跟勞斯說話
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_02]")       ----嘿，聽說了嗎？
		SetFlag(OwnerID() ,544882, 1 )

----讓勞斯喝水
	elseif
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then
		SetSpeakDetail(OwnerID(),"[SC_424114_R]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_R_flag",0)   ----隨機做動作
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaPG_424111_talktoL()  ----跟萊斯說話
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_03]")       ----昨天和我一起.......
		SetFlag(OwnerID() ,544881, 1 )

----讓萊斯喝水
	elseif
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then
		SetSpeakDetail(OwnerID(),"[SC_424114_L]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_L_flag",0)   ----隨機做動作
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaPG_424111_talktoD()  ----跟丹頓說話
	if (CheckAcceptQuest(OwnerID(),424111)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		SetSpeakDetail(OwnerID(),"[SC_424111_04]")       ----你怎麼不怕死的還留在這裡？
		SetFlag(OwnerID() ,544883, 1 )

----讓丹頓喝水
	elseif
	 (CheckAcceptQuest(OwnerID(),424114)==true )and( CountBodyItem( OwnerID(), 209267 )~=0) then
		SetSpeakDetail(OwnerID(),"[SC_424114_D]")
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424114_01]","LuaPG_424114_D_flag",0)   ----隨機做動作
	else
		LoadQuestOption( OwnerID() )
	end

end

function LuaPG_424111_01()  ----跟提爾海姆說話
----是否有跟大家講過話
	if CheckAcceptQuest(OwnerID(),424111)==true and CheckCompleteQuest( OwnerID() , 424111) == false  
	and  CheckFlag(OwnerID(),544879 )==true
	and  CheckFlag(OwnerID(),544881 )==true 
	and  CheckFlag(OwnerID(),544882 )==true
	and  CheckFlag(OwnerID(),544883 )==true  then
		SetSpeakDetail(OwnerID(),"[SC_424111_05]")       
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424111_06]","LuaPG_424111_03",0)  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424111_07]","LuaPG_424111_02",0)  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424111_08]","LuaPG_424111_03",0)  

	elseif
	 (CheckAcceptQuest(OwnerID(),424118)==true )and( CheckCompleteQuest( OwnerID() , 424111) == false) then
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)

	else
		LoadQuestOption( OwnerID() )
	end

end

function LuaPG_424111_02()
	CloseSpeak( OwnerID())
	SetFlag(OwnerID() ,544880, 1 )
	LoadQuestOption( OwnerID() )
end

function LuaPG_424111_03()
	SetSpeakDetail(OwnerID(),"[SC_424111_09]")
end

---------------------------------------------------------------------------
--424114  連名字都忘記吧！
---------------------------------------------------------------------------
function LuaPG_424114_01()  ----檢查是否有東西
	if  CountBodyItem( TargetID(), 209267 )~=4 then
	
	repeat	
		GiveBodyitem( TargetID(), 209267, 1 )
	until CountBodyItem( TargetID(), 209267 )==4
	
	end
end

function LuaPG_424114_J_flag()  ----給小約翰的flag
	CloseSpeak( OwnerID())  ----關掉對話

	if	CheckFlag(OwnerID(),544884)==false	then	
		DelBodyItem( OwnerID(), 209267, 1 )   ----損失一個遺忘之水
		SetFlag(OwnerID() ,544884, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )	
	end
end

function LuaPG_424114_R_flag()  ----給勞斯的flag
	CloseSpeak( OwnerID())  ----關掉對話

	if	CheckFlag(OwnerID(),544885)==false	then
		DelBodyItem( OwnerID(), 209267, 1 )   ----損失一個遺忘之水
		SetFlag(OwnerID() ,544885, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )
	end
end

function LuaPG_424114_L_flag()  ----給萊斯的flag
	CloseSpeak( OwnerID())  ----關掉對話

	if	CheckFlag(OwnerID(),544886)==false	then
		DelBodyItem( OwnerID(), 209267, 1 )   ----損失一個遺忘之水
		SetFlag(OwnerID() ,544886, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )
	end
end

function LuaPG_424114_D_flag()  ----給丹頓的flag
	CloseSpeak( OwnerID())  ----關掉對話

	if	CheckFlag(OwnerID(),544887)==false	then
		DelBodyItem( OwnerID(), 209267, 1 )   ----損失一個遺忘之水
		SetFlag(OwnerID() ,544887, 1 )	
		CallPlot(OwnerID() , "LuaPG_424114_02", TargetID() )
	end
end

function LuaPG_424114_02(Target)  ----喝水後做的動作	
	PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_DRINK)    ----喝水
	Sleep(15)
	PlayMotion(Target,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)    ----搖頭
	Sleep(10)
	local X=Rand(3)+1
	local talktable={"[SC_424114_02]","[SC_424114_03]","[SC_424114_04]"}
	Say(Target, talktable[X] )   ----隨機說傻話
end

---------------------------------------------------------------------------
--424123  隱身求全
---------------------------------------------------------------------------
----結束後的演戲
function LuaPG_424123_after_acting()
	local NPC = OwnerID()
	local player = TargetID()
	local NUM = ReadRoleValue(NPC,EM_RoleValue_Register1)

	if NUM == 0 then
		CallPlot(NPC , "LuaPG_424123_after_acting_01" , NPC , player)	
	else
		LoadQuestOption(player)
	end
end

function LuaPG_424123_after_acting_01()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,999) --開始演出的標記
	CloseSpeak(TargetID()) --面板消失

----轉向某flag
	FA_FaceFlagEX(OwnerID(), 780914 , 1)
	WriteRoleValue(OwnerID()  ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveToFlag( OwnerID() , 780914,1,0 ,1) --這是迴圈  到了才跑下一行


----演戲
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)  ----工作中

----ScriptMessage：諾瑞亞圖賀開始製作藥劑
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_424123_AFTER_ACTING]",  "0xffbf0b2b"  )
----SAY(TargetID(),"00")
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_424123_AFTER_ACTING]",  "0xffbf0b2b"  )  
	
	Sleep(40)

	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_NORMAL )	-- 改變預設動作 一般
	WriteRoleValue(OwnerID()  ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveToFlag( OwnerID() , 780914,2,0 ,1)	

	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0) --結束演出的標記
end

---------------------------------------------------------------------------
--424124  羅貝斯特的魔物
---------------------------------------------------------------------------
----獲得物品
----到範圍後才能使用的範圍劇情
function LuaPG_424124_medicine_use()   ----這個範圍才可使用物品
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
	local CheckOver = false   ----判斷關上
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==117935    then   ----用隱形怪117935為基準點
			CheckOver = true    ----打開判斷
			break
		end
	end
	if	CheckOver == true	then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424124_MEDICINE_USE]", C_Red )
		return false
	end
end

function LuaPG_424124_medicine_range()
	AddBuff(OwnerID(),509330,1,30)     ----加上buff，隱身
	BeginPlot(OwnerID(),"LuaPG_424124_placelimit",0)
end




----考古包搜尋
function LuaPG_424124_Archaeology()	
	local ttable = {}  --創出一個table裝要search的npc
 	ttable = SearchRangeNPC ( OwnerID() , 100 )  --search週圍100內的所有npc
	local NUM=table.getn(ttable)
	for i=0 , NUM-1 do
		local X =ReadRoleValue(ttable[i],EM_RoleValue_OrgID) 
		if X == 117880 and CountbodyItem( OwnerID(), 209390 )==0 then
		SetModeEx(ttable[i],EM_SetModeType_Mark,TRUE)
		elseif X == 117933 and CountbodyItem( OwnerID(), 209390 )==0 then
		SetModeEx(ttable[i],EM_SetModeType_Mark,TRUE)
		end
	end
end


----點擊後回傳scriptm和return1
function LuaPG_424124_wrong_target()	
	if (CheckAcceptQuest(OwnerID(),424124)==true )and( CheckCompleteQuest( OwnerID() , 424124) == false) 
	and	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==117933	then
		ScriptMessage( TargetID(), OwnerID(), 1, "[SC_424124_WRONG_TARGET]",  "0xffbf0b2b"  )
		ScriptMessage( TargetID(), OwnerID(), 0, "[SC_424124_WRONG_TARGET]",  "0xffbf0b2b"  )  
	end
	return 1  ----避免點擊物件後是紅色條
end


function LuaPG_424124_placelimit()
	for i=1, 90 ,1 do
		if	DW_CheckMap(OwnerID(),419)==false	then	--限制玩家在羅貝斯特，離開就消失
			Cancelbuff( OwnerID(), 509330 )
			break
		end
		Sleep(10)
	end
end


---------------------------------------------------------------------------
--424127  洞穴裡的研究團
---------------------------------------------------------------------------
function LuaPG_424127_decided_location()
	if CheckAcceptQuest(OwnerID(),424127)==true and CheckCompleteQuest( OwnerID() , 424127) == false   then
		SetSpeakDetail(OwnerID(),"[SC_424127_DECIDED_LOCATION]")       
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424127_DECIDED_LOCATION_01]","LuaPG_424127_change_location_before",0)  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424127_DECIDED_LOCATION_02]","LuaPG_424127_02",0)  

	else
		LoadQuestOption( OwnerID() )
	end

end


function LuaPG_424127_02()
	SetSpeakDetail(OwnerID(),"[SC_424127_DECIDED_LOCATION_03]")      
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424127_DECIDED_LOCATION_01]","LuaPG_424127_change_location_before",0)  
end



function LuaPG_424127_change_location_before()   ----特效和傳送
	CloseSpeak(OwnerID()) --面板消失
	BeginPlot(TargetID(),"LuaPG_424127_change_location_before_01",0)
end

function LuaPG_424127_change_location_before_01()  
	local player=TargetID()

	Sleep(10)
	Say(OwnerID(),"[SC_424127_CHANGE_LOCATION_BEFORE]")
	Sleep(15)
	Say(OwnerID(),"[SC_424127_CHANGE_BEFORE_01]")
	Sleep(15)

	ChangeZone( TargetID() , 14 , 0 , 13481.8, -3.0 , 11560.0 , 4.6 )  ----傳送到洞穴口
	 --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	SetFlag(TargetID() ,544904, 1 )	
	
end


---------------------------------------------------------------------------
--424128  秘密的人體實驗場
---------------------------------------------------------------------------
function LuaPG_424128_talking_with_Mimir_01()      
	if CheckAcceptQuest(OwnerID(),424128)==true and CheckFlag( OwnerID(), 544903 ) == false   then
		SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_01]")       ----問吧，能說的我就會告訴你
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_01]","LuaPG_424128_talking_with_Mimir_02",0)    ----這個洞穴裡發生的事
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_02]","LuaPG_424128_talking_with_Mimir_03",0)   ----為什麼要在洞穴裡

	else
		LoadQuestOption( OwnerID() )
	end

end


function LuaPG_424128_talking_with_Mimir_02()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_02]")       ----要說這個洞穴，就得從拉索斐亞的村民們身上開頭。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_02]","LuaPG_424128_talking_with_Mimir_03",0)    ----為什麼要在洞穴裡
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_04]","LuaPG_424128_talking_with_Mimir_04",0)   ----你們的研究進度？
end


function LuaPG_424128_talking_with_Mimir_03()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_03]")       ----呵呵呵～這個洞穴，當然是隱藏我們做的實驗啦
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_01]","LuaPG_424128_talking_with_Mimir_02",0)    ----這個洞穴裡發生的事
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_04]","LuaPG_424128_talking_with_Mimir_04",0)   ----你們的研究進度？  
end


function LuaPG_424128_talking_with_Mimir_04()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_04]")       ----呵呵～真高興，你對研究有興趣啊？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424128_CHOICE_05]","LuaPG_424128_talking_with_Mimir_05",0)    ----為什麼會這樣？
end


function LuaPG_424128_talking_with_Mimir_05()     
	SetSpeakDetail(OwnerID(),"[SC_424128_SPEAK_05]")       ----嗯～這我可不敢跟你下定論。
	SetFlag(OwnerID() ,544903, 1 )	
end


---------------------------------------------------------------------------
--424129  專業各不同
---------------------------------------------------------------------------
----Gill身上的範圍劇情
function LuaPG_424129_Gill_range_01() 
	SetPlot( OwnerID(),"range","LuaPG_424129_Gill_range_02",60 )  ----範圍劇情開始
end


function LuaPG_424129_Gill_range_02()
	if	CheckAcceptQuest(OwnerID(),424129)==true	and    CheckCompleteQuest(OwnerID(),424129)==false   then
		SetFlag(OwnerID(),544936,1)
	end
end


---------------------------------------------------------------------------
--424130  換人試試看
---------------------------------------------------------------------------
----接受任務，Gill回去找米彌兒的表演劇情，780914第3、4隻貓
function LuaQ_PG_424130_Gill_Accept() 
	SetFlag(TargetID(),544956,1)----給演戲用flag
	local player=TargetID()
	local NPC=OwnerID()
	
	if	ReadRoleValue(NPC,EM_RoleValue_Register1)==0	then  --檢查 EM_RoleValue_Register1
		CallPlot(NPC , "LuaQ_PG_424130_Gill_Accept_02", player,NPC )  
	end	
end


function LuaQ_PG_424130_Gill_Accept_02(player,NPC)
	
	local Gill=DW_CreateObjEX("obj",117945,NPC)   ----演戲用吉爾，生於原位

	WriteRoleValue(Gill,EM_RoleValue_Register1,999) --開始演出的標記

	Say(Gill,"[SC_424130_01]")
	DW_MoveToFlag( Gill , 780914 ,4,0 ,1) --這是迴圈  到了才跑下一行

	DelObj(Gill) --刪除

	SetFlag(player,544956,0)----關掉演戲用flag
	WriteRoleValue(Gill,EM_RoleValue_Register1,0) --結束演出的標記
end


---------------------------------------------------------------------------
--424125  格列佛的遺願
---------------------------------------------------------------------------
function LuaPG_424125_Tip()
	SetPlot(OwnerID(),"range","LuaPG_424125_Tip_01",600)
end

function LuaPG_424125_Tip_01()	
	if	CheckCompleteQuest( OwnerID() , 424124) == true	and	CheckAcceptQuest(OwnerID(),424126)==false	
		and	CheckFlag(OwnerID(),545023 )==false	then	
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424125_TIP]",  "0xffbf0b2b"  )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_424125_TIP]",  "0xffbf0b2b"  )
	end
end

--function LuaPG_424125_Complete()
--	SetFlag(TargetID(),545023,1)
--end

--function LuaPG_117881_dead()
--	if	CheckFlag(OwnerID() , 545023) == true	then
--		SetSpeakDetail(OwnerID(),"[SC_424125_COMPLETE]") 
--	else
--		LoadQuestOption(OwnerID())
--	end
--end