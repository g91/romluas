
function Lua_122113_speak()
	local player = OwnerID()
	local npc = TargetID()

	if CheckAcceptQuest(player, 426125)  and CheckScriptFlag(player, 547723) == false then-- ��t�@���}�l
		if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- ��t��
			SetSpeakDetail(player, "[SC_Z25Q426125_AN_2]")
			return
		end
		SetSpeakDetail(player, "[SC_Z25Q426125_AN_1]")				-- 
		AddSpeakOption(player, npc, "[SC_Z25Q426102_AN_2]", "Lua_122113_drama", 0)--
		return
	end

	SetSpeakDetail(player, "[SC_Z25Q426102_AN_5]")				-- �i�c�A�Ʊ����@�B�@�B�µۧکү�Q����a����V���h�A�ګo�L�O����......�C
	LoadQuestOption(player)
end

function Lua_122113_drama()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- ��t��
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
		{id = 122064, flag = 781272, pid = 20},				-- 1. �d�w����(�B�s), �X�l�s��20
		{id = 122063, flag = 781272, pid = 21},				-- 2. �N��D��J��, �X�l�s��21
		{id = 122062, flag = 781272, pid = 22},				-- 3. �ү��箦, �X�l�s��22
		{id = 122061, flag = 781272, pid = 23},				-- 4. �k��ù�S, �X�l�s��23
		{id = 122060, flag = 781272, pid = 24},				-- 5. ����J�D��L�S, �X�l�s��24
	}

	-- �I�s�¤O�ɺt
	power_director(
		-- ��npc��ɺt�A�����Ӫ�t
		director,
		-- �[��
		players,
		-- �d�q�}�e�A�W���w�q
		cast,
		-- �����禡
		"Lua_122113_drama_script",
		{start = "Lua_122113_drama_start",		-- ��t�}�l�ƥ�
		 interrupt = "Lua_122113_drama_interrupt",	-- ���a���_�ƥ�
		 complete = "Lua_122113_drama_complete",	-- ��t�����ƥ�
		 playing = "Lua_122113_drama_playing"		-- ��t���C��ƥ�
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
		-- ��tbuff
		AddBuff(player, 624170, 1, -1 )
	end
end

function Lua_122113_drama_interrupt(event)
	-- Ĳ�o���_�ƥ󪺪��aguid
	DebugMsg(0, 0, "event >> Lua_122113_drama_interrupt. player")
end

function Lua_122113_drama_complete(event)
	local players = event.players
	for index, player in pairs(players) do
		local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
		StopSound(player, MusicID)
		Lua_PlayBGM(player)
		-- �����ȩMbuff�~�|�����y
		if CheckBuff(player, 624170) and CheckAcceptQuest(player, 426125) then
			-- ����
			GiveBodyItem(player, 547723, 1)
			-- �¹��A���a�ಾ��y�� 25,0,-12532.8,1390.7,-2270.3
			AddBuff(player, 620001, 0, 2)
			SetPos(player, -12532.8, 1390.7, -2270.3, 0)
		end
		-- ������tbuff
		CancelBuff(player, 624170)
	end
end

function Lua_122113_drama_playing(event)
	local director = event.director
	local players = event.players
	for index, player in pairs(players) do
		if CheckBuff(player, 624170) then
			if not CheckDistance(player, director, 150) then
				-- �Z���L��ĵ�i
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_5]", 0)
			end
			if not CheckDistance(player, director, 180) then
				-- �Z���L���A���ȥ���
				-- ������tbuff
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_6]", 0)
				CancelBuff(player, 624170)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
			-- �������ȫ�M����t
			if not CheckAcceptQuest(player, 426125) then
				CancelBuff(player, 624170)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
		end
	end
end

-- �����禡�A�ѼƦ� director, actor, players�A�ɺtguid, �t��table, �[��table
function Lua_122113_drama_script(director, actor, players)
	--�N��ʧ@�վ�
	Hide(actor[2])
	AdjustFaceDir(actor[2],actor[1], 0)
	SetDefIdleMotion(actor[2], ruFUSION_MIME_JUMP_LOOP)
	Show(actor[2],0)
	Sleep(10)

	-- �B�s���~
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_CAST_INSTANT)

	-- �B�s�G�ҡD���D��D���I
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_1]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_1]", "0xFF75BEFB")
	Sleep(25)

	-- �B�s�G�A�o���x�p���A�ש�ֲ{���F�I
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_2]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_2]", "0xFF75BEFB")
	Sleep(25)

	-- �ҭ����
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)

	-- �ү��箦�G�n�j���f��A�s���O�ڦb��A�O�H�٬O�A�b��ڡH
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_3]", "0xffba80ee")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_3]", "0xffba80ee")
	--Yell(actor[3], "[SC_Z25Q426125_3]", 3)
	Sleep(25)

	-- �B�s
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_BUFF_SP02)

	-- �B�s�G�o�ܤֻ��A���ڨ�l�����A�ڤ���N�n�P�A�F���I
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_4]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_4]", "0xFF75BEFB")
	Sleep(25)

	-- ����J�Ϥ�
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_SHIELD_BASH)

	--����J�G[122064]�A���ѨϩR���I�n�������������A�ٻݭn�A���O�q�A�O���_���̽��F�����I
	Yell(actor[5], "[SC_Z25Q426125_5]", 3)
	Sleep(35)

	-- �B�s�G�K�K
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_6]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_6]", "0xFF75BEFB")
	Sleep(10)

	-- ����J�Ϥ�
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_SHIELD_BASH)

	--����J�G�����}�o�̧a�I
	Yell(actor[5], "[SC_Z25Q426125_7]", 3)
	Sleep(35)

	-- �B�s
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_BUFF_SP02)

	-- �B�s�G�ּo�ܡI���ѧڴN�n���ڨ�l�����I
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_8]", "0xFF75BEFB")
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_8]", "0xFF75BEFB")
	Sleep(25)

	-- �ҭ�
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)

	-- �ү��箦�G�A�H���A�̤��ѳ������}�o�̶ܡH
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_9]", "0xffba80ee")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_9]", "0xffba80ee")
	--Yell(actor[3], "[SC_Z25Q426125_9]", 3)
	Sleep(25)

	-- �ү��箦��
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_EMOTE_POINT)

	-- �ү��箦�G�N���A���@�@���j�������������O�q�a�I���F�A�̡A���@�H�F�ѻP�`�ȡI�I
	ScriptMessage(actor[1], 0, 2, "[SC_Z25Q426125_10]", "0xffba80ee")
	ScriptMessage(actor[1], 0, 0, "[SC_Z25Q426125_10]", "0xffba80ee")
	--Yell(actor[3], "[SC_Z25Q426125_10]", 3)

	-- ���������X�{�b�X��23�A����25
	Show(actor[4], 0)
	local _delay = Move(actor[4], GetMoveFlagValue(781272, 25, EM_RoleValue_X), GetMoveFlagValue(781272, 25, EM_RoleValue_Y), GetMoveFlagValue(781272, 25, EM_RoleValue_Z))
	Sleep(_delay)

	-- �����������쨫��25���ɭԡA�ʧ@�GruFUSION_ACTORSTATE_EMOTE_IDLE2�A�f�t�@�ӱq�}�U���~�X�������t�S��
	CastSpell(actor[4], actor[4], 850752);
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_IDLE2)

	-- ���������X�{�A�K�������H�Y�u����ӳ���......
	ScriptMessage(actor[4], 0, 2, "[SC_Z25Q426125_11]", 0)
	Sleep(25)
	-- �N��G�ү��箦�I���n���I�I
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
	-- �A�P��L�ɪ������]���F�A�K�K
	ScriptMessage(actor[4], 0, 2, "[SC_Z25Q426125_13]", 0)
	CastSpell(actor[4], actor[4], 850752);
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Sleep(15)
	Sleep(_delay)

	-- ��t�����O�o�n��"�@"!!
	power_director_stop_movie(director)
end