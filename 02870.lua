function Lua_122038_speak()
	local player = OwnerID()
	local npc = TargetID()

	if CheckScriptFlag(player, 547702) then					-- �p�G�����Ȫ��~�ѥ���
		LoadQuestOption(player)
		return
	end

	if CheckAcceptQuest(player, 426102)  then					-- ��t�@���}�l
		if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- ��t���G�N��{�b�ݰ_�Ӥ����i�H���q���ˤl �A�A�ݷ|�A�L�ӧa�C
			SetSpeakDetail(player, "[SC_Z25Q426102_AN_3]")
			return
		end
		SetSpeakDetail(player, "[SC_Z25Q426102_AN_1]")				-- �ڸ�N�෾�q�������A�A���b���䵥�@�U�C
		AddSpeakOption(player, npc, "[SC_Z25Q426102_AN_2]", "Lua_122038_drama", 0)--�ڪ��D�F�C
		return
	end

	SetSpeakDetail(player, "[SC_Z25Q426102_AN_4]")				-- �p�G�S����t���ȶǦ^�@���ܡG�N��]�өT���F�A������o�N����q���pĳ�H�o�˪��b�@�ɦ�����n�B�H
	LoadQuestOption(player)
end

function Lua_122038_drama()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- ��t���G�N��{�b�ݰ_�Ӥ����i�H���q���ˤl �A�A�ݷ|�A�L�ӧa�C
		SetSpeakDetail(player, "[SC_Z25Q426102_AN_3]")
		return
	end
	get_multiplayer(npc, player, 100, 1, {complete = "Lua_122038_drama_setting"})
	CloseSpeak(player)
end

function Lua_122038_drama_setting(event)
	local director = event.register
	local players = event.players
	local cast = {
		{id = 122039, flag = 781272, pid = 5},	-- 1. ����J�D��L�S, �X�l�s��5
		{id = 122041, flag = 781272, pid = 6}	-- 2. �N��D��J��, �X�l�s��6
--		{name = "jill", id = 122041, flag = 781272, pid = 6, mode = {EM_SetModeType_Obstruct, true}}
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
		"Lua_122038_drama_script",
		{start = "Lua_122038_drama_start",		-- ��t�}�l�ƥ�
		 interrupt = "Lua_122038_drama_interrupt",	-- ���a���_�ƥ�
		 complete = "Lua_122038_drama_complete",	-- ��t�����ƥ�
		 playing = "Lua_122038_drama_playing"		-- ��t���C��ƥ�
		}
	)
end

function Lua_122038_drama_start(event)
	local players = event.players
	for index, player in pairs(players) do
		-- ��tbuff
		Lua_StopBGM(player)
		local MusicID = PlaySoundToPlayer(player, "music/zone/005/zone005_night_02.mp3", false)
		WriteRoleValue(event.director, EM_RoleValue_Register2, MusicID)
		AddBuff(player, 624068, 1, -1 )
	end
end

function Lua_122038_drama_interrupt(event)
	-- Ĳ�o���_�ƥ󪺪��aguid
	DebugMsg(0, 0, "event >> Lua_122038_drama_interrupt. player")
end

function Lua_122038_drama_complete(event)
	local players = event.players
	for index, player in pairs(players) do
		-- �����ȩMbuff�~�|�����y
		if CheckAcceptQuest(player, 426102) and CheckBuff(player, 624068) then
			-- ����
			GiveBodyItem(player, 547702, 1)
			-- ������tbuff
			CancelBuff(player, 624068)
		end
		local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
		StopSound(player, MusicID)
		Lua_PlayBGM(player)
	end
end

function Lua_122038_drama_playing(event)
	local director = event.director
	local players = event.players
	for index, player in pairs(players) do
		if CheckBuff(player, 624068) then
			if not CheckDistance(player, director, 150) then
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_5]", 0)
			end
			if not CheckDistance(player, director, 250) then
				-- �Z���L���A���ȥ���
				-- ������tbuff
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_6]", 0)
				CancelBuff(player, 624068)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
			-- �������ȫ�M����t
			if not CheckAcceptQuest(player, 426102) then
				CancelBuff(player, 624068)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
		end
	end
end

-- �����禡�A�ѼƦ� director, actor, players�A�ɺtguid, �t��table, �[��table
function Lua_122038_drama_script(director, actor, players)

	AddBuff(actor[2], 624175, 1, -1)

	Say(actor[2], "[SC_Z25Q426102_1]")							-- �N��G��}�ڡA�A�o�Ө������å�I
	Sleep(25)

	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)			-- �n�Y�ʧ@
	Say(actor[1], "[SC_Z25Q426102_2]")							-- ����J�G�ڥu�O�Q�A��p�ͤ@�͡C
	Sleep(25)

	AdjustDir(actor[2], 30);							--��V
	Say(actor[2], "[SC_Z25Q426102_3]")							-- �N��G�ͤ@�͡H�{�b�~�Q�ͤ@�͡H
	Sleep(25)

	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)		 		-- "��"�ʧ@
	Say(actor[2], "[SC_Z25Q426102_4]")							-- �N��G�ҫk�Q�s�ڱa���ɡA�A�N�����[�C
	Sleep(25)

	Say(actor[2], "[SC_Z25Q426102_5]")							-- �N��G�ҫk�Q�s�ګʦL��A�A���r�����C
	Sleep(25)

	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_CRY)		 		-- "��"�ʧ@
	Say(actor[2], "[SC_Z25Q426102_6]")							-- �N��G�b�o���e�A�ڭ̥H���J��F�P���A�J���F�Ʊ�......�C
	Sleep(30)

	Say(actor[2], "[SC_Z25Q426102_7]")							-- �N��G�{�b......���A���@���A�ڭ��٦�����n�ͪ��H
	Sleep(30)

	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)				-- ��������
	Say(actor[1], "[SC_Z25Q426102_8]")							-- ����J�G�N��Ať�ڻ�......
	Sleep(20)

	Say(actor[2], "[SC_Z25Q426102_9]")							-- �N��G�S����n�����I��}�ڡI�I
	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_ANGRY)				-- �Ѷ}����!!!!!
	Sleep(25)
	CancelBuff(actor[2], 624175)								-- �Ѱ�buff

	Say(actor[2], "[SC_Z25Q426102_10]")							-- �N��G��A�A���p�ޭǬO�x����ڪ��I
	Sleep(25)

	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)		 		-- "��"�ʧ@
	Say(actor[2], "[SC_Z25Q426102_11]")							-- �N��G�s�ڤ]�O�I�ڱN�|���F�����B�s�A���Ҧ��s���|�|���إ��h�������C
	Sleep(35)

	WriteRoleValue(actor[2], EM_RoleValue_IsWalk, 1)
	local _delay = Move(actor[2], GetMoveFlagValue(781272, 7, EM_RoleValue_X), GetMoveFlagValue(781272, 7, EM_RoleValue_Y), GetMoveFlagValue(781272, 7, EM_RoleValue_Z))
	Sleep(_delay)
	DelObj(actor[2])
	sleep(30);

	-- ��t�����O�o�n��"�@"!!
	power_director_stop_movie(director)
end

--[[
--�Ｏ��J�ϥ�
/gm ? runplot %T_ID Lua_122038_clear
--]]
function Lua_122038_clear()--���ե�(�_�쪬�A)

	local Morake=OwnerID();
	local player=TargetID();
	local roomid=ReadRoleValue(player, EM_RoleValue_RoomID);
	
	--�M���W�����G(���a)
	CancelBuff_NoEvent(player, 624068);
	SetFlag(player, 547702, 0);
	
	--�M���W�@�������G(NPC)
	local IsPlaying=EM_RoleValue_Register1;
	WriteRoleValue(Morake, IsPlaying, 0);
	local TriggerPlayerID=EM_RoleValue_Register2;
	WriteRoleValue(Morake, TriggerPlayerID, 0);
	
	--�ŧi�ܼ�
	local _list={122039, 122041};
	local time=table.getn(_list);
	local total = SetSearchAllNPC(roomid);
	for pos=1, total, 1 do
		local who=GetSearchResult();
		local orgid=ReadRoleValue(who, EM_RoleValue_OrgID);
		for i=1, time, 1 do
			if orgid==_list[i] then
				DelObj(who);
			end
		end
	end
end