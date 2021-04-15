--調整生活技能
--/gm ? runplot Hao_Crafting_Set_Value

local g_ZoneID = 400;	-- 小屋ID
local g_ReadTime = 600;	-- 使用後的閱讀時間(單位 0.1 秒)，預設為 6 秒
local g_ReadSpeedUpBuffID = { 500150, 500151, 500152 }	-- 1天、7天、30天小屋百科加速藥劑
local g_ReadSpeedUpRatio = 0.7;	-- 使用提高閱讀速度後，降低的閱讀時間倍率
local g_ReadBookMagicID = 502088;	-- 手持書籍的特效

-- 生產索引表，各級距每分鐘獲得的基礎經驗值，Table表中的「生產經驗值」
-- 適用於非隨機類型
local g_CraftExpIndex = {};	-- 期望天數 = 將 1 級提高至 2 級的時間設為 1 分鐘作為基數後調整的公式，詳情請見文件 - (6.4.0)小屋百科點數調整
g_CraftExpIndex[1] = 0.1392;	-- 1 - 20，公式 = 1 - 20級所需總經驗值 / 期望天數 / 1440(1天=1440分鐘) * (60/60)(每次閱讀秒數/每分鐘秒數) / (1/3+2/3+3/3+4/3)/4 (閱讀結果平均效率 )  = 0.0139
g_CraftExpIndex[21] = 0.1325;	-- 21 - 40
g_CraftExpIndex[41] = 0.2555;	-- 41 - 60
g_CraftExpIndex[61] = 0.4111;	-- 61 - 80
g_CraftExpIndex[81] = 0.4775;	-- 81 - 100

local g_ResultCraftRatio = { 1/3, 2/3, 1, 4/3 };	-- 經驗值倍率，共 4 種效益
local g_ResultMagicColID = { 492441, 492442, 492443, 492444 };	-- 特效，對應經驗值倍率
local g_ResultString = { "[SC_LEARN_1]", "[SC_LEARN_2]", "[SC_LEARN_3]", "[SC_LEARN_4]" };
local g_ResultCraftRatioTotal = #g_ResultCraftRatio;
-- 1 = 你在閱讀的時候睡著了，白白浪費了時間
-- 2 = 你匆匆的讀了一遍，仍有許多地方看不懂
-- 3 = 你的努力讓你的人物穩定成長
-- 4 = 你有如醍醐灌頂，讀起書來事半功倍

local g_Define = {};	-- 對應 700016 中的 Define

local function SetDefine()	-- 設定 Define

	-- 打鐵
	g_Define[243339] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 1, HighestLv = 20 };	-- 1天你也可以學打鐵
	g_Define[243340] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 21, HighestLv = 40 };	-- 1天史密斯先生的指導
	g_Define[243341] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 41, HighestLv = 60 };	-- 1天打鐵救世界
	g_Define[243342] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 61, HighestLv = 80 };	-- 1天精密打鐵秘技
	g_Define[243343] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 81, HighestLv = 100 };	-- 1天至高打鐵傳承
	
	g_Define[243370] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 1, HighestLv = 20 };	-- 7天你也可以學打鐵
	g_Define[243371] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 21, HighestLv = 40 };	-- 7天史密斯先生的指導
	g_Define[243372] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 41, HighestLv = 60 };	-- 7天打鐵救世界
	g_Define[243373] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 61, HighestLv = 80 };	-- 7天精密打鐵秘技
	g_Define[243374] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 81, HighestLv = 100 };	-- 7天至高打鐵傳承
	
	g_Define[202714] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 1, HighestLv = 20 };	-- 30天你也可以學打鐵
	g_Define[202715] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 21, HighestLv = 40 };	-- 30天史密斯先生的指導
	g_Define[202716] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 41, HighestLv = 60 };	-- 30天打鐵救世界
	g_Define[240474] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 61, HighestLv = 80 };	-- 30天精密打鐵秘技
	g_Define[240475] = { Lv = EM_RoleValue_Skill_BlackSmith, Exp = EM_SkillValueType_BlackSmith, LowestLv = 81, HighestLv = 100 };	-- 30天至高打鐵傳承
	-- 木工
	g_Define[243344] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 1, HighestLv = 20 };	-- 1天簡單學木工
	g_Define[243345] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 21, HighestLv = 40 };	-- 1天木工技巧研究
	g_Define[243346] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 41, HighestLv = 60 };	-- 1天深入瞭解木工
	g_Define[243347] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 61, HighestLv = 80 };	-- 1天大師談木工藝術
	g_Define[243348] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 81, HighestLv = 100 };	-- 1天上古木工技藝
	
	g_Define[243375] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 1, HighestLv = 20 };	-- 7天簡單學木工
	g_Define[243376] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 21, HighestLv = 40 };	-- 7天木工技巧研究
	g_Define[243377] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 41, HighestLv = 60 };	-- 7天深入瞭解木工
	g_Define[243378] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 61, HighestLv = 80 };	-- 7天大師談木工藝術
	g_Define[243379] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 81, HighestLv = 100 };	-- 7天上古木工技藝
	
	g_Define[202711] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 1, HighestLv = 20 };	-- 30天簡單學木工
	g_Define[202712] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 21, HighestLv = 40 };	-- 30天木工技巧研究
	g_Define[202713] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 41, HighestLv = 60 };	-- 30天深入瞭解木工
	g_Define[240472] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 61, HighestLv = 80 };	-- 30天大師談木工藝術
	g_Define[240473] = { Lv = EM_RoleValue_Skill_Carpenter, Exp = EM_SkillValueType_Carpenter, LowestLv = 81, HighestLv = 100 };	-- 30天上古木工技藝
	-- 製甲
	g_Define[243349] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 1, HighestLv = 20 };	-- 1天製甲學概要
	g_Define[243350] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 21, HighestLv = 40 };	-- 1天中等製甲學
	g_Define[243351] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 41, HighestLv = 60 };	-- 1天高級製甲學
	g_Define[243352] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 61, HighestLv = 80 };	-- 1天讓你成為製甲大師 
	g_Define[243353] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 81, HighestLv = 100 };	-- 1天無雙製甲學
	
	g_Define[243380] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 1, HighestLv = 20 };	-- 7天製甲學概要
	g_Define[243381] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 21, HighestLv = 40 };	-- 7天中等製甲學
	g_Define[243382] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 41, HighestLv = 60 };	-- 7天高級製甲學
	g_Define[243383] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 61, HighestLv = 80 };	-- 7天讓你成為製甲大師 
	g_Define[243384] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 81, HighestLv = 100 };	-- 7天無雙製甲學
	
	g_Define[202726] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 1, HighestLv = 20 };	-- 30天製甲學概要
	g_Define[202727] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 21, HighestLv = 40 };	-- 30天中等製甲學
	g_Define[202728] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 41, HighestLv = 60 };	-- 30天高級製甲學
	g_Define[240482] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 61, HighestLv = 80 };	-- 30天讓你成為製甲大師 
	g_Define[240481] = { Lv = EM_RoleValue_Skill_MakeArmor, Exp = EM_SkillValueType_MakeArmor, LowestLv = 81, HighestLv = 100 };	-- 30天無雙製甲學
	-- 裁縫
	g_Define[243354] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 1, HighestLv = 20 };	-- 1天如何學好裁縫
	g_Define[243355] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 21, HighestLv = 40 };	-- 1天貴族裁縫指導
	g_Define[243356] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 41, HighestLv = 60 };	-- 1天皇家裁縫指導
	g_Define[243357] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 61, HighestLv = 80 };	-- 1天頂級織品輕鬆做
	g_Define[243358] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 81, HighestLv = 100 };	-- 1天首席裁縫指導
	
	g_Define[243385] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 1, HighestLv = 20 };	-- 7天如何學好裁縫
	g_Define[243386] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 21, HighestLv = 40 };	-- 7天貴族裁縫指導
	g_Define[243387] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 41, HighestLv = 60 };	-- 7天皇家裁縫指導
	g_Define[243388] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 61, HighestLv = 80 };	-- 7天頂級織品輕鬆做
	g_Define[243389] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 81, HighestLv = 100 };	-- 7天首席裁縫指導
	
	g_Define[202720] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 1, HighestLv = 20 };	-- 30天如何學好裁縫
	g_Define[202721] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 21, HighestLv = 40 };	-- 30天貴族裁縫指導
	g_Define[202722] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 41, HighestLv = 60 };	-- 30天皇家裁縫指導
	g_Define[240478] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 61, HighestLv = 80 };	-- 30天頂級織品輕鬆做
	g_Define[240479] = { Lv = EM_RoleValue_Skill_Tailor, Exp = EM_SkillValueType_Tailor, LowestLv = 81, HighestLv = 100 };	-- 30天首席裁縫指導
	-- 烹飪
	g_Define[243359] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 1, HighestLv = 20 };	-- 1天愛上烹飪的第一步
	g_Define[243360] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 21, HighestLv = 40 };	-- 1天抓住愛人的胃
	g_Define[243361] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 41, HighestLv = 60 };	-- 1天烹飪精髓
	g_Define[243362] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 61, HighestLv = 80 };	-- 1天料理達人的私房菜
	g_Define[243363] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 81, HighestLv = 100 };	-- 1天極致料理全記錄
	
	g_Define[243390] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 1, HighestLv = 20 };	-- 7天愛上烹飪的第一步
	g_Define[243391] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 21, HighestLv = 40 };	-- 7天抓住愛人的胃
	g_Define[243392] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 41, HighestLv = 60 };	-- 7天烹飪精髓
	g_Define[243393] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 61, HighestLv = 80 };	-- 7天料理達人的私房菜
	g_Define[243394] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 81, HighestLv = 100 };	-- 7天極致料理全記錄
	
	g_Define[202717] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 1, HighestLv = 20 };	-- 30天愛上烹飪的第一步
	g_Define[202718] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 21, HighestLv = 40 };	-- 30天抓住愛人的胃
	g_Define[202719] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 41, HighestLv = 60 };	-- 30天烹飪精髓
	g_Define[240476] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 61, HighestLv = 80 };	-- 30天料理達人的私房菜
	g_Define[240483] = { Lv = EM_RoleValue_Skill_Cook, Exp = EM_SkillValueType_Cook, LowestLv = 81, HighestLv = 100 };	-- 30天極致料理全記錄
	-- 煉金
	g_Define[243364] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 1, HighestLv = 20 };	-- 1天基礎煉金學
	g_Define[243365] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 21, HighestLv = 40 };	-- 1天進階煉金術
	g_Define[243366] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 41, HighestLv = 60 };	-- 1天深奧煉金術
	g_Define[243367] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 61, HighestLv = 80 };	-- 1天賢者的鍊金秘術
	g_Define[243368] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 81, HighestLv = 100 };	-- 1天浩瀚煉金手札
	
	g_Define[243395] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 1, HighestLv = 20 };	-- 7天基礎煉金學
	g_Define[243396] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 21, HighestLv = 40 };	-- 7天進階煉金術
	g_Define[243397] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 41, HighestLv = 60 };	-- 7天深奧煉金術
	g_Define[243398] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 61, HighestLv = 80 };	-- 7天賢者的鍊金秘術
	g_Define[243399] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 81, HighestLv = 100 };	-- 7天浩瀚煉金手札
	
	g_Define[202723] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 1, HighestLv = 20 };	-- 30天基礎煉金學
	g_Define[202724] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 21, HighestLv = 40 };	-- 30天進階煉金術
	g_Define[202725] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 41, HighestLv = 60 };	-- 30天深奧煉金術
	g_Define[240480] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 61, HighestLv = 80 };	-- 30天賢者的鍊金秘術
	g_Define[240477] = { Lv = EM_RoleValue_Skill_Alchemy, Exp = EM_SkillValueType_Alchemy, LowestLv = 81, HighestLv = 100 };	-- 30天浩瀚煉金手札

	-- 綜合(隨機選一)
	--CraftExp 隨機型每次閱讀時給予的經驗值
	local g_MixBookID = { 243338, 243369, 202729 };	-- 1天、7天、30天製造大百科
	
	for i = 1, #g_MixBookID do
		g_Define[g_MixBookID[i]] = { LowestLv = 1, HighestLv = false, CraftExp = 0.1933 };
		g_Define[g_MixBookID[i]].Lv = {
					EM_RoleValue_Skill_BlackSmith,
					EM_RoleValue_Skill_Carpenter,
					EM_RoleValue_Skill_MakeArmor,
					EM_RoleValue_Skill_Tailor,
					EM_RoleValue_Skill_Cook,
					EM_RoleValue_Skill_Alchemy
									};
		g_Define[g_MixBookID[i]].Exp = {
					EM_SkillValueType_BlackSmith,
					EM_SkillValueType_Carpenter,
					EM_SkillValueType_MakeArmor,
					EM_SkillValueType_Tailor,
					EM_SkillValueType_Cook,
					EM_SkillValueType_Alchemy
									};
	end
end

-- 判斷等級，避免玩家等級在閱讀時間內提高至閱讀等級上限時，依然可以持續閱讀的問題。
local function CheckLv( Owner, RoomID, BookID, Define )

	local Lv = ReadRoleValue( Owner, Define );
--	DebugMsg( Owner, RoomID, "Skill Lv = "..Lv..", LowestLv = "..g_Define[BookID].LowestLv..", HighestLv = "..g_Define[BookID].HighestLv );

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
--	DebugMsg( Owner, RoomID, "ReadBookID = "..BookID );
	if CountBodyItem( Owner, BookID ) == 0 then
		ScriptMessage( Owner, Owner, 0, "[SC_NOITEM]", 0 );	-- 你沒有書
		ScriptMessage( Owner, Owner, 1, "[SC_NOITEM]", 0 );
		return false;
	end
	return true;
end

-- 小屋 Craft 百科
function Encyclopedia_CraftExp( BookID )	-- 物品ID

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

	if not g_Define[BookID].HighestLv then	-- 綜合類的書籍，每次隨機選一
		CallPlot( Owner, "Encyclopedia_CraftExp_BeginRandom", Owner, RoomID, BookID );
	else
		CallPlot( Owner, "Encyclopedia_CraftExp_Begin", Owner, RoomID, BookID );
	end
end

function Encyclopedia_CraftExp_Begin( Owner, RoomID, BookID )

	local GainCraftExp = 0;	-- 閱讀後增加的經驗值
	for Index, Value in pairs(g_CraftExpIndex) do
		if Index == g_Define[BookID].LowestLv then
			GainCraftExp = Value;
		--	DebugMsg( Owner, RoomID, "GainCraftExp Basic = "..GainCraftExp );
			break;
		end
	end

	if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) then
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
		-- 閱讀後檢查：等級不符合、書籍不存在、閱讀結果失敗
		if ( not CheckLv( Owner, RoomID, BookID, g_Define[BookID].Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultCraftRatioTotal );
		local ResultCraftExp = GainCraftExp*g_ResultCraftRatio[Random];	-- 基礎值 * 效率倍率

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainCraftExp..", Random Ratio = "..string.format( "%.2f", g_ResultCraftRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultCraftExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, g_Define[BookID].Exp, ResultCraftExp );
		Sleep(2);
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end

function Encyclopedia_CraftExp_BeginRandom( Owner, RoomID, BookID )	-- 處理提高隨機選一種生產經驗值的類型

	for Index, value in pairs(g_Define[BookID].Lv) do	-- 確認 6 種生產技能是否都已經學習
		local Lv = ReadRoleValue( Owner, Value );
	--	DebugMsg( Owner, RoomID, "Lv = "..Lv );
		if Lv < 1 then
			ScriptMessage( Owner, Owner, 0, "[SC_NOTRIGHTLV_1]", 0 )	-- 你的等級似乎不能閱讀此書
			ScriptMessage( Owner, Owner, 1, "[SC_NOTRIGHTLV_1]", 0 )
			return false;
		end
	end

	local GainCraftExp = g_Define[BookID].CraftExp;	-- 閱讀後增加的經驗值
--	DebugMsg( Owner, RoomID, "GainCraftExp Basic = "..GainCraftExp );

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
		if ( not CheckLv( Owner, RoomID, BookID, Define.Lv ) ) or ( not CheckBook( Owner, RoomID, BookID ) ) or ( not Complete ) then	-- 閱讀後檢查：等級不符合、書籍不存在、閱讀結果失敗
			break;
		end

		-- 閱讀成功時執行
		local Random = math.random( g_ResultCraftRatioTotal );
		local ResultCraftExp = GainCraftExp*g_ResultCraftRatio[Random];	-- 基礎經驗值 * 此次閱讀效益

	--	DebugMsg( Owner, RoomID, "["..BookID.."]".."Basic Exp = "..GainCraftExp..", Random Ratio = "..string.format( "%.2f", g_ResultCraftRatio[Random] )..", Math Exp = "..string.format( "%.3f", ResultCraftExp ) );
		SysCastSpellLv( Owner, Owner, g_ResultMagicColID[Random], 0 );
		ScriptMessage( Owner, Owner, 0, g_ResultString[Random], 0 );
		AddSkillValue( Owner, Define.Exp, ResultCraftExp );
		Sleep(2);	-- 必須要有Sleep，書本特效才不會消失
	end
	PlayMotion( Owner, ruFUSION_ACTORSTATE_READING_END );	-- 起身
	CancelBuff_NoEvent( Owner, g_ReadBookMagicID );
end