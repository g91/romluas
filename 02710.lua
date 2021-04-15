-- 2012年 7月 綵織節 活動節慶背景 共用函式

function lua_mika_weave_story()
	SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_02]")
end

-- 2012 7月 綵織節 活動 - 魔法裁縫師

-- npc對話
-- pid =  0 = 非報名時段 , 1 = 報名開放中 , 
-- EM_RoleValue_Register = npc R1 用於判斷本場次已報名人數

function lua_mika_weave_npc01()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local PID = ReadRoleValue(TID, EM_RoleValue_PID )  --  0 = 非報名時段 , 1 = 報名開放中 , 

	if PID == 1 then -- 活動開放期間
		SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_11]" )   -- 對話
		AddSpeakOption( OID, OID, "[SC_COLORWEAVE_01]","lua_mika_weave_story",0) --綵織節的由來
		AddSpeakOption( OID, OID, "[SC_WEAVE_TAILOR_12]" , "lua_mika_weave_npc02" , 0)    -- rule 我該如何協助你？ 
		if CheckBuff(OID, 623044 ) == false then   -- 沒報名buff
			AddSpeakOption( OID , OID , "[SC_WEAVE_TAILOR_13]" , "lua_mika_weave_npc03" , 0)    -- join 讓我來幫個忙吧！
		end
	else
		AddSpeakOption( OID, OID, "[SC_COLORWEAVE_01]","lua_mika_weave_story",0) --綵織節的由來
		SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_14]" )   -- 對話
		AddSpeakOption( OID , OID , "[SC_WEAVE_TAILOR_12]" , "lua_mika_weave_npc02" , 0)    -- rule 我該如何協助你？ 
	end
end

function lua_mika_weave_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target

	SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_15]" )   -- 對話 RULE
	AddSpeakOption( OID , OID , "[SO_BACK]" , "lua_mika_weave_npc01" , 0)    --back 
end

function lua_mika_weave_npc03()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local R1 = ReadRoleValue(TID, EM_RoleValue_Register) -- npc R1 用於判斷本場次已報名人數
	local today = Checkflag(OID, 546863 )  --當天已玩過魔法裁縫師

	if today == true then
		SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_17]" )  --  今天已經玩過
		AddSpeakOption( OID , OID , "[SO_BACK]" , "lua_mika_weave_npc01" , 0)    --back 
	else 
		if R1 > 9  then -- 滿員 
			SetSpeakDetail( OID , "[SC_WEAVE_TAILOR_16]" )  -- 人數已滿
			AddSpeakOption( OID , OID , "[SO_BACK]" , "lua_mika_weave_npc01" , 0)    --back 
		else
			AddRoleValue(TID, EM_RoleValue_Register , 1) 	--NPC記錄R1值+1
			CloseSpeak(OID)  -- 關閉對話視窗
			ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_26]" , C_SYSTEM )  
			ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_26]" , C_SYSTEM )

			local R1 = ReadRoleValue(TID, EM_RoleValue_Register) 
	--		Say(TID, "Join count  ="..R1 )
			Addbuff(OID, 623044, 0 , 900 ) -- 給予報名證明BUFF
		end
	end

end



------ 玩家技能  ----------

-- 法術1.2 施法檢查
function lua_mika_weave_skill01_check()
	local player = OwnerID()
	local Tailor = LuaFunc_SearchNPCbyOrgID( Player , 120889 , 160 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- 施法目標的Orgid

--	Say(player, "colormode ="..Colormode ) 
	if ( CheckID( TargetID() ) == false ) then  --沒有對象
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_TAILOR_20]" , 0 )  --  沒有施法目標
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_TAILOR_20]"  , 0 )
		return false
	else

		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_TAILOR_21]" , 0 )   --無法對玩家使用
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_TAILOR_21]"  , 0 )
			return false
		else  --不是玩家
			if ( OrgID == 103013 ) or ( OrgID == 103014 ) or ( OrgID == 103015 )  or ( OrgID == 106548 ) then
				return true
			else 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_TAILOR_22]" , 0 )   --目標錯誤，請對魔法元素使用
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_TAILOR_22]"  , 0 )
				return false
			end
		end
	end
end


-- 法術1 施放
function lua_mika_weave_skill01_use()
	local OID = OwnerID()  -- player
	local ball = TargetID()
	local Tailor = LuaFunc_SearchNPCbyOrgID( OID , 120889 , 160 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- 施法目標的Orgid
	local flag = 781158 -- balls
	local ballid = {103013, 103014, 103015, 106548 }

	if CheckID(ball) == true then
		if CheckBuff(ball, 623208 ) == true then
			-- do nothing
		else
		 	if Colormode == 1 then  -- 紅
				if ( OrgID == ballid[1] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --重置並刪除

					Addbuff(OID, 623045 , 0 , 180 ) -- 玩家獲得分數
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --施放成功，獲得分數1點
					AddBuff(OID, 623242, 0, 3)  -- 得分特效
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- 玩家分數
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- 玩家扣分數
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
						AddBuff(OID, 623243, 0, 3)  -- 扣分特效
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
					end
				end
			elseif Colormode == 2 then
				if ( OrgID == ballid[2] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --重置並刪除

					Addbuff(OID, 623045 , 0 , 180 ) -- 玩家獲得分數
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --施放成功，獲得分數1點
					AddBuff(OID, 623242, 0, 3)  -- 得分特效
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- 玩家分數
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- 玩家扣分數
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
						AddBuff(OID, 623243, 0, 3)  -- 扣分特效
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
					end
				end
			elseif Colormode == 3 then
				if ( OrgID == ballid[3] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --重置並刪除

					Addbuff(OID, 623045 , 0 , 180 ) -- 玩家獲得分數
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --施放成功，獲得分數1點
					AddBuff(OID, 623242, 0, 3)  -- 得分特效
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- 玩家分數
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- 玩家扣分數
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
						AddBuff(OID, 623243, 0, 3)  -- 扣分特效
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
					end
				end
			end
		end
	end
end


-- 法術2 施放
function lua_mika_weave_skill02_use()
	local OID = OwnerID()  -- player
	local ball = TargetID()
	local Tailor = LuaFunc_SearchNPCbyOrgID( OID , 120889 , 160 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = 紅 , 2 = 黃 ,  3 = 藍
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- 施法目標的Orgid
	local flag = 781174
	local flagpos = {30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49}
	local R = RAND(20)+1
	local ballid = {103013, 103014, 103015, 106548 }

	if CheckID(ball) == true then

		if CheckBuff(ball, 623208 ) == true then
			-- do nothing
		else
			if Colormode == 1 then  -- 紅
				if ( OrgID == ballid[2] ) or ( OrgID == ballid[3] ) or ( OrgID == ballid[4] )  then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --重置並刪除

					Addbuff(OID, 623045 , 0 , 180 ) -- 玩家獲得分數
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --施放成功，獲得分數1點
					AddBuff(OID, 623242, 0, 3)  -- 得分特效
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- 玩家分數
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- 玩家扣分數
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
						AddBuff(OID, 623243, 0, 3)  -- 扣分特效
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
					end
				end
			elseif Colormode == 2 then
				if ( OrgID == ballid[1] ) or ( OrgID == ballid[3] ) or ( OrgID == ballid[4] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --重置並刪除

					Addbuff(OID, 623045 , 0 , 180 ) -- 玩家獲得分數
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --施放成功，獲得分數1點
					AddBuff(OID, 623242, 0, 3)  -- 得分特效
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- 玩家分數
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- 玩家扣分數
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
						AddBuff(OID, 623243, 0, 3)  -- 扣分特效
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
					end

				end
			elseif Colormode == 3 then
				if ( OrgID == ballid[1] ) or ( OrgID == ballid[2] ) or ( OrgID == ballid[4] ) then  
					Addbuff(ball, 623208, 0 , 2)
					sleep(5)
					 lua_mika_weave_ballreset( TargetID() )  --重置並刪除

					Addbuff(OID, 623045 , 0 , 180 ) -- 玩家獲得分數
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_18]" , C_SYSTEM )  --施放成功，獲得分數1點
					AddBuff(OID, 623242, 0, 3)  -- 得分特效
				else
					local playerscore = FN_CountBuffLevel(OID, 623045 )  -- 玩家分數
					if playerscore >= 1 then 
						CancelBuff(OID, 623045)
						Addbuff(OID, 623045 , playerscore-1 , 180 ) -- 玩家扣分數
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
						AddBuff(OID, 623243, 0, 3)  -- 扣分特效
					else
						CancelBuff(OID, 623045)
						ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_19]" , 0 )   --施放錯誤，失去分數1點
					end

				end
			end
		end
	end
end



--------- 測試用指令

function lua_mika_weave_W99()
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 120888 , 100 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC

	WriteRoleValue(NPC, EM_RoleValue_Register2, 99 )
	local RR = ReadRoleValue(NPC, EM_RoleValue_Register2 )  -- 測試用報名開關
	Say(Player, "Weave Tailor ="..RR )

end

function lua_mika_weave_W100()
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 120888 , 100 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC

	WriteRoleValue(NPC, EM_RoleValue_Register2, 100 )
	local RR = ReadRoleValue(NPC, EM_RoleValue_Register2 )  -- 測試用報名開關
	Say(Player, "Weave Tailor  ="..RR )

end

function lua_mika_weave_W0()
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 120888 , 100 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC

	WriteRoleValue(NPC, EM_RoleValue_Register2, 0 )
	local RR = ReadRoleValue(NPC, EM_RoleValue_Register2 )  -- 測試用報名開關
	Say(Player, "weave Tailor - W ="..RR )

end
