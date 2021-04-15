function Lua_Hao_Germany_1year_01() -- 當天未接任務過 可看到此選項
--	Say( OwnerID() , "1" ) -- 玩家
--	Say( TargetID() , "2" ) -- NPC

--	local Key = Checkflag(OwnerID(), 543639 ) -- 德國一周年 任務Key 沒Key進不來。
--	local Accept = Checkflag(OwnerID(), 543641 ) -- 德國一周年 任務進行中。
--	local Over = Checkflag(OwnerID(), 543638 ) -- 德國一周年 任務完成。
--	local Key = Checkflag(OwnerID(), 544690 ) -- 德國青蛙二週年  任務Key 沒Key進不來。
--	local Accept = Checkflag(OwnerID(), 544691 ) -- 德國青蛙二週年  任務進行中。
--	local Over = Checkflag(OwnerID(), 544689 ) -- 德國青蛙二週年 任務完成。
	local Key = CheckFlag( OwnerID() , 546219 ) -- 德國三週年 青蛙活動 任務Key
	local Accept = CheckFlag( OwnerID() , 546220 ) -- 德國三週年 青蛙活動 任務進行中
	local Over = CheckFlag( OwnerID() , 546221 ) -- 德國三週年 青蛙活動 今日已完成

	if Over == true then
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 112 )
		SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_16]" ) -- 你今天已經完成了這個任務，請你明天再來吧。
	else
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 106 )
		if Key == true then -- 任務Key，可挑戰時才載入
			LoadQuestOption(OwnerID())  --載入任務模板
		else -- 任務Key，不可挑戰
			if Accept == false then -- 未領到任務進行中的Key
				SetSpeakDetail( OwnerID(), "[SC_GERMANY_1YEAR_00]" ) -- 你想了解更多關於週年慶的事情嗎？
				AddSpeakOption(  OwnerID(), TargetID( ), "[SC_GERMANY_1YEAR_01]" ,  "Lua_Hao_Germany_1year_02",  0 ); -- 是的，我當然想。
			else 
				SetSpeakDetail( OwnerID(), "[SC_GERMANY_1YEAR_02]" ) -- 希望大家都能喜歡這個活動。
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_02() --選項  是的，我當然想。
--	Say( OwnerID() , "02 = 1" ) -- 玩家
--	Say( TargetID() , "02 = 2" ) -- NPC
	CloseSpeak(OwnerID())
	sleep(10)
	tell(OwnerID() , TargetID() , "[SC_GERMANY_1YEAR_03]" )   -- 我想你一定會喜歡這個活動的。
--	Setflag(OwnerID() , 543639 , 1 ) -- 德國一周年 任務Key 
--	Setflag(OwnerID() , 544690 , 1 ) -- 德國二週年 青蛙活動 任務Key 
	SetFlag( OwnerID() , 546219 , 1 ) -- 德國三週年 青蛙活動 任務Key
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_03() --接下任務時 掛questflag 
--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- 玩家
--	Setflag( TargetID() , 543641, 1) -- 德國一周年 任務進行中
--	Setflag( TargetID() , 544691, 1) -- 德國二週年 青蛙活動 任務進行中
	SetFlag( TargetID() , 546220 , 1 ) -- 德國三週年 青蛙活動 任務進行中
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_Gifts()
--	Say( OwnerID() , "1" ) -- NPC
--	Say( TargetID() , "2" ) -- 玩家
--	local Random = Rand(100)

	local Language = GetServerDataLanguage()	--抓取目前server的語系
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local Items = { }

--	Say( TargetID() , month.."/"..day.."/"..hour.."/"..min ) 

	if Language == "jp" then		-- 日本 一周年慶活動
		Items = {	{ 16 , 201134 , 1 } ,		-- 經驗藥劑
				{ 17 , 203525 , 1 } ,		-- 神賜贖罪券
				{ 18 , 201610 , 1 } ,		-- 技能藥劑
				{ 19 , 201141 , 1 } ,		-- 菲尼克斯的救贖
				{ 20 , 201139 , 1 }	}	-- 大天使的嘆息
		local JudgeDay = 0
	--	Tell(TargetID(),TargetID(),month.."/"..day.." "..hour..":"..min)
	--	Say( TargetID() , Random ) 
		if month == 9 then
			for i = 1,table.getn(Items) do
				if Items[i][1] == day then
					if (hour >=00 and min >=0) then
						if CheckFlag( TargetID()  , 546221 ) ~= true then	-- 德國青蛙活動 - 任務完成
						--	SetFlag( TargetID() , 544690 , 0 ) -- 德國青蛙活動 刪除任務Key
						--	SetFlag( TargetID() , 544691 , 0 ) -- 德國青蛙活動 刪除任務進行中
						--	SetFlag( TargetID() , 544689 , 1 ) -- 德國青蛙活動 任務完成
							SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
							SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
							SetFlag( TargetID() , 546221 , 1 ) -- 德國三週年 青蛙活動 今日已完成
							GiveBodyItem(TargetID(),Items[i][2],Items[i][3])
	--						if Random < 10 then -- 0 ~ 9
							GiveBodyItem( TargetID() , 207008 , 1 )
							AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
							PlayMotion( OwnerID() , 102 )
							JudgeDay = 1
						else
							Say( OwnerID() , "[SC_XMAS_OPENNOFLAG]" )	-- 這個禮物，你今天已經拿到過了。
						end
					end
				end
			end
			if JudgeDay == 0 then
			--	Say( OwnerID() , " The non-active time , Activity time is 9/16 ~ 9/20. " )	--非活動時間，活動時間為 9/16 ~ 9/20 號。
			--	Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--活動時間為 11/19 15:00 ~ 11/22 11:00，請您耐心等待活動開放。
			--	SetFlag( TargetID() , 543639 , 0 ) -- 德國一周年 刪除任務Key
			--	SetFlag( TargetID() , 543641 , 0 ) -- 德國一周年 刪除任務進行中
			--	SetFlag( TargetID() , 543638 , 1 ) -- 德國一周年 任務完成
				SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
				SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
				SetFlag( TargetID() , 546221 , 1 ) -- 德國三週年 青蛙活動 今日已完成
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
				PlayMotion( OwnerID() , 107 )
				GiveBodyItem( TargetID() , 207007 , 50 )
			end
		end
	else
		if Language == "ru" then		-- Russia 一周年慶活動，2012.01.17 ru 的語系也是 eneu，為了三週年暫時改為 ru ... 修改方便 -_-lll
			Items = {	{ 26, 202322, 1 , 5 },	--高效幸運藥劑
					{ 27, 201134, 1 , 5 },	--經驗藥劑
					{ 28, 203525, 1 , 5 },	--神賜贖罪券
					{ 29, 201610, 1 , 5 },	--技能藥劑
					{ 30, 201141, 1 , 5 },	--菲尼克斯的救贖
					{ 31, 201139, 1 , 5 },	--大天使的嘆息
					{ 1, 202928, 1 , 6 } }	-- 魔幻寶盒能量10點 (4.0.8) 移除房屋能量, 修改為 202928 魔幻寶盒能量10點
		else
			Items = {	{ 19 , 202322 , 1 },	--高效幸運藥劑
					{ 20 , 201134 , 1 },	--經驗藥劑
					{ 21 , 203525 , 1 },	--神賜贖罪券
					{ 22 , 201610 , 1 },	--技能藥劑
					{ 23 , 201141 , 1 },	--菲尼克斯的救贖
					{ 24 , 201139 , 1 },	--大天使的嘆息
					{ 25 , 202928 , 1 } }	--魔幻寶盒能量10點 (4.0.8) 移除房屋能量, 修改為 202928 魔幻寶盒能量10點
		end

	--	local Items = {	{ 3 , 203066 , 1 } ,	-- 10000點技能球
	--			{ 4 , 203066 , 1 } ,	-- 10000點技能球
	--			{ 5 , 203066 , 1 } ,	-- 10000點技能球
	--			{ 6 , 203066 , 1 }	}	-- 10000點技能球

		local JudgeDay = 0
	--	Tell(TargetID(),TargetID(),month.."/"..day.." "..hour..":"..min)
	--	Say( TargetID() , Random ) 
	--	if month == 12 then
		if Language == "ru" then		-- Russia 一周年慶活動
			for i = 1,table.getn(Items) do
				if Items[i][4] == month then
					if Items[i][1] == day then
						if ( hour >=00 and min >=0 ) then
							if CheckFlag( TargetID()  , 546221 ) ~= true then	-- 德國青蛙活動 - 任務完成
							--	SetFlag( TargetID() , 544690 , 0 ) -- 德國青蛙活動 刪除任務Key
							--	SetFlag( TargetID() , 544691 , 0 ) -- 德國青蛙活動 刪除任務進行中
							--	SetFlag( TargetID() , 544689 , 1 ) -- 德國青蛙活動 任務完成
								SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
								SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
								SetFlag( TargetID() , 546221 , 1 ) -- 德國三週年 青蛙活動 今日已完成
								GiveBodyItem(TargetID(),Items[i][2],Items[i][3])
							--	if Random < 10 then  -- 0 ~ 9
								GiveBodyItem( TargetID() , 207008 , 1 )
								AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
								PlayMotion( OwnerID() , 102 )
								JudgeDay = 1
							else
								Say( OwnerID() , "[SC_XMAS_OPENNOFLAG]" )	-- 這個禮物，你今天已經拿到過了。
								JudgeDay = 1
							end
						end
					end
				end
			end
			if JudgeDay == 0 then
				Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--活動時間為 3/15 ~ 3/19，請您耐心等待活動開放。
			--	SetFlag( TargetID() , 544690 , 0 ) -- 德國二週年 青蛙活動 刪除任務Key
			--	SetFlag( TargetID() , 544691 , 0 ) -- 德國二週年 青蛙活動 刪除任務進行中
				SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
				SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
				PlayMotion( OwnerID() , 107 )
				GiveBodyItem( TargetID() , 207007 , 50 )
			end
		else
			if month == 3 or month == 2 then	-- 2012.02.21 配合測試科將 2 月加入條件
				for i = 1,table.getn(Items) do
					if Items[i][1] == day then
					--	if day == 3 and hour < 15 then
					--		JudgeDay = 0
						if ( day == 19 and hour == 0 and min == 0 ) or month == 2 then	-- 2012.02.21 配合測試科將 2 月加入條件
							JudgeDay = 0
						else
						--	if CheckFlag( TargetID()  , 543638) ~= true then	-- 德國一周年 - 任務完成
						--	if CheckFlag( TargetID()  , 544689) ~= true then	-- 德國二週年 青蛙活動 - 任務完成
							if CheckFlag( TargetID()  , 544221) ~= true then	-- 德國三週年 青蛙活動 - 任務完成
						--		SetFlag( TargetID() , 543639 , 0 ) -- 德國一周年 刪除任務Key
						--		SetFlag( TargetID() , 543641 , 0 ) -- 德國一周年 刪除任務進行中
						--		SetFlag( TargetID() , 543638 , 1 ) -- 德國一周年 任務完成
						--		SetFlag( TargetID() , 544690 , 0 ) -- 德國二週年 青蛙活動 刪除任務Key
						--		SetFlag( TargetID() , 544691 , 0 ) -- 德國二週年 青蛙活動 刪除任務進行中
						--		SetFlag( TargetID() , 544689 , 1 ) -- 德國二週年 青蛙活動 任務完成
								SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
								SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
								SetFlag( TargetID() , 546221 , 1 ) -- 德國三週年 青蛙活動 今日已完成
								GiveBodyItem(TargetID(),Items[i][2],Items[i][3])
						--		if Random < 10 then  -- 0 ~ 9
								GiveBodyItem( TargetID() , 207008 , 1 )
								AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
								PlayMotion( OwnerID() , 102 )
								JudgeDay = 1
							else
								Say( OwnerID() , "[SC_XMAS_OPENNOFLAG]" )	-- 這個禮物，你今天已經拿到過了。
								JudgeDay = 1
							end
						end
					end
				end
				if JudgeDay == 0 then
				--	Say( OwnerID() , " The non-active time , Activity time is 3/15 ~ 3/19. " )	--非活動時間，活動時間為 3/15 ~ 3/19 號。
				--	Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--活動時間為 11/19 15:00 ~ 11/22 11:00，請您耐心等待活動開放。
					Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--活動時間為 3/15 ~ 3/19，請您耐心等待活動開放。
				--	Say( OwnerID() , " The non-active time , Activity time is 11/19 15:00 ~ 11/22 11:00" )	--活動時間為 11/19 15:00 ~ 11/22 11:00，請您耐心等待活動開放。 
				--	SetFlag( TargetID() , 543639 , 0 ) -- 德國一周年 刪除任務Key
				--	SetFlag( TargetID() , 543641 , 0 ) -- 德國一周年 刪除任務進行中
				--	SetFlag( TargetID() , 543638 , 1 ) -- 德國一周年 任務完成
				--	SetFlag( TargetID() , 544690 , 0 ) -- 德國二週年 青蛙活動 刪除任務Key
				--	SetFlag( TargetID() , 544691 , 0 ) -- 德國二週年 青蛙活動 刪除任務進行中
					SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
					SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
				--	SetFlag( TargetID() , 544689 , 1 ) -- 德國青蛙活動 任務完成
					AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
					PlayMotion( OwnerID() , 107 )
					GiveBodyItem( TargetID() , 207007 , 50 )
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_Delkeyitem()
--	SetFlag( TargetID() , 543639 , 0 ) -- 德國一周年 刪除任務Key
--	SetFlag( TargetID() , 543641 , 0 ) -- 德國一周年 刪除任務進行中
--	SetFlag( TargetID() , 543638 , 0 ) -- 德國一周年 刪除今日已完成
--	SetFlag( TargetID() , 544690 , 0 ) -- 德國二週年 青蛙活動 刪除任務Key
--	SetFlag( TargetID() , 544691 , 0 ) -- 德國二週年 青蛙活動 刪除任務進行中
--	SetFlag( TargetID() , 544689 , 0 ) -- 德國二週年 青蛙活動 刪除今日已完成
	SetFlag( TargetID() , 546219 , 0 ) -- 德國三週年 青蛙活動 刪除任務Key
	SetFlag( TargetID() , 546220 , 0 ) -- 德國三週年 青蛙活動 刪除任務進行中
	SetFlag( TargetID() , 546221 , 0 ) -- 德國三週年 青蛙活動 刪除今日已完成
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_System_Time()

	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)

	Tell( OwnerID() , OwnerID() , month.."/"..day.." "..hour..":"..min )  -- 報出時間
end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_206997() --德國一週年慶驚喜蛋

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206997]][$SETVAR3=[201130]]" -- 206997 = 蛋 201130 = 永久雪貂坐騎

	local itemset  = {	1 , Prize1Str 	, { 201130 , 1 }		-- 永久雪貂坐騎		201130 機率	1 / 10000
				, 300 ,""	, { 202434 , 3 }		-- 每日任務重置券*3	202434 機率	299 / 10000
				, 800 ,""	, { 202434 , 1 } 	       	-- 每日任務重置券*1	202434 機率      500 / 10000
				, 1300 ,""	, { 201141 , 1 }		-- 菲尼克斯的救贖*1	201141 機率	500 / 10000
				, 2300 ,""	, { 201458 , 3 }		-- 聖光武器石*3		201458 機率	1000 / 10000
				, 3300 ,""	, { 201459 , 3 }		-- 聖光裝備石*3		201459 機率	1000 / 10000
				, 4300 ,""	, { 203043 , 3 }		-- 聖光首飾石*3		203043 機率	1000 / 10000
				, 6200 ,""	, { 202435 , 5 }		-- 家的羈絆*5		202435 機率	1900 / 10000
				, 8100 ,""	, { 202902 , 5 }		-- 空間紀錄墨水*5	202902 機率	1900 / 10000
				, 10000 ,""	, { 202903 , 5 }	}	-- 傳送者符文*5		202903 機率	1900 / 10000

	return BaseTressureProc4(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207011() --德國二週年慶驚喜蛋

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206997]][$SETVAR3=[201130]]" -- 206997 = 蛋 201130 = 永久雪貂坐騎

	local itemset  = {	1 , Prize1Str 	, { 201130 , 1 }		-- 永久雪貂坐騎		201130 機率	1 / 10000
				, 300 ,""	, { 202434 , 3 }		-- 每日任務重置券*3	202434 機率	299 / 10000
				, 800 ,""	, { 202434 , 1 } 	       	-- 每日任務重置券*1	202434 機率      500 / 10000
				, 1300 ,""	, { 201141 , 1 }		-- 菲尼克斯的救贖*1	201141 機率	500 / 10000
				, 2300 ,""	, { 207761 , 3 }		-- 呢喃武器石*3		201458 機率	1000 / 10000
				, 3300 ,""	, { 207762 , 3 }		-- 呢喃裝備石*3		201459 機率	1000 / 10000
				, 4300 ,""	, { 207763 , 3 }		-- 呢喃首飾石*3		203043 機率	1000 / 10000
				, 6200 ,""	, { 202435 , 5 }		-- 家的羈絆*5		202435 機率	1900 / 10000
				, 8100 ,""	, { 202902 , 5 }		-- 空間紀錄墨水*5	202902 機率	1900 / 10000
				, 10000 ,""	, { 202903 , 5 }	}	-- 傳送者符文*5		202903 機率	1900 / 10000

	return BaseTressureProc4(   itemset , 1  )

end

----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_241129() --德國3週年慶驚喜蛋

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[241129]][$SETVAR3=[209487]]" -- 241129 = 蛋   / 209487 = 永久魔幻巨蛙坐騎

	local itemset  = {	1 , Prize1Str 	, { 209487 , 1 }		-- 永久魔幻巨蛙坐騎*1    209487
				, 201 ,""	, { 209486 , 1 }		-- 30天魔幻巨蛙坐騎*1	209486 
				, 500 ,""	, { 202434 , 3 }		-- 每日任務重置券*3	202434 
				, 1050 ,""	, { 202434 , 1 } 	       	-- 每日任務重置券*1	202434 
				, 1600 ,""	, { 201141 , 1 }		-- 菲尼克斯的救贖*1	201141 
				, 2600 ,""	, { 207761 , 3 }		-- 呢喃武器石*3	207761 
				, 3600 ,""	, { 207762 , 3 }		-- 呢喃裝備石*3	207762 
				, 4600 ,""	, { 207763 , 3 }		-- 呢喃首飾石*3	207763 
				, 6400 ,""	, { 202435 , 5 }		-- 家的羈絆*5		202435 
				, 8200 ,""	, { 202902 , 5 }		-- 空間紀錄墨水*5	202902
				, 10000 ,""	, { 202903 , 5 }	}	-- 傳送者符文*5	202903 

	return BaseTressureProc4(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
function BaseTressureProc4(   itemset  , maxprizecount )

	local RandValue = rand(10000)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	
	for i = 1 , table.getn( itemset ),3 do
		if RandValue < itemset [i] then		

			--檢查是否夠欄位			
			if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
				return false
			end
			
			for j = 1 , table.getn( itemset[i+2] ) ,2 do
				GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
			end
	
			if itemset[i+1] ~= "" then
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
			--		RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			end
			return true;
		end
	end
	
	return false;
end