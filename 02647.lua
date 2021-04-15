-- Z31 新種族支線任務劇情 (米佳)

--------- Q1  --------- 

-- 點擊任務物件  罕葛拉礦採集點- 120428
function lua_mika_Q425018_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_mika_Q425018_touch2" , 50 )
end

--讀取施法條前檢查
function lua_mika_Q425018_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local questid = 425018 
	local itemid = 241057  -- 珍稀的罕葛拉礦石

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, questid ) == true  then

		if CountBodyItem( Player, itemid ) <5 then
			if Mount == true then --不在後座
				if BeginCastBarEvent( Player , NPC , "[SC_TITLEQUEST_05]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425018_touch3") ~= 1 then 
				--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_420952_0]" , 0 ) --你已經收集到足夠的物品了
		end

	else
		ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425018_01]" , 0 ) --現在還不需要採取此礦石。
	end

end

function lua_mika_Q425018_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- 礦
	local itemid = 241057  -- 珍稀的罕葛拉礦石
	local itemid2 = 241058  -- 普通的罕葛拉礦石

	DW_CancelTypeBuff( 68 , Player) --騎乘坐騎時，點擊下馬
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位 
				local R= rand(100)+1 
				if  R > 15 then -- 85 % 機率拿到任務需求
					GiveBodyItem(Player, itemid , 1 )
				else
					GiveBodyItem(Player, itemid2 , 1 )	
				end
				BeginPlot(NPC, "lua_mika_Q425018_hidden", 10 )  
				EndCastBar( Player , CheckStatus ) --清除施法條
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end

function lua_mika_Q425018_hidden()
	local npc = OwnerID()
	local sleeptime = 150    --30

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end
 
---------- Q3 -----------
--交付失主 425028


--  掛在暗能傀儡 106564 及 106566 暗能游蟲這兩隻怪物的死亡劇情上

function lua_mika_Q425028_dead1()
	local OID = OwnerID()  -- monster
	local TID = TargetID()  -- player

	local Room = ReadRoleValue(OID, EM_RoleValue_RoomID )
	local questid = 425028
	local itemid = 241060
	local itemcount = CountBodyItem(TID,  itemid )
--	say(OID, "OID" )
--	say(TID, "TID" )

	-- 暗能傀儡 或暗能游蟲  重生pid歸零
	WriteRoleValue(OID, EM_RoleValue_PID , 0 )  -- 寫入怪物PID

	if CheckCompleteQuest(TID, questid)==false and CheckAcceptQuest(TID, questid ) == false and itemcount == 0 then  
		ScriptMessage( TID, TID , 1 , "[SC_Z31_Q425028_01]" , C_SYSTEM ) --  附近掉落了一個小袋子，不如撿起來來看看？

		local npcid = 120662  -- 破舊的袋子
		local NPC = Lua_CreateObjByDir( OID , npcid , 15 , 0);
		SetModeEx(NPC, EM_SetModeType_Move, false )--移動
		SetModeEx(NPC, EM_SetModeType_Show, true )--顯示
		SetModeEx(NPC, EM_SetModeType_Mark, true )--標記
		SetModeEx(NPC, EM_SetModeType_Strikback, false )--反擊
		SetModeEx(NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx(NPC, EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx(NPC, EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx(NPC, EM_SetModeType_HideName, false )--名稱
		SetModeEx(NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx(NPC, EM_SetModeType_Fight , false  )--可砍殺攻擊
		SetModeEx(NPC, EM_SetModeType_Drag , false )--阻力

		AddToPartition( NPC , Room ) -- 建立物件
		Setplot(NPC, "touch", "lua_mika_Q425028_objtouch" , 50 )
		BeginPlot(NPC, "lua_mika_Q425028_delete", 0 )    --  無人點擊30S後消失
	end
end


function lua_mika_Q425028_objtouch()
	local OID = OwnerID()  -- player
	local TID = TargetID()  -- npc

	GiveBodyItem(OID, 241060 , 1 )
	Delobj(TID)
end

function lua_mika_Q425028_delete()
	local OID = OwnerID()  -- obj

--	say(OID, "hi" )
	Sleep(300)
	Delobj(OID)
--	say(OID, "delete" )
end


-- 點選物品觸發石碑介面 241060 手工鐵製項鍊
function lua_mika_Q425028_item()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	local needlv = 6  -- 任務需求等級 
		
	ClearBorder( OwnerID());  --初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 425028 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= needlv then
		ShowBorder( OwnerID(),425028, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end




-----------  Q4 -------------- 
-- 425029 記憶中的容貌

-- 相關npc初始對話劇情
function lua_mika_Q425029_01()
	local npc = TargetID()
	local player = OwnerID()	

	local npclist = { 120437 , 120438 , 120439 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z31_Q425029_02]" , "[SC_Z31_Q425029_04]" , "[SC_Z31_Q425029_06]"}
	local keyitem = {546223 , 546224, 546225 }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			if CheckAcceptQuest( Player, 425029 ) == true then -- 有接此任務
				if Checkflag(Player,keyitem[i] ) == false then
					AddSpeakOption( player, player, "[SC_Z31_Q425029_01]", "lua_mika_Q425029_02", 0 )-- 你好，我有件事想請問......。
					break
				end
			end
		end
	end
end

function lua_mika_Q425029_02()
	local npc = TargetID()
	local player = OwnerID()
	local npclist = { 120437 , 120438 , 120439 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z31_Q425029_03]" , "[SC_Z31_Q425029_05]" , "[SC_Z31_Q425029_07]"}
	local keyitem = {546223 , 546224, 546225 }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			Setflag(player, keyitem[i] , 1 )
			break
		end
	end
end

--------------Q6 --------------

-- 重執菜刀  425031
--物品 - 牢固的皮袋 - 241061  使用檢查
function lua_mika_Q425031_item_check()
	local TID = TargetID()    -- NPC
	local OID = OwnerID()  -- Player

	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( TID , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  TID , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP	--血量百分比
	local Count = CountBodyItem(OID, 241062 )  --  虛弱的晶岩錦蛇

	if  CheckAcceptQuest(OID,425031 ) == true then  -- 有接此任務
		if count >= 5 then
			ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425055_06]" , 0 ) --你已取得足夠的物品。
			return false
		else
			if ( CheckID( TID ) == false ) then  --沒有對象
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				return false
			elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				return false
			else  
				if OrgID == 106558  then   -- 對象正確 晶岩錦蛇 106558
					if  ReadRoleValue(  TID , EM_RoleValue_IsDead ) == 1 then   -- 如果目標已死的話
						ScriptMessage( OID , OID , 1 , "[SC_493625_2]" , 0 )	--目標已死亡
						return false

					else
						if  HPPercent > 0.3  then  -- 目標血量 多於30 %
							ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425031_01]" , 0 ) -- [106558]逃脫了你的捕捉。
							return false
						else	
							  -- 成功
							return true
						end
					end

				else
					ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 )  --使用目標錯誤！
					return false
				end

			end
		end

	else
		ScriptMessage( OID,  OID, 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		return false
	end

end


--物品 - 牢固的皮袋 - 241061  使用效果
function lua_mika_Q425031_item_use()
	local OID = OwnerID()  -- Player
	local Monster = TargetID()  

	BeginPlot(Monster, "lua_mika_Q425031_objhide", 0 )
	GiveBodyItem( OID, 241062, 1 )  -- 虛弱的晶岩錦蛇	241062  
end

function lua_mika_Q425031_objhide()
	local npc = OwnerID()
	local sleeptime = 150    

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )
end

-------------- Q7 --------------
 
-- 425032 懷念的滋味
-- 物品 - 香燉蛇肉 241063  使用檢查
function lua_mika_Q425032_itemcheck()

	local OID = OwnerID()   -- player
	local TID = TargetID()
	local OrgID = ReadRoleValue(  TID , EM_RoleValue_OrgID )
	-- 可以使用的NPC列表 廣場上的居民
	local TargetNPC = {  
			106583, 119641, 119642, 119645, 119879, 119880, 119881, 119883, 119884, 119904, 
			119905, 120434, 120435, 120437, 120438, 120439, 120237, 120238, 120239, 120240,
			120244, 120245, 120249, 120440, 120442, 120443, 120453 
			}

	local buffid = 622201

	local dis = GetDistance(OID, TID )

	if Checkquest( OID, 425032, 0 )  == true  or Checkquest( OID, 425221, 0 )  == true then  -- 有接此任務  

		if dis <= 50 then
			if ( CheckID( TargetID() ) == false ) then  --沒有對象
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				return false
			elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
				return false
			else  
				for i = 1 , table.getn(TargetNPC)  do
					if OrgID == TargetNPC[i] then
						if CheckBuff( TID, buffid ) == false then  -- 沒buff
							return true
						else  -- 有buff
							ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_02]" , 0 )   -- new 發送對象已持有[241063]。
							return false
						end
					end
				end
				-- 請發送給[ZONE_IFANTRISH_CRYPT_02]的居民們。 new
				ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_01]" , 0 )
				return false
			end
		else
			ScriptMessage( OID , OID , 1 , "[SC_204639_2]" , 0 )  -- 目標距離過遠
			return false
		end
	else
		ScriptMessage( OID,  OID, 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		return false
	end
end

-- 物品 - 香燉蛇肉 241063  使用劇情
function lua_mika_Q425032_itemuse()
	local OID = OwnerID()  -- Player 
	local TID = TargetID() -- npc
	local npcid = 106684  -- 發送香燉蛇肉
	local buffid = 622201
	local buffitme = 30

	local R = Rand(100)+1
--	Say(OwnerID(), "R = "..R )

	if R > 55 then   -- 45
		ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_03]" , C_SYSTEM )  --  這個味道......咦，我臉上怎麼開始下起雨來了？
	elseif R <= 55 and R >= 35 then  -- 20
		ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_04]" , C_SYSTEM )  -- 享受食物是這麼開心的一件事啊，你讓我回想起來了。
	elseif R < 35 then
		ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_05]" , C_SYSTEM )  -- 還有沒有多的能給我？拜託！
	end
	DW_QietKillOne(OID, npcid  )
	AddBuff(TID, buffid , 0 , buffitme ) 

end

-------------- Q9 -------------- 

-- 研究器材 120429
--- 物件觸碰劇情  
function lua_mika_Q425034_touch()
	local obj = OwnerID()	
	Setplot(obj,  "touch" , "lua_mika_Q425034_touch2" , 50 )		
end 


function lua_mika_Q425034_touch2()
	local NPC = TargetID()
	local player = OwnerID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, 425034 ) == true then
		if Mount == true then --不在後座
			if BeginCastBarEvent( Player , NPC , "[SC_Z31_Q425034_01]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425034_touch3") ~= 1 then 
			--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)  
			-- 對研究器材動手腳 new
				ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
			end
		else --在後座
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
		end

	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- 沒有此任務 
	end
end

function lua_mika_Q425034_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- 器材

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
			local npcid = 106685  -- 對研究器材動手腳

			DW_QietKillOne( Player, npcid ) 
			BeginPlot(NPC, "lua_mika_Q425034_hidden", 0 )  
			EndCastBar( Player , CheckStatus ) --清除施法條	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end

function lua_mika_Q425034_hidden()
	local npc = OwnerID()
	local sleeptime = 180

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end
--------------------------------------