--	執行Lua_426121_drama_queue()進入426121[龍族表演需求]的表演。
--	Lua_426121_drama_queue()會紀錄誰是第一位玩家，把該玩家當作master，其他玩家就是guest。
--	表演進度都跟著master走，其他guest會不斷看著master表演結束一起進入Lua_426121_drama_result()

function Lua_426121_drama()
	local player = OwnerID()
	Lua_426121_drama_queue()
	CloseSpeak(player)
end

function Lua_426121_drama_queue()													-- 426121 - [龍族表演需求]的排隊看表演函式
	local player = OwnerID()
	local handler_guid = TargetID()

	if ReadRoleValue(handler_guid, EM_RoleValue_Register2) == 0 then								-- 如果目前沒有玩家登錄欣賞表演，登錄玩家
		WriteRoleValue(handler_guid, EM_RoleValue_Register2, player)								-- EM_RoleValue_Register2 存放第一位執行該表演的玩家
	end

	AddBuff(player, 624059, 0, 60 )												-- 表演用buff，看見演員，隱藏任務npc
	AddBuff(player, 620001, 0, 2)												-- 黑幕
	SetPos(															-- 玩家移動到0號旗幟
		player,
		GetMoveFlagValue(781000, 0, EM_RoleValue_X),
		GetMoveFlagValue(781000, 0, EM_RoleValue_Y),
		GetMoveFlagValue(781000, 0, EM_RoleValue_Z),
		GetMoveFlagValue(781000, 0, EM_RoleValue_Dir)
	)

	if ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 1 or ReadRoleValue(handler_guid, EM_RoleValue_Register2) ~= player then		-- EM_RoleValue_Register1 == 1 是表演中
		CallPlot(player, "Lua_426121_drama_guest", handler_guid)
	elseif ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 0 and ReadRoleValue(handler_guid, EM_RoleValue_Register2) == player then		-- 沒有表演中
		CallPlot(handler_guid, "Lua_426121_drama_play")
		CallPlot(player, "Lua_426121_drama_master", handler_guid)
	else																			-- 其他狀況
		DebugMsg(0, 0, "Register1 (is_player) = " .. ReadRoleValue(handler_guid, EM_RoleValue_Register1) .. ", Register2 (regist player) = " .. ReadRoleValue(handler_guid, EM_RoleValue_Register2))
	end
end

function Lua_426121_drama_play()
	local handler = {														-- 表演handler記錄所有演員
		guid = OwnerID(),
		flag = 781000,
		actor = {}
	}
	WriteRoleValue(handler.guid, EM_RoleValue_Register1, 1)				-- EM_RoleValue_Register1 記錄目前表演狀況，0是沒表演，1是表演中

	Lua_426121_drama_initialize(handler)		-- 初始化演員
	Sleep(30)					-- 等待演員都上完妝
	Lua_426121_drama_script(handler)		-- 開始表演

	WriteRoleValue(handler.guid, EM_RoleValue_Register2, 0)	
	WriteRoleValue(handler.guid, EM_RoleValue_Register1, 0)				-- is_playing = false
	Sleep(30)
	Lua_426121_drama_get_lunch(handler)		-- 演完領便當
end

function Lua_426121_drama_master(handler_guid)											-- 表演handler，每次表演都會有把第一位玩家當作master，進度跟著master走
	local player = OwnerID()


	Lua_StopBGM(player)
	local MusicID = PlaySoundToPlayer(player, "music/zone/016/ZONE/sacral_10_LE_turint.mp3", false)

	while ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 1 do								-- 如果表演中就等到表演結束再繼續
		Sleep(10)
	end

	StopSound(player, MusicID)
	Lua_PlayBGM(player)

	Lua_426121_drama_result(handler_guid, player)										-- 欣賞完表演的結果
end

function Lua_426121_drama_guest(handler_guid)											-- 如果已經有master，其他再加入的玩家就是guest。
	local player = OwnerID()

	Lua_StopBGM(player)
	local MusicID = PlaySoundToPlayer(player, "music/zone/016/ZONE/sacral_10_LE_turint.mp3", false)

	while ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 1 do								-- 如果表演中就等到表演結束再繼續
		Sleep(10)
	end

	StopSound(player, MusicID)
	Lua_PlayBGM(player)

	Lua_426121_drama_result(handler_guid, player)										-- 欣賞完表演的結果
end

function Lua_426121_drama_result(handler_guid, player)										-- 解除buff，給予欣賞表演完的物品
		ScriptMessage(handler_guid, 0, 2, "[SC_426121_17]", C_SYSTEM)							-- 系統字串：巨大的龍影朝誕生之地飛去
		AddBuff(player, 620001, 1, 2)										-- 黑幕
	if CheckBuff(player, 624059) and CheckAcceptQuest(player, 426121) then
		GiveBodyItem(player, 547720, 1)												-- 給予任務條件
		GiveBodyItem(player, 547693, 1)												-- 隱藏任務NPC旗幟
		CancelBuff(player, 624059)													-- 去表演buff
	end
end

function Lua_426121_drama_initialize(handler)			-- 初始化426121 - [這束花是要獻給普尼羅的]表演
	local actor_list = {					-- 各個演員的OrgID和登場pid
		{id = 122003, pid = 1},					-- 1. 卡拉維, 旗子編號1
		{id = 122004, pid = 2},					-- 2. 威爾, 旗子編號2
		{id = 122005, pid = 3},					-- 3. 康葛斯, 旗子編號3
		{id = 122006, pid = 4},					-- 4. 傑斯莫克里夫, 旗子編號4
		{id = 122007, pid = 5},					-- 5. 伊崔妮, 旗子編號5
		{id = 122008, pid = 6},					-- 6. 摩瑞克, 旗子編號6
		{id = 122009, pid = 7},					-- 7. 螢火, 旗子編號7
		{id = 122010, pid = 8},					-- 8. 密朵娜, 旗子編號8
		{id = 121972, pid = 9},					-- 9. 吉兒, 旗子編號9
	}

	if #handler.actor ~= 0 then				-- 如果有殘餘演員，謀殺
		Lua_426121_drama_get_lunch(handler)
	end

	for index, _actor in pairs(actor_list) do			-- 根據actor列表逐一產生演員
		handler.actor[index] = create_object(
			_actor.id,								-- 演員id
			GetMoveFlagValue(handler.flag, _actor.pid, EM_RoleValue_X),		-- 演員位置
			GetMoveFlagValue(handler.flag, _actor.pid, EM_RoleValue_Y),
			GetMoveFlagValue(handler.flag, _actor.pid, EM_RoleValue_Z),
			GetMoveFlagValue(handler.flag, _actor.pid, EM_RoleValue_Dir)
		)
		MoveToFlagEnabled(handler.actor[index], false)
		if index == 9 then
			hide(handler.actor[index])
		end
	end
end

function Lua_426121_drama_get_lunch(handler)						-- 讓演員領便當
	for index, _actor in pairs(handler.actor) do
		DelObj(_actor)
	end
	handler.actor = {}
end

function Lua_426121_drama_script(handler)

	local actor = handler.actor

	ScriptMessage(actor[1], 0, 2, "[SC_426121_01]", C_SYSTEM)				-- 卡拉維．卡薩姆：我們的朋友，普尼羅
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_02]", C_SYSTEM)				-- 卡拉維．卡薩姆：雖然不在了，但是…
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_03]", C_SYSTEM)				-- 卡拉維．卡薩姆：他那英勇的身影，仍活躍在我們的心中…
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_04]", C_SYSTEM)				-- 卡拉維．卡薩姆：讓我們敬那些曾經鮮活的生命…
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_05]", C_SYSTEM)				-- 卡拉維．卡薩姆：他們的犧牲，換來我們的今日…
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_06]", C_SYSTEM)				-- 卡拉維．卡薩姆：我們背負著他們的希望…
	Sleep(30)

	Show(actor[9], 0)										-- 吉兒出現
	local _delay = Move(									-- 吉兒走到旗標10
		actor[9],
		GetMoveFlagValue(handler.flag, 10, EM_RoleValue_X),
		GetMoveFlagValue(handler.flag, 10, EM_RoleValue_Y),
		GetMoveFlagValue(handler.flag, 10, EM_RoleValue_Z)
	)
	Sleep(_delay + 5)
--	AdjustFaceDir(actor[9], actor[1], 0)							-- 吉兒面對卡拉維
	AdjustFaceDir(actor[8], actor[9], 0)							-- 蜜朵娜面對吉兒
	PlayMotion(actor[8], ruFUSION_ACTORSTATE_ATTACK_2H)					-- 揮手
	ScriptMessage(actor[8], 0, 2, "[SC_426121_07]", C_SYSTEM)				-- 蜜朵娜：叛徒！是妳害死普尼羅的！
	Sleep(30)
	AdjustFaceDir(actor[4], actor[9], 0)							-- 傑斯面對吉兒
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_POINT)
	ScriptMessage(actor[4], 0, 2, "[SC_426121_08]", C_SYSTEM)				-- 傑斯．莫克里夫：妳竟敢踏入這裡！
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_09]", C_SYSTEM)				-- 卡拉維．卡薩姆：各位！我相信吉兒不是故意讓意外發生的
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_10]", C_SYSTEM)				-- 卡拉維．卡薩姆：我相信她的難過，應該不比各位少，
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_11]", C_SYSTEM)				-- 卡拉維．卡薩姆：來這裡吧，妳來見這最後一面。
	Sleep(30)

	_delay = Move(										-- 吉兒走到旗標11
		actor[9],
		GetMoveFlagValue(handler.flag, 11, EM_RoleValue_X),
		GetMoveFlagValue(handler.flag, 11, EM_RoleValue_Y),
		GetMoveFlagValue(handler.flag, 11, EM_RoleValue_Z)
	)
	Sleep(_delay + 5)
--	AdjustFaceDir(actor[9], actor[1], 0)							-- 吉兒面對卡拉維

	ScriptMessage(actor[1], 0, 2, "[SC_426121_06]", C_SYSTEM)				-- 卡拉維．卡薩姆：我們背負著他們的希望…
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_12]", C_SYSTEM)				-- 卡拉維．卡薩姆：絕對要獲得勝利，來撫慰那些戰死的亡靈
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_13]", C_SYSTEM)				-- 卡拉維．卡薩姆：吉兒，妳願意回到聯盟再為我們效力嗎？
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_14]", C_SYSTEM)				-- 卡拉維．卡薩姆：我想這應該是普尼羅的心願吧
	Sleep(30)

	_delay = Move(										-- 吉兒走到旗標11
		actor[9],
		GetMoveFlagValue(handler.flag, 12, EM_RoleValue_X),
		GetMoveFlagValue(handler.flag, 12, EM_RoleValue_Y),
		GetMoveFlagValue(handler.flag, 12, EM_RoleValue_Z)
	)
	Sleep(_delay + 5)
--	AdjustFaceDir(actor[9], actor[1], 0)							-- 吉兒面對卡拉維

	AdjustFaceDir(actor[8], actor[1], 0)
	PlayMotion(actor[8], ruFUSION_ACTORSTATE_DODGE)
	ScriptMessage(actor[8], 0, 2, "[SC_426121_15]", C_SYSTEM)				-- 蜜朵娜：人王！？
	AdjustFaceDir(actor[4], actor[1], 0)
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_DODGE)
	ScriptMessage(actor[4], 0, 2, "[SC_426121_15]", C_SYSTEM)				-- 莫克里夫：人王！？
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_16]", C_SYSTEM)				-- 吉兒：我會用我的方式來做補償
	Sleep(20)

end