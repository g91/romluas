function Lua_LifeSkills_LevelLimit( TID, OID, Independent )--生活技能 開放上限
	--TID = NPC; OID = 玩家; Independent = 獨立取得 true/false
	local Flag = LifeSkills_LevelLimit--重要物品(陣列)
	Independent = Independent or false -- 預設值(獨立)
	TID = TID or TargetID()-- 預設值(NPC)
	OID = OID or OwnerID()-- 預設值(玩家)
	--//////////////////////////
	--PID 是組合數字 拆開來可以代表不同含意
	--Type 是千位和百位形成的二位數，這個二位數等同GM指令中的生活技能代號
	--Level 是 技能階級的上限 生產技能系統是用 20做為級距 因此需要知道此NPC負責的最高級距到何處(也是該值的作用)
	--/////////////////////////
	local Skill = ReadRoleValue( TID, EM_RoleValue_PID ) --生活技能設定上限
	local Type = math.floor(Skill/100) --生活技能類別
	local Level = Skill%100 --確認技能階級 一般是個位數 20點為一級 
	
	--/////////////////////////
	--
	--(舊)LimitNum 是指高達極限的生活技能數量，每個玩家都只有受限的極限技能數，因此要統計數量，避免玩家取得超過被允許的數量
	--BaseValue 是用迴圈來逐步確認玩家現狀的值 若 受Independent這個參數影響， BaseValue 就不會從1開始檢查
	--/////////////////////////
	local LimitNum = 0
	local BaseValue = 1
	--/////////////////////////
	--新版的生活技能上限規則，不再把所有的生活技能分開來算， 而是分成生產還有採集兩類
	--/////////////////////////
	local limit = {collect=0, make=0 };
	
	local SkillType = { 
		[15] = ReadRoleValue ( OID, EM_RoleValue_Skill_BlackSmith ),	--打鐵
		[16] = ReadRoleValue ( OID, EM_RoleValue_Skill_Carpenter ),	--木工
		[17] = ReadRoleValue ( OID, EM_RoleValue_Skill_MakeArmor ),	--製甲
		[18] = ReadRoleValue ( OID, EM_RoleValue_Skill_Tailor ),		--裁縫
		[19] = ReadRoleValue ( OID, EM_RoleValue_Skill_Cook ),		--烹飪
		[20] = ReadRoleValue ( OID, EM_RoleValue_Skill_Alchemy ),	--煉金

		[21] = ReadRoleValue ( OID, EM_RoleValue_Skill_Mining ),	--挖礦
		[22] = ReadRoleValue ( OID, EM_RoleValue_Skill_Lumbering ),	--伐木
		[23] = ReadRoleValue ( OID, EM_RoleValue_Skill_Herblism )	--採藥
	}
	--/////////////////////////	
	--原本的學習上限因此被切分 9 6 3 1 1  變成採集 3 2 1 1 1 生產 6 4 2 1 1  因此統計需要不同類型分開計算
	--/////////////////////////	
	--商城道具的介入
	local mall={
		[2] = {548066, 548067, 548068};
		[3] = {548069, 548070, 548071, 548072, 548073, 548074};
		[4] = {548075, 548076, 548077, 548078, 548079, 548080, 548081};
		[5] = {548082, 548083, 548084, 548085, 548086, 548087, 548088};
	}
	local SkillNum = {}
	SkillNum.non_division={
		[1]	= 9,--學徒
		[2]	= 6,--工匠
		[3]	= 3,--專精
		[4]	= 2,--大師(新制是2個)
		[5]	= 2--傳奇(新制是2個)
	}
	for lv,flag_table in pairs(mall)do
		for __,flag in pairs(flag_table) do
			if CheckFlag(OID, flag)==true then
				SkillNum.non_division[lv]=SkillNum.non_division[lv]+1;
			end
		end
	end
	--採集判斷
	SkillNum.collect={
		[1]	= 3,--學徒
		[2]	= 2,--工匠
		[3]	= 1,--專精
		[4]	= 1,--大師
		[5]	= 1--傳奇
	}
	for lv,flag_table in pairs(mall)do
		for __,flag in pairs(flag_table) do
			if CheckFlag(OID, flag)==true then
				SkillNum.collect[lv]=SkillNum.collect[lv]+1;
			end
		end
	end
	--生產判斷
	SkillNum.make={
		[1]	= 6,--學徒
		[2]	= 4,--工匠
		[3]	= 2,--專精
		[4]	= 1,--大師
		[5]	= 1--傳奇
	}
	for lv,flag_table in pairs(mall)do
		for __,flag in pairs(flag_table) do
			if CheckFlag(OID, flag)==true then
				SkillNum.make[lv]=SkillNum.make[lv]+1;
			end
		end
	end
	
	if Independent == true then--若為獨立判斷只能學level等級
		BaseValue = Level
	end
	
	for i=BaseValue, Level do
		limit = {collect=0, make=0, non_division=0};
		--參考全域變數陣列，檢查玩家有哪些生產技能資格
		--生產系列
		for j=15, 20 do--總數量
			if CheckFlag( OID, Flag[j*100+i] ) == true then
				limit.make = limit.make +1
				limit.non_division = limit.non_division +1;
			end
		end
		--採集系列
		for j=21, 23 do--總數量
			if CheckFlag( OID, Flag[j*100+i] ) == true then
				limit.collect = limit.collect +1
				limit.non_division = limit.non_division +1;
			end
		end
		--debugmsg(0,0, "LimitNum = "..LimitNum .."; SkillNum = "..SkillNum[i] )
		if i == Level and CheckFlag( OID, Flag[Type*100+i] ) == true then
			--該類型的生產技能(該npc所負責的)，玩家已有升階資格，不需再學習
			return 0
		elseif Type<=23 and Type>=21 then
			--該導師是採集系
			if limit.collect >= SkillNum.collect[i] then
				--玩家已經到達能學習的"生活技能種類"數的上限
				if i == Level or CheckFlag( OID, Flag[Type*100+i] ) ~= true then
					return 2;
				end
			elseif limit.non_division >= SkillNum.non_division[i] then
				return 2;
			end
		elseif Type<=20 and Type>=15 then
			--該導師是生系系
			if limit.make >= SkillNum.make[i] then
				--玩家已經到達能學習的"生活技能種類"數的上限
				if i == Level or CheckFlag( OID, Flag[Type*100+i] ) ~= true then
					return 2;
				end
			elseif limit.non_division >= SkillNum.non_division[i] then
				return 2;
			end
		end
		if SkillType[Type] == (i-1)*20 and CheckFlag( OID, Flag[Type*100+i] ) ~= true then
			--該類型的生產技能(該npc所負責的)，已經練到頂，而且也還沒學會
			SetFlag( OID, Flag[Type*100+i], 1 )--開啟
			if i == 1 then
				Lua_LifeSkills_GetSkillFirst(Type)--第一次取得生活技能(類型)
			end
			return 1--取得		
		elseif SkillType[Type] < (i-1)*20 then
			--該類型的生產技能(該npc所負責的)還沒練到頂
			return 3
		end
	end

end

function Lua_LifeSkills_Demote( TID, OID )--生活技能 降級
	TID = TID or TargetID()-- 預設值(NPC)
	OID = OID or OwnerID()-- 預設值(玩家)
	local Flag = LifeSkills_LevelLimit--重要物品(陣列)
	local Skill = ReadRoleValue( TID, EM_RoleValue_PID ) --生活技能設定上限
	local Type = math.floor(Skill/100) --生活技能類別

	local SkillType = { 
		[15] = ReadRoleValue ( OID, EM_RoleValue_Skill_BlackSmith ),	--打鐵
		[16] = ReadRoleValue ( OID, EM_RoleValue_Skill_Carpenter ),	--木工
		[17] = ReadRoleValue ( OID, EM_RoleValue_Skill_MakeArmor ),	--製甲
		[18] = ReadRoleValue ( OID, EM_RoleValue_Skill_Tailor ),	--裁縫
		[19] = ReadRoleValue ( OID, EM_RoleValue_Skill_Cook ),		--烹飪
		[20] = ReadRoleValue ( OID, EM_RoleValue_Skill_Alchemy ),	--煉金
		[21] = ReadRoleValue ( OID, EM_RoleValue_Skill_Mining ),	--挖礦
		[22] = ReadRoleValue ( OID, EM_RoleValue_Skill_Lumbering ),	--伐木
		[23] = ReadRoleValue ( OID, EM_RoleValue_Skill_Herblism )	--採藥
	}
	
--	debugmsg(0,0,"SkillLevel = "..SkillType[Type])
	for i=5, 1, -1 do
		if SkillType[Type] <= i*20 and SkillType[Type] >= (i-1)*20 and  CheckFlag( OID, Flag[Type*100+i] ) == true then
			--debugmsg(0,0,"Down")
			SetFlag( OID, Flag[Type*100+i], 0 )--關閉
			break
		end
	end
end

function Lua_LifeSkills_GetSkillFirst(Type)--第一次取得生活技能(類型)
		local OID = OwnerID()
		local array = {}
		----------------------------打鐵------------------------------
		array[15] = function()
			SetFlag( OID, 540268, 1 );	-- 給予540268打鐵學徒
			SetFlag( OID, 540278, 1 );	-- <給予重要物品540278-配方-鑲釘木棍>
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_BLACKSMITH_1"), C_SYSTEM );--畫面中間訊息：你已取得打鐵學徒資格
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_BLACKSMITH_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得打鐵學徒資格，打鐵等級上限為20級。
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_BLACKSMITH_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-鑲釘木棍」。		
		end

		----------------------------木工------------------------------
		array[16] = function()
			SetFlag( OID, 540334, 1 );	-- 給予540334木工學徒
			SetFlag( OID,540397, 1 );	-- <給予重要物品540397-配方-細木弓>
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_WOODWORKER_1"), C_SYSTEM );--畫面中間訊息：你已取得木工學徒資格
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_WOODWORKER_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得木工學徒資格，木工等級上限為20級。
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_WOODWORKER_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-細木弓」。
		end

		----------------------------製甲------------------------------
		array[17] = function()
			SetFlag( OID, 540335, 1 );	-- 給予540335製甲學徒
			SetFlag( OID,540984, 1 );	-- 給予540504配方-薄板胸甲
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_ARMOR_1"), C_SYSTEM );--畫面中間訊息：你已取得製甲學徒資格
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ARMOR_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得製甲學徒資格，製甲等級上限為20級。
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ARMOR_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-薄板胸甲」。
		end

		----------------------------裁縫------------------------------
		array[18] = function()
			SetFlag( OID, 540336, 1 );	-- 給予540336裁縫學徒資格
			SetFlag( OID, 540526, 1 );	-- 給予540526配方-粗布褲
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_TAILOR_1"), C_SYSTEM );--畫面中間訊息：你已取得裁縫學徒資格
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_TAILOR_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得裁縫學徒資格，裁縫等級上限為20級。
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_TAILOR_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-粗布褲」。
		end

		----------------------------烹飪------------------------------
		array[19] = function()
			SetFlag( OID, 540337, 1 );	-- 給予540337烹飪學徒
			SetFlag( OID, 540570, 1 );	-- 給予540570配方-烤魚
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_COOK_1"), C_SYSTEM );--畫面中間訊息：你已取得烹飪的學徒資格
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_COOK_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得烹飪的學徒資格，烹飪等級上限為20級。
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_COOK_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-烤魚」。
		end

		----------------------------煉金------------------------------
		array[20] = function()
			SetFlag( OID, 540338, 1 );	-- 給予540338煉金學徒
			SetFlag( OID, 540606, 1 );	-- 給予540606配方-基礎療傷藥
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_ALCHEMY_1"), C_SYSTEM );--畫面中間訊息：你已取得煉金學徒資格
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ALCHEMY_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得煉金學徒資格，煉金等級上限為20級。
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ALCHEMY_FORMULA1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-基礎療傷藥」。
		end
		if array[Type] ~= nil then
			array[Type]()--執行
		end
end