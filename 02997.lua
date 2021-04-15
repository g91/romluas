-----------------------------------------------------------------
--	�d����M�d�����b�e���R�������~��������
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama15()
	Global_BellatiaDuplication:debug("active > fifth boss drama 15 -> function Lua_BellatiaDuplication_FifthBoss_drama15()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�d�Ժ��E�d�ĩi�G��~�ڭ̦b�K�ǻ�����F�H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_01]", time = 1, is_done = false},
	--	�d�����G���I�A�o�p�l�A�G�M�O�~�ӤF�d�ĩi���W���k�H�A��Ԥ��ٯ��ѡH�u�O��A�������@�ӼҼˡC
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_02]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 15 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	if Lua_BellatiaDuplication_check_status(room_id, "drama") then Global_BellatiaDuplication[room_id].drama_step = 16 end

	Global_BellatiaDuplication:debug("fifth boss drama 15 end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	�d����M�d�����b�e���R�������~��������	�H���@
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16a()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16a -> function Lua_BellatiaDuplication_FifthBoss_drama16a()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�d�����G��f�D�Ƽڧ��o�ӤH���䯫��
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_11]", time = 1, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�ү��箦�����˨������@
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_12]", time = 4, is_done = false},
	--	�d�����G��A�L���ЦۨӡA���O�ܧֱo��Z�Ҽڴ�������
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_13]", time = 7, is_done = false},
	--	�d�����G�X�ѹ����A��������C�]���L�����p�A�H���x���զp�}�ˡC
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_14]", time = 10, is_done = false},
	--	�d�����G���L�A�o�]�S����S�O���A�u�O�O�H���Ѭ�����L�n�o�򰵡H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_15]", time = 13, is_done = false},
	--	�d�����G�ڱq�ӴN�S�d���L�A�L���M���H����I�ۤv����U
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_16]", time = 16, is_done = false},
	--	�d�Ժ��G�d�����S���L�ү��箦�l�צb�l�M�j�j���O�q�A�]�\�O���b�L����Q���D��_���s�o�{�H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_17]", time = 19, is_done = false},
	--	�d�Ժ��G�p�G�L���o�{�F����A�����w��N�H���]�|���t�@������d�����S�@�˹J�`
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_18]", time = 22, is_done = false},
	--	�d�����G�S���A�ڷQ�ү��箦���ӴN�O�|���X�o�ب�����|���H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_19]", time = 25, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16a end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	�d����M�d�����b�e���R�������~��������	�H���G
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16b()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16b -> function Lua_BellatiaDuplication_FifthBoss_drama16b()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�d�����G�ڳQ��f�D�Ƽڧ����A�A�M�L�@�_��o�}�ҳq�����P�Ŷ����]�k
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_21]", time = 1, is_done = false},
	--	�d�Ժ��E�d�ĩi�G��ɤ����H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_22]", time = 4, is_done = false},
	--	�d�����G��A�N�O�����N�C
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_23]", time = 7, is_done = false},
	--	�d�����G�ܻ��^�ӡA�ڤ]�����D��ɨs���O����H�̭�������H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_24]", time = 10, is_done = false},
	--	�d�����G�`���A���ɥu�Q�ۧ��]�Ҫ��դO�ʶi���Y�A�����o���Ԫ��N�O�F
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_25]", time = 13, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�A�ܹ��c�Ԫ��O�a�H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_26]", time = 16, is_done = false},
	--	�d�����G�A�Q�����L�F�C�ڥû��O�ݵۨ�L�H�ˤU�����@��
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_27]", time = 19, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�A������ѬO�n��{�o�ƺ��A�A�H�ڪ�ı�A���O���˪��H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_28]", time = 22, is_done = false},
	--	�d�����G�ڵL�k�u���a���h�A�]�N�L�k�u���a���ۡC���o�S�O�t�~�@�ӬG�ƤF...
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_29]", time = 25, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16b end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	�d����M�d�����b�e���R�������~��������	�H���T
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16c()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16c -> function Lua_BellatiaDuplication_FifthBoss_drama16c()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�d�����G���@�̪��o���a�O�����j��������
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_31]", time = 1, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�ڦ��L�H�A��̤����M���`���M�h���S�̴̭N�O�Ӧۥ���
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_32]", time = 4, is_done = false},
	--	�d�����G���O�A���ǬO��f�D�Ƽڧ����ʦa�A���ӮɭԦ�f�D�Ƽڧ��O�L���ƦW
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_33]", time = 7, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�ҥH���@�̫ܦ��N�Q�ү��箦�y�X�ӤF�H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_34]", time = 10, is_done = false},
	--	�d�����G�S���C�{�b�^�Q�_�ӡA�W�q�W�O�����ݾl�]�ڡA���O�n���ܸT�ҲŤ�a�H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_35]", time = 13, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�u�O�N�大���I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_36]", time = 16, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16c end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	�d����M�d�����b�e���R�������~��������	�H���|
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16d()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16d -> function Lua_BellatiaDuplication_FifthBoss_drama16d()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�d�����G�ү��箦���Ť��O�ܯ���
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_41]", time = 1, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�ҥH�S�H���D�L���Ť��O�H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_42]", time = 4, is_done = false},
	--	�d�����G�S���H�C���O�ڤj���q�o��
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_43]", time = 7, is_done = false},
	--	�d�����G�q�ӨS���H��ү��箦���D��h�Ť媺���K
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_44]", time = 10, is_done = false},
	--	�d�����G�����T�ҲŤ媺��O���O��e�����ơA�ݭn�B��άO�ɶ�
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_45]", time = 13, is_done = false},
	--	�d�����G���O�o��ү��箦�ӻ��q�ӴN���O���D�A�ҥH�ڲq�L�i�H���D����Ť媺���
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_46]", time = 16, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�������Ť峣��ߨ��q�H�T��i�H�Q���o���h�F�`�I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_47]", time = 19, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16d end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	�d����M�d�����b�e���R�������~��������	�H����
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16e()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16e -> function Lua_BellatiaDuplication_FifthBoss_drama16e()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�d�����G�b�Z�Ҽڴ����ӮɥN�A�ү��箦�N�w�g��o�X���N�Z��
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_51]", time = 1, is_done = false},
	--	�d�Ժ��E�d�ĩi�G���b�����ĺ����O�и��٨S��
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_52]", time = 4, is_done = false},
	--	�d�����G�ҥH�A�ڷQ���O�b�L��ŧ�d�����S����~�]�p�X�Ӫ�
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_53]", time = 7, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�ڬ����ӬO�o�˨S��
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_54]", time = 10, is_done = false},
	--	�d�����G�u�O�������ƪ��A�]�����N�Z�˰t���@�ƭ���
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_55]", time = 13, is_done = false},
	--	�d�����G�ҥH�S�H���D�ү��箦���o����ҼˡI
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_56]", time = 16, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�ڬݤ���p���A�]�������ĺ��O�Ф����ү��箦�A�M�ɥ��D�v�������o�]���@��
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_57]", time = 19, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16e end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end