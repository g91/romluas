
------------------------- 地磚事件 [1] - 產生寶箱 (必爾汀代幣 )  -------------------------

function LuaYU_111813_001() 
	BeginPlot( TargetID() , "LuaYU_111813_001_UU" , 0 )  
end

function LuaYU_111813_001_UU()   --錢袋寶箱(必爾汀代幣)
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_001_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_001_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146

			local CashBOX = LuaFunc_CreateObjByObj ( 111956 , T_ID )
--			SetModeEx( CashBOX  , EM_SetModeType_Obstruct, true )--阻擋
--			AddToPartition( CashBOX, RoomID) 
			ScriptMessage( O_ID , O_ID , 1 , "|cffff00ff" .."[SC_111813_YU_16]".. "|r" , 0 ) --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			ScriptMessage( O_ID , -1 , 0 , "[SC_111813_YU_16]" , 0 ) --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			SetPlot( CashBOX ,"touch", "LuaYU_111813_002" , 15 )   
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------- 地磚事件 [1] - 寶箱劇情 (必爾汀代幣 )  -------------------------
function LuaYU_111813_002()
	BeginPlot( TargetID() , "LuaYU_111813_002_UU" , 0 )  
end

function LuaYU_111813_002_UU()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_111813_002_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

function LuaYU_111813_002_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	

				BeginPlot( O_ID , "LuaYU_111813_002_2" , 0 )  
				SetPlot( T_ID,"touch","",0 )
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  開啟寶箱  106273
				local npcid = 106273 
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_111813_002_2()   

	local P = 100
	local XX = Rand( P )     
	local Player = OwnerID() 
				
		if XX > 55 and XX <= 100 then   --45%
			GiveBodyItem( Player , 203038 , 5 );    -- 必爾汀代幣
		elseif XX <= 55 and XX > 20 then  --35%
			GiveBodyItem( Player , 203038 , 10 );   -- 必爾汀代幣
		elseif XX <= 20 and XX > 5 then  --15%
			GiveBodyItem( Player , 203038 , 15 );   -- 必爾汀代幣
		else --5%
			GiveBodyItem( Player , 203038 , 20 );   -- 必爾汀代幣
		end
end

------------------------- 地磚事件 [2] - 產生寶箱 (符文)  -------------------------

function LuaYU_111813_001_02()
	BeginPlot( TargetID() , "LuaYU_111813_001_02_UU" , 0 )  
end

function LuaYU_111813_001_02_UU()   --符文
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_001_02_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_001_02_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146

			local CashBOX = LuaFunc_CreateObjByObj ( 111956 , T_ID )

			ScriptMessage( O_ID , O_ID , 1 , "|cffff00ff" .."[SC_111813_YU_16]".. "|r" , 0 ) --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			ScriptMessage( O_ID , -1 , 0 , "[SC_111813_YU_16]" , 0 )  --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			SetPlot( CashBOX ,"touch", "LuaYU_111813_002_02" , 15 )   
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end	
end

------------------------- 地磚事件 [2] - 寶箱劇情 (符文 )  -------------------------
function LuaYU_111813_002_02()
	BeginPlot( TargetID() , "LuaYU_111813_002_02_UU" , 0 )  
end

function LuaYU_111813_002_02_UU()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_111813_002_02_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end
function LuaYU_111813_002_02_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	
				BeginPlot( O_ID , "LuaYU_111813_002_2_2" , 0 )  
				SetPlot( T_ID,"touch","",0 )
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  開啟寶箱  106273
				local npcid = 106273 
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 給舊版符文
function LuaYU_111813_002_2_2()   
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  

	local Treasure 
		if PlayerLV <= 39 then  --依等級判斷
			Treasure = { 520022 , 520042 , 520062 , 520082 , 520102 , 520122 , 520142 , 520162 , 520182 , 520202 , 520222 }
		elseif PlayerLV >= 40 and PlayerLV <= 59 then  --依等級判斷
			Treasure = { 520023 , 520043 , 520063 , 520083 , 520103 , 520123 , 520143 , 520163 , 520183 , 520203 , 520223 }
		elseif PlayerLV >= 60 then  --依等級判斷
			Treasure = { 520024 , 520044 , 520064 , 520084 , 520104 , 520124 , 520144 , 520164 , 520184 , 520204 , 520224 } 
		end
	local number = Rand(#Treasure)+1
	local TreasureID = Treasure[number]
--	say(Player, "number = "..number..", TreasureID ="..TreasureID)
	GiveBodyItem(Player, TreasureID, 3 )					
end


------------------------- 地磚事件 [3] - 產生寶箱 ( 公會資源 / 萬能修理鎚 )  -------------------------
function LuaYU_111813_001_03()
	BeginPlot( TargetID() , "LuaYU_111813_001_03_UU" , 0 )  
end

function LuaYU_111813_001_03_UU()   --藍裝
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_001_03_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_001_03_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146


			local CashBOX = LuaFunc_CreateObjByObj ( 111956 , T_ID )

			ScriptMessage( O_ID , T_ID , 1 , "|cffff00ff" .."[SC_111813_YU_16]".. "|r" , 0 ) --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			ScriptMessage( O_ID , -1 , 0 , "[SC_111813_YU_16]" , 0 )  --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			SetPlot( CashBOX ,"touch", "LuaYU_111813_002_03" , 15 )   
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------- 地磚事件 [3] - 寶箱內容 ( 公會資源 / 萬能修理鎚)  -------------------------
function LuaYU_111813_002_03()
	BeginPlot( TargetID() , "LuaYU_111813_002_03_UU" , 0 )  
end

function LuaYU_111813_002_03_UU()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_111813_002_03_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

function LuaYU_111813_002_03_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	

				BeginPlot( O_ID , "LuaYU_111813_002_2_3" , 0 )  
				SetPlot( T_ID,"touch","",0 )
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  開啟寶箱  106273
				local npcid = 106273 
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end


-- 寶箱3 - 公會資源 / 萬能修理鎚
function LuaYU_111813_002_2_3()   
	local Player = OwnerID()

	local itemid_high = {201967, 201967, 201967, 206263, 206262, 206261, 207325, 207329, 207929 }
	local itemcount_high = {1, 2, 3 , 10, 10, 10, 10, 10, 10}

	local itemid_low = { 206263, 206262, 206261, 207325, 207329, 207929 }
	local itemcount_low = {10, 10, 10, 10, 10, 10}
	local R = Rand(100)+1
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  

	if PlayerLV >= 40 then  --依等級判斷
		if R >= 91 then   -- 91 - 100
			GiveBodyItem(Player, itemid_high[1], itemcount_high[1] )
		elseif R >= 84 and R <= 90 then  -- 84 -90
			GiveBodyItem(Player, itemid_high[2], itemcount_high[2] )
		elseif R >= 81 and R <= 83 then  -- 81 82 83
			GiveBodyItem(Player, itemid_high[3], itemcount_high[3] )
		elseif R >= 61 and R <= 80 then  -- 61 - 80
			GiveBodyItem(Player, itemid_high[4], itemcount_high[4] )
		elseif R >= 41 and R <= 60 then  -- 41 - 60
			GiveBodyItem(Player, itemid_high[5], itemcount_high[5] )
		elseif R >= 21 and R <= 40 then  -- 21 - 40
			GiveBodyItem(Player, itemid_high[6], itemcount_high[6] )
		elseif R >= 11 and R <= 20 then  -- 11 - 20
			GiveBodyItem(Player, itemid_high[7], itemcount_high[7] )
		elseif R >= 6 and R <= 10 then  -- 6 - 10
			GiveBodyItem(Player, itemid_high[8], itemcount_high[8] )
		elseif R <= 5 then  --  1 - 5 
			GiveBodyItem(Player, itemid_high[9], itemcount_high[9] )
		end
	else
		if R >= 76 then   --  76 - 100
			GiveBodyItem(Player, itemid_low[1], itemcount_low[1] )
		elseif R >= 51 and R <= 75 then  -- 51 - 75
			GiveBodyItem(Player, itemid_low[2], itemcount_low[2] )
		elseif R >= 26 and R <= 50 then  -- 26 -50
			GiveBodyItem(Player, itemid_low[3], itemcount_low[3] )
		elseif R >= 11 and R <= 25 then  -- 11 - 25
			GiveBodyItem(Player, itemid_low[4], itemcount_low[4] )
		elseif R >= 6 and R <= 10 then  -- 6 - 10
			GiveBodyItem(Player, itemid_low[5], itemcount_low[5] )
		elseif R <= 5 then  --  1 - 5 
			GiveBodyItem(Player, itemid_low[6], itemcount_low[6] )
		end
	end	
end


------------------------- 地磚事件 [4] - 產生寶箱 ( 必爾汀藥水 )  -------------------------
function LuaYU_111813_001_04()
	BeginPlot( TargetID() , "LuaYU_111813_001_04_UU" , 0 )  
end

function LuaYU_111813_001_04_UU()   --水
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_001_04_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_001_04_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )
			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
			local CashBOX = LuaFunc_CreateObjByObj ( 111956 , T_ID )
			ScriptMessage( O_ID , T_ID , 1 , "|cffff00ff" .."[SC_111813_YU_16]".. "|r" , 0 ) --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			ScriptMessage( O_ID , -1 , 0 , "[SC_111813_YU_16]" , 0 )  --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			SetPlot( CashBOX ,"touch", "LuaYU_111813_002_04" , 15 )   	
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------- 地磚事件 [4] - 寶箱內容 ( 必爾汀藥水 )  -------------------------
function LuaYU_111813_002_04()
	BeginPlot( TargetID() , "LuaYU_111813_002_04_UU" , 0 )  
end

function LuaYU_111813_002_04_UU()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_111813_002_04_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

function LuaYU_111813_002_04_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	
				BeginPlot( O_ID , "LuaYU_111813_002_2_4" , 0 )  
				SetPlot( T_ID,"touch","",0 )
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  開啟寶箱  106273
				local npcid = 106273 
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end


function LuaYU_111813_002_2_4()   
	local P = 100
	local XX = Rand( P )     
	local Player = OwnerID() 
			
		if XX > 55 and XX <= 100 then   --45%   --藍水
			GiveBodyItem( Player , 720269 , 1 );  
		elseif XX <= 55 and XX > 10 then  --45% --紅水
			GiveBodyItem( Player , 720286 , 1 );  
		else --10%  --黃水
			GiveBodyItem( Player , 720287 , 1 );  
		end
end


------------------------- 地磚事件 [5] - 產生寶箱 ( 材料配方 )  -------------------------
function LuaYU_111813_001_05()
	BeginPlot( TargetID() , "LuaYU_111813_001_05_UU" , 0 )  
end

function LuaYU_111813_001_05_UU()   --特殊材
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_001_05_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_001_05_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )
			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146

			local CashBOX = LuaFunc_CreateObjByObj ( 111956 , T_ID )
			ScriptMessage( O_ID , O_ID , 1 , "|cffff00ff" .."[SC_111813_YU_16]".. "|r" , 0 ) --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			ScriptMessage( O_ID , -1 , 0 , "[SC_111813_YU_16]" , 0 )  --唧唧唧唧～居然挖到了寶箱呀～會是什麼呢？
			SetPlot( CashBOX ,"touch", "LuaYU_111813_002_05" , 15 )   
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------- 地磚事件 [5] - 寶箱內容 ( 材料配方 )  -------------------------
function LuaYU_111813_002_05()
	BeginPlot( TargetID() , "LuaYU_111813_002_05_UU" , 0 )  
end

function LuaYU_111813_002_05_UU()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SO_110195_1]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_111813_002_05_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

function LuaYU_111813_002_05_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	

				BeginPlot( O_ID , "LuaYU_111813_002_2_5" , 0 )  
				SetPlot( T_ID,"touch","",0 )
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  開啟寶箱  106273
				local npcid = 106273 
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_111813_002_2_5()   
	local Player = OwnerID() 

	local TreasureRand = Rand(100+1)
	if TreasureRand >= 66 then   -- 35% 機率
		GiveBodyItem(Player, 205817, 1 )  -- 征服者的戰利品	205817
	elseif TreasureRand >= 16 and TreasureRand <= 65 then   -- 50% 機率
		GiveBodyItem(Player, 204555, 1 )  -- 魔法樂器素材包 
	elseif TreasureRand >= 11 and TreasureRand <= 15 then   -- 5% 機率
		GiveBodyItem(Player, 727019, 1 )  -- 王級裝飾公會家具配方 
	else   -- 特殊生產材料  10% 機率
		Callplot(Player, "LuaYU_111813_002_2_51", 0 )
	end

end

function LuaYU_111813_002_2_51()   
	local Player = OwnerID() 
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  
	local LvList = {90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15 }
	local Treasure_96 = { 242326, 242327, 242328, 242329 }  -- 96 -100
	local Treasure_15 = { 202101, 202109, 202117, 202125 } -- 15

	local Treasure = {
 			{ 242322, 242323, 242324, 242325 },  -- 91- 95
			{ 242318, 242319, 242320, 242321 }, -- 86- 90
			{ 242314, 242315, 242316, 242317 }, -- 81- 85
			{ 242063, 242064, 242065, 242066 }, -- 76 -80
			{ 241463, 241464, 241465, 241466 }, -- 71 - 75
			{ 240410, 240411, 240412, 240413 },  -- 66 - 70
			{ 208252, 208253, 208254, 208255 },  -- 61 - 65	
			{ 207410, 207412, 207414, 207416 },  -- 56 - 60
			{ 207409, 207411, 207413, 207415 },  -- 51 - 55
			{ 202108, 202116, 202124, 202132 },  -- 46 - 50 
			{ 202107, 202115, 202123, 202131 },  -- 41- 45
			{ 202106, 202114, 202122, 202130 },  -- 36 - 40
			{ 202105, 202113, 202121, 202129 },  -- 31- 35
			{ 202104, 202112, 202120, 202128 },  -- 26 - 30
			{ 202103, 202111, 202119, 202127 },  -- 21 - 25
			{ 202102, 202110, 202118, 202126 } -- 16- 20
			}

	if PlayerLV >= 96 then
		local TreasureID = Treasure_96[(Rand(#Treasure_96)+1)]
	--	say(Player, "Treasure 96 ="..TreasureID )
		GiveBodyItem(Player, TreasureID, 1 )
	elseif PlayerLV <= 15 then
		local TreasureID = Treasure_15[(Rand(#Treasure_15)+1)]
	--	say(Player, "Treasure 15="..TreasureID )
		GiveBodyItem(Player, TreasureID, 1 )
	else
		for i = 1 , #LvList do 
			local LvRange = (LvList[i]+1)  -- 例 90+1
			local NextLvRange = (LvList[i]+5 )    -- 例 90 + 5

			if PlayerLV >= LvRange and PlayerLV <= NextLvRange then
			--	say(Player, "LvRange ="..LvRange..", NextLvRange = "..NextLvRange  )
				local TreasureID = Treasure[i][(Rand(4)+1)]
			--	say(Player, " TreasureID = "..TreasureID  )
				GiveBodyItem(Player, TreasureID, 1 )
				break
			end

		end
	end

end
-- 寶箱類型 6 . 7 已移除
