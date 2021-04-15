
local g_ZoneID = 400;	-- 小屋ID
local g_ReadTime = 600;	-- 使用後的閱讀時間(單位 0.1 秒)，預設為 60 秒
local g_ReadSpeedUpBuffID = {  500150, 500151, 500152 }	-- 1天、7天、30天小屋百科加速藥劑
local g_ReadSpeedUpRatio = 0.7;	-- 使用提高閱讀速度後，降低的閱讀時間倍率

-- Exp 索引表，各級距每分鐘獲得的基礎經驗值，Table表中的「職業經驗值」*「職業經驗值等級成長率」 = 需求經驗值
local g_ExpIndex = {};	-- 期望天數 = 將 1 級提高至 2 級的時間設為 1 分鐘作為基數後調整的公式，詳情請見文件 - (6.4.0)小屋百科點數調整
g_ExpIndex[1] = 53.12;	-- 1 - 30，公式 = 1 - 30級所需總經驗值 / 期望天數 / 1440(1天=1440分鐘) / (1/3+2/3+3/3+4/3)/4 (閱讀結果平均效率 )  = 72.19
g_ExpIndex[31] = 165.46;	-- 31 - 40
g_ExpIndex[41] = 2051.36;	-- 41 - 60
g_ExpIndex[61] = 5061.21;	-- 61 - 70
g_ExpIndex[71] = 5479.89;	-- 71 - 80
g_ExpIndex[81] = 6154.43;	-- 81 - 90，80級後因職業經驗值停留於 69508，有額外追加係數，詳情請見文件
g_ExpIndex[91] = 7152.23;	-- 91 - 100

local g_ReadBookMagicID = 501609;	-- 手持書籍的特效

local g_ResultExpRatio = { 1/3, 2/3, 1, 4/3 };	-- 獲得的 4 種 Exp 倍率
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- 特效，對應經驗值倍率
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultSum = #g_ResultExpRatio;
-- 1 = 你在閱讀的時候睡著了，白白浪費了時間
-- 2 = 你匆匆的讀了一遍，仍有許多地方看不懂
-- 3 = 你的努力讓你的人物穩定成長
-- 4 = 你有如醍醐灌頂，讀起書來事半功倍

local g_LvCap = {};
g_LvCap[242791] = { LowestLv = 1, HighestLv = 30 };	-- 1天戰鬥教練百科I
g_LvCap[242792] = { LowestLv = 31, HighestLv = 40 };	-- 1天戰鬥教練百科II
g_LvCap[242795] = { LowestLv = 41, HighestLv = 60 };	-- 1天戰鬥教練百科III
g_LvCap[242796] = { LowestLv = 61, HighestLv = 70 };	-- 1天戰鬥教練百科IV
g_LvCap[242797] = { LowestLv = 71, HighestLv = 80 };	-- 1天戰鬥教練百科V
g_LvCap[242798] = { LowestLv = 81, HighestLv = 90 };	-- 1天戰鬥教練百科VI
g_LvCap[242803] = { LowestLv = 91, HighestLv = 100 };	-- 1天戰鬥教練百科VII

g_LvCap[243304] = { LowestLv = 1, HighestLv = 30 };	-- 7天戰鬥教練百科I
g_LvCap[243305] = { LowestLv = 31, HighestLv = 40 };	-- 7天戰鬥教練百科II
g_LvCap[243306] = { LowestLv = 41, HighestLv = 60 };	-- 7天戰鬥教練百科III
g_LvCap[243307] = { LowestLv = 61, HighestLv = 70 };	-- 7天戰鬥教練百科IV
g_LvCap[243308] = { LowestLv = 71, HighestLv = 80 };	-- 7天戰鬥教練百科V
g_LvCap[243309] = { LowestLv = 81, HighestLv = 90 };	-- 7天戰鬥教練百科VI
g_LvCap[243310] = { LowestLv = 91, HighestLv = 100 };	-- 7天戰鬥教練百科VII

g_LvCap[202699] = { LowestLv = 1, HighestLv = 30 };	-- 30天戰鬥教練百科I
g_LvCap[202700] = { LowestLv = 31, HighestLv = 40 };	-- 30天戰鬥教練百科II
g_LvCap[202701] = { LowestLv = 41, HighestLv = 60 };	-- 30天戰鬥教練百科III
g_LvCap[240490] = { LowestLv = 61, HighestLv = 70 };	-- 30天戰鬥教練百科IV
g_LvCap[240491] = { LowestLv = 71, HighestLv = 80 };	-- 30天戰鬥教練百科V
g_LvCap[240492] = { LowestLv = 81, HighestLv = 90 };	-- 30天戰鬥教練百科VI
g_LvCap[240493] = { LowestLv = 91, HighestLv = 100 };	-- 30天戰鬥教練百科VII

-- 小屋 Exp 百科 
function Encyclopedia_RoleExp( BookID )	-- 物品ID

	local Owner = OwnerID();
	local LowestLv = 0;	-- 最低等級
	local HighestLv = 0;	-- 最高等級

	for Index, Value in pairs(g_LvCap) do
		if Index == BookID then
			LowestLv = Value.LowestLv;
			HighestLv = Value.HighestLv;
			break
		end
	end
	CallPlot( Owner, "Encyclopedia_RoleExp_ReadBegin", Owner, BookID, LowestLv, HighestLv );
end

function Encyclopedia_RoleExp_ReadBegin( Owner, BookID, LowestLv, HighestLv )

	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "ZoneID = "..ZoneID );
	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- 你不在房屋內
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	local GainExp = 0;	-- 閱讀後增加的經驗值
	for Index, Value in pairs(g_ExpIndex) do
		if Index == LowestLv then
			GainExp = Value;
		--	DebugMsg( Owner, RoomID, "Basic GainExp = "..GainExp );
			break;
		end
	end

	local function CheckLv()
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Lv );
	--	DebugMsg( Owner, RoomID, "LowestLv = "..LowestLv..", HighestLv = "..HighestLv );
		-- 判斷等級，避免玩家等級在閱讀時間內提高至閱讀等級上限時，依然可以持續閱讀的問題。
		if Lv < LowestLv or Lv > HighestLv then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 );	--你的等級似乎不能閱讀此書
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 );
			return false;
		end
		return true;
	end

	local function CheckBook()
	--	DebugMsg( Owner, RoomID, "ReadBookID = "..BookID );
		-- 判斷書是否存在，避免書本在閱讀時間內消失時，依然可以持續閱讀的問題。
		if CountBodyItem( Owner, BookID ) == 0 then
			ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- 你沒有書
			ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
			return false;
		end
		return true;
	end

	if ( not CheckLv() ) then
		return false;
	end

	while true do

		local Complete = false;	-- 每次讀書的結果

	--	if ( not CheckLv() ) or ( not CheckBook() ) then	-- 閱讀前檢查：等級不符合、書籍不存在
	--		break;
	--	end

		local ReadTime = g_ReadTime;
		if Encyclopedia_CheckBuffResult( Owner, g_ReadSpeedUpBuffID ) then	-- 確認身上是否有閱讀加速的Buff
			ReadTime = ReadTime * g_ReadSpeedUpRatio;
		end

		AddBuff( Owner, g_ReadBookMagicID, 0, -1 );		-- 手持書籍的特效
		-- 無法以 BeginCastBarEvent 撰寫持續呼叫劇情的函式
		if BeginCastBar( Owner, "[SC_BOOKCAST]".."["..BookID.."]", ReadTime, ruFUSION_ACTORSTATE_READING_LOOP, ruFUSION_ACTORSTATE_READING_LOOP, 0 ) == 1 then	-- 開始施法
			while true do
				sleep(1);
				local CastBarStatus = CheckCastBar(Owner);
				if CastBarStatus ~= 0 then
					if CastBarStatus > 0 then	-- 閱讀結果成功時
						Complete = true;
					end
					EndCastBar( Owner, CastBarStatus );
					break;
				end
			end
		else
			break;
		end

	--	DebugMsg( Owner, RoomID, "Complete = "..tostring(Complete) );
		if ( not CheckLv() ) or ( not CheckBook() ) or ( not Complete ) then	-- 閱讀後檢查：等級不符合、書籍不存在、閱讀結果失敗
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultSum );
		local ResultGainExp = GainExp*g_ResultExpRatio[Random];

	--	DebugMsg( Owner, RoomID, "["..BookID.."]"..", Basic Exp = "..GainExp..", Random Ratio = "..string.format( "%.2f", g_ResultExpRatio[Random] )..", Math Exp = "..string.format( "%.2f", ResultGainExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddEXP( Owner, ResultGainExp );
		Sleep(2);	-- 必須要有Sleep，書本特效才不會消失
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_CheckBuff()	-- 使用物品時，確認目標身上是否有 1天、7天、30天的小屋百科加速藥劑

	local Owner = OwnerID();

	for Index, Value in pairs(g_ReadSpeedUpBuffID) do
		if CheckBuff( Owner, Value ) then
			ScriptMessage( Owner, Owner, 1, "[MSG_EFFECT_HAVE]", C_DEFAULT );  -- 物品使用失敗，此效果已存在
			return false;
		end
	end
	return true;
end

function Encyclopedia_CheckBuffResult(Guid,BuffList)	-- 閱讀成功時，確認目標身上是否有小屋百科加速藥劑

	if not BuffList then
		return false;
	end

	local Guid = Guid or OwnerID();
	for Index, Value in pairs(BuffList) do
		if CheckBuff( Guid, Value ) then
			return true;
		end
	end
	return false;
end