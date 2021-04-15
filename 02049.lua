

------------------------------------
----------423574救援與追查----------

function LuaS_423574()	--掛在湯尼身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423574 ) == true  and	CheckFlag( OwnerID() , 544606 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423574_1]", "LuaS_423574_1", 0 )--玩家：我來轉達摩瑞克.渥林特的話
	end
end

function LuaS_423574_1()
	SetSpeakDetail(	OwnerID() , "[SC_423574_2]" )--湯尼：你說吧，我聽著。
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423574_3]", "LuaS_423574_2" , 0 )--玩家（將摩瑞克.渥林特的話重述一遍）
end

function LuaS_423574_2()
	SetSpeakDetail( OwnerID() , "[SC_423574_4]" )--湯尼：我能理解，我也會照他的指示去做。
	SetFlag( OwnerID() , 544606 , 1 )
end



---------------------------------------------------
--423575前往希尼斯特之地


function LuaS_423575()	--掛在摩瑞克身上
	if CheckFlag ( OwnerID() , 544682 ) == true or CheckFlag ( OwnerID() , 544683 ) == true	or CheckAcceptQuest( OwnerID() , 423570 ) == true or CheckAcceptQuest( OwnerID() , 423571 ) == true then
		SetSpeakDetail(OwnerID() , "[SC_423575_5]")
	else
		LoadQuestOption( OwnerID() )	
		if CheckAcceptQuest( OwnerID() , 423575 ) == true and CheckFlag ( OwnerID() , 544607 ) == false then
			SetSpeakDetail(OwnerID(),"[SC_423575_1]")
			AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423575_2]", "Luas_423575_1", 0 )--玩家：我還有事要處裡。
			AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423575_3]", "Luas_423575_2", 0 )--玩家：準備好了，我們走吧。
		end
	end
end

function Luas_423575_1()
	SetSpeakDetail(OwnerID(),"[SC_423575_4]")--摩瑞克:嗯，快去處裡吧，我們就在這裡等你。
end

function Luas_423575_2()
	--Say(OwnerID() , "[SC_423575_4]" )--摩瑞克本文：那我們這就出發吧。
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 19 , 0 , -2172.4 , 206.4 ,49760.2 , 307.1 )--坐標地點要更改--
	SetFlag (OwnerID() , 544607 , 1 )
end
---------------------------------------------------
--423576艾娜莉亞之名

function LuaS_423576_1()	--掛在民兵身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423576 ) == true  and	CheckFlag( OwnerID() , 544608 )	== false then
		AddSpeakOption ( OwnerID() ,	TargetID() ,"[SC_423576_1_1]", "LuaS_423576_1_1", 0 )
	end
end

function LuaS_423576_1_1()
	SetSpeakDetail( OwnerID() , "[SC_423576_1]" )
	SetFlag( OwnerID() , 544608 , 1 )
end

-----
function LuaS_423576_2()	--掛在吟遊詩人身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423576 ) == true  and	CheckFlag( OwnerID() , 544609 )	== false then
		AddSpeakOption ( OwnerID() ,	TargetID() ,"[SC_423576_1_1]", "LuaS_423576_2_1", 0 )
	end
end

function LuaS_423576_2_1()
	SetSpeakDetail( OwnerID() , "[SC_423576_2]" )
	SetFlag( OwnerID() , 544609 , 1 )
end
----	
function LuaS_423576_3()	--掛在村長兒子身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423576 ) == true  and	CheckFlag( OwnerID() , 544610 )	== false then
		AddSpeakOption ( OwnerID() ,	TargetID() ,"[SC_423576_1_1]", "LuaS_423576_3_1", 0 )
	end
end

function LuaS_423576_3_1()
	SetSpeakDetail( OwnerID() , "[SC_423576_3]" )
	SetFlag( OwnerID() , 544610 , 1 )
end

---------------------------------------------------
--423578無力的獵人

function LuaS_423578()	--掛在任務完成的位子
	--if CheckAcceptQuest ( OwnerID() , 423578 ) == true and CheckFlag ( OwnerID() , 544612 ) == false then
		SetFlag ( TargetID() , 544612 , 1 )
	--end
end

---------------------------------------------------
--423579執著的美食家
function LuaS_423579()	--掛在任務完成的位子
	--if CheckAcceptQuest ( OwnerID() , 423579 ) == true and CheckFlag ( OwnerID() , 544611 ) == false then
		SetFlag ( TargetID() , 544611 , 1 )
	--end
end
---------------------------------------------------
--423580奇怪的藥師

function LuaS_423580()	--掛在任務完成的位子
	--if CheckAcceptQuest ( OwnerID() , 423580 ) == true and CheckFlag ( OwnerID() , 544613 ) == false then
		SetFlag ( TargetID() , 544613 , 1 )
	--end
end

---------------------------------------------------
--423581企盼的青年--
function LuaS_423581()	--掛在企盼的青年身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423581 ) == true  and	CheckFlag( OwnerID() , 544585 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423581_1]", "LuaS_423581_1", 0 )
	end
end

function LuaS_423581_1()
	SetSpeakDetail(	OwnerID() , "[SC_423581_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_3]", "LuaS_423581_2" , 0 )
end

function LuaS_423581_2()
	SetSpeakDetail(	OwnerID() , "[SC_423581_4]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_5]", "LuaS_423581_3" , 0 )
end


function LuaS_423581_3()
	SetSpeakDetail(	OwnerID() , "[SC_423581_6]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_7]", "LuaS_423581_4" , 0 )
end

function LuaS_423581_4()
	SetSpeakDetail(	OwnerID() , "[SC_423581_8]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_9]", "LuaS_423581_5" , 0 )
end

function LuaS_423581_5()
	SetSpeakDetail(	OwnerID() , "[SC_423581_10]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423581_11]", "LuaS_423581_6" , 0 )
end


function LuaS_423581_6()
	SetSpeakDetail( OwnerID() , "[SC_423581_12]" )
	SetFlag( OwnerID() , 544585 , 1 )
	SetFlag( OwnerID() , 544614 , 1 )
end



---------------------------------------------------
------------------423582勘查神賜之樹

--參考 ZONE18 綠洲的116445希德．庫奇 劇情
--116682 飲水檢查點
--/GM ? createflag 780799 1
function LuaS_423582()	--掛在範圍劇情檢查水桶上
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116511  , 1000 , 0)	--以OwnerID為中心搜尋範圍RANGE內目標NPC模板ID
	--宣告cookie為LuaFunc_SearchNPCbyOrgID(也就是要用來當搜尋中心的NPC)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	setplot(OwnerID(),"range","LuaS_423582_1",200) --設定範圍劇情
end

function LuaS_423582_1()
	local cookie = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)
	sleep(5)
	if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( cookie, EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( cookie ,OwnerID(),0 ) --使cookie面對OWNERID		
		PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	--使cookie播放
		sleep(5)
		say(cookie ,"[SC_423582_1]")	--白頻對話不出現在玩家對話框裡 NPC:站住！這裡禁止靠近。快給我過來！
		WriteRoleValue( cookie, EM_RoleValue_Register+2, 0 )
	end
	sleep(5)
	if	GetDistance( OwnerID() , TargetID() ) < 200	then	--如果取得OwnerID與TargetID間的距離小於50 那麼
		SetPosByFlag( OwnerID(), 780799 , 1 )		--將OwnerID傳送至旗標位置
		if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then	--當TargetID不忙時 那麼
			WriteRoleValue( cookie, EM_RoleValue_Register+2, 1 )	--讓他忙
			AdjustFaceDir( cookie ,OwnerID(),0 )		--並使cookie 面向OwnerID
			PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			say(cookie ,"[SC_423582_2]")	--NPC:外來者，這棵果樹附近的區域是禁止靠近的！快離開，否則我們就要用武力驅趕了！		
			BeginPlot( OwnerID(), "LuaS_423582_2" , 0 )
			WriteRoleValue( cookie, EM_RoleValue_Register+2, 0 )	--然後讓TargetID不忙
		end
	end
end

function LuaS_423582_2()
	if CheckAcceptQuest ( OwnerID() , 423582 ) == true and checkFlag( OwnerID() , 544615 )	== false then
		SetFlag( OwnerID(), 544615, 1 )
	end
end


	
---------------------------------------------------
--------------------糖果原料


--當玩家解過這個任務，並且沒有完成「康葛斯的研究」且身上沒有糖果時，則出現對話選項

function LuaS_423586()--掛在凱莉．摩恩司身上
LoadQuestOption ( OwnerID() )
	if	CheckCompleteQuest	( OwnerID(), 423586 ) == true  and
		CheckCompleteQuest	( OwnerID(), 423587 ) == false and	
		CountBodyItem ( OwnerID(), 208273 ) == 0 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423586_1]", "LuaS_423586_1",0) --「我把糖果弄丟了......」
	end
end

function LuaS_423586_1()
	SetSpeakDetail( OwnerID() , "[SC_423586_2]")
	GiveBodyItem ( OwnerID(), 208273 , 1 )
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116967  , 800 , 0)
	Tell(OwnerID(),NPC,"[SC_423586_3]")
end

function LuaS_116512()	--掛在糖果原料完成任務欄
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116967  , 800 , 0)
	Tell(TargetID(),NPC,"[SC_423586_3]")
end
---------------------------------------------------
-----------------423587剛出爐的糖果	
--掛在珠寶糖身上
function DW_Border_423587() --填入任務編號即可 目前版本只可對點擊物品取得任務使用	
	local str = "["..GetUseItemGUID(OwnerID()).."]"		--取出物件名稱
	ClearBorder( OwnerID())		--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail(QuestID,1))	--石碑內容
	ShowBorder( OwnerID(), QuestID,str,"ScriptBorder_Texture_Paper" )	--石碑標題
end

---------------------------------------------------
-----------------康葛斯的研究
function LuaS_116501() --掛在康葛斯身上
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 423588 ) == true and	--確認有任務
		CountBodyItem ( OwnerID(), 208274 ) == 0 and	--並沒有神賜之果
		CountBodyItem ( OwnerID(), 208283 ) == 0 then	--也沒有珠寶糖
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423586_1]", "LuaS_116501_1",0) --「我把糖果弄丟了......」
	end
end
function LuaS_116501_1()
	SetSpeakDetail( OwnerID() , "[SC_116501_1]")
	GiveBodyItem ( OwnerID(), 208283 , 1 )
end
---------------
function LuaS_423588()	--掛在吉姆身上
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest( OwnerID() , 423588 ) == true and --確認有任務
		CountBodyItem ( OwnerID() , 208283 ) == 1 and 	--並且有珠寶糖
		CountBodyItem ( OwnerID() , 208274 ) == 0 then	--並且沒有神賜之果
		AddSpeakOption( OwnerID() ,TargetID() , "[SC_423588_1]" , "LuaS_423588_1" , 0 )	--玩家:可以用這個跟你換果子嗎?
	end
	if CheckAcceptQuest( OwnerID() , 423588 ) == true and CountBodyItem ( OwnerID() , 208283 ) == 0 then
		AddSpeakOption( OwnerID() ,TargetID() , "[SC_423588_3]" , "LuaS_423588_2" , 0 )
	end
end


function LuaS_423588_1()
	SetSpeakDetail( OwnerID() , "[SC_423588_2]" )
	DelBodyItem ( OwnerID() , 208283, 1 )
	GiveBodyItem ( OwnerID() , 208274, 1 )	
end

function LuaS_423588_2()
	SetSpeakDetail( OwnerID() , "[SC_423588_4]" )
end


---------------------------------------------------
--423590鑑定真偽

function LuaS_423590()--掛在湯尼身上
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest( OwnerID() , 423590 ) == true and 
		CountBodyItem ( OwnerID() , 208275 ) == 1 then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423590_1]" , "LuaS_423590_1" , 0 )--陛下，這封信疑似艾可所留？
	end
	if CheckAcceptQuest( OwnerID() , 423590 ) == true and CountBodyItem ( OwnerID() , 208275 ) == 0 then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423590_2]" , "LuaS_423590_2" , 0 )--陛下，有封信想請你鑒定一下真假。
	end
end

function LuaS_423590_2()
	SetSpeakDetail ( OwnerID() , "[SC_423590_3]" )--你得把信件給我，我才有辦法判斷信件的真偽。
end

function LuaS_423590_1()
	DelBodyItem ( OwnerID() , 208275, 1 )
	SetSpeakDetail ( OwnerID() , "[SC_423590_4]" )
	SetFlag( OwnerID(), 544616, 1 )
end


--------------------------------------------------------
---------423591奇怪的馬戲團

function LuaS_423591_1()	--掛在亞其司．唐恩身上
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423591 ) == true  and	
		CheckFlag( OwnerID() , 544617 )	== false then
		AddSpeakOption ( OwnerID() , TargetID(),"[SC_423591_0]", "LuaS_423591_1_1" ,0)
	end
end

function LuaS_423591_1_1()
	SetSpeakDetail( OwnerID() , "[SC_423591_1]" )
	SetFlag( OwnerID() , 544617 , 1 )
end
-----

function LuaS_423591_2()	--掛在帕札．東肯身上
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423591 ) == true  and	
		CheckFlag( OwnerID() , 544618 )	== false then
		AddSpeakOption ( OwnerID() , TargetID(),"[SC_423591_5]", "LuaS_423591_2_1" ,0)
	end
end
function LuaS_423591_2_1()
	SetSpeakDetail( OwnerID() , "[SC_423591_2]" )
	SetFlag( OwnerID() , 544618 , 1 )
end
------
function LuaS_423591_3()	--掛在米恩．斯多達身上
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423591 ) == true  and	
		CheckFlag( OwnerID() , 544619 )	== false then
		AddSpeakOption ( OwnerID() ,TargetID(), "[SC_423591_6]", "LuaS_423591_3_1" ,0 )
	end
end

function LuaS_423591_3_1()
	SetSpeakDetail( OwnerID() , "[SC_423591_3]" )
	SetFlag( OwnerID() , 544619 , 1 )
end

-----------------------------------------------------
-------------------深入馬戲團
function Lua_116555() --使玩家不需要任務也可以撿取物品
	SetPlot( OwnerID(),"touch","Lua_116555_do",30 )--觸碰劇情
end

function Lua_116555_do()
	if	CountBodyItem( OwnerID(),208276) < 1	then
		BeginPlot( TargetID(), "Lua_116555_Get", 0 )--執行檢取劇情
		DW_CancelTypeBuff( 68,  OwnerID() )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_116555]", 0 )		
	end
end

function Lua_116555_Get()	
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	local item = 208276 --獲得物品
	local num = 1 --獲得數量
	local time = 10 --物件重生時間  一般種怪 需要填重生時間  script產怪填0
	CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- 目標(target玩家) 獲得物品(item) 數量(num) 時間(time)					
end

--使用偽裝物品檢查--
--/GM ? createflag 780800 
function LuaS_208276_0() --使用前檢查是不是在範圍內
	if 	(DW_CheckDis(OwnerID(),780800,3,20) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,4,20) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,5,20) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,6,100) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) or 
		(DW_CheckDis(OwnerID(),780800,7,100) and ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0 ) then
		DW_CancelTypeBuff(68)
		return true
	elseif		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_208276_0]", 0 )
		return false
	end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_208276_1]", 0 )
	return false
end



--玩家需要變身，才能進入後台
--（給門做CLIENT  當玩家偽裝時 看不見門 才能進入）
--偽裝物品隨時可以取得，前台後台都有偽裝衣物可以穿

function LuaS_423593_1()   
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest (OwnerID() , 423593 ) == true	then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423593_1]", "LuaS_423593_1_1" , 0 ) --玩家：馬戲團什麼時候開始表演？
	end
end

function LuaS_423593_1_1()
	SetSpeakDetail ( OwnerID() , "[SC_423593_2]" )--......（你仔細的看著表演者的雙眼，卻發現空洞一片）
	SetFlag( OwnerID() , 544620 , 1 )--得到旗標 詢問開演時間
end

-------

function LuaS_423593_2()
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest (OwnerID() , 423593 ) == true	then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423593_3]", "LuaS_423593_2_1()" , 0 ) --玩家：能跟你要個簽名嗎？
	end
end

function LuaS_423593_2_1()
	SetSpeakDetail ( OwnerID() , "[SC_423593_4]" )--......（眼前的表演者似乎沒有聽到你說話，完全無視你的存在）
	SetFlag( OwnerID() , 544621 , 1 )--得到旗標 試著索取簽名
end

-------

function LuaS_423593_3()
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest (OwnerID() , 423593 ) == true	then
		AddSpeakOption ( OwnerID() , TargetID() , "[SC_423593_5]", "LuaS_423593_3_1()" , 0 ) --玩家：可以打擾你一點時間嗎？
	end
end

function LuaS_423593_3_1()
	SetSpeakDetail ( OwnerID() , "[SC_423593_6]" )--......（你發現眼前的表演者似乎沒有任何呼吸，但卻詭異的能自由走動。）
	SetFlag( OwnerID() , 544625 , 1 )--得到旗標 試著與表演者互動
end


--PS.如果要在馬戲團給每日或委託任務的話，建議在這個任務完成之後，再讓玩家看到發任務的NPC

--玩家丟掉衣服，康葛斯給予

function LuaS_423593()--掛在康葛斯身上
LoadQuestOption ( OwnerID() )
	if	CheckCompleteQuest	( OwnerID(), 423593 ) == true  and	CountBodyItem ( OwnerID(), 208276 ) == 0 then	--只要完成過深入馬戲團 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_423593_7]", "LuaS_423586_4",0) --「我把偽裝用的衣服弄丟了......」
	end
end

function LuaS_423586_4()
	SetSpeakDetail( OwnerID() , "[SC_423586_8]")
	GiveBodyItem ( OwnerID(), 208276 , 1 )
end

-----------------------------------------------------
---------------423594阻擋的能量-----------------------

--[[function Lua_423446_start()
	local T_ID = TargetID()--火堆
	local O_ID = OwnerID() --玩家
	
	if CheckFlag( O_ID, 544287) ~= true then	
		BeginPlot( T_ID, "Lua_423446_1", 0 )
		SetModeEx( T_ID, EM_SetModeType_Mark , false )
		DisableQuest( T_ID, true )
	end	
	return 1
end]]

function LuaS_423594()
	SetPlot( OwnerID(), "touch", "LuaS_423594_1" , 50 )
end
	
function LuaS_423594_1()
	if 	CheckAcceptQuest (OwnerID() , 423594 ) == false then	--如果沒有任物
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_2]" , "0xFFFFFF00"  ) --就只是一個奇怪的石塊......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_2]" , "0xFFFFFF00"  )	
	elseif 	
		CheckAcceptQuest (OwnerID() , 423594 ) == true	and	--有任務 且沒有兩個旗標
		CheckFlag( OwnerID(), 544626 ) == false or 
		CheckFlag( OwnerID(), 544627 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_1]" , "0xFFFFFF00"  ) --毫無任何反應，啟動順序錯誤......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_1]" , "0xFFFFFF00"  )		
	elseif
		CheckFlag( OwnerID(), 544629 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_3]" , "0xFFFFFF00"  ) --這個石柱不再有任何反應......
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_3]" , "0xFFFFFF00"  )
	elseif
		CheckFlag( OwnerID(), 544626 ) == true and 	--有兩個旗標
		CheckFlag( OwnerID(), 544627 ) == true then
		SetFlag( OwnerID(), 544628 , 1 )
		SetFlag( OwnerID(), 544629 , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423594_0]" , "0xFFFFFF00"  ) --你感覺到一股能量在瞬間消散...
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423594_0]" , "0xFFFFFF00"  )
	end
	
	
end	

----------------------------------------------------
--423595 重重防守

function LuaS_423595()--掛在423595完成
	SetFlag( TargetID(), 544681 , 1 )
end

-----------------------------------------------------
-----------------------------------------------------

--423596高傲的薔薇

function LuaS_423596()	--掛在艾可身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423596 ) == true  and	CheckFlag( OwnerID() , 544630 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423596_1]", "LuaS_423596_1", 0 )
	end
end

function LuaS_423596_1()
	SetSpeakDetail(	OwnerID() , "[SC_423596_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423596_3]", "LuaS_423596_2" , 0 )
end

function LuaS_423596_2()
	SetSpeakDetail(	OwnerID() , "[SC_423596_4]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423596_5]", "LuaS_423596_3" , 0 )
end

function LuaS_423596_3()
	SetSpeakDetail( OwnerID() , "[SC_423596_6]" )
	SetFlag( OwnerID() , 544630 , 1 )
end

-----------------------------------------------------
-----------------------------------------------------
function LuaS_208281_book_0()	--208281整理過的實驗檔案
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_4]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208281_BOOK_5]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_208281_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

-----------------------------------------------------
-----------------------------------------------------
------------423600找麻煩

function LuaS_423600_Magic()--法術作的事情 設置在基本法術的執行劇情名稱裡(法術種類要先選為執行劇情)
	local Player = OwnerID()--玩家
	local Obj = TargetID()--目標
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	local Goal = { 116564, 116565, 116586 }
	local Flag = { 544631, 544632, 544633 }
	for i=1, table.getn(Goal) do
		if OrgID == Goal[i] then	--如果OrgID為Goal[i]中搜尋到的任何一值 那麼
			SetFlag( OwnerID(), Flag[i], 1 )	--給予 Flag[i]中的旗標一隻(Goal[i]與Flag[i] 的目標與要給的旗標順序要排好)
			local Fire = LuaFunc_CreateObjByObj ( 116814, Obj ) --LuaFunc_CreateObjByObj參照指定物件的位置來產生物件
			WriteRoleValue( Fire, EM_RoleValue_LiveTime, 5 ) --將Fire寫入持續時間 5秒
			SetModeEx( Fire, EM_SetModeType_Mark, false )--SetModeEx=設定Mode(回傳 bool) 
			--[[SetModeEx主要是作用在..並非由物件編輯器種出來 而是用Script產生出來的物件上，主要功用為關掉物件上的設置比方說關閉TIP或有無阻擋 重力 是否勾選儲存 ]]
		end
	end	
end

function LuaS_423600_Do()--通過使用檢查後執行[使用物品] 	(設置在物品-使用效果類型-Sever端劇情-使用效果) 
	local Obj = ReadRoleValue( OwnerID(), EM_RoleValue_Register10 ) --宣告obj為LuaS_423600_Check寫入的EM_RoleValue_Register10暫存值
	WriteRoleValue( OwnerID(), EM_RoleValue_Register10, 0 ) --保留obj讀取到的值 但是清空EM_RoleValue_Register10裡面寫入的暫存值
	CastSpell( OwnerID(), Obj, 496127 )--對obj使用 法術  丟炸彈 
end --當函式結束 obj被清空

function LuaS_423600_Check()--使用物品時檢查	設置在物品-物品使用-使用檢查LUA欄 (要先檢查才能DO)
	local obj = SearchRangeNPC( OwnerID(), 50 ) --宣告 以玩家為中心 範圍50內的物件為obj
	local Goal = { 116564, 116565, 116586 } --宣告 主要目標編號 為 Goal
	local Flag = { 544631, 544632, 544633 } --宣告 旗標編號為Flag
	local OrgID	--宣告 物件在檔案庫裡的編號(非遊戲中浮動的GID) 不抓這個值會找不到物件
	for i= 0, table.getn(obj) do	
--[[(因為SearchRangeNPC為程式所包之函式 所以必須從0開始找 因此i=0   table.getn(obj) --在陣列裡 逐一搜尋obj ]]
		OrgID = ReadRoleValue( obj[i], EM_RoleValue_OrgID )--將搜尋到的obj存為陣列 obj[i] 並抓取其在檔案庫裡的固定編號 並寫為OrgID
		for j=1, table.getn(Goal) do 
--[[for迴圈 因為沒用到程式包的函式 而LUA系統的初始值為1 所以j=1 否則會跳過0 從1開始找 table.getn(Goal) --在陣列裡 逐一搜尋Goal ]]
			if OrgID == Goal[j] and CheckFlag( OwnerID(), Flag[j] ) ~= true then
			--如果OrgID等於Goal[j]陣列中的其中一個值(也就是local Goal = { 116564, 116565, 116586 }其中一個) 
			--並且玩家身上旗標"不"為Flag[j] 陣列中的其中一個值 (也就是local Flag = { 544631, 544632, 544633 }其中一個)
				--debugmsg(0,0,"find")
				WriteRoleValue( OwnerID(), EM_RoleValue_Register10, obj[i] ) --將obj[i]寫入EM_RoleValue_Register10做暫存
				return true		--則通過判斷並跳出函式 且回傳true(結束函式)
			end
		end		
	end
	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_423600_1]" , 0 )--目標過遠
	return false--否則 回傳false
end



------------------------------------------------------------
--------------------423690被攔截的戰報----------------------
function LuaS_423690()	--掛在湯尼身上
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423690 ) == true  and	CheckFlag( OwnerID() , 544634 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423690_1]", "LuaS_423690_1", 0 )
	end
	if 	CheckAcceptQuest(OwnerID(),424213) == true 	and
		CountBodyItem(OwnerID(),209474) == 0		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424213_01]","LuaAS_424213_01",0)
	end
end

function LuaAS_424213_01()
	SetSpeakDetail(OwnerID(),"[SC_424213_02]")
	GiveBodyItem(OwnerID(),209474,1)
end

function LuaS_423690_1()
	SetSpeakDetail(	OwnerID() , "[SC_423690_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_11]", "LuaS_423690_2" , 0 )
end

function LuaS_423690_2()
	SetSpeakDetail(	OwnerID() , "[SC_423690_12]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_3]", "LuaS_423690_3" , 0 )
end

function LuaS_423690_3()
	SetSpeakDetail( OwnerID() , "[SC_423690_4]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_5]", "LuaS_423690_4" , 0 )
end

function LuaS_423690_4()
	SetSpeakDetail( OwnerID() , "[SC_423690_6]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_7]", "LuaS_423690_5" , 0 )
end
function LuaS_423690_5()
	SetSpeakDetail( OwnerID() , "[SC_423690_8]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423690_9]", "LuaS_423690_6" , 0 )
end
function LuaS_423690_6()
	SetSpeakDetail( OwnerID() , "[SC_423690_10]" )
	SetFlag( OwnerID() , 544634 , 1 )
end
