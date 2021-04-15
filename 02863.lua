--	����Lua_426121_drama_queue()�i�J426121[�s�ڪ�t�ݨD]����t�C
--	Lua_426121_drama_queue()�|�����֬O�Ĥ@�쪱�a�A��Ӫ��a��@master�A��L���a�N�Oguest�C
--	��t�i�׳����master���A��Lguest�|���_�ݵ�master��t�����@�_�i�JLua_426121_drama_result()

function Lua_426121_drama()
	local player = OwnerID()
	Lua_426121_drama_queue()
	CloseSpeak(player)
end

function Lua_426121_drama_queue()													-- 426121 - [�s�ڪ�t�ݨD]���ƶ��ݪ�t�禡
	local player = OwnerID()
	local handler_guid = TargetID()

	if ReadRoleValue(handler_guid, EM_RoleValue_Register2) == 0 then								-- �p�G�ثe�S�����a�n���Y���t�A�n�����a
		WriteRoleValue(handler_guid, EM_RoleValue_Register2, player)								-- EM_RoleValue_Register2 �s��Ĥ@�����Ӫ�t�����a
	end

	AddBuff(player, 624059, 0, 60 )												-- ��t��buff�A�ݨ��t���A���å���npc
	AddBuff(player, 620001, 0, 2)												-- �¹�
	SetPos(															-- ���a���ʨ�0���X�m
		player,
		GetMoveFlagValue(781000, 0, EM_RoleValue_X),
		GetMoveFlagValue(781000, 0, EM_RoleValue_Y),
		GetMoveFlagValue(781000, 0, EM_RoleValue_Z),
		GetMoveFlagValue(781000, 0, EM_RoleValue_Dir)
	)

	if ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 1 or ReadRoleValue(handler_guid, EM_RoleValue_Register2) ~= player then		-- EM_RoleValue_Register1 == 1 �O��t��
		CallPlot(player, "Lua_426121_drama_guest", handler_guid)
	elseif ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 0 and ReadRoleValue(handler_guid, EM_RoleValue_Register2) == player then		-- �S����t��
		CallPlot(handler_guid, "Lua_426121_drama_play")
		CallPlot(player, "Lua_426121_drama_master", handler_guid)
	else																			-- ��L���p
		DebugMsg(0, 0, "Register1 (is_player) = " .. ReadRoleValue(handler_guid, EM_RoleValue_Register1) .. ", Register2 (regist player) = " .. ReadRoleValue(handler_guid, EM_RoleValue_Register2))
	end
end

function Lua_426121_drama_play()
	local handler = {														-- ��thandler�O���Ҧ��t��
		guid = OwnerID(),
		flag = 781000,
		actor = {}
	}
	WriteRoleValue(handler.guid, EM_RoleValue_Register1, 1)				-- EM_RoleValue_Register1 �O���ثe��t���p�A0�O�S��t�A1�O��t��

	Lua_426121_drama_initialize(handler)		-- ��l�ƺt��
	Sleep(30)					-- ���ݺt�����W����
	Lua_426121_drama_script(handler)		-- �}�l��t

	WriteRoleValue(handler.guid, EM_RoleValue_Register2, 0)	
	WriteRoleValue(handler.guid, EM_RoleValue_Register1, 0)				-- is_playing = false
	Sleep(30)
	Lua_426121_drama_get_lunch(handler)		-- �t����K��
end

function Lua_426121_drama_master(handler_guid)											-- ��thandler�A�C����t���|����Ĥ@�쪱�a��@master�A�i�׸��master��
	local player = OwnerID()


	Lua_StopBGM(player)
	local MusicID = PlaySoundToPlayer(player, "music/zone/016/ZONE/sacral_10_LE_turint.mp3", false)

	while ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 1 do								-- �p�G��t���N�����t�����A�~��
		Sleep(10)
	end

	StopSound(player, MusicID)
	Lua_PlayBGM(player)

	Lua_426121_drama_result(handler_guid, player)										-- �Y�৹��t�����G
end

function Lua_426121_drama_guest(handler_guid)											-- �p�G�w�g��master�A��L�A�[�J�����a�N�Oguest�C
	local player = OwnerID()

	Lua_StopBGM(player)
	local MusicID = PlaySoundToPlayer(player, "music/zone/016/ZONE/sacral_10_LE_turint.mp3", false)

	while ReadRoleValue(handler_guid, EM_RoleValue_Register1) == 1 do								-- �p�G��t���N�����t�����A�~��
		Sleep(10)
	end

	StopSound(player, MusicID)
	Lua_PlayBGM(player)

	Lua_426121_drama_result(handler_guid, player)										-- �Y�৹��t�����G
end

function Lua_426121_drama_result(handler_guid, player)										-- �Ѱ�buff�A�����Y���t�������~
		ScriptMessage(handler_guid, 0, 2, "[SC_426121_17]", C_SYSTEM)							-- �t�Φr��G���j���s�v�½ϥͤ��a���h
		AddBuff(player, 620001, 1, 2)										-- �¹�
	if CheckBuff(player, 624059) and CheckAcceptQuest(player, 426121) then
		GiveBodyItem(player, 547720, 1)												-- �������ȱ���
		GiveBodyItem(player, 547693, 1)												-- ���å���NPC�X�m
		CancelBuff(player, 624059)													-- �h��tbuff
	end
end

function Lua_426121_drama_initialize(handler)			-- ��l��426121 - [�o����O�n�m������ù��]��t
	local actor_list = {					-- �U�Ӻt����OrgID�M�n��pid
		{id = 122003, pid = 1},					-- 1. �d�Ժ�, �X�l�s��1
		{id = 122004, pid = 2},					-- 2. �º�, �X�l�s��2
		{id = 122005, pid = 3},					-- 3. �d����, �X�l�s��3
		{id = 122006, pid = 4},					-- 4. �Ǵ����J����, �X�l�s��4
		{id = 122007, pid = 5},					-- 5. ��Z�g, �X�l�s��5
		{id = 122008, pid = 6},					-- 6. ����J, �X�l�s��6
		{id = 122009, pid = 7},					-- 7. �ä�, �X�l�s��7
		{id = 122010, pid = 8},					-- 8. �K���R, �X�l�s��8
		{id = 121972, pid = 9},					-- 9. �N��, �X�l�s��9
	}

	if #handler.actor ~= 0 then				-- �p�G���ݾl�t���A�ѱ�
		Lua_426121_drama_get_lunch(handler)
	end

	for index, _actor in pairs(actor_list) do			-- �ھ�actor�C��v�@���ͺt��
		handler.actor[index] = create_object(
			_actor.id,								-- �t��id
			GetMoveFlagValue(handler.flag, _actor.pid, EM_RoleValue_X),		-- �t����m
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

function Lua_426121_drama_get_lunch(handler)						-- ���t����K��
	for index, _actor in pairs(handler.actor) do
		DelObj(_actor)
	end
	handler.actor = {}
end

function Lua_426121_drama_script(handler)

	local actor = handler.actor

	ScriptMessage(actor[1], 0, 2, "[SC_426121_01]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�ڭ̪��B�͡A����ù
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_02]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G���M���b�F�A���O�K
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_03]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�L���^�i�����v�A�����D�b�ڭ̪��ߤ��K
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_04]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G���ڭ̷q���Ǵ��g�A�����ͩR�K
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_05]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�L�̪��묹�A���ӧڭ̪�����K
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_06]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�ڭ̭I�t�ۥL�̪��Ʊ�K
	Sleep(30)

	Show(actor[9], 0)										-- �N��X�{
	local _delay = Move(									-- �N�ਫ��X��10
		actor[9],
		GetMoveFlagValue(handler.flag, 10, EM_RoleValue_X),
		GetMoveFlagValue(handler.flag, 10, EM_RoleValue_Y),
		GetMoveFlagValue(handler.flag, 10, EM_RoleValue_Z)
	)
	Sleep(_delay + 5)
--	AdjustFaceDir(actor[9], actor[1], 0)							-- �N�ୱ��d�Ժ�
	AdjustFaceDir(actor[8], actor[9], 0)							-- �e���R����N��
	PlayMotion(actor[8], ruFUSION_ACTORSTATE_ATTACK_2H)					-- ����
	ScriptMessage(actor[8], 0, 2, "[SC_426121_07]", C_SYSTEM)				-- �e���R�G�q�{�I�O�p�`������ù���I
	Sleep(30)
	AdjustFaceDir(actor[4], actor[9], 0)							-- �Ǵ�����N��
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_EMOTE_POINT)
	ScriptMessage(actor[4], 0, 2, "[SC_426121_08]", C_SYSTEM)				-- �Ǵ��D���J���ҡG�p������J�o�̡I
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_09]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�U��I�ڬ۫H�N�ण�O�G�N���N�~�o�ͪ�
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_10]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�ڬ۫H�o�����L�A���Ӥ���U��֡A
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_11]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�ӳo�̧a�A�p�Ө��o�̫�@���C
	Sleep(30)

	_delay = Move(										-- �N�ਫ��X��11
		actor[9],
		GetMoveFlagValue(handler.flag, 11, EM_RoleValue_X),
		GetMoveFlagValue(handler.flag, 11, EM_RoleValue_Y),
		GetMoveFlagValue(handler.flag, 11, EM_RoleValue_Z)
	)
	Sleep(_delay + 5)
--	AdjustFaceDir(actor[9], actor[1], 0)							-- �N�ୱ��d�Ժ�

	ScriptMessage(actor[1], 0, 2, "[SC_426121_06]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�ڭ̭I�t�ۥL�̪��Ʊ�K
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_12]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G����n��o�ӧQ�A�Ӽ������ǾԦ����`�F
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_13]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�N��A�p�@�N�^���p���A���ڭ̮ĤO�ܡH
	Sleep(30)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_14]", C_SYSTEM)				-- �d�Ժ��D�d�ĩi�G�ڷQ�o���ӬO����ù�����@�a
	Sleep(30)

	_delay = Move(										-- �N�ਫ��X��11
		actor[9],
		GetMoveFlagValue(handler.flag, 12, EM_RoleValue_X),
		GetMoveFlagValue(handler.flag, 12, EM_RoleValue_Y),
		GetMoveFlagValue(handler.flag, 12, EM_RoleValue_Z)
	)
	Sleep(_delay + 5)
--	AdjustFaceDir(actor[9], actor[1], 0)							-- �N�ୱ��d�Ժ�

	AdjustFaceDir(actor[8], actor[1], 0)
	PlayMotion(actor[8], ruFUSION_ACTORSTATE_DODGE)
	ScriptMessage(actor[8], 0, 2, "[SC_426121_15]", C_SYSTEM)				-- �e���R�G�H���I�H
	AdjustFaceDir(actor[4], actor[1], 0)
	PlayMotion(actor[4], ruFUSION_ACTORSTATE_DODGE)
	ScriptMessage(actor[4], 0, 2, "[SC_426121_15]", C_SYSTEM)				-- ���J���ҡG�H���I�H
	Sleep(20)

	ScriptMessage(actor[1], 0, 2, "[SC_426121_16]", C_SYSTEM)				-- �N��G�ڷ|�Χڪ��覡�Ӱ����v
	Sleep(20)

end