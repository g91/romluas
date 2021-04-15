--701618 地圖上NPC

Function Lua_mika_losttreasure_z2npc() --z2NPC
	local tran1 =  CheckFlag( OwnerID() , 543572 )
	LoadQuestOption( OwnerID() )  --讀取任務
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_26]"   ) -- 嗨，冒險者！你對埋藏在古代遺跡的秘寶有興趣嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_01]" , "Lua_mika_losttreasure_z2npc1", 0 ) --關於古代秘寶遺跡
	if tran1 == true then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_27]" , "Lua_mika_losttreasure_Z10tran", 0 ) --我要前往[ZONE_SASCILIA STEPPES][ZONE_SCAR OF DESPAIR]的營地
	end
end

Function Lua_mika_losttreasure_gotran() --給予可看見傳送選項的旗標  掛在接下任務後
	SetFlag(TargetID(),543572 , 1) 
end

Function Lua_mika_losttreasure_z2npc1() --關於古代秘寶遺跡
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_05]"   ) -- 背景內容
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "Lua_mika_losttreasure_z2npc2", 0 ) --規則說明
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_z2npc", 0 )--回上一頁
end

Function Lua_mika_losttreasure_z2npc2() --規則說明
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_06]"   ) -- 規則說明內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_z2npc1", 0 )--回上一頁
end

function Lua_mika_losttreasure_Z10tran()
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_55]" ) -- 你確定要前往[ZONE_SCAR OF DESPAIR]的營地？人手不足的緣故，一天只能提供一次馬車服務，請仔細考慮。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]"  , "Lua_mika_losttreasure_Z10tran1", 0 ) --確定
end

function Lua_mika_losttreasure_Z10tran1()
	local tran =  CheckFlag( OwnerID() , 543490 )
	if tran == false then
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_29]" ,C_SYSTEM  )--你乘著馬車前往[ZONE_SCAR OF DESPAIR]的營地。
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_29]" ,C_SYSTEM  )
		SetFlag(OwnerID(),543490 , 1) --已使用過傳送
		Sleep(20)
		ChangeZone( OwnerID(), 10 , -1 , -35785.7, 147.5, 5438.2, 213)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	else
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_28]" ) --因為人手不足，一天只能提供你一次馬車服務，如果有需要請自己前往。 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_z2npc", 0 )--回上一頁
	end
end
--------------------------------------------------------------------------------------------
Function Lua_mika_losttreasure_test01() --加1
	AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 1 )   --稱號記次
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --稱號累積次數
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數：[$VAR1] 。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test02()  --歸零
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 0 )   --稱號記次
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --稱號累積次數
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數：[$VAR1] 。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test03()  --次數為50
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 50 )   --稱號記次
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --稱號累積次數
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數：[$VAR1] 。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test04()  --次數為100
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 100 )   --稱號記次
	local passtime = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem5  )   --稱號累積次數
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數：[$VAR1] 。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_test05()  --刪所有稱號
	DelBodyItem( OwnerID() ,  530385  , 1 ) --稱號1
	DelBodyItem( OwnerID() ,  530386  , 1 ) --稱號2
	DelBodyItem( OwnerID() ,  530387  , 1 ) --稱號3
	DelBodyItem( OwnerID() ,  530388  , 1 ) --稱號4
	DelBodyItem( OwnerID() ,  530391  , 1 ) --稱號5
	Say(OwnerID(),"title is deleted.")
end

------------------------------------------------------------------------------------------------------------------------
Function Lua_mika_losttreasure_NPC0() --外面NPC
	local UseItem5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5)
	local rewardtitle1 =  CountBodyItem( OwnerID() , 530385 ) --稱號1
	local rewardtitle2 =  CountBodyItem( OwnerID() , 530386 ) --稱號2
	local rewardtitle3 =  CountBodyItem( OwnerID() , 530387 ) --稱號3
	local rewardtitle4 =  CountBodyItem( OwnerID() , 530388 ) --稱號4
	if UseItem5 >= 1 and rewardtitle1 == 0 then
		GiveBodyItem( OwnerID() ,  530385  , 1 ) --稱號1
	elseif UseItem5 >= 10 and rewardtitle2 == 0 then
		GiveBodyItem( OwnerID() ,  530386  , 1 ) --稱號2
	elseif UseItem5 >= 50 and rewardtitle3 == 0 then
		GiveBodyItem( OwnerID() ,  530387  , 1 ) --稱號3
	elseif UseItem5 >= 100 and rewardtitle4 == 0 then
		GiveBodyItem( OwnerID() ,  530388  , 1 ) --稱號4
	end
	LoadQuestOption( OwnerID() )  --讀取任務
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_00]"   ) -- 要是不想丟了命，事先的準備是很重要的，關於這點，我希望你能記住。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_01]" , "Lua_mika_losttreasure_NPC1", 0 ) --關於古代秘寶遺跡
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_04]" , "Lua_mika_losttreasure_NPC4", 0 ) --兌換獎勵
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_21]" , "Lua_mika_losttreasure_NPC5", 0 ) -- 我想知道目前成功挑戰的次數
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_03]" , "Lua_mika_losttreasure_NPC3", 0 ) --我想挑戰
	AddSpeakOption( OwnerID(), TargetID(), "[SC_SOUND_IC_04]" , "Lua_mika_losttreasure_NPC6", 0 ) --我想回到凡瑞娜絲城

end

function Lua_mika_losttreasure_NPC6()
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_54]" ) -- 你確定要回到[SC_ZONE_VANCITY]？人手不足的緣故，一天只能提供一次馬車服務，請仔細考慮。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_08]"  , "Lua_mika_losttreasure_NPC61", 0 ) --確定
end

function Lua_mika_losttreasure_NPC61()
	local todayBack = CheckFlag(OwnerID(), 548092 )  -- 今天已使用過傳送(Z10到Z2)
	if todayBack == false then
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_53]" , C_SYSTEM  )--你乘著馬車回到凡瑞娜絲城。
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_53]" , C_SYSTEM  )
		SetFlag(OwnerID(),548092 , 1) --今天已使用過傳送(Z10到Z2)
		Sleep(5) 
		ChangeZone( OwnerID(), 10 , 0 , 5275 , 103 , -2230, 0 )  -- 凡瑞娜絲城中央廣場座標
	else
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_28]" ) --因為人手不足，一天只能提供你一次馬車服務，如果有需要請自己前往。 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--回上一頁
	end
end

Function Lua_mika_losttreasure_NPC1() --關於古代秘寶遺跡
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_05]"   ) -- 背景內容
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "Lua_mika_losttreasure_NPC2", 0 ) --規則說明
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--回上一頁
end

Function Lua_mika_losttreasure_NPC2() --規則說明
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_06]"   ) -- 規則說明內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC1", 0 )--回上一頁
end

Function Lua_mika_losttreasure_NPC4() --兌換獎勵
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_37]"   ) -- 你好，冒險者，探險進行的狀況還順利嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_50]" , "Lua_mika_losttreasure_changes", 0 ) --本期特殊兌換
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_38]" , "Lua_mika_losttreasure_change0", 0 ) --一般兌換條件
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_31]" , "Lua_mika_losttreasure_change1", 0 ) --兌換萬能修理鎚
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_32]" , "Lua_mika_losttreasure_change2", 0 ) --兌換命運盒子效果卡
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_33]" , "Lua_mika_losttreasure_change3", 0 ) --兌換古老寶箱
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_34]" , "Lua_mika_losttreasure_change4", 0 ) --兌換翡翠寶箱
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_36]" , "Lua_mika_losttreasure_change6", 0 ) --兌換背包空間體驗書卷
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_35]" , "Lua_mika_losttreasure_change51", 0 ) --兌換古代秘寶遺跡調查憑證
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--回上一頁
end

Function Lua_mika_losttreasure_changes() --本期特殊兌換
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_51]"   ) -- 本期特殊兌換
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_52]" , "Lua_mika_losttreasure_changess", 0 ) --我要兌換
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
end

Function Lua_mika_losttreasure_changess() --本期特殊兌換物品
	local coin = CountBodyItem(OwnerID(), 206423) --遺跡考察隊勳章
	local title = CountBodyItem(OwnerID(), 530391) --稱號- 遺跡考察隊的英雄
	if coin >= 30 then 
		if title == 1 then --有稱號
			SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_34]"   )   --你已經有這個稱號囉！
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
		else  --還沒有稱號
			GiveBodyItem(OwnerID(), 530391 ,1)
			DelBodyItem(OwnerID(), 206423, 30)
			SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_30]"   ) -- 感謝你對我們的幫助，研究進度才得以順利進行，這個稱號對你再貼切不過了！
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end

Function Lua_mika_losttreasure_change0() --一般兌換條件
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_39]"   ) -- 條件內容
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
end

Function Lua_mika_losttreasure_change1() --兌換萬能修理鎚   1
	local coin = CountBodyItem(OwnerID(), 206423) --遺跡考察隊勳章
	if coin >= 1 then 
		GiveBodyItem(OwnerID(), 201967, 1)
		DelBodyItem(OwnerID(), 206423, 1)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- 收下吧，希望它能在你的冒險旅程中成為助力。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end

Function Lua_mika_losttreasure_change2() --兌換命運盒子效果卡X3
	local coin = CountBodyItem(OwnerID(), 206423) --遺跡考察隊勳章
	if coin >= 3 then 
		GiveBodyItem(OwnerID(), 206425, 3)
		DelBodyItem(OwnerID(), 206423, 3)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- 收下吧，希望它能在你的冒險旅程中成為助力。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end

Function Lua_mika_losttreasure_change3() --古老寶箱  3
	local coin = CountBodyItem(OwnerID(), 206423) --遺跡考察隊勳章
	if coin >= 3 then 
		GiveBodyItem(OwnerID(), 206428, 1)
		DelBodyItem(OwnerID(), 206423, 3)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- 收下吧，希望它能在你的冒險旅程中成為助力。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end

Function Lua_mika_losttreasure_change4() --翡翠寶箱 5
	local coin = CountBodyItem(OwnerID(), 206423) --遺跡考察隊勳章
	if coin >= 5 then 
		GiveBodyItem(OwnerID(), 206429, 1)
		DelBodyItem(OwnerID(), 206423, 5)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- 收下吧，希望它能在你的冒險旅程中成為助力。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end

--Function Lua_mika_losttreasure_change5() --兌換古代秘寶遺跡調查憑證
--	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_47]"   ) -- 你想用什麼來兌換？
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_41]"  , "Lua_mika_losttreasure_change51", 0 )--用7個[206423]交換[206426]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_42]"  , "Lua_mika_losttreasure_change52", 0 )--用1個[202903]交換[206426]
--	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
--end

Function Lua_mika_losttreasure_change51() --兌換古代秘寶遺跡調查憑證1
	local coin = CountBodyItem(OwnerID(), 206423) --遺跡考察隊勳章
	if coin >= 7 then 
		GiveBodyItem(OwnerID(), 206426, 1)
		DelBodyItem(OwnerID(), 206423, 7)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- 收下吧，希望它能在你的冒險旅程中成為助力。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end


Function Lua_mika_losttreasure_change6() --背包空間體驗書卷
	local coin = CountBodyItem(OwnerID(), 206423) --背包空間體驗書卷
	if coin >= 5 then 
		GiveBodyItem(OwnerID(), 206431, 1)
		DelBodyItem(OwnerID(), 206423, 5)
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_40]"   ) -- 收下吧，希望它能在你的冒險旅程中成為助力。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	else
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]"   ) -- 你所持的物品數量不足。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC4", 0 )--回上一頁
	end
end

function Lua_mika_losttreasure_NPC5() --我想知道目前成功挑戰的次數
	CloseSpeak( OwnerID() )    
	local passtime = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5  )   --稱號累積次數
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--目前挑戰成功次數為：[$VAR1] 次
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
end

Function Lua_mika_losttreasure_NPC3() --我想挑戰
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) --讀取玩家的主職等級
	if PlayerLV <= 20  then
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_LV]"   ) -- 裡面的魔物對你來說似乎太危險了，你多磨練一陣子再來挑戰吧。
	else
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_07]"   ) -- 若確定挑戰我將會幫你開啟瀑布下的大門，你確定要挑戰嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "Lua_mika_losttreasure_NPC_sure", 0 ) --確定
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC0", 0 )--回上一頁
	end
end

Function Lua_mika_losttreasure_NPC_sure() --我確定
	local todayjoin  =  CheckFlag( OwnerID()  , 543406 )--今天已挑戰過
	if todayjoin == true then  --已確定挑戰		
		SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_09]"   ) -- 你今天已經挑戰過了，請明天再來挑戰。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_NPC3", 0 )--回上一頁
	else
		CloseSpeak( OwnerID() )    
		if CountBodyItem( OwnerID(), 203038 ) >= 30 then                            --必爾汀代幣
			BeginPlot( OwnerID() , "Lua_mika_losttreasure_NPC_enter" , 0 )  
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣  (  *  共用字串   )
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣
		end
	end
end


Function Lua_mika_losttreasure_NPC_enter()  --進入劇情 ok
	SetFlag(OwnerID(),543491 , 0) -- 進入特定門1~6
	SetFlag(OwnerID(),543492 , 0)
	SetFlag(OwnerID(),543493 , 0)
	SetFlag(OwnerID(),543494 , 0)
	SetFlag(OwnerID(),543495 , 0)
	SetFlag(OwnerID(),543496 , 0)
	SetFlag(OwnerID(),543487 , 0) --開啟燭台123
	SetFlag(OwnerID(),543488 , 0)
	SetFlag(OwnerID(),543489 , 0)
	SetFlag(OwnerID(),543573 , 0 ) -- 刪 古代秘寶進行中

	ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_10]" ,0  )--祝你好運！
	ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_10]" ,0  )--祝你好運！
	local RANDOWN = rand(5)   --0~5
	if RANDOWN == 0 then  -- 1
		SetFlag(OwnerID(),543491 , 1)
--		Say(OwnerID(), "1" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 4271.2, 34.3, 4086.4, 141.2)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	elseif RANDOWN == 1 then  -- 2
		SetFlag(OwnerID(),543492 , 1)
--		Say(OwnerID(), "2" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 4261.8, 34.3, 3592.3, 220.2)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	elseif RANDOWN == 2 then  -- 3
		SetFlag(OwnerID(),543493 , 1)
--		Say(OwnerID(), "3" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3835.3, 34.3, 4327.7, 82.4)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	elseif RANDOWN == 3 then  -- 4
		SetFlag(OwnerID(),543494 , 1)
--		Say(OwnerID(), "4" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3847.8, 34.3, 3347.8, 272.0 )   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	elseif RANDOWN == 4 then  -- 5

		SetFlag(OwnerID(),543495 , 1)
--		Say(OwnerID(), "5" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3416.4, 34.3, 4079.7, 26.2)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	elseif RANDOWN == 5 then  -- 6
		SetFlag(OwnerID(),543496 , 1)
--		Say(OwnerID(), "6" )
		Sleep(20)
		ChangeZone( OwnerID(), 355 , -1 , 3423.4, 34.3, 3591.3, 325.6)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	end
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
	local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
	DesignLog(OwnerID(),355," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
end