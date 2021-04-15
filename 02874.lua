
function Lua_122045_speak()
	local player = OwnerID()
	local npc = TargetID()

	-- 有547726先解任務
	if CheckScriptFlag(player, 547726) or CheckCompleteQuest( player,426107 ) then
		LoadQuestOption(player)
		return
	end

	-- 表演劇情開始
	if CheckAcceptQuest(player, 426107)  then
		-- 表演中
		if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then
			SetSpeakDetail(player, "[SC_Z25Q426107_AN_3]")
			-- 是否中途插入?
			AddSpeakOption(player, npc, "[SC_Z25Q426107_AN_7]", "Lua_122045_insert_drama_check", 0)
			return
		end
		SetSpeakDetail(player, "[SC_Z25Q426107_AN_1]")				-- 
		AddSpeakOption(player, npc, "[SC_Z25Q426107_AN_2]", "Lua_122045_drama", 0)--
		return
	end

	SetSpeakDetail(player, "[SC_Z25Q426107_AN_4]")				-- 如果沒有表演任務傳回一般對話
end

function Lua_122045_insert_drama_check()
	-- 中途插入表演
	local player = OwnerID()
	local npc = TargetID()

	if not Global_PowerDirector[npc] then
		DebugMsg(0, 0, "Unexpected Error!!")
		return
	end
	
	Lua_StopBGM(player)
	local MusicID = PlaySoundToPlayer(player, "music/dungeon/traffrock/ancient_tales_09_cavemen.mp3", false)
	WriteRoleValue(player, EM_RoleValue_Register2, MusicID)
	-- 表演buff
	AddBuff(player, 624066, 1, -1 )

	table.insert(Global_PowerDirector[npc].players, player)

	CloseSpeak(player)
end

function Lua_122045_drama()
	local player = OwnerID()
	local npc = TargetID()
	get_multiplayer(npc, player, 1, 1, {complete = "Lua_122045_drama_setting"})
	CloseSpeak(player)
end

function Lua_122045_drama_setting(event)
	local director = event.register
	local players = event.players
	local cast = {
		{id = 122048, flag = 781272, pid = 30},				-- 1. 賽琳伊菲斯, 旗子編號30
		{id = 122046, flag = 781272, pid = 31},				-- 2. 摩瑞克．渥林特,, 旗子編號31
		{id = 122050, flag = 781272, pid = 32},				-- 3. 卡德摩斯之影(冰龍), 旗子編號32
		{id = 122049, flag = 781272, pid = 33},				-- 4. 冰龍之子, 旗子編號33
		{id = 122134, flag = 781272, pid = 34},				-- 5. 卡貝斯特之影, 旗子編號34
		{id = 122135, flag = 781272, pid = 35}				-- 6. 曼索瑞恩之影, 旗子編號35
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
		"Lua_122045_drama_script",
		{start = "Lua_122045_drama_start",		-- 表演開始事件
		 interrupt = "Lua_122045_drama_interrupt",	-- 玩家中斷事件
		 complete = "Lua_122045_drama_complete",	-- 表演完成事件
		 playing = "Lua_122045_drama_playing"		-- 表演中每秒事件
		}
	)
end

function Lua_122045_drama_start(event)
	local director = event.director
	local players = Global_PowerDirector[director].players
	local actor = event.actor

	Hide(actor[3])
	Hide(actor[4])
	Hide(actor[5])
	Hide(actor[6])

	for index, player in pairs(players) do
		Lua_StopBGM(player)
		local MusicID = PlaySoundToPlayer(player, "music/dungeon/traffrock/ancient_tales_09_cavemen.mp3", false)
		WriteRoleValue(player, EM_RoleValue_Register2, MusicID)
		-- 表演buff
		AddBuff(player, 624066, 1, -1 )
	end
end

function Lua_122045_drama_interrupt(event)
	-- 觸發中斷事件的玩家guid
	DebugMsg(0, 0, "event >> Lua_122045_drama_interrupt. player")
end

function Lua_122045_drama_complete(event)
	local director = event.director
	local players = Global_PowerDirector[director].players
	for index, player in pairs(players) do
		-- 有任務和buff才會給獎勵
		if CheckAcceptQuest(player, 426107) and CheckBuff(player, 624066) then
			-- 給予
			GiveBodyItem(player, 547726, 1)
			-- 取消表演buff
			CancelBuff(player, 624066)
		end
		local MusicID = ReadRoleValue(player, EM_RoleValue_Register2)
		StopSound(player, MusicID)
		WriteRoleValue(player, EM_RoleValue_Register2, 0)
		Lua_PlayBGM(player)
	end
end

function Lua_122045_drama_playing(event)
	local director = event.director
	local players = Global_PowerDirector[director].players
	for index, player in pairs(players) do
		if CheckBuff(player, 624066) then
			if not CheckDistance(player, director, 150) then
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_5]", 0)
			end
			if not CheckDistance(player, director, 250) then
				-- 距離過遠，任務失敗
				-- 取消表演buff
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_6]", 0)
				CancelBuff(player, 624066)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
			-- 取消任務後清除表演
			if not CheckAcceptQuest(player, 426107) then
				CancelBuff(player, 624066)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
		end
	end
end

-- 角本函式，參數有 director, actor, players，導演guid, 演員table, 觀眾table
function Lua_122045_drama_script(director, actor, players)


	-- 賽琳伊菲斯走到旗標36
	local _delay = Move(actor[1], GetMoveFlagValue(781272, 36, EM_RoleValue_X), GetMoveFlagValue(781272, 36, EM_RoleValue_Y), GetMoveFlagValue(781272, 36, EM_RoleValue_Z))
	Sleep(_delay)
	Sleep(_delay)

	-- 賽琳伊菲斯施法
--	PlayMotion(actor[1], ruFUSION_ACTORSTATE_BUFF_INSTANT)
	CastSpellPos(actor[1], GetMoveFlagValue(781272, 32, EM_RoleValue_X), GetMoveFlagValue(781272, 32, EM_RoleValue_Y), GetMoveFlagValue(781272, 32, EM_RoleValue_Z), 850746, 1)
	Sleep(20)

	-- 出現睡著的冰龍
	Show(actor[3], 0)
--	AddBuff(actor[3], 507555, 1, 86400)
--	AddBuff(actor[3], 507556, 1, 86400)
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_SLEEP_LOOP)

	-- 摩瑞克：[122068]？
	-- 摩瑞克轉過去
	AdjustFaceDir(actor[2], actor[3], 0)
	Yell(actor[2], "[SC_Z25Q426107_2]", 3)
	Sleep(20)

	-- 賽琳伊菲斯：讓我來替[122068]的「惡夢」加點有趣的。
	Yell(actor[1], "[SC_Z25Q426107_3]", 3)
	Sleep(20)

	-- 出現冰龍之子
	Show(actor[4], 0)
--	AddBuff(actor[4], 507555, 1, 86400)
--	AddBuff(actor[4], 507556, 1, 86400)

	-- 冰龍之子：父親……。
	-- 摩瑞克轉過去，老處女也轉過去
	AdjustFaceDir(actor[2], actor[4], 0)
	AdjustFaceDir(actor[1], actor[4], 0)
	ScriptMessage(actor[4], -1, 3, "[SC_Z25Q426107_4]", "0xFFA020F0")
	Sleep(10)

	-- 冰龍起床
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(20)
	-- 卡德摩斯：又見到你了……最近你每天都出現，不斷地催促我……說到底，是我對你有所愧疚。
	ScriptMessage(actor[3], -1, 3, "[SC_Z25Q426107_5]", "0xff80ffff")
	Sleep(30)

	-- 冰龍之子
	--PlayMotion(actor[4], ruFUSION_ACTORSTATE_BUFF_SP02)
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_CRY)
	Sleep(10)
	-- 冰龍之子：父親，為我撕毀那個殺了我的兇手！
	ScriptMessage(actor[4], -1, 3, "[SC_Z25Q426107_6]", "0xFFA020F0")
	Sleep(30)

	-- 冰龍
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_BUFF_SP03)
	Sleep(10)
	-- 卡德摩斯：放心吧！我已經追尋到[122058]的蹤跡，很快就能報仇了！
	ScriptMessage(actor[3], -1, 3, "[SC_Z25Q426107_7]", "0xff80ffff" )
	Sleep(20)

	-- 冰龍之子
--	PlayMotion(actor[4], ruFUSION_ACTORSTATE_CAST_SP02)
--	Sleep(20)
	-- 冰龍之子：可是，還不夠積極，我的父親。
	ScriptMessage(actor[4], -1, 3, "[SC_Z25Q426107_8]", "0xFFA020F0")
	Sleep(25)
	--變身龍型
	AddBuff( actor[4], 620424, 0, 300 )
	-- 卡德摩斯飛在半空
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_FLY_LOOP)
	Sleep(10)

	-- 冰龍之子葛屁
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_DEAD)
	Sleep(40)

	-- 卡貝斯特和曼索瑞恩出現在旗標上
	Show(actor[5], 0)
	SetModeEx( actor[5], EM_SetModeType_HideName, false )
	AddBuff(actor[5], 507555, 1, 86400)
	AddBuff(actor[5], 507556, 1, 86400)
	Show(actor[6], 0)
	SetModeEx( actor[6], EM_SetModeType_HideName, false )
	AddBuff(actor[6], 507555, 1, 86400)
	AddBuff(actor[6], 507556, 1, 86400)

	-- 卡哥蹲下
	AdjustFaceDir(actor[5], actor[4], 0)
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Sleep(20)

	-- 卡貝斯特：這隻龍死得有點離奇……。
	Yell(actor[5], "[SC_Z25Q426107_1]", 3)
	Sleep(25)

	-- 曼哥說話
	AdjustFaceDir(actor[6], actor[5], 0)
	PlayMotion(actor[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	-- 曼索瑞恩：龍死了不是正合你意嗎？
	Yell(actor[6], "[SC_Z25Q426107_14]", 3)
	Sleep(25)

	-- 卡哥說讚
	AdjustFaceDir(actor[5], actor[6], 0)
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_EMOTE_APPROVAL)

	-- 卡貝斯特：別亂說！[122058]！[122054]給的任務並不是屠龍，而是協助發狂的真龍！
	Yell(actor[5], "[SC_Z25Q426107_15]", 3)
	Sleep(35)

	-- 曼哥搖擺頭
	PlayMotion(actor[6], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)

	-- 曼索瑞恩：是我不對，為了賠罪，安葬這隻龍的工作就交給我吧。
	Yell(actor[6], "[SC_Z25Q426107_16]", 3)
	Sleep(30)

	-- 卡哥說好
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)

	-- 卡貝斯特(點頭)：嗯，那就麻煩你了。
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(actor[5], "[SC_Z25Q426107_17]", 3)
	Sleep(30)

	-- 卡哥走到旗標37
	_delay = Move(actor[5], GetMoveFlagValue(781272, 37, EM_RoleValue_X), GetMoveFlagValue(781272, 37, EM_RoleValue_Y), GetMoveFlagValue(781272, 37, EM_RoleValue_Z))
	Sleep(_delay)
	Sleep(_delay)
	Hide(actor[5])

	-- 曼哥搖搖頭
	PlayMotion(actor[6], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(10)
	
	CastSpell( actor[6], actor[4], 498324 ) --850643 )
	Sleep(20)
	-- 曼索瑞恩：這個白痴的男人，沒想到禁忌符文的力量這麼容易就讓我到手了。
	Yell(actor[6], "[SC_Z25Q426107_18]", 3)
	Sleep(10)
	Hide(actor[4])
	Sleep(35)
	Hide(actor[6])
	Sleep(35)
	-- 卡德摩斯飛在半空
--	PlayMotion(actor[3], ruFUSION_ACTORSTATE_FLY_LOOP)

	-- 卡德摩斯：夠了！我懂了！我現在就去殺了[122058]！如此你就能瞑目了吧！
	ScriptMessage(actor[3], -1, 2, "[SC_Z25Q426107_10]", "0xff80ffff")
	Sleep(30)

	-- 卡德摩斯飛走，離場，刪除  ... 非去哪???
	_delay = Move(actor[3], GetMoveFlagValue(781272, 37, EM_RoleValue_X), GetMoveFlagValue(781272, 37, EM_RoleValue_Y), GetMoveFlagValue(781272, 37, EM_RoleValue_Z))
	Sleep(_delay)
	Hide(actor[3])
	Hide(actor[4])

	-- 摩瑞克指人
	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	-- 摩瑞克：剛剛那個不是預言啊！
	Yell(actor[2], "[SC_Z25Q426107_11]", 3)
	-- 這不是真的!!
	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(20)

	-- 賽琳伊菲斯
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_THREATEN)

	-- 賽琳伊菲斯：怎麼不是？[122068]都說他接下來要殺了[122058]啦。
	Yell(actor[1], "[SC_Z25Q426107_12]", 3)
	Sleep(25)

	-- 賽琳伊菲斯嘲笑
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Sleep(20)
	-- 賽琳伊菲斯：你們想看預言，我才加速[122068]的「惡夢」的。嘻嘻，不領情就算了，反正我要離開啦。
	Yell(actor[1], "[SC_Z25Q426107_13]", 3)
	Sleep(35)

	-- <<賽琳伊菲斯跳下懸崖>>
	--_delay = Move(actor[1], GetMoveFlagValue(781272, 38, EM_RoleValue_X), GetMoveFlagValue(781272, 38, EM_RoleValue_Y), GetMoveFlagValue(781272, 38, EM_RoleValue_Z))
	CastSpell( actor[1], actor[1], 498195 )
	Sleep(35)
	DelObj(actor[1])
	Sleep(10)

	-- 表演結束記得要喊"咖"!!
	power_director_stop_movie(director)
end