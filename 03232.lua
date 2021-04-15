--調整生活技能
--/gm ? runplot Hao_Crafting_Set_Value

local g_ZoneID = 400;	-- 小屋ID
local g_ReadTime = 600;	-- 使用後的閱讀時間(單位 0.1 秒)，預設為 60 秒，隨機類型的閱讀時間另計，請見下述 Define 中的值... 繼承原先設定：隨機類型為每 6 秒 1 次，其他為每 60 秒 1 次...
local g_ReadSpeedUpBuffID = { 500150, 500151, 500152 }	-- 1天、7天、30天小屋百科加速藥劑
local g_ReadSpeedUpRatio = 0.7;	-- 使用提高閱讀速度後，降低的閱讀時間倍率
local g_ReadBookMagicID = 502086;	-- 手持書籍的特效

-- 採集索引表，各級距每分鐘獲得的基礎經驗值，Table表中的「採集經驗值」
-- 適用於非隨機類型
local g_GatherExpIndex = {};	-- 期望天數 = 將 1 級提高至 2 級的時間設為 1 分鐘作為基數後調整的公式，詳情請見文件 - (6.4.0)小屋百科點數調整
g_GatherExpIndex[1] = 4.469;	-- 1 - 60，公式 = 1 - 60級所需總經驗值 / 期望天數 / 1440(1天=1440分鐘) * (60/60)(每次閱讀秒數/每分鐘秒數) /(1/3+2/3+3/3+4/3)/4 (閱讀結果平均效率 ) / 10  = 4.992
g_GatherExpIndex[61] = 4.992;	-- 61 - 80
g_GatherExpIndex[81] = 5.375;	-- 81 - 100

local g_ResultGatherRatio = { 1/3, 2/3, 1, 4/3 };	-- 經驗值倍率，共 4 種效益
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- 特效，對應經驗值倍率
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultGatherRatioTotal = #g_ResultGatherRatio;
-- 1 = 你在閱讀的時候睡著了，白白浪費了時間
-- 2 = 你匆匆的讀了一遍，仍有許多地方看不懂
-- 3 = 你的努力讓你的人物穩定成長
-- 4 = 你有如醍醐灌頂，讀起書來事半功倍

local g_Define = {};	-- 對應 700016 中的 Define

local function SetDefine()	-- 設定 Define
	-- 挖礦
	g_Define[243319] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 1, HighestLv = 60 };	-- 1天礦產大全
	g_Define[243320] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 61, HighestLv = 80 };	-- 1天進階礦產大百科
	g_Define[243321] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 81, HighestLv = 100 };	-- 1天礦產終極百科全書
	g_Define[243329] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 1, HighestLv = 60 };	-- 7天礦產大全
	g_Define[243330] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 61, HighestLv = 80 };	-- 7天進階礦產大百科
	g_Define[243331] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 81, HighestLv = 100 };	-- 7天礦產終極百科全書
	g_Define[202708] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 1, HighestLv = 60 };	-- 30天礦產大全
	g_Define[240488] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 61, HighestLv = 80 };	-- 30天進階礦產大百科
	g_Define[240489] = { Lv = EM_RoleValue_Skill_Mining, Exp = EM_SkillValueType_Mining, LowestLv = 81, HighestLv = 100 };	-- 30天礦產終極百科全書
	-- 伐木
	g_Define[243322] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 1, HighestLv = 60 };	-- 1天伐木大全
	g_Define[243323] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 61, HighestLv = 80 };	-- 1天進階木材大百科
	g_Define[243324] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 81, HighestLv = 100 };	-- 1天伐木終極百科全書
	g_Define[243332] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 1, HighestLv = 60 };	-- 7天伐木大全
	g_Define[243333] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 61, HighestLv = 80 };	-- 7天進階木材大百科
	g_Define[243334] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 81, HighestLv = 100 };	-- 7天伐木終極百科全書
	g_Define[202706] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 1, HighestLv = 60 };	-- 30天伐木大全
	g_Define[240484] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 61, HighestLv = 80 };	-- 30天進階木材大百科
	g_Define[240485] = { Lv = EM_RoleValue_Skill_Lumbering, Exp = EM_SkillValueType_Lumbering, LowestLv = 81, HighestLv = 100 };	-- 30天伐木終極百科全書
	-- 採藥
	g_Define[243325] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 1, HighestLv = 60 };	-- 1天藥草大全
	g_Define[243326] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 61, HighestLv = 80 };	-- 1天進階藥草大百科
	g_Define[243327] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 81, HighestLv = 100 };	-- 1天藥草終極百科全書
	g_Define[243335] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 1, HighestLv = 60 };	-- 7天藥草大全
	g_Define[243336] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 61, HighestLv = 80 };	-- 7天進階藥草大百科
	g_Define[243337] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 81, HighestLv = 100 };	-- 7天藥草終極百科全書
	g_Define[202707] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 1, HighestLv = 60 };	-- 30天藥草大全
	g_Define[240486] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 61, HighestLv = 80 };	-- 30天進階藥草大百科
	g_Define[240487] = { Lv = EM_RoleValue_Skill_Herblism, Exp = EM_SkillValueType_Herblism, LowestLv = 81, HighestLv = 100 };	-- 30天藥草終極百科全書
	-- 綜合(隨機選一)
	g_Define[243318] = { LowestLv = 1, HighestLv = false, GatherExp = 4.693 };	--  1天採集圖鑑
	g_Define[243328] = { LowestLv = 1, HighestLv = false, GatherExp = 4.693 };	-- 7天採集圖鑑
	g_Define[202705] = { LowestLv = 1, HighestLv = false, GatherExp = 4.693 };	-- 30天採集圖鑑
end

-- 判斷等級，避免玩家等級在閱讀時間內提高至閱讀等級上限時，依然可以持續閱讀的問題。
local function CheckLv( Owner, RoomID, BookID, Define )

	local Lv = ReadRoleValue( Owner, Define );
--	DebugMsg( Owner, RoomID, "Skill Lv = "..Lv..", LowestLv = "..tostring(g_Define[BookID].LowestLv) );

	if ( not g_Define[BookID].HighestLv ) then
		if Lv < g_Define[BookID].LowestLv then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 );	--你的等級似乎不能閱讀此書
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 );
			return false;
		end
	elseif Lv < g_Define[BookID].LowestLv or Lv > g_Define[BookID].HighestLv then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 );	--你的等級似乎不能閱讀此書
		ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 );
		return false;
	end
	return true;
end

-- 判斷書是否存在，避免書本在閱讀時間內消失時，依然可以持續閱讀的問題。
local function CheckBook( Owner, RoomID, BookID )

	if CountBodyItem( Owner, BookID ) == 0 then
		ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- 你沒有書
		ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
		return false;
	end
	return true;
end

-- 小屋 Gather 百科
function Encyclopedia_GatherExp( BookID )	-- 物品ID

	if g_Define[BookID] == nil then
		SetDefine();
	end

	local Owner = OwnerID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "BookID ="..BookID );

	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- 你不在房屋內
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	if not g_Define[BookID].HighestLv then	-- 綜合類的書籍，每次隨機選一
		CallPlot( Owner, "Encyclopedia_GatherExp_BeginRandom", Owner, RoomID, BookID );
	else
		CallPlot( Owner, "Encyclopedia_GatherExp_Begin", Owner, RoomID, BookID );
	end
end

function Encyclopedia_GatherExp_Begin( Owner, RoomID, BookID )

	local GainGatherExp = 0;	-- 閱讀後增加的經驗值
	for Index, Value in pairs(g_GatherExpIndex) do
		if Index == g_Define[BookID].LowestLv then
			GainGatherExp = Value;
		--	DebugMsg( Owner, RoomID, "GainGatherExp Basic = "..GainGatherExp );
			break;
		end
	end

	if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) then
		return false;
	end

	while true do

		local Complete = false;	-- 每次讀書的結果

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
		-- 閱讀後檢查：等級不符合、書籍不存在、閱讀結果失敗
		if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultGatherRatioTotal );
		local ResultGatherExp = GainGatherExp*g_ResultGatherRatio[Random];	-- 基礎值 * 效率倍率

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainGatherExp..", Random Ratio = "..string.format( "%.2f", g_ResultGatherRatio[Random] )..", Math Exp = "..string.format( "%.2f", ResultGatherExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, g_Define[BookID].Exp, ResultGatherExp );
		Sleep(2);
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_GatherExp_BeginRandom( Owner, RoomID, BookID )	-- 處理提高隨機選一種採集經驗值的類型

	local SkillType = { EM_RoleValue_Skill_Mining, EM_RoleValue_Skill_Lumbering, EM_RoleValue_Skill_Herblism };
	local SkillExpType = { EM_SkillValueType_Mining, EM_SkillValueType_Lumbering, EM_SkillValueType_Herblism };

	for Index, value in pairs(SkillType) do	-- 確認 3 種採集技能是否都已經學習
		local Lv = ReadRoleValue( Owner, Value );
	--	DebugMsg( Owner, RoomID, "Lv = "..Lv );
		if Lv < 1 then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_3]", 0 );	-- 你必須學會三種採集技能才能閱讀此書
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_3]", 0 );
			return false;
		end
	end

	local GainGatherExp = g_Define[BookID].GatherExp;	-- 閱讀後增加的經驗值
--	DebugMsg( Owner, RoomID, "GainGatherExp Basic = "..GainGatherExp );

	while true do

		local Complete = false;	-- 每次讀書的結果
		local Random = math.random( #SkillType );
		DebugMsg( Owner, RoomID, "Random = "..Random );
		local Define = {};
		Define.Lv = SkillType[Random];
		Define.Exp = SkillExpType[Random];
	--	DebugMsg( Owner, RoomID, "Select Random = "..Random );

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
		if ( not CheckLv( Owner, RoomID, BookID, Define.Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then	-- 閱讀後檢查：等級不符合、書籍不存在、閱讀結果失敗
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultGatherRatioTotal );
		local ResultGatherExp = GainGatherExp*g_ResultGatherRatio[Random];	-- 基礎經驗值 * 此次閱讀效益

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainGatherExp..", Random Ratio = "..string.format( "%.2f", g_ResultGatherRatio[Random] )..", Math Exp = "..string.format( "%.2f", ResultGatherExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, Define.Exp, ResultGatherExp );
		Sleep(2);	-- 必須要有Sleep，書本特效才不會消失
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end