function Lua_xmas_na_peco_NPCspeak()	--NPC 沛可．狄卡初始化SCRIPT
	local x = CheckFlag( OwnerID(), 543854 ) --幫助搜集冬月草
	local y = CheckFlag( OwnerID(), 543855 ) --幫助搜集槲寄生果實
	local z = CheckFlag( OwnerID(), 543856 )	--幫助搜集諾莎草
	local w = CheckFlag(OwnerID(), 543858 )	--馴鹿任務每日旗標
	local Lv = ReadRoleValue ( OwnerID(), EM_RoleValue_LV ) --檢查玩家等級
	LoadQuestOption( OwnerID())
--	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_PECO") )	--一年一度盛大的暖冬節又來臨了！忙碌的年末宣告著一年即將結束，卻也充滿許多歡樂與驚奇，讓我們共同歡度這個美好的節日吧！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("K_2008xmss_1_s9") , "Lua_xmas_na_background", 0 ) --我想知道暖冬節的由來
	if Lv < 53 then 	--玩家等級低於53，不顯示任務選項
		return false
	elseif w == true then 	--馴鹿每日旗標，不顯示任務選項
		return false
	elseif x or y or z ==true then	--已接任務，不顯示選項
		return false
	elseif CheckBuff( OwnerID() , 507897) ==TRUE and w == false then --檢查上一次任務完成旗標，36小時內必須再次完成
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_PECO_01"), "Lua_xmas_na_raindeer_adopt_yes", 0 )	--探望馴鹿
	else
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_PECO_02"), "Lua_xmas_na_raindeer_adopt", 0 )	--關於認養馴鹿
	end
end


function Lua_xmas_na_raindeer_adopt()	--認養馴鹿
	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_ADOPT") )	--為了延續節慶傳統，必爾汀商會準備培訓一批新的馴鹿，以便未來可以隨時接替無法工作的老馴鹿們。馴鹿的個性雖然溫和卻也十分膽小，所以最重要的是建立起馴鹿與人們之間的信賴，你是否願意協助認養一隻馴鹿，並且用心照顧牠呢？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_ADOPT_1"), "Lua_xmas_na_raindeer_adopt_yes", 0 )	--協助認養馴鹿
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_XMAS_NA_ADOPT_2"), "Lua_xmas_na_raindeer_adopt_no", 0 )	--我再考慮一下
end


function Lua_xmas_na_raindeer_adopt_yes()	--協助認養馴鹿
	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_ADOPT_YES") ) --只要你用心每天都來照顧牠們，相信你一定會獲得意想不到的回饋的。
	local random = rand(100)
--	say( OwnerID(), random)
	if random >=55  then  -- 45% 需求品為冬月草
		SetFlag( OwnerID(), 543854, 1)
	elseif random <=54 and random >=10  then --45%為槲寄生果實
		SetFlag( OwnerID(), 543855, 1)
	elseif random <=9 then			--10%為諾莎草
		SetFlag( OwnerID(), 543856, 1)  
	end
end


function Lua_xmas_na_background()--我想知道暖冬節的由來
	SetSpeakDetail( OwnerID(), GetString("K_2008XMSS_1_S10")   )--暖冬節
end


function Lua_xmas_na_raindeer_adopt_no()
	SetSpeakDetail( OwnerID(), GetString("SC_XMAS_NA_ADOPT_NO") ) --若你改變心意，隨時歡迎你來找我。
end


function Lua_xmas_na_dailycheck()	--檢查BUFF等級給予獎勵
--Owner = NPC
--Target = player
	local Target = TargetID()
	local BuffID = 507897
	local BuffLv = FN_CountBuffLevel( Target, BuffID )  
	BeginPlot( Target , "Lua_xmas_na_delkeyitem",0) --刪除糧草需求旗標
	SetFlag( Target , 543858,1 )
	local check = CheckBuff ( Target , 507897)
	if check == false then --第一天
		AddBuff(  Target, BuffID , 0 , 129600 )	--施放對象, buff編號, 法術等級, 有效時間	
		GiveBodyItem(  Target, 720293, 1)	--必爾汀藥水
	--	say (TargetID(), "1" )
	else
--檢查BUFF等級
--		say (TargetID(), BuffLv)
		if BuffLv == 5 then	--第七天
			GiveBodyItem( Target, 720614, 1 )	--造型暖冬樹家具
			CancelBuff(  Target, 507897)

		elseif BuffLv == 4 then	--第六天
			GiveBodyItem( Target , 208461 , 1 )	--7天薑餅人寵物蛋	
			AddBuff( Target, 507897 , 0 , 129600 )

		elseif BuffLv == 3 then	--第五天
			GiveBodyItem( Target, 207747 , 1 )	--7天銀行空間卷 - II	
			AddBuff( Target, 507897 , 0 , 129600 )

		elseif BuffLv == 2 then	--第四天
			GiveBodyItem( Target, 725519, 1 )	--7天馴鹿坐騎
			AddBuff( Target, 507897 , 0 , 129600 )


		elseif BuffLv == 1 then	--第三天
			GiveBodyItem( Target, 207961, 3 )	--暖冬派對變身糖X3
			AddBuff(  Target, 507897 , 0 , 129600 )

		elseif BuffLv == 0 then	--第二天
			GiveBodyItem( Target, 720289, 1 )	--煙火包
			AddBuff(  Target, 507897 , 0 , 129600 )

		end
	end
end


function Lua_xmas_na_delkeyitem() --刪除旗標
	SetFlag( OwnerID(), 543854,0)
	SetFlag( OwnerID(), 543855,0)
	SetFlag( OwnerID(), 543856,0)
end

--測試用
function Lua_xmas_na_delbuff()
	CancelBuff(  TargetID(), 507897)
end

function Lua_xmas_na_deldaily()
	SetFlag( OwnerID(), 543858,0 )
end


function Lua_xmas_na_debug()
	SetFlag( OwnerID(), 543854,0)
	SetFlag( OwnerID(), 543855,0)
	SetFlag( OwnerID(), 543856,0)
	SetFlag( OwnerID(), 543858,0)
--	BeginPlot( OwnerID(), "Lua_DailyQuest_CLS",0 )
	say( OwnerID(), "CLEAR")
end