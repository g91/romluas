function Lua_ying_spring_118282talk() --露娜拉比 對話劇情
--	Say(OwnerID(), "Owner") --玩家
--	Say(TargetID(), "Target") --NPC
	local Reg = ReadRoleValue( TargetID() , EM_RoleValue_Register7 ) --讀取NPC身上的Register7值
	local over = CheckFlag( OwnerID() , 545046 ) --領完獎勵 --每日重置
	local keyA = CheckFlag( OwnerID() , 545047 ) --報名key --每日重置
	local keyB = CheckFlag( OwnerID() , 545048 ) --玩過key

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	if over == true then --領完獎勵
		SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV2_03]" ) --你今天已經參與過這個活動囉！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story", 0 ) --"我想要瞭解春雨節慶活動背景"選項
	else --未領獎勵
		if Reg == 1 then --Register7值=1表示活動正在進行中
			SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV2_02]" ) --考驗已經開始囉！我正在出題呢～
		elseif Reg == 2 then --Register7值寫=2表示NPC開放報名
			if keyB == true then --已玩過活動
				LoadQuestOption( OwnerID()) --讀取模板
				AddSpeakOption( OwnerID() , TargetID() , "[SC_SPRING_2011EV2_05]" , "Lua_ying_spring_gift" , 0 ) --"挑戰完成，我想要領取獎勵！"選項
				AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story", 0) --"我想要瞭解春雨節慶活動背景"選項
			elseif keyA == true then --已報名，但尚未玩活動
				SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV2_06]" ) --你已經報名過囉！整點的時候考驗就會開始了！祝你好運～
			else --未報名
				LoadQuestOption( OwnerID()) --讀取模板
				AddSpeakOption( OwnerID() , TargetID() , "[SC_111576_YU_03]" , "Lua_ying_spring_sign" , 0 ) --"我要報名！"選項
			end
		else --活動尚未開始
			LoadQuestOption( OwnerID()) --讀取模板
			AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story3", 0) --"我想要瞭解春雨節慶活動背景"選項
			if keyB == true then --已玩過活動
				AddSpeakOption( OwnerID() , TargetID() , "[SC_SPRING_2011EV2_05]" , "Lua_ying_spring_gift" , 0 ) --"挑戰完成，我想要領取獎勵！"選項
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story3() --"我想要更了解春雨節慶活動"選項
	
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_10]" ) --春雨節慶活動背景1
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_111700_29]", "Lua_ying_spring_story4", 0 ) --"更多春雨節慶活動背景"選項
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118282talk", 0 ) --回到上一頁
end
-------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story4() --"更多春雨節慶活動背景"選項

	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_3]" ) --春雨節慶活動背景2 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118282talk", 0 ) --回到上一頁
end
-------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_sign() --"我要報名！"選項
	
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SPRING_2011EV2_07]" , C_SYSTEM ) --你的報名已經申請完成！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SPRING_2011EV2_07]" , C_SYSTEM ) --你的報名已經申請完成！
	SetFlag( OwnerID() , 545047 , 1 ) --給予報名key
	CloseSpeak( OwnerID() )
end		
------------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_spring_gift() --"挑戰完成，我想要領取獎勵！"選項

---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_118283npc() --掛在露娜 ‧ 拉比隱藏物件上(物件產生劇情)
--	Say(OwnerID(), "Owner") --隱藏物件
--	Say(TargetID(), "Target") --隱藏物件
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --讀取隱藏物件位於哪個Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 118282 , 100 , 0 ) --以隱藏物件118283為中心，向周圍100碼搜尋NPC露娜拉比118282
										        --(最後的0為Type，Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標)
										        --(1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標)
	local hrtable = { 2 , 8 , 14 , 20 } --50分
	local hrtable2 = { 3 , 9 , 15 , 21 } --整點

	while true do
		Say(OwnerID() , "1")
		Sleep(600) --1分鐘跑一次迴圈
		local hour = GetSystime(1) --取得現在時間：時
		local min = GetSystime(2) --取得現在時間：分
		local Reg = ReadRoleValue( NPC , EM_RoleValue_Register7 ) --讀取NPC身上的Register7值

		Say( OwnerID() , "Reg = "..Reg)
		if ZoneID < 1000 then --(分流1：15、分流2：15001、分流3：15002，若ZoneID大於1000則為分流)
			for i = 1 , table.getn(hrtable) , 1 do --hrtable的1~4位置
				if hour == hrtable[i] and min == 50 then --時=2 , 8 , 14 , 20 & 分=50
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_SPRING_2011EV2_01]" ) --春雨節活動"拉比族的考驗"即將在10分鐘後開始，請前往達拉尼斯城尋找春雨節活動管理員—露娜 ‧ 拉比報名參加！
					WriteRoleValue( NPC , EM_RoleValue_Register7, 2 ) --把拉比的Register7值寫為"2"，表示NPC開放報名
				elseif hour == hrtable2[i] and min == 0 then --時=3 , 9 , 15 , 21 & 分=0
					Say(OwnerID() , "2")
--					Beginplot( NPC , "" , 0 ) --整點到拉比開始出題劇情
					WriteRoleValue( NPC , EM_RoleValue_Register7, 1 ) --把拉比的Register7值寫為"1"，表示活動進行中
				end
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_123()
	
	Lua_Hao_NPCofAll_Clear( 118157 , 300 )
end