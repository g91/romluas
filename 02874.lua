
function Lua_122045_speak()
	local player = OwnerID()
	local npc = TargetID()

	-- ��547726���ѥ���
	if CheckScriptFlag(player, 547726) or CheckCompleteQuest( player,426107 ) then
		LoadQuestOption(player)
		return
	end

	-- ��t�@���}�l
	if CheckAcceptQuest(player, 426107)  then
		-- ��t��
		if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then
			SetSpeakDetail(player, "[SC_Z25Q426107_AN_3]")
			-- �O�_���~���J?
			AddSpeakOption(player, npc, "[SC_Z25Q426107_AN_7]", "Lua_122045_insert_drama_check", 0)
			return
		end
		SetSpeakDetail(player, "[SC_Z25Q426107_AN_1]")				-- 
		AddSpeakOption(player, npc, "[SC_Z25Q426107_AN_2]", "Lua_122045_drama", 0)--
		return
	end

	SetSpeakDetail(player, "[SC_Z25Q426107_AN_4]")				-- �p�G�S����t���ȶǦ^�@����
end

function Lua_122045_insert_drama_check()
	-- ���~���J��t
	local player = OwnerID()
	local npc = TargetID()

	if not Global_PowerDirector[npc] then
		DebugMsg(0, 0, "Unexpected Error!!")
		return
	end
	
	Lua_StopBGM(player)
	local MusicID = PlaySoundToPlayer(player, "music/dungeon/traffrock/ancient_tales_09_cavemen.mp3", false)
	WriteRoleValue(player, EM_RoleValue_Register2, MusicID)
	-- ��tbuff
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
		{id = 122048, flag = 781272, pid = 30},				-- 1. �ɵY��ᴵ, �X�l�s��30
		{id = 122046, flag = 781272, pid = 31},				-- 2. ����J�D��L�S,, �X�l�s��31
		{id = 122050, flag = 781272, pid = 32},				-- 3. �d�w�������v(�B�s), �X�l�s��32
		{id = 122049, flag = 781272, pid = 33},				-- 4. �B�s���l, �X�l�s��33
		{id = 122134, flag = 781272, pid = 34},				-- 5. �d�����S���v, �X�l�s��34
		{id = 122135, flag = 781272, pid = 35}				-- 6. �ү��箦���v, �X�l�s��35
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
		"Lua_122045_drama_script",
		{start = "Lua_122045_drama_start",		-- ��t�}�l�ƥ�
		 interrupt = "Lua_122045_drama_interrupt",	-- ���a���_�ƥ�
		 complete = "Lua_122045_drama_complete",	-- ��t�����ƥ�
		 playing = "Lua_122045_drama_playing"		-- ��t���C��ƥ�
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
		-- ��tbuff
		AddBuff(player, 624066, 1, -1 )
	end
end

function Lua_122045_drama_interrupt(event)
	-- Ĳ�o���_�ƥ󪺪��aguid
	DebugMsg(0, 0, "event >> Lua_122045_drama_interrupt. player")
end

function Lua_122045_drama_complete(event)
	local director = event.director
	local players = Global_PowerDirector[director].players
	for index, player in pairs(players) do
		-- �����ȩMbuff�~�|�����y
		if CheckAcceptQuest(player, 426107) and CheckBuff(player, 624066) then
			-- ����
			GiveBodyItem(player, 547726, 1)
			-- ������tbuff
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
				-- �Z���L���A���ȥ���
				-- ������tbuff
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_6]", 0)
				CancelBuff(player, 624066)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
			-- �������ȫ�M����t
			if not CheckAcceptQuest(player, 426107) then
				CancelBuff(player, 624066)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
		end
	end
end

-- �����禡�A�ѼƦ� director, actor, players�A�ɺtguid, �t��table, �[��table
function Lua_122045_drama_script(director, actor, players)


	-- �ɵY��ᴵ����X��36
	local _delay = Move(actor[1], GetMoveFlagValue(781272, 36, EM_RoleValue_X), GetMoveFlagValue(781272, 36, EM_RoleValue_Y), GetMoveFlagValue(781272, 36, EM_RoleValue_Z))
	Sleep(_delay)
	Sleep(_delay)

	-- �ɵY��ᴵ�I�k
--	PlayMotion(actor[1], ruFUSION_ACTORSTATE_BUFF_INSTANT)
	CastSpellPos(actor[1], GetMoveFlagValue(781272, 32, EM_RoleValue_X), GetMoveFlagValue(781272, 32, EM_RoleValue_Y), GetMoveFlagValue(781272, 32, EM_RoleValue_Z), 850746, 1)
	Sleep(20)

	-- �X�{�ε۪��B�s
	Show(actor[3], 0)
--	AddBuff(actor[3], 507555, 1, 86400)
--	AddBuff(actor[3], 507556, 1, 86400)
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_SLEEP_LOOP)

	-- ����J�G[122068]�H
	-- ����J��L�h
	AdjustFaceDir(actor[2], actor[3], 0)
	Yell(actor[2], "[SC_Z25Q426107_2]", 3)
	Sleep(20)

	-- �ɵY��ᴵ�G���ڨӴ�[122068]���u�c�ڡv�[�I���쪺�C
	Yell(actor[1], "[SC_Z25Q426107_3]", 3)
	Sleep(20)

	-- �X�{�B�s���l
	Show(actor[4], 0)
--	AddBuff(actor[4], 507555, 1, 86400)
--	AddBuff(actor[4], 507556, 1, 86400)

	-- �B�s���l�G���ˡK�K�C
	-- ����J��L�h�A�ѳB�k�]��L�h
	AdjustFaceDir(actor[2], actor[4], 0)
	AdjustFaceDir(actor[1], actor[4], 0)
	ScriptMessage(actor[4], -1, 3, "[SC_Z25Q426107_4]", "0xFFA020F0")
	Sleep(10)

	-- �B�s�_��
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(20)
	-- �d�w�����G�S����A�F�K�K�̪�A�C�ѳ��X�{�A���_�a�ʫP�ڡK�K���쩳�A�O�ڹ�A���ҷ\���C
	ScriptMessage(actor[3], -1, 3, "[SC_Z25Q426107_5]", "0xff80ffff")
	Sleep(30)

	-- �B�s���l
	--PlayMotion(actor[4], ruFUSION_ACTORSTATE_BUFF_SP02)
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_CRY)
	Sleep(10)
	-- �B�s���l�G���ˡA���ڼ������ӱ��F�ڪ�����I
	ScriptMessage(actor[4], -1, 3, "[SC_Z25Q426107_6]", "0xFFA020F0")
	Sleep(30)

	-- �B�s
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_BUFF_SP03)
	Sleep(10)
	-- �d�w�����G��ߧa�I�ڤw�g�l�M��[122058]���ܸ�A�ܧִN������F�I
	ScriptMessage(actor[3], -1, 3, "[SC_Z25Q426107_7]", "0xff80ffff" )
	Sleep(20)

	-- �B�s���l
--	PlayMotion(actor[4], ruFUSION_ACTORSTATE_CAST_SP02)
--	Sleep(20)
	-- �B�s���l�G�i�O�A�٤����n���A�ڪ����ˡC
	ScriptMessage(actor[4], -1, 3, "[SC_Z25Q426107_8]", "0xFFA020F0")
	Sleep(25)
	--�ܨ��s��
	AddBuff( actor[4], 620424, 0, 300 )
	-- �d�w�������b�b��
	PlayMotion(actor[3], ruFUSION_ACTORSTATE_FLY_LOOP)
	Sleep(10)

	-- �B�s���l����
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_DEAD)
	Sleep(40)

	-- �d�����S�M�ү��箦�X�{�b�X�ФW
	Show(actor[5], 0)
	SetModeEx( actor[5], EM_SetModeType_HideName, false )
	AddBuff(actor[5], 507555, 1, 86400)
	AddBuff(actor[5], 507556, 1, 86400)
	Show(actor[6], 0)
	SetModeEx( actor[6], EM_SetModeType_HideName, false )
	AddBuff(actor[6], 507555, 1, 86400)
	AddBuff(actor[6], 507556, 1, 86400)

	-- �d���ۤU
	AdjustFaceDir(actor[5], actor[4], 0)
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Sleep(20)

	-- �d�����S�G�o���s���o���I���_�K�K�C
	Yell(actor[5], "[SC_Z25Q426107_1]", 3)
	Sleep(25)

	-- �ҭ�����
	AdjustFaceDir(actor[6], actor[5], 0)
	PlayMotion(actor[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	-- �ү��箦�G�s���F���O���X�A�N�ܡH
	Yell(actor[6], "[SC_Z25Q426107_14]", 3)
	Sleep(25)

	-- �d�����g
	AdjustFaceDir(actor[5], actor[6], 0)
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_EMOTE_APPROVAL)

	-- �d�����S�G�O�û��I[122058]�I[122054]�������Ȩä��O�O�s�A�ӬO��U�o�g���u�s�I
	Yell(actor[5], "[SC_Z25Q426107_15]", 3)
	Sleep(35)

	-- �ҭ��n�\�Y
	PlayMotion(actor[6], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)

	-- �ү��箦�G�O�ڤ���A���F�߸o�A�w���o���s���u�@�N�浹�ڧa�C
	Yell(actor[6], "[SC_Z25Q426107_16]", 3)
	Sleep(30)

	-- �d�����n
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)

	-- �d�����S(�I�Y)�G��A���N�·ЧA�F�C
	PlayMotion(actor[5], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell(actor[5], "[SC_Z25Q426107_17]", 3)
	Sleep(30)

	-- �d������X��37
	_delay = Move(actor[5], GetMoveFlagValue(781272, 37, EM_RoleValue_X), GetMoveFlagValue(781272, 37, EM_RoleValue_Y), GetMoveFlagValue(781272, 37, EM_RoleValue_Z))
	Sleep(_delay)
	Sleep(_delay)
	Hide(actor[5])

	-- �ҭ��n�n�Y
	PlayMotion(actor[6], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(10)
	
	CastSpell( actor[6], actor[4], 498324 ) --850643 )
	Sleep(20)
	-- �ү��箦�G�o�ӥշ����k�H�A�S�Q��T�ҲŤ媺�O�q�o��e���N���ڨ��F�C
	Yell(actor[6], "[SC_Z25Q426107_18]", 3)
	Sleep(10)
	Hide(actor[4])
	Sleep(35)
	Hide(actor[6])
	Sleep(35)
	-- �d�w�������b�b��
--	PlayMotion(actor[3], ruFUSION_ACTORSTATE_FLY_LOOP)

	-- �d�w�����G���F�I�����F�I�ڲ{�b�N�h���F[122058]�I�p���A�N��P�ؤF�a�I
	ScriptMessage(actor[3], -1, 2, "[SC_Z25Q426107_10]", "0xff80ffff")
	Sleep(30)

	-- �d�w���������A�����A�R��  ... �D�h��???
	_delay = Move(actor[3], GetMoveFlagValue(781272, 37, EM_RoleValue_X), GetMoveFlagValue(781272, 37, EM_RoleValue_Y), GetMoveFlagValue(781272, 37, EM_RoleValue_Z))
	Sleep(_delay)
	Hide(actor[3])
	Hide(actor[4])

	-- ����J���H
	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	-- ����J�G��診�Ӥ��O�w���ڡI
	Yell(actor[2], "[SC_Z25Q426107_11]", 3)
	-- �o���O�u��!!
	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(20)

	-- �ɵY��ᴵ
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_THREATEN)

	-- �ɵY��ᴵ�G��򤣬O�H[122068]�����L���U�ӭn���F[122058]�աC
	Yell(actor[1], "[SC_Z25Q426107_12]", 3)
	Sleep(25)

	-- �ɵY��ᴵ�J��
	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Sleep(20)
	-- �ɵY��ᴵ�G�A�̷Q�ݹw���A�ڤ~�[�t[122068]���u�c�ڡv���C�H�H�A���ⱡ�N��F�A�ϥ��ڭn���}�աC
	Yell(actor[1], "[SC_Z25Q426107_13]", 3)
	Sleep(35)

	-- <<�ɵY��ᴵ���U�a�V>>
	--_delay = Move(actor[1], GetMoveFlagValue(781272, 38, EM_RoleValue_X), GetMoveFlagValue(781272, 38, EM_RoleValue_Y), GetMoveFlagValue(781272, 38, EM_RoleValue_Z))
	CastSpell( actor[1], actor[1], 498195 )
	Sleep(35)
	DelObj(actor[1])
	Sleep(10)

	-- ��t�����O�o�n��"�@"!!
	power_director_stop_movie(director)
end