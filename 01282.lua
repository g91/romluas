--節慶活動 2009年4月春雨節
--建立時間: 2009/03/16
--修改日期: 2009/04/06
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
function LuaN_112585_0() -- 路易絲．提拉
	SetSpeakDetail(OwnerID(), "[SC_112585_0]" )--想知道春雨節的由來嗎？[112396]可以告訴你喔～！
end
------------------------------------------------------------------------------
function LuaN_112502_0() --NPC吉德．安格斯 
	SetSpeakDetail(OwnerID(), "[SC_112502_1]" )--NPC對話   歡迎參加今年的春雨節活動～！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112502_01]", "LuaN_112502_1", 0) --關於帶兔子回家去活動
end
------------------------------------------------------------------------------
function LuaN_112502_1() ----關於帶兔子回家去活動 
	SetSpeakDetail(OwnerID(), "[SC_112502_111]" )--感受到春雨節歡欣的氣氛了嗎？   
	AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
end
------------------------------------------------------------------------------
function Lua_Dan_112676_NPCchat() --泰坦
	SetSpeakDetail(OwnerID(), "[SC_DAN_SR_111700_22]" ) 
end



--下方為取消的活動
------------------------------------------------------------------------------
function LuaN_112502_2() ----關於春言采語活動 
	SetSpeakDetail(OwnerID(), "[SC_112502_112]" )--告訴你一個好消息(略)  
	AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
end
------------------------------------------------------------------------------
function LuaN_112502_3()-----我想知道春言采語的題目
	local Song1 = CountBodyItem( OwnerID() , 204123 ) --櫻花之歌
	local Song2 = CountBodyItem( OwnerID() , 204124 ) --風鈴木之歌
	local Song3 = CountBodyItem( OwnerID() , 204125 ) --勿忘我之歌
	local Song4 = CountBodyItem( OwnerID() , 204126 ) --杜鵑花之歌
--------  今天接受題目旗標
	local Q01= CheckFlag(OwnerID()  , 542451) -- Q01 Flag
	local Q02= CheckFlag(OwnerID()  , 542452) -- Q02 Flag
	local Q03= CheckFlag(OwnerID()  , 542453) -- Q03 Flag
	local Q04= CheckFlag(OwnerID()  , 542454) -- Q04 Flag
	local Q05= CheckFlag(OwnerID()  , 542455) -- Q05 Flag
	local Q06= CheckFlag(OwnerID()  , 542456) -- Q06 Flag
	local Q07= CheckFlag(OwnerID()  , 542457) -- Q07 Flag
	local Q08= CheckFlag(OwnerID()  , 542458) -- Q08 Flag
	local Q09= CheckFlag(OwnerID()  , 542459) -- Q09 Flag
	local Q10= CheckFlag(OwnerID()  , 542460) -- Q10 Flag
	local Q11= CheckFlag(OwnerID()  , 542461) -- Q11 Flag
	local Q12= CheckFlag(OwnerID()  , 542462) -- Q12 Flag
	local Q13= CheckFlag(OwnerID()  , 542463) -- Q13 Flag
	local Q14= CheckFlag(OwnerID()  , 542464) -- Q14 Flag
	local Q15= CheckFlag(OwnerID()  , 542465) -- Q15 Flag
	local Q16= CheckFlag(OwnerID()  , 542466) -- Q16 Flag
	local Q17= CheckFlag(OwnerID()  , 542467) -- Q17 Flag
	local Q18= CheckFlag(OwnerID()  , 542468) -- Q18 Flag
	local Q_end= CheckFlag(OwnerID()  , 542429) -- 今天已完成過活動旗標 

	if Q_end == true then --如果今天已參加過活動
		SetSpeakDetail(OwnerID(), "[SC_112502_END]" )-- 你今天已經完成過這個活動囉～！歡迎你明天的參與！
		AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
	elseif (Q01 == true) or (Q02 == true) or (Q03 == true) or (Q04 == true) or (Q05 == true) or (Q06 == true) or (Q07 == true) or (Q08 == true) or (Q09 == true) or (Q10 == true) or (Q11 == true) or (Q12 == true) or (Q13 == true) or (Q14 == true) or (Q15 == true) or (Q16 == true) or (Q17 == true) or (Q18 == true) then
			if Q01 == true then --Q1 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_001]" )-- 今天的需求物品是2個[204123]與2個[204125]喔！--1
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q02 == true then --Q2 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_002]" )-- 今天的需求物品是2個[204123]與3個[204125]喔！--2
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q03 == true then --Q3 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_003]" )-- 今天的需求物品是2個[204123]與4個[204125]喔！--3
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q04 == true then --Q4 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_004]" )-- 今天的需求物品是3個[204123]與2個[204125]喔！--4
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q05 == true then --Q5 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_005]" )-- 今天的需求物品是3個[204123]與3個[204125]喔！--5
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q06 == true then --Q6 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_006]" )-- 今天的需求物品是3個[204123]與4個[204125]喔！--6
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q07 == true then --Q7 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_007]" )-- 今天的需求物品是4個[204123]與2個[204125]喔！--7
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q08 == true then --Q8 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_008]" )-- 今天的需求物品是4個[204123]與3個[204125]喔！--8
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q09 == true then --Q9 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_009]" )-- 今天的需求物品是4個[204123]與4個[204125]喔！--9
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q10 == true then --Q10 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_010]" )-- 今天的需求物品是2個[204124]與2個[204126]喔！--10
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q11 == true then --Q11 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_011]" )-- 今天的需求物品是2個[204124]與3個[204126]喔！--11
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q12 == true then --Q12 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_012]" )-- 今天的需求物品是2個[204124]與4個[204126]喔！--12
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q13 == true then --Q13 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_013]" )-- 今天的需求物品是3個[204124]與2個[204126]喔！--13
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q14 == true then --Q14 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_014]" )-- 今天的需求物品是3個[204124]與3個[204126]喔！--14
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q15 == true then --Q15 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_015]" )-- 今天的需求物品是3個[204124]與4個[204126]喔！--15
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q16 == true then --Q16 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_016]" )-- 今天的需求物品是4個[204124]與2個[204126]喔！--16
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q17 == true then --Q17 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_017]" )-- 今天的需求物品是4個[204124]與3個[204126]喔！--17
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif Q18 == true then --Q18 進行中
					SetSpeakDetail(OwnerID(), "[SC_112502_018]" )-- 今天的需求物品是4個[204124]與4個[204126]喔！--18
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			end
------------------如果未接過 -----------------------------------------------------------------------
	elseif Q01 == false and Q02 == false and Q03 == false and Q04 == false and Q05 == false and Q06 == false and Q07 == false and Q08 == false and Q09 == false and Q10 == false and Q11 == false and Q12 == false and Q13 == false and Q14 == false and Q15 == false and Q16 == false and Q17 == false and Q18 == false then --如果未接過
			local RANDOWN = rand(18)
			if RANDOWN == 1 then  -- Q1
				SetSpeakDetail(OwnerID(), "[SC_112502_001]" )-- 今天的需求物品是2個[204123]與2個[204125]喔！--1
				SetFlag( OwnerID()  , 542451 , 1 ) -- 給玩家 Q1 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 2 then --Q2
				SetSpeakDetail(OwnerID(), "[SC_112502_002]" )-- 今天的需求物品是2個[204123]與3個[204125]喔！--2
				SetFlag( OwnerID()  , 542452 , 1 ) -- 給玩家 Q2 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 3 then --Q3
				SetSpeakDetail(OwnerID(), "[SC_112502_003]" )-- 今天的需求物品是2個[204123]與4個[204125]喔！--3
				SetFlag( OwnerID()  , 542453 , 1 ) -- 給玩家 Q3 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 4 then --Q4
				SetSpeakDetail(OwnerID(), "[SC_112502_004]" )-- 今天的需求物品是3個[204123]與2個[204125]喔！--4
				SetFlag( OwnerID()  , 542454 , 1 ) -- 給玩家 Q4 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 5 then --Q5
				SetSpeakDetail(OwnerID(), "[SC_112502_005]" )-- 今天的需求物品是3個[204123]與3個[204125]喔！--5
				SetFlag( OwnerID()  , 542455 , 1 ) -- 給玩家 Q5 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 6 then --Q6
				SetSpeakDetail(OwnerID(), "[SC_112502_006]" )-- 今天的需求物品是3個[204123]與4個[204125]喔！--6
				SetFlag( OwnerID()  , 542456 , 1 ) -- 給玩家 Q6 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 7 then --Q7
				SetSpeakDetail(OwnerID(), "[SC_112502_007]" )-- 今天的需求物品是4個[204123]與2個[204125]喔！--7
				SetFlag( OwnerID()  , 542457 , 1 ) -- 給玩家 Q7 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 8 then --Q8
				SetSpeakDetail(OwnerID(), "[SC_112502_008]" )-- 今天的需求物品是4個[204123]與3個[204125]喔！--8
				SetFlag( OwnerID()  , 542458 , 1 ) -- 給玩家 Q8 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 9 then --Q9
				SetSpeakDetail(OwnerID(), "[SC_112502_009]" )-- 今天的需求物品是4個[204123]與4個[204125]喔！--9
				SetFlag( OwnerID()  , 542459 , 1 ) -- 給玩家 Q9 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 10 then --Q10
				SetSpeakDetail(OwnerID(), "[SC_112502_010]" )-- 今天的需求物品是2個[204124]與2個[204126]喔！--10
				SetFlag( OwnerID()  , 542460 , 1 ) -- 給玩家 Q10 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 11 then --Q11
				SetSpeakDetail(OwnerID(), "[SC_112502_011]" )-- 今天的需求物品是2個[204124]與3個[204126]喔！--11
				SetFlag( OwnerID()  , 542461 , 1 ) -- 給玩家 Q11 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 12 then --Q12
				SetSpeakDetail(OwnerID(), "[SC_112502_012]" )-- 今天的需求物品是2個[204124]與4個[204126]喔！--12
				SetFlag( OwnerID()  , 542462 , 1 ) -- 給玩家 Q12 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 13 then --Q13
				SetSpeakDetail(OwnerID(), "[SC_112502_013]" )-- 今天的需求物品是3個[204124]與2個[204126]喔！--13
				SetFlag( OwnerID()  , 542463 , 1 ) -- 給玩家 Q13 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 14 then --Q14
				SetSpeakDetail(OwnerID(), "[SC_112502_014]" )-- 今天的需求物品是3個[204124]與3個[204126]喔！--14
				SetFlag( OwnerID()  , 542464 , 1 ) -- 給玩家 Q14 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 15 then --Q15
				SetSpeakDetail(OwnerID(), "[SC_112502_015]" )-- 今天的需求物品是3個[204124]與4個[204126]喔！--15
				SetFlag( OwnerID()  , 542465 , 1 ) -- 給玩家 Q15 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 16 then --Q16
				SetSpeakDetail(OwnerID(), "[SC_112502_016]" )-- 今天的需求物品是4個[204124]與2個[204126]喔！--16	
				SetFlag( OwnerID()  , 542466 , 1 ) -- 給玩家 Q16 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 17 then --Q17
				SetSpeakDetail(OwnerID(), "[SC_112502_017]" )-- 今天的需求物品是4個[204124]與3個[204126]喔！--17
				SetFlag( OwnerID()  , 542467 , 1 ) -- 給玩家 Q17 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			elseif RANDOWN == 18 then --Q18
				SetSpeakDetail(OwnerID(), "[SC_112502_018]" )-- 今天的需求物品是4個[204124]與4個[204126]喔！--18
				SetFlag( OwnerID()  , 542468 , 1 ) -- 給玩家 Q18 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
			end

	end
end
------------------------------------------------------------------------------
function LuaN_112502_4() ----兌換春言采語活動獎勵
	local Song1 = CountBodyItem( OwnerID() , 204123 ) --櫻花之歌
	local Song2 = CountBodyItem( OwnerID() , 204124 ) --風鈴木之歌
	local Song3 = CountBodyItem( OwnerID() , 204125 ) --勿忘我之歌
	local Song4 = CountBodyItem( OwnerID() , 204126 ) --杜鵑花之歌
--------  今天接受題目旗標
	local Q01= CheckFlag(OwnerID()  , 542451) -- Q01 Flag
	local Q02= CheckFlag(OwnerID()  , 542452) -- Q02 Flag
	local Q03= CheckFlag(OwnerID()  , 542453) -- Q03 Flag
	local Q04= CheckFlag(OwnerID()  , 542454) -- Q04 Flag
	local Q05= CheckFlag(OwnerID()  , 542455) -- Q05 Flag
	local Q06= CheckFlag(OwnerID()  , 542456) -- Q06 Flag
	local Q07= CheckFlag(OwnerID()  , 542457) -- Q07 Flag
	local Q08= CheckFlag(OwnerID()  , 542458) -- Q08 Flag
	local Q09= CheckFlag(OwnerID()  , 542459) -- Q09 Flag
	local Q10= CheckFlag(OwnerID()  , 542460) -- Q10 Flag
	local Q11= CheckFlag(OwnerID()  , 542461) -- Q11 Flag
	local Q12= CheckFlag(OwnerID()  , 542462) -- Q12 Flag
	local Q13= CheckFlag(OwnerID()  , 542463) -- Q13 Flag
	local Q14= CheckFlag(OwnerID()  , 542464) -- Q14 Flag
	local Q15= CheckFlag(OwnerID()  , 542465) -- Q15 Flag
	local Q16= CheckFlag(OwnerID()  , 542466) -- Q16 Flag
	local Q17= CheckFlag(OwnerID()  , 542467) -- Q17 Flag
	local Q18= CheckFlag(OwnerID()  , 542468) -- Q18 Flag
--------- 已接此活動 
	local Q_end= CheckFlag(OwnerID()  , 542429) -- 今天已完成過活動旗標 
        if Q_end == true then --如果今天已完成活動
		SetSpeakDetail(OwnerID(), "[SC_112502_END]" )-- 你今天已經完成過這個活動囉～！歡迎你明天的參與！
		AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
	elseif (Q01 == true) or (Q02 == true) or (Q03 == true) or (Q04 == true) or (Q05 == true) or (Q06 == true) or (Q07 == true) or (Q08 == true) or (Q09 == true) or (Q10 == true) or (Q11 == true) or (Q12 == true) or (Q13 == true) or (Q14 == true) or (Q15 == true) or (Q16 == true) or (Q17 == true) or (Q18 == true) then
			if Q01 == true then --Q1 進行中
				if Song1 >= 2 and Song3 >=2 then --達成Q1條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(4)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 2 ) --櫻花之歌x2
					DelBodyItem( OwnerID() , 204125 , 2 ) --勿忘我之歌x2
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542451 , 0 ) -- 刪玩家 Q1 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q02 == true then --Q2 進行中
				if Song1 >= 2 and Song3 >=3 then --達成Q2條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 2 ) --櫻花之歌x2
					DelBodyItem( OwnerID() , 204125 , 3 ) --勿忘我之歌x3
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542452 , 0 ) -- 刪玩家 Q2 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q03 == true then --Q3 進行中
				if Song1 >= 2 and Song3 >=3 then --達成Q3條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 2 ) --櫻花之歌x2
					DelBodyItem( OwnerID() , 204125 , 4 ) --勿忘我之歌x4
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542453 , 0 ) -- 刪玩家 Q3 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q04 == true then --Q4 進行中
				if Song1 >=3 and Song3 >=2 then --達成Q4條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 3 ) --櫻花之歌x3
					DelBodyItem( OwnerID() , 204125 , 2 ) --勿忘我之歌x2
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542454 , 0 ) -- 刪玩家 Q4 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q05 == true then --Q5 進行中
				if Song1 >=3 and Song3 >=3 then --達成Q5條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 3 ) --櫻花之歌x3
					DelBodyItem( OwnerID() , 204125 , 3 ) --勿忘我之歌x3
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542455 , 0 ) -- 刪玩家 Q5 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q06 == true then --Q6 進行中
				if Song1 >=3 and Song3 >=4 then --達成Q6條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 3 ) --櫻花之歌x3
					DelBodyItem( OwnerID() , 204125 , 4 ) --勿忘我之歌x4
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542456 , 0 ) -- 刪玩家 Q6 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q07 == true then --Q7 進行中
				if Song1 >=4 and Song3 >=2 then --達成Q7條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 4 ) --櫻花之歌x4
					DelBodyItem( OwnerID() , 204125 , 2 ) --勿忘我之歌x2
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542457 , 0 ) -- 刪玩家 Q7 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q08 == true then --Q8 進行中
				if Song1 >=4 and Song3 >=3 then --達成Q8條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 4 ) --櫻花之歌x4
					DelBodyItem( OwnerID() , 204125 , 3 ) --勿忘我之歌x3
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542458 , 0 ) -- 刪玩家 Q8 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q09 == true then --Q9 進行中
				if Song1 >=4 and Song3 >=4 then --達成Q9條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204123 , 4 ) --櫻花之歌x4
					DelBodyItem( OwnerID() , 204125 , 4 ) --勿忘我之歌x4
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542459 , 0 ) -- 刪玩家 Q9 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q10 == true then --Q10 進行中
				if Song2 >=2 and Song4 >=2 then --達成Q10條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 2 ) --風鈴木之歌x2
					DelBodyItem( OwnerID() , 204126 , 2 ) --杜鵑花之歌x2
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542460 , 0 ) -- 刪玩家 Q10 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q11 == true then --Q11 進行中
				if Song2 >=2 and Song4 >=3 then --達成Q11條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 2 ) --風鈴木之歌x2
					DelBodyItem( OwnerID() , 204126 , 3 ) --杜鵑花之歌x3
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542461 , 0 ) -- 刪玩家 Q11 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q12 == true then --Q12 進行中
				if Song2 >=2 and Song4 >=4 then --達成Q12條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 2 ) --風鈴木之歌x2
					DelBodyItem( OwnerID() , 204126 , 4 ) --杜鵑花之歌x4
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542462 , 0 ) -- 刪玩家 Q12 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q13 == true then --Q13 進行中
				if Song2 >=3 and Song4 >=2 then --達成Q13條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 3 ) --風鈴木之歌x3
					DelBodyItem( OwnerID() , 204126 , 2 ) --杜鵑花之歌x2
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542463 , 0 ) -- 刪玩家 Q13 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q14 == true then --Q14 進行中
				if Song2 >=3 and Song4 >=3 then --達成Q14條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 3 ) --風鈴木之歌x3
					DelBodyItem( OwnerID() , 204126 , 3 ) --杜鵑花之歌x3
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542464 , 0 ) -- 刪玩家 Q14 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q15 == true then --Q15 進行中
				if Song2 >=3 and Song4 >=4 then --達成Q15條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 3 ) --風鈴木之歌x3
					DelBodyItem( OwnerID() , 204126 , 4 ) --杜鵑花之歌x4
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542465 , 0 ) -- 刪玩家 Q15 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q16 == true then --Q16 進行中
				if Song2 >=4 and Song4 >=2 then --達成Q16條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 4 ) --風鈴木之歌x4
					DelBodyItem( OwnerID() , 204126 , 2 ) --杜鵑花之歌x2
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542466 , 0 ) -- 刪玩家 Q16 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q17 == true then --Q17 進行中
				if Song2 >=4 and Song4 >=3 then --達成Q17條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 4 ) --風鈴木之歌x4
					DelBodyItem( OwnerID() , 204126 , 3 ) --杜鵑花之歌x3
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542467 , 0 ) -- 刪玩家 Q17 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			elseif Q18 == true then --Q18 進行中
				if Song2 >=4 and Song4 >=4 then --達成Q18條件物品
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--祝你春雨節快樂！ 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --櫻花夢境 法術集合編號 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --風鈴木夢境 法術集合編號 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --勿忘我夢境 法術集合編號 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --杜鵑花夢境 法術集合編號 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- 資源組合(3個)   
					DelBodyItem( OwnerID() , 204124 , 4 ) --風鈴木之歌x4
					DelBodyItem( OwnerID() , 204126 , 4 ) --杜鵑花之歌x4
					SetFlag( OwnerID()  , 542429 , 1 ) -- 給玩家 今天已完成過活動旗標
					SetFlag( OwnerID()  , 542468 , 0 ) -- 刪玩家 Q18 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- 你持有的物品數量不足喔！
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 
				end
			end
	elseif Q01 == false and Q02 == false and Q03 == false and Q04 == false and Q05 == false and Q06 == false and Q07 == false and Q08 == false and Q09 == false and Q10 == false and Q11 == false and Q12 == false and Q13 == false and Q14 == false and Q15 == false and Q16 == false and Q17 == false and Q18 == false then --如果未接過
		SetSpeakDetail(OwnerID(), "[SC_112502_NOSTART]" )-- 你還沒參加這個活動喔～！
		AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --回到上一頁 			
		
	end
end
--------------------------------------------------------------------------------------------------------------