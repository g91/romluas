-- 調整兌換次數 ( String = 1 為個人、2 為 Server 每日、3 為 Server 每周、-1 為全設定， Amount 不填時為恢復預設，填 0 以上時，為指定兌換次數)
--/gm ? pcall %s_id "Hao_SetItemExchange(String,Amount)"

-- 註冊表 -- Npc 身上的 Reg 值使用狀況，記錄 Server 單日兌換次數用
-- EM_RoleValue_Register+0 方案1 判斷時間
-- EM_RoleValue_Register+1 方案1 兌換次數
-- EM_RoleValue_Register+2 方案2 時間
-- EM_RoleValue_Register+3 方案2 兌換次數
-- EM_RoleValue_Register+4 方案3 時間
-- EM_RoleValue_Register+5 方案3 兌換次數
-- EM_RoleValue_Register+6 方案4 時間
-- EM_RoleValue_Register+7 方案4 兌換次數
-- EM_RoleValue_Register+8 方案5 時間
-- EM_RoleValue_Register+9 方案5 兌換次數

-- 初始化，重新開機時進行的初始化資料
local g_ResetDefault = 0;
-- 方案總數
local g_ProgramTotally = 5;	-- 方案數量
local g_ItemAmountLimit = 5;	-- 每個方案的支出與兌換物品種類上限
-- 宣告支付與兌換貨幣的清單
local g_Status = {};	-- 記錄支出物品資料(ID、數量)
local g_ExStatus = {};	-- 記錄兌換物品資料(ID、數量)
local g_StatusCount = {};-- 使 DesignLog 的標點符號精準化
local g_ExStatusCount = {};-- 使 DesignLog 的標點符號精準化
local g_Gift = {};	-- 判斷是贈予或兌換
-- 判斷方案數量
local g_Program = 0;	-- 以物換物 方案總量，超過複數時，會新增一層主目錄選單
local g_ProgramStatus = {};	-- 避免廠商設定方案跳號時，函式錯亂的問題(譬如廠商使用方案 2 3 5，直接跳過方案 1 4 )
-- 設定各方案的係數
local g_Info = {};
---------------------------------------------------------------
function Hao_ItemExchange_Reset()	-- 初始化設定

	for i = 1, g_ProgramTotally do	-- 初始化
		g_Status[i] = {};
		g_ExStatus[i] = {};
		g_StatusCount[i] = 0;
		g_ExStatusCount[i] = 0;
		g_Gift[i] = true;
	end

	-- 取得 LogView 中 支付物品 與 兌換物品 的相關設定 --------------
	for i = 1, g_ProgramTotally do	-- 方案數量
	
		g_ProgramStatus[i] = 0;
		for j = 1, g_ItemAmountLimit do
			local Item = {};	-- 方案 i 的支出物品清單
			local ExItem = {};	-- 方案 i 的兌換物品清單
			Item.id = GetDBKeyValue( "Plus_0"..i.."_ItemID_0"..j );	-- 支付物品ID
			Item.count = GetDBKeyValue( "Plus_0"..i.."_ItemAmount_0"..j );	-- 支付物品數量
			ExItem.id = GetDBKeyValue( "Plus_0"..i.."_ExItemID_0"..j );	-- 兌換物品ID
			ExItem.count = GetDBKeyValue( "Plus_0"..i.."_ExItemAmount_0"..j );	-- 兌換物品數量
	
			if Item.id > 0 and Item.count > 0 then
				table.insert( g_Status[i], Item );
				g_Gift[i] = false;
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
	
			if ExItem.id > 0 and ExItem.count > 0 then
				table.insert( g_ExStatus[i], ExItem );
				g_ExStatusCount[i] = g_ExStatusCount[i] + 1;
				if g_ProgramStatus[i] == 0 then
					g_Program = g_Program + 1;
					g_ProgramStatus[i] = 1;
				end
			end
		end
	end

	for i = 1, g_ProgramTotally do	-- 方案總數
	
		g_Info[i] = {};
		g_Info[i].SysDate = EM_RoleValue_Register+((i-1)*2)	-- 系統時間
		g_Info[i].Date = EM_AccountFlag_CE_Date9_12+((i-1)*20)	-- 玩家身上最後一次與 Npc 兌換的時間
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count9_8+((i-1)*20)	-- 玩家帳號單日兌換上限量
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+((i-1)*2+1)	-- 伺服器每日兌換上限，記錄於 Npc 身上
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i-1)	-- Server 每周兌換當前剩餘數量
	
		g_Info[i].LowestLv = GetDBKeyValue("Plus_0"..i.."_LowestLv");	-- 兌換最低需求等級
		g_Info[i].HighestLv = GetDBKeyValue("Plus_0"..i.."_HighestLv");	-- 兌換最高需求等級
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Plus_0"..i.."_DailyAccountLimit");	-- 玩家帳號每日兌換上限量
		g_Info[i].DailyServerLimit = GetDBKeyValue("Plus_0"..i.."_DailyServerLimit");	-- Server 每日兌換上限量
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Plus_0"..i.."_WeeklyServerLimit");	-- Server 每周兌換上限量
		
		g_Info[i].Gift = g_Gift[i];	-- 判斷為贈送或兌換
		g_Info[i].Item = g_Status[i];	-- 支付物品資料
		g_Info[i].ExItem = g_ExStatus[i];	-- 兌換物品資料
	
		-- 記錄於 LogView 上的 DesignLog 功能
		g_Info[i].TradeLog = 12414800+(i*10);	-- 交易時
		g_Info[i].DailyTradeLimitLog = 12414801+(i*10);	-- 伺服器每日交易至上限時
		g_Info[i].WeeklyTradeLimitLog = 12414802+(i*10);	-- 伺服器每周交易至上限時
	end
end

function Hao_ItemExchange_Home()	-- 兌換 Npc 首頁 判斷方案數量，視數量改變起始對話

	if g_ResetDefault == 0 then	-- 初始化設定
		Hao_ItemExchange_Reset();
		g_ResetDefault = 1;
	end

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ProgramAmount = 0;
--	DebugMsg( Owner, Room, "g_Program = "..g_Program );
	NpcDialog( Target, Owner );

	if g_Program == 0 then	-- 所有方案均不滿足成立條件時
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_223]" );	-- 服務尚未開放，請您耐心等候。
	elseif g_Program == 1 then	-- 只開啟單一方案時
		for i = 1, #g_ProgramStatus do
			if g_ProgramStatus[i] == 1 then
				Hao_ItemExchangeProgram(i);
				break;
			end
		end
	elseif g_Program > 1 then	-- 開啟複數以上方案時
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_217]" );
		for i = 1, #g_ProgramStatus do
		--	DebugMsg( Owner, Room, "Status = "..g_ProgramStatus[i] );
			if g_ProgramStatus[i]  == 1 then
				ProgramAmount = ProgramAmount + 1;
				local ProgramNumber = "[SC_ITEM_SOP_2"..(17+ProgramAmount).."]";
			--	DebugMsg( Owner, Room, "Number = "..ProgramNumber..", Name = "..ProgramName );
				AddSpeakOption( Owner, Target, ProgramNumber, "Hao_ItemExchangeProgram("..i..")" , 0 );
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
function Hao_ItemExchangeProgram(Select)

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Month = GetSystime(3)+1;	-- 讀取現在月份
	local Day = GetSystime(4);	-- 讀取現在日期 (1)為時 (2)為分 (3)+1 為月 (4)為天
	local SysDate = Month*100+Day;	-- 系統時間 最小顯示 101 ( 1月1號 ) 最大顯示 1231 ( 12月31號 )
	AdjustFaceDir( Target, Owner, 0 ); -- 面向

	local PlayerDate = ReadAccountFlagValue( Owner, g_Info[Select].Date, 12 );	-- 讀取玩家身上最後一次與 Npc 兌換的時間
	if PlayerDate ~= SysDate then	-- 每日判斷，給允玩家帳號單日兌換次數
		WriteAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8, g_Info[Select].DailyAccountLimit );	-- 重新寫入玩家帳號單日兌換上限量
		WriteAccountFlagValue( Owner, g_Info[Select].Date, 12, SysDate );
	end

	local NpcDate = ReadRoleValue( Target, g_Info[Select].SysDate );	-- 讀取 Npc 身上最後一次與玩家兌換的時間
	if NpcDate ~= SysDate and g_Info[Select].DailyServerLimit ~= 0 then	-- 判斷Server單日兌換上限量是否重置
		WriteRoleValue( Target, g_Info[Select].SysDate, SysDate );
		WriteRoleValue( Target, g_Info[Select].DailyServerAmount, g_Info[Select].DailyServerLimit );	-- 重新寫入Server單日兌換上限量
	end

	local WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount );	-- 讀取 Server 每周兌換當前剩餘數量
	-- 此值 = 0 時，代表 Server 剛開啟， = 100 時，代表當周兌換數量已兌換清空，> 100 時，代表當周兌換數量已兌換清空
	if WeeklyServerAmount == 0 and g_Info[Select].WeeklyServerLimit ~= 0 then	-- 重置  Server 每周兌換數量
		SetWorldVar( g_Info[i].WeeklyServerAmount, g_Info[Select].WeeklyServerLimit+100 );
	end

	local String = {};
	String.wrap = "\n";	-- 換行
	String.paytitle = "[SC_ITEM_SOP_211]";	-- 繳交
	String.extitle = "[SC_ITEM_SOP_212]";	-- 兌換
	String.pay = "";
	String.ex = "";

	local Count = 0;	-- DebugMsg 使用，於對話視窗中提示繳交物品

	for Sort, Data in ipairs(g_Info[Select].Item) do
		Count = Count +1;
		String.pay = String.pay.."<CM>".."["..Data.id.."]".."</CM>".." x ".."<CY>"..Data.count.."</CY>"..String.wrap;
		if Count == g_StatusCount[Select] then
		--	DebugMsg( Owner, Room, "Submit "..String.wrap..String.pay );
		end
	end

	for Sort, Data in ipairs(g_Info[Select].ExItem) do
		String.ex = String.ex.."<CM>".."["..Data.id.."]".."</CM>".." x ".."<CY>"..Data.count.."</CY>"..String.wrap;
	end

	if g_Info[Select].Gift then
		String.title = "[SC_ITEM_SOP_213]"..String.wrap;	-- 開頭
		-- 今天會贈送下述物品，你確定要現在領取嗎？
		String.sentence = String.title..String.wrap..String.ex..String.wrap;
	else
		String.title = "[SC_ITEM_SOP_210]"..String.wrap;	-- 開頭
		-- 你確定要進行以下兌換嗎？
		String.sentence = String.title..String.wrap..String.paytitle..String.wrap..String.pay..String.wrap..String.extitle..String.wrap..String.ex..String.wrap;
	end

	if g_Info[Select].LowestLv > 0 and g_Info[Select].HighestLv > 0 then	-- 使用等級限制：<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
		String.sentence = String.sentence.."[SC_ITEM_SOP_230][$SETVAR1="..g_Info[Select].LowestLv.."][$SETVAR2="..g_Info[Select].HighestLv.."]"..String.wrap;
	end

	local DailyAccountAmount = ReadAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8 );	-- 讀取玩家帳號身上的單日兌換上限量

	String.sentence = String.sentence.."[SC_ITEM_SOP_214][$SETVAR3="..DailyAccountAmount.."]"..String.wrap;
	-- 單一帳號每日可領取次數還剩下：<CY>[$VAR3]</CY>
	if g_Info[Select].DailyServerLimit ~= 0 then
		local DailyServerAmount = ReadRoleValue( Target, g_Info[Select].DailyServerAmount );	-- 讀取 Npc 身上的Server單日兌換上限量
		String.sentence = String.sentence.."[SC_ITEM_SOP_215][$SETVAR4="..DailyServerAmount.."]"..String.wrap;
		-- 伺服器每日可領取次數還剩下：<CY>[$VAR4]<CY>
	end

	if g_Info[Select].WeeklyServerLimit ~= 0 then
		WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount )-100;	-- 讀取 Server 每周兌換當前剩餘數量
		String.sentence = String.sentence.."[SC_ITEM_SOP_216][$SETVAR5="..WeeklyServerAmount.."]"
		-- 伺服器每周可領取次數還剩下：<CY>[$VAR5]</CY>
	end
	SetSpeakDetail( Owner, String.sentence );
	AddSpeakOption( Owner, Target, "[SC_111284_6]", "Hao_ItemExchangeProgram_Dialog("..Select..")" , 0 );
	if g_Program > 1 then	-- 開啟複數以上方案時
		AddSpeakOption( Owner, Target, "[SC_BUFFNPC_12]", "Hao_ItemExchange_Home" , 0 );
	end
end

function Hao_ItemExchangeProgram_Dialog(Select)

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_Lv );	-- 玩家等級
	local NeedBagSpace = 0;	-- 需求背包空間

	AdjustFaceDir( Target, Owner, 0 ); -- 面向
	CloseSpeak( Owner );

	if g_Info[Select].LowestLv > 0 and g_Info[Select].HighestLv > 0 then	-- 當需求最低等級與需求最高等級有設定時，查詢等級區間
		if PlayerLv < g_Info[Select].LowestLv or PlayerLv > g_Info[Select].HighestLv then	-- 您的主職等級必須介於此區間才符合使用資格：<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..g_Info[Select].LowestLv.."][$SETVAR2="..g_Info[Select].HighestLv.."]" );
			return PlayMotion( Target, 107 );	-- 搖頭
		end
	end

	local DailyAccountAmount =  ReadAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8 );	-- 玩家帳號身上的單日兌換上限量
	local DailyServerAmount = ReadRoleValue( Target, g_Info[Select].DailyServerAmount );	-- Npc 身上的Server單日兌換上限量
	local WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount );	-- Npc 身上的Server每周兌換上限量 ( 屬於 Server 變數、可跨 Zone )

	if WeeklyServerAmount < 101 and g_Info[Select].WeeklyServerLimit ~= 0 then
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_14]" ) -- 本次兌換次數已達上限，兌換服務將於伺服器維護後重新開放。
		return PlayMotion( Target, 107 );	-- 搖頭
	elseif DailyAccountAmount < 1 or ( DailyServerAmount < 1 and g_Info[Select].DailyServerLimit ~= 0 ) then
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_08]" );	-- 今日兌換次數已達上限，限量是殘酷的...請您明天再來。
		return PlayMotion( Target, 107 );	-- 搖頭;
	end

	for Sort, Data in ipairs(g_Info[Select].Item) do	-- 查詢玩家身上的指定物品數量是否足夠
		if CountBodyItem( Owner, Data.id ) < Data.count then
			SetSpeakDetail( Owner, "[SC_112311_6]") -- 您所持有的數量不足，還不能兌換喔。 
			return PlayMotion( Target, 107 );	-- 搖頭
		end
	end

	for Sort, Data in ipairs(g_Info[Select].ExItem) do
		local MaxHeap = GameObjInfo_Int( Data.id ,"MaxHeap" ) -- 物品堆疊量
		if Data.count > MaxHeap then	-- 當設定物品數量 > 堆疊量上限時，兌換不成立
			SetSpeakDetail( Owner, "[SC_EXCHANGE_FAIL]" ) -- 兌換失敗
			return PlayMotion( Target, 107 );	-- 搖頭;
		end
		NeedBagSpace = NeedBagSpace + 1;
	end

	if Check_Bag_Space( Owner, NeedBagSpace ) == false then
		SetSpeakDetail( Owner, "[SC_TREASURE_NOSPACE]" ); -- 你的背包空間不足
		return PlayMotion( Target, 107 );	-- 搖頭;
	end

	local String = {};
	String.paytitle = "Exchange ";	-- 開頭
	String.present = "Presents are "
	String.paymaxtitle = "There is a limit cap in exchanging ";	-- 開頭
	String.extitle = "to  ";	-- 開頭
	String.ex = "";	-- 繳交
	String.pay = "";	-- 兌換
	String.sentence = "";

	local Count = 0;	-- 使 DesignLog 的標點符號精準化
	local ExCount = 0;	-- 同上

	for Sort, Data in ipairs(g_Info[Select].Item) do	-- 繳交清單
		DelBodyItem( Owner, Data.id, Data.count );
		Count = Count +1;
		if Count < g_StatusCount[Select] then
			String.pay = String.pay.."["..Data.id.."]".."x"..Data.count..", ";
		else
			String.pay = String.pay.."["..Data.id.."]".."x"..Data.count.." ";
		end
	end

	for Sort, Data in ipairs(g_Info[Select].ExItem) do	-- 兌換清單
		GiveBodyItem( Owner, Data.id, Data.count );
		ExCount = ExCount + 1;
		if ExCount < g_ExStatusCount[Select] then
			String.ex = String.ex.."["..Data.id.."]".."x"..Data.count..", ";
		else
			String.ex = String.ex.."["..Data.id.."]".."x"..Data.count..". ";
		end
	end

	if g_Info[Select].Gift then	-- 當此方案為贈送時
		String.sentence = String.present..String.pay..String.ex;
	else
		String.sentence = String.paytitle..String.pay..String.extitle..String.ex;
	end
	WriteAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8, DailyAccountAmount - 1 );	-- 玩家帳號身上的單日兌換上限量 -1
	DesignLog( Owner, g_Info[Select].TradeLog, String.sentence );	-- 兌換 Log

	if g_Info[Select].DailyAccountLimit ~= 0 then	-- Server 每日兌換達到上限時的 Log
		WriteRoleValue( Target, g_Info[Select].DailyServerAmount, DailyServerAmount - 1 );	-- NPC身上的 Server 單日兌換上限數量 -1
		if DailyServerAmount - 1 == 0 then	-- 當 Server 單日兌換達至上限時
			String.sentence = String.paymaxtitle..String.pay..String.extitle..String.ex;
			DesignLog( Owner, g_Info[Select].DailyTradeLimitLog, String.sentence.." today." );
		end
	end

	if g_Info[Select].WeeklyServerLimit ~= 0 then	-- Server 每周兌換達到上限時的 Log
		SetWorldVar( g_Info[Select].WeeklyServerAmount, WeeklyServerAmount-1 );	-- 寫入 Server 每周兌換剩餘數量
		if WeeklyServerAmount - 1 == 100 then	-- 當 Server 當周兌換達至上限時
			String.sentence = String.paymaxtitle..String.pay..String.extitle..String.ex;
			DesignLog( Owner, g_Info[Select].WeeklyTradeLimitLog, String.sentence.." this week." );
		end
	end
end