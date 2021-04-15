--主線3--
------------------------------423564夾著尾巴------------------------------------
--/GM ? createflag 780746 1
--任務編號:423564
--中空桶子編號: 116352          旗標編號:544393   看戲BUFF:507178
--116350真湯尼:        接了任務還不會出現  演完戲才出現
--116351依崔妮:       接了任務還不會出現   演完戲才出現


--演出的演員
--116349湯尼:       演出旗子: 780746 編號 1生   
--116353依崔妮:       演出旗子: 780746 編號 2生
--116354沙卡巴:       演出旗子: 780746  編號3 生   往4走加法術特效
--116216德銳克:       演出旗子: 780746  編號5生   往6走加法術特效
--116355螢火:           演出旗子: 780746  編號7生   往8走
--116356黑洛卡:       演出旗子:780746   編號9生   往走
--116348德銳克的小兵    旗子:780746   編號10   11   12    13    14    生
function LuaS_423564()			--掛在116281任務NPC的物品下
	SetPlot( OwnerID(), "range","LuaS_423564_1", 250 )
end

function LuaS_423564_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	if	CheckAcceptQuest( OwnerID() ,423564 ) == true	and 	CheckFlag( OwnerID() , 544393 ) == false and CheckBuff( OwnerID(), 507178 ) == false and
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--讓NPC忙
		BeginPlot( TargetID(), "LuaS_423564_2", 0 )
	elseif
		CheckAcceptQuest( OwnerID() ,423564 ) == true	and 	CheckFlag( OwnerID() , 544393 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423564_0]" , "0xFFFFFF00"  ) --告訴玩家，讓玩家等等再來
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423564_0]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423564_2()
	while true do							--注意 這是迴圈
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423564				--任務編號
		local FinishFlagID = 544393			--完成任務獲得的旗標
		local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
		local CheckRange = 200				--演戲的檢查範圍
		local DoScript = "Lua_423564_break"	--當劇情結束或者沒人在看戲時作的處理	
		
		local tony = Lua_DW_CreateObj("flag" ,116349,780746,1)	--將湯尼在第1根旗子上種出來 並宣告
		local icl = Lua_DW_CreateObj("flag" ,116353,780746,2)	--將依崔妮在第2根旗子上種出來 並宣告
		local SK = Lua_DW_CreateObj("flag" ,116354,780746,3)	--將沙卡巴在第3根旗子上種出來 並宣告     
		local DK = Lua_DW_CreateObj("flag" ,116216,780746,5)	--將德銳克在第5根旗子上種出來 並宣告
		local ih = Lua_DW_CreateObj("flag" ,116355,780746,7)	--將螢火在第7根旗子上種出來 並宣告
		local BK =Lua_DW_CreateObj("flag" ,116356,780746,9)		--將黑洛卡在第9根旗子上種出來
		local D1 =Lua_DW_CreateObj("flag" ,116348,780746,10)	--將小兵在第10根旗子上種出來
		local D2 =Lua_DW_CreateObj("flag" ,116348,780746,11)	--將小兵在第11根旗子上種出來
		local D3 =Lua_DW_CreateObj("flag" ,116348,780746,12)	--將小兵在第12根旗子上種出來
		local D4 =Lua_DW_CreateObj("flag" ,116348,780746,13)	--將小兵在第13根旗子上種出來
		local D5 =Lua_DW_CreateObj("flag" ,116348,780746,14)	--將小兵在第14根旗子上種出來
		
		local Obj = {}
		table.insert( Obj, tony)
		table.insert( Obj, icl)
		table.insert( Obj, SK)
		table.insert( Obj, DK)
		table.insert( Obj, ih)
		table.insert( Obj, BK )
		table.insert( Obj, D1 )
		table.insert( Obj, D2 )
		table.insert( Obj, D3)
		table.insert( Obj, D4 )
		table.insert( Obj, D5 )


		for i=1, table.getn(Obj) do
			ks_ActSetMode(Obj[i])
		end
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式
		Sleep(10)
		--演戲中
		for i=1, table.getn(Obj) do
			if Obj[i] ~= SK then
				AdjustFaceDir ( Obj[i], SK ,0 )
			end
		end
		Sleep(5)
		Say(tony,"[SC_423564_1]")	--湯尼:沙卡巴，你勾結魔族，陷害自己的領民，還將他們做成傀儡
		PlayMotion ( tony, ruFUSION_ACTORSTATE_DEBUFF_INSTANT )
		Sleep(40)
		Say( tony , "[SC_423564_2]")	--湯尼:你可認罪?
		PlayMotion ( tony, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(20)
		Say( DK , "[SC_423564_3]")	--德銳克:這筆帳，我現在要好好的和你清算一下
		PlayMotion ( DK, ruFUSION_ACTORSTATE_ATTACK_1H )
		Sleep(40)
		Say( SK , "[SC_423564_4]")	--沙卡巴:成王敗寇！
		PlayMotion ( SK, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(40)
		Say( DK , "[SC_423564_5]") --德銳克:嘴硬！來吧，看看你的詭計是否還會像多年前一樣成功！
		PlayMotion ( DK, ruFUSION_ACTORSTATE_BUFF_SP01 )
		Sleep(20)
		CastSpell( SK , SK, 491276 )
		Sleep(10)
		Say( SK , "[SC_423564_6]") --沙卡巴:你們就陪著人王小鬼繼續玩著小女孩的辦家家酒吧！
		AddBuff( SK, 506984, 3, -1 )	
		WriteRoleValue( SK, EM_RoleValue_IsWalk, 0 )
		Sleep(10)
		for i=1, table.getn(Obj) do
			if Obj[i] ~= SK or Obj[i] ~= DK then
				PlayMotion( Obj[i], ruFUSION_ACTORSTATE_CROUCH_BEGIN )--蹲下
			end
		end
		Say( tony , "[SC_423564_11]")
		Say( icl , "[SC_423564_12]")
		CallPlot( O_ID, "LuaS_423564_GO1", DK )
		DW_MoveToFlag(SK,780746 , 4 ,0 ,1) --3號旗往4號走
		Sleep(15)
		for i=1, table.getn(Obj) do
			if Obj[i] ~= SK or Obj[i] ~= DK then
				PlayMotion( Obj[i], ruFUSION_ACTORSTATE_CROUCH_END )--起立
			end
		end
		delobj(SK)
		LuaS_423564_GO2(ih,BK)
		Sleep(10)
		for i=1, table.getn(Obj) do
			if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 116348 then
				AdjustFaceDir ( Obj[i], SK ,0 )
				Say( Obj[i], "[SC_423564_10]")
				CastSpell( Obj[i] , Obj[i], 494222 )	
			end
		end
		Sleep(15)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 給予旗標
		break								--在最後面記得加break中斷
	end
end
	
function LuaS_423564_GO1( DK)  
	WriteRoleValue( DK, EM_RoleValue_IsWalk, 0 )
	Say( DK , "[SC_423564_7]") --德銳克:你逃不了的！
	--CallPlot( DK, "LuaS_423564_GO2",ih)
	--CastSpell( DK , DK , 490147 )		
	Sleep(10)
	DW_MoveToFlag(DK,780746 , 6 ,0 ,1) --5號旗往6號走
	delobj(DK)	
end

function LuaS_423564_GO2(ih,BK)
	WriteRoleValue( ih, EM_RoleValue_IsWalk, 0 )
	Sleep(5)
	Say( ih , "[SC_423564_8]") --螢火:父親！
	CallPlot( ih, "LuaS_423564_GO3",BK)
	DW_MoveToFlag(ih,780746 , 8 ,0 ,1) --7號旗往8號走
	delobj(ih)
end
	
function LuaS_423564_GO3(BK)
	Sleep(20)
	WriteRoleValue( BK, EM_RoleValue_IsWalk, 0 )
	Say( BK , "[SC_423564_9]") --黑洛卡:可惡，大家快追上去保護將軍！
	DW_MoveToFlag(BK,780746 , 15 ,0 ,1) --9號旗往15號走
	delobj(BK)
end

function Lua_423564_break()					--這段戲中斷/結束時要作的事情
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116349, 300, 0 )--搜尋附近參加的NPC演員
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116353, 300, 0 )
	local SK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116354, 300, 0 )
	local DK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116216, 300, 0 )
	local ih = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116355, 300, 0 )
	local BK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116356, 300, 0 )
	local D1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	
	if tony ~= nil then delobj(tony) end							--如果存在 則刪除
	if icl ~= nil then delobj(icl) end
	if SK ~= nil then delobj(SK) end
	if DK ~= nil then delobj(DK) end
	if ih ~= nil then delobj(ih) end
	if BK ~= nil then delobj(BK) end
	if D1 ~= nil then 
		for i=0, table.getn(D1) do
			delobj(D1[i]) end
		end
	local obj = ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
	ks_SetController( obj )--設定隱形控制物件
end

function Lua_CROUCH_DOWN()
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
end

function Lua_CROUCH_UP()
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_CROUCH_END )
end

function Lua_CROUCH_CHECK()
	if TargetID() == OwnerID() then		
		return false
	end
end

--------------------------------------------------------------------------------------------------------
---------------------------423567束手無策-------------------------------

--/GM ? createflag 780746 20  從20開始
--任務編號:423567
--旗標編號:544403           看戲BUFF:507544

--演出的演員   
--116377湯尼假人
--116378依崔妮假人
--116268艾娜莉亞   
--116361艾娜的手下 

function LuaS_423567()	--掛在116375湯尼身上
	if CheckAcceptQuest( OwnerID(), 423567 ) == true and CheckFlag( OwnerID(), 544403 ) == false and ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		--判斷有任務  沒有旗標  並且該NPC忙碌時
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423567_03]", "Lua_423567_0",0) --我準備好了	
	elseif CheckAcceptQuest( OwnerID(), 423567 ) == true and CheckFlag( OwnerID(), 544403 ) == false then 
		--否則進行第二判斷  有任務 沒有旗標 並該NPC不忙碌時
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423567_03]", "Lua_423567_1",0) --我準備好了。
	else
		LoadQuestOption( OwnerID() )	--如果不掛這個，該NPC其他任務將不會被玩家看見
	end
end
function Lua_423567_0()
	SetSpeakDetail( OwnerID(), "[SC_423567_02]" ) --湯尼沒空:等等，現在不行，前面還有一些敵人，等他們離開吧
end

function Lua_423567_1()
	SetSpeakDetail(OwnerID(),"[SC_423567_01]") --準備好了嗎？那我們前進吧。
	CloseSpeak( OwnerID() )	--關閉所有對話視窗
	WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )	--讓NPC變忙碌
	BeginPlot( TargetID(), "Lua_423567_2", 0 )	--呼叫下一段函式
end

function Lua_423567_2()
	while true do							--注意 這是迴圈 將自動上BUFF 自動判斷玩家有無離開劇情範圍
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423567				--任務編號 (只要改動此編號)
		local FinishFlagID = 544403			--完成任務獲得的旗標	(只要改動此編號)
		local CheckBuffID = 507544			--檢查是否正在演戲的BUFF(只要改動此編號) 507178為演戲BUFF 503977為棟住BUFF
		local CheckRange = 150				--演戲的檢查範圍(只要改動此範圍)
		local DoScript = "Lua_544403_break"	--當劇情結束或者沒人在看戲時作的處理	(423519要改為自己的任務編號)
				
		--演戲中
		local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116375, 120, 0 )	--宣告搜尋到的真湯尼為tony
		tony = LuaFunc_CreateObjByObj ( 116377 , tony ) --並且tony等於湯尼假人，並在tony的位置上種出116207這個湯尼假人
		local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116376, 120, 0 )	--宣告搜尋到的真依崔妮為icl
		icl = LuaFunc_CreateObjByObj ( 116378 , icl ) --並且icl等於依崔妮假人，並在icl的位置上種出116378這個依崔妮假人
		Sleep(10)
		local an = Lua_DW_CreateObj("flag" ,116268,780746,20)	--將116268物件在780746的第20根旗子上種出來 並宣告為an
		ks_ActSetMode( tony )	--演員專用函式  阿信包的(關閉移動劇情 保持走路狀態 無法反擊'攻擊'索敵'點選'隱藏血條'顯示名稱)
		ks_ActSetMode( icl )
		ks_ActSetMode( an )
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式(要加入 呼應檢查函式)
		Sleep(10)
		yell(icl,"[SC_423567_11]",2)
		Sleep(3)
		AdjustFaceDir ( an, tony ,0 ) --使A面對B
		DW_MoveToFlag(an,780746 , 22 ,0 ,1) 
				AdjustFaceDir ( tony, an ,0 )
		AdjustFaceDir ( icl, an ,0 )
		yell(an,"[SC_423567_0]",2)	
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(20)
		yell(tony,"[SC_423567_1]",2)
		Sleep(20)
		yell(an,"[SC_423567_2]",2)	
		Sleep(20)
		yell(icl,"[SC_423567_3]",2)
		Sleep(20)
		yell(an,"[SC_423567_4]",2)	
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
		Sleep(20)
		yell(tony,"[SC_423567_5]",2)
		PlayMotion ( tony, ruFUSION_ACTORSTATE_EMOTE_POINT )
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(30)
		yell(an,"[SC_423567_6]",2)	
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		local ang = Lua_DW_CreateObj("flag" ,116361,780746,21)--艾娜莉亞的魁儡手下
		CastSpell( an , ang , 494395 )--給自己加上法術特效
		ks_ActSetMode( ang )
		Sleep(20)
		AdjustFaceDir ( ang, tony ,0 )
		Sleep(3)
		WriteRoleValue( ang, EM_RoleValue_IsWalk, 0 )	--使魁儡變成跑步
		Sleep(3)
		--AddBuff( ang, 506984, 2, -1 )
		DW_MoveToFlag(ang,780746 , 23 ,0 ,1)
		SysCastSpellLv(ang,ang,495769,1)---施放法術，無施法動作，SysCastSpellLv(施法的人,目標,法術代號,法術等擊)
		CallPlot( OwnerID(), "LuaS_423567_GO1", icl,tony )
		Sleep(20)
		delobj(icl)
		delobj(ang)
		Sleep(30)
		yell(tony,"[SC_423567_8]",2)
		Sleep(5)
		yell(an,"[SC_423567_9]",2)	
		Sleep(20)
		yell(an,"[SC_423567_10]",2)
		CastSpell( an , an , 495735 )
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 自動給予旗標(要加入 呼應函式)
		break								--在最後面記得加break中斷
	end
end
function LuaS_423567_GO1( icl,tony)  
	WriteRoleValue( icl, EM_RoleValue_IsWalk, 0 )
	PlayMotion( tony,ruFUSION_ACTORSTATE_DODGE )
	Sleep(3)
	AddBuff( icl, 506984, 3, -1 )
	Say(icl,"[SC_423567_7]")
	DW_MoveToFlag(icl,780746 , 24 ,0 ,1)
	Sleep(3)
	Say(tony,"[SC_423567_12]")
	PlayMotion( tony,ruFUSION_ACTORSTATE_KNOCKDOWN_RECOVER )
	Sleep(10)
end

function Lua_544403_break()					--這段戲中斷/結束時要作的事情(需要此函式輔助判斷)(423519要改為自己的任務編號)
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116377, 350, 0 )--搜尋附近參加的NPC演員
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116378, 350, 0 )
	local an = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116268, 350, 0 )
	local ang = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116361, 350, 0 )
	
	if tony ~= nil then delobj(tony) end							--如果存在 則刪除
	if icl ~= nil then delobj(icl) end
	if an ~= nil then delobj(an) end
	if ang ~= nil then delobj(ang) end
	
	ks_resetObj( OwnerID(), nil )
end

--------------------------------------------------------------------------------

---------------------------423568英雄再見----------------------------------
--/GM ? createflag 780746
--任務編號:423568
--中空桶子編號:116362           旗標編號:544402   看戲BUFF:507178

--116164真湯尼:演戲結束才會出現

--演出的演員   從25開始
--116354 沙卡巴:       演出旗子:   編號 25生  --31--34--36
--116359 爬德煞:      旗子    編號 26--39--46
--116356 黑洛卡:       演出旗子:   編號 27--38--47
--116349 湯尼:       演出旗子:  編號 28--33
--116216 德銳克:       演出旗子:   編號 29--32--35
--116355 螢火:           演出旗子:   編號 30--37--45

--116348 德兵屍體    旗子:   編號 40  41  42  43 
--116360 腐眼士兵  旗子:    編號 50  51  52  
--116358 沙兵屍體   旗子:  編號 60  61  62  63 64 65 66 67 68 69

function LuaS_423568()			--掛在116362任務NPC的物品下
	SetPlot( OwnerID(), "range","LuaS_423568_1", 150 )
end

function LuaS_423568_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	if	CheckAcceptQuest( OwnerID() ,423568 ) == true	and 	CheckFlag( OwnerID() , 544402 ) == false and CheckBuff( OwnerID(), 507178 ) == false and 
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--讓NPC忙
		BeginPlot( TargetID(), "LuaS_423568_2", 0 )
	elseif
		CheckAcceptQuest( OwnerID() ,423568 ) == true	and 	CheckFlag( OwnerID() , 544402 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423568_0]" , "0xFFFFFF00"  ) --告訴玩家，讓玩家等等再來
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423568_0]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423568_2()
	while true do							--注意 這是迴圈
		local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
		local QuestID = 423568				--任務編號
		local FinishFlagID = 544402			--完成任務獲得的旗標
		local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
		local CheckRange = 250				--演戲的檢查範圍
		local DoScript = "Lua_423568_break"	--當劇情結束或者沒人在看戲時作的處理	
		
	--演員進場--
		local SK = Lua_DW_CreateObj("flag" ,116354,780746,25)--沙卡巴
		local PD = Lua_DW_CreateObj("flag" ,116359,780746,26)--爬德煞
		local BK = Lua_DW_CreateObj("flag" ,116356,780746,27)	--將黑洛卡
		local tony = Lua_DW_CreateObj("flag" ,116349,780746,28)--湯尼
		local DK = Lua_DW_CreateObj("flag" ,116216,780746,29)--德瑞克
		local ih = Lua_DW_CreateObj("flag" ,116355,780746,30)--螢火
		
		local DB1 = Lua_DW_CreateObj("flag" ,116348,780746,40, 0)--德兵
		local DB2 = Lua_DW_CreateObj("flag" ,116348,780746,41, 0)--德兵
		local DB3 = Lua_DW_CreateObj("flag" ,116348,780746,42, 0)--德兵
		local DB4 = Lua_DW_CreateObj("flag" ,116348,780746,43, 0)--德兵
		
		local FB1 = Lua_DW_CreateObj("flag" ,116360,780746,50, 0)--腐兵
		local FB2 = Lua_DW_CreateObj("flag" ,116360,780746,51, 0)--腐兵
		local FB3 = Lua_DW_CreateObj("flag" ,116360,780746,52, 0)--腐兵
		
		local SB1 = Lua_DW_CreateObj("flag" ,116358,780746,60, 0)--沙兵
		local SB2 = Lua_DW_CreateObj("flag" ,116358,780746,61, 0)--沙兵
		local SB3 = Lua_DW_CreateObj("flag" ,116358,780746,62, 0)--沙兵
		local SB4 = Lua_DW_CreateObj("flag" ,116358,780746,63, 0)--沙兵
		local SB5 = Lua_DW_CreateObj("flag" ,116358,780746,64, 0)--沙兵
		local SB6 = Lua_DW_CreateObj("flag" ,116358,780746,65, 0)--沙兵
		local SB7 = Lua_DW_CreateObj("flag" ,116358,780746,66, 0)--沙兵
		local SB8 = Lua_DW_CreateObj("flag" ,116358,780746,67, 0)--沙兵
		local SB9 = Lua_DW_CreateObj("flag" ,116358,780746,68, 0)--沙兵

		SetDefIdleMotion(DB1,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(DB2,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(DB3,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(DB4,ruFUSION_MIME_DEATH_LOOP)
		
		SetDefIdleMotion(FB1,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(FB2,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(FB3,ruFUSION_MIME_DEATH_LOOP)
		
		SetDefIdleMotion(SB1,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB2,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB3,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB4,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB5,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB6,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB7,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB8,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB9,ruFUSION_MIME_DEATH_LOOP)

		AddToPartition( DB1 , 0 )
		AddToPartition( DB2 , 0 )
		AddToPartition( DB3 , 0 )
		AddToPartition( DB4 , 0 )
		
		AddToPartition( FB1 , 0 )
		AddToPartition( FB2 , 0 )
		AddToPartition( FB3 , 0 )
		
		AddToPartition( SB1 , 0 )
		AddToPartition( SB2 , 0 )
		AddToPartition( SB3 , 0 )
		AddToPartition( SB4 , 0 )
		AddToPartition( SB5 , 0 )
		AddToPartition( SB6 , 0 )
		AddToPartition( SB7 , 0 )
		AddToPartition( SB8 , 0 )
		AddToPartition( SB9 , 0 )
	--演員進場結束--
	--指定演員行動模式--
		ks_ActSetMode( SK )	--沙卡巴
		SetDefIdleMotion(SK,ruFUSION_MIME_IDLE_STAND_02)--使NPC播放站立IDLE
		ks_ActSetMode( PD )	--爬德煞
		SetDefIdleMotion(PD,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( tony )--湯尼
		SetDefIdleMotion(tony,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( BK )	--黑洛卡
		SetDefIdleMotion(BK,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( ih )--螢火
		SetDefIdleMotion(ih,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( DK )--德瑞克
		SetDefIdleMotion(DK,ruFUSION_MIME_IDLE_STAND_02)
		
		ks_ActSetMode( DB1 )--德兵
		ks_ActSetMode( DB2 )--德兵
		ks_ActSetMode( DB3 )--德兵
		ks_ActSetMode( DB4 )--德兵
		
		ks_ActSetMode( FB1 )--腐兵
		ks_ActSetMode( FB2 )--腐兵
		ks_ActSetMode( FB3 )--腐兵
		
		ks_ActSetMode( SB1 )--沙兵
		ks_ActSetMode( SB2 )--沙兵
		ks_ActSetMode( SB3 )--沙兵
		ks_ActSetMode( SB4 )--沙兵
		ks_ActSetMode( SB5 )--沙兵
		ks_ActSetMode( SB6 )--沙兵
		ks_ActSetMode( SB7 )--沙兵
		ks_ActSetMode( SB8 )--沙兵
		ks_ActSetMode( SB9 )--沙兵
	--指定結束
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--範圍看戲用的檢查函式
		Sleep(10)
		--演戲中
		AdjustFaceDir ( PD, SK ,0 )	--使1面對2
		AdjustFaceDir ( tony, SK ,0 )
		AdjustFaceDir ( BK, SK ,0 )
		AdjustFaceDir ( ih, SK ,0 )
		AdjustFaceDir ( DK, SK ,0 )
		Sleep(5)
		yell(PD,"[SC_423568_1]",2)	--爬德煞:你逃不掉的，束手就擒吧
		PlayMotion ( PD, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(15)
		yell(SK,"[SC_423568_2]",2)--沙卡巴:不可能！我的士兵數量明明遠遠勝過你們的！
		PlayMotion ( SK, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(25)
		yell(DK,"[SC_423568_3]",2)--德瑞克：你的士兵安逸太久
		PlayMotion ( DK, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(25)
		yell(ih,"[SC_423568_4]",2)--螢火：你身為鐵牙部族的一員，卻勾結魔族
		Sleep(30)
		yell(SK,"[SC_423568_5]",2)--沙卡巴：勾結魔族?
		PlayMotion ( SK, ruFUSION_ACTORSTATE_EMOTE_LAUGH )
		Sleep(20)
		yell(SK,"[SC_423568_5_0]",2)--沙卡巴：笑話，千年前，我一族本就是魔族一方的
		PlayMotion ( SK, ruFUSION_ACTORSTATE_ATTACK_1H )
		Sleep(40)
		yell(tony,"[SC_423568_5_1]",2)--湯尼:要不是你，依崔妮也不會被[116268]帶走！
		PlayMotion ( tony, ruFUSION_ACTORSTATE_DEBUFF_INSTANT )
		Sleep(20)
		yell(SK,"[SC_423568_6]",2)--沙卡巴：可惡！礙事的小鬼，我要拉你陪葬
		CallPlot( OwnerID(), "LuaS_423568_GO1", DK,SK )
		Sleep(5)
		WriteRoleValue( SK, EM_RoleValue_IsWalk, 0 )
		DW_MoveToFlag(SK,780746 , 31 ,0 ,1)
		CallPlot( OwnerID(), "LuaS_423568_GO2", tony,SK )
		CastSpell( SK , SK , 495769 )
		AdjustFaceDir ( SK, DK ,0 )
		AdjustFaceDir ( DK, SK ,0 )
		PlayMotion ( SK, ruFUSION_ACTORSTATE_CAST_SP01 )
		Sleep(15)
		DW_MoveToFlag(SK,780746 , 34 ,0 ,1)
		--CallPlot( OwnerID(), "LuaS_423568_GO5", DK,SK )
		AdjustFaceDir ( SK, DK ,0 )
		yell(SK,"[SC_423568_8]",2)--沙卡巴：你瘋了
		Sleep(5)
		AdjustFaceDir ( DK, SK ,0 )
		yell(DK,"[SC_423568_9]",2)--德銳克：你就跟著我到另一個世界去
		Sleep(10)
		yell(SK,"[SC_423568_10]",2)--沙卡巴:要我死？沒這麼容易！
		PlayMotion ( SK, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		Sleep(10)
		yell(DK,"[SC_423568_11]",2)--德瑞克:唔呃....
		PlayMotion ( DK, ruFUSION_ACTORSTATE_DYING )
		Sleep(10)
		AdjustFaceDir ( BK, DK ,0 )
		yell(BK,"[SC_423568_12]",2)--黑洛卡:不！將軍！
		WriteRoleValue( BK, EM_RoleValue_IsWalk, 0 )
		Sleep(10)
		CallPlot( OwnerID(), "LuaS_423568_GO3", DK,ih )
		DW_MoveToFlag(BK,780746 , 38 ,0 ,1)
		PlayMotion ( BK, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
		CallPlot( OwnerID(), "LuaS_423568_GO4",SK )
		Sleep(50)
		yell(ih,"[SC_423568_14]",2)--螢火:父親....
		PlayMotion ( BK, ruFUSION_ACTORSTATE_CROUCH_END )
		Sleep(20)
		AdjustFaceDir ( ih, tony ,0 )
		AdjustFaceDir ( BK, tony ,0 )
		AdjustFaceDir ( PD, tony ,0 )
		Sleep(10)
		WriteRoleValue( ih, EM_RoleValue_IsWalk, 1 )
		WriteRoleValue( BK, EM_RoleValue_IsWalk, 1 )
		Sleep(10)
		yell(ih,"[SC_423568_15]",2)--螢火:陛下，請允許讓我先將父親下葬......
		Sleep(10)
		yell(tony,"[SC_423568_16]",2)--湯尼:我能理解
		Sleep(30)
		yell(ih,"[SC_423568_17]",2)--螢火:謝謝。請陛下保重了
		Sleep(10)
		AdjustFaceDir ( ih, tony ,180 )
		AdjustFaceDir ( BK, tony ,180 )
		AdjustFaceDir ( PD, tony ,180 )
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --戲演完了 給予旗標
		break								--在最後面記得加break中斷
	end
end

function LuaS_423568_GO1( DK,SK)  
	WriteRoleValue( DK, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	yell(DK,"[SC_423568_7]",2)--德銳克：我不會讓你得逞的
	DW_MoveToFlag(DK,780746 , 32 ,0 ,1)
	AdjustFaceDir ( DK, SK ,0 )
	Sleep(10)
	PlayMotion ( DK, ruFUSION_ACTORSTATE_PARRY_1H )
	Sleep(20)
	DW_MoveToFlag(DK,780746 , 35 ,0 ,1)
	CastSpell( DK , SK , 495769 )
end
function LuaS_423568_GO2( tony,SK)  
	WriteRoleValue( tony, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	AdjustFaceDir ( tony, SK ,0 )
	DW_MoveToFlag(tony,780746 , 33 ,0 ,1)
	AdjustFaceDir ( tony, SK ,0 )
	Sleep(5)
	PlayMotion ( tony, ruFUSION_ACTORSTATE_PARRY_UNARMED )
end
function LuaS_423568_GO3( DK,ih)  
	AdjustFaceDir ( ih, DK ,0 )
	yell(ih,"[SC_423568_13]",2)--螢火:父親！
	WriteRoleValue( ih, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	DW_MoveToFlag(ih,780746 , 37 ,0 ,1)
	Sleep(20)
	PlayMotion ( ih, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	Sleep(20)
	PlayMotion ( ih, ruFUSION_ACTORSTATE_CROUCH_END )
end

function LuaS_423568_GO4( SK)  
	WriteRoleValue( SK, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	yell(SK,"[SC_423568_13_1]",2)--沙卡巴:一群蠢貨，這筆帳，以後再跟你們清算。
	DW_MoveToFlag(SK,780746 , 36 ,0 ,1)
	Sleep(20)
	CastSpell( SK , SK , 495769 )
	delobj(SK)
end
--function LuaS_423568_GO5( DK,SK)  
	--PlayMotion ( DK, ruFUSION_ACTORSTATE_PARRY_1H )
	--Sleep(20)
--	DW_MoveToFlag(DK,780746 , 35 ,0 ,1)
--	CastSpell( DK , SK , 495769 )
--end

function Lua_423568_break()					--這段戲中斷/結束時要作的事情
	local PD = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116359, 300, 0 )--搜尋附近參加的NPC演員
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116349, 300, 0 )
	local DK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116216, 300, 0 )
	local ih = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116355, 300, 0 )
	local SK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116354, 300, 0 )
	local BK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116356, 300, 0 )
	
	local DB1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	local DB2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	local DB3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	local DB4 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	
	local FB1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116360, 300, 0 )
	local FB2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116360, 300, 0 )
	local FB3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116360, 300, 0 )
	
	local SB1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB4 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB5 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB6 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB7 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB8 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB9 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	
	if PD ~= nil then delobj(PD) end							--如果存在 則刪除
	if tony ~= nil then delobj(tony) end
	if DK ~= nil then delobj(DK) end
	if ih ~= nil then delobj(ih) end
	if SK ~= nil then delobj(SK) end
	if BK ~= nil then delobj(BK) end
	if DB1 ~= nil then 
		for i=0, table.getn(DB1) do
			delobj(DB1[i]) end
		end
	if FB1 ~= nil then 
		for i=0, table.getn(FB1) do
			delobj(FB1[i]) end
		end
	if SB1 ~= nil then 
		for i=0, table.getn(SB1) do
			delobj(SB1[i]) end
		end
	
	local obj = ks_resetObj( OwnerID(), nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
	ks_SetController( obj )--設定隱形控制物件
end

--------------------------------------------------------------------------------------------------------

--------------------------------判斷玩家有沒有解裡線任務----------------------------------
function Luas_423551()	--掛在423551格殺勿論這個任務的接受執行欄
	if CheckAcceptQuest( TargetID() , 423569 ) == true and  CheckCompleteQuest( TargetID(), 423513 )==false then
		SetFlag( TargetID() , 544401 , 1 )
	end
end

-----------------------------------------------------------------
------------------423569格殺勿論-----------------
function LuaS_423569() 
	SetPlot( OwnerID(), "Range", "LuaS_423569_1", 200 )	
end
function LuaS_423569_1()--  OwnerID是玩家  演出劇情不可在玩家身上執行
	if	CheckAcceptQuest( OwnerID() ,423569 ) == true and CheckFlag( OwnerID() , 544404) == false and
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423569_1]", 0 )--警告玩家，怪要出現了
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )
		BeginPlot( TargetID(), "LuaS_423569_2", 0 )
--	elseif 
	--	CheckAcceptQuest( OwnerID() ,423569 ) == true and CheckFlag( OwnerID() , 544404) == false and CheckID(Monster) ~= true then
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423569_2]" , "0xFFFFFF00"  ) --告訴玩家，讓玩家等等再來
	--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423569_2]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423569_2()
	local Monster = LuaFunc_CreateObjByObj( 104486, OwnerID() ) --在指定位置產生怪物"104486" 
	--AddToPartition( Monster, 0 )	
	BeginPlot(Monster,"LuaS_423569_4",0) --8秒內未進入戰鬥狀態就會消失
	WriteRoleValue( Monster,EM_RoleValue_Register1, OwnerID() )	

	SetPlot( Monster, "dead", "LuaS_423569_3", 0 )
	AdjustFaceDir ( Monster, TargetID() ,0 )

	--if CheckAcceptQuest( TargetID() ,423569 ) == true and ReadRoleValue( Monster, EM_RoleValue_IsDead ) == 1 then
	--SetFlag( TargetID() , 544404 , 1 )
	--end
end

function LuaS_423569_3()	
	local allplayer = {}
	local playerCount = 0	
	local QuestID = 423569
	local FinishFlagID = 544404
	local CheckRange = 400
	
	allplayer = SearchRangePlayer ( OwnerID(), CheckRange )	
	for pry , obj in pairs( allplayer ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( allplayer[i], QuestID ) == true and CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			SetFlag( allplayer[i] , 544404 , 1 )
		end
	end

	local ctrl = ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )	

	local ctrl = ks_resetObj( ctrl, nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
	ks_SetController( ctrl )--設定隱形控制物件
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_DEAD)
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_DYING)
	npcsay(OwnerID(), "[SC_423569_3]")
	delObj(OwnerID())
end

function LuaS_423569_4()
	local OID = OwnerID()
	while true do
		sleep(80)
		local AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			local ctrl = ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )	
			local ctrl = ks_resetObj( ctrl, nil )									--非常重要 刪除掛載演戲劇情的NPC 作重置
			ks_SetController( ctrl )--設定隱形控制物件
			DelObj(OID)
			break
		end
	end
end