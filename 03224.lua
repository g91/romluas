function NpcDialog( Npc, ObjID )	-- 面向與偵測距離

	AdjustFaceDir( Npc, ObjID, 0 ); -- 面向
	PlayMotion( Npc, 112 );	-- 比劃
	local RangeCheck = CheckBuff( ObjID, 621751 );	-- 偵測距離 621751
	SysCastSpellLv( Npc, ObjID, 496587, 0 );	-- 偵測距離法術集合，施放 621751

	if RangeCheck== false then
		CallPlot( ObjID, "Lua_Hao_Item_SOP_Ranger", 50 );	-- 檢查NPC與玩家的距離
	end
end

-----------------------------------------------------------------------------------------------------------
--/gm ? pcall %s_id "Hao_SetItemExchange(String,Amount)"
function Hao_SetItemExchange(String,Amount)	-- 設定(重置)工具：帳號每日、Server 每日(該區域內的兌換Npc)、Server 每周的兌換次數

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	if not Amount or Amount < 0 then
		if String == -1 then
			Lua_Hao_Item_SOP_Reset_Player();
			Lua_Hao_Item_SOP_Reset_Server();
			Lua_Hao_Test_Week1();
			DebugMsg( Owner, Room, "Account, Server daily, and Server weekly limit has been reset." );
		elseif String == 1 then
			Lua_Hao_Item_SOP_Reset_Player();
			DebugMsg( Owner, Room, "Account limit has been reset." );
		elseif String == 2 then
			Lua_Hao_Item_SOP_Reset_Server();
			DebugMsg( Owner, Room, "Server daily limit has been reset." );
		elseif String == 3 then
			Lua_Hao_Test_Week1();
			DebugMsg( Owner, Room, "Server weekly limit has been reset." );
		end
		return
	end

	if String == -1 then
		Lua_Hao_Item_SOP_Reset_Player(Amount);
		Lua_Hao_Item_SOP_Reset_Server(Amount);
		Lua_Hao_Test_Week0(Amount);
		DebugMsg( Owner, Room, "Account, Server daily, and Server weekly limit has been set to a "..Amount );
	elseif String == 1 then
		Lua_Hao_Item_SOP_Reset_Player(Amount);
		DebugMsg( Owner, Room, "Account limit been set to a "..Amount );
	elseif String == 2 then
		Lua_Hao_Item_SOP_Reset_Server(Amount);
		DebugMsg( Owner, Room, "Server daily limit has been set to a "..Amount );
	elseif String == 3 then
		Lua_Hao_Test_Week0(Amount);
		DebugMsg( Owner, Room, "Server weekly limit has been set to a "..Amount );
	else
		DebugMsg( Owner, Room, "Entry error!" );
	end
end

function Hao_Test_20150714()

	local Owner = OwnerID();
--[[
	Say( Owner, "Date14 = "..EM_AccountFlag_CE_Date14_12 );
	Say( Owner, "Count14 = "..EM_AccountFlag_CE_Count14_8 );
	Say( Owner, "Date15 = "..EM_AccountFlag_CE_Date15_12 );
	Say( Owner, "Count15 = "..EM_AccountFlag_CE_Count15_8 );
	Say( Owner, "Date16 = "..EM_AccountFlag_CE_Date16_12 );
	Say( Owner, "Count16 = "..EM_AccountFlag_CE_Count16_8 );
	Say( Owner, "Date17 = "..EM_AccountFlag_CE_Date17_12 );
	Say( Owner, "Count17 = "..EM_AccountFlag_CE_Count17_8 );
	Say( Owner, "Date18 = "..EM_AccountFlag_CE_Date18_12 );
	Say( Owner, "Count18 = "..EM_AccountFlag_CE_Count18_8 );
	Say( Owner, "String = ".."SC_ITEM_SOP_20"..(1+4) )

	local g_Info = {};
	for i = 1, 5 do	-- 方案總數
		g_Info[i] = {};
		g_Info[i].SysDate = EM_RoleValue_Register+(2*(i-1))	-- 系統時間
		g_Info[i].Date = EM_AccountFlag_CE_Date14_12+(20*(i-1))	-- 玩家身上最後一次與 Npc 兌換的時間
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count14_8+(20*(i-1))	-- 玩家帳號單日兌換上限量
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+(2*(i-1)+1)	-- 伺服器每日兌換上限，記錄於 Npc 身上
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i+4)	-- Server 每周兌換當前剩餘數量
		
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyAccountLimit");	-- 玩家帳號每日兌換上限量
		g_Info[i].DailyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyServerLimit");	-- Server 每日兌換上限量
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_WeeklyServerLimit");	-- Server 每周兌換上限量
		
	--	g_Info[i].Gift = g_Gift[i];	-- 判斷為贈送或兌換
	--	g_Info[i].LowestLv = g_LowestLv[i];	-- 需求最低等級
	--	g_Info[i].HighestLv = g_HighestLv[i];	-- 需求最高等級
	--	g_Info[i].Status = g_Status[i];	-- 支付貨幣數量
	--	g_Info[i].ExStatus = g_ExStatus[i];	-- 兌換貨幣數量
		g_Info[i].Log = 12414900+(i*10);	-- 上線時交易
		g_Info[i].DailyLimitLog = 12414901+(i*10);	-- 伺服器每日至上限時
		g_Info[i].WeeklyLimitLog = 12414902+(i*10);	-- 伺服器每周至上限時
	--	for Index, Value in pairs(g_Info[i]) do
	--		Say( Owner, Index.." = "..Value );
	--	end
	end
--]]
	local g_Currency = {};
	for i = 1, 1 do	-- 方案數量
		g_Currency[i] = {};
		g_Currency[i] = {};
		g_Currency[i].PhiriusShell = {};
		g_Currency[i].EnergyJustice = {};
		g_Currency[i].Dreamland = {};
		g_Currency[i].Ancient = {};
		g_Currency[i].ProofMyth = {};
		g_Currency[i].PhiriusShell.switch = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShell");	-- 必爾丁圓貝
		g_Currency[i].PhiriusShell.quantity = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShellQuantity");	-- 必爾丁圓貝數量
		g_Currency[i].EnergyJustice.switch = GetDBKeyValue("Plus_"..(i+10).."_EnergyJustice");	-- 正義能量
		g_Currency[i].EnergyJustice.quantity = GetDBKeyValue("Plus_"..(i+10).."_EnergyJusticeQuantity");	-- 正義能量數量
		g_Currency[i].Dreamland.switch = GetDBKeyValue("Plus_"..(i+10).."_Dreamland");	-- 夢境先遣印記
		g_Currency[i].Dreamland.quantity = GetDBKeyValue("Plus_"..(i+10).."_DreamlandQuantity");	-- 夢境先遣印記數量
		g_Currency[i].Ancient.switch = GetDBKeyValue("Plus_"..(i+10).."_Ancient");	-- 古代遺物
		g_Currency[i].Ancient.quantity = GetDBKeyValue("Plus_"..(i+10).."_AncientQuantity");	-- 古代遺物數量
		g_Currency[i].ProofMyth.switch = GetDBKeyValue("Plus_"..(i+10).."_ProofMyth");	-- 傳奇之證
		g_Currency[i].ProofMyth.quantity = GetDBKeyValue("Plus_"..(i+10).."_ProofMythQuantity");	-- 傳奇之證數量
		-- 取得支付貨幣的清單
		Say( Owner, "Running" );
		for Index, Value in pairs(g_Currency[i]) do
			local Pay = {};
		--	Say( Owner, "Index = "..Index.." , switch = "..Value.switch.." , quantity = "..Value.quantity );
			if Value.switch > 0 and Value.quantity > 0 then
				Pay.index = index;
				Pay.quantity = Value.quantity;
				table.insert( g_Status[i], Pay );
				g_Gift[i] = false;
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
		end
	end

	local g_CurrencyInfo = {};
	g_CurrencyInfo.PhiriusShell = { EM_RoleValue_PhiriusShellCoin, 11, 1000, "[SYS_MONEY_TYPE_11]", "Phirius Shell" };	-- 必爾丁圓貝
	g_CurrencyInfo.EnergyJustice = { EM_RoleValue_EnergyJusticeCoin, 12, -1, "[SYS_MONEY_TYPE_12]", "Energy of Justice" };	-- 正義能量
	g_CurrencyInfo.Dreamland = { EM_RoleValue_DreamlandCoin, 10, -1, "[SYS_MONEY_TYPE_10]", "Dreamland Pioneer Sigil" };	-- 夢境先遣印記
	g_CurrencyInfo.Ancient = { EM_RoleValue_RelicsCoin, 9, 10000, "[SYS_MONEY_TYPE_9]", "Ancient Mementos" };	-- 古代遺物
	g_CurrencyInfo.ProofMyth = { EM_RoleValue_ProofLegendCoin, 13, -1, "[SYS_MONEY_TYPE_13]", "Proof of Myth" };	-- 傳奇之證

	Say( Owner, "Count = "..#g_CurrencyInfo );
end

function Hao_Test_20150714_1()

	local Owner = OwnerID();
	--  貨幣Define、貨幣編號、貨幣上限(-1時為無上限)、貨幣字串、貨幣翻譯 -- 
	local g_CurrencyInfo = {};
	g_CurrencyInfo[1] = { EM_RoleValue_PhiriusShellCoin, 11, 1000, "[SYS_MONEY_TYPE_11]", "Phirius Shell" };	-- 必爾丁圓貝
	g_CurrencyInfo[2] = { EM_RoleValue_EnergyJusticeCoin, 12, -1, "[SYS_MONEY_TYPE_12]", "Energy of Justice" };	-- 正義能量
	g_CurrencyInfo[3] = { EM_RoleValue_DreamlandCoin, 10, -1, "[SYS_MONEY_TYPE_10]", "Dreamland Pioneer Sigil" };	-- 夢境先遣印記
	g_CurrencyInfo[4] = { EM_RoleValue_RelicsCoin, 9, 10000, "[SYS_MONEY_TYPE_9]", "Ancient Mementos" };	-- 古代遺物
	g_CurrencyInfo[5] = { EM_RoleValue_ProofLegendCoin, 13, -1, "[SYS_MONEY_TYPE_13]", "Proof of Myth" };	-- 傳奇之證
	-- 宣告支付與兌換貨幣的清單 ----------------------------------------
	local g_Status = {};	-- 支出物品資料(開關、數量)
	local g_ExStatus = {};	-- 兌換物品資料(開關、數量)
	local g_StatusCount = {};-- 使 DesignLog 的標點符號精準化
	local g_ExStatusCount = {};-- 使 DesignLog 的標點符號精準化
	local g_Gift = {};	-- 判斷是贈予或兌換
	
	for i = 1, #g_CurrencyInfo do	-- 初始化
		g_Status[i] = {};
		g_ExStatus[i] = {};
		g_StatusCount[i] = 0;
		g_ExStatusCount[i] = 0;
		g_Gift[i] = true;
	end
--[[
	-- 取得 LogView 中支付貨幣的設定 ---------------------------------
	local g_Currency = {};
	for i = 1, #g_CurrencyInfo do	-- 方案數量
	
		g_Currency[i] = {};
		g_Currency[i][1] = {};
		g_Currency[i][2] = {};
		g_Currency[i][3] = {};
		g_Currency[i][4] = {};
		g_Currency[i][5] = {};
	
		g_Currency[i][1].switch = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShell");	-- 必爾丁圓貝
		g_Currency[i][2].switch = GetDBKeyValue("Plus_"..(i+10).."_EnergyJustice");	-- 正義能量
		g_Currency[i][3].switch = GetDBKeyValue("Plus_"..(i+10).."_Dreamland");	-- 夢境先遣印記
		g_Currency[i][4].switch = GetDBKeyValue("Plus_"..(i+10).."_Ancient");	-- 古代遺物
		g_Currency[i][5].switch = GetDBKeyValue("Plus_"..(i+10).."_ProofMyth");	-- 傳奇之證
	
		g_Currency[i][1].quantity = GetDBKeyValue("Plus_"..(i+10).."_PhiriusShellQuantity");	-- 必爾丁圓貝數量
		g_Currency[i][2].quantity = GetDBKeyValue("Plus_"..(i+10).."_EnergyJusticeQuantity");	-- 正義能量數量
		g_Currency[i][3].quantity = GetDBKeyValue("Plus_"..(i+10).."_DreamlandQuantity");	-- 夢境先遣印記數量
		g_Currency[i][4].quantity = GetDBKeyValue("Plus_"..(i+10).."_AncientQuantity");	-- 古代遺物數量
		g_Currency[i][5].quantity = GetDBKeyValue("Plus_"..(i+10).."_ProofMythQuantity");	-- 傳奇之證數量
	
		-- 取得支付貨幣的清單
		for Index, Value in ipairs(g_Currency[i]) do
			local Pay = {};
			Say( Owner, "Index = "..Index..", switch = "..Value.switch.." , quantity = "..Value.quantity );
			if Value.switch > 0 and Value.quantity > 0 then
				Pay.index = index;
				Pay.quantity = Value.quantity;
				table.insert( g_Status[i], Pay );
				g_Gift[i] = false;
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
		end
	end
--]]

	-- 判斷方案數量------------------------------------------------
	local g_Program = 0;	-- 以幣換幣 方案總量超過複數時，會新增一層主目錄選單
	local g_ProgramStatus = {};	-- 避免廠商設定方案跳號時，函式錯亂的問題(譬如廠商使用方案 2 3 5，直接跳過方案 1 4 )
	
	-- 取得 LogView 中兌換貨幣的設定 ---------------------------------
	local g_ExCurrency = {};
	for i = 1, #g_CurrencyInfo do	-- 方案數量
	
		g_ExCurrency[i] = {};
		g_ExCurrency[i][1] = {};
		g_ExCurrency[i][2] = {};
		g_ExCurrency[i][3] = {};
		g_ExCurrency[i][4] = {};
		g_ExCurrency[i][5] = {};
	
		g_ExCurrency[i][1].switch = GetDBKeyValue("Plus_"..(i+10).."_ExPhiriusShell");	-- 必爾丁圓貝
		g_ExCurrency[i][2].switch = GetDBKeyValue("Plus_"..(i+10).."_ExEnergyJustice");	-- 正義能量
		g_ExCurrency[i][3].switch = GetDBKeyValue("Plus_"..(i+10).."_ExDreamland");	-- 夢境先遣印記
		g_ExCurrency[i][4].switch = GetDBKeyValue("Plus_"..(i+10).."_ExAncient");	-- 古代遺物
		g_ExCurrency[i][5].switch = GetDBKeyValue("Plus_"..(i+10).."_ExProofMyth");	-- 傳奇之證
	
		g_ExCurrency[i][1].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExPhiriusShellQuantity");	-- 必爾丁圓貝數量
		g_ExCurrency[i][2].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExEnergyJusticeQuantity");	-- 正義能量數量
		g_ExCurrency[i][3].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExDreamlandQuantity");	-- 夢境先遣印記數量
		g_ExCurrency[i][4].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExAncientQuantity");	-- 古代遺物數量
		g_ExCurrency[i][5].quantity = GetDBKeyValue("Plus_"..(i+10).."_ExProofMythQuantity");	-- 傳奇之證數量

		g_ProgramStatus[i] = 0;
		-- 取得兌換貨幣的清單
		for Index, Value in ipairs(g_ExCurrency[i]) do
		--	Say( Owner, "ExIndex = "..Index..", switch = "..Value.switch.." , quantity = "..Value.quantity );
			if Value.switch > 0 and Value.quantity > 0 then
				local Ex = {};
				Ex.index = index;
				Ex.quantity = Value.quantity;
				table.insert( g_ExStatus[i], Ex );
				g_ExStatusCount[i] = g_ExStatusCount[i] + 1;
				if g_ProgramStatus[i] == 0 then
					g_Program = g_Program + 1;
					g_ProgramStatus[i] = 1;
					Say( Owner, "Program = "..g_Program..", Plan "..i.." = "..g_ProgramStatus[i] );
				end
			end

		end
	end

--[[
	-- 設定各方案的係數 ----------------------------------------------------
	local g_Info = {};
	for i = 1, #g_CurrencyInfo do	-- 方案總數
	
		g_Info[i] = {};
		g_Info[i].SysDate = EM_RoleValue_Register+((i-1)*2)	-- 系統時間
		g_Info[i].Date = EM_AccountFlag_CE_Date14_12+((i-1)*20)	-- 玩家身上最後一次與 Npc 兌換的時間
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count14_8+((i-1)*20)	-- 玩家帳號單日兌換上限量
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+((i-1)*2+1)	-- 伺服器每日兌換上限，記錄於 Npc 身上
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i+4)	-- Server 每周兌換當前剩餘數量
	
		g_Info[i].LowestLv = GetDBKeyValue("Plus_"..(i+10).."_LowestLv");	-- 兌換最低需求等級
		g_Info[i].HighestLv = GetDBKeyValue("Plus_"..(i+10).."_HighestLv");	-- 兌換最高需求等級
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyAccountLimit");	-- 玩家帳號每日兌換上限量
		g_Info[i].DailyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_DailyServerLimit");	-- Server 每日兌換上限量
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Plus_"..(i+10).."_WeeklyServerLimit");	-- Server 每周兌換上限量
		
		g_Info[i].Gift = g_Gift[i];	-- 判斷為贈送或兌換
		g_Info[i].Status = g_Status[i];	-- 支付貨幣數量
		g_Info[i].ExStatus = g_ExStatus[i];	-- 兌換貨幣數量
		g_Info[i].Log = 12414900+(i*10);	-- 上線時交易
		g_Info[i].DailyLimitLog = 12414901+(i*10);	-- 伺服器每日至上限時
		g_Info[i].WeeklyLimitLog = 12414902+(i*10);	-- 伺服器每周至上限時

		for Index, Value in pairs(g_Info[i]) do
			Say( Owner, "Index = "..Index.." , Value = "..tostring(Value) );
		end
	end
--]]
end