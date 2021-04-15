function LuaYU_111813_00()
--小丑球舞
	LuaN_miyon_action01()
	while true do

		PlayMotion( OwnerID(), 123) 
		sleep(40)

	end
end


--中央廣場

function LuaYU_111813_0()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發
	local play =  CheckFlag( OwnerID()  , 542245 ) --今天已經來過
	local play02 =  CheckFlag( OwnerID()  , 542991 ) --瑪拉2  OK旗標


	local UseItem3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3)
	local Jokname =  CountBodyItem( OwnerID() , 530371 ) --稱號
	local Jokname1 =  CountBodyItem( OwnerID() , 530372 ) --稱號
	local Jokname2 =  CountBodyItem( OwnerID() , 530373 ) --稱號
	local RunTime = 0


	if UseItem3 >= 1 and Jokname == 0 then	
		GiveBodyItem( OwnerID() ,  530371  , 1 ) --稱號.
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_38]"   )--呦～唧唧唧唧～你真是厲害！居然勝利了！有膽識就再來挑戰吧！
--取得稱號顯示框
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530371]]" )
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				return 0
			end
			while true do
				Sleep( 10 )
				RunTime = RunTime + 1
				if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
				--	ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end

				DialogStatus = DialogGetResult( OwnerID() )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
				-- DO nothing
				elseif DialogStatus == 0 then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			end
		else		
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530371]]", "0xffffff00" );
			ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530371]]", "0xffffff00" );
		end
			--取得稱號顯示框(以上)

	elseif UseItem3 >= 30 and Jokname1 == 0 then	
		GiveBodyItem( OwnerID() ,  530372  , 1 ) --稱號.
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_40]"   )--呦～唧唧唧唧～你真是厲害！居然能全勝30次...你...真的很會挖喔！挑戰者！
		--取得稱號顯示框
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530372]]" )
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				return 0
			end
			while true do
				Sleep( 10 )
				RunTime = RunTime + 1
				if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
				--ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end

				DialogStatus = DialogGetResult( OwnerID() )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif DialogStatus == 0 then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			end
			--取得稱號顯示框(以上)
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530372]]", "0xffffff00" );
			ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530372]]", "0xffffff00" );
		end

	elseif UseItem3 >= 100 and Jokname2 == 0 then	
		GiveBodyItem( OwnerID() ,  530373  , 1 ) --稱號.
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_41]"   )--這不可能！你...你居然能全勝100次...你...其實是地鼠吧！？～唧唧唧唧～太厲害了！
--取得稱號顯示框
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530373]]" )
			DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
			if( DialogSendOpen( OwnerID() ) == false ) then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				return 0
			end
			while true do
				Sleep( 10 )
				RunTime = RunTime + 1
				if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
				--ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end

				DialogStatus = DialogGetResult( OwnerID() )
				--Say( PlayerID , DialogStatus )

				if DialogStatus == -2 then
					-- DO nothing
				elseif DialogStatus == 0 then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530373]]", "0xffffff00" );
			ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530373]]", "0xffffff00" );
		end

--取得稱號顯示框(以上)

	elseif Key >= 1 then

		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_00]"   )--呦～唧唧唧唧～我是瑪拉蒂娜，來自迷幻世界的迷幻小丑，為你準備了最迷幻的冒險挑戰，而且只要<CS>30個必爾汀代幣</CS>，就能參加！唧唧唧唧～你考慮清楚了嗎？...冒險者！？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_01]" , "LuaYU_111813_0_1", 0 ) --挑戰生存遊戲
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_02]" , "LuaYU_MalaTina2_01", 0 ) --挑戰奪寶遊戲

	elseif ( play == false ) or ( play02 == false ) then
		SetSpeakDetail( OwnerID(), "[SC_113120_MALA2_00]"    )--
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_01]" , "LuaYU_111813_0_1", 0 ) --挑戰生存遊戲
		AddSpeakOption( OwnerID(), TargetID(), "[SC_113120_MALA2_02]" , "LuaYU_MalaTina2_01", 0 ) --挑戰奪寶遊戲
	elseif ( play == true ) and ( play02 == true ) then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--呦～唧唧唧唧～是意猶未盡嗎？每人每天只有一次機會唷！明天再來吧！
	end


end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 生存遊戲
function LuaYU_111813_0_1()

	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發
	local play =  CheckFlag( OwnerID()  , 542245 ) --今天已經來過
	local UseItem3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem3)
	local Jokname =  CountBodyItem( OwnerID() , 530371 ) --稱號
	local Jokname1 =  CountBodyItem( OwnerID() , 530372 ) --稱號
	local Jokname2 =  CountBodyItem( OwnerID() , 530373 ) --稱號
	local RunTime = 0


	if Key >= 1 then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_01]"   )--呦～唧唧唧唧～你是...冒險者？唧唧唧唧～如果...你自認為...你是冒險者...那麼我想和你玩個遊戲...一個可以獲得一筆寶藏！...或者是...面對一個惡魔！...或者是...一個即將引爆的炸彈的挖寶遊戲！呦～唧唧唧唧～只要花費<CS>30個必爾汀代幣</CS>，就能參加，你考慮清楚了嗎？...冒險者！？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_111813_1", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_2", 0 ) --裝做沒聽到
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --回上一頁

	elseif  Jokname1 == 1 and play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]"   )--呦～唧唧唧唧～是意猶未盡嗎？每人每天只有一次機會唷！明天再來吧！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --回上一頁

	elseif  UseItem3 < 30 and play == true then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_34]".."[SC_111813_YU_39]"..UseItem3   )--呦～唧唧唧唧～是意猶未盡嗎？每人每天只有一次機會唷！明天再來吧！..噢！對了！如果你能順利挖掘完<CB>所有的地磚</CB>並<CB>開啟所有的寶箱</CB>超過<CS>30</CS>次，我將賦予你一個提昇潛能的頭銜！加油吧！你現在達成的次數是：

	elseif play == false then

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_01]"   )--呦～唧唧唧唧～你是...冒險者？真的是...冒險者？唧唧唧唧～如果...你自認為...你是冒險者...那麼我想和你玩個遊戲...唧唧唧唧...一個可以獲得一筆寶藏！...或者是...面對一個惡魔！...或者是...面對一個即將引爆的炸藥的遊戲！呦～唧唧唧唧～考慮清楚！冒險者應該要有做了冒險決定就無法回頭的覺悟～唧唧唧唧～你...想玩嗎？...冒險者！？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_111813_1", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_03]" , "LuaYU_111813_2", 0 ) --裝做沒聽到
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_111813_0", 0 ) --回上一頁

	end

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_1()
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --必爾汀代幣
	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發

	if Key >= 1 then
		BeginPlot( OwnerID() , "LuaYU_111813_4" , 0 )  
	elseif Cash >= 30 then
		BeginPlot( OwnerID() , "LuaYU_111813_4" , 0 )  
	else
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--你沒有足夠的必爾汀代幣
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_2()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_05]"   )  --呦～唧唧唧唧～沒關係，那一大筆財寶和珍貴的飾品就讓其他冒險者來拿好了～唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "LuaYU_111813_1", 0 ) --接受挑戰
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_06]" , "LuaYU_111813_3", 0 ) --無所謂
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_3()
	CloseSpeak( OwnerID() )                     
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_4()
	CloseSpeak( OwnerID() )      
	ScriptMessage( TargetID() , OwnerID() , 1 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) --呦～唧唧唧唧～果然有冒險者的勇氣呀～唧唧唧唧～等等你是會笑還是會哭呢？我迫不及待想看到了！唧唧唧唧～！
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .."[SC_111813_YU_04]".. "|r" , 0 ) --呦～唧唧唧唧～果然有冒險者的勇氣呀～唧唧唧唧～等等你是會笑還是會哭呢？我迫不及待想看到了！唧唧唧唧～！
	CastSpell( OwnerID(), OwnerID(), 491272)
	sleep(40)
	SetFlag( OwnerID(), 543270 , 0 ) --重置觸發範圍劇情  2012. 10.22
	-- 2013.08.30 阿浩:修正玩家於觸碰劇情施法條被卡住的情況下參加瑪拉蒂娜 - 生存遊戲，會無法執行觸碰地磚、寶箱等劇情的問題。
	Hao_SetPlot_Touch_Reset(OwnerID())
	--
	BeginPlot( OwnerID() , "LuaYU_111813_5" , 0 )  
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111813_5()
	if ChangeZone( OwnerID(), 351 , -1 , 2519, 9.2, 2593, 290) then   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),351," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	end
end


--副本內

function LuaYu_Mala1_reset01() -- 關閉範圍內玩家之計時器   副本內重置機制
	SetPlot( OwnerID() ,"range",  "LuaYu_Mala1_reset02" , 40 )  
end

function LuaYu_Mala1_reset02() 
	local OID = OwnerID()   -- player

	-- 2012 將此串劇情 移至2757

--	if CheckBuff(OID, 623459 )  == false then
--		if  CheckFlag( OID  , 543270 )  == false then	--今天第一次進副本   啟動重置機制。
--
--			lua_mika_2012hallow_delall()  -- 刪除所有物件
--			BeginPlot( OwnerID()  , "Lua_Clockending" , 0 )
--			SetFlag( OwnerID()  , 543270 , 1 ) --關閉重複觸發範圍劇情
--			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--			local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 300 , 1)       --大門
--			PlayMotion( door[0], 133) 
--			SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
--			WriteRoleValue( OwnerID() , EM_RoleValue_Register+8 , 0 )   --做記號，此人是否破關了   是：99
--		--	say(OwnerID(), "2")
--		end
--	end

end

-- 希爾喬克 初始對話劇情
function LuaYU_111814_0()
	local Key =  CountBodyItem( OwnerID() , 203477 )  --特殊劇情觸發
	local playOK =  CheckFlag( OwnerID()  , 542246 ) --挑戰決定
	local play =  CheckFlag( OwnerID()  , 542245 ) --今天已經來過
	local Cash =  CountBodyItem( OwnerID() , 203038 )  --必爾汀代幣

	----- 2012 南瓜節 瑪拉鬼屋專用 -----------------------------------
	local OID = OwnerID()
	local hallowbuff = CheckBuff(OID, 623459 )  -- 檢查玩家是否有萬聖節特殊活動Buff
	local skillbuff = CheckBuff(OID, 623504)  -- 特殊技能BUFF

	if skillbuff == True then
		SetSpeakDetail( OwnerID(), "[SC_111813_YU_35]"   ) --呦～唧唧唧唧～快點進去吧～勇敢的～冒險者～。
	elseif hallowbuff == true then
		SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_07]"   ) -- SPVer - 對話
		AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_08]" , "lua_mika_2012hallow_choc_01", 0 ) -- 規則說明   
		AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_09]" , "lua_mika_2012hallow_choc_02", 0 ) -- 準備完畢 
	else
	----------------------------------------------------------------
		if Key >= 1 then
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_07]"   ) --呦～唧唧唧唧～冒險者～歡迎來到...瑪拉蒂娜的...生存遊戲～呦～唧唧唧唧～。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_111814_1", 0 ) --規則說明
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_09]" , "LuaYU_111814_2", 0 ) --準備完畢
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --我要離開
		elseif playOK == true then
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_35]"   ) --呦～唧唧唧唧～快點進去吧～勇敢的～冒險者～。
		elseif Cash >= 30 then
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_07]"   ) --呦～唧唧唧唧～冒險者～歡迎來到...瑪拉蒂娜的...生存遊戲～呦～唧唧唧唧～。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_08]" , "LuaYU_111814_1", 0 ) --規則說明
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_09]" , "LuaYU_111814_2", 0 ) --準備完畢
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --我要離開
		else
			SetSpeakDetail( OwnerID(), "[SC_111813_YU_36]"   )--你沒有足夠的必爾汀代幣
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --我要離開
		end
	end


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_1()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_10_1]" ..  "[SC_111813_YU_10_2]"    )  --呦～唧唧唧唧～在這道大門後面有一個祕室，正中央的地磚裡埋藏了許許多多的驚喜！那也許是一筆橫財！也許是非常稀有的飾品！但...也可能是凶殘的惡魔！或者是...威力驚人的炸彈！噢！你只有15分鐘的探知的時間去試試你的冒險運氣！呦～唧唧唧唧～！對了，位於祕室的正中央有一根魔杖，每隔3分鐘，他會釋放詭異的光圈驅散侵入者，唧唧唧唧～你可要小心呀～還有...祕室的四個角落都有魔法陣，可以供你逃竄用～唧唧唧唧～祝你好運呀！
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_11]" , "LuaYU_111814_3", 0 ) --其他協議
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_09]" , "LuaYU_111814_2", 0 ) --準備完畢 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --我要離開
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_2()  --開啟大門有守衛先導* --Owner 玩家
	CloseSpeak( OwnerID() )  
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	local play =  CheckFlag( OwnerID()  , 542245 ) --今天已經來過

--	lua_mika_2012hallow_delall2()        -- 2012. 10. 19 加入刪除南瓜節鬼屋遊戲物件  

	ScriptMessage( TargetID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 ) --呦～唧唧唧唧～那麼就開始吧...瑪拉蒂娜的...生存遊戲～呦～唧唧唧唧～。
	ScriptMessage( TargetID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 ) 

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  )  
	WriteRoleValue( TargetID() , EM_RoleValue_PID , PlayerLV )   
	WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )   
	SetFlag( OwnerID()  , 542245 , 1 ) -- 重要物品
	SetFlag( OwnerID()  , 542246 , 1 ) -- 重要物品挑戰決定
	DelBodyItem( OwnerID() , 203038 , 30 )
	BeginPlot( TargetID() , "LuaYU_111814_2_1" , 0 )       --由NPC執行

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_4()  --開啟大門NO守衛先導* --Owner 玩家
	local goods =  CountBodyItem( OwnerID() , 201141 )  --201141
	local play =  CheckFlag( OwnerID()  , 542245 ) --今天已經來過

	if goods > 0 then
		CloseSpeak( OwnerID() )      
		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		local door = LuaFunc_SearchNPCbyOrgID( TargetID() , 101473, 100 , 1)       --大門

		DelBodyItem( OwnerID() , 201141 , 1 )
		Say( TargetID() , "[SC_111813_YU_32]"   )  --呦～唧唧唧唧～這個就是<CN>[201141]</CN>呀～你來喝看看好了～呦～唧唧唧唧～
		AddBuff( OwnerID() ,501389 ,1 ,7200 ); --喝救贖        

--		lua_mika_2012hallow_delall2()        -- 2012. 10. 19 加入刪除南瓜節鬼屋遊戲物件  

		ScriptMessage( TargetID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 ) --呦～唧唧唧唧～那麼就開始吧...瑪拉蒂娜的...生存遊戲～呦～唧唧唧唧～。
		ScriptMessage( TargetID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_14]".. "|r" , 0 )

		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  )  
		WriteRoleValue( TargetID() , EM_RoleValue_PID , PlayerLV )   
		WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )   
		SetFlag( OwnerID()  , 542245 , 1 ) -- 重要物品
		SetFlag( OwnerID()  , 542246 , 1 ) -- 重要物品挑戰決定
		DelBodyItem( OwnerID() , 203038 , 30 )
		BeginPlot( TargetID() , "LuaYU_111814_4_1" , 0 )        --由NPC執行
	else

		SetSpeakDetail( OwnerID(), "[SC_111813_YU_28]"   )  --呦～唧唧唧唧～好可惜呀，看來你身上沒有[201141]呢～！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_27]" , "LuaYU_111814_2", 0 ) --直接挑戰 
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_2_1()  --開啟大門有守衛*

  	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  	
  	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 100 , 1)       --大門

	local Jok = CreateObjByFlag( 113105, 780235, 21 , 1 );  --希爾喬克

	SetModeEx( Jok  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Jok  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Jok , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Jok  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Jok   , EM_SetModeType_Move, false )--移動
	SetModeEx( Jok  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Jok   , EM_SetModeType_HideName, true )--名稱
	SetModeEx( Jok , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Jok , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Jok  , EM_SetModeType_Show , false ) --不顯示
	AddToPartition( Jok, RoomID) 
	
	Hide(Jok)
	Show(Jok, RoomID)

	SetFightMode(  Jok , 0, 0, 0, 0 )

	BeginPlot( Jok , "LuaYU_111814_5" , 0 )       --倒數計時
	
 	local staff = CreateObjByFlag( 101472, 780235, 0 , 1 );  --魔杖

	SetModeEx( staff    , EM_SetModeType_Mark, false )--標記
	SetModeEx( staff    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( staff   , EM_SetModeType_ShowRoleHead, false )--頭像框
	AddToPartition( staff, RoomID) 
	SetFightMode(  staff , 0, 0, 0, 0 )

	WriteRoleValue( staff , EM_RoleValue_PID , PlayerLV )   
	WriteRoleValue( staff , EM_RoleValue_Register , Jok )   
	WriteRoleValue( staff , EM_RoleValue_Register+1 , PlayerID )   

	BeginPlot( staff , "LuaYU_101489_0" , 0 )       --生出地板
	BeginPlot( staff , "LuaYU_101489_1" , 0 )       --生出守衛
	BeginPlot( staff , "LuaYU_111815_end" , 0 )       --由NPC執行

	PlayMotion( door[0], 145) 
	sleep(10)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--阻擋
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_3()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_12]"   )  --呦～唧唧唧唧～我有個提議，一個幫你多爭取點時間的提議～唧唧唧唧～只要你給我一個[201141]我就幫你把祕室周圍惱人的守衛們撤除，你覺得怎麼樣？唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_13]" , "LuaYU_111814_4", 0 ) --達成協議
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_27]" , "LuaYU_111814_2", 0 ) --直接挑戰 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "LuaYU_111815_leave", 0 ) --我要離開
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111814_4_1() --開啟大門沒有守衛*

  		local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 100 , 1)       --大門


	 	local Jok = CreateObjByFlag( 113105, 780235, 21 , 1 );  --希爾喬克

		SetModeEx( Jok  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Jok  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Jok , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Jok  , EM_SetModeType_Mark, false )--標記
		SetModeEx( Jok   , EM_SetModeType_Move, false )--移動
		SetModeEx( Jok  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Jok   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Jok , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Jok , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Jok  , EM_SetModeType_Show , false ) --不顯示
		AddToPartition( Jok, RoomID) 

		Hide(Jok)
		Show(Jok, RoomID)

		SetFightMode(  Jok , 0, 0, 0, 0 )
		BeginPlot( Jok , "LuaYU_111814_5" , 0 )       --倒數計時

		local staff = CreateObjByFlag( 101472, 780235, 0 , 1 );  --魔杖

		SetModeEx( staff    , EM_SetModeType_Mark, false )--標記
		SetModeEx( staff    , EM_SetModeType_HideName, true )--名稱
		SetModeEx( staff   , EM_SetModeType_ShowRoleHead, false )--頭像框
		AddToPartition( staff, RoomID) 
		SetFightMode(  staff , 0, 0, 0, 0 )

		WriteRoleValue( staff , EM_RoleValue_PID , PlayerLV )   
		WriteRoleValue( staff , EM_RoleValue_Register , Jok )   
		WriteRoleValue( staff , EM_RoleValue_Register+1 , PlayerID )   

		BeginPlot( staff , "LuaYU_101489_0" , 0 )       --生出地板
		BeginPlot( staff , "LuaYU_111815_end" , 0 )       --由NPC執行

		PlayMotion( door[0], 145) 
		sleep(10)
		SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--阻擋
end

--  關門劇情

function LuaYU_111814_5()
                SetPlot( OwnerID(),"range", "LuaYU_111814_6" , 100 )                                      --設定劇情
end

function LuaYU_111814_6()
	--OwnerID() 玩家
	--TargetID() NPC

	SetPlot( TargetID(),"range","",100 )    
	WriteRoleValue( TargetID() , EM_RoleValue_PID , OwnerID() )   -- 將玩家寫入NPC 的PID
	BeginPlot( TargetID() , "LuaYU_111814_7" , 0 )
end

function LuaYU_111814_7()
--OwnerID() NPC

	local PlayerID = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 300 , 1)       --大門

	PlayMotion( door[0], 147) 
	sleep(10)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
	Hide( door[0] )
	Show( door[0] ,RoomID)

	AddBuff( PlayerID ,503693 ,1 , 1 ); --傳送特效
	SetPosByFlag( PlayerID , 780235 , 21 )--傳送到 X 號旗子

	ScriptMessage( OwnerID()  , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_15]".. "|r" , 0 ) --加油囉～冒險者～限時15分鐘～開始！唧唧唧唧～

	ClockOpen( PlayerID ,EM_ClockCheckValue_2,600,600,0,"Lua_Clockending","Lua_Clockending")  -- 開始計時器

	sleep(5990)
	local Pass = ReadRoleValue( PlayerID , EM_RoleValue_Register+8  )  --是否破關，是則值為 99
	-- 2013.08.30 阿浩:修正玩家於瑪拉蒂娜-生存遊戲時，在遊戲時間結束又還在執行觸碰劇情施法條的情況下被傳出遊戲後，會無法執行其他觸碰劇情的問題。
	Hao_SetPlot_Touch_Reset( PlayerID)
	--
	if Pass ~= 99 then
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --呦～唧唧唧唧～時間到出去吧！
		sleep(10)

		ChangeZone( PlayerID , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )

		local TIMEMAN = CreateObjByFlag( 100044, 780235, 0 , 1 );  --全殺物件
		AddToPartition( TIMEMAN, RoomID) 
	--	BeginPlot( TIMEMAN , "lua_mika_2012hallow_delall2" , 0 )       --重置

	end

end

--四個治癒座
function LuaYU_111815_1_1()
	SetPlot( OwnerID(),"range", "LuaYU_111815_1_2" , 10 )       
end

function LuaYU_111815_1_2()
	BeginPlot( TargetID() , "LuaYU_111815_1_3" , 0 )     
end

function LuaYU_111815_1_3()
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	ChangeZone( TargetID(), 351 , RoomID , 2392.6, 9.2, 2923.8, 339)

end

---------------------------------------------------------------------------
function LuaYU_111815_2_1()
	SetPlot( OwnerID(),"range", "LuaYU_111815_2_2" , 30 )         -- 6.0.1 Range 10改成30 
end

function LuaYU_111815_2_2()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--治癒
	sleep(50)
	BeginPlot( TargetID() , "LuaYU_111815_2_3" , 0 )
end

function LuaYU_111815_2_3()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--治癒
	sleep(50)
	BeginPlot( OwnerID() , "LuaYU_111815_2_2" , 0 )
end

---------------------------------------------------------------------------

function LuaYU_111815_3_1()
                SetPlot( OwnerID(),"range", "LuaYU_111815_3_2" , 30 )       
end

function LuaYU_111815_3_2()
	BeginPlot( TargetID() , "LuaYU_111815_3_3" , 0 )     
end

function LuaYU_111815_3_3()
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	ChangeZone( TargetID(), 351 , RoomID , 2656.4, 9.2, 2826.1, 248)
end

--------------------------------------------------------------------------------
function LuaYU_111815_4_1()
                SetPlot( OwnerID(),"range", "LuaYU_111815_4_2" , 30 )       
end

function LuaYU_111815_4_2()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--治癒
	sleep(50)
	BeginPlot( TargetID() , "LuaYU_111815_4_3" , 0 ) 
end

function LuaYU_111815_4_3()
	CastSpell( TargetID() ,  TargetID() , 492498 )	--治癒
	sleep(50)
	BeginPlot( OwnerID() , "LuaYU_111815_4_2" , 0 )
end
---------------------------------------------------------------------------------


--如果全部挖完
function LuaYU_111815_end()
  	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  )
	local Room = ReadRoleValue( PlayerID , EM_RoleValue_RoomID )

  	local Opeana = 0
  	local Opeanb = 0
  	local Opeanc = 0
  	local Opeand = 0
  	local Opeane = 0
  	local Opeanf = 0
  	local Opean = 0

	while true do
		sleep(10)

		local floor1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111811, 300 , 1)       --地磚1
		local floor2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111812, 300 , 1)       --地磚2
		local CashBox = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111956, 300 , 1)       --寶箱

		Opeana = 0
		Opeanb = 0
		Opeanc = 0
		Opeand = 0
		Opeane = 0
		Opeanf = 0

		for i=0, table.getn(floor1) do

			Opeana = ReadRoleValue( floor1[i] , EM_RoleValue_Register )  
			Opeanb = Opeanb + Opeana


		end

		for g=0, table.getn(floor2) do

			Opeand = ReadRoleValue( floor2[g] , EM_RoleValue_Register )  
			Opeanc = Opeanc + Opeand

		end

		for n=0, table.getn(CashBox) do

			Opeane = ReadRoleValue( CashBox[n] , EM_RoleValue_Register )  
			Opeanf = Opeanf + Opeane

		end

--		sleep(50)

		Opean = Opeanb + Opeanc + Opeanf

--		Say(  OwnerID() ,Opean )
--		Say(  TargetID() ,Opean )

		if Opean == 36 then
-------------------------------------------------2011.05.31 新增必爾汀圓貝獎勵-------------------------------------------------
-------------------------------------------------2013.03.13 將必爾汀圓貝由物品變更為角色資料欄位-------------------------------------------------
			local EndBonus = 30	-- 此次給予的必爾汀圓貝數量
			local PlayerLv = ReadRoleValue( PlayerID , EM_RoleValue_LV )
			if PlayerLv >= 50 then
				Hao_Monetary_Union_240181( PlayerID , EndBonus )
			end
---------------------------------------------------------------------------------------------------------------------------------
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 ) --呦～唧唧唧唧～真是厲害呀！居然能夠全部挖開了！所謂強者就是如此吧！再見了！
			ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 ) --
			AddRoleValue( PlayerID , EM_LuaValueFlag_UseItem3 , 1 )
			GiveBodyItem( PlayerID , 203487 , 1 )--魔幻寶盒能量1點
			WriteRoleValue( PlayerID , EM_RoleValue_Register+8 , 99 )   --做記號，此人破關了
-------------------------------------------------2011.08.22 新增稱號給予判斷-----------------------------------------------
			local UseItem3 = ReadRoleValue( PlayerID , EM_LuaValueFlag_UseItem3 )
			local TitleKey = CountBodyItem( PlayerID , 530086 )
			if UseItem3 >= 150 and TitleKey < 1 then
				DebugMsg( PlayerID , Room , " UseItem3 = "..UseItem3.." , TitleKey = "..TitleKey.." , Get new title")
				GiveBodyItem( PlayerID , 530086 , 1 )
			else
				DebugMsg( PlayerID , Room , "You already have the title.")
			end
---------------------------------------------------------------------------------------------------------------------------------
			sleep(50)
			BeginPlot(  PlayerID  , "LuaYU_111815_end2" , 0 )  
			break

		end
	end
end

function LuaYU_111815_end2()
	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )  
	ChangeZone( OwnerID() , 2 , 0 , 4871.9, 104.9, -1885.2, 92)
end

function LuaYU_111815_leave()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_43]"   )  --你真的確定要離開？那好吧？隨時歡迎你再來挑戰！唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "LuaYU_111815_leaveOK", 0 ) --確定
end

function LuaYU_111815_leaveOK()
	CloseSpeak( OwnerID() )
	ChangeZone( OwnerID() , 2 , 0 , 4871.9, 104.9, -1885.2, 92)
end

function Lua_Hao_Test_UseItem3(Num)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = ReadRoleValue( Player , EM_LuaValueFlag_UseItem3 )
	WriteRoleValue( Player , EM_LuaValueFlag_UseItem3 , Num )
	local NewCount = ReadRoleValue( Player , EM_LuaValueFlag_UseItem3 )
	DebugMsg( Player , Room , " Count = "..Count.." NewCount = "..NewCount )
	DelBodyItem( Player , 530086 , 1 )
end