-- Z31 新種族支線任務劇情 (米佳)  -- 11 - 20

--------------Q12   --------------
--425043 殲滅計畫

--物品 - 暗能擷取符文	241064使用檢查
function lua_mika_Q425043_item_check()
	local TID = TargetID()    -- NPC
	local OID = OwnerID()  -- Player

	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( TID , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  TID , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP	--血量百分比
	local PID = ReadRoleValue( TID, EM_RoleValue_PID )  -- 讀取怪物PID

	if  CheckAcceptQuest(OID , 425043 ) == true then  -- 有接此任務
		if ( CheckID( TID ) == false ) then  --沒有對象
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
			return false
		else  
			if OrgID == 106564  or OrgID == 106566 then   -- 對象正確 暗能傀儡(106564)  ,  暗能游蟲(106566) 
				if  ReadRoleValue(  TID , EM_RoleValue_IsDead ) == 1 then   -- 如果目標已死的話
					ScriptMessage( OID , OID , 1 , "[SC_493625_2]" , 0 )	--目標已死亡
					return false
				else
					if  HPPercent > 0.3  then  -- 目標血量 多於30 %
						ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425043_01]" , 0 ) -- new 魔法獸靈敏地逃脫了。
						return false
					else
						if  PID == 9 then 
							ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425043_02]" , 0 ) -- new  無法再抽取更多的暗能。
							return false
						else	-- 成功
							return true
						end
					end
				end
			else
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 )  --使用目標錯誤！
				return false
			end
		end
	else
		ScriptMessage( OID,  OID, 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		return false
	end
end


--物品 - 暗能擷取符文	241064使用
function lua_mika_Q425043_item_use()
	local OID = OwnerID()  -- Player
	local TID = TargetID()   -- 怪物
	local npcid = 106686  -- 抽取暗能	
	local magicid = 850059

	CastSpell(TID, OID , magicid )   -- 怪物回饋法術特效
	WriteRoleValue(TID, EM_RoleValue_PID , 9 )  -- 寫入怪物PID?
	local PID = ReadRoleValue( TID, EM_RoleValue_PID )  -- 讀取怪物PID
--	Say(OID, PID )
	DW_QietKillOne(OID, npcid  )
end


--------------Q14   --------------
-- 425045 士兵的挑釁

-- 喬伊．熔晶120454
--npc初始對話劇情
Function lua_mika_Q425045_npc01()
	local OID = OwnerID()
	local TID = TargetID()
	local keyid = 546227 -- 完成喬伊．熔晶的挑戰 
	local questid = 425045
	local buffid =   622243 -- 任務進行中buff

	if CheckAcceptQuest( OID, questid ) == true  then --有接任務
		if CheckFlag(OID, keyid ) == False and CheckBuff(OID, buffid ) == false  then  -- 沒任務進行中buff
			SetSpeakDetail(OID, "[SC_Z31_Q425045_02]"  )  -- new 你準備好接受挑戰了嗎？
			AddSpeakOption( OID, OID, "[SC_421955_1]", "lua_mika_Q425045_npcspeak2", 0 )--  我準備好了!  (既有字串)
		else
			LoadQuestOption(OID)
		end
	else 
		LoadQuestOption(OID)
	end
end


function lua_mika_Q425045_npcspeak2()
	local OID = OwnerID()
	local TID = TargetID()
	local buffid =  622243 -- 任務專用buffid   觸發法術用 每秒執行劇情   (離線, 換區消失)
	local keyid = 546268  -- 士兵挑釁任務進行中

	CloseSpeak(OID)
	WriteRoleValue(TID, EM_RoleValue_PID , 9 )   -- 寫入NPC PID 值為 9 

	WriteRoleValue(OID, EM_RoleValue_Register1 , 0 )  -- score
	WriteRoleValue(OID, EM_RoleValue_Register2 , 12 )  -- timer
	local score = ReadRoleValue(OID, EM_RoleValue_Register1 )
	local timer  = ReadRoleValue(OID, EM_RoleValue_Register2 )

--	Say(OID , "score = "..score )
--	Say(OID , "timer ="..timer )
	local Time = timer*5

	Setflag(OID, keyid, 1 )  -- 給予接任務keyitem 放棄任務時刪除
	AddBuff(OID, buffid, 0 , 60 )   -- 觸發法術用 每秒執行劇情
	ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425045_01][$SETVAR1="..Time.."]" , C_SYSTEM ) -- new 剩餘時間：[$VAR1]秒

end



-- buff  每5秒觸發法術
function lua_mika_Q425045_buff()
	local OID = OwnerID()  -- Player
	local buffid =  622243 -- 任務專用buffid   觸發法術用 每秒執行劇情   (離線, 換區消失)
	local keyid = 546268  -- 士兵挑釁任務進行中
	local key = Checkflag(OID, 546268 )  -- 任務進行中BUFF

	if key == true then
		AddRoleValue(OID, EM_RoleValue_Register2 , -1)
		local timer  = ReadRoleValue(OID, EM_RoleValue_Register2 )

		local Time = timer*5
		if timer > 0 then
			ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425045_01][$SETVAR1="..Time.."]" , C_SYSTEM ) -- new 剩餘時間：[$VAR1]秒
		end
		if time == 0 then
			local keyid = 546227 -- 完成喬伊．熔晶的挑戰 
			SetFlag(OID, keyid , 1)
			ScriptMessage( OID , OID , 1 , "[SC_DANCEFES_SUKI_MAKE15]" , C_SYSTEM ) -- 時間到 (既有字串)
		end
	else
	--	Say(OID, "no key, Cancel buff")
		CancelBuff(OID, Buffid )
	end
end


-- 怪物死亡劇情
function lua_mika_Q425045_dead()
	local OID = OwnerID()
	SetPlot( OID , "dead" , "lua_mika_Q425045_dead1" , 0 );
end

function lua_mika_Q425045_dead1()
	local OID = OwnerID() 
	local TID = TargetID()  -- player 
	local questid = 425045   -- 士兵的挑釁
	local buffid =   622243 -- 任務進行中buff

	if CheckAcceptQuest( TID, questid ) == true  and CheckBuff(TID, buffid ) == true  then
		AddRoleValue(TID , EM_RoleValue_Register1 , 1  ) -- score
		local score = ReadRoleValue(TID, EM_RoleValue_Register1 )   --分數
		ScriptMessage( TID , TID , 2 , "[SC_Z31_Q425045_03][$SETVAR1="..score.."]" , C_SYSTEM ) -- 目前得分：[$VAR1]分
--		Say(TID , "score ="..score )

	end

end


function lua_mika_Q425045_complete()
	local OID = OwnerID()
	local TID = TargetID()  -- player 

	local score = ReadRoleValue(TID, EM_RoleValue_Register1 )   --分數

	if score >= 5 then
		ScriptMessage( TID , TID , 1 , "[SC_Z31_Q425045_06]" , C_SYSTEM ) 
		GiveBodyItem( TID, 203489 , 5 )  -- 必爾汀初級神奇水
 		-- 好吧，我輸了...公主果然沒有看錯你，你去吧，別辜負我們的期望。
	elseif score < 5 then
		ScriptMessage( TID , TID , 1 , "[SC_Z31_Q425045_05]" , C_SYSTEM ) 
		-- ...沒想到你也不過如此，雖說如此公主一定有她的理由。再會吧。
	end

end

--------------Q15   --------------

--425046-袪除寒氣

-- 點擊任務物件 燃燒的火堆	120431
function lua_mika_Q425046_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_mika_Q425046_touch2" , 50 )
end

--讀取施法條前檢查
function lua_mika_Q425046_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local questid = 425046
	local questid2 = 425223
	local buffid = 622201 -- cd 用法buff
	local needid =  241066 --火柴盒

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, questid ) == true or CheckAcceptQuest( Player, questid2 ) == true then

		if Mount == true then --不在後座
			if CountBodyItem(Player, needid ) > 0 then 
				if CheckBuff(NPC, buffid ) == false then
					if BeginCastBarEvent( Player , NPC , "[SC_Z31_Q425046_02]" , 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425046_touch3") ~= 1 then 
					--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					-- 添加火柴
						ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
					end
				else
					ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425046_03]" , 0 ) --  現在還不需要[SC_Z31_Q425046_02]。
				end
			else
				ScriptMessage( Player , Player , 1 , "[NO_ITEM][$SETVAR1=[241066]]" , 0 )   --  你沒有[$VAR1]。
			end
		else --在後座
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425046_01]" , 0 ) -- New 你現在還不需要使用它。
	end

end

function lua_mika_Q425046_touch3( Player , CheckStatus )
	local Player = OwnerID()
	local NPC = TargetID()  
	local npcid = 106687  -- 添加木柴	
	local buffid = 622201 -- cd 用法buff

	DW_CancelTypeBuff( 68 , Player) --騎乘坐騎時，點擊下馬
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			AddBuff(NPC, buffid, 0 , 30 )
			DW_QietKillOne(Player, npcid  )
			EndCastBar( Player , CheckStatus ) --清除施法條	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end



--------------Q18   --------------
--  425054	抵禦外敵

-- 距離部份 用法術判斷

-- 物品 - 魔盾之藥 241117  使用劇情
function lua_mika_Q425054_itemcheck()
	local OID = OwnerID()
	local TID = TargetID()
	local OrgID = 106585 --	先鋒營地守衛
	local TargetNPC = ReadRoleValue(TID, EM_RoleValue_OrgID )
	local buffid = 622203  -- 魔盾之藥效果
	local bufftime = 25

	if Checkquest( OID, 425054, 0 )  == true or Checkquest( OID, 425225, 0 )  == true then  -- 有接此任務 
		if ( CheckID( TargetID() ) == false ) then  --沒有對象
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
			return false
		else  
			if OrgID ~= TargetNPC then
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				return false
			else
				if CheckBuff( TID, buffid ) == false then  -- 沒buff
					return true
				else  -- 有buff
					ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425054_01]" , 0 )   -- new 發送對象已持有[622203]。
					return false
				end
			end
		end
	else
		ScriptMessage( OID(),  OID, 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		return false
	end
end


-- 物品 - 魔盾之藥 241117  使用劇情
function lua_mika_Q425054_itemuse()
	local OID = OwnerID()  -- Player 
	local TID = TargetID()   -- npc
	local npcid = 106688  --	使用魔盾之藥
	local buffid = 622203  -- 魔盾之藥效果
	local bufftime = 15	

	CastSpell(TID, TID, 850062 )  -- 純粹特效
	DW_QietKillOne(OID, npcid  )
	AddBuff(TID, buffid , 0 , bufftime ) 
	local R = Rand(100)+1

	if R > 70 then 
		NPCSAY(TID, "[SC_Z31_Q425054_02]" )
	else
		NPCSAY(TID, "[SC_Z31_Q425054_03]" )
	end
end


--------------Q19   --------------
-- 425055	提振士氣

-- 傳送石劇情
function lua_mika_Q425055_stone()  --傳送石
	ChangeZone(OwnerID() , 31, 0, 1263, 1560, -947, 81)
end


-- 笛索．影焰 初始對話劇情
function LuaS_120441_0()  --lua_mika_Q425055_npcspeak原function名稱
	local OID = OwnerID()
	local TID = TargetID()
	local questid = 425055
	local keyid = 546226  -- 取得笛索．影焰的同意
	local key = Checkflag(OID, keyid )
	
	LoadQuestOption(OID)
	SetSpeakDetail(OID, "[SC_Z31_Q425055_01]"  )  -- new 
	if CheckAcceptQuest( OID, questid ) == true and key == false then -- 有接此任務 & no key
		AddSpeakOption( OID, OID, "[SC_Z31_Q425055_02]", "lua_mika_Q425055_npcspeak2", 0 )--  new 
		-- 能給我一些酒嗎？
	end
	LuaS_110388_0()	--2012/09/24增加學習烹飪選項
end

-- 笛索．影焰2
function lua_mika_Q425055_npcspeak2()
	local OID = OwnerID()
	local TID = TargetID()
	local keyid = 546226  -- 取得笛索．影焰的同意

	Setflag(OID, keyid, 1 )
	SetSpeakDetail(OID, "[SC_Z31_Q425055_03]"  )  -- new 
	-- 旁邊有些酒瓶，要多少你就自己拿吧，別客氣！
end


--陳年酒桶	120322
--- 物件觸碰劇情  
function lua_mika_Q425055_touch()
	local obj = OwnerID()	
	Setplot(obj,  "touch" , "lua_mika_Q425055_touch2" , 50 )		
end 

function lua_mika_Q425055_touch2()
	local NPC = TargetID()
	local player = OwnerID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local keyid = 546226  -- 取得笛索．影焰的同意
	local key = Checkflag(player, keyid )

	local itemid  = 241118 --溫熱美酒	
	local count = CountBodyItem(player, itemid )   --  溫熱美酒 count 	

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, 425055 ) == true then
		if key == true then  -- 有key
			if count < 3 then 
				if Mount == true then --不在後座
					if BeginCastBarEvent( Player , NPC , "[SC_Z31_Q425055_04]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425055_touch3") ~= 1 then 
					--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)  
					-- new 盛裝美酒
						ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
					end
				else --在後座
					ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
				end
			else
				ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425055_06]" , 0 ) --  new  你已取得足夠的物品。
			end

		else
			ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425055_05]" , 0 ) -- new 還是先和[120441]說一聲吧？
		end
	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- 沒有此任務 
	end
end

function lua_mika_Q425055_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- 酒桶
	local itemid  = 241118 --溫熱美酒	

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
	
			GiveBodyItem(Player, itemid , 1 )
			BeginPlot(NPC, "lua_mika_Q425055_hidden", 10 )  
			EndCastBar( Player , CheckStatus ) --清除施法條	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end

function lua_mika_Q425055_hidden()
	local npc = OwnerID()
	local sleeptime = 250

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end