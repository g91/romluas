-----------------------------------------------------------------
--	�|���@���]�w
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama_setting()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss drama setting -> Lua_BellatiaDuplication_FourthBoss_drama_setting()")
	Global_BellatiaDuplication_FourthBossDrama = {}
	Global_BellatiaDuplication_FourthBossDrama.delay = 0.5
	Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag = AddyFlagGroup:new(781306)
	Global_BellatiaDuplication_FourthBossDrama.enemy_type = Global_BellatiaDuplication.enemy_type
	Global_BellatiaDuplication_FourthBossDrama.drama1_balance_amount = 2
	Global_BellatiaDuplication_FourthBossDrama.drama2_balance_amount = 4
	Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount = 12
end

-----------------------------------------------------------------
--	�|���q���}���@��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama1()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss drama1 -> Lua_BellatiaDuplication_FourthBoss_drama1()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[1] = true

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss4_beginning)

	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].ironrose:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)

	Global_BellatiaDuplication[room_id].pangkorrams:faceTo(Global_BellatiaDuplication[room_id].jill)

	local scripts = {
	--	�N��E��J���G���s�A�b�X�o�e�ڷQ�����ۤv�H�����X���|�ʹD�p�C
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_02]", time = 3, is_done = false},
	--	�N��E��J���G�ڤ��Ӧ]���@�Ϥ��F�ҫk�ӧ���o���b�A�M�p�����W�C
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_03]", time = 6, is_done = false},
	--	���p�J�i���G�Ĥl�A�ڭ̥u�O�p�M����J�Ҹg�����շҤ����p�������@�q���D�C
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_04]", time = 9, is_done = false},
	--	���p�J�i���G������~�����׸ɪ��Ŷ��A�p�ݭn�����O��̡A�ӬO�o�ۤ��ߪ������C
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_05]", time = 12, is_done = false},
	--	���p�J�i���G�z�L�o�q�ɶ����ǲߡA�۫H�p�M����J�w�������C
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_06]", time = 15, is_done = false},
	--	�d�����G�ѹ����گu���Z�P�ʪ��A�i�O���y�ܧ��٬O�o���K�K�ڭֳ̧Q�]��F��I�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_07]", time = 18, is_done = false},
	--	���ξ�ߡA�����x�C�o�Ǻ��@�̬O�d����ڭ̪��I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_08]", time = 21, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time
	local birth_flag = {}
	local team_move = AddyTeamMove:new(Global_BellatiaDuplication_FourthBoss.goto_route_flag)
	team_move:add(Global_BellatiaDuplication[room_id].pangkorrams)
	team_move:add(Global_BellatiaDuplication[room_id].morrok)
	team_move:add(Global_BellatiaDuplication[room_id].jill)
	team_move:add(Global_BellatiaDuplication[room_id].kangersy)
	team_move:add(Global_BellatiaDuplication[room_id].cassam)
	team_move:add(Global_BellatiaDuplication[room_id].ironrose)
	team_move.ai_tolerance = 40
	team_move.delay = 0.5

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].step == 1 do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	�@�����
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
--					for index, player in pairs(Global_BellatiaDuplication[room_id].players) do script.speaker:scriptMessage(player, script.content, 3) end
					script.speaker:say(script.content, 5)
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�԰�
			if current_time - start_time >= 15 and  #Global_BellatiaDuplication[room_id].allies < Global_BellatiaDuplication_FourthBossDrama.drama1_balance_amount then
				for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama1_balance_amount - #Global_BellatiaDuplication[room_id].allies do
					local _ally = AddyAlly:new()
					_ally:create(
						Global_BellatiaDuplication.ally_type[RandRange(1, #Global_BellatiaDuplication.ally_type)],
						Global_BellatiaDuplication[room_id].ironrose.x - 30 + RandRange(1, 60),
						Global_BellatiaDuplication[room_id].ironrose.y,
						Global_BellatiaDuplication[room_id].ironrose.z - 30 + RandRange(1, 60),
						Global_BellatiaDuplication[room_id].ironrose.direction)
					_ally.patrol = false
					_ally.is_walk = 0
					_ally:addToPartition(room_id)
					table.insert(Global_BellatiaDuplication[room_id].allies, _ally)
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	���s������A���N�ͩ�
			if current_time - start_time >= 18 then
				for index, flag in ipairs(Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag) do
					if not birth_flag[index] and flag:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) < 200 then
						local _enemy = AddyMonster:new()
						_enemy:create(Global_BellatiaDuplication_FourthBossDrama.enemy_type[RandRange(1, #Global_BellatiaDuplication_FourthBossDrama.enemy_type)], flag.x, flag.y, flag.z)
						_enemy.patrol = false
						_enemy:addTopartition(room_id)
						_enemy:attack(Global_BellatiaDuplication[room_id].pangkorrams)
						birth_flag[index] = true
						table.insert(Global_BellatiaDuplication[room_id].enemies, _enemy)
					end
				end
			end
			for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do
				if enemy.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].enemies, index) end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	AI
			for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do
				if ally.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].allies, index) end
		--		���ǥ���
				if #Global_BellatiaDuplication[room_id].enemies > 0 then ally:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
		--		�S�Ǹ���K������
				elseif ally:distanceTo(Global_BellatiaDuplication[room_id].ironrose) > 40 then ally:move(Global_BellatiaDuplication[room_id].ironrose.x - 30 + RandRange(1, 60), Global_BellatiaDuplication[room_id].ironrose.y, Global_BellatiaDuplication[room_id].ironrose.z - 30 + RandRange(1, 60), 0) end
			end
			for index, npc in pairs(team_move.npcs) do
				if #Global_BellatiaDuplication[room_id].enemies > 0 then npc:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]) end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�a���3��X�жi�@��
			if not team_move.is_active and scripts[#scripts].is_done then team_move:start() end
			if team_move.is_active and Global_BellatiaDuplication_FourthBoss.goto_route_flag[3]:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) < 120 then
				Global_BellatiaDuplication[room_id].step = 2
				for index, npc in pairs(team_move.npcs) do 
					npc:stopMove()
					npc.movable = false
				end
				team_move:stop()
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end
	if team_move.is_active then team_move:stop() end

	Global_BellatiaDuplication:debug("fourth boss drama1 end")
	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	�i�|���e�A�K����������״�J�������
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama2()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss drama2 -> Lua_BellatiaDuplication_FourthBoss_drama2()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[2] = true

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	Global_BellatiaDuplication[room_id].pangkorrams:move(
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].x,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].y,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].z,
		0)
	Global_BellatiaDuplication[room_id].morrok:move(
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].x - 30,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].y,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].z - 40,
		0)
	Global_BellatiaDuplication[room_id].jill:move(
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].x + 40,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].y,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].z + 50,
		0)
	Global_BellatiaDuplication[room_id].kangersy:move(
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].x - 80,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].y,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].z + 30,
		0)
	Global_BellatiaDuplication[room_id].cassam:move(
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].x + 80,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].y,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].z + 40,
		0)
	Global_BellatiaDuplication[room_id].ironrose:move(
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].x + 40,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].y,
		Global_BellatiaDuplication_FourthBoss.goto_route_flag[3].z - 60)

	local scripts = {
	--	�f�P�̨t�Ρy���X�z�G�D�H�A�k��ù�S���_�b���իʦL�}���z�I�A�ھ�ߥ�......(�������J�p�i���N�O���X!!?�G�ƨ쩳�|���o�i�U�h�O!?)
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_09]", time = 1, is_done = false},
	--	�ү��箦�G�O��ߡA�ڭ̤��e�N���L���աA�����i���}�ڭ̪��ʦL�C�h�a�I�ոե��������O�q�A�N�o�ǥi�����p���N�����u�I
		{speaker = "scriptMessage" , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_10]", time = 4, is_done = false},
	--	�d�����G�V�|�A���@�̷����������X�{�A�o�N���Z�ڭ̪��@�ԭp���C
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_11]", time = 7, is_done = false},
	--	��Z�g�G�H���A�бN�o�̥浹�ڡI
		{speaker = Global_BellatiaDuplication[room_id].ironrose, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_12]", time = 10, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�����x�A��Z�g�S���D���C�ڬ۫H�o�i�H���׺��@�̪��䴩
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_13]", time = 13, is_done = false},
	--	�d�����G�a�I�K�����A�N�a���u��o�̡A�O�����@�̤z�Z�ڭ̡I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_14]", time = 16, is_done = false},
	--	�d�Ժ��E�d�ĩi�G��Z�g...
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_15]", time = 18, is_done = false},
	--	�d�Ժ��E�d�ĩi�G�O��......
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_16]", time = 20, is_done = false},
	--	��Z�g�G�H��......�ڤ��|���A���檺
		{speaker = Global_BellatiaDuplication[room_id].ironrose, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_17]", time = 22, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time
	local team_move = AddyTeamMove:new(Global_BellatiaDuplication_FourthBoss.goto_route_flag)
	team_move:add(Global_BellatiaDuplication[room_id].pangkorrams)
	team_move:add(Global_BellatiaDuplication[room_id].morrok)
	team_move:add(Global_BellatiaDuplication[room_id].jill)
	team_move:add(Global_BellatiaDuplication[room_id].kangersy)
	team_move:add(Global_BellatiaDuplication[room_id].cassam)
	team_move.ai_tolerance = 40
	team_move.delay = 0.5
	Global_BellatiaDuplication[room_id].pangkorrams:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[1].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[1].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[1].z, 0)
	end)
	Global_BellatiaDuplication[room_id].cassam:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[2].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[2].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[2].z, 0)
	end)
	Global_BellatiaDuplication[room_id].morrok:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].z, 0)
	end)
	Global_BellatiaDuplication[room_id].kangersy:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[4].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[4].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[4].z, 0)
	end)
	Global_BellatiaDuplication[room_id].jill:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].z, 0)
	end)
	team_move:addEventListener(AddyTeamMoveEvent.AllArrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		Global_BellatiaDuplication[room_id].step = 3
	end)

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].step == 2 do
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

		-----------------------------------------------------------------
		--	���_��J����
			if #Global_BellatiaDuplication[room_id].enemies < Global_BellatiaDuplication_FourthBossDrama.drama2_balance_amount then
				for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama2_balance_amount - #Global_BellatiaDuplication[room_id].enemies do
					local _enemy = AddyMonster:new()
					local _birth_flag_index = RandRange(5, 8)
					_enemy:create(
						Global_BellatiaDuplication_FourthBossDrama.enemy_type[RandRange(1, #Global_BellatiaDuplication_FourthBossDrama.enemy_type)],
						Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].x,
						Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].y,
						Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].z)
					_enemy.patrol = false
					_enemy:addToPartition(room_id)
					table.insert(Global_BellatiaDuplication[room_id].enemies, _enemy)
				end
			end
			if #Global_BellatiaDuplication[room_id].allies < Global_BellatiaDuplication_FourthBossDrama.drama2_balance_amount then
				for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama2_balance_amount - #Global_BellatiaDuplication[room_id].allies do
					local _ally = AddyMonster:new()
					local _birth_flag_index = RandRange(5, 8)
					_ally:create(
						Global_BellatiaDuplication.ally_type[RandRange(1, #Global_BellatiaDuplication.ally_type)],
						Global_BellatiaDuplication[room_id].ironrose.x - 30 + RandRange(1, 60),
						Global_BellatiaDuplication[room_id].ironrose.y,
						Global_BellatiaDuplication[room_id].ironrose.z - 30 + RandRange(1, 60))
					_ally.patrol = false
					_ally:addToPartition(room_id)
					table.insert(Global_BellatiaDuplication[room_id].allies, _ally)
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�p�Ǥp�LAI
			for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do
				if enemy.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].enemies, index) end
		--		���p�L���p�L�A�S�p�L���K����
				if #Global_BellatiaDuplication[room_id].allies > 0 then enemy:attack(Global_BellatiaDuplication[room_id].allies[RandRange(1, #Global_BellatiaDuplication[room_id].allies)])
				else enemy:attack(Global_BellatiaDuplication[room_id].ironrose) end
			end
			for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do
				if ally.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].allies, index) end
				if #ally.hate_list <= 0 and ally:distanceTo(Global_BellatiaDuplication[room_id].ironrose) > 100 then
					ally:move(Global_BellatiaDuplication[room_id].ironrose.x - 40 + RandRange(1, 80), Global_BellatiaDuplication[room_id].ironrose.y, Global_BellatiaDuplication[room_id].ironrose.z - 40 + RandRange(1, 80), 0)
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�Ҧ�npc����
		-----------------------------------------------------------------
		if not scripts[#scripts].is_done then
			Global_BellatiaDuplication[room_id].pangkorrams:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
			Global_BellatiaDuplication[room_id].morrok:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
			Global_BellatiaDuplication[room_id].jill:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
			Global_BellatiaDuplication[room_id].kangersy:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
			Global_BellatiaDuplication[room_id].cassam:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
			Global_BellatiaDuplication[room_id].ironrose:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
		end

		-----------------------------------------------------------------
		--	�@���]���}�l����
			if scripts[#scripts].is_done and not team_move.is_active then
				for index, npc in pairs(team_move.npcs) do
					npc.movable = true
					npc.fight = false
					npc.strike_back = false
					npc.search_enemy = false
					npc:stopAttack()
					for buff_orgid, buff in pairs(npc.buff)do
						if not buff.is_good_buff then npc:cancelBuff(buff_orgid) end
					end
				end
				team_move:start()

				Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss4_say_goodbye_with_ironrose)
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end
	Global_BellatiaDuplication:debug("fourth boss drama2 loop over")

	if team_move.is_active then team_move:stop() end

	-----------------------------------------------------------------
	--	�M��t��
		for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do enemy:delete() end
		Global_BellatiaDuplication[room_id].enemies = nil
		for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do ally:delete() end
		Global_BellatiaDuplication[room_id].allies = nil
	-----------------------------------------------------------------

	Global_BellatiaDuplication[room_id].ironrose:delFromPartition()

	Global_BellatiaDuplication:debug("fourth boss drama2 end")
	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	�|���}�ԫe�@��
-----------------------------------------------------------------
--function Lua_BellatiaDuplication_FourthBoss_drama3()
--	Global_BellatiaDuplication:debug("ACTIVE > fourth boss drama3 -> Lua_BellatiaDuplication_FourthBoss_drama3()")
--	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
--	Global_BellatiaDuplication[room_id].drama_record[3] = true
--
--	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end
--
--	Sleep(30)
--
--	--	���p�J�i���G���s���عp�i���G�ڪ��B�͡A�A���¨I�q�o�ܡC���O�A�����n�A���ܡH
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_18]", 3) end
--
--	Global_BellatiaDuplication[room_id].pangkorrams:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--	Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--	Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--
--	Sleep(20)
--
--	-----------------------------------------------------------------
--	--	���s�ܨ���ı
----		Global_BellatiaDuplication[room_id].pangkorrams.hide = true
--		Global_BellatiaDuplication[room_id].pangkorrams.show = false
--		Global_BellatiaDuplication[room_id].pangkorrams.mark = false
--		Global_BellatiaDuplication[room_id].pangkorrams.movable = false
--		Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
--		Global_BellatiaDuplication[room_id].pangkorrams.strike_back = false
--		Global_BellatiaDuplication[room_id].pangkorrams.fight = false
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:setPosition(Global_BellatiaDuplication[room_id].pangkorrams.x, Global_BellatiaDuplication[room_id].pangkorrams.y, Global_BellatiaDuplication[room_id].pangkorrams.z, Global_BellatiaDuplication[room_id].pangkorrams.direction)
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:addToPartition(room_id)
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon.mark = false
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon.movable = false
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon.search_enemy = false
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon.strike_back = false
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon.fight = false
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:faceTo(Global_BellatiaDuplication[room_id].cassam)
--		Sleep(10)
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_SLEEP_BEGIN)
--		Sleep(10)
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:setIdleMotion(ruFUSION_ACTORSTATE_SLEEP_LOOP)
--		Sleep(10)
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(509923)
--	-----------------------------------------------------------------
--
--	-----------------------------------------------------------------
--	--	�k��ù�S�{��
--		Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
--		Global_BellatiaDuplication[room_id].feitlautrec.fight = false
--		Global_BellatiaDuplication[room_id].feitlautrec.movable = false
--		Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
--		Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
--		Sleep(20)
--		Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--		Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--		Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--	-----------------------------------------------------------------
--
--	--	��N�s�ϥd�����S�G�Ѥ͡A�S�Q��̫�O�ڭn�e�A�@�{�C
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_19]", 3) end
--
--	--	���p�J�i���G���s���عp�i���G�@���U�ܡA�N���ڭ̨S�ƨ�ү��箦�|�I�q�A�L�]���|�ƨ�̫�O�ѧA����ߨӤ���L���ƨg�p���C�ڪ��s�ߴN��ѧA�̫O�@�F
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_20]", 3) end
--
--	-----------------------------------------------------------------
--	--	�H���}���@�n
--		Global_BellatiaDuplication[room_id].cassam.fight = false
--		Global_BellatiaDuplication[room_id].cassam.movable = false
--		Global_BellatiaDuplication[room_id].cassam.strike_back = false
--		Global_BellatiaDuplication[room_id].cassam.search_enemy = false
--		Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
--		Sleep(20)
--		Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_BUFF_BEGIN)
--		Sleep(10)
--		Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_BUFF_LOOP)
--
--	--	�d�Ժ��D�d�ĩi�G�d�����S�K �K
--		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_21]", 3) end
--
--	--	�s�X���C
--		SetRoleEquip(Global_BellatiaDuplication[room_id].cassam.GUID, EM_EQWearPos_MainHand, 214188, 1)
--		Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN)
--		Global_BellatiaDuplication:sleep(1)
--		Global_BellatiaDuplication[room_id].cassam:setIdleMotion(ruFUSION_ACTORSTATE_CAST_LOOP)
--		Global_BellatiaDuplication[room_id].cassam.sword = AddyNpc:new()
--		Global_BellatiaDuplication[room_id].cassam.sword:create(122580, Global_BellatiaDuplication[room_id].cassam.x, Global_BellatiaDuplication[room_id].cassam.y, Global_BellatiaDuplication[room_id].cassam.z + 16)
--		Global_BellatiaDuplication[room_id].cassam.sword.fight = false
--		Global_BellatiaDuplication[room_id].cassam.sword.strike_back = false
--		Global_BellatiaDuplication[room_id].cassam.sword.search_enemy = false
--		Global_BellatiaDuplication[room_id].cassam.sword.movable = false
--		Global_BellatiaDuplication[room_id].cassam.sword:addToPartition(room_id)
--
--	--	��N�s�ϥd�����S�G�u�s�u�b�u�߫H���U�A�~�|�N�ڦ椧�v�ɪ��w���N�ѥL�H�Ӧu�@�C�A���o�ܦn
--		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_22]", 3) end
--	-----------------------------------------------------------------
--
--	-----------------------------------------------------------------
--	--	�O�@�n
--	--	�إ�16�Ӹ`�I�b�O�@�n�P��A�������s�u�������̪񪺫O�@�n�`�I
--	--	�O�@�n�b�|
--		Global_BellatiaDuplication[room_id].protective_cover = AddyNpc:new()
--		Global_BellatiaDuplication[room_id].protective_cover:create(
--			Global_BellatiaDuplication_FourthBoss.protective_cover_orgid,
--			Global_BellatiaDuplication[room_id].pangkorrams_dragon.x,
--			Global_BellatiaDuplication[room_id].pangkorrams_dragon.y,
--			Global_BellatiaDuplication[room_id].pangkorrams_dragon.z)
--		Global_BellatiaDuplication[room_id].protective_cover.fight = false
--		Global_BellatiaDuplication[room_id].protective_cover.strike_back = false
--		Global_BellatiaDuplication[room_id].protective_cover:addToPartition(room_id)
--		Global_BellatiaDuplication[room_id].protective_cover.node = {}
--
--		local angle = math.pi / 4
--		local _x = 0
--		local _y = 0
--		local _z = 0
--		local _node = nil
--		for index = 1, 16 do
--			local elevation_rate = 4
--			if index < 9 then elevation_rate = 12 end
--			_x = Global_BellatiaDuplication_FourthBoss.protective_cover_radius * math.cos(math.pi / elevation_rate) * math.sin(angle * index) + Global_BellatiaDuplication[room_id].pangkorrams_dragon.x
--			_y = Global_BellatiaDuplication_FourthBoss.protective_cover_radius * math.sin(math.pi / elevation_rate) + Global_BellatiaDuplication[room_id].pangkorrams_dragon.y
--			_z = Global_BellatiaDuplication_FourthBoss.protective_cover_radius * math.cos(math.pi / elevation_rate) * math.cos(angle * index) + Global_BellatiaDuplication[room_id].pangkorrams_dragon.z
--			_node = AddyNpc:new()
--			_node:create(Global_BellatiaDuplication_FourthBoss.protective_cover_node_orgid, _x, _y, _z)
--			_node.gravity = false
--			_node.align_to_surface = false
--			_node.strike_back = false
--			_node.search_enemy = false
--			_node.show_role_head = false
--			_node.hide_hp_mp = false
--			_node.mark = false
--			_node:addToPartition(room_id)
--	--		�O�@�n
--			_node:addBuff(624433)
--	--		���^��
--			_node:addBuff(624471)
--			table.insert(Global_BellatiaDuplication[room_id].protective_cover.node, _node)
--		end
--		Global_BellatiaDuplication[room_id].protective_cover.max_hp = Global_BellatiaDuplication[room_id].protective_cover.node[1].hp
--	--	�P���R��K��
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(624433)
--		Global_BellatiaDuplication[room_id].cassam:addBuff(624433)
--	-----------------------------------------------------------------
--
--	--	�d�Ժ��D�d�ĩi�G���F���s�A�٦��\�h�H�]�H���ۧڭ̡C
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_12]", 3) end
--	Global_BellatiaDuplication:sleep(2.5)
--
--	--	�d�Ժ��D�d�ĩi�G���藍��d�t�L�̪�����A���ڭ̦u�b�o�̡A�֤]�O�Q��}�o�D���u�I
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_13]", 3) end
--	Global_BellatiaDuplication:sleep(2.5)
--
--	--	�d�Ժ��D�d�ĩi�G�����ĺ��I�u�@�A���гy�̡I�i�{�A�u�����O�q�I
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_14]", 3) end
--	Global_BellatiaDuplication:sleep(2.5)
--
--	Global_BellatiaDuplication:debug("fourth boss drama3 end")
--	Global_BellatiaDuplication[room_id].fight_step = 1
--	Global_BellatiaDuplication[room_id].fight_step_trigger = true
--	Lua_BellatiaDuplication_change_status(room_id, "boss")
--end
function Lua_BellatiaDuplication_FourthBoss_drama3()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss drama3 -> Lua_BellatiaDuplication_FourthBoss_drama3()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[3] = true
	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	local scripts = {
		{action = function()
	--		���p�J�i���G���s���عp�i���G�ڪ��B�͡A�A���¨I�q�o�ܡC���O�A�����n�A���ܡH
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_18]", 3) end
			Global_BellatiaDuplication[room_id].pangkorrams:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
		end, time = 0, is_done = false},
	--	���s�ܨ���ı
		{action = function()
			Global_BellatiaDuplication[room_id].pangkorrams.show = false
			Global_BellatiaDuplication[room_id].pangkorrams.mark = false
			Global_BellatiaDuplication[room_id].pangkorrams.movable = false
			Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
			Global_BellatiaDuplication[room_id].pangkorrams.strike_back = false
			Global_BellatiaDuplication[room_id].pangkorrams.fight = false
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:setPosition(Global_BellatiaDuplication[room_id].pangkorrams.x, Global_BellatiaDuplication[room_id].pangkorrams.y, Global_BellatiaDuplication[room_id].pangkorrams.z, Global_BellatiaDuplication[room_id].pangkorrams.direction)
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:addToPartition(room_id)
			Global_BellatiaDuplication[room_id].pangkorrams_dragon.mark = false
			Global_BellatiaDuplication[room_id].pangkorrams_dragon.movable = false
			Global_BellatiaDuplication[room_id].pangkorrams_dragon.search_enemy = false
			Global_BellatiaDuplication[room_id].pangkorrams_dragon.strike_back = false
			Global_BellatiaDuplication[room_id].pangkorrams_dragon.fight = false
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:faceTo(Global_BellatiaDuplication[room_id].cassam)
		end, time = 2, is_done = false},
	--	������ıloop
	--	�k��ù�S�{��
		{action = function()
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_SLEEP_BEGIN)
			Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
			Global_BellatiaDuplication[room_id].feitlautrec.fight = false
			Global_BellatiaDuplication[room_id].feitlautrec.movable = false
			Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
			Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
		end, time = 3, is_done = false},
		{action = function()
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:setIdleMotion(ruFUSION_ACTORSTATE_SLEEP_LOOP)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
		end, time = 4, is_done = false},
		{action = function()
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(509923)
	--		��N�s�ϥd�����S�G�Ѥ͡A�S�Q��̫�O�ڭn�e�A�@�{�C
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_19]", 3) end
		end, time = 5, is_done = false},
		{action = function()
	--		���p�J�i���G���s���عp�i���G�@���U�ܡA�N���ڭ̨S�ƨ�ү��箦�|�I�q�A�L�]���|�ƨ�̫�O�ѧA����ߨӤ���L���ƨg�p���C�ڪ��s�ߴN��ѧA�̫O�@�F
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_20]", 3) end
		end, time = 7, is_done = false},
	--	�H���}���@�n
		{action = function()
			Global_BellatiaDuplication[room_id].cassam.fight = false
			Global_BellatiaDuplication[room_id].cassam.movable = false
			Global_BellatiaDuplication[room_id].cassam.strike_back = false
			Global_BellatiaDuplication[room_id].cassam.search_enemy = false
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
			Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_BUFF_BEGIN)
		end, time = 8, is_done = false},
		{action = function()
			Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_BUFF_LOOP)
	--		�d�Ժ��D�d�ĩi�G�d�����S�K �K
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_21]", 3) end
		end, time = 9, is_done = false},
	--	�s�X���C
		{action = function()
			SetRoleEquip(Global_BellatiaDuplication[room_id].cassam.GUID, EM_EQWearPos_MainHand, 214188, 1)
			Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN)
			Global_BellatiaDuplication:sleep(1)
			Global_BellatiaDuplication[room_id].cassam:setIdleMotion(ruFUSION_ACTORSTATE_CAST_LOOP)
			Global_BellatiaDuplication[room_id].cassam.sword = AddyNpc:new()
			Global_BellatiaDuplication[room_id].cassam.sword:create(122580, Global_BellatiaDuplication[room_id].cassam.x, Global_BellatiaDuplication[room_id].cassam.y, Global_BellatiaDuplication[room_id].cassam.z + 16)
			Global_BellatiaDuplication[room_id].cassam.sword.fight = false
			Global_BellatiaDuplication[room_id].cassam.sword.strike_back = false
			Global_BellatiaDuplication[room_id].cassam.sword.search_enemy = false
			Global_BellatiaDuplication[room_id].cassam.sword.movable = false
			Global_BellatiaDuplication[room_id].cassam.sword:addToPartition(room_id)
	--		��N�s�ϥd�����S�G�u�s�u�b�u�߫H���U�A�~�|�N�ڦ椧�v�ɪ��w���N�ѥL�H�Ӧu�@�C�A���o�ܦn
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_22]", 3) end
		end, time = 11, is_done = false},
	--	�O�@�n
		{action = function()
		--	�إ�16�Ӹ`�I�b�O�@�n�P��A�������s�u�������̪񪺫O�@�n�`�I
		--	�O�@�n�b�|
			Global_BellatiaDuplication[room_id].protective_cover = AddyNpc:new()
			Global_BellatiaDuplication[room_id].protective_cover:create(
				Global_BellatiaDuplication_FourthBoss.protective_cover_orgid,
				Global_BellatiaDuplication[room_id].pangkorrams_dragon.x,
				Global_BellatiaDuplication[room_id].pangkorrams_dragon.y,
				Global_BellatiaDuplication[room_id].pangkorrams_dragon.z)
			Global_BellatiaDuplication[room_id].protective_cover.fight = false
			Global_BellatiaDuplication[room_id].protective_cover.strike_back = false
			Global_BellatiaDuplication[room_id].protective_cover.mark = false
			Global_BellatiaDuplication[room_id].protective_cover.show_role_head = false
			Global_BellatiaDuplication[room_id].protective_cover.hide_hp_mp = true
			Global_BellatiaDuplication[room_id].protective_cover.hide_name = true
			Global_BellatiaDuplication[room_id].protective_cover:addToPartition(room_id)
			Global_BellatiaDuplication[room_id].protective_cover.node = {}

			local angle = math.pi / 4
			local _x = 0
			local _y = 0
			local _z = 0
			local _node = nil
			for index = 1, 16 do
				local elevation_rate = 4
				if index < 9 then elevation_rate = 12 end
				_x = Global_BellatiaDuplication_FourthBoss.protective_cover_radius * math.cos(math.pi / elevation_rate) * math.sin(angle * index) + Global_BellatiaDuplication[room_id].pangkorrams_dragon.x
				_y = Global_BellatiaDuplication_FourthBoss.protective_cover_radius * math.sin(math.pi / elevation_rate) + Global_BellatiaDuplication[room_id].pangkorrams_dragon.y
				_z = Global_BellatiaDuplication_FourthBoss.protective_cover_radius * math.cos(math.pi / elevation_rate) * math.cos(angle * index) + Global_BellatiaDuplication[room_id].pangkorrams_dragon.z
				_node = AddyNpc:new()
				_node:create(Global_BellatiaDuplication_FourthBoss.protective_cover_node_orgid, _x, _y, _z)
				_node.gravity = false
				_node.align_to_surface = false
				_node.strike_back = false
				_node.search_enemy = false
				_node.show_role_head = false
				_node.hide_hp_mp = false
				_node.mark = false
				_node:addToPartition(room_id)
		--		�O�@�n
				_node:addBuff(624433)
		--		���^��
				_node:addBuff(624471)
				table.insert(Global_BellatiaDuplication[room_id].protective_cover.node, _node)
			end
			Global_BellatiaDuplication[room_id].protective_cover.max_hp = Global_BellatiaDuplication[room_id].protective_cover.node[1].hp
		--	�P���R��K��
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(624433)
			Global_BellatiaDuplication[room_id].cassam:addBuff(624433)
		end, time = 12, is_done = false},
		{action = function()
			--	�d�Ժ��D�d�ĩi�G���F���s�A�٦��\�h�H�]�H���ۧڭ̡C
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_12]", 3) end
		end, time = 14, is_done = false},
		{action = function()
			--	�d�Ժ��D�d�ĩi�G���藍��d�t�L�̪�����A���ڭ̦u�b�o�̡A�֤]�O�Q��}�o�D���u�I
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_13]", 3) end
		end, time = 16, is_done = false},
		{action = function()
			--	�d�Ժ��D�d�ĩi�G�����ĺ��I�u�@�A���гy�̡I�i�{�A�u�����O�q�I
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_14]", 3) end
		end, time = 19, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].step == 3 and not scripts[#scripts].is_done do
		for index, script in pairs(scripts) do
			if not script.is_done and current_time - start_time >= script.time then
				script.action()
				script.is_done = true
				break
			end
		end
		current_time = GetSystime(0)
		Global_BellatiaDuplication:sleep(1)
	end


	Global_BellatiaDuplication:debug("fourth boss drama3 end")
	Lua_BellatiaDuplication_change_status(room_id, "boss")
	Global_BellatiaDuplication[room_id].fight_step = 1
	Global_BellatiaDuplication[room_id].fight_step_trigger = true
end

