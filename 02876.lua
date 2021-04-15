
function Lua_122113_speak()
	local player = OwnerID()
	local npc = TargetID()

	if CheckAcceptQuest(player, 426125)  and CheckScriptFlag(player, 547723) == false then-- 表演劇情開始
		if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- 表演中
			SetSpeakDetail(player, "[SC_Z25Q426125_AN_2]")
			return
		end
		SetSpeakDetail(player, "[SC_Z25Q426125_AN_1]")				-- 
		AddSpeakOption(player, npc, "[SC_Z25Q426102_AN_2]", "Lua_122113_drama", 0)--
		return
	end

	SetSpeakDetail(player, "[SC_Z25Q426102_AN_5]")				-- 可惡，事情正一步一步朝著我所能想到最壞的方向偏去，我卻無力阻止......。
	LoadQuestOption(player)
end

function Lua_122113_drama()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- 表演中
		SetSpeakDetail(player, "[SC_Z25Q426125_AN_2]")
		return
	end
	get_multiplayer(npc, player, 100, 1, {complete = "Lua_122113_drama_setting"})
	CloseSpeak(player)
end

function Lua_122113_drama_setting(event)
	local director = event.register
	local players = event.players
	local cast = {
		{id = 122064, flag = 781272, pid = 20},				-- 1. 卡德摩斯(冰龍), 旗子編號20
		{id = 122063, flag = 781272, pid = 21},				-- 2. 吉兒．艾克辛, 旗子編號21
		{id = 122062, flag = 781272, pid = 22},				-- 3. 曼索瑞恩, 旗子編號22
		{id = 122061, flag = 781272, pid = 23},				-- 4. 法伊羅特, 旗子編號23
		{id = 122060, flag = 781272, pid = 24},				-- 5. 摩瑞克．渥林特, 旗子編號24
	}

	-- 呼叫威力導演
	power_director(
		-- 把npc當導演，控制整個表演
		director,
		-- 觀眾
		players,
		-- 卡司陣容，上面定義
		cast,
		-- 角本函式
		"Lua_122113_drama_script",
		{start = "Lua_122113_drama_start",		-- 表演開始事件
		 interrupt = "Lua_122113_drama_interrupt",	-- 玩家中斷事件
		 complete = "Lua_122113_drama_complete",	-- 表演完成事件
		 playing = "Lua_122113_drama_playing"		-- 表演中每秒事件
		}
	)
end

function Lua_122113_drama_start(event)
	local players = event.players
	local actor = event.actor

	Hide(actor[4])

	for index, player in pairs(players) do
		Lua_StopBGM(player)
		local MusicID = PlaySoundToPlayer(player, "music/zone/010/zone010_music_borsburs.mp3", false)
		WriteRoleValue(event.director, EM_RoleValue_Register2, MusicID)
		-- 表演buff
		AddBuff(player, 624170, 1, -1 )
	end
end

function Lua_122113_drama_interrupt(event)
	-- 觸發中斷事件的玩家guid
	DebugMsg(0, 0, "event >> Lua_122113_drama_interrupt. player")
end

function Lua_122113_drama_complete(event)
	local players = event.players
	for index, player in pairs(players) do
		local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
		StopSound(player, MusicID)
		Lua_PlayBGM(player)
		-- 有任務和buff才會給獎勵
		if CheckBuff(player, 624170) and CheckAcceptQuest(player, 426125) then
			-- 給予
			GiveBodyItem(player, 547723, 1)
			-- 黑幕，玩家轉移到座標 25,0,-12532.8,1390.7,-2270.3
			AddBuff(player, 620001, 0, 2)
			SetPos(player, -12532.8, 1390.7, -2270.3, 0)
		end
		-- 取消表演buff
		CancelBuff(player, 624170)
	end
end

function Lua_122113_drama_playing(event)
	local director = event.director
	local players = event.players
	for index, player in pairs(players) do
		if CheckBuff(player, 624170) then
			if not CheckDistance(player, director, 150) then
				-- 距離過遠警告
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_5]", 0)
			end
			if not CheckDistance(player, director, 180) then
				-- 距離過遠，任務失敗
				-- 取消表演buff
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_6]", 0)
				CancelBuff(player, 624170)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
			-- 取消任務後清除表演
			if not CheckAcceptQuest(player, 426125) then
				CancelBuff(player, 624170)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
		end
	end
end

-- 角本函式，參數有 director, actor, players，導演guid, 演員table, 觀眾table
function Lua_122113_drama_script(director, actor, players)
	--吉兒動作調整
	Hide(actor[2])
	AdjustFaceDir(actor[2],actor[1], 0)
	SetDefIdleMotion(actor[2], ruFUSION_MIME_JUMP_LOOP)
	Show(actor[2],0)
	Sleep(10)

	-- 冰龍恐嚇
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_CAST_INSTANT)

	-- 冰龍：曼．索．瑞．恩！
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_1]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_1]", "0xFF75BEFB")
	Sleep(25)

	-- 冰龍：你這個膽小鬼，終於肯現身了！
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_2]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_2]", "0xFF75BEFB")
	Sleep(25)

	-- 曼哥拍拍
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)

	-- 曼索瑞恩：好大的口氣，究竟是我在找你呢？還是你在找我？
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_3]", "0xffba80ee")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_3]", "0xffba80ee")
	--Yell(actor[3], "[SC_Z25Q426125_3]", 3)
	Sleep(25)

	-- 冰龍
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_BUFF_SP02)

	-- 冰龍：廢話少說，殺我兒子的仇，我今日就要與你了結！
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_4]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_4]", "0xFF75BEFB")
	Sleep(25)

	-- 摩瑞克甩手
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_SHIELD_BASH)

	--摩瑞克：[122064]，莫忘使命阿！要消滅火元素王，還需要你的力量，別讓復仇屏蔽了雙眼！
	Yell(actor[5], "[SC_Z25Q426125_5]", 3)
	Sleep(35)

	-- 冰龍：……
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_6]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_6]", "0xFF75BEFB")
	Sleep(10)

	-- 摩瑞克甩手
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_SHIELD_BASH)

	--摩瑞克：快離開這裡吧！
	Yell(actor[5], "[SC_Z25Q426125_7]", 3)
	Sleep(35)

	-- 冰龍
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_BUFF_SP02)

	-- 冰龍：少廢話！今天我就要為我兒子報仇！
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_8]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_8]", "0xFF75BEFB")
	Sleep(25)

	-- 曼哥
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)

	-- 曼索瑞恩：你以為你們今天都能離開這裡嗎？
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_9]", "0xffba80ee")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_9]", "0xffba80ee")
	--Yell(actor[3], "[SC_Z25Q426125_9]", 3)
	Sleep(25)

	-- 曼索瑞恩指
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_EMOTE_POINT)

	-- 曼索瑞恩：就讓你們瞧瞧偉大的火元素王的力量吧！殺了你們，讓世人了解與害怕！！
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_10]", "0xffba80ee")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_10]", "0xffba80ee")
	--Yell(actor[3], "[SC_Z25Q426125_10]", 3)

	-- 火元素王出現在旗標23，走到25
	Show(actor[4], 0)
	local _delay = Move(actor[4], GetMoveFlagValue(781272, 25, EM_RoleValue_X), GetMoveFlagValue(781272, 25, EM_RoleValue_Y), GetMoveFlagValue(781272, 25, EM_RoleValue_Z))
	Sleep(_delay)

	-- 火元素王走到走到25的時候，動作：ruFUSION_ACTORSTATE_EMOTE_IDLE2，搭配一個從腳下往外擴散的火系特效
	CastSpell(actor[4], actor[4], 850752);
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_IDLE2)

	-- 火元素王出現，熾熱的氣息隨即席捲整個場面......
	ScriptMessage(actor[4], 0, 2, "[SC_Z25Q426125_11]", 0)
	Sleep(25)
	-- 吉兒：曼索瑞恩！不要阿！！
	SetDefIdleMotion(actor[2], ruFUSION_MIME_RUN_FORWARD)
	AddBuff(actor[2], 506984, 10, -1)
	--WriteRoleValue(actor[2], EM_RoleValue_IsWalk, 0)
	for index, player in pairs(players) do
		if player then
			_delay = Move(actor[2], ReadRoleValue(player, EM_RoleValue_X), ReadRoleValue(player, EM_RoleValue_Y), ReadRoleValue(player, EM_RoleValue_Z))
			break
		end
	end
	Yell(actor[2], "[SC_Z25Q426125_12]", 3)
	-- 你感到無盡的火炎吞噬了你……
	ScriptMessage(actor[4], 0, 2, "[SC_Z25Q426125_13]", 0)
	CastSpell(actor[4], actor[4], 850752);
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Sleep(15)
	Sleep(_delay)

	-- 表演結束記得要喊"咖"!!
	power_director_stop_movie(director)
end