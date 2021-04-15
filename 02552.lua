
-------- Q6 保持警戒  ------------

-- 物品 - 240882地獄胡椒炸彈 使用檢查

function lua_mika_z22_Q424830_check()
	local npc = TargetID()
	local player = OwnerID()	
	local npclist = { 119684, 119924, 119925, 119926, 119927 }
	local keyitem = { 545799, 545800, 545801, 545802, 545803 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )

	if CheckAcceptQuest( Player, 424831 ) == true or CheckAcceptQuest( Player, 425005 ) == true or CheckAcceptQuest( Player, 424842 ) == true then -- 有接此任務
		-- 檢查使用對象是不是自己 (不可以是自己)
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then --施法對象
			for j = 1, table.getn(npclist) do
				if Orgid == npclist[j] then
					if Checkflag(player, keyitem[j] ) == false then  -- 沒key
						-- 可以跑劇情
						return true
					else
						ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424831_03]" , 0 )  
						-- 已經給過他教訓了，暫時先觀察他看看吧。
						return false
					end
				end
			end

			ScriptMessage( Player , Player , 1 , "[SC_424142_1]" , 0 )  
			--使用目標錯誤！
			return false
		else
			ScriptMessage( Player , Player , 1 , "[SC_424142_1]" , 0 )  
			--使用目標錯誤！
			return false
		end
	else  --沒任務
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424831_04]" , 0 )  
		-- 沒有接受命令的狀況下，還是不要隨便對對戰士們惡作劇吧。
		return false
	end
end

function lua_mika_z22_Q424830_use()
	local NPC = TargetID()
	local player = OwnerID()	

	local npclist = { 119684, 119924, 119925, 119926, 119927 }
	local keyitem = { 545799, 545800, 545801, 545802, 545803 }
	local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424831_01]" , "[SC_Z22_Q424831_02]" }
		-- 這是什麼…咳咳，哈…哈…哈秋！！
		-- 水！給我水啊－－－！！！

	-- 讓NPC暫時移除頭象框 標記設定 使玩家不能點擊
	SetModeEx( NPC, EM_SetModeType_Mark, false )--標記
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框

	sleep(10)

--	PlayMotion( NPC, 105 )  -- 哭哭

	--NPC說話 ( 其中一種 )
	local R = Rand(100)+1
	if R > 60 then
		Npcsay(NPC, "[SC_Z22_Q424831_01]" )  --這是什麼…咳咳，哈…哈…哈秋！！
	else
		Npcsay(NPC, "[SC_Z22_Q424831_02]" )  --水！給我水啊－－－！！！
	end

	for i = 1 , table.getn(npclist) do
		if Orgid == npclist[i] then
			Setflag(player, keyitem[i], 1 )  -- 給予對應keyitem
			break
		end
	end

	BeginPlot(NPC, "lua_mika_z22_Q424830_show" , 50 )

end

function lua_mika_z22_Q424830_show()
	local NPC = OwnerID()

	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框

end

function lua_mika_z22_Q424831_complete()
	local itemid = 240882
	local count = CountBodyItem(TargetID(), itemid )
	DelBodyItem(TargetID(), itemid, count )
--	say(TargetID(), "delete item" )
	Lua_ZonePE_3th_GetScore(130)
end

-------- Q7 一盤散沙 -----------------------------------------------------------------
-- 一盤散沙	424832	425006	424843
-- 物品 240883 牢固的繩子 使用檢查
function lua_mika_z22_Q424832_check()
	local npc = TargetID()
	local player = OwnerID()	
	local npclist = { 119930, 119931 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )

	if CheckAcceptQuest( Player, 424832 ) == true or CheckAcceptQuest( Player, 425006 ) == true or CheckAcceptQuest( Player, 424843 ) == true then -- 有接此任務
		-- 檢查使用對象是不是自己 (不可以是自己)
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then --施法對象
			for j = 1, table.getn(npclist) do
				if Orgid == npclist[j] then
					return true
				end
			end

			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424832_04]" , 0 )  
			--只能使用於[119930]。
			return false

		else   --是玩家

			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424832_04]" , 0 )  
			--只能使用於[119930]。
			return false
		end
	else  --沒任務
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424831_04]" , 0 )  -- 和別任務共用此字串
		-- 沒有接受命令的狀況下，還是不要隨便對對戰士們惡作劇吧。
		return false
	end
end

-- 498577 使用牢固的繩子
-- 621157 使用牢固的繩子
function lua_mika_z22_Q424832_use()
	local NPC = TargetID()
	local player = OwnerID()	
	local NPCID =  106439	-- 逮住偷懶的戰士

	DW_QietKillOne(player, NPCID  )
	BeginPlot(NPC, "lua_mika_z22_Q424832_delete" , 0 )

end

-- 使用物品抓住NPC 士兵消失
function lua_mika_z22_Q424832_delete()
	local NPC = OwnerID()

	DelObj(NPC)
end

-- 成功, 不使用物品 10秒後士兵自己消失
function lua_mika_z22_Q424832_delete2()
	local NPC = OwnerID()
	local sleeptime = 100   -- 10s

	sleep(sleeptime)
	NPCSay( NPC, "[SC_Z22_Q424832_06]" )    -- 趁機會！快逃！
	DelObj(NPC)
end


 ------------ 物件觸碰劇情 樹叢  ------------ 
function lua_mika_z22_Q424832_touch()
	local obj = OwnerID()	

	Setplot(obj,  "touch" , "lua_mika_z22_Q424832_touch2" , 50 )		
end 

function lua_mika_z22_Q424832_touch2()
	local NPC = TargetID()
	local player = OwnerID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, 424832 ) == true or CheckAcceptQuest( Player, 425006 ) == true or CheckAcceptQuest( Player, 424843 ) == true then
		if Mount == true then --不在後座
			if BeginCastBarEvent( Player , NPC , "[SC_Z22_Q424832_05]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_z22_Q424832_touch3") ~= 1 then 
			--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
				ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
			end
		else --在後座
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424832_03]" , 0 )
		 --好像有點可疑的樹叢…。
	end


end

function lua_mika_z22_Q424832_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- 樹叢

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			local R = Rand(100)+1  -- 事件機率
			if R >= 75 then -- 失敗
				BeginPlot(NPC, "lua_mika_z22_Q424832_born2" , 0 )
			else  -- 成功
				BeginPlot(NPC, "lua_mika_z22_Q424832_born1" , 0 )
			end
			BeginPlot(NPC, "lua_mika_z22_Q424832_show" , 0 )  --讓樹叢隱藏 20秒後出現
			EndCastBar( Player , CheckStatus ) --清除施法條	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end

-- 草叢 隱藏後 重生
function lua_mika_z22_Q424832_show()
	local grass = OwnerID()
	local sleeptime = 250

	Hide(grass)
	Sleep(sleeptime)
	Show(grass, 0 )
end

-- 成功
function lua_mika_z22_Q424832_born1()
	local NPC = OwnerID()   --樹叢
	local Player = TargetID()

	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local Obj = Role:new( NPC  )  -- 取得樹叢 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPCID
		local R = Rand(100)+1
		if R >= 60 then    
			NPCID = 119930  --偷懶的士兵
		else
			NPCID = 119931  --偷懶的士兵
		end
	local String = "[SC_Z22_Q424832_02]"   -- 啊！饒...饒了我吧！
	local emoteid = 264  --  emote_amazed

	Sleep(10)	

	local NPC2 = CreateObj( NPCID, BaseX, BaseY,  BaseZ, BaseDir, 1 ) --在NPC座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC2, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC2, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC2, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC2, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC2, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC2, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC2, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC2, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC2, EM_SetModeType_Show, true )--顯示
	-- 可以抓的設定
	SetModeEx( NPC2, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC2, EM_SetModeType_ShowRoleHead, true )--頭像框

	AdjustFaceDir( NPC2, Player, 0 )
	AddToPartition( NPC2 , RoomID) -- 建立物件
	Sleep(10)
	PlayMotion( NPC2,  264 )   -- emote_amazed
	Npcsay( NPC2, String )
	-- 
	BeginPlot( NPC2, "lua_mika_z22_Q424832_Delete2" , 0 )
end


-- 失敗
function lua_mika_z22_Q424832_born2()
	local NPC = OwnerID()   --樹叢
	local Player = TargetID()

	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local Obj = Role:new( NPC  )  -- 取得樹叢 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPCID
		local R = Rand(100)+1
		if R >= 60 then    
			NPCID = 119930  --偷懶的士兵
		else
			NPCID = 119931  --偷懶的士兵
		end
	local String = "[SC_Z22_Q424832_01]"   -- 想抓我？沒那麼簡單！
	local emoteid = 108  --  emote_laugh

	Sleep(10)	

	local NPC2 = CreateObj( NPCID, BaseX, BaseY,  BaseZ, BaseDir, 1 ) --在NPC座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC2, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC2, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC2, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC2, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC2, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC2, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC2, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC2, EM_SetModeType_Show, true )--顯示
	SetModeEx( NPC2, EM_SetModeType_HideName, true )--名稱
	-- 不可抓的設定
	SetModeEx( NPC2, EM_SetModeType_Mark, false )--標記
	SetModeEx( NPC2, EM_SetModeType_ShowRoleHead, false )--頭像框

	AdjustFaceDir( NPC2, Player, 0 )
	AddToPartition( NPC2 , RoomID) -- 建立物件
	Sleep(10)
	PlayMotion( NPC2,  emoteid )  --  emote_laugh
	Npcsay( NPC2, String )  -- 想抓我？沒那麼簡單！

	Sleep(15)
	DelObj(NPC2)

end


-------- ------------- Q8  協助器材修復----------------------------------------------------
-- 協助器材修復 424833 / 425007  / 424844

-- 119667 訓練用假人  /  119932 訓練用箭靶

 ------------ 物件觸碰劇情  ------------ 
function lua_mika_z22_Q424833_touch()
	local obj = OwnerID()	

	Setplot(obj,  "touch" , "lua_mika_z22_Q424833_touch2" , 50 )		
end 


function lua_mika_z22_Q424833_touch2()
	local NPC = TargetID()
	local player = OwnerID()

	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, 424833 ) == true or CheckAcceptQuest( Player, 425007 ) == true or CheckAcceptQuest( Player, 424844 ) == true then

		if CheckBuff( NPC, 621159 ) == false then

			if Mount == true then --不在後座
				if BeginCastBarEvent( Player , NPC , "[SC_Z22_Q424833_01]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_z22_Q424833_touch3") ~= 1 then 
				--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424833_02]" , 0 ) -- 目前還不需要修復此器材。
		end
	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- 沒有此任務 
	end


end

function lua_mika_z22_Q424833_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- 器材

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
			local objid_1 = 119667	--訓練用假人
			local objid_2 = 119932 --訓練用箭靶
			local npcid_1 = 106440  -- 修復訓練用假人
			local npcid_2 = 106472 -- 修復訓練用箭靶

			local buffid = 621159  --  Z22Q424833器材修復過
			local bufftime = 20

			if Orgid == objid_1 then
				DW_QietKillOne( Player, npcid_1 ) 
			else
				DW_QietKillOne( Player, npcid_2 ) 
			end
			AddBuff( NPC, buffid , 0 , bufftime )
			EndCastBar( Player , CheckStatus ) --清除施法條	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end

-------- ------------- Q11  秘密武器 ----------------------------------------------------
-- 秘密武器  424836  / 425010  / 424847
-- 放棄任務時要刪除對應KEY 和 任務相關物品

-- 230164  明視之環   物品使用檢查

function lua_mika_z22_Q424836_check()
	local player = OwnerID()

	if CheckAcceptQuest( Player, 424836 ) == true or CheckAcceptQuest( Player, 425010 ) == true or CheckAcceptQuest( Player, 424847 ) == true then
		return true
	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- 沒有此任務 
		return false
	end
end

-- 230164  明視之環   物品使用效果
function lua_mika_z22_Q424836_use()
	local player = OwnerID()
	local keyitem = 545804 -- 看見陷阱擺放點	

	if CheckFlag(player, keyitem) == true then  -- 有keyitem
		CastSpell(player, player, 495735 )
		ScriptMessage( Player, Player, 1, "[SC_Z22_Q424836_02]" , C_SYSTEM ) -- close
		Setflag(player, keyitem, 0 )
	else
		CastSpell(player, player, 495735 )
		ScriptMessage( Player, Player, 1, "[SC_Z22_Q424836_01]" , C_SYSTEM ) -- Open
		Setflag(player, keyitem, 1 )
	end

end


-- Z22 任務物品 -精密地雷陷阱  240886   使用檢查
function lua_mika_z22_240886_check()
	local Player = OwnerID()
	local npcid = 119935  --陷阱擺放記號
	local range = 30
	local count = Lua_Hao_NPC_Range_Search( Player , npcid , range )  -- range 內 陷阱擺放記號  物件數量

	if CheckAcceptQuest( Player, 424836 ) == true or CheckAcceptQuest( Player, 425010 ) == true or CheckAcceptQuest( Player, 424847 ) == true then

		if count > 0 then -- 如果有附近有npc
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424836_03]" , 0 )  -- 你不在[119935]的附近。
			ScriptMessage( Player , Player , 0 , "[SC_Z22_Q424836_03]" , 0 )
			return false
		end
	else
		ScriptMessage( Player,  Player, 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		ScriptMessage( Player,  Player, 0, "[SC_424626_2]" , 0 )  
		return false
	end
end
		

-- Z22 任務物品 -精密地雷陷阱  240886   使用效果
function lua_mika_z22_240886_use()
	local Player = OwnerID()
	local npcid = 119935  --陷阱擺放記號
	local range = 30
	local killid = 106441	--擺放地雷陷阱

	local obj = Lua_Hao_NPC_Closest_Search( Player , npcid  , range ) -- 以Owner為中心做范圍搜尋，回傳最接近的物件

	DW_QietKillOne(Player, killid  )  -- 暗暗殺死一隻NPC (任務條件)
	BeginPlot(obj, "lua_mika_z22_240886_objhidden", 0 )   --  擺放記號 = OBJ  執行 HIDE
	BeginPlot(Player, "lua_mika_z22_240886_bombborn" , 0 )   -- 玩家 執行 產生陷阱物件

end

-- 擺放記號 隱藏 15sec後 出現
function lua_mika_z22_240886_objhidden()
	local obj = OwnerID()  
	Sleep(15)
	Hide(obj)
	sleep(200)  -- 15S
	Show( obj , 0  ) 
end

-- 玩家 執行 產生陷阱物件
function lua_mika_z22_240886_bombborn()

	local NPC = OwnerID()   --擺放記號

	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local Obj = Role:new( NPC  )  -- 取得樹叢 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPCID =  119936	-- 精密地雷陷阱

	Sleep(10)	

	local NPC2 = CreateObj( NPCID, BaseX, BaseY,  BaseZ, BaseDir, 1 ) --在NPC座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC2, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC2, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC2, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC2, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC2, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC2, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC2, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC2, EM_SetModeType_Mark, false )--標記
	SetModeEx( NPC2, EM_SetModeType_ShowRoleHead, false )--頭像框

	SetModeEx( NPC2, EM_SetModeType_Show, true )--顯示
	SetModeEx( NPC2, EM_SetModeType_HideName, true )--名稱
	AddToPartition( NPC2 , RoomID) -- 建立物件

	Sleep(50)
	DelObj(NPC2)

end

---------------------------------------------

----掛在 119681  安默森．戴茲 物件產生劇情
function lua_mika_z22_itemshop_set() 
	local shopid = 600374
	SetShop(OwnerID() , shopid , "Test_Shop_Close" ); 
end