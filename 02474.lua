--- Z21 委託任務劇情 (米佳)


-------------- 424540 偷竊那些不實的傳單 ----------------

function lua_mika_z21_424540_end()
	Setflag(TargetID(), 545605, 1)   -- 給接下一個任務需要的KEY
	Lua_ZonePE_3th_GetScore(110)
end


-- 任務NPC - 雷奇夫王國告示板(119420) 初始對話劇情
function lua_mika_z21_Q424540_npc1()

	local quest = CheckAcceptQuest( OwnerID(), 424540 )  -- 檢查是否有接任務 true = 有 ,  false = 沒

	if quest == true then -- 有接任務
		if Checkflag(OwnerID(), 545596 ) == false then  -- 沒key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- 還有得撕
			AddSpeakOption(OwnerID(), TargetID(), "[SC_Z21_Q424540_01]", "lua_mika_z21_Q424540_npc11", 0) -- 撕下傳單
		else
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_02]")    -- 沒得撕了
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- 還有得撕
	end
end


function lua_mika_z21_Q424540_npc2()
	local quest = CheckAcceptQuest( OwnerID(), 424540 )  -- 檢查是否有接任務 true = 有 ,  false = 沒

	if quest == true then -- 有接任務
		if Checkflag(OwnerID(), 545597 ) == false then  -- 沒key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- 還有得撕
			AddSpeakOption(OwnerID(), TargetID(), "[SC_Z21_Q424540_01]", "lua_mika_z21_Q424540_npc22", 0) -- 撕下傳單
		else
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_02]")    -- 沒得撕了
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- 還有得撕
	end
end

function lua_mika_z21_Q424540_npc3()
	local quest = CheckAcceptQuest( OwnerID(), 424540 )  -- 檢查是否有接任務 true = 有 ,  false = 沒

	if quest == true then -- 有接任務
		if Checkflag(OwnerID(), 545598 ) == false then  -- 沒key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- 還有得撕
			AddSpeakOption(OwnerID(), TargetID(), "[SC_Z21_Q424540_01]", "lua_mika_z21_Q424540_npc33", 0) -- 撕下傳單
		else
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_02]")    -- 沒得撕了
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424540_03]")    -- 還有得撕
	end
end




-- 撕下傳單
function lua_mika_z21_Q424540_npc11()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545596, 1 )
end

function lua_mika_z21_Q424540_npc22()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545597, 1 )
end

function lua_mika_z21_Q424540_npc33()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545598, 1 )
end

-----------  424541 散播謠言 ----------- 

---- 任務NPC - 港口的老人(119423) 初始對話劇情
function lua_mika_z21_Q424541_npc01()

	local quest = CheckAcceptQuest( OwnerID(), 424541 )  -- 檢查是否有接任務 true = 有 ,  false = 沒

	if quest == true then -- 有接任務 
		if  Checkflag( OwnerID(), 545599 )  == false then --  沒key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_05]")   -- 一般對話
			AddSpeakOption( OwnerID(), TargetID(), "[SC_Z21_Q424541_01]", "lua_mika_z21_Q424541_npc11", 0) -- (有空嗎？我想和你說個故事…。)
		else  --有key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_02]")   -- 已完成對話
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_05]")   -- 一般對話
	end

end

function lua_mika_z21_Q424541_npc11()
	SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_02]")   -- 已完成對話
	Setflag(OwnerID(), 545599, 1)
end


---- 任務NPC - 酒吧的服務員 (119424) 初始對話劇情
function lua_mika_z21_Q424541_npc02()

	local quest = CheckAcceptQuest( OwnerID(), 424541 )  -- 檢查是否有接任務 true = 有 ,  false = 沒

	if quest == true then -- 有接任務 
		if  Checkflag( OwnerID(), 545600 )  == false then --  沒key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_06]")   -- 一般對話
			AddSpeakOption( OwnerID(), TargetID(), "[SC_Z21_Q424541_01]", "lua_mika_z21_Q424541_npc22", 0) -- (有空嗎？我想和你說個故事…。)
		else  --有key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_03]")   -- 已完成對話
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_06]")   -- 一般對話
	end

end

function lua_mika_z21_Q424541_npc22()
	SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_03]")
	Setflag(OwnerID(), 545600, 1)
end



---- 任務NPC - 城裡的婦女(119425) 初始對話劇情
function lua_mika_z21_Q424541_npc03()

	local quest = CheckAcceptQuest( OwnerID(), 424541 )  -- 檢查是否有接任務 true = 有 ,  false = 沒

	if quest == true then -- 有接任務 
		if  Checkflag( OwnerID(), 545601 )  == false then --  沒key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_07]")   -- 一般對話
			AddSpeakOption( OwnerID(), TargetID(), "[SC_Z21_Q424541_01]", "lua_mika_z21_Q424541_npc33", 0) -- (有空嗎？我想和你說個故事…。)
		else  --有key
			SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_04]")   -- 已完成對話
		end
	else
		SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_07]")   -- 一般對話
	end

end

function lua_mika_z21_Q424541_npc33()
	SetSpeakDetail(OwnerID(), "[SC_Z21_Q424541_04]")
	Setflag(OwnerID(), 545601, 1)
end



--------------- 424542 發送給居民 ----------------

-- 物品 - 240643 海鷗的宣傳單 使用檢查
function lua_mika_z21_240643_check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	-- 可以使用的NPC列表 廣場上的居民
	local TargetNPC = { 119371, 119375, 119148, 119376, 119370, 119445, 119439, 119443, 119472, 119442, 119369, 119444,  119425, 114891, 119367 }

	local dis = GetDistance(OwnerID(), TargetID() )

	if Checkquest(OwnerID(), 424542, 0 )  == true then  -- 有接此任務

		if dis <= 50 then
			if ( CheckID( TargetID() ) == false ) then  --沒有對象
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
				return false
			elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
				return false
			else  
				for i = 1 , 15  do
					if OrgID == TargetNPC[i] and  CheckBuff( TargetID(), 620773 ) == true then
						-- 很煩欸，傳單什麼的暫時不要再拿給我了。
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_02]" , 0 )
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_02]" , 0 )
						return false
					elseif OrgID == TargetNPC[i] and  CheckBuff( TargetNPC[i], 620773 ) == false then
						AddBuff(TargetID(), 620773 , 0 , 15 ) -- 宣傳過效果 15S

						local R = Rand(100)+1
						local R2 = Rand(100)+1
						if R > 45 then
							return true
						else
							if R2 > 60 then
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_06]" , 0 )
								ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_06]" , 0 )
								return false
							else
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_07]" , 0 )
								ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_07]" , 0 )
								return false
							end

						end


					end
				end
				-- 請將此傳單發給[ZONE_LATIFF_KINGDOM]廣場上的居民們。
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_01]" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_01]" , 0 )
				return false
			end
		else
			-- 請你和目標的距離太遠，無法發送傳單。
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_08]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_08]" , 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_424626_2]" , 0 )  
		return false
	end
end

-- 物品 - 240643 海鷗的宣傳單 使用劇情
function lua_mika_z21_240643_use()
--	say(OwnerID(), "OwnerID" ) -- player
--	say(TargetID(), "TargetID" )   -- NPC

	local R = Rand(100)+1
--	Say(OwnerID(), "R = "..R )

	if R > 45 then   -- 成功1
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_04]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_04]" , C_SYSTEM  )

	else 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424542_05]" , C_SYSTEM  )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424542_05]" , C_SYSTEM  )
	end
	DW_QietKillOne(OwnerID(), 103003  )
end
	

-- 完成424542 發送給居民 任務後 觸發劇情
function lua_mika_z21_424542_end()
	Setflag(TargetID(), 545605, 0 )
	Lua_ZonePE_3th_GetScore(340)  -- 2011.11.07 下修積分為100
end	

-----------  424539 反抗軍的消息傳遞 ----------------------

-- Z21 任務物品 - 240644 傳訊用煙火 使用檢查
function lua_mika_z21_240644_check()
	local count = Lua_Hao_NPC_Range_Search( OwnerID() , 119422 , 30 )  -- range 內 煙火施放點物件數量

	if Checkquest(OwnerID(), 424539 , 0 )  == true then  -- 有接此任務
		if count > 0 then -- 如果有附近有煙火施放點NPC
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z21_Q424539_01]" , 0 )  --離[119422]太遠，還不能施放。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z21_Q424539_01]" , 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_424626_2]" , 0 )  
		return false
	end
end
		

-- Z21 任務物品 - 240644 傳訊用煙火 使用劇情
function lua_mika_z21_240644_use()
	local fire = Lua_Hao_NPC_Closest_Search( OwnerID() , 119422  , 30 ) -- 以Owner為中心做范圍搜尋，回傳最接近的物件
	CastSpell(OwnerID(), OwnerID(), 492033 )  --施放煙火法術
	DW_QietKillOne(OwnerID(), 103002  )  -- 暗暗殺死一隻NPC - 施放傳訊用煙火
	BeginPlot(fire, "lua_mika_z21_firehide", 0 )
end

function lua_mika_z21_firehide()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	Hide(OwnerID())
	sleep(450)  -- 10S
	Show( OwnerID(), RoomID ) 

end