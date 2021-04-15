--調整貨幣
--/gm ? runplot Hao_Monetary_Union_Adjust

-- 調整兌換次數 ( String = 1 為個人、2 為 Server 每日、3 為 Server 每周、-1 為全設定， Amount 不填時為恢復預設，填 0 以上時，為指定兌換次數)
--/gm ? pcall %s_id "Hao_SetItemExchange(String,Amount)"

-- 註冊表 -- Npc 身上的 Reg 值使用狀況，記錄 Server 每日兌換次數用
-- EM_RoleValue_Register+0 方案1 判斷時間
-- EM_RoleValue_Register+1 方案1 判斷兌換次數，最多 127 次
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
local g_ProgramTotally = 5;
-- 貨幣Define、貨幣編號、貨幣上限(-1時為無上限)、貨幣字串、貨幣翻譯
local g_CurrencyInfo = {};
g_CurrencyInfo[1] = { EM_RoleValue_PhiriusShellCoin, 11, 1000, "[SYS_MONEY_TYPE_11]", "Phirius Shell" };	-- 必爾丁圓貝
g_CurrencyInfo[2] = { EM_RoleValue_EnergyJusticeCoin, 12, -1, "[SYS_MONEY_TYPE_12]", "Energy of Justice" };	-- 正義能量
g_CurrencyInfo[3] = { EM_RoleValue_DreamlandCoin, 10, -1, "[SYS_MONEY_TYPE_10]", "Dreamland Pioneer Sigil" };	-- 夢境先遣印記
g_CurrencyInfo[4] = { EM_RoleValue_RelicsCoin, 9, 10000, "[SYS_MONEY_TYPE_9]", "Ancient Mementos" };	-- 古代遺物
g_CurrencyInfo[5] = { EM_RoleValue_ProofLegendCoin, 13, -1, "[SYS_MONEY_TYPE_13]", "Proof of Myth" };	-- 傳奇之證
-- 宣告支付與兌換貨幣的清單
local g_Status = {};	-- 記錄支出貨幣資料(數量)
local g_ExStatus = {};	-- 記錄兌換貨幣資料(數量)
local g_StatusCount = {};-- 使 DesignLog 的標點符號精準化
local g_ExStatusCount = {};-- 使 DesignLog 的標點符號精準化
local g_Gift = {};	-- 判斷是贈予或兌換
-- 取得 LogView 中支付貨幣的設定
local g_Currency = {};
-- 判斷方案數量
local g_Program = 0;	-- 以幣換幣 方案總量超過複數時，會新增一層主目錄選單
local g_ProgramStatus = {};	-- 避免廠商設定方案跳號時，函式錯亂的問題(譬如廠商使用方案 2 3 5，直接跳過方案 1 4 )
-- 取得 LogView 中兌換貨幣的設定
local g_ExCurrency = {};
-- 設定各方案的係數
local g_Info = {};
-------------------------------------------------------------------------
function Hao_CurrencyExchange_Reset()	-- 初始化

	for i = 1, g_ProgramTotally do	-- 初始化
		g_Status[i] = {};
		g_ExStatus[i] = {};
		g_StatusCount[i] = 0;
		g_ExStatusCount[i] = 0;
		g_Gift[i] = true;
	end

	for i = 1, g_ProgramTotally do	-- 方案數量
	
		g_Currency[i] = {};
		g_Currency[i][1] = GetDBKeyValue("Currency_0"..i.."_PhiriusShell");	-- 必爾丁圓貝數量
		g_Currency[i][2] = GetDBKeyValue("Currency_0"..i.."_EnergyJustice");	-- 正義能量數量
		g_Currency[i][3] = GetDBKeyValue("Currency_0"..i.."_Dreamland");	-- 夢境先遣印記數量
		g_Currency[i][4] = GetDBKeyValue("Currency_0"..i.."_Ancient");	-- 古代遺物數量
		g_Currency[i][5] = GetDBKeyValue("Currency_0"..i.."_ProofMyth");	-- 傳奇之證數量
	
		-- 取得支付貨幣的清單
		for Index, Value in ipairs(g_Currency[i]) do
			if Value > 0 then	-- 當該貨幣的支付開關設為開啟且支付數量設為 1 以上，滿足支付條件時。
				local Pay = {};
				Pay.index = Index;
				Pay.quantity = Value;
				table.insert( g_Status[i], Pay );
				g_Gift[i] = false;	-- 宣告此方案非贈予類型，為兌換類型
				g_StatusCount[i] = g_StatusCount[i] + 1;
			end
		end
	end
	
	for i = 1, g_ProgramTotally do	-- 方案數量
	
		g_ExCurrency[i] = {};
		g_ExCurrency[i][1] = GetDBKeyValue("Currency_0"..i.."_ExPhiriusShell");	-- 必爾丁圓貝數量
		g_ExCurrency[i][2] = GetDBKeyValue("Currency_0"..i.."_ExEnergyJustice");	-- 正義能量數量
		g_ExCurrency[i][3] = GetDBKeyValue("Currency_0"..i.."_ExDreamland");	-- 夢境先遣印記數量
		g_ExCurrency[i][4] = GetDBKeyValue("Currency_0"..i.."_ExAncient");	-- 古代遺物數量
		g_ExCurrency[i][5] = GetDBKeyValue("Currency_0"..i.."_ExProofMyth");	-- 傳奇之證數量
	
		g_ProgramStatus[i] = 0;
		-- 取得兌換貨幣的清單
		for Index, Value in ipairs(g_ExCurrency[i]) do
			if Value > 0 then	-- 當該貨幣的兌換開關設為開啟且兌換數量設為 1 以上，滿足兌換條件時。
				local Ex = {};
				Ex.index = Index;
				Ex.quantity = Value;
				table.insert( g_ExStatus[i], Ex );
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
		g_Info[i].Date = EM_AccountFlag_CE_Date14_12+((i-1)*20)	-- 玩家身上最後一次與 Npc 兌換的時間
		g_Info[i].DailyAccountAmount = EM_AccountFlag_CE_Count14_8+((i-1)*20)	-- 玩家帳號單日兌換上限量
		g_Info[i].DailyServerAmount = EM_RoleValue_Register+((i-1)*2+1)	-- 伺服器每日兌換上限，記錄於 Npc 身上
		g_Info[i].WeeklyServerAmount = "SC_ITEM_SOP_20"..(i+4)	-- Server 每周兌換當前剩餘數量
	
		g_Info[i].LowestLv = GetDBKeyValue("Currency_0"..i.."_LowestLv");	-- 兌換最低需求等級
		g_Info[i].HighestLv = GetDBKeyValue("Currency_0"..i.."_HighestLv");	-- 兌換最高需求等級
		g_Info[i].DailyAccountLimit = GetDBKeyValue("Currency_0"..i.."_DailyAccountLimit");	-- 玩家帳號每日兌換上限量
		g_Info[i].DailyServerLimit = GetDBKeyValue("Currency_0"..i.."_DailyServerLimit");	-- Server 每日兌換上限量
		g_Info[i].WeeklyServerLimit = GetDBKeyValue("Currency_0"..i.."_WeeklyServerLimit");	-- Server 每周兌換上限量
		
		g_Info[i].Gift = g_Gift[i];	-- 判斷為贈送或兌換
		g_Info[i].Status = g_Status[i];	-- 支付貨幣數量
		g_Info[i].ExStatus = g_ExStatus[i];	-- 兌換貨幣數量
	
		-- 記錄於 LogView 上的 DesignLog 功能
		g_Info[i].TradeLog = 12414900+(i*10);	-- 上線時交易
		g_Info[i].DailyTradeLimitLog = 12414901+(i*10);	-- 伺服器每日至上限時
		g_Info[i].WeeklyTradeLimitLog = 12414902+(i*10);	-- 伺服器每周至上限時
	
	end
end
---------------------------------------------------------------
function Hao_CurrencyExchange_Home()	-- 兌換 Npc 首頁 判斷方案數量，視數量改變起始對話

	if g_ResetDefault == 0 then	-- 初始化設定
		Hao_CurrencyExchange_Reset();
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
				Hao_CurrencyExchangeProgram(i);
				break;
			end
		end
	else	-- 開啟複數以上方案時
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_229]" );
		for i = 1, #g_ProgramStatus do
		--	DebugMsg( Owner, Room, "Status = "..g_ProgramStatus[i].." , i = "..i );
			if g_ProgramStatus[i] == 1 then
				ProgramAmount = ProgramAmount + 1;
				local ProgramNumber = "[SC_ITEM_SOP_2"..(17+ProgramAmount).."]";
			--	DebugMsg( Owner, Room, "Number = "..ProgramNumber..", Name = "..ProgramName );
				AddSpeakOption( Owner, Target, ProgramNumber, "Hao_CurrencyExchangeProgram("..i..")" , 0 );
			end
		end
	end
end

function Hao_CurrencyExchangeProgram(Select)

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Month = GetSystime(3)+1;	-- 讀取現在月份
	local Day = GetSystime(4);	-- 讀取現在日期 (1)為時 (2)為分 (3)+1 為月 (4)為天
	local SysDate = Month*100+Day;	-- 系統時間 最小顯示 101 ( 1月1號 ) 最大顯示 1231 ( 12月31號 )
	AdjustFaceDir( Target, Owner, 0 ); -- 面向

--	DebugMsg( Owner, Room, "Select = "..Select );

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
		SetWorldVar( g_Info[Select].WeeklyServerAmount, g_Info[Select].WeeklyServerLimit+100 );
	end

	local String = {};
	String.wrap = "\n";	-- 換行
	String.paytitle = "[SC_ITEM_SOP_211]";	-- 繳交
	String.extitle = "[SC_ITEM_SOP_212]";	-- 兌換
	String.pay = "";
	String.ex = "";

	for Sort, Data in ipairs(g_Info[Select].Status) do
		String.pay = String.pay.."<CY>"..Data.quantity.."</CY>".." ".."<CM>"..g_CurrencyInfo[Data.index][4].."</CM>"..String.wrap;
	end

	for Sort, Data in ipairs(g_Info[Select].ExStatus) do
		String.ex = String.ex.."<CY>"..Data.quantity.."</CY>".." ".."<CM>"..g_CurrencyInfo[Data.index][4].."</CM>"..String.wrap;
	end

	if g_Info[Select].Gift then
		String.title = "[SC_ITEM_SOP_213]"..String.wrap;	-- 開頭
		-- 今天贈送的內容如下，你確定要現在領取嗎？
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

	-- 單一帳號每日可使用次數還剩下：<CY>[$VAR3]</CY>
	if g_Info[Select].DailyServerLimit ~= 0 then
		local DailyServerAmount = ReadRoleValue( Target, g_Info[Select].DailyServerAmount );	-- 讀取 Npc 身上的Server單日兌換上限量
		String.sentence = String.sentence.."[SC_ITEM_SOP_215][$SETVAR4="..DailyServerAmount.."]"..String.wrap;
		-- 伺服器每日可使用次數還剩下：<CY>[$VAR4]<CY>
	end

	if g_Info[Select].WeeklyServerLimit ~= 0 then
		WeeklyServerAmount = GetWorldVar( g_Info[Select].WeeklyServerAmount )-100;	-- 讀取 Server 每周兌換當前剩餘數量
		String.sentence = String.sentence.."[SC_ITEM_SOP_216][$SETVAR5="..WeeklyServerAmount.."]";
		-- 伺服器每周可使用次數還剩下：<CY>[$VAR5]</CY>
	end
	SetSpeakDetail( Owner, String.sentence );
	AddSpeakOption( Owner, Target, "[SC_111284_6]", "Hao_CurrencyExchangeProgram_Dialog("..Select..")", 0 );
	if g_Program > 1 then	-- 開啟複數以上方案時
		AddSpeakOption( Owner, Target, "[SC_BUFFNPC_12]", "Hao_CurrencyExchange_Home", 0 );
	end
end

function Hao_CurrencyExchangeProgram_Dialog(Select)

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_Lv );	-- 玩家等級

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

	for Sort, Data in ipairs(g_Info[Select].Status) do	-- 查詢指定貨幣數量是否足夠
	--	Say( Owner, g_CurrencyInfo[Data.index][4].." , quantity = "..tostring(CheckSpeicalCoin( Owner, g_CurrencyInfo[Data.index][2], Data.quantity )) );
		if ( not CheckSpeicalCoin( Owner, g_CurrencyInfo[Data.index][2], Data.quantity ) ) then
			SetSpeakDetail( Owner, "[SC_112311_6]" ); -- 您所持有的數量不足，還不能兌換喔。 
			return PlayMotion( Target, 107 );	-- 搖頭
		end
	end

	local Overload = {};	-- 過載清單
	Overload.title = "[SC_ITEM_SOP_226]";	-- 服務中止，您持有的下述貨幣將在本次服務後超出數量上限：
	Overload.list = ""	-- 超出堆疊數量的貨幣清單
	Overload.wrap = "\n";	-- 換行
	Overload.sentence = "";	-- 對話介面中看到的內容
	Overload.status = False;	-- 判斷是否有超出堆疊數量的貨幣

	for Sort, Data in ipairs(g_Info[Select].ExStatus) do	-- 檢查貨幣是否超出數量上限
		local Ceiling = g_CurrencyInfo[Data.index][3];	-- 貨幣上限數量
		if Ceiling > 0 then	-- 當該貨幣有設定上限時
			local Deposit = ReadRoleValue( Owner, g_CurrencyInfo[Data.index][1] );	-- 貨幣持有數量
			local Maximum = Deposit + Data.quantity;	-- 現有貨幣數量+兌換貨幣數量
			if Maximum > Ceiling then	-- 貨幣總量 > 數量上限時，中止進行方案
				local name = g_CurrencyInfo[Data.index][4];	-- 超出的貨幣類型
				local quantity = (Maximum - Ceiling);	-- 超出貨幣的數量
				Overload.list = Overload.list.."<CY>"..quantity.."</CY>".." ".."<CM>"..name.."</CM>"..String.wrap;
				Overload.status = True;
			end
		end
	end

	if Overload.Status then	-- 服務中止！您持有的貨幣將於本次服務後超出數量上限，請見下述貨幣類型與超出數量：
		Overload.sentence = Overload.title..Overload.wrap..Overload.wrap..Overload.list;
		SetSpeakDetail( Owner, Overload.sentence ); -- 兌換失敗
		return PlayMotion( Target, 107 );	-- 搖頭;
	end

	local String = {};
	String.paytitle = "Exchange ";	-- 開頭
	String.present = "Get "
	String.paymaxtitle = "There is a limit cap in exchanging ";	-- 開頭
	String.extitle = "to ";	-- 開頭
	String.ex = "";	-- 繳交
	String.pay = "";	-- 兌換
	String.sentence = "";

	local Count = 0;	-- 使 DesignLog 的標點符號精準化
	local ExCount = 0;	-- 同上

	for Sort, Data in ipairs(g_Info[Select].Status) do	-- 繳交清單
		AddSpeicalCoin( Owner, 11, g_CurrencyInfo[Data.Index][2], -Data.quantity );	-- 執行者、Action Type(劇情給予)、貨幣代號、此次給予數量
		ScriptMessage( Owner, Owner, 0, "[SC_ITEM_SOP_224][$SETVAR1="..Data.quantity.."][$SETVAR2="..g_CurrencyInfo[Data.Index][4].."]", 0 );	-- 對話框 你支付了 _ 貨幣
		Count = Count + 1;
		if Count < g_StatusCount[Select] then
			String.pay = String.pay..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity..", ";
		else
			String.pay = String.pay..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity.." ";
		end
	end

	for Sort, Data in ipairs(g_Info[Select].ExStatus) do	-- 兌換清單
		AddSpeicalCoin( Owner, 11, g_CurrencyInfo[Data.Index][2], Data.quantity );
		ScriptMessage( Owner, Owner, 0, "[SC_ITEM_SOP_225][$SETVAR1="..Data.quantity.."][$SETVAR2="..g_CurrencyInfo[Data.Index][4].."]", 0 );	-- 對話框 你獲得了 _ 貨幣
		ExCount = ExCount + 1;
		if ExCount < g_ExStatusCount[Select] then
			String.ex = String.ex..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity..", ";
		else
			String.ex = String.ex..g_CurrencyInfo[Data.Index][5].." x "..Data.quantity..". ";
		end
	end
	if g_Info[Select].Gift then	-- 當此方案為贈送時
		String.sentence = String.present..String.pay..String.ex;
	else
		String.sentence = String.paytitle..String.pay..String.extitle..String.ex;
	end
	WriteAccountFlagValue( Owner, g_Info[Select].DailyAccountAmount, 8, DailyAccountAmount - 1 );	-- 玩家帳號身上的單日兌換上限量 -1
--	DebugMsg( Owner, Room, String.sentence );
	DesignLog( Owner, g_Info[Select].TradeLog, String.sentence );	-- 兌換 Log

	if g_Info[Select].DailyServerLimit ~= 0 then	-- Server 每日兌換達到上限時的 Log
		WriteRoleValue( Target, g_Info[Select].DailyServerAmount, DailyServerAmount - 1 );	-- NPC身上的 Server 單日兌換上限數量 -1
		if DailyServerAmount - 1 == 0 then	-- 當 Server 單日兌換達至上限時
			String.sentence = String.paymaxtitle..String.pay..String.extitle..String.ex;
		--	DebugMsg( Owner, Room, String.sentence.."today." );
			DesignLog( Owner, g_Info[Select].DailyTradeLimitLog, String.sentence.." today." );
		end
	end

	if g_Info[Select].WeeklyServerLimit ~= 0 then	-- Server 每周兌換達到上限時的 Log
		SetWorldVar( g_Info[Select].WeeklyServerAmount, WeeklyServerAmount-1 );	-- 寫入 Server 每周兌換剩餘數量
		if WeeklyServerAmount - 1 == 100 then	-- 當 Server 當周兌換達至上限時
			String.sentence = String.paymaxtitle..String.pay..String.extitle..String.ex;
		--	DebugMsg( Owner, Room, String.sentence.."this week." );
			DesignLog( Owner, g_Info[Select].WeeklyTradeLimitLog, String.sentence.." this week." );
		end
	end
end