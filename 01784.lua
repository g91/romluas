Function LuaI_207049() --7天背包禮盒

	local RoleName = GetName( OwnerID() )
	local itemset  = {	25 , "" , { 205547 , 1 } ,		-- 7天背包空間卷 - III	機率	25 / 100
				50 , "" , { 205548 , 1 } ,		-- 7天背包空間卷 - IV	機率	50 / 100
				75 , "" , { 205549 , 1 } ,	       	-- 7天背包空間卷 - V	機率	75 / 100
				100 , ""	, { 205550 , 1 }	}	-- 7天背包空間卷 - VI	機率	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207050() --30天背包禮盒

	local RoleName = GetName( OwnerID() )
	local itemset  = {	25 , "" , { 205525 , 1 } ,		-- 30天背包空間卷 - III	機率	25 / 100
				50 , "" , { 205526 , 1 } ,		-- 30天背包空間卷 - IV	機率	50 / 100
				75 , "" , { 205527 , 1 } ,	       	-- 30天背包空間卷 - V	機率	75 / 100
				100 , "" , { 205541 , 1 }	}	-- 30天背包空間卷 - VI	機率	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207219() -- 溫馨願望禮盒 Day 1

	local RoleName = GetName( OwnerID() )
	local itemset  = {	20 , "" , { 207058 , 1 } ,		-- 公會資源組合包	機率	20 / 100
				40 , "" , { 202903 , 3 } ,		-- 傳送者符文*3		機率	40 / 100
				55 , "" , { 201610 , 1 } ,	       	-- 技能藥劑		機率	55 / 100
				70 , "" , { 203487 , 3 } ,		-- 魔幻寶盒能量*3	機率	70 / 100
				80 , "" , { 201607 , 1 } ,		-- 融合核心		機率	80 / 100
				90 , "" , { 202434 , 1 } ,	       	-- 每日任務重置券	機率	90 / 100
				95 , "" , { 207049 , 1 } ,		-- 7天背包禮盒		機率	95 / 100
				100 , "" , { 203591 , 1 }	}	-- 7天小型駕馭藥劑	機率	100 / 100

	return BaseTressureProc5(   itemset , 1  )

--[SC_SHOP_BAG_OPEN_ODDS][207058]、[202903]3個、[201610]、[203487]3個、[201607]、[202434]、[207049]、[203591]。


end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207220() -- 幸福笑容禮盒 Day 2

	local RoleName = GetName( OwnerID() )
	local itemset  = {	20 , "" , { 207058 , 1 } ,		-- 公會資源組合包	機率	20 / 100
				30 , "" , { 202903 , 5 } ,		-- 傳送者符文*5		機率	30 / 100
				40 , "" , { 201610 , 1 } ,	       	-- 技能藥劑		機率	40 / 100
				50 , "" , { 203487 , 5 } ,		-- 魔幻寶盒能量*5	機率	50 / 100
				60 , "" , { 201607 , 1 } ,		-- 融合核心		機率	60 / 100
				70 , "" , { 202434 , 1 } ,	       	-- 每日任務重置券	機率	70 / 100
				80 , "" , { 202520 , 1 } ,		-- 解除綁定		機率	80 / 100
				85 , "" , { 203525 , 1 } ,	       	-- 神賜贖罪券		機率	85 / 100
				90 , "" , { 207049 , 1 } ,		-- 7天背包禮盒		機率	90 / 100
				95 , "" , { 203591 , 1 } ,		-- 7天小型駕馭藥劑	機率	95 / 100
				100 , "" , { 202881 , 1 }	}	-- 無暇熔解石		機率	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end

--<SC_SHOP_BAG_OPEN_ODDS_查無資料>公會資源組合包、傳送者符文5個、技能藥劑、魔幻寶盒能量1點5個、融合核心、每日任務重置券、解除綁定、神賜贖罪券、7天背包禮盒、7天小型駕馭藥劑、無瑕熔解石。

--[SC_SHOP_BAG_OPEN_ODDS][207058]、[202903]5個、[201610]、[203487]5個、[201607]、[202434]、[202520]、[203525]、[207049]、[203591]、[202881]。

----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207221() -- 每滿家庭禮盒 Day 3

	local RoleName = GetName( OwnerID() )
--	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206997]][$SETVAR3=[201130]]" 
--	恭喜 |cffff00ff[$VAR1]|r 從[$VAR2]抽到[$VAR3]！
	local itemset  = {	10 , "" , { 207058 , 1 } ,		-- 公會資源組合包	機率	10 / 100
				20 , "" , { 202903 , 5 } ,		-- 傳送者符文*5		機率	20 / 100
				30 , "" , { 201610 , 1 } ,	       	-- 技能藥劑		機率	30 / 100
				40 , "" , { 203577 , 1 } ,		-- 魔幻寶盒能量*10	機率	40 / 100
				50 , "" , { 201607 , 1 } ,		-- 融合核心		機率	50 / 100
				60 , "" , { 202434 , 1 } ,	       	-- 每日任務重置券	機率	60 / 100
				70 , "" , { 202520 , 1 } ,		-- 解除綁定		機率	70 / 100
				80 , "" , { 203525 , 1 } ,	       	-- 神賜贖罪券		機率	80 / 100
				85 , "" , { 207049 , 1 } ,		-- 7天背包禮盒		機率	85 / 100
				90 , "" , { 202669 , 1 } ,		-- 7天駕馭藥劑		機率	90 / 100
				95 , "" , { 202881 , 1 } ,		-- 無暇熔解石		機率	95 / 100
				100 , "" , { 206294 , 1 }	}	-- 7天雪貂坐騎包	機率	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end

--[SC_SHOP_BAG_OPEN_ODDS][207058]、[202903]5個、[201610]、[203577]、[201607]、[202434]、[202520]、[203525]、[207049]、[202669]、[202881]、[206294]。

----------------------------------------------------------------------------------------------------------------------------------------------
function BaseTressureProc5(   itemset  , maxprizecount )

	local RandValue = rand(100)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域

	for i = 1 , table.getn( itemset ) , 3 do
		if RandValue < itemset [i] then		
			--檢查是否夠欄位			
			if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
				return false
			end
			for j = 1 , table.getn( itemset[i+2] ) , 2 do
				GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
			end
			if itemset[i+1] ~= "" then
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
			--		RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			end
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family() -- 依照Buff堆疊去判斷。 -- 未使用

	local BuffLv , BuffNumber
	local Count = BuffCount ( OwnerID())

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 506601 then -- 韓國家庭月
			BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			BuffNumber = BuffLv
			Say( OwnerID() , BuffLv )
			Say( OwnerID() , BuffNumber )
		else
			Addbuff( OwnerID() , 506601 , 0 , -1 )
			return false
		end
	end

	if BuffNumber <= 2 then
			AddBuff( OwnerID() , 506601 , BuffNumber + 1 , -1 )
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_01() -- 執行Script後，再給予任務。 -- 未使用

--	Say( TargetID() , "1" )	-- 玩家
--	Say( OwnerID() , "2" )	-- NPC

--	LoadQuestOption( TargetID() )  --載入任務模板
	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 106 )
	Sleep(20)
	PlayMotion( OwnerID() , 254 )

end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_02() -- 完成任務後，再執行的Script。

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 102 )

--	Say( TargetID() , "1" )	-- 玩家
--	Say( OwnerID() , "2" )	-- NPC

	SetFlag( TargetID() , 543956 , 0 ) -- 刪除任務Key
	SetFlag( TargetID() , 543957 , 0 ) -- 刪除任務進行中
	SetFlag( TargetID() , 543958 , 1 ) -- 給予當日已領取禮包旗標

	if CheckBuff( TargetID() , 506601 ) == true then
		CancelBuff( TargetID() , 506601 )
		AddBuff( TargetID() , 506602 , 0 , -1 ) -- 尋找幸福
		GiveBodyItem( TargetID() , 207219 , 1 ) -- 溫馨願望禮盒
		GiveBodyItem( TargetID() , 207220 , 1 ) -- 幸福笑容禮盒
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_05]" )
		--當幸福來訪，別忘了微笑面對，也許接下來還要再麻煩你呢。
	elseif CheckBuff( TargetID() , 506602 ) == true then
		CancelBuff( TargetID() , 506602 )
		AddBuff( TargetID() , 506603 , 0 , -1 ) -- 美滿家庭
		GiveBodyItem( TargetID() , 207219 , 1 ) -- 溫馨願望禮盒
		GiveBodyItem( TargetID() , 207220 , 1 ) -- 幸福笑容禮盒
		GiveBodyItem( TargetID() , 207221 , 1 ) -- 美滿家庭禮盒
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_06]" )
		--美滿的家庭，是成功的基石，之前這些話，其實都是我的家人教導我的，希望你也會喜歡。
	elseif CheckBuff( TargetID() , 506603 ) == true then
		AddBuff( TargetID() , 506603 , 0 , -1 ) -- 美滿家庭
		GiveBodyItem( TargetID() , 207219 , 1 ) -- 溫馨願望禮盒
		GiveBodyItem( TargetID() , 207220 , 1 ) -- 幸福笑容禮盒
		GiveBodyItem( TargetID() , 207221 , 1 ) -- 美滿家庭禮盒
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_07]" )
		--除了你真棒之外，我還能說些什麼？
	else
		AddBuff( TargetID() , 506601 , 0 , -1 ) -- 尋找願望
		GiveBodyItem( TargetID() , 207219 , 1 ) -- 溫馨願望禮盒
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_04]" )
		--唯有滿懷希望，才能擁抱夢想，繼續保持下去，你的毅力會帶來更大的收穫。
	end
	--[SC_KOREA_FAMILY_08]
	--說不定，接下來還有什麼好事，誰知道呢？
	Sleep(20)
	PlayMotion( OwnerID() , 251 )

end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00() -- 當天未接任務過 可看到此選項

--	Say( OwnerID() , "1" ) -- 玩家
--	Say( TargetID() , "2" ) -- NPC

	BeginPlot( TargetID() , "Lua_Hao_Korea_Family_00_4" , 0 ) -- 距離超過50即關閉對話視窗

	local Key = Checkflag(OwnerID() , 543956 ) 	-- 任務Key
	local Accept = Checkflag(OwnerID() , 543957 ) 	-- 任務進行中
	local Over = Checkflag(OwnerID() , 543958 ) 	-- 任務完成
	if Over == true then
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 112 ) -- 比劃
		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) -- 你今天已經完成了這個任務，請你明天再來吧。
	else
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		if Key == true then -- 任務Key，可挑戰時才載入
			PlayMotion( TargetID() , 106 ) -- 點頭
			LoadQuestOption(OwnerID())  --載入任務模板
			AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_03]" ,  "Lua_Hao_Korea_Family_00_0",  0 ) -- 我該去哪才能取得[207222]呢？
			AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_09]" ,  "Lua_Hao_Korea_Family_00_3",  0 ) -- 所謂的小禮物是什麼呢？
		else -- 任務Key，不可挑戰
			if Accept == false then -- 未領到任務進行中的Key
				PlayMotion( TargetID() , 105 ) -- 哭
				SetSpeakDetail( OwnerID() , "[SC_KOREA_FAMILY_00]" ) -- [SC_KOREA_FAMILY_00] 這位先生看起來很苦惱的樣子...
				AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_01]" ,  "Lua_Hao_Korea_Family_00_1",  0 ) -- 請問，有什麼我能夠幫得上忙的地方嗎？
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_0() -- 選項 我該去哪才能取得[207222]呢？

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_007]" ) --只要擊倒與你的主職等級相近的怪物，就有機會於拾取物品時取得。
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_Korea_Family_00", 0 ) --回到上一頁
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_1() --選項  請問，有什麼我能夠幫得上忙的地方？

--	Say( OwnerID() , "02 = 1" ) -- 玩家
--	Say( TargetID() , "02 = 2" ) -- NPC
	CloseSpeak( OwnerID() )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 106 ) -- 點頭
	Setflag( OwnerID() , 543956 , 1 ) -- 任務Key 
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_03]" ,  "Lua_Hao_Korea_Family_00_0",  0 ) -- 我該去哪才能取得[207222]呢？
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_09]" ,  "Lua_Hao_Korea_Family_00_3",  0 ) -- 所謂的小禮物是什麼呢？
	LoadQuestOption( OwnerID() )  --載入任務模板
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_2() --接受任務後，再執行的Script。

--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- 玩家
	AdjustFaceDir( OwnerID() , TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 106 ) -- 點頭
	Setflag( TargetID() , 543957, 1 ) -- 任務進行中
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_3() --選項 所謂的小禮物是什麼呢？

--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- 玩家
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	SetSpeakDetail( OwnerID() , "[SC_KOREA_FAMILY_10]" ) --噓！千萬別跟人說歐，其實...這是不能說的秘密！
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_Korea_Family_00", 0 ) --回到上一頁
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_4() -- 距離超過50即關閉對話視窗

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --玩家

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )

			if CheckAcceptQuest( TargetID(), 423078 ) == true then
				tell( TargetID() , OwnerID() ,"[SC_YU_NEWPLAYERGO_16]" ) --　那麼，一切就拜託你了。
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- 面向
				PlayMotion( OwnerID() , 103 ) -- 舉臂
				break
			else
				tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_11]" ) --　嗚...嗚！哪邊有好心人願意幫忙呢？
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
				PlayMotion( OwnerID() , 113 ) -- 崩潰
				break
			end
		end
		sleep(5)
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_CLS() -- 清除家庭月任務 - 愛是永恆

	if CheckFlag( OwnerID() , 543958 ) == true then
		SetFlag( OwnerID() , 543958 , 0 ) -- 清除當日已領取禮包旗標
		PlayMotion( OwnerID() , 103 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KOREA_FAMILY_12]" , C_SYSTEM )	--清除任務 - 愛是永恆 成功！
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KOREA_FAMILY_13]" , C_SYSTEM )	--今日尚未完成此任務，你還不能這樣做。
		return false
	end
end