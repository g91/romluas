
local g_ZoneID = 400;	-- 小屋ID
local g_ReadTime = 600;	-- 使用後的閱讀時間(單位 0.1 秒)，預設為 60 秒
local g_ReadSpeedUpBuffID = {  500150, 500151, 500152 }	-- 1天、7天、30天小屋百科加速藥劑
local g_ReadSpeedUpRatio = 0.7;	-- 使用提高閱讀速度後，降低的閱讀時間倍率

-- Tp 索引表，各級距每分鐘獲得的基礎經驗值，Table表中的「職業法術經驗值」
local g_TpIndex = {};	-- 期望天數 = 將 1 級提高至 2 級的時間設為 1 分鐘作為基數後調整的公式，詳情請見文件 - (6.4.0)小屋百科點數調整
g_TpIndex[1] = 7.27;	-- 1 - 30，公式 = 1 - 30級所需總經驗值 / 期望天數 / 1440(1天=1440分鐘) / (1/3+2/3+3/3+4/3)/4 (閱讀結果平均效率 )  = 7.27
g_TpIndex[31] = 16.12;	-- 31 - 40
g_TpIndex[41] = 170.79;	-- 41 - 60
g_TpIndex[61] = 428.42;	-- 61 - 70
g_TpIndex[71] = 548.43;	-- 71 - 80
g_TpIndex[81] = 602.74;	-- 81 - 90
g_TpIndex[91] = 638.99;	-- 91 - 100

local g_ReadBookMagicID = 502087;	-- 手持書籍的特效

local g_ResultTpRatio = { 1/3, 2/3, 1, 4/3 };	-- 獲得的 4 種Tp倍率
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- 特效，對應經驗值倍率
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultSum = #g_ResultTpRatio;
-- 1 = 你在閱讀的時候睡著了，白白浪費了時間
-- 2 = 你匆匆的讀了一遍，仍有許多地方看不懂
-- 3 = 你的努力讓你的人物穩定成長
-- 4 = 你有如醍醐灌頂，讀起書來事半功倍

local g_LvCap = {};
g_LvCap[242793] = { LowestLv = 1, HighestLv = 30 };	-- 1天技能修煉百科I
g_LvCap[242794] = { LowestLv = 31, HighestLv = 40 };	-- 1天技能修煉百科II
g_LvCap[242799] = { LowestLv = 41, HighestLv = 60 };	-- 1天技能修煉百科III
g_LvCap[242800] = { LowestLv = 61, HighestLv = 70 };	-- 1天技能修煉百科IV
g_LvCap[242801] = { LowestLv = 71, HighestLv = 80 };	-- 1天技能修煉百科V
g_LvCap[242802] = { LowestLv = 81, HighestLv = 90 };	-- 1天技能修煉百科VI
g_LvCap[242804] = { LowestLv = 91, HighestLv = 100 };	-- 1天技能修煉百科VII

g_LvCap[243311] = { LowestLv = 1, HighestLv = 30 };	-- 7天技能修煉百科I
g_LvCap[243312] = { LowestLv = 31, HighestLv = 40 };	-- 7天技能修煉百科II
g_LvCap[243313] = { LowestLv = 41, HighestLv = 60 };	-- 7天技能修煉百科III
g_LvCap[243314] = { LowestLv = 61, HighestLv = 70 };	-- 7天技能修煉百科IV
g_LvCap[243315] = { LowestLv = 71, HighestLv = 80 };	-- 7天技能修煉百科V
g_LvCap[243316] = { LowestLv = 81, HighestLv = 90 };	-- 7天技能修煉百科VI
g_LvCap[243317] = { LowestLv = 91, HighestLv = 100 };	-- 7天技能修煉百科VII

g_LvCap[202702] = { LowestLv = 1, HighestLv = 30 };	-- 30天技能修煉百科I
g_LvCap[202703] = { LowestLv = 31, HighestLv = 40 };	-- 30天技能修煉百科II
g_LvCap[202704] = { LowestLv = 41, HighestLv = 60 };	-- 30天技能修煉百科III
g_LvCap[240494] = { LowestLv = 61, HighestLv = 70 };	-- 30天技能修煉百科IV
g_LvCap[240495] = { LowestLv = 71, HighestLv = 80 };	-- 30天技能修煉百科V
g_LvCap[240496] = { LowestLv = 81, HighestLv = 90 };	-- 30天技能修煉百科VI
g_LvCap[240497] = { LowestLv = 91, HighestLv = 100 };	-- 30天技能修煉百科VII

-- 小屋 Tp 百科 
function Encyclopedia_RoleTp( BookID )	-- 物品ID

	local Owner = OwnerID();
	local LowestLv = 0;
	local HighestLv = 0;

	for Index, Value in pairs(g_LvCap) do
		if Index == BookID then
			LowestLv = Value.LowestLv;
			HighestLv = Value.HighestLv;
		end
	end
	CallPlot( Owner, "Encyclopedia_RoleTp_ReadBegin", Owner, BookID, LowestLv, HighestLv );
end

function Encyclopedia_RoleTp_ReadBegin( Owner, BookID, LowestLv, HighestLv )

	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "ZoneID = "..ZoneID );
	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- 你不在房屋內
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	local GainTp = 0;	-- 閱讀後增加的經驗值
	for Index, Value in pairs(g_TpIndex) do
		if Index == LowestLv then
			GainTp = Value;
		--	DebugMsg( Owner, RoomID, "GainTp Basic = "..GainTp );
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
		local ResultGainTp = GainTp*g_ResultTpRatio[Random];
	--	DebugMsg( Owner, RoomID, "["..BookID.."]"..", Basic Tp = "..GainTp..", Random Ratio = "..string.format( "%.2f", g_ResultTpRatio[Random] )..", Math Tp = "..math.floor(ResultGainTp) );

		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		ScriptMessage( Owner, Owner, 0, "[SC_LEARNTP][$SETVAR1="..math.floor(ResultGainTp).."]", 0 );	-- 你獲得 [$VAR1] 技能點數
		AddRoleValue( Owner, EM_RoleValue_TpExp, ResultGainTp );
		Sleep(2);	-- 必須要有Sleep，書本特效才不會消失
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end