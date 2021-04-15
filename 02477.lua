function Lua_ZonePE_3th_Set()--設定
	Lua_ZonePE_3th_Global()--變數宣告
	Lua_ZonePE_3th_PESet()--PE設定
end

function Lua_ZonePE_3th_Global()--變數宣告
	ZonePE_3th_Global = {}--(勿變更)
	ZonePE_3th_BonusTop = {}--排行榜(勿變更)
	ZonePE_3th_JoinList = {}--參加名單(勿變更)
	local Global = ZonePE_3th_Global--勿變更
	
	Global["MapID"] = 301--地圖ID
	Global["MaxScore"] = 6000--成功總分
	Global["ExCha_Ratio"] = 100 --兌換比率
	Global["ExCha_Max"] = 10--兌換上限
	
	Global["ExBonus"] = {}--額外獎勵
	Global["ExBonus"][1]=25
	Global["ExBonus"][2]=20
	Global["ExBonus"][3]=15
	Global["ExBonus"][4]=10 
	Global["ExBonus"][5]=5 -- 5~10
	
	Global["Shop"] = {}
	Global["Shop"][1] = 600365	--高級商店
	--Global["Shop"][2] = 600366	--中級物防商店
	--Global["Shop"][3] = 600367	--中級命中商店
	
	Global["PE_Name"] = "SC_ZONE_PE_3TH_NAME"--PE名稱
	Global["PE_Desc"] = "SC_ZONE_PE_3TH_DESC"--PE描述
	Global["PH_Name"] = {}--階段名稱
	Global["PH_Name"][1] = "SC_ZONE_PE_3TH_PHNAME01"	-- 等待階段
	Global["PH_Name"][2] = "SC_ZONE_PE_3TH_PHNAME02"	-- 進行階段
	
	Global["PH_Desc"] = {}--階段描述
	Global["PH_Desc"][1] = "SC_ZONE_PE_3TH_DESC01"-- 等待描述
	Global["PH_Desc"][2] = "SC_ZONE_PE_3TH_DESC02"-- 進行描述
	
	Global["OB_Name"] = "SC_ZONE_PE_3TH_OBNAME"--進行階段成功條件
	Global["OB_Desc"] = "SC_PE_ZONE16_DW_21"--進行階段成功條件描述 
end

function Lua_ZonePE_3th_PESet()--PE設定
	local Global = ZonePE_3th_Global
	local PEIndex = 1
	Global["Phase"] = 1
	Global["PhaseType"] = 0
	
	Global["Ctrl"] = CreateObj( 110095, 0,0,0,0,1 )
	AddToPartition(Global["Ctrl"], 0 )
	
	PE_AddPE( Global["PE_Name"], Global["PE_Desc"], PEIndex , 0 ) 	-- 新增一個事件
	PE_AddRegion( PEIndex , Global["MapID"] )-- 把PE放進區域
	
	local PHIndex = 100;
	local OBIndex = 1000;
	local OB_Name = "SC_PE_ZONE16_DW_21"; --剩餘時間
		
	--新增階段
	PE_AddPhase( PEIndex , PHIndex , Global["PH_Name"][1] , Global["PH_Desc"][1] , 0 , 0 , 0 , 0 )
	PE_AddPhase( PEIndex , PHIndex+1 , Global["PH_Name"][2] , Global["PH_Desc"][2] , 0 , 0 , 0 , 0 )
		
	--階段條件
	Lua_ZonePE_3th_SetPhase1Time()--第一階段時間設定
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PHIndex + 1, OBIndex+1 , Global["OB_Name"], "" , "ZonePE_3th_Score", 0, Global["MaxScore"] ,  true )
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex + 1, OBIndex+2 , OB_Name, "" , "ZonePE_3th_FalseTime" , 18*60*1000 , 0 ,  false )
	
	-- 設定階段連接	
	PE_PH_SetNextPhase( PEIndex , PHIndex , PHIndex+1 )
	
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "Lua_ZonePE_3th_OnAchieve" )
	
		-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "Lua_ZonePE_3th_FinalExchange" )
	
	-- 事件啟動
	PE_Start( PEIndex , PHIndex )
end

function Lua_ZonePE_3th_SetPhase1Time()--第一階段時間設定
	local Global = ZonePE_3th_Global
	local Wainting = 0;
	local mm = GetSystime( 2 );--分
	if mm <= 10 and Global["PhaseType"] ~= 1 then
		Wainting = (10 - mm)*60
		Global["PhaseType"] = 1
	elseif mm <= 30 and Global["PhaseType"] ~= 2 then
		Wainting = (30 - mm)*60
		Global["PhaseType"] = 2
	elseif mm <= 50 and Global["PhaseType"] ~= 3 then
		Wainting = (50 - mm)*60
		Global["PhaseType"] = 3
	else
		Wainting = (60 - mm)*60+10*60
		Global["PhaseType"] = 1
	end
	
	-- 設定階段條件
	PE_PH_AddObjective_TimeLimit( 1 , 100, 1000 , "SC_PE_ZONE16_DW_21", "" , "ZonePE_3th_Phase1Time" , Wainting*1000 , 0 ,  true )
end

function Lua_ZonePE_3th_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Global = ZonePE_3th_Global
	if OBIndex > 1000 then
		Lua_ZonePE_3th_CountTop()--計算排行榜
		Lua_ZonePE_3th_SetPhase1Time()--第一階段時間設定
		PE_RefreshConfig()--更新PE介面

		if OBIndex == 1002 then
			if Global["FailMsg"] ~= nil and Global["FailMsg"] ~= "" then
				ScriptMessage( Global["Ctrl"], -1, 0 , Global["FailMsg"], "0xffffff80" )
				ScriptMessage( Global["Ctrl"], -1, 1 , Global["FailMsg"], "0xffffff80" )
			end
			Global["Phase"] = 0
		else
			if Global["EndMsg"] ~= nil and Global["EndMsg"] ~= "" then
				ScriptMessage( Global["Ctrl"], -1, 0 , Global["EndMsg"], "0xffffff80" )
				ScriptMessage( Global["Ctrl"], -1, 1 , Global["EndMsg"], "0xffffff80" )
			end

			if Global["RankMsg"] ~= nil and Global["RankMsg"] ~= "" then
				local content = ""
				for i=1, 3 do
					local DBID = ZonePE_3th_BonusTop[i]
					if DBID ~= nil then
						local GUID = GetGUIDByDBID( DBID )
						if GUID == 0 then
							Name = "[SC_ZONE_PE_3TH_OFFLINE]"
						else
							Name = GetName(GUID)
							content = content .."[$SETVAR"..i.."="..Name.."][$SETVAR"..(i+3).."="..ZonePE_3th_JoinList[DBID].."]";--fix 140603
						end
						
					else
						content = content .."[$SETVAR"..i.."=[SC_Z21_PE_LIST_A]][$SETVAR"..(i+3).."= 0]"
					end
				end
				ScriptMessage( Global["Ctrl"], -1, 0 , Global["RankMsg"]..content, "0xffffff80" )
			end			
			Global["Phase"] = 1
		end
	else
		if Global["StartMsg"] ~= nil and Global["StartMsg"] ~= "" then
			ScriptMessage( Global["Ctrl"], -1, 0 , Global["StartMsg"], "0xffffff80" )
			ScriptMessage( Global["Ctrl"], -1, 1 , Global["StartMsg"], "0xffffff80" )
		end

		ZonePE_3th_BonusTop = {}--排行榜
		ZonePE_3th_JoinList = {}--參加名單
		Global["Phase"] = 2
	end
end

function Lua_ZonePE_3th_FinalExchange( PEIndex , GUID , Score )--個人結算
	local Global = ZonePE_3th_Global
	local Count = ReadRoleValue( GUID, EM_RoleValue_EnergyJusticeCoin )
	local is_match_reward=true;

	if Count >= 10000 then
		ScriptMessage( GUID, GUID, 0 , "[SC_ZONE_PE_3TH_EXCEED]", 0 )
		is_match_reward=false;
	elseif Count >= 5000 then
		ScriptMessage( GUID, GUID, 0 , "[SC_ZONE_PE_3TH_CONG]", 0 )
	end

	local Ratio = 1
	if Global["Phase"] == 0 then
		Ratio = 3
	end
	local num=0
	--要除以多少？
	local bottom = Global["ExCha_Ratio"]*Ratio;
	--累計將獲得的資訊
	local count_reward=0;
	if Score >= bottom then
		num = math.floor( Score/bottom )
		if num > Global["ExCha_Max"] then
			num = Global["ExCha_Max"]
		end
		if is_match_reward then
			AddSpeicalCoin( GUID, 12, 12, num );
		end
		count_reward = count_reward + num;
	elseif Score >= math.floor(bottom/2) then
		if is_match_reward then
			AddSpeicalCoin( GUID, 12, 12, 1 );
		end
		count_reward = count_reward + 1;
		num = 1;
	end
	if Ratio == 1 then
		local DBID = ReadRoleValue( GUID, EM_RoleValue_DBID )
		for i=1, 10 do
			if DBID == ZonePE_3th_BonusTop[i] then
				--附上兩種log追查， DesignLog 用 121333 追查
				DesignLog(GUID, 121333, "No."..i..":Score="..Score..", bottom ="..bottom..", num="..num);
				DebugLog(2, "No."..i..":Score="..Score..", bottom ="..bottom..", num="..num);
				if i < 5 then
					if is_match_reward then
						AddSpeicalCoin( GUID, 12, 12, Global["ExBonus"][i] );
					end
					count_reward = count_reward + Global["ExBonus"][i];
				else
					if is_match_reward then
						AddSpeicalCoin( GUID, 12, 12, Global["ExBonus"][5] );
					end
					count_reward = count_reward + Global["ExBonus"][5];
				end

				if Global["BonusMsg"] ~= nil and Global["BonusMsg"] ~= "" then
					ScriptMessage( Global["Ctrl"], GUID, 0 , Global["BonusMsg"].."[$SETVAR1="..ZonePE_3th_JoinList[DBID].."][$SETVAR2="..i.."]", "0xffffff80" )
					ScriptMessage( Global["Ctrl"], GUID, 1 , Global["BonusMsg"].."[$SETVAR1="..ZonePE_3th_JoinList[DBID].."][$SETVAR2="..i.."]", "0xffffff80" )
				end
				break
			end
		end
	end
	if count_reward~=0 and is_match_reward then
	
		--組合要傳遞的訊息
		local msg="[$SETVAR1="..count_reward.."][SC_TOKEN_STRING_7]";
		ScriptMessage(GUID, GUID, 3, msg, 0);
	end
end

function Lua_ZonePE_3th_GetScore( Score,  DisQuest)--給予分數
	local who, tar = OwnerID(), TargetID();
	local Global = ZonePE_3th_Global
	local RoomID=ReadRoleValue(who,EM_RoleValue_RoomID);
	--DebugMsg(0,0,"PE Phase = "..Global["Phase"] )
	if Global["Phase"] == 2 then
		--先給共同積分
		PE_SetVar( "ZonePE_3th_Score", PE_GetVar("ZonePE_3th_Score")+ Score )
		local	player,
			npcexecute,
			whoinfight,
			whohatetar;
		for __=1, 1, 1 do
			--先確認func執行者的身份
			npcexecute = ReadRoleValue(who, EM_RoleValue_IsPlayer)==0;
			if not npcexecute then player=who;break; end
			--不在戰鬥的func執行者，目前已知只有還任務的npc(任務完成觸發劇情)
			whoinfight = HateListCount(who)~=0;
			if not whoinfight then player=tar;break; end
			--func執行者(npc)在戰鬥中有兩種解釋, 打別的怪or打tar
			--func執行者(npc)若和tar友善，那肯定是打別的怪
			whohatetar = CheckRelation(who, tar, EM_CheckRelationType_Enemy)==true;
			if not whohatetar then player=tar;break; end
			--若func執行者在打tar，執行此func應該就是在who的死亡劇情
			local t = KS_GetHateList( who, 1 )--回傳仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM);
			player = t[1];
		end
		if player == nil then
			if DisQuest ~= false then
				disablequest( who, false )
			end
			return
		end
		PE_GivePlayerScore( 1 , player, Score ) -- 玩家一人獎勵積分100%
		local DBID = ReadRoleValue( player, EM_RoleValue_DBID )
		if ZonePE_3th_JoinList[DBID] == nil then
			ZonePE_3th_JoinList[DBID] = Score
		else
			ZonePE_3th_JoinList[DBID] = ZonePE_3th_JoinList[DBID] + Score
		end
	end
	
	if DisQuest ~= false then
		disablequest( who, false )
	end
end

function Lua_ZonePE_3th_GetScore_Test( Score )--測試用
	local Global = ZonePE_3th_Global
	PE_SetVar( "ZonePE_3th_Score", PE_GetVar("ZonePE_3th_Score")+ Score )
	PE_GivePlayerScore( 1 , OwnerID(), Score ) -- 玩家一人獎勵積分100%
	local DBID = ReadRoleValue( OwnerID(), EM_RoleValue_DBID )
	if ZonePE_3th_JoinList[DBID] == nil then
		ZonePE_3th_JoinList[DBID] = Score
	else
		ZonePE_3th_JoinList[DBID] = ZonePE_3th_JoinList[DBID] + Score
	end
end

function Lua_ZonePE_3th_CountTop()--計算排行榜	
	local tmpKey
	for DBID ,Score in pairs( ZonePE_3th_JoinList ) do
		for i=1, 10 do
			tmpKey = ZonePE_3th_BonusTop[i]
			if Score > 0 then
				if tmpKey == nil then
					ZonePE_3th_BonusTop[i] = DBID;
					break;
				elseif Score > ZonePE_3th_JoinList[tmpKey] then
					for j=i, 10 do
						tmpKey = ZonePE_3th_BonusTop[j]
						ZonePE_3th_BonusTop[j] = DBID
						DBID = tmpKey
					end
					break
				end
			end
		end
	end
end

function Lua_ZonePE_3th_NPCSay()--NPC對話
	local NPC = TargetID() --NPC
	local Player = OwnerID() --玩家
	local DBID = ReadRoleValue( player, EM_RoleValue_DBID )
	local Global = ZonePE_3th_Global
	LoadQuestOption( Player )
	--ZonePE_3th_JoinList[DBID] = ZonePE_3th_JoinList[DBID] or 0
	--SetSpeakDetail( Player, "Your Score: "..ZonePE_3th_JoinList[DBID] ) --你的分數

	if ZonePE_3th_BonusTop ~= nil and table.getn(ZonePE_3th_BonusTop) > 0 then
		AddSpeakOption( Player, NPC, "[SC_Z21_PE_LIST]", "Lua_ZonePE_3th_ShowRank",0) --顯示排行榜
		local level = 0
		for i=1, 10 do
			if DBID == ZonePE_3th_BonusTop[i] then
				level = i
				break;
			end
		end
		if ReadRoleValue(Player,EM_RoleValue_EnergyJusticeCoin)>=5000	then --滿5000直接過
			level = 1;
		end
		if level == 1 then
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_A]", "Lua_ZonePE_3th_ShowTopEquip",0) --頂級裝
		else
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_D]", "Lua_ZonePE_3th_ShowNormalEquip(4)",0) --參觀高等
		end
		if level > 0 and level <= 3 then
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_B]", "Lua_ZonePE_3th_ShowMidEquip(2)",0) --中等物防裝
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_C]", "Lua_ZonePE_3th_ShowMidEquip(3)",0) --中等命中裝
		else
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_E]", "Lua_ZonePE_3th_ShowNormalEquip(5)",0) --中等物防參觀
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_F]", "Lua_ZonePE_3th_ShowNormalEquip(6)",0) --中等命中參觀
		end
	else
		if ReadRoleValue(Player,EM_RoleValue_EnergyJusticeCoin)>=5000	then --滿5000直接過
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_A]", "Lua_ZonePE_3th_ShowTopEquip",0) --頂級裝
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_B]", "Lua_ZonePE_3th_ShowMidEquip(2)",0) --中等物防裝
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_C]", "Lua_ZonePE_3th_ShowMidEquip(3)",0) --中等命中裝
		else
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_D]", "Lua_ZonePE_3th_ShowNormalEquip(4)",0) --參觀高等
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_E]", "Lua_ZonePE_3th_ShowNormalEquip(5)",0) --中等物防參觀
			AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_F]", "Lua_ZonePE_3th_ShowNormalEquip(6)",0) --中等命中參觀
		end
	end
	--[[
	AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_D]", "Lua_ZonePE_3th_ShowNormalEquip(4)",0) --參觀高等
	AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_E]", "Lua_ZonePE_3th_ShowNormalEquip(5)",0) --中等物防參觀
	AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_F]", "Lua_ZonePE_3th_ShowNormalEquip(6)",0) --中等命中參觀
	--]]
	AddSpeakOption( Player, NPC, "[SC_Z21_PE_SHOP_G]", "Lua_ZonePE_3th_NPCShowRule",0) --規則

end

function Lua_ZonePE_3th_NPCShowRule()--對話劇情:公告規則
	local Player = OwnerID(); --玩家
	SetSpeakDetail(Player,"[SC_Z21_PE_SHOP_H]");	
end

function Lua_ZonePE_3th_ShowTopEquip()--開啟"頂級"參觀商店
	local Player = OwnerID()
	CloseSpeak( Player )
	
	if ReadRoleValue( Player, EM_RoleValue_DBID ) ~= ZonePE_3th_BonusTop[1] then
		if	ReadRoleValue(Player,EM_RoleValue_EnergyJusticeCoin)<5000	then
			ScriptMessage( Player, Player , 0 , "[SYS_GAMEMSGEVENT_422]", 2 );--條件不符
			return
		end
	end
	
	SetShop( TargetID() , ZonePE_3th_Global["Shop"][1], "Test_Shop_Close" );
	OpenShop();
end

function Lua_ZonePE_3th_ShowMidEquip(Type)--開啟"中級"參觀商店
	local Player = OwnerID()
	local DBID = ReadRoleValue( Player, EM_RoleValue_DBID )
	CloseSpeak( Player )
	
	for i=1, 3 do
		if DBID == ZonePE_3th_BonusTop[i] then
			SetShop( TargetID() , ZonePE_3th_Global["Shop"][Type], "Test_Shop_Close" );
			OpenShop();
			return
		end
	end
	if	ReadRoleValue(Player,EM_RoleValue_EnergyJusticeCoin)>=5000	then
		SetShop( TargetID() , ZonePE_3th_Global["Shop"][Type], "Test_Shop_Close" );
		OpenShop();
		return		
	end
	ScriptMessage( Player, Player , 0 , "[SYS_GAMEMSGEVENT_422]", 2 );--條件不符
end

function Lua_ZonePE_3th_ShowNormalEquip(Type)--開啟"普通"參觀商店
	local Player = OwnerID()
	SetShop( TargetID() , ZonePE_3th_Global["Shop"][Type], "Test_Shop_Close" );
	CloseSpeak( Player )
	OpenShop();
end

function Lua_ZonePE_3th_ShowRank()--顯示排行榜
	local player = OwnerID()
	local GUID
	local DBID
	local content = ""
	local Name
	
	for i=1, 10 do
		DBID = ZonePE_3th_BonusTop[i]
		if DBID ~= nil then
			GUID = GetGUIDByDBID( DBID )
			if GUID == 0 then
				Name = "[SC_ZONE_PE_3TH_OFFLINE]"
			else
				Name = GetName(GUID)
				content = content .."[$SETVAR"..i.."="..Name.."][$SETVAR"..(i+10).."="..ZonePE_3th_JoinList[DBID].."]";--fix 140603
			end

		else
			content = content .."[$SETVAR"..i.."=[SC_Z21_PE_LIST_A]][$SETVAR"..(i+10).."= 0]"
		end
	end
	SetSpeakDetail( Player, "[SC_ZONE_PE_3TH_TOPLIST]"..content )
end

function Lua_ZonePE_3th_PE_SetVar( mode )-- PE變數改變
	local Global = ZonePE_3th_Global
	mode = mode or 1
	if mode == 1 then
		PE_SetVar( "ZonePE_3th_Phase1Time", 5 )
	elseif mode == 2 then
		PE_SetVar( "ZonePE_3th_Score" , Global["MaxScore"] )
	elseif mode == 3 then	
		PE_SetVar( "ZonePE_3th_FalseTime", 5 )
	end
	PE_RefreshConfig()--更新PE介面
end