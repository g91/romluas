function LuaI_206486() --精緻彩蛋家具禮盒
	
	local RoleName = GetName( OwnerID() )

	local itemset = { 11 , ""	, {209620 , 1 } , 	--樸實彩蛋盤飾 209620 機率 11/100
			   22 , ""	, {209621 , 1 } , 	--巢盤彩蛋擺飾 209621 機率 11/100
			   33 , ""	, {209622 , 1 } , 	--浪漫彩蛋盆飾 209622 機率 11/100
			   44 , ""	, {209623 , 1 } , 	--銀柄彩蛋提籃 209623 機率 11/100
			   55 , ""	, {209624 , 1 } , 	--時尚彩蛋筒飾 209624 機率 11/100
			   66 , ""	, {209625 , 1 } , 	--籐編彩蛋擺飾 209625 機率 11/100
			   77 , ""	, {209626 , 1 } , 	--高雅彩蛋竹臺 209626 機率 11/100
			   88 , ""	, {209627 , 1 } , 	--古樸彩蛋籐籃 209627 機率 11/100
			   100 , ""	, {209628 , 1 } }	--綠意彩蛋提籃 209628 機率 12/100

	return BaseTressureProc(   itemset , 1  )	-- 1 = 需求背包空間 ， 回傳 itemset 、及需求背包空間
end
----------------------------------------------------------------------------------------------------------------------
function LuaI_209550() --永久拉比寵物兔箱

	local RoleName = GetName( OwnerID() )

	local itemset = { 25 , ""	, {209546 , 1 } ,		--永久拉比兔寵物蛋 209546 機率 25/100
			   50 , ""	, {209547 , 1 } ,		--永久拉比兔寵物蛋 209547 機率 25/100
			   75 , ""	, {209548 , 1 } ,		--永久拉比兔寵物蛋 209548 機率 25/100
			   100 , ""	, {209549 , 1 } }	--永久拉比兔寵物蛋 209549 機率 25/100

	return BaseTressureProc(   itemset , 1  )	-- 1 = 需求背包空間 ， 回傳 itemset 、及需求背包空間
end
-----------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_118157talk() --春雨節活動管理員艾娃．拉比對話

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	LoadQuestOption( OwnerID()) --讀取任務模板
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story", 0 ) --"我想要瞭解春雨節慶活動背景"選項
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW01]", "Lua_mika_spring_reward", 0) --兌換獎勵項目	

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW09]", "Lua_mika_springfes_changeitem", 0) --兌換[206847]
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story() --"我想要更了解春雨節慶活動"選項
	
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_10]" ) --春雨節慶活動背景1
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_111700_29]", "Lua_ying_spring_story2", 0 ) --"更多春雨節慶活動背景"選項
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118157talk", 0 ) --回到上一頁
end
-------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story2() --"更多春雨節慶活動背景"選項

	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_3]" ) --春雨節慶活動背景2 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118157talk", 0 ) --回到上一頁
end
-------------------------------------------------------------------------------------------------------------------------------------------------------