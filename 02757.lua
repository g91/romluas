-- 2012 節慶活動 南瓜節 瑪拉蒂娜改版

-----------------------------外面活動NPC
function lua_mika_2012hallow_npc01()
	local OID = OwnerID() -- 玩家
	local TID = TargetID()  -- npc
	local Today =  CheckFlag(OID, 547086 ) --今天完成過
	local joined = Checkflag(OID, 547085 )  -- 今天有參加
	local pass = CheckBuff(OID, 623459 )  -- 憑證

	if Today == true then  -- 今天已完成過
		SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_04]"   )  -- 當天已完成
		local Language = GetServerDataLanguage() 
	--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
		if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
			AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_33]" , "lua_mika_2012hallow_restart", 0 ) --   我想重新挑戰
		end
	else
		if joined == false then  -- 今天還沒開啟遊戲 (可以進去)
			if pass == True then  -- 有憑證
				SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_36]"    )  -- 說話(略)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_02]" , "lua_mika_2012hallow_npc02", 0 ) -- 我要挑戰 
			else 
				SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_01]"    )  -- 說話(略)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_02]" , "lua_mika_2012hallow_npc02", 0 ) -- 我要挑戰 
			end
		else  -- 今天參加過 但還沒回報
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_06]"    )  -- 回報說話(略)
			AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_03]" , "lua_mika_2012hallow_npc03", 0 ) -- 回報成果
		end
	end

end

-- 重置 -----------------------------------------------------
function lua_mika_2012hallow_restart()
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()  -- npc
	SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_35]"   )  -- 當天已完成
	--今天的表現嗎還不如你預期嗎？如果想重新挑戰，你必須用<CS>[202903]2個</CS>做為交換條件，你確定要再次挑戰嗎？

	AddSpeakOption( OwnerID(), TargetID(), "[SC_OKAY]" , "lua_mika_2012hallow_restart2", 0 ) --  重置選項
end

function lua_mika_2012hallow_restart2()
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()  -- npc
	local item = 202903  -- 傳送者符文
	local Count = CountBodyItem(OID, item )

	if Count >= 2 then 
		DelBodyItem(OID, item , 2 )  -- 刪除
		Beginplot(OID, "lua_mika_2012hallow_npc02", 0 )  -- 傳入副本
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  -- 你擁有的物品數量不足。

	end
end
-----------------------------------------------------

-- 傳入活動副本內
function lua_mika_2012hallow_npc02()  
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()  -- npc

	CloseSpeak( OID )      
	Setflag(OID, 547085, 0 )
	Setflag(OID, 547086, 0 )
	Setflag(OID, 546865, 0 )  -- 偵測範圍劇情
	CancelBuff_NoEvent(OID, 623536 )  -- 提示訊息用buff 
	Hao_SetPlot_Touch_Reset(OID)   -- 清除上一場觸碰劇情 2013.09.24
	DesignLog(OID, 121409, "Pumpkin mala event start" )	--記錄進入人次
	ScriptMessage( OID , OID , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_05]".. "|r" , 0 ) 
	ScriptMessage( OID , OID , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_05]".. "|r" , 0 ) 
	Addbuff(OID, 623459, 0, 1800 ) -- 鬼屋參加憑證, 此buff 持續時間包括離線時間 2小時
	CastSpell( TID, OID, 850402 )  -- 縮小傳送術   施放法術(施法者,對象id,法術id) 
end

-- 縮小傳送術+傳送術
function lua_mika_2012hallow_npc022()
	local OID = OwnerID()  -- npc
	local TID = TargetID()   -- 玩家

	ChangeZone( TID, 351 , -1 , 2519, 9.2, 2593, 290)   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
end


-- 當天完成 回報挑戰成果
function lua_mika_2012hallow_npc03()
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()  -- npc

	local score = ReadRoleValue(OID, EM_LuaValueFlag_UseItem42)  -- 玩家破壞地磚數

	------------------ 各獎勵區間 ---------------------
	if score > 0 then -- 高於0分
		-- 地磚挖開數
		if score >= 36 then
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_31]"    )  -- 說話(略)
			GiveBodyItem(OID, 209433, 3 )   -- 南瓜硬幣
			local R = Rand(100)+1
			if R >= 70 then -- 30%
				GiveBodyItem(OID, 240742, 1 )   -- 美味南瓜燉飯
			else
				GiveBodyItem(OID, 240741, 1 )   -- 南瓜派禮盒
			end
		elseif score >= 31 and score <= 35 then  --  獎3
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_30][$SETVAR1="..score.."]"    )  -- 說話(略)
			GiveBodyItem(OID, 209433, 3 )   -- 南瓜硬幣
		elseif score >= 21 and score <= 30 then  --  獎3
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_30][$SETVAR1="..score.."]"    )  -- 說話(略)
			GiveBodyItem(OID, 209433, 2 )   -- 南瓜硬幣
		elseif score >= 11 and score <= 20 then  --  獎2 
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_29][$SETVAR1="..score.."]"    )  -- 說話(略)
			GiveBodyItem(OID, 209433, 1 )   -- 南瓜硬幣
			GiveBodyItem(OID, 724059, 1 )   -- 變身藥水
		elseif score >= 1 and score <= 10 then   --   獎1 
			SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_29][$SETVAR1="..score.."]"    )  -- 說話(略)
			GiveBodyItem(OID, 209433, 1 )   -- 南瓜硬幣
		end

	else  -- 0分 安慰獎
		SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_28]"    )  
		GiveBodyItem(OID, 724059, 1 )   -- 變身藥水
	end

	DesignLog(OID, 1214091, "Pumpkin mala event complete ="..score )	--記錄進入人次
	Setflag(OID, 547086, 1  ) --今天完成過
	Setflag(OID, 547085, 0  ) --今天完成過
	Lua_Festival_10_All(OID)   -- 2012南瓜節全勤獎

end


------------------------------- 如果有buff, 希爾喬克的特殊版對話劇情

--SPVer - 規則說明
function lua_mika_2012hallow_choc_01()
	SetSpeakDetail( OwnerID(), "[SC_2012HALLOW_MALA_10]"    )   --SPVer 規則說明內容(略)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2012HALLOW_MALA_09]" , "lua_mika_2012hallow_choc_02", 0 ) --準備完畢
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "lua_mika_2012hallow_choc_leave", 0 ) --我要離開
end

-- SPVer. 我要離開
function lua_mika_2012hallow_choc_leave()
	SetSpeakDetail( OwnerID(), "[SC_111813_YU_43]"   )  --你真的確定要離開？那好吧？隨時歡迎你再來挑戰！唧唧唧唧～
	AddSpeakOption( OwnerID(), TargetID(), "[SC_GETTITLE_1]" , "lua_mika_2012hallow_choc_leave2", 0 ) --確定
end

function lua_mika_2012hallow_choc_leave2()
	local OID = OwnerID()
	CloseSpeak(OID)
	CancelBuff(OID, 623459)
	ChangeZone( OID , 2 , 0 , 4871.9, 104.9, -1885.2, 92)
end


--SPVer - 準備完畢
function lua_mika_2012hallow_choc_02()	
	local PlayerID = OwnerID()
	local NPC = TargetID()	
	local RoomID = ReadRoleValue( PlayerID, EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( NPC , 101473, 200 , 1)       --大門

	CloseSpeak(PlayerID)      

	ScriptMessage( NPC , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_11]".. "|r" , 0 ) 
	ScriptMessage( NPC , -1 , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_11]".. "|r" , 0 )
	WriteRoleValue(PlayerID, EM_LuaValueFlag_UseItem42, 0 )
	WriteRoleValue(PlayerID, EM_RoleValue_Register+9, 0 )
	CancelBuff(PlayerID, 623459 )  -- 清除怪異鬼屋挑戰憑證
	SetFlag( PlayerID  , 547085 , 1 ) -- 重要物品 SPVer - 今天參加過
	AddBuff(PlayerID , 623504 , 0, -1 )  --特殊技能

	-- 和職業技能有關的
	local MyPet = ReadRoleValue ( PlayerID , EM_RoleValue_PetID ) ------抓寵物ID
	DelObj ( MyPet ) ---刪除寵物
	CancelBuff( PlayerID, 500675 ) --盜賊 潛行
	CancelBuff( PlayerID, 500535 ) --祭司 聖靈誓約

	WriteRoleValue(NPC, EM_RoleValue_Register+1, PlayerID )  -- 將Player 寫入 NPC的R1裡
	BeginPlot(NPC, "lua_mika_2012hallow_choc_03", 0 )  -- 開啟活動

end

--開啟活動
function lua_mika_2012hallow_choc_03()
	local NPC = OwnerID()  -- 副本內npc
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID) 
	local PlayerID = ReadRoleValue(NPC, EM_RoleValue_Register+1 )  -- 玩家
	local door = LuaFunc_SearchNPCbyOrgID( NPC , 101473, 200 , 1)       --大門
	local range = 400

	lua_mika_2012hallow_objreset()  -- 清除物件後重生

	-- 生物件 - 隱藏物件中控
	local Jok = CreateObjByFlag( 113105, 780235, 21 , 1 );  --隱藏物件中控
	SetModeEx( Jok  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Jok  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Jok , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Jok  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Jok   , EM_SetModeType_Move, false )--移動
	SetModeEx( Jok  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Jok   , EM_SetModeType_HideName, true )--名稱
	SetModeEx( Jok , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Jok , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Jok  , EM_SetModeType_Show , false ) --顯示
	AddToPartition( Jok, RoomID) 

	-- 打開門, 解除阻擋
	PlayMotion( door[0], 145)   -- 開門
	SetModeEx( door[0] , EM_SetModeType_Obstruct, false )--阻擋
              SetPlot( jok, "range", "lua_mika_2012hallow_111814_05" , 100 )  -- 範圍劇情,傳送玩家進去   
	WriteRoleValue(PlayerID, EM_RoleValue_Register+1 , Jok)  -- 將jok 寫入玩家R1值
	WriteRoleValue( Jok , EM_RoleValue_Register+1 , PlayerID )    -- 將玩家寫入JOK 的R1值
end

-------------------------------------------------------

-- 範圍劇情,傳送玩家進去  
function lua_mika_2012hallow_111814_05()
	local OID = OwnerID()  --玩家
	local TID = TargetID()  -- 隱藏物件

	SetPlot( TID,"range","",100 )    
	BeginPlot( TID , "lua_mika_2012hallow_111814_06" , 0 )   -- 開啟遊戲
end

-- 開啟遊戲
function lua_mika_2012hallow_111814_06()
	local Jok = OwnerID()  -- 隱藏物件

	local PlayerID = ReadRoleValue( Jok , EM_RoleValue_Register+1 )   -- 玩家
	local RoomID = ReadRoleValue( Jok , EM_RoleValue_RoomID) 
	local door = LuaFunc_SearchNPCbyOrgID( Jok , 101473, 300 , 1)       --大門

	PlayMotion( door[0], 147) 
	sleep(10)
	SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
	Hide( door[0] )
	Show( door[0] ,RoomID)

	AddBuff( PlayerID ,503693 ,1 , 1 ); --傳送特效
	SetPosByFlag( PlayerID , 780235 , 21 )--傳送到 X 號旗子

	ScriptMessage( Jok  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_12]".. "|r" , 0 ) --加油囉～冒險者～限時10分鐘～開始！唧唧唧唧～
	ScriptMessage( Jok  , -1 , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_12]".. "|r" , 0 ) --加油囉～冒險者～限時10分鐘～開始！唧唧唧唧～
	sleep(10)
	ScriptMessage( Jok  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_34]".. "|r" , 0 ) --點擊滾動的[121413]可以消滅那些阻檔你的傢伙們噢！唧唧唧唧～
	ScriptMessage( Jok  , -1 , 0 , "|cffff00ff" .."[SC_2012HALLOW_MALA_34]".. "|r" , 0 ) --點擊滾動的[121413]可以消滅那些阻檔你的傢伙們噢！唧唧唧唧～

	ClockOpen( PlayerID ,EM_ClockCheckValue_30, 420,420, 0,"Lua_Clockending","lua_mika_2012hallow_timeup01")  -- 倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
	BeginPlot( Jok , "lua_mika_2012hallow_111814_03" , 0 )  --  執行每秒檢查地板有沒有全敲完

end

---------------------------------------------------------
-- 時間到觸發劇情
function lua_mika_2012hallow_timeup01()
	local Player =OwnerID()
	local score = ReadRoleValue(Player, EM_LuaValueFlag_UseItem42)  -- 玩家敲擊地磚數
	local treasure = ReadRoleValue(Player, EM_RoleValue_Register+9)  -- 玩家開啟寶箱數
	local Jok = ReadRoleValue(Player, EM_RoleValue_Register+1 )  -- jok是player的r1
	-- 2013.10.03 阿浩:修正南瓜節活動 - 碼拉蒂娜鬼屋，當玩家開啟所有地磚時，在倒數時間已歸零的情況下，不會被傳出區域，必須等到開啟所有寶箱後才會傳出去的問題。
--	if score < 36 then
		ScriptMessage( Player , Player , 1 , "|cffff00ff" .."[SC_111813_YU_33]".. "|r" , 0 ) --呦～唧唧唧唧～時間到出去吧！
		BeginPlot(jok, "lua_mika_2012hallow_timeup02", 0 )
--	end
end

function lua_mika_2012hallow_timeup02()
	local jok = OwnerID()
	local Player = ReadRoleValue(jok, EM_RoleValue_Register+1 )  -- Player是 JOK的R1值

	Hao_SetPlot_Touch_Reset(Player)   -- 清除上一場觸碰劇情 2013.09.24
	Sleep(20)  -- 執行者是jok所以可以sleep
	ChangeZone( Player , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )
	AddBuff(Player, 623536, 0, -1 )  -- 給提示訊息用buff 移動後消失
	BeginPlot( Player  , "Lua_Clockending" , 0 )
--	say(player, "time up")

end

---------------------------------------------------------
-- 活動中換區(死亡 ) 離線事件  ( BUFF刪除時觸發事件)
function lua_mika_2012hallow_close()
	local Player = OwnerID()

	Hao_SetPlot_Touch_Reset(Player)   -- 清除上一場觸碰劇情 2013.09.24
	AddBuff(Player, 623536, 0, -1 )  -- 給提示訊息用buff 移動後消失
	BeginPlot( Player, "Lua_Clockending" , 0 )	
end

---------------------------------------------------------

-- 活動時間到 , 換區時給的buff, 移動消失觸發事件
function lua_mika_2012hallow_msg()
	local Player = OwnerID()
	ScriptMessage( Player , Player , 1 , "[SC_2012HALLOW_MALA_26]" , C_System ) --去向[121409]回報你的挑戰成果吧！
end

---------------------------------------------------------

-- 憑證時間到時, 觸發回到zone2
function lua_mika_2012hallow_goout()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue(Player, EM_RoleValue_ZoneID )

	if ZoneID == 351 then
		Hao_SetPlot_Touch_Reset(Player)   -- 清除上一場觸碰劇情 2013.09.24
		ScriptMessage( Player , Player , 1 , "[SC_2012HALLOW_MALA_37]" , C_System ) -- 時間到哩唧唧唧唧～出去吧！
		ScriptMessage( Player , Player , 0 , "[SC_2012HALLOW_MALA_37]" , C_System ) 
		ChangeZone( Player , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )
	--	say(Player, "go out 1")
	end
--	say(Player, "go out 2")
end


--------------------------------------------------------

--SP ver. 執行每秒檢查地板有沒有全敲完 & 玩家在不在
function lua_mika_2012hallow_111814_03()
	local jok = OwnerID()
	local Player = ReadRoleValue(jok, EM_RoleValue_Register+1 )  -- Player是 JOK的R1值
	local door = LuaFunc_SearchNPCbyOrgID( Jok , 101473, 300 , 1)       --大門

	WriteRoleValue(Player, EM_LuaValueFlag_UseItem42, 0 )
	WriteRoleValue(Player, EM_RoleValue_Register+9, 0 )

	while true do
		local score = ReadRoleValue(Player, EM_LuaValueFlag_UseItem42)  -- 玩家敲擊地磚數
		local treasure = ReadRoleValue(Player, EM_RoleValue_Register+9)  -- 玩家開啟寶箱數

		if score == 36 and treasure == 10 then
			 --呦～唧唧唧唧～真是厲害呀！居然能夠全部挖開了！所謂強者就是如此吧！再見了！  (字串未改)
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 )
			ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_37]".. "|r" , 0 ) --
			sleep(30)
			AddBuff(Player, 623536, 0, -1 )  -- 給提示訊息用buff 移動後消失
			BeginPlot(  Player  , "Lua_Clockending" , 0 )
			ChangeZone( Player , 2 , 0 , 4871.9, 104.9, -1885.2, 92 )

			break
		end
		sleep(10)
	end
end

----------------------------------------------------------------
-- 技能 - 擊暈

function lua_mika_2012hallow_skill01()  
	local OID = OwnerID()  -- 玩家
	local TID = TargetID() 
	local ghostlist = {107346, 107347, 107348}
	local Orgid = ReadRoleValue(TID, EM_RoleValue_OrgID )
	if Orgid == 107346 or Orgid == 107347 or Orgid == 107348 then
	--	say(TID, "effect" )
		AddBuff(TID, 623537, 0, 6 )  -- 擊暈效果時間
	end
end

function lua_mika_2012hallow_skill02()  --check
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()   -- 目標
	local Orgid = ReadRoleValue(TID, EM_RoleValue_OrgID )

	if ReadRoleValue(TID, EM_RoleValue_IsPlayer )  == 1 then -- 如果是玩家
		ScriptMessage( OID , OID , 1 , "[SC_2012HALLOW_MALA_38]" , 0 )
		return false
	else
	--	say(TID, "orgid = "..Orgid )
		if Orgid == 107346 or Orgid == 107347 or Orgid == 107348 then
			return true
		else
			ScriptMessage( OID , OID , 1 , "[SC_2012HALLOW_MALA_38]" , 0 )
			return false
		end
	end

end

----------------------------------------------------------------
-- 入場重置機制
function lua_mika_2012hallow_reset01() -- 關閉範圍內玩家之計時器   副本內重置機制
	SetPlot( OwnerID() ,"range",  "lua_mika_2012hallow_reset02" , 50 )  
end

function lua_mika_2012hallow_reset02() 
	-- 2012 南瓜節活動 鬼屋遊戲 副本內重置機制1
	local OID = OwnerID()   -- player
	local TID = TargetID()   -- BOX
	local pass = CheckBuff(OID, 623459 )  -- 憑證

	local eventplay =  CheckFlag( OID  , 546865 ) 
	local play =  CheckFlag( OwnerID()  , 543270 ) 

--	if pass == true then
--		say(OID, " pass = true")
--	else
--		say(OID,  "pass = false")
--	end

--	if eventplay == true then
--		say(OID, "event play = true ")
--	else
--		say(OID, "event play = false")
--	end
--
--	if play == true then
--		say(OID, "mala play = true ")
--	else
--		say(OID, "mala play = false")
--	end

	if pass == true then
		if  eventplay ~= true then    -- 活動版
			SetFlag( OID  , 546865 , 1 ) --關閉重複觸發範圍劇情
			lua_mika_2012hallow_delall2()  -- 刪除所有物件
			BeginPlot( OID, "Lua_Clockending" , 0 )
			local door = LuaFunc_SearchNPCbyOrgID( OID , 101473, 300 , 1)       --大門
			PlayMotion( door[0], 133) 
			SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
	--		say(OID, "ghost house reset")
		end

	end

	if pass == false then
		if CheckBuff(OID, 623504 ) == false then  --沒有鬼屋遊戲參與中
			if  play == false then	--今天第一次進副本   啟動重置機制。
				SetFlag( OID, 543270 , 1 ) --關閉重複觸發範圍劇情
				lua_mika_2012hallow_delall2()  -- 刪除所有物件
				BeginPlot( OwnerID()  , "Lua_Clockending" , 0 )
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
				local door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101473, 300 , 1)       --大門
				PlayMotion( door[0], 133) 
				SetModeEx( door[0] , EM_SetModeType_Obstruct, true )--阻擋
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+8 , 0 )   --做記號，此人是否破關了   是：99
			--	say(OwnerID(), "mala 1 reset")
			end

		end
	end

end

----------------------------------------------------------------
-- TEST 測試用 

-- 測試指令
function lua_mika_2012hallow_test_99()
	ClockOpen( OwnerID() , EM_ClockCheckValue_30, 20,20, 0,"Lua_Clockending","lua_mika_2012hallow_test_991")  -- 倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
end

function lua_mika_2012hallow_test_991()
	local O_ID = OwnerID()
	Say(O_ID, "123")
end

-- 重置此活動
function lua_mika_2012hallow_test_01()
	local O_ID = OwnerID()
	Setflag(O_ID, 547085, 0 )
	Setflag(O_ID, 547086, 0 )
	Setflag(O_ID, 546865, 0 )
	CancelBuff_NoEvent(O_ID, 623536 )  -- 提示訊息用buff 

	Say(O_ID, "event reset ok")
end

-- 寫入特定分數
function lua_mika_2012hallow_test_02(Value)
	local O_ID = OwnerID()
	Setflag(O_ID, 547085, 1 )  -- 給今天已報名
	Setflag(O_ID, 547086, 0 ) -- 刪 今天已完成

	WriteRoleValue(O_ID, EM_LuaValueFlag_UseItem42, Value)
	local score = ReadRoleValue(O_ID, EM_LuaValueFlag_UseItem42 )
	Say(O_ID, "Now socre is "..score )
end

-- 寫入寶箱開啟數
function lua_mika_2012hallow_test_03(Value)
	local O_ID = OwnerID()

	WriteRoleValue(O_ID, EM_RoleValue_Register+9, Value)
	local treasure = ReadRoleValue(O_ID, EM_RoleValue_Register+9)  -- 玩家開啟寶箱數
	Say(O_ID, "Now treasure count is "..treasure )
end

function lua_mika_2012hallow_test_buff()
	local OID = OwnerID()
	Addbuff(OID, 623459, 0, 30 ) -- 鬼屋參加憑證, 測試時間結束劇情
end

--地磚套用各式點擊劇情
function lua_mika_2012hallow_test_touch1()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj1_01" , 30 )   -- 好瓜
end

function lua_mika_2012hallow_test_touch2()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj2_01" , 30 )   -- 噴火瓜
end

function lua_mika_2012hallow_test_touch3()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj3_01" , 30 )   -- 炸彈瓜
end

function lua_mika_2012hallow_test_touch4()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj4_01" , 30 )   -- 陷阱
end

function lua_mika_2012hallow_test_touch5()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj5_01" , 30 )   -- 墳墓
end

function lua_mika_2012hallow_test_touch6()
	SetCursorType( OwnerID() , eCursor_Mine );
	SetPlot( OwnerID() ,"touch",  "lua_mika_2012hallow_obj6_01" , 30 )   --  治療
end

function lua_mika_2012hallow_objreset()
--	lua_mika_2012hallow_delall2()
--	sleep(5)
	lua_mika_2012hallow_floor_01()    --  702758  - 生地板
	sleep(5)
	lua_mika_2012hallow_fire01()    --  702758  -  生噴火瓜
end