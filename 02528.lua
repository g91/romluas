-- z22 支線 (米佳)

---------Q1 治療傷兵 ------------------

-- 掛在此npc相關的 5隻npc 初始對話劇情上  -119658, 119659, 119660, 119661, 119662  
function lua_mika_z22_Q424824_npc()
	local npc = TargetID()
	local player = OwnerID()
	local questid = { 424827, 425001, 424838 }
	local buffid = 621155
	local npclist = { 119658, 119659, 119660, 119661, 119662 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424827_SPEAK01]" , "[SC_Z22_Q424827_SPEAK02]", "[SC_Z22_Q424827_SPEAK03]", "[SC_Z22_Q424827_SPEAK04]", "[SC_Z22_Q424827_SPEAK05]"  }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			break
		end
	end
	
	for j = 1, table.getn(questid) do
		if CheckBuff(npc, buffid ) == false then  -- npc 沒buff
			if CheckAcceptQuest( Player, questid[j] ) == true then -- 有接此任務
				AddSpeakOption( player, player, "[SC_Z22_Q424827_SPEAK06]", "lua_mika_z22_Q424824_cure", 0 )--進行治療包紮
				break
			end
		else
			break
		end
	end
		
end

function lua_mika_z22_Q424824_cure()
	local npc = TargetID()
	local player = OwnerID()
	local buffid = 621155	-- 已受到治療
	local npcid = 106438	-- 治療負傷的戰士 

	CloseSpeak(player)
--	Say(npc, "npc" )
--	Say(player, "player" )

	DW_QietKillOne(player, npcid  )
	AddBuff( npc, buffid, 0 , 20 ) -- 效果 

end

---------Q2 快馬加鞭------------------

-- 掛在此任務相關的2隻npc 初始對話劇情上 -- 119654 , 119655 
function lua_mika_z22_Q424828_01()
	local npc = TargetID()
	local player = OwnerID()	
	local questid = { 424828,  424839, 425002 }
	local npclist = { 119654 , 119655 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424828_01]" , "[SC_Z22_Q424828_02]" }
	-- 關於物資供應的事情找我就對了。	
	-- 如果你有不需要的東西，或許可以考慮賣給我們必爾汀商會。
	local itemid = { 240877 , 240878    }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			break
		end
	end
	
	for j = 1, table.getn(questid) do
		if CheckAcceptQuest( Player, questid[j] ) == true then -- 有接此任務
			AddSpeakOption( player, player, "[SC_Z22_Q424828_03]", "lua_mika_z22_Q424828_02", 0 )-- 我代表帕尼洛營地來領取藥草
			break
		end
	end
end

function lua_mika_z22_Q424828_02()
	local npc = TargetID()
	local player = OwnerID()
	local npclist = { 119654 , 119655 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424828_04]" , "[SC_Z22_Q424828_05]" }  
	--這是你要的藥草，如果還有其它需求請隨時找我。
	--[ZONE_PANIO_CAMP]嗎？這些已經是我們能提供的最大數量，先拿去應急吧。
	local itemid = { 240877 , 240878  }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			local count = CountBodyItem(player, itemid[i] )
			local givecount = 5 - count
			if count >= 5 then -- 已持有特定數量
				CloseSpeak(player)
				ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424828_06]" , 0 ) --你已持有足夠的貨物。
				break
			else
				SetSpeakDetail(player, string[i] )
				GiveBodyItem( player, itemid[i], givecount )
				break
			end
		end
	end
end


--------- Q3  少女與赤焰草 --------- 

-- 點擊任務物件 赤焰草 119663 後劇情
function lua_mika_Q424829_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_mika_Q424829_touch2" , 50 )
end

--讀取施法條前檢查
function lua_mika_Q424829_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local questid = {424829, 425003, 424840 }
	local itemid = 240879

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	if CheckAcceptQuest( Player, 424829 ) == true or CheckAcceptQuest( Player, 425003 ) == true  or CheckAcceptQuest( Player, 424840 ) == true  then

		if CountBodyItem( Player, itemid ) <5 then
			if Mount == true then --不在後座
				if BeginCastBarEvent( Player , NPC , "[SC_Z22_Q424829_05]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q424829_touch3") ~= 1 then 
				--3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424829_03]" , 0 ) --你已採取足夠的[240879]。
		end

	else
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424829_04]" , 0 )
		 --你發現一株火焰顏色的草，如果沒有需要還是別隨意採取吧。
	end

end

function lua_mika_Q424829_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- 草

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				BeginPlot(NPC, "lua_mika_Q424829_show", 10 )  
				BeginPlot(NPC, "lua_mika_Q424829_grass", 10 )  
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

function lua_mika_Q424829_grass()
	local grass = OwnerID()
	local sleeptime = 150

	Hide(grass)
	Sleep(sleeptime)
	Show(grass, 0 )

end

-- 少女登場給赤焰草
function lua_mika_Q424829_show()
	local Player = TargetID()

	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Obj = Role:new( Player  )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local dis = 35

	local newX = BaseX - ( dis * math.cos(math.pi*2*(1/8)) )
	local newZ = BaseZ +  ( dis * math.sin(math.pi*2*(1/8)) )

	local NPC = CreateObj( 119657, newX, BaseY,  newZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件  

	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_Mark, false )--標記
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示

	AdjustFaceDir( NPC, Player, 0 )
	AddToPartition( NPC , RoomID) -- 建立物件
	sleep(15)  

	local R = rand(100)+1
	if R >= 80 then  -- 正確
		Npcsay(NPC, "[SC_Z22_Q424829_01]" )  --嗯，你採的正是[240879]沒錯。
		GiveBodyItem( Player , 240879 , 1 )   -- 給予 赤焰草
	else -- 錯誤
		Npcsay(NPC, "[SC_Z22_Q424829_02]" )  --看起來雖然很像，可是它散發的氣息和[240879]不同啊。
	end

	sleep(20)  
	Delobj(NPC)

end

-------- Q5 來點新鮮的吧！-------------

-- 當 物品-活跳跳的鮮魚(240880)生存時間到刪除時 觸發劇情
--  給予 240881 x1 
 
function lua_mika_z22_Q424830_item()
	local player = OwnerID()
	local item = 240881  -- 失去氣息的魚

	GiveBodyItem(player, item , 1 )
	ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424830_01]" , 0 ) --背包裡的鮮魚似乎放置太久，失去了原有的鮮度...。

end	
