function LuaS_addy_music_box_npc_0()
	SetPlot(OwnerID(), "touch", "LuaS_addy_music_box_npc", 50)
end

function LuaS_addy_music_box_npc()	-- 巨型留聲機對話內容
	local player = OwnerID()
	local npc = TargetID()

	-- 活動中對話
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_3]")
		return
	end

	-- 今日已經完成
	if CheckScriptFlag(player, 547704) then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_1]")
		return
	end

	-- 缺少樂章
	if CountBodyItem(player, 241641) <=0 then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_2]")
		return	
	end

	SetSpeakDetail(player, "[SC_2013MUSIC_121964_RULE]")	
	
	-- 選擇第一樂章
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121964_OPTION_1]", "Lua_2013music_phonograph_first_movement", 0)
	-- 選擇第二樂章
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121964_OPTION_2]", "Lua_2013music_phonograph_second_movement", 0)
	-- 選擇第三樂章
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121964_OPTION_3]", "Lua_2013music_phonograph_third_movement", 0)
--	-- 載任務模板
--	LoadQuestOption(player)
end

function Lua_2013music_phonograph_first_movement()	-- 第一樂章對話
	-- 遊戲前準備
	Lua_2013music_phonograph_standby({OwnerID()}, "first_movement")
end

function Lua_2013music_phonograph_second_movement()	-- 第二樂章對話
	-- 檢查隊伍
	Lua_2013music_phonograph_checkteam("second_movement")
end

function Lua_2013music_phonograph_third_movement()	-- 第三樂章對話
	-- 檢查隊伍
	Lua_2013music_phonograph_checkteam("third_movement")
end

function Lua_2013music_phonograph_checkteam(movement)	-- 隊伍人數檢查，二、三樂章用
	local player = OwnerID()
	local npc = TargetID()

	-- 取得隊伍成員的guid
	local players = get_player_from_party(player)
	local valid_players = {}

	-- 沒有組隊的拒絕對話
	if #players == 0 then
		if CountBodyItem( player, 241641) == false then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_2]")
		else
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_15]")	
		end	
		return
	end

	-- 檢查隊伍所有成員
	for index, team_player in pairs(players) do
		if CheckDistance(npc, team_player, 200) then
			table.insert(valid_players, team_player)
		end
	end

	for index, valid_player in pairs(valid_players) do
		if CheckScriptFlag(valid_player, 547704) then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_14]") --隊伍中已有成員今天進行過此活動了！
			return
		end
	end

	-- 選第二樂章但人數不符合
	if movement == "second_movement" then
		if #valid_players < 2 or #valid_players > 3 then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_15]")
			return
		end
	end

	-- 選第三樂章但人數不符合
	if movement == "third_movement" then
		if #valid_players < 4 or #valid_players > 6 then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_15]")
			return
		end
	end

	-- 遊戲前準備
	Lua_2013music_phonograph_standby(valid_players, movement)
end

function Lua_2013music_phonograph_standby(players, movement)	-- 遊戲前置準備
	local player = OwnerID()
	local npc = TargetID()
	local players = players or {OwnerID()}

	-- 活動中對話
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_3]")
		return
	end

	-- 防多人同時報名的錯誤
	WriteRoleValue(npc, EM_RoleValue_Register1, player)

	-- 減少一份修復的樂章
	DelBodyItem(OwnerID(), 241641, 1)

	-- 呼叫遊戲主函式，傳入玩家和選擇樂章
	CallPlot(npc, "Lua_2013music_phonograph_main", players, movement)

	CloseSpeak(OwnerID())
end

function Lua_2013music_phonograph_main(players, movement)	-- 遊戲主函式

	-- 活動技能buff
	local skill_buff = 624098
	-- 記分用buff
	local score_buff_for_party = 624054
	local score_buff_for_single = 624135

	-- 已完成key item
	local complete_item = 547704

	-- 第一樂章設定
	local the_first_movement_mode = {
		--旗標
		flag = 781260,
		-- 每回合驅動量
		active_amount = 1
	}

	-- 第二樂章設定
	local the_second_movement_mode = {
		-- 旗標
		flag = 781260,
		-- 每回合驅動量
		active_amount = 2
	}

	-- 第三樂章設定
	local the_third_movement_mode = {
		-- 旗標
		flag = 781263,
		-- 每回合驅動量
		active_amount = 4
	}

	-- 模式設定
	local mode

	-- 根據選擇樂章設定模式
	if movement == "first_movement" then
		mode = the_first_movement_mode
	elseif movement == "second_movement" then
		mode = the_second_movement_mode
	elseif movement == "third_movement" then
		mode = the_third_movement_mode
	else
		mode = the_first_movement_mode
	end

	-- 遊戲主函式參數
	local phonograph = {
		guid = OwnerID(),
		-- 旗標
		flag = mode.flag,
		-- 每次驅動數量
		active_amount = mode.active_amount,
		-- 存放驅動盒物件
		power_source = {},
		-- 玩家列表
		players = players,
		-- 是否在遊戲中
		is_activiting = true,
		-- 玩家是否逃離
		is_escape = false,
		-- 計時器
		timer = 0,
		-- 目前遊戲進行斷落
		paragraph
	}

	-- 初始化遊戲
	Lua_2013music_phonograph_initialize(phonograph)
	local tips = create_object(122139, ReadRoleValue(phonograph.guid, EM_RoleValue_X), ReadRoleValue(phonograph.guid, EM_RoleValue_Y), ReadRoleValue(phonograph.guid, EM_RoleValue_Z), 0)

	-- 設置玩家初始狀態
	for index, player in pairs(phonograph.players) do
		Lua_FE_Reset(player)
		-- 在玩家Register1記錄留聲機guid
		WriteRoleValue(player, EM_RoleValue_Register1, phonograph.guid)
		-- 在留聲機Register2~7記錄完家guid
		WriteRoleValue(phonograph.guid, EM_RoleValue_Register + index, player)
		-- 留聲機開始運作
		ScriptMessage(player, player, 3, "[SC_2013MUSIC_121964_6]", 0)
		-- 上遊戲技能buff
		AddBuff(player, skill_buff, 1, 86400)
		-- 呼叫watcher，監控玩家狀態，清除場面垃圾
			local Lv = ReadRoleValue(player, EM_RoleValue_Lv )
			local SubLv = ReadRoleValue( player , EM_RoleValue_LV_SUB )
			DesignLog( player, 121964 ,  "Lv = "..Lv.." SubLv = "..SubLv ) 
			--加上DesignLog
		CallPlot(phonograph.guid, "Lua_2013music_phonograph_watcher", phonograph)
		-- 呼叫遊戲前倒數五秒介面
		StartClientCountDown(player, 5, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]")
	end
	-- 睡五秒
	Sleep(40)
	DelObj(tips)
	Sleep(10)

	-- 遊戲開始
	-- 呼叫watcher，監控玩家狀態，清除場面垃圾
	CallPlot(phonograph.guid, "Lua_2013music_phonograph_watcher", phonograph)
	-- 活動中持續loop
	while phonograph.is_activiting do
		-- 如果到達三級損壞結束
		if CheckBuff(phonograph.guid, 624105)==true then
			local BuffLV = FN_CountBuffLevel(phonograph.guid, 624105) 
		--	DebugMsg( 0, 0 , "BuffLV1 ="..BuffLV)
			if BuffLV > 1 then
				phonograph.is_activiting = false
			end
		end
		-- 24秒內第一階段
		if phonograph.timer < 240 then
			if phonograph.timer % 60 == 0 then
				Lua_2013music_phonograph_paragraph_1(phonograph)
			end
		-- 24秒到44秒第二階段
		elseif phonograph.timer < 440 then
			if phonograph.timer % 40 == 0 then
				Lua_2013music_phonograph_paragraph_2(phonograph)
			end
		-- 44秒後第三階段
		else
			Lua_2013music_phonograph_paragraph_3(phonograph)
		end
		-- 60秒結束遊戲
		if phonograph.timer >= 600 then
			CancelBuff( phonograph.guid, 624105)
			phonograph.is_activiting = false
		end
		-- 當前遊戲玩家
		local playing_player = 0
		-- 檢查玩家狀態
		for index, player in pairs(players) do
			if CheckBuff(player, skill_buff) then
				playing_player = playing_player + 1
			end
		end
		-- 如果沒有玩家，判斷玩家逃離遊戲
		if playing_player <= 0 then
			phonograph.is_escape = true
			phonograph.is_activiting = false
		end

		phonograph.timer = phonograph.timer + 5
		Sleep(5)
	end

	-- 清除驅動盒
	for index, power_source in pairs(phonograph.power_source) do
		if ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
			DelObj(ReadRoleValue(power_source, EM_RoleValue_Register1))
		end
		MagicInterrupt(power_source)
		DelObj(power_source)
	end

	-- 運轉動作end
	PlayMotion(phonograph.guid, 147)

	-- 遊戲結束函式
	for index, player in pairs(players) do
		-- 留聲機壞掉
		if BuffInfo(phonograph.guid, Lua_BuffPosSearch(phonograph.guid, 624105), EM_BuffInfoType_Power) > 1 then			
			ScriptMessage(phonograph.guid, player, 1, "[SC_2013MUSIC_121964_9]", 0)
		-- 逃離遊戲
		elseif phonograph.is_escape then
			-- 參加獎
	--		GiveBodyItem(player, 724509, 1)
		-- 遊戲獲勝
		else
			ScriptMessage(phonograph.guid, player, 2, "[SC_2013MUSIC_121964_7]", C_SYSTEM)
		end
		-- 給予今日已經參加key item
	--	GiveBodyItem(player, complete_item, 1)
		Lua_2013music_phonograph_award(player, movement)

		-- 取消活動buff
		CancelBuff(player, skill_buff)
		CancelBuff(player, score_buff_for_party)
		CancelBuff(player, score_buff_for_single)
		-- 清除留聲機guid
		WriteRoleValue(player, EM_RoleValue_Register1, 0)
	end

	--清除留聲機的損壞buff
	CancelBuff(phonograph.guid, 624105)

	-- 清除留身機上的資訊
	for index = 0, 6 do
		WriteRoleValue(phonograph.guid, EM_RoleValue_Register + index, 0)
	end
end

function Lua_2013music_phonograph_initialize(phonograph)	-- 初始化遊戲

	-- 驅動盒
	local power_source_id = 121966

	-- 種驅動盒
	for index = 1, GetMoveFlagCount(phonograph.flag) do
		local x, y, z, direction = DW_Location(phonograph.flag, index - 1)
		phonograph.power_source[index] = create_object(power_source_id, x, y, z, direction)
		SetModeEx( phonograph.power_source[index] , EM_SetModeType_HideName, true )--名稱	
		WriteRoleValue(phonograph.power_source[index], EM_RoleValue_Register1, 0)
	end

	-- 留聲機運轉動作begin
	PlayMotion(phonograph.guid, 145)
	Sleep(20)
	-- 運轉動作loop
	PlayMotion(phonograph.guid, 146)
end

function Lua_2013music_phonograph_watcher(phonograph)	-- 監控玩家和驅動棒

	while ReadRoleValue(phonograph.guid, EM_RoleValue_Register1) ~= 0 do
		-- 清除殘存魔法陣
		for index, power_source in pairs(phonograph.power_source) do
			if BuffCount(power_source) == 0 and ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
				DelObj(ReadRoleValue(power_source, EM_RoleValue_Register1))
			end
		end
		for index, player in pairs(phonograph.players) do
			if CheckBuff(player, 624098) then
				if CheckDistance(phonograph.guid, player, 200) == false then
					-- 取消資格
					ScriptMessage(phonograph.guid, player, 1, "[SC_2013MUSIC_121964_5]", 0)
				--	GiveBodyItem(player, 547704, 1)
					Lua_2013music_phonograph_award(player)
					-- 清除遊戲技能
					CancelBuff(player, 624098)
					CancelBuff(player, 624054)
					CancelBuff(player, 624135)
				elseif CheckDistance(phonograph.guid, player, 150) == false then
					-- 警告
					ScriptMessage(phonograph.guid, player, 1, "[SC_2013MUSIC_121964_4]", 0)
				end
			end
		end
		Sleep(5)
	end

end

function Lua_2013music_phonograph_award(player, movement)
	-- 記分用buff
	local score_buff_for_party = 624054
	local score_buff_for_single = 624135
	local phonograph = ReadRoleValue(player, EM_RoleValue_Register1)
	local party_score = BuffInfo(player, Lua_BuffPosSearch(player, score_buff_for_party), EM_BuffInfoType_Power) +1
	
	if CheckFlag( player , 547704) == False then
		-- 今日已完過標記
		GiveBodyItem(player, 547704, 1)
		-- 給予樂章204428或藥水724509
		if movement == "first_movement" then
			DebugMsg( 0 , 0 , party_score)
			-- 
			if party_score >= 10 then
				GiveBodyItem(player, 204428, 3)
			--
			elseif party_score >= 6 then
				GiveBodyItem(player, 204428, 2)
			--
			elseif party_score >= 3 then
				GiveBodyItem(player, 204428, 1)
			--
			else
				GiveBodyItem(player, 724509, 1)
			end
		elseif movement == "second_movement" then 
			DebugMsg( 0 , 0 , party_score)
			--
			if party_score >= 25 then
				GiveBodyItem(player, 204428, 5)
			--
			elseif party_score >= 19 then
				GiveBodyItem(player, 204428, 4)
			--
			elseif party_score >= 13 then
				GiveBodyItem(player, 204428, 3)
			--
			elseif party_score >= 8 then
				GiveBodyItem(player, 204428, 2)
			--
			elseif party_score >= 3 then
				GiveBodyItem(player, 204428, 1)
			--
			else
				GiveBodyItem(player, 724509, 1)
			end
		elseif movement == "third_movement" then
			DebugMsg( 0 , 0 , party_score)
			--
			if party_score >= 48 then
				GiveBodyItem(player, 204428, 7)
			--
			elseif party_score >= 36 then
				GiveBodyItem(player, 204428, 5)
			--
			elseif party_score >= 24 then
				GiveBodyItem(player, 204428, 4)
			--
			elseif party_score >= 13 then
				GiveBodyItem(player, 204428, 2)
			--
			elseif party_score >= 3 then
				GiveBodyItem(player, 204428, 1)
			--
			else
				GiveBodyItem(player, 724509, 1)
			end
		-- 個人分數獎勵
		end
		local single_score = BuffInfo(player, Lua_BuffPosSearch(player, score_buff_for_single), EM_BuffInfoType_Power)+1
		if single_score >= 12 then
			GiveBodyItem(player, 530953, 1)
		end
	end

	-- 蝌蚪幫奈奈追加
	Lua_Festival_05_All(player)
	local Lv = ReadRoleValue( player , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( player , EM_RoleValue_LV_SUB )
	DesignLog( player, 1219641 , "Lv = "..Lv.." SubLv = "..SubLv )
	--加上完成DesignLog_END
end

function Lua_2013music_phonograph_paragraph_1(phonograph)	-- 第一段落
--	DebugMsg(0, 0, "paragraph 1")
	-- 這是第一段落
	phonograph.paragraph = 1

	-- 取得隨機的驅動盒列表
	local power_source_list = get_random_table(phonograph.power_source, phonograph.active_amount)
	-- 逐一起動
	for index, power_source in pairs(power_source_list) do
		Lua_2013music_phonograph_active_power_source(phonograph, power_source)
	end
end

function Lua_2013music_phonograph_paragraph_2(phonograph)	-- 第二段落
--	DebugMsg(0, 0, "paragraph 2")
	-- 這是第二段落
	phonograph.paragraph = 2

	-- 取得隨機的驅動盒列表
	local power_source_list = get_random_table(phonograph.power_source, phonograph.active_amount)
	-- 逐一起動
	for index, power_source in pairs(power_source_list) do
		Lua_2013music_phonograph_active_power_source(phonograph, power_source)
	end
end

function Lua_2013music_phonograph_paragraph_3(phonograph)	-- 第三段落
--	DebugMsg(0, 0, "paragraph 3")
	-- 這是第二段落
	phonograph.paragraph = 3

	-- 當前啟動的驅動盒數量
	local actived_power_source_amount = 0
	-- 尚未啟動的驅動盒列表
	local unactived_power_source_list = {}

	-- 檢查所有驅動盒
	for index, power_source in pairs(phonograph.power_source) do
		-- 如果啟動中，當前啟動驅動盒數量增加
		if ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
			actived_power_source_amount = actived_power_source_amount + 1
		-- 沒啟動就加入列表
		else
			table.insert(unactived_power_source_list, power_source)
		end
	end

	-- 如果目前啟動量少於每回合啟動量就繼續啟動
	if actived_power_source_amount < phonograph.active_amount then
		-- 從未啟動列表取得隨機驅動盒列表
		local power_source_list = get_random_table(unactived_power_source_list, phonograph.active_amount - actived_power_source_amount)
		-- 逐一起動
		for index, power_source in pairs(power_source_list) do
			Lua_2013music_phonograph_active_power_source(phonograph, power_source)
		end
	end
end

function Lua_2013music_phonograph_active_power_source(phonograph, power_source)	-- 發動驅動盒函式
	if ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
		return
	end
	-- 技能永唱時間，level 1是7秒，level 2是5秒
	local symbol_time = 7
	local type_1 = {	-- 動力棒發動使用的法術和buff列表
		{skill = 850675, buff = 624101, symbol = 122138},	-- 綠色
--		{skill = 850676, buff = 624102, symbol = 122139},	-- 灰色
		{skill = 850677, buff = 624103, symbol = 122140},	-- 藍色
--		{skill = 850678, buff = 624104, symbol = 122141},	-- 紅色
		{skill = 850736, buff = 624166, symbol = 122142},	-- 紫色
		{skill = 850737, buff = 624167, symbol = 122143}	-- 黃色
	}
	local type_2 = {	-- 動力棒發動使用的法術和buff列表
		{skill = 850730, buff = 624101, symbol = 122138},	-- 綠色
--		{skill = 850731, buff = 624102, symbol = 122139},	-- 灰色
		{skill = 850732, buff = 624103, symbol = 122140},	-- 藍色
--		{skill = 850733, buff = 624104, symbol = 122141},	-- 紅色
		{skill = 850734, buff = 624166, symbol = 122142},	-- 紫色
		{skill = 850735, buff = 624167, symbol = 122143}	-- 黃色
	}
	-- 啟動方式
	local active_type
	-- 如果大於第一段落使用type 2
	if phonograph.paragraph > 1 then
		active_type = type_2
		symbol_time = 5
	-- 不然都type 1
	else
		active_type = type_1
		symbol_time = 7
	end

	-- 隨機選一種顏色
	local type = active_type[RandRange(1, #active_type)]

	-- 在驅動盒的位置產生symbol，也就是魔法陣
	local x, y, z, direction = DW_Location(power_source)
	local symbol_guid = create_object(type.symbol, x, y + 4, z, direction, {EM_SetModeType_Gravity, false})
	-- 把法陣guid記錄在驅動盒的register1
	WriteRoleValue(power_source, EM_RoleValue_Register1, symbol_guid)

	-- 對留聲機使用損壞法術
	CastSpell(power_source, phonograph.guid, type.skill)
	-- 上顏色標記
	AddBuff(power_source, type.buff, 1, symbol_time + 1)
end

-- ////////////////////////////////////////////////////////////////////////////////////
-- 以下是技能觸發
-- ////////////////////////////////////////////////////////////////////////////////////

function LuaS_bm_624108()	-- 動力棒沒有及時解除後施放[音樂盒故障]檢查
	local phonograph = TargetID()
	local power_source = OwnerID()
	DelObj(ReadRoleValue(power_source, EM_RoleValue_Register1))
	WriteRoleValue(power_source, EM_RoleValue_Register1, 0)
	-- 刪除發動buff
	for index = 1, BuffCount(power_source) do
		CancelBuff(power_source, BuffInfo(power_source, index, EM_BuffInfoType_OwnerID))
	end
	local Player = SearchRangePlayer(phonograph , 200)
	for i = 0 , table.getn(Player) do
		if CheckBuff(Player[i] , 624098 ) == true then 
			ScriptMessage(phonograph, Player[i], 1, "[SC_2013MUSIC_121964_11]", 0)
		end
	end
	AddBuff(phonograph, 624105, 0, -1)
end

function LuaS_check_624109()		--解除綠色特效check
	return LuaS_2013music_check_buff(624101)	--綠色特效施放中check
end

function LuaS_check_624110()		--解除灰色特效check
	return LuaS_2013music_check_buff(624102) 	--灰色特效施放中check
end

function LuaS_check_624111()		--解除藍色特效check
	return LuaS_2013music_check_buff(624103)	--藍色特效施放中check
end

function LuaS_check_624112()		--解除紅色特效check
	return LuaS_2013music_check_buff(624104) --紅色特效施放中check
end

function LuaS_check_624168()		--解除紫色特效check
	return LuaS_2013music_check_buff(624166)--紫色特效施放中check
end

function LuaS_check_624169()		--解除黃色特效check
	return LuaS_2013music_check_buff(624167)--黃色特效施放中check
end

function LuaS_check_2013music_skill()
	local player = OwnerID()
	-- phonograph的guid
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)
	local power_source = SearchRangeNPC(OwnerID(), 20)
	local is_active_power = false
	local is_activing = false
	-- 暫存的啟動器
	local ps
	for i, v in pairs(power_source) do
		if ReadRoleValue(v, EM_RoleValue_OrgID) == 121966 then
			is_active_power = true
		end
		if is_active_power and ReadRoleValue(v, EM_RoleValue_Register1) ~= 0 then
			is_activing = true
		end
		if is_active_power and is_activing then
			-- 計算玩家與啟動器面向角度
			local delta_x = ReadRoleValue(player,EM_RoleValue_X) - ReadRoleValue(v, EM_RoleValue_X)
			local delta_z = ReadRoleValue(player,EM_RoleValue_Z) - ReadRoleValue(v, EM_RoleValue_Z)
			local correct_direction = CalDir(delta_x, delta_z) - 180
			local delta_direction = ReadRoleValue(player, EM_RoleValue_Dir) - correct_direction
		--	if delta_direction >= 180 then delta_direction = delta_direction - 360 end
			-- 誤差與許+-30度
		--	if delta_direction >= -30 and delta_direction <= 30 then
				return true
	--		else
	--			-- 必須面對驅動盒
	--			ScriptMessage(npc, player, 1, "[SC_2013MUSIC_121964_13]", C_SYSTEM)
	--			return false
	--		end
		end
	end
	return false
end

function LuaS_2013music_check_buff(_buff)
	local player = OwnerID()
	-- phonograph的guid
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)
	local power_source = SearchRangeNPC(OwnerID(), 20)
	local is_active_power = false
	local is_activing = false
	for i, v in pairs(power_source) do
		if ReadRoleValue(v, EM_RoleValue_OrgID) == 121966 then
			is_active_power = true
		end
		if is_active_power and ReadRoleValue(v, EM_RoleValue_Register1) ~= 0 then
			is_activing = true
		end
		-- 成功解除
		if CheckBuff(v, _buff) and is_activing then
			-- 中斷損壞施法
			MagicInterrupt(v)
			-- 刪除法陣
			DelObj(ReadRoleValue(v, EM_RoleValue_Register1))
			WriteRoleValue(v, EM_RoleValue_Register1, 0)
			-- 刪除發動buff
			for index = 1, BuffCount(v) do
				CancelBuff(v, BuffInfo(v, index, EM_BuffInfoType_OwnerID))
			end
			ScriptMessage(npc, player, 2, "[SC_2013MUSIC_121964_10]", 0)
			-- 得分特效
			CastSpell(v, npc, 850738)
			return true
		end
	end
	-- 解除失敗
	if is_active_power and is_activing then
		ScriptMessage(npc, player, 1, "[SC_2013MUSIC_121964_8]", 0)
	end
	return false
end

function LuaS_mb_result()	-- 成功解除的回饋
	local player = OwnerID()
	local target = TargetID()
	-- phonograph的guid
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)
	-- 記分用buff
	local score_buff_for_party = 624054
	local score_buff_for_single = 624135
	-- 個人分數加分
	AddBuff(player, score_buff_for_single, 0, 86400)
	-- 從phonograph取得隊員資料
	for index = 1, 6 do
		local _player = ReadRoleValue(npc, EM_RoleValue_Register + index)
		if _player ~= 0 then
			AddBuff(_player, score_buff_for_party, 0, 86400)
		end
	end
end