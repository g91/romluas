
-- 新版稱號系統NPC

-- NPC初始對話劇情

function lua_titledevelop_npc_0()
	local npc = TargetID()
	local player = OwnerID()
	
	local openkey = Checkflag(player, 545679 )  --開啟稱號裝備介面資格
 
	LoadQuestOption(player)

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_1]"   ) 

	if openkey == true then -- 已開啟資格 (可接每日任務)
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_4]" , "lua_titledevelop_npc_2", 0 ) -- 接受訓練
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_3]" , "lua_titledevelop_npc_1", 0 ) -- 什麼是徽章介面？ 
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_24]" , "lua_titledevelop_npc_3", 0 ) -- 我想提升徽章介面的等級
	end
end


function lua_titledevelop_npc_1()  --系統說明  
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_5]"   )   -- 系統說明上方文字
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_29]" , "lua_titledevelop_npc_s1", 0 ) -- 說明項目1
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_31]" , "lua_titledevelop_npc_s2", 0 ) -- 說明項目2
--	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_13]" , "lua_titledevelop_npc_s3", 0 ) -- 說明項目3
	AddSpeakOption( player, npc, "[SO_BACK]", "lua_titledevelop_npc_0", 0)             --回到上一頁
end

function lua_titledevelop_npc_2()  --接取任務
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_6]"   )   -- 任務主頁面文字
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_7]" , "lua_mika_titlequest_keycheck1", 0 ) -- 接取紅線任務
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_8]" , "lua_mika_titlequest_keycheck2", 0 ) -- 接取藍線任務
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_9]" , "lua_mika_titlequest_keycheck3", 0 ) -- 接取黃線任務
	AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_10]" , "lua_mika_titlequest_keycheck4", 0 ) -- 接取綠線任務
	AddSpeakOption( player, npc, "[SO_BACK]", "lua_titledevelop_npc_0", 0)             --回到上一頁
end

function lua_titledevelop_npc_3()  --如何提升徽章等級
	local npc = TargetID()
	local player = OwnerID()
	local Req = {}
		Req[1] = { 1000 , 10 }	-- 需求徽章等級、需求經驗值、需求該徽章等級的數量
		Req[2] = { 1500 , 15 }
		Req[3] = { 2250 , 35 }
		Req[4] = { 3375 , 100 }
	local Lv , Exp = Lua_Hao_TitleSys_Return_Lv_Exp(Player)
	local Count = Lua_Hao_TitleSys_Q_Check_Rare(Player , Lv)
	local String = {}
		String[1] = "[SC_TITLEQUEST_NPC_26][$SETVAR4="..Exp.."][$SETVAR5="..Req[Lv][1].."]"
		--經驗值 <CY>[$VAR1]</CY> / <CY>[$VAR2]</CY>
		String[2] = "[SC_TITLEQUEST_NPC_27][$SETVAR1="..Req[Lv][2].."][$SETVAR2="..Lv.."][$SETVAR3="..Count.."]"
		--搜集<CR>[$VAR1]</CR>個<CR>[$VAR2]</CR>級徽章稱號，
		--目前你已取得的<CR>[$VAR2]</CR>級徽章稱號數量為<CR>[$VAR3]</CR>個。

	if Lv <= 3 then
		SetSpeakDetail( player , "[SC_TITLEQUEST_NPC_25]"..String[1]..String[2] )   -- 如何提升徽章等級
	elseif Lv == 4 then
		SetSpeakDetail( player , "[SC_TITLEQUEST_NPC_28]" )
	end

	if Exp == Req[Lv][1] and Count >= Req[Lv][2] and Lv ~= 4 then
		AddSpeakOption( player, npc, "[SC_TITLEQUEST_NPC_33]", "lua_titledevelop_npc_4", 0)	-- 提升徽章等級
	else
		AddSpeakOption( player, npc, "[SO_BACK]", "lua_titledevelop_npc_0", 0)	--回到上一頁
	end
end

function lua_titledevelop_npc_4()  --升級

	local Player = OwnerID()
	local Lv , Exp = Lua_Hao_TitleSys_Return_Lv_Exp(Player)
	local NewLv = Lv+1 
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Lv , NewLv )
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Exp , 0 )
	CastSpell( Player , Player , 491010 )
	--恭喜你，你已經成功將徽章稱號介面的等級提高至[$VAR1]
	ScriptMessage( Player , Player , 1 , "[SC_TITLEQUEST_NPC_22][$SETVAR1="..NewLv.."]" , C_SYSTEM )
	CloseSpeak( Player )
end

function lua_titledevelop_npc_5()		-- 寫入徽章介面等級1

	local Player = TargetID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- 舊有徽章等級
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Lv , Value[1]+1 )	-- 徽章等級
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- 修改徽章等級
	DebugMsg( Player , Room , "Lv = "..Value[1].." , New Lv = "..Value[2] )
end

function lua_titledevelop_npc_s1()  --系統說明 1
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_30]"   )   -- 系統說明內容1
	AddSpeakOption (player, npc, "[SO_BACK]", "lua_titledevelop_npc_1", 0)             --回到上一頁
end

function lua_titledevelop_npc_s2()  --系統說明 2
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_32]"   )   -- 系統說明內容2
	AddSpeakOption (player, npc, "[SO_BACK]", "lua_titledevelop_npc_1", 0)             --回到上一頁
end

function lua_titledevelop_npc_s3()  --系統說明 3
	local npc = TargetID()
	local player = OwnerID()

	SetSpeakDetail( player, "[SC_TITLEQUEST_NPC_23]"   )   -- 系統說明內容3
	AddSpeakOption (player, npc, "[SO_BACK]", "lua_titledevelop_npc_1", 0)             --回到上一頁
end


----------------------------------------------------------------------------------------------------------
-- 新版稱號系統每日任務 完成後劇情模板

function lua_titlequest_setkey1(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )
	Setflag(playerID, 545680, 1 )   --  當天已完成紅色任務(挑戰)
	DW_QietKillOne(playerID, 106262 )
--	Say(playerID, "ok1" )
	DisableQuest(npc, false )
end

function lua_titlequest_setkey2(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )
	Setflag(playerID, 545681, 1 )   --  當天已完成藍色任務(任務)
	DW_QietKillOne(playerID, 106263 )
--	Say(playerID, "ok2" )
	DisableQuest(npc, false )
end

function lua_titlequest_setkey3(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )
	Setflag(playerID, 545682, 1 )   --  當天已完成黃色任務(活動)
	DW_QietKillOne(playerID, 106264 )
--	Say(playerID, "ok3" )
	DisableQuest(npc, false )
end

function lua_titlequest_setkey4(setkey)
	local playerID = TargetID()
	local npc = OwnerID()

	Setflag(playerID, setkey, 0 )

	-- 清除各種綠線任務進行中的key
	local QuestTypeKey = { 545647, 545648, 545649, 545650 }

	for i = 1, table.getn(QuestTypeKey) do
		Setflag(playerID, QuestTypeKey[i], 0)
	end

	Setflag(playerID, 545683, 1 )   --  當天已完成綠色任務(系統)
	DW_QietKillOne(playerID, 106265 )
--	Say(playerID, "ok4" )
	DisableQuest(npc, false )
end