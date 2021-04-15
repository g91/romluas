-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	�d�ĩi���
-----------------------------------------------------------------
function Lua_BellatiaDuplicationCassamSpeak()
	Global_BellatiaDuplication:debug("speak > cassam")

	local player = AddyPlayer:new(OwnerID())
	local room_id = player.room_id
	local cassam = Global_BellatiaDuplication[room_id].cassam
	cassam.register9 = player.GUID
	if cassam.register9 ~= OwnerID() then cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end

	-----------------------------------------------------------------
	--	��s��T
	--	��s�ϰ����
		Lua_BellatiaDuplication_update_global(room_id)
		local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------

	Lua_BellatiaDuplication_change_status(room_id, "standby")
	cassam:playMotion(ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	-----------------------------------------------------------------
	--	�d�ĩi��ܿﶵ
	-----------------------------------------------------------------
	if save_point == 1 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_1]") return
	elseif save_point == 4 and Global_26IN_Boss2AlreadyBEdefeat and Global_26IN_Boss2AlreadyBEdefeat[room] then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_5]") return
	elseif save_point == 4 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_4]") return
	elseif save_point == 5 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_6]") return
	elseif save_point == 6 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_7]") return
	elseif save_point == 7 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_8]") return
	elseif save_point == 8 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_9]") return
	elseif save_point == 9 then
		cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_CASSAM_1]")
		cassam:addSpeakOption("[SC_BELLATIA_DUOLICATION_CASSAM_1_OPTION]", "Lua_BellatiaDuplicationcassamSpeak1")
		return
	elseif save_point == 10 then
		cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_CASSAM_2]")
		cassam:addSpeakOption("[SC_BELLATIA_DUOLICATION_CASSAM_2_OPTION]", "Lua_BellatiaDuplicationcassamSpeak2")
		return
	elseif save_point == 11 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_END]")
	end
end
function Lua_BellatiaDuplicationCassamSpeak1()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication[room_id].cassam.register9 ~= OwnerID() then Global_BellatiaDuplication[room_id].cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	Global_BellatiaDuplication[room_id].cassam:closeSpeak()
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_begin")
end
function Lua_BellatiaDuplicationCassamSpeak2()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication[room_id].cassam.register9 ~= OwnerID() then Global_BellatiaDuplication[room_id].cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	Global_BellatiaDuplication[room_id].cassam:closeSpeak()
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_active")
end

-----------------------------------------------------------------
--	��t�]�w
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama_setting()
	Global_BellatiaDuplication:debug("active > fifth boss drama setting -> function Lua_BellatiaDuplication_FifthBoss_drama_setting()")

	Global_BellatiaDuplication_FifthBossDrama = {}
	Global_BellatiaDuplication_FifthBossDrama.delay = 0.5
	Global_BellatiaDuplication_FifthBossDrama.drama_flag = AddyFlagGroup:new(781295)
	Global_BellatiaDuplication_FifthBossDrama.route_flag = AddyFlagGroup:new(781293)
end

-----------------------------------------------------------------
--	�����{���a������J�N��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_begin()
	Global_BellatiaDuplication:debug("active > fifth boss drama 1 -> function Lua_BellatiaDuplication_FifthBoss_begin()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_change_status(room_id, "drama")

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	Global_BellatiaDuplication[room_id].mansuoruien:setPosition(Global_BellatiaDuplication_FifthBossDrama.drama_flag[1].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[1].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[1].z)
	Global_BellatiaDuplication[room_id].mansuoruien:addToPartition(room_id)
	Global_BellatiaDuplication[room_id].mansuoruien:faceTo(Global_BellatiaDuplication[room_id].morrok)

	--	�ү��箦�G�S�Q�쨹�عp�i����ܦۧڤF�_�A�N�ڱ�������������p�������R���K�K
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_01]", 5)

	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Sleep(30)

	--	�ү��箦�G�ڪ��p�����ӬO�������A������u�s�@�ӭӳ��b��ê�ڡI
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_02]", 5)
	Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_ATTACK_2H)
	Sleep(30)

	--	�N��E��J���G�ү��箦�A�촵��R�����ŨëD�A��x���A�A���p���N�줵�Ѭ���I
	Global_BellatiaDuplication[room_id].jill:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_03]", 5)
	Global_BellatiaDuplication[room_id].jill:playMotion(ruFUSION_ACTORSTATE_ATTACK_1H_SP)
	Sleep(30)

	--	�ү��箦�G�p�o�ӫq�{����ˬO���p�A���O�Q�n�P�ڬ��ġA�A���ٶ��Ӧ��I
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_04]", 5)
	Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(30)

	Global_BellatiaDuplication[room_id].mansuoruien.movable = true
	Global_BellatiaDuplication[room_id].mansuoruien.gravity = false
	Global_BellatiaDuplication[room_id].mansuoruien.align_to_surface = false
	Global_BellatiaDuplication[room_id].morrok.gravity = false
	Global_BellatiaDuplication[room_id].morrok.align_to_surface = false
	Global_BellatiaDuplication[room_id].jill.gravity = false
	Global_BellatiaDuplication[room_id].jill.align_to_surface = false

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID, ruFUSION_MIME_RUN_FORWARD)
	Global_BellatiaDuplication[room_id].mansuoruien:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].x - 50 + RandRange(1, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].y + RandRange(80, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].z - 50 + RandRange(1, 100), 0)
	Sleep(5)

	--	�N��E��J���G�d��L�I
	Global_BellatiaDuplication[room_id].jill:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_05]", 5)
	Global_BellatiaDuplication[room_id].jill:playMotion(ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)

	--	����J�E��L�S�G�A�̯d�U�լd�A�γ\�ү��箦�ٯd�����򳱿ѡI
	Global_BellatiaDuplication[room_id].morrok:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_06]", 5)
	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].cassam)
	Global_BellatiaDuplication[room_id].morrok:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(5)

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].morrok.GUID, ruFUSION_MIME_RUN_FORWARD)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].jill.GUID, ruFUSION_MIME_RUN_FORWARD)
	Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].x - 50 + RandRange(1, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].y + RandRange(60, 80), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].z - 50 + RandRange(1, 100), 0)
	Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].x - 50 + RandRange(1, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].y + RandRange(50, 70), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].z - 50 + RandRange(1, 100), 0)

	Sleep(20)

	Global_BellatiaDuplication[room_id].mansuoruien:delFromPartition()
	Global_BellatiaDuplication[room_id].morrok:delFromPartition()
	Global_BellatiaDuplication[room_id].jill:delFromPartition()

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID, ruFUSION_MIME_IDLE_STAND)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].morrok.GUID, ruFUSION_MIME_IDLE_STAND)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].jill.GUID, ruFUSION_MIME_IDLE_STAND)

	Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication.npc_initial_position_flag[104].x, Global_BellatiaDuplication.npc_initial_position_flag[104].y, Global_BellatiaDuplication.npc_initial_position_flag[104].z, 0)
	Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication.npc_initial_position_flag[105].x, Global_BellatiaDuplication.npc_initial_position_flag[105].y, Global_BellatiaDuplication.npc_initial_position_flag[105].z)
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:move(Global_BellatiaDuplication.npc_initial_position_flag[108].x, Global_BellatiaDuplication.npc_initial_position_flag[108].y, Global_BellatiaDuplication.npc_initial_position_flag[108].z)

	Lua_BellatiaDuplication_change_save_point(room_id, 10)
	Lua_BellatiaDuplication_change_status(room_id, "standby")

	Global_BellatiaDuplication:debug("fifth boss drama begin end")
end

-----------------------------------------------------------------
--	�X�o�e���
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama1()
	Global_BellatiaDuplication:debug("active > fifth boss drama 1 -> function Lua_BellatiaDuplication_FifthBoss_drama1()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[1] = true

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:faceTo(Global_BellatiaDuplication[room_id].cassam)

	local scripts = {
	--	�k��ù�S�G�ڱq���X���̹ܨ��������ܡA�ү��箦���@�ӳ��I���p�����b�i��C
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec_sungchili, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_07]", time = 2, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].feitlautrec_sungchili)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec_sungchili)
			Global_BellatiaDuplication[room_id].feitlautrec_sungchili:playMotion(ruFUSION_ACTORSTATE_PARRY_UNARMED)
		end},
	--	�k��ù�S�G�p�����Ա��ä��M���A���b�q�D���Y�����޲����K�ǡA�i�H�P����@�ѫD��M�`���j�j��q���b�ֿn�C
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec_sungchili, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_08]", time = 5, is_done = false},
	--	�d�����Gť�_�ӥi���ӧ��ڡI�H���A�o���q�O���v�d���ٵ��A�A�ڭ̲{�b�ӫ���H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_09]", time = 8, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
			Sleep(4)
			Global_BellatiaDuplication[room_id].kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP)
		end},
	--	�d�Ժ��E�d�ĩi�G���Ӫk��ù�S�����k�A���ү��箦����ʤ�������C
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_10]", time = 11, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_END)
			Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		end},
	--	�d�Ժ��E�d�ĩi�G�ڭ��~��e�i�I�k��ù�S�A�A�i�H���ڭ̳q���b�Ť�������J�L�̶ܡH
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_11]", time = 14, is_done = false},
	--	�k��ù�S�G�n�a�I�쥻�ڷQ�˦۱аV�ү��箦���A�o�Ӿ��|�u�n�����A�̤F�I
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec_sungchili, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_12]", time = 17, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].feitlautrec_sungchili:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[3].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[3].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[3].z)
			Global_BellatiaDuplication[room_id].feitlautrec_sungchili:delFromPartition()
			Global_BellatiaDuplication[room_id].cassam.movable = true
			Global_BellatiaDuplication[room_id].kangersy.movable = true
			Global_BellatiaDuplication[room_id].door_before_boss5:delFromPartition()
	--		�����~������Ĥ@�q
			Global_BellatiaDuplication[room_id].drama_step = 15
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 1 do
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

	Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss5_beginning)

	--	����
	table.insert(Global_BellatiaDuplication[room_id].drama_npcs, Global_BellatiaDuplication[room_id].kangersy)
	table.insert(Global_BellatiaDuplication[room_id].drama_npcs, Global_BellatiaDuplication[room_id].cassam)
	Global_BellatiaDuplication[room_id].cassam.move_target = nil
	Global_BellatiaDuplication[room_id].kangersy.move_target = nil
	local is_arrived = false
	Global_BellatiaDuplication:debug("npcs start move")
	while Lua_BellatiaDuplication_check_status(room_id, "drama") and not is_arrived do
		for index, npc in pairs(Global_BellatiaDuplication[room_id].drama_npcs) do
			if #npc.hate_list <= 0 then
				if not npc.move_target then
					npc.move_target = Global_BellatiaDuplication_FifthBossDrama.route_flag[1]
					for flag_index, flag in ipairs(Global_BellatiaDuplication_FifthBossDrama.route_flag) do
						if flag:distanceTo(npc) < npc.move_target:distanceTo(npc) then npc.move_target = flag end
					end
					Global_BellatiaDuplication:debug(npc.GUID .. " move.target : flag" .. "[" .. npc.move_target.index .. "]")
					if Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1] and
					   CheckLine(npc.GUID, Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1].x, Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1].y, Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1].z) then
						npc.move_target = Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1]
					end
				end
				if npc.move_target:isInheritorOf("Flag") and npc.move_target:distanceTo(npc) < 30 then npc.move_target = Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1] end
			elseif #npc.hate_list > 0 then npc.move_target = nil end
			for another_index, another in pairs(Global_BellatiaDuplication[room_id].drama_npcs) do
				if another.GUID ~= npc.GUID and not another.move_target then npc.move_target = another end
			end
			if npc.move_target then npc:move(npc.move_target.x - 15 + RandRange(1, 30), npc.move_target.y, npc.move_target.z - 15 + RandRange(1, 30), 0) end
		end
		if Global_BellatiaDuplication_FifthBossDrama.route_flag[#Global_BellatiaDuplication_FifthBossDrama.route_flag]:distanceTo(Global_BellatiaDuplication[room_id].kangersy) < 80 and
		   Global_BellatiaDuplication_FifthBossDrama.route_flag[#Global_BellatiaDuplication_FifthBossDrama.route_flag]:distanceTo(Global_BellatiaDuplication[room_id].cassam) < 80 then
			Global_BellatiaDuplication:debug("cassam and kangersy arrived")
			Global_BellatiaDuplication[room_id].drama_step = 2
			is_arrived = true
		end
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end
	Global_BellatiaDuplication:debug("npcs stop move")

	Global_BellatiaDuplication:debug("fifth boss drama 1 end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

function Lua_BellatiaDuplication_FifthBoss_drama2()
	Global_BellatiaDuplication:debug("active > fifth boss drama 2 -> function Lua_BellatiaDuplication_FifthBoss_drama2()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[2] = true

	--	�d�����G���ŦA��
	Global_BellatiaDuplication[room_id].kangersy:say("[SC_BELLATIA_FIFTHADVANCE_END]", 5)

	Global_BellatiaDuplication[room_id].mansuoruien.movable = true
	Global_BellatiaDuplication[room_id].mansuoruien:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z, 0)

	--	�ү��箦�G���h���Ϫ����U�A�A�̥H���ۤv�٦�����Ӻ�H
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_13]", 5)
	Sleep(25)

	--	�ү��箦�G�ƹ�W�N�⨺��ӳå�s�b�A�b�ڭ��e�A�̤]�u���e�������I
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_14]", 5)

	--	�}�ҲĤ@�԰��y�{
	Lua_BellatiaDuplication_update_players(room_id)
	Global_BellatiaDuplication[room_id].door_before_boss5:addToPartition(room_id)
	Global_BellatiaDuplication[room_id].step = 1
	Lua_BellatiaDuplication_change_status(room_id, "boss")
	Global_BellatiaDuplication[room_id].step_trigger = true

	--	npc ai
	Global_BellatiaDuplication[room_id].cassam:beginPlot("Lua_BellatiaDuplication_FifthBoss_cassam_ai")
	Global_BellatiaDuplication[room_id].kangersy:beginPlot("Lua_BellatiaDuplication_FifthBoss_kangersy_ai")

	Global_BellatiaDuplication:debug("fifth boss drama 2 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama3()
	Global_BellatiaDuplication:debug("active > fifth boss drama 3 -> function Lua_BellatiaDuplication_FifthBoss_drama3()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�ڥ��}�F�T�ҲŤ媺�W�h�A�ϳo�Ǳj�j�Ť嬰�کҥΡI���o�����z�~�����x���촵�먺�I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_15]", time = 1, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 3 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 3 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama4()
	Global_BellatiaDuplication:debug("active > fifth boss drama 4 -> function Lua_BellatiaDuplication_FifthBoss_drama4()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�~�����H���A���h���P�A�����d�����S�@�_��ʪ���l�A�Y���O�L�����}�P�M�N�A�ڤS�����o���o�u�]�ҡv�ٸ������|�I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_16]", time = 1, is_done = false},
	--	�d�Ժ��D�d�ĩi�G���Ѯ��t�q���p�H�A�ڨS������ܷQ��A�����I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_17]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 4 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 4 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama5()
	Global_BellatiaDuplication:debug("active > fifth boss drama 5 -> function Lua_BellatiaDuplication_FifthBoss_drama5()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�A�����D�S���q���v����o�аV�H�u�s�u�|�a�ӷ��a�P�V�áA�Τ@�H���@�ɤ��O�ڪ��ؼСA�ڳ̲ת��ت��O�n�����U�c�����u�s���s�b�I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_18]", time = 1, is_done = false},
	--	�d�����G�ڤw�g���ƺ��A�A���F�I�S�Q���٦��H��ڧ󹳭ӺƤl�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_19]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 5 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 5 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama6()
	Global_BellatiaDuplication:debug("active > fifth boss drama 6 -> function Lua_BellatiaDuplication_FifthBoss_drama6()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�ڳB�B���ԡA�t�������A�o�@�����O���F�촵�먺�۷Q�A�Z�O�A�̳o�Ǥp�H���i�H�z�Ѫ��I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_20]", time = 1, is_done = false},
	--	�d�Ժ��D�d�ĩi�G�ڦb���o�����ĺ��ɬݨ�F�L�h���O�СA���D�A�٨S�o�{�ۤv�����F���D�H
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_21]", time = 4, is_done = false},
	--	�d�Ժ��D�d�ĩi�G�A���`�٦�A�D�_�Ԫ��A�L�Ҥ��Ψ䷥���}�a�촵��R���M���K�K
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_22]", time = 7, is_done = false},
	--	�d�Ժ��D�d�ĩi�G���޷��A�O�_�u�߷Q���w�ɶê��@�ɡA���H���a�Ӭ��n����l�A�{�b���A�u�O�b�_���ߪ��X�ϤU�A���ۥ��q���W����@�ɶi��_���}�F�I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_23]", time = 10, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 6 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 6 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama7()
	Global_BellatiaDuplication:debug("active > fifth boss drama 7 -> function Lua_BellatiaDuplication_FifthBoss_drama7()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�A�̳o�Ǽo���A���I�O��^�a�Y���a�I�I
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_101]", time = 1, is_done = false},
	--	�d�ĩi�G�O�z�|�L���g�k�D�ʡI
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_102]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 7 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 7 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama8()
	Global_BellatiaDuplication:debug("active > fifth boss drama 8 -> function Lua_BellatiaDuplication_FifthBoss_drama8()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	�ү��箦�G�������I�d�����A���S������[�J�ڪ��I�H
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_103]", time = 1, is_done = false},
	--	�d�����G�ڭ����M���O�Ƥl�A����A�گu����в���...
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_104]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 8 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 8 end")
end