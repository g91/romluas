
local g_ZoneID = 400;	-- 小屋ID
local g_ReadTime = 60;	-- 使用後的閱讀時間(單位 0.1 秒)，預設為 6 秒
local g_ReadSpeedUpBuffID = {  500150, 500151, 500152 }	-- 1天、7天、30天小屋百科加速藥劑
local g_ReadSpeedUpRatio = 0.7;	-- 使用提高閱讀速度後，降低的閱讀時間倍率
local g_ReadBookMagicID = 502088;	-- 手持書籍的特效

-- 武器熟練度索引表，各級距每分鐘獲得的基礎經驗值，Table表中的「武器熟練經驗值」
local g_WeaponSkillExpIndex = 0.851;
-- 期望天數 = 將 1 級提高至 2 級的時間設為 1 分鐘作為基數後調整的公式，詳情請見文件 - (6.4.0)小屋百科點數調整
-- 1 - 300，公式 = 1 - 300級所需總經驗值 / 期望天數 / 1440(1天=1440分鐘) * (60/60)(每次閱讀秒數/每分鐘秒數) / (1/3+2/3+3/3+4/3)/4 (閱讀結果平均效率 )  = 結果

local g_ResultWeaponSkillRatio = { 1/3, 2/3, 1, 4/3 };	-- 經驗值倍率，共 4 種效益
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- 特效，對應經驗值倍率
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultWeaponSkillRatioTotal = #g_ResultWeaponSkillRatio;
-- 1 = 你在閱讀的時候睡著了，白白浪費了時間
-- 2 = 你匆匆的讀了一遍，仍有許多地方看不懂
-- 3 = 你的努力讓你的人物穩定成長
-- 4 = 你有如醍醐灌頂，讀起書來事半功倍

local g_Define = {};	-- 對應 700016 中的 Define，Lv 用以讀取等級、Exp 用以修改經驗值

local function SetDefine()	-- 設定 Define

	g_Define[243401] = { Lv = EM_RoleValue_Skill_Unarmed, Exp = EM_SkillValueType_Unarmed };	-- 空手 1天空手搏鬥技巧
	g_Define[243416] = { Lv = EM_RoleValue_Skill_Unarmed, Exp = EM_SkillValueType_Unarmed };	-- 空手 7天空手搏鬥技巧
	g_Define[202733] = { Lv = EM_RoleValue_Skill_Unarmed, Exp = EM_SkillValueType_Unarmed };	-- 空手 30天空手搏鬥技巧
	g_Define[243402] = { Lv = EM_RoleValue_Skill_Blade, Exp = EM_SkillValueType_Blade };	-- 單手劍 1天單手劍學習教材
	g_Define[243417] = { Lv = EM_RoleValue_Skill_Blade, Exp = EM_SkillValueType_Blade };	-- 單手劍 7天單手劍學習教材
	g_Define[202734] = { Lv = EM_RoleValue_Skill_Blade, Exp = EM_SkillValueType_Blade };	-- 單手劍 30天單手劍學習教材
	g_Define[243403] = { Lv = EM_RoleValue_Skill_Dagger, Exp = EM_SkillValueType_Dagger };	-- 匕首 1天匕首學習教材
	g_Define[243418] = { Lv = EM_RoleValue_Skill_Dagger, Exp = EM_SkillValueType_Dagger };	-- 匕首 7天匕首學習教材
	g_Define[202735] = { Lv = EM_RoleValue_Skill_Dagger, Exp = EM_SkillValueType_Dagger };	-- 匕首 30天匕首學習教材
	g_Define[243404] = { Lv = EM_RoleValue_Skill_Wand, Exp = EM_SkillValueType_Wand };	-- 權杖 1天權杖學習教材
	g_Define[243419] = { Lv = EM_RoleValue_Skill_Wand, Exp = EM_SkillValueType_Wand };	-- 權杖 7天權杖學習教材
	g_Define[202736] = { Lv = EM_RoleValue_Skill_Wand, Exp = EM_SkillValueType_Wand };	-- 權杖 30天權杖學習教材
	g_Define[243405] = { Lv = EM_RoleValue_Skill_Axe, Exp = EM_SkillValueType_Axe };	-- 單手斧 1天單手斧學習教材
	g_Define[243420] = { Lv = EM_RoleValue_Skill_Axe, Exp = EM_SkillValueType_Axe };	-- 單手斧 7天單手斧學習教材
	g_Define[202737] = { Lv = EM_RoleValue_Skill_Axe, Exp = EM_SkillValueType_Axe };	-- 單手斧 30天單手斧學習教材
	g_Define[243406] = { Lv = EM_RoleValue_Skill_Bludgeon, Exp = EM_SkillValueType_Bludgeon };	-- 單手鎚 1天單手鎚學習教材
	g_Define[243421] = { Lv = EM_RoleValue_Skill_Bludgeon, Exp = EM_SkillValueType_Bludgeon };	-- 單手鎚 7天單手鎚學習教材
	g_Define[202738] = { Lv = EM_RoleValue_Skill_Bludgeon, Exp = EM_SkillValueType_Bludgeon };	-- 單手鎚 30天單手鎚學習教材
	g_Define[243407] = { Lv = EM_RoleValue_Skill_Claymore, Exp = EM_SkillValueType_Claymore };	-- 雙手劍 1天雙手劍學習教材
	g_Define[243422] = { Lv = EM_RoleValue_Skill_Claymore, Exp = EM_SkillValueType_Claymore };	-- 雙手劍 7天雙手劍學習教材
	g_Define[202739] = { Lv = EM_RoleValue_Skill_Claymore, Exp = EM_SkillValueType_Claymore };	-- 雙手劍 30天雙手劍學習教材
	g_Define[243408] = { Lv = EM_RoleValue_Skill_Staff, Exp = EM_SkillValueType_Staff };	-- 雙手杖 1天雙手杖學習教材
	g_Define[243423] = { Lv = EM_RoleValue_Skill_Staff, Exp = EM_SkillValueType_Staff };	-- 雙手杖 7天雙手杖學習教材
	g_Define[202740] = { Lv = EM_RoleValue_Skill_Staff, Exp = EM_SkillValueType_Staff };	-- 雙手杖 30天雙手杖學習教材
	g_Define[243409] = { Lv = EM_RoleValue_Skill_2H_Axe, Exp = EM_SkillValueType_2H_Axe };	-- 雙手斧 1天雙手斧學習教材
	g_Define[243424] = { Lv = EM_RoleValue_Skill_2H_Axe, Exp = EM_SkillValueType_2H_Axe };	-- 雙手斧 7天雙手斧學習教材
	g_Define[202741] = { Lv = EM_RoleValue_Skill_2H_Axe, Exp = EM_SkillValueType_2H_Axe };	-- 雙手斧 30天雙手斧學習教材
	g_Define[243410] = { Lv = EM_RoleValue_Skill_2H_Hammer, Exp = EM_SkillValueType_2H_Hammer };	-- 雙手鎚 1天雙手鎚學習教材
	g_Define[243425] = { Lv = EM_RoleValue_Skill_2H_Hammer, Exp = EM_SkillValueType_2H_Hammer };	-- 雙手鎚 7天雙手鎚學習教材
	g_Define[202742] = { Lv = EM_RoleValue_Skill_2H_Hammer, Exp = EM_SkillValueType_2H_Hammer };	-- 雙手鎚 30天雙手鎚學習教材
	g_Define[243411] = { Lv = EM_RoleValue_Skill_Polearm, Exp = EM_SkillValueType_Polearm };	-- 長柄武器 1天長柄武器百科
	g_Define[243426] = { Lv = EM_RoleValue_Skill_Polearm, Exp = EM_SkillValueType_Polearm };	-- 長柄武器 7天長柄武器百科
	g_Define[202743] = { Lv = EM_RoleValue_Skill_Polearm, Exp = EM_SkillValueType_Polearm };	-- 長柄武器 30天長柄武器百科
	g_Define[243412] = { Lv = EM_RoleValue_Skill_Bow, Exp = EM_SkillValueType_Bow };	-- 弓 1天弓學習教材
	g_Define[243427] = { Lv = EM_RoleValue_Skill_Bow, Exp = EM_SkillValueType_Bow };	-- 弓 7天弓學習教材
	g_Define[202744] = { Lv = EM_RoleValue_Skill_Bow, Exp = EM_SkillValueType_Bow };	-- 弓 30天弓學習教材
	g_Define[243413] = { Lv = EM_RoleValue_Skill_CossBow, Exp = EM_SkillValueType_CossBow };	-- 弩 1天弩學習教材
	g_Define[243428] = { Lv = EM_RoleValue_Skill_CossBow, Exp = EM_SkillValueType_CossBow };	-- 弩 7天弩學習教材
	g_Define[202745] = { Lv = EM_RoleValue_Skill_CossBow, Exp = EM_SkillValueType_CossBow };	-- 弩 30天弩學習教材
	--g_Define[202746] = { Lv = EM_RoleValue_Skill_Gun, Exp = EM_SkillValueType_Gun };	-- 槍 30天槍械百科(未使用)
	g_Define[243414] = { Lv = EM_RoleValue_Skill_Define, Exp = EM_SkillValueType_Define };	-- 1天防禦心得
	g_Define[243429] = { Lv = EM_RoleValue_Skill_Define, Exp = EM_SkillValueType_Define };	-- 7天防禦心得
	g_Define[202747] = { Lv = EM_RoleValue_Skill_Define, Exp = EM_SkillValueType_Define };	-- 30天防禦心得
	
	-- 綜合(隨機選一)
	--WeaponSkillExp 隨機型每次閱讀時給予的經驗值
	local g_MixBookID = { 243400, 243415, 202732 };	-- 1天、7天、30天武器應用通論
	
	for i = 1, #g_MixBookID do
	
		g_Define[g_MixBookID[i]] = { WeaponSkillExp = 0.938 }; -- 30天武器應用通論
		g_Define[g_MixBookID[i]].Lv = {
					EM_RoleValue_Skill_Unarmed,
					EM_RoleValue_Skill_Blade,
					EM_RoleValue_Skill_Dagger,
					EM_RoleValue_Skill_Wand,
					EM_RoleValue_Skill_Axe,
					EM_RoleValue_Skill_Bludgeon,
					EM_RoleValue_Skill_Claymore,
					EM_RoleValue_Skill_Staff,
					EM_RoleValue_Skill_2H_Axe,
					EM_RoleValue_Skill_2H_Hammer,
					EM_RoleValue_Skill_Polearm,
					EM_RoleValue_Skill_Bow,
					EM_RoleValue_Skill_CossBow,
					EM_RoleValue_Skill_Define
									};
		g_Define[g_MixBookID[i]].Exp = {
					EM_SkillValueType_Unarmed,
					EM_SkillValueType_Blade,
					EM_SkillValueType_Dagger,
					EM_SkillValueType_Wand,
					EM_SkillValueType_Axe,
					EM_SkillValueType_Bludgeon,
					EM_SkillValueType_Claymore,
					EM_SkillValueType_Staff,
					EM_SkillValueType_2H_Axe,
					EM_SkillValueType_2H_Hammer,
					EM_SkillValueType_Polearm,
					EM_SkillValueType_Bow,
					EM_SkillValueType_CossBow,
					EM_SkillValueType_Define
									};
	end

end

-- 判斷書是否存在，避免書本在閱讀時間內消失時，依然可以持續閱讀的問題。
local function CheckBook( Owner, RoomID, BookID )
--	DebugMsg( Owner, RoomID, "ReadBookID = "..BookID );
	if CountBodyItem( Owner, BookID ) == 0 then
		ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- 你沒有書
		ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
		return false;
	end
	return true;
end

-- 小屋 WeaponSkill 百科
function Encyclopedia_WeaponSkillExp( BookID )	-- 物品ID

	if g_Define[BookID] == nil then
		SetDefine();
	end

	local Owner = OwnerID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
--	DebugMsg( Owner, RoomID, "ZoneID = "..ZoneID );

	if ZoneID ~= g_ZoneID then
		ScriptMessage( Owner, Owner, 0, "[SC_NOTINHOUSE]", 0 );	-- 你不在房屋內
		ScriptMessage( Owner, Owner, 1, "[SC_NOTINHOUSE]", 0 );
		return;
	end

	if g_Define[BookID].WeaponSkillExp then	-- 綜合類的書籍，每次隨機選一
		CallPlot( Owner, "Encyclopedia_WeaponSkillExp_BeginRandom", Owner, RoomID, BookID );
	else
		CallPlot( Owner, "Encyclopedia_WeaponSkillExp_Begin", Owner, RoomID, BookID );
	end
end

function Encyclopedia_WeaponSkillExp_Begin( Owner, RoomID, BookID )

	local GainWeaponSkillExp = g_WeaponSkillExpIndex;	-- 閱讀後增加的經驗值

	if ( not CheckBook( Owner, RoomID, BookID ) ) then
		return false;
	end

--	local Count = 0;
	while true do

		local Complete = false;	-- 每次讀書的結果

	--	Count = Count + 1;
	--	DebugMsg( Owner, RoomID, "Count = "..Count );

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
		-- 閱讀後檢查：書籍不存在、閱讀結果失敗
		if ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultWeaponSkillRatioTotal );
		local ResultWeaponSkillExp = GainWeaponSkillExp*g_ResultWeaponSkillRatio[Random];	-- 基礎值 * 效率倍率

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainWeaponSkillExp..", Random Ratio = "..string.format( "%.2f", g_ResultWeaponSkillRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultWeaponSkillExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, g_Define[BookID].Exp, ResultWeaponSkillExp );
		Sleep(2);
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_WeaponSkillExp_BeginRandom( Owner, RoomID, BookID )	-- 處理提高隨機選一種生產經驗值的類型

	local GainWeaponSkillExp = g_Define[BookID].WeaponSkillExp;	-- 閱讀後增加的經驗值
--	DebugMsg( Owner, RoomID, "GainWeaponSkillExp Basic = "..GainWeaponSkillExp );

	if ( not CheckBook( Owner, RoomID, BookID ) ) then
		return false;
	end

--	local Count = 0;

	while true do

		local Complete = false;	-- 每次讀書的結果

	--	Count = Count + 1;
	--	DebugMsg( Owner, RoomID, "Count = "..Count );

		local Random = math.random(#g_Define[BookID].Lv);
		local Define = {};
		Define.Lv = g_Define[BookID].Lv[Random];
		Define.Exp = g_Define[BookID].Exp[Random];
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
		if ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then	-- 閱讀後檢查：書籍不存在、閱讀結果失敗
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultWeaponSkillRatioTotal );
		local ResultWeaponSkillExp = GainWeaponSkillExp*g_ResultWeaponSkillRatio[Random];	-- 基礎經驗值 * 此次閱讀效益

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainWeaponSkillExp..", Random Ratio = "..string.format( "%.2f", g_ResultWeaponSkillRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultWeaponSkillExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, Define.Exp, ResultWeaponSkillExp );
		Sleep(2);	-- 必須要有Sleep，書本特效才不會消失
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end