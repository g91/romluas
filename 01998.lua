--主線1

------任務423518挑釁的原因----
function LuaS_423518()	--掛在黑洛卡身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423518 ) == true  and	checkFlag( OwnerID() , 544360 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423518_1]", "LuaS_423518_1", 0 )--你想做什麼？為什麼不跟著離開？
	end
end

function LuaS_423518_1()
	SetSpeakDetail(	OwnerID() , "[SC_423518_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423518_3]", "LuaS_423518_2" , 0 )
end

function LuaS_423518_2()
	SetSpeakDetail( OwnerID() , "[SC_423518_4]" )
	AddSpeakOption( OwnerID() ,TargetID(), "[SC_423518_5]" , "LuaS_423518_3" , 0 )
end

function LuaS_423518_3()
	SetSpeakDetail( OwnerID() , "[SC_423518_6]" )
	SetFlag( OwnerID() , 544360 , 1 )
end
--------------------------------------------------------

--------------------------------------------------------
function LuaS_423522()	--掛在423522.423523.423524[完成任務後執行的LUA欄]
	if  CheckFlag( TargetID() , 544362 )	==	true and CheckFlag( TargetID() , 544363 ) == true and CheckFlag( TargetID() , 544364 ) == true then
		SetFlag( TargetID() , 544365 , 1 )
		SetFlag( TargetID() , 544635 , 1 )
	end
end

------------------------------------------------------------

-----------423519進一步接觸------------
--116205 假依崔妮   116206 假黑洛卡  116207 假湯尼
--116202 真依崔妮	226203 真黑洛卡  116204 真湯尼

--/GM ? createflag
--780727-黑洛卡旗子  780726-伊崔妮旗子

function LuaS_423519()	--阿信包的函式 可判斷多人劇情
	local T_ID = TargetID() --宣告該NPC為TargetID
	local O_ID = OwnerID() --玩家	
	if CheckAcceptQuest( O_ID, 423519 ) == true and CheckFlag( OwnerID(), 544361 ) == false and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then
		--判斷有任務  沒有旗標  並且該NPC忙碌時
		SetSpeakDetail( O_ID, "[SC_423519_0]" ) --請稍等我一下。
	elseif CheckAcceptQuest( O_ID, 423519 ) == true and CheckFlag( OwnerID(), 544361 ) == false then 
		--否則進行第二判斷  有任務 沒有旗標 並該NPC不忙碌時
		AddSpeakOption( O_ID, T_ID, "[SC_423519_9]", "Lua_423519_1",0) --我準備好了。
		SetSpeakDetail(OwnerID(),"[SC_423519_1]")
	else
		LoadQuestOption( O_ID )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end
end

function Lua_423519_1()
	local T_ID = TargetID() --依崔妮
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )	--關閉所有對話視窗
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
	BeginPlot( T_ID, "Lua_423519_2", 0 )	--呼叫下一段函式
end

function Lua_423519_2()
	while true do							--注意 這是迴圈 將自動上BUFF 自動判斷玩家有無離開劇情範圍
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423519				--任務編號 (只要改動此編號)
		local FinishFlagID = 544361			--完成任務獲得的旗標	(只要改動此編號)
		local CheckBuffID = 507178			--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
		local CheckRange = 150				--演戲的檢查範圍(只要改動此範圍)
		local DoScript = "Lua_423519_break"	--當劇情結束或者沒人在看戲時作的處理	(423519要改為自己的任務編號)
				
		--演戲中
		local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116204, 120, 0 )	--宣告搜尋到的湯尼為tony
		tony = LuaFunc_CreateObjByObj ( 116207 , tony ) --並且tony等於湯尼假人，並在tony的位置上種出116207這個湯尼假人
		local icl = LuaFunc_CreateObjByObj ( 116205 , OwnerID() ) --依崔妮假人		
		local BK = Lua_DW_CreateObj("flag" ,116206,780727,1)	--將116206物件在780727的第一根旗子上種出來 並宣告為BK
		ks_ActSetMode( tony )	--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)
		ks_ActSetMode( icl )
		ks_ActSetMode( BK )
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
		Sleep(10)
		DW_MoveToFlag(icl,780726 , 1 ,0 ,1)		--使icl走到780726的第1根旗子
		DW_MoveToFlag(BK,780727 , 2 ,0 ,1)		--使BK走到780727的第2根旗子
		Sleep(20)
		AdjustFaceDir ( BK, tony ,0 )		--使黑洛卡面對湯尼
		AdjustFaceDir ( icl, BK ,0 )		--使依崔妮面對黑洛卡
		Sleep(5)
		Say(tony,"[SC_423519_2]")
		Sleep(20)
		Say(BK,"[SC_423519_3]")
		Sleep(20)
		Say(tony,"[SC_423519_4]")
		Sleep(20)
		Say(BK,"[SC_423519_5]")
		Sleep(80)
		Say(BK,"[SC_423519_6]")
		Sleep(60)
		Say(tony,"[SC_423519_7]")
		Sleep(20)
		Say(BK,"[SC_423519_8]")
		Sleep(10)
		DW_MoveToFlag(BK,780727 , 3 ,0 ,1)		--使BK走到780727的第3根旗子
		delobj(BK)
		DW_MoveToFlag(icl,780726 , 2 ,0 ,1)		--使icl走到780726的第1根旗子				
		Sleep(10)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
		break								--在最後面記得加break中斷
	end
end

function Lua_423519_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116207, 150, 0 )--搜尋附近參加的NPC演員
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116205, 100, 0 )
	local bk = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116206, 100, 0 )
	
	if tony ~= nil then delobj(tony) end							--如果存在 則刪除
	if icl ~= nil then delobj(icl) end
	if bk ~= nil then delobj(bk) end
	ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
end

-----------------------------------------------

---------423525隔牆有耳-------------

function LuaS_423525()			--掛在115597任務NPC的物品下
	SetPlot( OwnerID(), "range","LuaS_423525_1", 100 )
end

function LuaS_423525_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	if	CheckAcceptQuest( OwnerID() ,423525 ) == true	and 	CheckFlag( OwnerID() , 544366 ) == false and CheckBuff( OwnerID(), 507178 ) == false and 
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then--當NPC忙碌的時候
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--讓NPC忙
		--SetPlot(TargetID(), "range","", 0 )
		BeginPlot( TargetID(), "LuaS_423525_2", 0 )		
	elseif CheckAcceptQuest( OwnerID() , 423525 ) == true	and CheckFlag( OwnerID() , 544366 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423525_0]" , "0xFFFFF266" ) --告訴玩家，讓玩家等等再來
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423525_0]" , "0xFFFFF266" )
	end	
end

function LuaS_423525_2()
	--SetPlot( OwnerID(), "range","", 0 )
	while true do							--注意 這是迴圈
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423525				--任務編號
		local FinishFlagID = 544366			--完成任務獲得的旗標
		local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
		local CheckRange = 150				--演戲的檢查範圍
		local DoScript = "Lua_423525_break"	--當劇情結束或者沒人在看戲時作的處理	
				
		local tony = Lua_DW_CreateObj("flag" ,116214,780725,1)	--將116214物件在780725的第一根旗子上種出來 並宣告為tony
		local SK = Lua_DW_CreateObj("flag" ,116215,780724,1)	--將116215物件在780661的第一根旗子上種出來 並宣告為SK			
		ks_ActSetMode( tony )	--湯尼
		ks_ActSetMode( SK )		
		
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )
		Sleep(10)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423525_0_1]" , "0xFFFFF266" ) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423525_0_1]" , "0xFFFFF266" )
		Sleep(20)
		say(tony , "[SC_423525_1]" )
		Sleep(20)
		say(SK , "[SC_423525_2]" )
		Sleep(20)
		say(tony , "[SC_423525_3]" )
		Sleep(50)
		say(SK , "[SC_423525_4]" )
		Sleep(40)
		say(tony , "[SC_423525_5]" )
		Sleep(20)
		say(SK , "[SC_423525_6]" )
		Sleep(20)
		say(tony , "[SC_423525_7]" )
		Sleep(40)
		say(tony , "[SC_423525_8]" )
		Sleep(40)
		say(SK , "[SC_423525_9]" )
		Sleep(50)
		say(tony , "[SC_423525_10]" )
		Sleep(40)
		say(tony , "[SC_423525_11]" )
		Sleep(30)
		say(SK , "[SC_423525_12]" )
		Sleep(30)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423525_13]" , "0xFFFFF266" ) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423525_13]" , "0xFFFFF266" )
		Sleep(20)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423525_14]" , "0xFFFFF266" ) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423525_14]" , "0xFFFFF266" )
		Sleep(20)
		--delobj(tony)
		--delobj(SK)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 給予旗標
		break
	end
end


function Lua_423525_break()					--這段戲中斷/結束時要作的事情
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116214, 300, 0 )--搜尋附近參加的NPC演員
	local SK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116215, 300, 0 )

	if tony ~= nil then delobj(tony) end							--如果存在 則刪除
	if SK ~= nil then delobj(SK) end
	local obj = ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
	ks_SetController( obj )--設定隱形控制物件
end
----------------------------------------

---------任務423526民意調查報告---------
function Luas_423526()	--掛在116212湯尼身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423526 ) == true and	checkFlag( OwnerID() , 544367 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423526_1]", "Luas_423526_1", 0 )
	end
end

function Luas_423526_1()
	SetSpeakDetail(	OwnerID() , "[SC_423526_2]" )
	AddSpeakOption( OwnerID() , TargetID() ,"[SC_423526_3]", "Luas_423526_2" , 0 )
end

function Luas_423526_2()
	SetSpeakDetail( OwnerID() , "[SC_423526_4]" )
	AddSpeakOption( OwnerID() ,TargetID() , "[SC_423526_5]" , "Luas_423526_3" , 0 )
end

function Luas_423526_3()
	SetSpeakDetail( OwnerID() , "[SC_423526_6]" )
	SetFlag( OwnerID() , 544367 , 1 )
end
--------------------------------------------