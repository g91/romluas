function Lua_BellatiaDuplication_FifthBoss_drama9()
	Global_BellatiaDuplication:debug("active > fifth boss drama 9 -> function Lua_BellatiaDuplication_FifthBoss_drama9()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G����g�L�@�������A�ڷP��q��κZ��
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_105]", time = 1, is_done = false},
	--	�d�����G���I�O�ڥ��o�A���u���y�~���A�P��q��κZ�a�I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_106]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 9 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fifth boss drama 9 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama10()
	Global_BellatiaDuplication:debug("active > fifth boss drama 10 -> function Lua_BellatiaDuplication_FifthBoss_drama10()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�ڪ������ڷP�줣���A�L�{���A���٤�����@�����I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_107]", time = 1, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 10 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fifth boss drama 10 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama11()
	Global_BellatiaDuplication:debug("active > fifth boss drama 11 -> function Lua_BellatiaDuplication_FifthBoss_drama11()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�����������I�A�̪���O�s�ڪ��@�ڤ�������p�I�I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_108]", time = 1, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 11 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fifth boss drama 11 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama12()
	Global_BellatiaDuplication:debug("active > fifth boss drama 12 -> function Lua_BellatiaDuplication_FifthBoss_drama12()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�o���N�ӥh�o���ӥh���a��I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_109]", time = 1, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 12 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fifth boss drama 12 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama13()
	Global_BellatiaDuplication:debug("active > fifth boss drama 13 -> function Lua_BellatiaDuplication_FifthBoss_drama13()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�o�s�V�b�F��I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_110]", time = 1, is_done = false},
	--	�d�����G�������A�]�|�|�ʸܡI�H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_111]", time = 1, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 13 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fifth boss drama 13 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama14()
	Global_BellatiaDuplication:debug("active > fifth boss drama 14 -> function Lua_BellatiaDuplication_FifthBoss_drama14()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss5_success)

	-----------------------------------------------------------------
	--	�M���Y�Ѥ���
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].cores_of_disintegration then
		for index, cores_of_disintegration in pairs(Global_BellatiaDuplication[room_id].cores_of_disintegration) do cores_of_disintegration:delete() end
		Global_BellatiaDuplication[room_id].cores_of_disintegration = nil
	end

	-----------------------------------------------------------------
	--	�M�����adebuff
	-----------------------------------------------------------------
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		for buff_id, buff in pairs(player.buff) do
			if not buff.is_good_buff then player:cancelBuff(buff_id) end
		end
	end
	Sleep(4)
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		for buff_id, buff in pairs(player.buff) do
			if not buff.is_good_buff then player:cancelBuff(buff_id) end
		end
	end

	-----------------------------------------------------------------
	--	�����ȺX��
	-----------------------------------------------------------------
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		if CheckAcceptQuest(player.GUID, 426269) then SetFlag(player.GUID, 548186, 1) end
	end

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	-----------------------------------------------------------------
	--	�i��������
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].morrok.gravity = true
	Global_BellatiaDuplication[room_id].morrok.align_to_surface = true
	Global_BellatiaDuplication[room_id].morrok:setPosition(Global_BellatiaDuplication_FifthBossDrama.drama_flag[5].x - RandRange(10, 20), Global_BellatiaDuplication_FifthBossDrama.drama_flag[5].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[5].z - 40 + RandRange(1, 80))
	Global_BellatiaDuplication[room_id].morrok:addToPartition(room_id)
	Global_BellatiaDuplication[room_id].morrok:addBuff(620842)	-- ���B
	Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, 0)
	Global_BellatiaDuplication[room_id].jill.gravity = true
	Global_BellatiaDuplication[room_id].jill.align_to_surface = true
	Global_BellatiaDuplication[room_id].jill:setPosition(Global_BellatiaDuplication_FifthBossDrama.drama_flag[5].x + RandRange(10, 20), Global_BellatiaDuplication_FifthBossDrama.drama_flag[5].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[5].z - 40 + RandRange(1, 80))
	Global_BellatiaDuplication[room_id].jill:addToPartition(room_id)
	Global_BellatiaDuplication[room_id].jill:addBuff(620842)	-- ���B
	Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, 0)

	Global_BellatiaDuplication[room_id].mansuoruien.strike_back = false
	Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = false
	Global_BellatiaDuplication[room_id].mansuoruien:stopAttack()
	
	local start_time = GetSystime(0)
	local current_time = start_time
	local _npc = {}

	local scripts = {
	--	����J�G���F�촵�먺�����šI
		{speaker = Global_BellatiaDuplication.handler, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_24]", time = 1, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].mansuoruien:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z, 0)
			Sleep(12)
			Global_BellatiaDuplication[room_id].mansuoruien:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].morrok:setPosition(Global_BellatiaDuplication[room_id].mansuoruien.x + 20, Global_BellatiaDuplication[room_id].mansuoruien.y + 16, Global_BellatiaDuplication[room_id].mansuoruien.z)
			Global_BellatiaDuplication[room_id].jill:setPosition(Global_BellatiaDuplication[room_id].mansuoruien.x - 16, Global_BellatiaDuplication[room_id].mansuoruien.y + 16, Global_BellatiaDuplication[room_id].mansuoruien.z + 12)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
			Sleep(4)
			Global_BellatiaDuplication[room_id].morrok:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
			Global_BellatiaDuplication[room_id].jill:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
			Sleep(6)
			Global_BellatiaDuplication[room_id].jill:castSpell(Global_BellatiaDuplication[room_id].mansuoruien, 851037)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_HURT_NORMAL)
		end},
	--	�ү��箦�G�y�I�������ϫ�G�M���P�A���M����L�ڪ�ĵ�٬I�i��ŧ
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_25]", time = 4, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].mansuoruien.fight = false
			Global_BellatiaDuplication[room_id].mansuoruien.strike_back = false
			Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = false
			Global_BellatiaDuplication[room_id].mansuoruien:stopAttack()

			Global_BellatiaDuplication[room_id].morrok.movable = false
			Global_BellatiaDuplication[room_id].jill.movable = false

			Global_BellatiaDuplication[room_id].mansuoruien:addBuff(620842)	-- ���B
			Global_BellatiaDuplication[room_id].mansuoruien:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[6].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[6].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[6].z, 0)
			Sleep(8)
			Global_BellatiaDuplication[room_id].mansuoruien:setPosition(Global_BellatiaDuplication_FifthBossDrama.drama_flag[6].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[6].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[6].z)
			Global_BellatiaDuplication[room_id].mansuoruien:faceTo(Global_BellatiaDuplication[room_id].morrok)
		end},
	--	�ү��箦�G�S���Y�A�ϥ���ɤ����w�g�}�ҡA���ߧڷ|���g���Ӫ�
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_26]", time = 8, is_done = false, action = function()
			_npc[1] = AddyNpc:new()
			_npc[1]:create(122687, Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z)
			_npc[1].mark = false
			_npc[1]:addToPartition(room_id)
		end},
	--	�d�����G�֪���L�I��ӳo�å�Q�}�ҵ�ɤ����A���D�L�O�Q�k��t�@�ӪŶ��h�H�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_27]", time = 10, is_done = false, action = function()
			_npc[2] = AddyNpc:new()
			_npc[2]:create(122688, Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z)
			_npc[2].mark = false
			_npc[2]:addToPartition(room_id)
			Global_BellatiaDuplication[room_id].saisimengde:addToPartition(room_id)
			Global_BellatiaDuplication[room_id].saisimengde:move(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, 1)
			Global_BellatiaDuplication[room_id].saisimengde:castSpell(Global_BellatiaDuplication[room_id].mansuoruien, 851096)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_CAST_INSTANT)
			Global_BellatiaDuplication:sleep(1)
			Global_BellatiaDuplication[room_id].saisimengde:stopMove()
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
		end},
	--	�ɦ�X�w�G�ү��箦�A�ݨӧA�˱o�����ڡH
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_28]", time = 14, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP)
			Global_BellatiaDuplication:sleep(1)
			SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID, ruFUSION_MIME_KNOCKDOWN_LOOP)
		end},
	--	�ɦ�X�w�G�o��e�����H�o��A�@�I�D�ԩʳ��S���C
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_29]", time = 17, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:setPosition(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z + 26)
			Global_BellatiaDuplication[room_id].saisimengde:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
			Global_BellatiaDuplication[room_id].mansuoruien:faceTo(Global_BellatiaDuplication[room_id].saisimengde)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_ATTACK_2H)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_HURT_CRITICAL)
			Sleep(4)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
			Sleep(4)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP)
			_npc[1]:delete()
			_npc[2]:delete()
			Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z, 0)
			Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x - RandRange(20, 40), Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z - RandRange(20, 80), 0)
			Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x + RandRange(20, 40), Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z + RandRange(1, 40), 0)
			Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x - 40 - RandRange(20, 40), Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z + RandRange(1, 40), 0)
		end},
	--	�d�Ժ��D�d�ĩi�G�ɦ�X�w�H�A���|�b�o�̡I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_30]", time = 20, is_done = false, action = function()
			Sleep(15)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].saisimengde)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].saisimengde)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].saisimengde)
			Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_EMOTE_POINT)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_END)
			SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID, ruFUSION_MIME_IDLE_STAND)
		end},
	--	�ү��箦�G��I�A�O�ӳ������ܡH�A�]�H���ڬO�N�Q�G�]�N�ʦL�b��ɡH
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_31]", time = 25, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].mansuoruien:faceTo(Global_BellatiaDuplication[room_id].saisimengde)
			Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_EMOTE_POINT)
		end},
	--	�ү��箦�G�ӥO�ڥ���F�A�ڥ��H���]�N���A�O�̦����Ѫ�
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_32]", time = 29, is_done = false},
	--	�ɦ�X�w�G���I��򴱷�A�ڷ�M���D�A�����p�N��L
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_33]", time = 32, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		end},
	--	�ɦ�X�w�G���ڪ��ؼЬO�A�֦����T�ҲŤ�A�u�O�q�����H�����ѧA�A�ڤ]�N�S���|�U��
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_34]", time = 35, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_POINT)
		end},
	--	�ɦ�X�w�G���{�b�A�h���F�U�칩�O�ۧU�K�K
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_35]", time = 39, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		end},
	--	���ɦ�X�w�N�L���ү��箦������A���O���F����K�K��
		{speaker = Global_BellatiaDuplication.handler, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_36]", time = 42, is_done = false, action = function()
			SetDefIdleMotion(Global_BellatiaDuplication[room_id].saisimengde.GUID,ruFUSION_MIME_BUFF_LOOP)
			SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID,ruFUSION_MIME_CAST_LOOP)
			local _rune = AddyNpc:new()
			_rune:create(121381, Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, Global_BellatiaDuplication[room_id].mansuoruien.direction)
			_rune:addBuff(624592)
			_rune:addBuff(624593)
			_rune:addBuff(624594)
			_rune:addBuff(624595)
			_rune:addBuff(624596)
			_rune.gravity = false
			_rune:addToPartition(room_id)
			Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(624592)
			Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(624593)
			Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(624594)
			Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(624595)
			Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(624596)
			SetDefIdleMotion(_rune.GUID, ruFUSION_MIME_CAST_LOOP)
			_rune:adjustDirection(Global_BellatiaDuplication[room_id].saisimengde.direction)
			_rune:move(Global_BellatiaDuplication[room_id].saisimengde.x, Global_BellatiaDuplication[room_id].saisimengde.y + 50, Global_BellatiaDuplication[room_id].saisimengde.z, 1.5)
			SetDefIdleMotion(_rune.GUID, ruFUSION_MIME_IDLE_STAND)
			_rune:move(Global_BellatiaDuplication[room_id].saisimengde.x, Global_BellatiaDuplication[room_id].saisimengde.y, Global_BellatiaDuplication[room_id].saisimengde.z, 1)
			_rune:delete()
		end},
	--	�ү��箦�G�A�n�o�ǸT�ҲŤ�]�S�Ϊ��I�u���گ�P�ɵo�����̪��O�q�I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_37]", time = 45, is_done = false, action = function()
		end},
	--	�ɦ�X�w�G�M�A�̳o���]�ڤ@�˪��Ϊk�H���Z�����O�F�A�o�i�O�D�H��_�k�Ӫ����n����
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_38]", time = 48, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		end},
	--	�ɦ�X�w�G���L�o�����A���ơA���Q�Q�ۤv�a�C�A��ߡA�ڤ��|���A
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_39]", time = 51, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_CAST_INSTANT)
			Global_BellatiaDuplication[room_id].mansuoruien.gravity = false
			Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(624668)
			Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624670)
		end},
	--	�ɦ�X�w�G�����w�A��b������ڧ���h�T�ҲŤ�C�u�O�K�K�S�F���N�Z�ˡA�A�ଡ�U�ӶܡH
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_40]", time = 54, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
			local _treasure = AddyNpc:new()
			_treasure:create(Global_BellatiaDuplication_FifthBoss.treasure_orgid, Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z)
			_treasure.movable = false
			_treasure.strike_back = false
			_treasure.search_enemy = false
			_treasure.fight = true
			_treasure:addToPartition(room_id)
			_treasure:addBuff(624461)
			_treasure:addBuff(624462)
			Global_BellatiaDuplication[room_id].mansuoruien:delete()
	--		���ٸ�
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if CountBodyItem(player.GUID, 530970) == 0 then GiveBodyItem(player.GUID, 530970, 1) end
			end
		end},
	--	�ɦ�X�w�G�گu���ܳ��w�A�̳o�ǷF�l�Q�����å�A����٦��ܦh���|�i�H�X�@�A�h�h�O���a
		{speaker = Global_BellatiaDuplication[room_id].saisimengde, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_41]", time = 57, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].saisimengde:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].saisimengde:playMotion(ruFUSION_ACTORSTATE_EMOTE_LAUGH)
			Global_BellatiaDuplication[room_id].saisimengde:delFromPartition()
			Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.after_saisimengde_leave)
		end}
	}
	local close_players = {}

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker == Global_BellatiaDuplication.handler then
					for index, player in pairs(Global_BellatiaDuplication[room_id].players) do script.speaker:scriptMessage(player, "[$MUTE]"..script.content, 3) end
				else script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		-----------------------------------------------------------------
		--	�ɦ�X�w�h��a�񪺪��a
		-----------------------------------------------------------------
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
			if player:distanceTo(Global_BellatiaDuplication[room_id].saisimengde) < 120 then
				table.insert(close_players, player)
			end
		end
		if #close_players > 0 then
			for index, player in pairs(close_players) do
				Global_BellatiaDuplication[room_id].saisimengde:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_WARNING]", 2)
				Global_BellatiaDuplication[room_id].saisimengde:systemCastSpell(player, 851100)
				player:setPosition(player.x, player.y, player.z - 40, player.direction)
				player:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
			end
			close_players = {}
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	for index, npc in pairs(_npc) do npc:delete() end

	if scripts[#scripts].is_done then
		Lua_BellatiaDuplication_change_status(room_id, "success")
		Lua_BellatiaDuplication_change_save_point(room_id, 11)
	end
	Global_BellatiaDuplication[room_id].door_before_boss5:delFromPartition()

	Global_BellatiaDuplication[room_id].drama_step_trigger = true
	Global_BellatiaDuplication:debug("info> fifth boss drama 14 end")
end