---------------------------------------------------
function LuaS_118toZone1_0()
---------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_118toZone1_1",50)
end

---------------------------------------------------
function LuaS_118toZone1_1()--出去
---------------------------------------------------
	ChangeZone(OwnerID(),1,0,2390,-210,-5415,146)
end

---------------------------------------------------
function LuaS_118toZone1_2() --掛在偽 加諾多斯的出生劇情
---------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_118toZone1_3",50)
end

---------------------------------------------------
function LuaS_118toZone1_3() --開啟傳送前的確認選框 『【 ##注意：探測月泉裂井深處的任務內容移到此處 】』
---------------------------------------------------
--『【 ##注意：探測月泉裂井深處的任務內容移到此處 】』
--判斷是否有接任務
--有的話任務完成
	if CheckAcceptQuest( OwnerID() , 420491 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SAY_420491") , 0 )
		SetFlag( OwnerID() , 540777 , 1)
	end

--水龍洞的任務劇情
	local Ans
	if	CheckBuff(OwnerID(),504308)	then
--傳訊息	
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
			Tell(OwnerID(),TargetID(),"[SC_422717_3]")
			--出現二擇選框 看他要不要回原生之地
			DialogCreate(OwnerID(),EM_LuaDialogType_YesNo,"[SC_422717_4]")
			DialogSelectStr( OwnerID(),"[SO_YES]")
			DialogSelectStr( OwnerID(),"[SO_NO]")
			Ans = LuaS_DialogRePort_TwoChoose(OwnerID())
			if	Ans == "Etc"	then
				CancelBuff(OwnerID(),504308)
				return
			end
			if	Ans == "Yes"	then
				ChangeZone(OwnerID(),8,0,-2468,350,23582,215)
			end
			if	Ans == "No"	then
				CancelBuff(OwnerID(),504308)
				return
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end
end

-----------------------------------------------------------------------
function LuaS_118toZone1_4() --戰鬥結束之後產生傳送門讓他們離開
-----------------------------------------------------------------------
--出現殘影
--對白
	local King = Lua_DW_CreateObj("flag",113581,780088,3)
	WriteRoleValue(King,EM_RoleValue_LiveTime,8)
	sleep(20)
	Say(King,"[SC_102623_18]")
	sleep(20)
--建立傳送門
--取消重力 頭像框 名稱
--提高位置
	local Door = Lua_DW_CreateObj("flag",113570,780088,2,0)
	SetModeEx(Door,EM_SetModeType_Gravity,false) 
	SetModeEx(Door,EM_SetModeType_ShowRoleHead,false) 
	SetModeEx(Door,EM_SetModeType_HideName, true) 
	SetModeEx( Door,EM_SetModeType_Move, false )
	WriteRoleValue(Door,EM_RoleValue_Y,ReadRoleValue(Door,EM_RoleValue_Y)+20)
	AddToPartition(Door,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	sleep(10)
end


---------------------------------------------------------------------
function LuaS_118toZone1_5() -- 傳送門的對話劇情
---------------------------------------------------------------------
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_102623_6]","LuaS_118toZone1_6", 0 )
end

---------------------------------------------------------------------
function LuaS_118toZone1_6() --執行傳送
---------------------------------------------------------------------
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),118,-1,563,676.3,-137,270)
end

---------------------------------------------------
function LuaS_Zone1to118_0() --進來
---------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_Zone1to118_1",50)
end

---------------------------------------------------
function LuaS_Zone1to118_1()
---------------------------------------------------
	if	CheckCompleteQuest(OwnerID(),422715)	then
		CancelBuff(OwnerID(),504308)
		if ChangeZone(OwnerID(),118,-1,-102.2,670.3,-2148,303) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
			DesignLog( OwnerID() , 118 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422717_5]", 0 )
	end
end

------------------------------------------------------------------------------------------
function LuaI_the_118_Enter()  ----傳送門進入用
--------------------------------------------------------------------------------------------
	SetPlot( OwnerID() , "Collision" , "LuaS_the_Zone118_Enter" , 0 )
end
function LuaS_the_Zone118_Enter()
	if ChangeZone( OwnerID() , 118 , -1 , -61 , 670 , -2080 , 294 ) then ---飛進去副本的座標
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		DesignLog( OwnerID() , 118 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

----------------------------------------------------------------------------------------------
function LuaI_the_118_Out() ---傳送門出口用
---------------------------------------------------------------------------------------------
	SetPlot( OwnerID() , "Collision" , "LuaS_the_Zone118_Out" , 0 )
end
function LuaS_the_Zone118_Out()
	if ChangeZone( OwnerID() , 1 , 0, 2417 , -220, -5416 , 232 ) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end