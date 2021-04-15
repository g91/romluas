-----------------------------------------------------------------
--	�d�����m��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama4()
	Global_BellatiaDuplication:debug("active> fourth boss drama4 -> function Lua_BellatiaDuplication_FourthBoss_drama4()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss4_kangersy_sacrifice)

	local scripts = {
	--	�f�P�̨t�Ρy���X�z�G�����̡A�D�H���N���D�A�|�Τ����������ͶáA���A�N�˲��ݵۧA���P��Q�A�N���a�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_25]", time = 0, is_done = false},
	--	�d�����G��H�o��h���������E���b�餺���Pı�ٺ��Ǫ�
		{speaker = Global_BellatiaDuplication[room_id].kangersy , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_26]", time = 3, is_done = false},
	--	�N��E�����x�I�֤U�R�O�ڡI�O�U�۪����I
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_27]", time = 6, is_done = false},
	--	�d�����G�����ڪ��ͩR�I�ڪ�����i�H������������X�I�O���ڡu���v�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_28]", time = 9, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while not scripts[#scripts].is_done and Lua_BellatiaDuplication_check_status(room_id, "boss") do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	�@�����
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
					if index == 1 then
		--				�d�����m��
						Global_BellatiaDuplication[room_id].kangersy.hp = Global_BellatiaDuplication[room_id].kangersy.max_hp
						Global_BellatiaDuplication[room_id].kangersy.is_imperishable = false
						Global_BellatiaDuplication[room_id].kangersy.search_enemy = false
						Global_BellatiaDuplication[room_id].kangersy.strike_back = false
						Global_BellatiaDuplication[room_id].kangersy.fight = false
						Global_BellatiaDuplication[room_id].kangersy:stopAttack()
--						Global_BellatiaDuplication[room_id].kangersy:setIdleMotion(ruFUSION_ACTORSTATE_DEAD_WATER)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].kangersy.GUID, ruFUSION_MIME_DEAD_WATER)
		--				�I�i�ͩR�m���A���ۤ@�p��
						Global_BellatiaDuplication[room_id].kangersy:castSpell(Global_BellatiaDuplication[room_id].kangersy, 850921)
		--				�ͩR�m��DEBUFF
						Global_BellatiaDuplication[room_id].kangersy:addBuff(624415)
		--				��t���^��
						Global_BellatiaDuplication[room_id].kangersy:addBuff(624471)
					end
				end
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fourth boss drama4 end")
end

-----------------------------------------------------------------
--	���s�묹
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama5()
	Global_BellatiaDuplication:debug("active> fourth boss drama5 -> function Lua_BellatiaDuplication_FourthBoss_drama5()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	Global_BellatiaDuplication[room_id].morrok.fight = false
	Global_BellatiaDuplication[room_id].morrok.search_enemy = false
	Global_BellatiaDuplication[room_id].morrok.strike_back = false
	Global_BellatiaDuplication[room_id].morrok:stopAttack()
	Global_BellatiaDuplication[room_id].jill.fight = false
	Global_BellatiaDuplication[room_id].jill.search_enemy = false
	Global_BellatiaDuplication[room_id].jill.strike_back = false
	Global_BellatiaDuplication[room_id].jill:stopAttack()
	Global_BellatiaDuplication[room_id].feitlautrec.fight = false
	Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
	Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
	Global_BellatiaDuplication[room_id].feitlautrec:stopAttack()
	Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].z, 0)
	Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].z, 0)
	Global_BellatiaDuplication[room_id].feitlautrec:move(Global_BellatiaDuplication.boss_initial_position_flag[4].x, Global_BellatiaDuplication.boss_initial_position_flag[4].y, Global_BellatiaDuplication.boss_initial_position_flag[4].z)

	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
	Global_BellatiaDuplication[room_id].feitlautrec:faceTo(Global_BellatiaDuplication[room_id].pangkorrams_dragon)

	local scripts = {
	--	�ɵY��ᴵ�G�����I�A�o�Ӭ��ƪ����Y�I���M�Q�Q�Χڪ��O�q�M���P�k��ɡI�I(���J�p�i���N�z�C����!? ���J�p�i���]�O���s�A���D�o�@�����O����!?)
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_29]", time = 3, is_done = false},
	--	�ɵY��ᴵ�G���I�I�I�ڤ��Q���I�ڤ��Q���I�I�I
		{speaker = "scriptMessage" , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_30]", time = 6, is_done = false},
	--	���عp�i���G�ڧ����F�ۤv���ϩR�A���U�ӴN����A�̤F�I(���J�p�i���A�O�A�x�F!)
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_31]", time = 9, is_done = false},
	--	�d�����G����ɨ�I�o��ӳå볺�M�n�ܦ����ϤF�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_32]", time = 15, is_done = false},
	--	�d�����G�ϥ��L�̲{�b�O�L�k�Q�R�����I���L�̨ӷ�׽b�P�a�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_33]", time = 18, is_done = false},
	--	����Ǩ��K������Z�g���o���n�A�������������զ��G�i��
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_34]", time = 21, is_done = false},
	--	�d�ĩi�G�������������O�w�g�j�j��z�F�I�ڥ��h�䴩��Z�g�L�̡I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_35]", time = 23, is_done = false},
	--	�f�P�̨t�Ρy���X�z�G�u�s���o�د�O�i�H����������O�A��ƤW�S���o���O��......
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_36]", time = 29, is_done = false},
	--	�f�P�̨t�Ρy���X�z�G�N��901�����������O�I�z�A�A�����ͤ]���U���W�o�̡A�A�����|��ӶܡH
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_37]", time = 32, is_done = false},
	--	�d�����G�K�I���٦b�o�̡I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_38]", time = 35, is_done = false},
	--	�d�����G�A���۱i�I�ڲ{�b�餺�����������O�����w��A�٦h�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_39]", time = 40, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time
	local drama_trigger = true

	while Lua_BellatiaDuplication_check_status(room_id, "drama") do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	�@�����
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
					if index == 3 then
		--				���s��
						for index, node in pairs(Global_BellatiaDuplication[room_id].protective_cover.node) do node:delete() end
						Global_BellatiaDuplication[room_id].protective_cover:delete()
						Global_BellatiaDuplication[room_id].protective_cover = nil
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624433)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(509923)
						Global_BellatiaDuplication[room_id].cassam:cancelBuff(624433)
						Global_BellatiaDuplication[room_id].cassam.sword:delete()
						Global_BellatiaDuplication[room_id].cassam.sword = nil
						SetRoleEquip(Global_BellatiaDuplication[room_id].cassam.GUID, EM_EQWearPos_MainHand, 213696, 1)
						Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_CAST_END)
						Global_BellatiaDuplication:Sleep(1)
						Global_BellatiaDuplication[room_id].cassam:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_SLEEP_END)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624413)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:systemCastSpell(Global_BellatiaDuplication[room_id].pangkorrams_dragon, 850810)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(624661)
						Global_BellatiaDuplication:sleep(4)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_FLY_BEGIN)
						Global_BellatiaDuplication:sleep(0.5)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].pangkorrams_dragon.GUID, ruFUSION_MIME_FLY_LOOP)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon.gravity = false
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:move(Global_BellatiaDuplication[room_id].pangkorrams_dragon.x, Global_BellatiaDuplication[room_id].pangkorrams_dragon.y + 120, Global_BellatiaDuplication[room_id].pangkorrams_dragon.z)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:castSpell(Global_BellatiaDuplication[room_id].feitlautrec, 851097)
						Global_BellatiaDuplication:sleep(3)
						Global_BellatiaDuplication[room_id].feitlautrec:systemCastSpell(Global_BellatiaDuplication[room_id].feitlautrec, 851099)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_DYING)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].pangkorrams_dragon.GUID, ruFUSION_MIME_IDLE_DEAD)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624661)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon.gravity = true
						Global_BellatiaDuplication:sleep(1)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:systemCastSpell(Global_BellatiaDuplication[room_id].pangkorrams_dragon, 851098)
		--				�k��ù�S�ܮz
						local feitlautrec_x = Global_BellatiaDuplication[room_id].feitlautrec.x
						local feitlautrec_y = Global_BellatiaDuplication[room_id].feitlautrec.y
						local feitlautrec_z = Global_BellatiaDuplication[room_id].feitlautrec.z
						local feitlautrec_direction = Global_BellatiaDuplication[room_id].feitlautrec.direction
						Global_BellatiaDuplication[room_id].feitlautrec:delete()
						Global_BellatiaDuplication[room_id].feitlautrec = AddyBoss:new()
						Global_BellatiaDuplication[room_id].feitlautrec:create(Global_BellatiaDuplication_FourthBoss.feitlautrec_weak_orgid, feitlautrec_x, feitlautrec_y, feitlautrec_z, feitlautrec_direction)
						Global_BellatiaDuplication[room_id].feitlautrec.fight = false
						Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
						Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
						Global_BellatiaDuplication[room_id].feitlautrec.movable = false
						Global_BellatiaDuplication[room_id].feitlautrec.max_hp = Global_BellatiaDuplication[room_id].feitlautrec.hp
						LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.06, "BellatiaDuplication_deadplot")
						Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("prairie_fire", Global_BellatiaDuplication_FourthBoss.skill_prairie_fire)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("fuel_grenade", Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("fire_marking", Global_BellatiaDuplication_FourthBoss.skill_fire_marking)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("summon_servants", Global_BellatiaDuplication_FourthBoss.skill_summon_servants)
		--				��t�����^��
						Global_BellatiaDuplication[room_id].feitlautrec:addBuff(624471)
						Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.6
						Global_BellatiaDuplication[room_id].feitlautrec:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
					end
					if index == 4 then
		--				����J�N���ܯ���
						Sleep(18)
						Global_BellatiaDuplication[room_id].morrok:castSpell(Global_BellatiaDuplication[room_id].morrok, 850965)
						Global_BellatiaDuplication[room_id].morrok:addBuff(624428)
						Global_BellatiaDuplication[room_id].jill:castSpell(Global_BellatiaDuplication[room_id].jill, 850965)
						Global_BellatiaDuplication[room_id].jill:addBuff(624428)
					end
					if index == 7 then
		--				�d�ĩi���K����
						Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_BUFF_END)
						Sleep(2)
						Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_NORMAL)
						Global_BellatiaDuplication[room_id].cassam.movable = true
						Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].ironrose)
						Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].x, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].y, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].z)
						Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication[room_id].ironrose.x, Global_BellatiaDuplication[room_id].ironrose.y, Global_BellatiaDuplication[room_id].ironrose.z, 0)
					end
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
			if scripts[8].is_done then
				Global_BellatiaDuplication[room_id].fight_step = 2
				Global_BellatiaDuplication[room_id].fight_step_trigger = true
				Lua_BellatiaDuplication_change_status(room_id, "boss")

				Global_BellatiaDuplication[room_id].morrok.fight = true
				Global_BellatiaDuplication[room_id].jill.fight = true
				Global_BellatiaDuplication[room_id].feitlautrec.fight = true
				Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = true
				Global_BellatiaDuplication[room_id].feitlautrec.strike_back = true
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication[room_id].cassam:delFromPartition()

	Global_BellatiaDuplication:debug("info> fourth boss drama5 end")
end

-----------------------------------------------------------------
--	�|���𲤤��A�k��ù�S�P���X�m�ܨ���
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama6()
	Global_BellatiaDuplication:debug("active> fourth boss drama6 -> function Lua_BellatiaDuplication_FourthBoss_drama6()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	local scripts = {
	--	�f�P�̨t�Ρy���X�z�G�k��ù�S�A����A����ʡI�O�b�ڪ����W�N�ӺN�h�A�Pı�ܤ��ΪA�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_40]", time = 3, is_done = false},
	--	�k��ù�S�G�o�O�y�ڪ��z����A�p�o�ӥ~�Ӫ̡I
		{speaker = "scriptMessage" , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_41]", time = 6, is_done = false},
	--	�f�P�̨t�Ρy���X�z�G�k��ù�S�A�D�H���ܬO���諸�A������A�����H
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_42]", time = 20, is_done = false},
	--	�k��ù�S�G�]���p���D�H�O�Ө������å�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_43]", time = 23, is_done = false},
	--	�f�P�̨t�Ρy���X�z�G�A���}�a�ʦL�}���I�O��~���عp�i���d�����H
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_44]", time = 37, is_done = false},
	--	�k��ù�S�G�]���ڬO�k��ù�S�I�A�o�����f�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_45]", time = 40, is_done = false},
	--	�k��ù�S�G�p�F��̥[��l�I�u�n�ڹܦ^�����v�A�@�w���A�̵h�_�ү��箦�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_46]", time = 52, is_done = false},
	--	�k��ù�S�G�A�`�ڪ��O�q�����j�b�A�N���A�@�b����U�Ӵ��a�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_47]", time = 55, is_done = false},
	--	���X�@�ϱ`�A�A��M�I�q���y
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_48]", time = 58, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while not scripts[#scripts].is_done and Lua_BellatiaDuplication_check_status(room_id, "boss") and Global_BellatiaDuplication[room_id].step == 6 do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	�@�����
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
				end
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fourth boss drama6 end")
end

-----------------------------------------------------------------
--	�|���̲׼@���A�k��ù�S��U���a
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama7()
	Global_BellatiaDuplication:debug("active> fourth boss drama7 -> function Lua_BellatiaDuplication_FourthBoss_drama7()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	-----------------------------------------------------------------
	--	�M���p��
	-----------------------------------------------------------------
	for index, flame in pairs(Global_BellatiaDuplication[room_id].feitlautrec_flames) do flame:delete() end

	Global_BellatiaDuplication[room_id].morrok.movable = true
	Global_BellatiaDuplication[room_id].morrok.fight = false
	Global_BellatiaDuplication[room_id].morrok.search_enemy = false
	Global_BellatiaDuplication[room_id].morrok.strike_back = false
	Global_BellatiaDuplication[room_id].morrok:stopAttack()

	Global_BellatiaDuplication[room_id].jill.movable = true
	Global_BellatiaDuplication[room_id].jill.fight = false
	Global_BellatiaDuplication[room_id].jill.search_enemy = false
	Global_BellatiaDuplication[room_id].jill.strike_back = false
	Global_BellatiaDuplication[room_id].jill:stopAttack()

	Global_BellatiaDuplication[room_id].feitlautrec.movable = true
	Global_BellatiaDuplication[room_id].feitlautrec.fight = false
	Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
	Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
	Global_BellatiaDuplication[room_id].feitlautrec:stopAttack()
	Global_BellatiaDuplication[room_id].feitlautrec.camp_id = 5
	Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.max_hp

	Global_BellatiaDuplication[room_id].kangersy.movable = true
	Global_BellatiaDuplication[room_id].kangersy.fight = false
	Global_BellatiaDuplication[room_id].kangersy.search_enemy = false
	Global_BellatiaDuplication[room_id].kangersy.strike_back = false

	Global_BellatiaDuplication[room_id].cassam.movable = true
	Global_BellatiaDuplication[room_id].cassam.fight = false
	Global_BellatiaDuplication[room_id].cassam.search_enemy = false
	Global_BellatiaDuplication[room_id].cassam.strike_back = false
	Global_BellatiaDuplication[room_id].cassam:stopAttack()

	Global_BellatiaDuplication[room_id].ironrose.movable = true
	Global_BellatiaDuplication[room_id].ironrose.fight = false
	Global_BellatiaDuplication[room_id].ironrose.search_enemy = false
	Global_BellatiaDuplication[room_id].ironrose.strike_back = false
	Global_BellatiaDuplication[room_id].ironrose:stopAttack()

	local scripts = {
	--	���X���n���A���T�_�A���O�����۳\�h���P���n���A�Aı�o�o�b�u�h�W�v���y�s�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_49]", time = 1, is_done = false},
	--	�k��ù�S�G�I�I�`��ۥѤF�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_50]", time = 6, is_done = false},
	--	���X���n���A���T�_�A���O�����۳\�h���P���n���A�Aı�o�o�b�u�h�W�v���y�s�I
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_51]", time = 10, is_done = false},
	--	����J�G��~�ڬݨ쪺......�N��A���D�ڭ��ܦ����ϤF�H
		{speaker = Global_BellatiaDuplication[room_id].morrok, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_52]", time = 14, is_done = false},
	--	�N��G�ڤ]�ݨ�F�P�˪����H�A��......������O�ڡH
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_53]", time = 17, is_done = false},
	--	�k��ù�S�G�A�̲{�b�w�ߥ��K�]�Ӧ��F�a�I�ү��箦�o�V�J�٬��ۡI
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_54]", time = 20, is_done = false},
	--	�k��ù�S�G�a�۳o�p�å�@�_�h�A�L�i�H�R��ڪ��եب�U�A��
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_55]", time = 26, is_done = false},
	--	�d�Ժ��E�d�ĩi�G���ڭ��~��e�i�a�I�@�w�n���ү��箦��������������I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_56]", time = 29, is_done = false},
	--	�k��ù�S�G�����I�A�O�h�I�ү��箦�O�V�J�S���A���L����O���O�x�۪����A�A�h�]�u�O�W�[�t��}�F�I
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_57]", time = 32, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	�@�����
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
					if index == 1 then
						Global_BellatiaDuplication[room_id].feitlautrec:move(Global_BellatiaDuplication.boss_initial_position_flag[4].x, Global_BellatiaDuplication.boss_initial_position_flag[4].y, Global_BellatiaDuplication.boss_initial_position_flag[4].z, 0)
					end
					if index == 2 then
						Global_BellatiaDuplication[room_id].feitlautrec:faceTo(Global_BellatiaDuplication[room_id].kangersy)
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_BUFF_SP01)

		--				�d�����Ѱ��m��
						Global_BellatiaDuplication[room_id].kangersy.is_imperishable = true
						Global_BellatiaDuplication[room_id].kangersy:stopAttack()
						Global_BellatiaDuplication[room_id].kangersy:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].kangersy.GUID, ruFUSION_MIME_IDLE_STAND)
						Global_BellatiaDuplication[room_id].kangersy:interruptMagic()
						Global_BellatiaDuplication[room_id].kangersy:cancelBuff(624415)
						Global_BellatiaDuplication[room_id].kangersy:cancelBuff(624471)
					end
					if index == 3 then
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
						Sleep(10)
						local feitlautrec_x = Global_BellatiaDuplication[room_id].feitlautrec.x
						local feitlautrec_y = Global_BellatiaDuplication[room_id].feitlautrec.y
						local feitlautrec_z = Global_BellatiaDuplication[room_id].feitlautrec.z
						local feitlautrec_direction = Global_BellatiaDuplication[room_id].feitlautrec.direction
						Global_BellatiaDuplication[room_id].feitlautrec:delete()
						Global_BellatiaDuplication[room_id].feitlautrec:create(Global_BellatiaDuplication.feitlautrec_ally_orgid, feitlautrec_x, feitlautrec_y, feitlautrec_z, feitlautrec_direction)
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
						Global_BellatiaDuplication[room_id].feitlautrec.patrol = false
						Global_BellatiaDuplication[room_id].feitlautrec.is_walk = 0
						LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, 1, "BellatiaDuplication_deadplot")
						Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
		--				���ٸ�
						for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
							if CountBodyItem(player.GUID, 530969) == 0 then GiveBodyItem(player.GUID, 530969, 1) end
						end
					end
					if index == 4 then
		--				����J�Ѱ��ܨ�
						Global_BellatiaDuplication[room_id].morrok:interruptMagic()
						Global_BellatiaDuplication[room_id].morrok:cancelBuff(624428)
						local morrok_x = Global_BellatiaDuplication[room_id].morrok.x
						local morrok_y = Global_BellatiaDuplication[room_id].morrok.y
						local morrok_z = Global_BellatiaDuplication[room_id].morrok.z
						local morrok_direction = Global_BellatiaDuplication[room_id].morrok.direction
						Global_BellatiaDuplication[room_id].morrok:delete()
						Global_BellatiaDuplication[room_id].morrok:create(Global_BellatiaDuplication.morrok_god_orgid, morrok_x, morrok_y, morrok_z, morrok_direction)
						Global_BellatiaDuplication[room_id].morrok.patrol = false
						Global_BellatiaDuplication[room_id].morrok.is_walk = 0
						Global_BellatiaDuplication[room_id].morrok.fight = false
						Global_BellatiaDuplication[room_id].morrok.strike_back = false
						Global_BellatiaDuplication[room_id].morrok.search_enemy = false
						Global_BellatiaDuplication[room_id].morrok:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].jill)
					end
					if index == 5 then
		--				�N��Ѱ��ܨ�
						Global_BellatiaDuplication[room_id].jill:interruptMagic()
						Global_BellatiaDuplication[room_id].jill:cancelBuff(624428)
						local jill_x = Global_BellatiaDuplication[room_id].jill.x
						local jill_y = Global_BellatiaDuplication[room_id].jill.y
						local jill_z = Global_BellatiaDuplication[room_id].jill.z
						local jill_direction = Global_BellatiaDuplication[room_id].jill.direction
						Global_BellatiaDuplication[room_id].jill:delete()
						Global_BellatiaDuplication[room_id].jill:create(Global_BellatiaDuplication.jill_god_orgid, jill_x, jill_y, jill_z, jill_direction)
						Global_BellatiaDuplication[room_id].jill.patrol = false
						Global_BellatiaDuplication[room_id].jill.is_walk = 0
						Global_BellatiaDuplication[room_id].jill.fight = false
						Global_BellatiaDuplication[room_id].jill.strike_back = false
						Global_BellatiaDuplication[room_id].jill.search_enemy = false
						Global_BellatiaDuplication[room_id].jill:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].morrok)

						Global_BellatiaDuplication[room_id].cassam:setPosition(Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].x - 40 + RandRange(1, 80), Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].y, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].z - 40 + RandRange(1, 80))
						Global_BellatiaDuplication[room_id].cassam:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].ironrose:setPosition(Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].x - 40 + RandRange(1, 80), Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].y, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].z - 40 + RandRange(1, 80))
						Global_BellatiaDuplication[room_id].ironrose:addToPartition(room_id)
					end
					if index == 6 then
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_ATTACK_UNARMED)
						Global_BellatiaDuplication[room_id].feitlautrec:move(Global_BellatiaDuplication.boss_initial_position_flag[4].x, Global_BellatiaDuplication.boss_initial_position_flag[4].y, Global_BellatiaDuplication.boss_initial_position_flag[4].z, 0)
						Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].ironrose:move(Global_BellatiaDuplication.npc_initial_position_flag[96].x, Global_BellatiaDuplication.npc_initial_position_flag[96].y, Global_BellatiaDuplication.npc_initial_position_flag[96].z)

		--				��Z�g......�A�d�U�a
						Global_BellatiaDuplication[room_id].cassam:say("[SC_BELLATIADUPLICATION_FOURTH_BOSS_58]", 3)
						Sleep(20)
		--				�H��......�ڪ��D�F�A�ЧA�ȥ��n�O���C
						Global_BellatiaDuplication[room_id].ironrose:say("[SC_BELLATIADUPLICATION_FOURTH_BOSS_59]", 3)
					end
					if index == 7 then
						Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama8")
		--				�k��ù�S���� 
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi = AddyAlly:new()
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:create(Global_BellatiaDuplication_FourthBoss.feitlautrec_sungchili_orgid, Global_BellatiaDuplication[room_id].feitlautrec.x, Global_BellatiaDuplication[room_id].feitlautrec.y, Global_BellatiaDuplication[room_id].feitlautrec.z, Global_BellatiaDuplication[room_id].feitlautrec.direction)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.camp_id = 5
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.patrol = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.strike_back = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.search_enemy = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.fight = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.is_walk = 0
						LockHP(Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.GUID, 1, "BellatiaDuplication_deadplot")
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:move(Global_BellatiaDuplication[room_id].kangersy.x + 40, Global_BellatiaDuplication[room_id].kangersy.y, Global_BellatiaDuplication[room_id].kangersy.z + 60)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:faceTo(Global_BellatiaDuplication[room_id].morrok)
					end
					if index == 8 then
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:move(Global_BellatiaDuplication[room_id].door_after_boss4.x, Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 40)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:faceTo(Global_BellatiaDuplication[room_id].door_after_boss4)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:playMotion(ruFUSION_ACTORSTATE_ATTACK_1H)
						Sleep(8)
						Global_BellatiaDuplication[room_id].door_after_boss4:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						Global_BellatiaDuplication[room_id].door_after_boss4:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					end
				end
			end
		-----------------------------------------------------------------

		if scripts[#scripts].is_done then
			Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication.npc_initial_position_flag[92].x, Global_BellatiaDuplication.npc_initial_position_flag[92].y, Global_BellatiaDuplication.npc_initial_position_flag[92].z, 0)
			Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication.npc_initial_position_flag[93].x, Global_BellatiaDuplication.npc_initial_position_flag[93].y, Global_BellatiaDuplication.npc_initial_position_flag[93].z, 0)
			Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication.npc_initial_position_flag[94].x, Global_BellatiaDuplication.npc_initial_position_flag[94].y, Global_BellatiaDuplication.npc_initial_position_flag[94].z, 0)
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:move(Global_BellatiaDuplication.npc_initial_position_flag[98].x, Global_BellatiaDuplication.npc_initial_position_flag[98].y, Global_BellatiaDuplication.npc_initial_position_flag[98].z, 0)
			Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication.npc_initial_position_flag[95].x, Global_BellatiaDuplication.npc_initial_position_flag[95].y, Global_BellatiaDuplication.npc_initial_position_flag[95].z)
			Sleep(20)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi)

			Global_BellatiaDuplication[room_id].morrok.fight = true
			Global_BellatiaDuplication[room_id].morrok.strike_back = true
			Global_BellatiaDuplication[room_id].morrok.search_enemy = true
			Global_BellatiaDuplication[room_id].jill.fight = true
			Global_BellatiaDuplication[room_id].jill.strike_back = true
			Global_BellatiaDuplication[room_id].jill.search_enemy = true
			Global_BellatiaDuplication[room_id].kangersy.fight = true
			Global_BellatiaDuplication[room_id].kangersy.strike_back = true
			Global_BellatiaDuplication[room_id].kangersy.search_enemy = true
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.fight = true
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.strike_back = true
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.search_enemy = true
			Global_BellatiaDuplication[room_id].cassam.fight = true
			Global_BellatiaDuplication[room_id].cassam.strike_back = true
			Global_BellatiaDuplication[room_id].cassam.search_enemy = true
			local _treasure = AddyNpc:new()
			_treasure:create(Global_BellatiaDuplication_FourthBoss.treasure_orgid, Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.x, Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.y, Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.z + 100)
			_treasure.movable = false
			_treasure.strike_back = false
			_treasure.search_enemy = false
			_treasure.fight = false
			_treasure:addToPartition(room_id)
			_treasure:addBuff(624589)
--			Global_BellatiaDuplication[room_id].pangkorrams.hide = true
			Global_BellatiaDuplication[room_id].pangkorrams.show = false
			Global_BellatiaDuplication[room_id].pangkorrams.mark = false
			Global_BellatiaDuplication[room_id].pangkorrams.hide_hp_mp = true
			Global_BellatiaDuplication[room_id].pangkorrams.show_role_head = true
			Global_BellatiaDuplication[room_id].pangkorrams:setPosition(Global_BellatiaDuplication.save_point_flag[9].x, Global_BellatiaDuplication.save_point_flag[9].y, Global_BellatiaDuplication.save_point_flag[9].z)
			Lua_BellatiaDuplication_update_save_point(room_id)
			Lua_BellatiaDuplication_change_status(room_id, "success")
		end
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fourth boss drama7 end")
	Global_BellatiaDuplication[room_id].step_trigger = true
	Global_BellatiaDuplication[room_id].fight_step_trigger = true
end

-----------------------------------------------------------------
--	�k��ù�S��פj���J�������
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama8()
	Global_BellatiaDuplication:debug("active> fourth boss drama8 -> function Lua_BellatiaDuplication_FourthBoss_drama8()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	if not Global_BellatiaDuplication[room_id].enemies then Global_BellatiaDuplication[room_id].enemies = {} end
	if not Global_BellatiaDuplication[room_id].allies then Global_BellatiaDuplication[room_id].allies = {} end

	Global_BellatiaDuplication[room_id].feitlautrec:addTopartition(room_id)
	Global_BellatiaDuplication[room_id].ironrose:addTopartition(room_id)

	Global_BellatiaDuplication[room_id].ironrose.movable = true
	Global_BellatiaDuplication[room_id].ironrose.fight = true
	Global_BellatiaDuplication[room_id].ironrose.search_enemy = true
	Global_BellatiaDuplication[room_id].ironrose.strike_back = true
	Global_BellatiaDuplication[room_id].feitlautrec.camp_id = 5
	Global_BellatiaDuplication[room_id].feitlautrec.movable = true
	Global_BellatiaDuplication[room_id].feitlautrec.fight = true
	Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = true
	Global_BellatiaDuplication[room_id].feitlautrec.strike_back = true

	while not Lua_BellatiaDuplication_check_status(room_id, "boss") do
		if #Global_BellatiaDuplication[room_id].enemies < Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount then
			for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount - #Global_BellatiaDuplication[room_id].enemies do
				local _enemy = AddyMonster:new()
				local _birth_flag_index = RandRange(13, 19)
				_enemy:create(Global_BellatiaDuplication_FourthBossDrama.enemy_type[RandRange(1, #Global_BellatiaDuplication_FourthBossDrama.enemy_type)], Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].x, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].y, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].z)
				_enemy.patrol = false
				_enemy.is_walk = 0
				_enemy:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].enemies, _enemy)
			end
		end

		if #Global_BellatiaDuplication[room_id].allies < Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount then
			for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount - #Global_BellatiaDuplication[room_id].allies do
				local _ally = AddyAlly:new()
				local _birth_flag_index = RandRange(13, 19)
				_ally:create(Global_BellatiaDuplication.ally_type[RandRange(1, #Global_BellatiaDuplication.ally_type)], Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].x, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].y, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].z)
				_ally.patrol = false
				_ally.is_walk = 0
				_ally:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].allies, _ally)
			end
		end

		if #Global_BellatiaDuplication[room_id].allies > Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount then
			for index = 1, #Global_BellatiaDuplication[room_id].allies - Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount do
				Global_BellatiaDuplication[room_id].allies[index].hp = 0
			end
		end

		for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do
			if ally.hp <= 0 or not CheckID(ally.GUID) then table.remove(Global_BellatiaDuplication[room_id].allies, index) end
			if not ally.attack_target then
				ally.attack_target = Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]
			elseif ally.attack_target then
				ally:attack(ally.attack_target)
				if ally.attack_target.hp <= 0 then ally.attack_target = nil end
			end
		end

		for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do
			if enemy.hp <= 0 or not CheckID(enemy.GUID) then table.remove(Global_BellatiaDuplication[room_id].enemies, index) end
			if not enemy.attack_target then
				enemy.attack_target = Global_BellatiaDuplication[room_id].allies[RandRange(1, #Global_BellatiaDuplication[room_id].allies)]
			elseif enemy.attack_target then
				enemy:attack(enemy.attack_target)
				if enemy.attack_target.hp <= 0 then enemy.attack_target = nil end
			end
		end

		if not Global_BellatiaDuplication[room_id].feitlautrec.attack_target then
			Global_BellatiaDuplication[room_id].feitlautrec.attack_target = Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]
		elseif Global_BellatiaDuplication[room_id].feitlautrec.attack_target then
			Global_BellatiaDuplication[room_id].feitlautrec:attack(Global_BellatiaDuplication[room_id].feitlautrec.attack_target)
			if Global_BellatiaDuplication[room_id].feitlautrec.attack_target.hp <= 0 then Global_BellatiaDuplication[room_id].feitlautrec.attack_target = nil end
		end

		if not Global_BellatiaDuplication[room_id].ironrose.attack_target then
			Global_BellatiaDuplication[room_id].ironrose.attack_target = Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]
		elseif Global_BellatiaDuplication[room_id].ironrose.attack_target then
			Global_BellatiaDuplication[room_id].ironrose:attack(Global_BellatiaDuplication[room_id].ironrose.attack_target)
			if Global_BellatiaDuplication[room_id].ironrose.attack_target.hp <= 0 then Global_BellatiaDuplication[room_id].ironrose.attack_target = nil end
		end

		Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]:delete()
		Global_BellatiaDuplication[room_id].allies[RandRange(1, #Global_BellatiaDuplication[room_id].allies)]:delete()
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	-----------------------------------------------------------------
	--	�M���t��
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].enemies then 
		for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do enemy:delete() end
		Global_BellatiaDuplication[room_id].enemies = nil
	end
	if Global_BellatiaDuplication[room_id].allies then
		for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do ally:delete() end
		Global_BellatiaDuplication[room_id].allies = nil
	end

	Global_BellatiaDuplication[room_id].feitlautrec:delFromPartition()
	Global_BellatiaDuplication[room_id].ironrose:delFromPartition()

	Global_BellatiaDuplication:debug("info> fourth boss drama8 end")
end