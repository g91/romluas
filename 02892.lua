-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	�@���e
-----------------------------------------------------------------

-----------------------------------------------------------------
--	�]�w
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_setting()
	Global_BellatiaDuplication:debug("SETTING > first advance -> Lua_BellatiaDuplication_FirstAdvance_setting()")

	-----------------------------------------------------------------
	--	�q��
	-----------------------------------------------------------------
		Global_BellatiaDuplication_FirstAdvance = {}
	--	������
		Global_BellatiaDuplication_FirstAdvance.delay = 1
	--	���s���u
		Global_BellatiaDuplication_FirstAdvance.pangkorrams_route_flag = AddyFlagGroup:new(781279)
		Global_BellatiaDuplication_FirstAdvance.pangkorrams_route_flag2 = AddyFlagGroup:new(781332)
	--	����i����u
		Global_BellatiaDuplication_FirstAdvance.team_route_flag = AddyFlagGroup:new(781311)
	--	������q
		Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp = 15
		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp = 10
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp = 7
		end

	-----------------------------------------------------------------
	--	�����
	-----------------------------------------------------------------
	--	����̺���
		Global_BellatiaDuplication_FirstAdvance.enemy_type = Global_BellatiaDuplication.enemy_type
	--	����̥X���I
		Global_BellatiaDuplication_FirstAdvance.enemy_birth_flag = AddyFlagGroup:new(781276)
	--	����̸��u
		Global_BellatiaDuplication_FirstAdvance.enemy_route_flag = AddyFlagGroup:new(781278)
	--	�����̤j�ƶq
		Global_BellatiaDuplication_FirstAdvance.enemy_maximum = 8
	--	�����̤p�ƶq
		Global_BellatiaDuplication_FirstAdvance.enemy_minimum = 4
	--	�X�ͩ�����
		Global_BellatiaDuplication_FirstAdvance.enemy_delay = 10
		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FirstAdvance.enemy_maximum = 6
			Global_BellatiaDuplication_FirstAdvance.enemy_minimum = 3
			Global_BellatiaDuplication_FirstAdvance.enemy_delay = 10
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FirstAdvance.enemy_maximum = 3
			Global_BellatiaDuplication_FirstAdvance.enemy_minimum = 2
			Global_BellatiaDuplication_FirstAdvance.enemy_delay = 10
		end
	--	��qbuff
		Global_BellatiaDuplication_FirstAdvance.power_buff = 620844
	--	����buff
		Global_BellatiaDuplication_FirstAdvance.fire_buff = 624261
	--	���x�W�p�ǥX���I
		Global_BellatiaDuplication_FirstAdvance.plat_enemy_birth_flag = AddyFlagGroup:new(781333)
	--	���x�W�p�Ǻ���
		Global_BellatiaDuplication_FirstAdvance.plat_enemy_type = {103000, 103369, 103368}

	-----------------------------------------------------------------
	--	�p���L
	-----------------------------------------------------------------
	--	�p���L����
		Global_BellatiaDuplication_FirstAdvance.ally_type = Global_BellatiaDuplication.ally_type
	--	�p���L�X���I
		Global_BellatiaDuplication_FirstAdvance.ally_birth_flag = AddyFlagGroup:new(781277)
	--	�p���L���u
		Global_BellatiaDuplication_FirstAdvance.ally_route_flag = AddyFlagGroup:new(781283)
	--	�����̤j�ƶq
		Global_BellatiaDuplication_FirstAdvance.ally_maximum = 6
	--	�����̤p�ƶq
		Global_BellatiaDuplication_FirstAdvance.ally_minimum = 4
	--	�X�ͩ�����
		Global_BellatiaDuplication_FirstAdvance.ally_delay = 10
		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FirstAdvance.ally_maximum = 4
			Global_BellatiaDuplication_FirstAdvance.ally_minimum = 3
			Global_BellatiaDuplication_FirstAdvance.ally_delay = 10
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FirstAdvance.ally_maximum = 3
			Global_BellatiaDuplication_FirstAdvance.ally_minimum = 3
			Global_BellatiaDuplication_FirstAdvance.ally_delay = 10
		end
end

-----------------------------------------------------------------
--	��l��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_initialize(room_id)
	Global_BellatiaDuplication:debug("INIT > first advance -> Lua_BellatiaDuplication_FirstAdvance_initialize()")
	if not Global_BellatiaDuplication_FirstAdvance or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FirstAdvance_setting() end

	-----------------------------------------------------------------
	--	����
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].battle_listener = AddyBattleListener:new()
	Global_BellatiaDuplication[room_id].is_stop_product = true
	Global_BellatiaDuplication[room_id].door_is_broken = false
	--	���W�����
	Global_BellatiaDuplication[room_id].enemies_team_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.enemy_route_flag)
	Global_BellatiaDuplication[room_id].enemies_team_move.move_tolerance = 30
	Global_BellatiaDuplication[room_id].enemies_last_produce_time = nil
	--	���W�p���L
	Global_BellatiaDuplication[room_id].allies_team_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.ally_route_flag)
	Global_BellatiaDuplication[room_id].allies_team_move.move_tolerance = 30
	Global_BellatiaDuplication[room_id].allies_last_produce_time = nil
	--	���x�p��
	Global_BellatiaDuplication[room_id].plat_enemies = {}
	--	�h�L�{�t
	Global_BellatiaDuplication[room_id].soldiers = {}

	Global_BellatiaDuplication[room_id].pangkorrams_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.pangkorrams_route_flag)
	Global_BellatiaDuplication[room_id].pangkorrams_move.move_tolerance = 10
	Global_BellatiaDuplication[room_id].pangkorrams_move:addEventListener(AddyTeamMoveEvent.AllArrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.AllArrived)
		event.target:stop()
		if Global_BellatiaDuplication[room_id].door_first_advance.hit_counter >= Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp then Global_BellatiaDuplication[room_id].door_is_broken = true end
	end)
	Global_BellatiaDuplication[room_id].pangkorrams_move:add(Global_BellatiaDuplication[room_id].pangkorrams)

	Global_BellatiaDuplication[room_id].npc_team_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.team_route_flag)
	Global_BellatiaDuplication[room_id].npc_team_move.move_tolerance = 30
	Global_BellatiaDuplication[room_id].npc_team_move:addEventListener(AddyTeamMoveEvent.AllArrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.AllArrived)
		event.target:stop()
	end)
	Global_BellatiaDuplication[room_id].npc_team_move:add(Global_BellatiaDuplication[room_id].morrok)
	Global_BellatiaDuplication[room_id].npc_team_move:add(Global_BellatiaDuplication[room_id].jill)
	Global_BellatiaDuplication[room_id].npc_team_move:add(Global_BellatiaDuplication[room_id].cassam)
	Global_BellatiaDuplication[room_id].npc_team_move:add(Global_BellatiaDuplication[room_id].kangersy)
	Global_BellatiaDuplication[room_id].npc_team_move:add(Global_BellatiaDuplication[room_id].ironrose)
	Global_BellatiaDuplication[room_id].cassam:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:delFromPartition()
	end)
	Global_BellatiaDuplication[room_id].kangersy:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:delFromPartition()
	end)
	Global_BellatiaDuplication[room_id].ironrose:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
		event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
		event.target:delFromPartition()
	end)

	-----------------------------------------------------------------
	--	��t
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].step = 1
	Global_BellatiaDuplication[room_id].step_trigger = true

	Lua_BellatiaDuplication_change_status(room_id, "advance")
end

-----------------------------------------------------------------
--	�Ұ�
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_active()
	Global_BellatiaDuplication:debug("ACTIVE > first advance -> Lua_BellatiaDuplication_FirstAdvance_active()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_FirstAdvance_initialize(room_id)

	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FirstAdvance_rush")

	-----------------------------------------------------------------
	--	�����ȺX��
	-----------------------------------------------------------------
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		if CheckAcceptQuest(player.GUID, 426269) then SetFlag(player.GUID, 548220, 1) end
	end

	local _counter = 0
	local duration = 0

	Global_BellatiaDuplication:debug("first advance main loop start")
	while Lua_BellatiaDuplication_check_status(room_id, "advance") do

		Lua_BellatiaDuplication_update_players(room_id)
		Global_BellatiaDuplication[room_id].battle_listener:start()
		duration = Global_BellatiaDuplication[room_id].battle_listener.current_time - Global_BellatiaDuplication[room_id].battle_listener.start_time

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FirstAdvance.delay)


		if Global_BellatiaDuplication[room_id].step >= 3 then
		--	�ڱo�������}�W���԰��O�d�O�q�A�]�k��}�e�誺��q�پ��a�I
			if duration % 40 == 0 then Global_BellatiaDuplication[room_id].pangkorrams:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_33]", 5) end
		--	�L�̥��Q�Φa�Χ����I�����I
			if duration % 36 == 0 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_31]", 2) end
		--	������@�̳]�m���q��Ť�W�Ϩ�襭�x�W�������
			if duration % 36 == 3 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_32]", 2) end
		--	�ڱo�������}�W���԰��O�d�O�q�A�]�k��}�e�誺��q�پ��a�I
			if duration % 36 == 6 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_34]", 2) end
		--	������@�̳]�m���P�K�Ť�W�H�z�Z��q�پ�
			if duration % 36 == 9 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_35]", 2) end
		--	�Q�κ��@�̦ۨ����෽�ɥR�o�ǲŤ�W�I
			if duration % 36 == 12 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_36]", 2) end
		end

		-----------------------------------------------------------------
		--	��t
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].step_trigger and Global_BellatiaDuplication[room_id].step == 1 then
			Global_BellatiaDuplication[room_id].step_trigger = false
			Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FirstAdvance_drama1")
		end
		if Global_BellatiaDuplication[room_id].step_trigger and Global_BellatiaDuplication[room_id].step == 2 then
			Global_BellatiaDuplication[room_id].step_trigger = false
			Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FirstAdvance_drama2")
		end
		if Global_BellatiaDuplication[room_id].step_trigger and Global_BellatiaDuplication[room_id].step == 3 then
			Global_BellatiaDuplication[room_id].step_trigger = false
			Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FirstAdvance_drama3")
		end

		-----------------------------------------------------------------
		--	Ĳ�o��t
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].pangkorrams.move_target and
		   Global_BellatiaDuplication[room_id].pangkorrams.move_target > 1 and
		   Global_BellatiaDuplication[room_id].step == 1 then
			Global_BellatiaDuplication[room_id].step = 2
			Global_BellatiaDuplication[room_id].step_trigger = true
		end

		if Global_BellatiaDuplication[room_id].pangkorrams.move_target and
		   Global_BellatiaDuplication[room_id].pangkorrams.move_target > 5 and
		   Global_BellatiaDuplication[room_id].step == 2 then
			Global_BellatiaDuplication[room_id].step = 3
			Global_BellatiaDuplication[room_id].step_trigger = true
		end

		if not Global_BellatiaDuplication[room_id].pangkorrams_move.is_active and Global_BellatiaDuplication[room_id].door_is_broken then
			Global_BellatiaDuplication[room_id].pangkorrams_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.pangkorrams_route_flag2)
		--	�ڭ̤w�g��J���Ը��Ȥ������c�����A����ĵı...
			Global_BellatiaDuplication[room_id].pangkorrams:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_38]", 5)
			Global_BellatiaDuplication[room_id].pangkorrams_move:addEventListener(AddyTeamMoveEvent.AllArrived, function(event)
				event.target:removeEventListener(AddyTeamMoveEvent.AllArrived)
				event.target:stop()
		--		���U�Ӫ��԰��N��[�Y�m�A���n�ǳƤ���i�D��
				Global_BellatiaDuplication[room_id].pangkorrams:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_39]", 5)
				Lua_BellatiaDuplication_change_status(room_id, "success")
			end)
			Global_BellatiaDuplication[room_id].pangkorrams_move:add(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].pangkorrams_move:start()
		end

		-----------------------------------------------------------------
		--	�ˬd
		-----------------------------------------------------------------
		--	�H�ƭp�ƾ�
		_counter = 0
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		--	���a���b�ƥ��ж����p�ƾ�+1
			if player.room_id ~= room_id or player.hp <= 0 then _counter = _counter + 1 end
		end
		if _counter >= #Global_BellatiaDuplication[room_id].players or #Global_BellatiaDuplication[room_id].players == 0 then
		--	�p�G�Ҧ��H�����b�ж����P�_�����Υ���
			Lua_BellatiaDuplication_change_status(room_id, "fail")
		end
	end
	Global_BellatiaDuplication[room_id].battle_listener:stop()
	Global_BellatiaDuplication:debug("first advance main loop over")

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].morrok.GUID, ruFUSION_MIME_IDLE_STAND)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].jill.GUID, ruFUSION_MIME_IDLE_STAND)

	if Global_BellatiaDuplication[room_id].npc_team_move.is_active then
		Global_BellatiaDuplication[room_id].npc_team_move:stop()
		Global_BellatiaDuplication:debug("npc_team_move stop")
	end
	if Global_BellatiaDuplication[room_id].pangkorrams_move.is_active then
		Global_BellatiaDuplication[room_id].pangkorrams_move:stop()
		Global_BellatiaDuplication:debug("pangkorrams_move stop")
	end

	while not Global_BellatiaDuplication[room_id].is_stop_product do Global_BellatiaDuplication:sleep(1) end

	-----------------------------------------------------------------
	--	������M�������U��
	-----------------------------------------------------------------
	--	�M�������
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies_team_move.npcs) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #enemies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].enemies_team_move.npcs)
	Global_BellatiaDuplication[room_id].enemies_team_move.npcs = {}
	--	�M���p���L
	for index, ally in pairs(Global_BellatiaDuplication[room_id].allies_team_move.npcs) do ally:delete() end
	Global_BellatiaDuplication:debug("first advance, ally rush, #allies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].allies_team_move.npcs)
	Global_BellatiaDuplication[room_id].allies_team_move.npcs = {}
	--	�M����t�h�L
	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do soldier:delete() end
	Global_BellatiaDuplication[room_id].soldiers = nil
	--	�M�����x�p��
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].plat_enemies) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #plat_enemies = " .. #Global_BellatiaDuplication[room_id].plat_enemies)
	Global_BellatiaDuplication[room_id].plat_enemies = {}

	-----------------------------------------------------------------
	--	�M�ܼ�
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].is_stop_product = nil
	Global_BellatiaDuplication[room_id].enemies_team_move = nil
	Global_BellatiaDuplication[room_id].allies_team_move = nil
	Global_BellatiaDuplication[room_id].soldiers = nil
	Global_BellatiaDuplication[room_id].plat_enemies = nil
	Global_BellatiaDuplication[room_id].pangkorrams_move = nil
	Global_BellatiaDuplication[room_id].npc_team_move = nil

	-----------------------------------------------------------------
	--	�ӧQ�M���Ѫ��B�z
	-----------------------------------------------------------------
	--	�ӧQ
	if Lua_BellatiaDuplication_check_status(room_id, "success") then
		Global_BellatiaDuplication:debug("first advance success")
		Lua_BellatiaDuplication_update_save_point(room_id)
	end
	--	����
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication:debug("first advance fail")
		Lua_BellatiaDuplication_fail()
	end
end

-----------------------------------------------------------------
--	�Ѱ������
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_rush()
	Global_BellatiaDuplication:debug("ACTIVE > first advance rush -> Lua_BellatiaDuplication_FirstAdvance_rush()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].is_stop_product = false

	-----------------------------------------------------------------
	--	�}��npc�����
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].enemies_team_move:start()
	Global_BellatiaDuplication[room_id].allies_team_move:start()

	while Lua_BellatiaDuplication_check_status(room_id, "advance") and not Global_BellatiaDuplication[room_id].door_is_broken do
		-----------------------------------------------------------------
		--	�Ͳ������&�p���L
		-----------------------------------------------------------------
		--	�����
		if not Global_BellatiaDuplication[room_id].enemies_last_produce_time or
		   #Global_BellatiaDuplication[room_id].enemies_team_move.npcs < Global_BellatiaDuplication_FirstAdvance.enemy_maximum and
		   GetSystime(0) - Global_BellatiaDuplication[room_id].enemies_last_produce_time >= Global_BellatiaDuplication_FirstAdvance.enemy_delay then
			repeat
				local soldier = AddyMonster:new()
				local _birthplace = Global_BellatiaDuplication_FirstAdvance.enemy_birth_flag[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.enemy_birth_flag)]
				soldier:create(Global_BellatiaDuplication_FirstAdvance.enemy_type[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.enemy_type)], _birthplace.x, _birthplace.y, _birthplace.z, _birthplace.direction)
				soldier:addToPartition(room_id)
				soldier.patrol = false
				soldier.is_walk = 0
				if RandRange(1, 2) > 1 then soldier:addBuff(Global_BellatiaDuplication_FirstAdvance.power_buff)
				else soldier:addBuff(Global_BellatiaDuplication_FirstAdvance.fire_buff) end
				LockHP(soldier.GUID, 1, "Lua_BellatiaDuplication_ad1dead")
				Global_BellatiaDuplication[room_id].enemies_team_move:add(soldier)
				soldier:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
					event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
					event.target:delete()
				end)
			until #Global_BellatiaDuplication[room_id].enemies_team_move.npcs >= Global_BellatiaDuplication_FirstAdvance.enemy_minimum
			Global_BellatiaDuplication[room_id].enemies_last_produce_time = GetSystime(0)
			Global_BellatiaDuplication:debug("first advance, enemy rush, #enemies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].enemies_team_move.npcs)
		end
		--	�p���L
		if not Global_BellatiaDuplication[room_id].allies_last_produce_time or
		   #Global_BellatiaDuplication[room_id].allies_team_move.npcs < Global_BellatiaDuplication_FirstAdvance.ally_maximum and
		   GetSystime(0) - Global_BellatiaDuplication[room_id].allies_last_produce_time >= Global_BellatiaDuplication_FirstAdvance.ally_delay then
			repeat
				local soldier = AddyMonster:new()
				local _birthplace = Global_BellatiaDuplication_FirstAdvance.ally_birth_flag[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.ally_birth_flag)]
				soldier:create(Global_BellatiaDuplication_FirstAdvance.ally_type[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.ally_type)], _birthplace.x, _birthplace.y, _birthplace.z, _birthplace.direction)
				soldier:addToPartition(room_id)
				soldier.patrol = false
				soldier.is_walk = 0
				Global_BellatiaDuplication[room_id].allies_team_move:add(soldier)
				soldier:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
					event.target:removeEventListener(AddyTeamMoveEvent.Arrived)
					event.target:delete()
				end)
			until #Global_BellatiaDuplication[room_id].allies_team_move.npcs >= Global_BellatiaDuplication_FirstAdvance.ally_minimum
			Global_BellatiaDuplication[room_id].allies_last_produce_time = GetSystime(0)
			Global_BellatiaDuplication:debug("first advance, enemy rush, #allies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].allies_team_move.npcs)
		end
		--	�ͥ��x�p��
		if not Global_BellatiaDuplication[room_id].plat_enemies_last_produce_time or
		   #Global_BellatiaDuplication[room_id].plat_enemies < Global_BellatiaDuplication_FirstAdvance.enemy_maximum and
		   GetSystime(0) - Global_BellatiaDuplication[room_id].plat_enemies_last_produce_time >= Global_BellatiaDuplication_FirstAdvance.enemy_delay then
			repeat
				local soldier = AddyMonster:new()
				local _birthplace = Global_BellatiaDuplication_FirstAdvance.plat_enemy_birth_flag[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.plat_enemy_birth_flag)]
				soldier:create(Global_BellatiaDuplication_FirstAdvance.plat_enemy_type[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.plat_enemy_type)], _birthplace.x, _birthplace.y, _birthplace.z, _birthplace.direction)
				soldier:addToPartition(room_id)
				soldier.patrol = false
				soldier.is_walk = 0
				soldier:beginPlot("Lua_BellatiaDuplication_platai")
				table.insert(Global_BellatiaDuplication[room_id].plat_enemies, soldier)
			until #Global_BellatiaDuplication[room_id].plat_enemies >= Global_BellatiaDuplication_FirstAdvance.enemy_minimum
			Global_BellatiaDuplication[room_id].plat_enemies_last_produce_time = GetSystime(0)
			Global_BellatiaDuplication:debug("first advance, enemy rush, #plat_enemies = " .. #Global_BellatiaDuplication[room_id].plat_enemies)
		end

		for index, soldier in pairs(Global_BellatiaDuplication[room_id].plat_enemies) do
			if soldier.hp <= 0 or not CheckID(soldier.GUID) then table.remove(Global_BellatiaDuplication[room_id].plat_enemies, index) end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FirstAdvance.delay)
	end

	Global_BellatiaDuplication[room_id].enemies_team_move:stop()
	Global_BellatiaDuplication[room_id].allies_team_move:stop()

	--	�M�������
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies_team_move.npcs) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #enemies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].enemies_team_move.npcs)
	--	�M���p���L
	for index, ally in pairs(Global_BellatiaDuplication[room_id].allies_team_move.npcs) do ally:delete() end
	Global_BellatiaDuplication:debug("first advance, ally rush, #allies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].allies_team_move.npcs)
	--	�M�����x�p��
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].plat_enemies) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #plat_enemies = " .. #Global_BellatiaDuplication[room_id].plat_enemies)

	Global_BellatiaDuplication:debug("first advance rush end")
	Global_BellatiaDuplication[room_id].is_stop_product = true
end

-----------------------------------------------------------------
--	��t1
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_drama1()
	Global_BellatiaDuplication:debug("ACTIVE > first advance drama1 -> Lua_BellatiaDuplication_FirstAdvance_drama1()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local start_time = GetSystime(0)
	local current_time = start_time

	-----------------------------------------------------------------
	--	���{�t
	-----------------------------------------------------------------
	for index = 1, 4 do
		local _soldier = AddyAlly:new()
		_soldier:create(
			Global_BellatiaDuplication_FirstAdvance.ally_type[RandRange(1, #Global_BellatiaDuplication_FirstAdvance.ally_type)],
			Global_BellatiaDuplication[room_id].pangkorrams.x - 280 + RandRange(1, 60),
			Global_BellatiaDuplication[room_id].pangkorrams.y,
			Global_BellatiaDuplication[room_id].pangkorrams.z - 30 + RandRange(1, 60))
		_soldier:addToPartition(room_id)
		_soldier.patrol = false
		_soldier.is_walk = 0
		_soldier:move(
			Global_BellatiaDuplication[room_id].pangkorrams.x - 50 - RandRange(1, 50),
			Global_BellatiaDuplication[room_id].pangkorrams.y,
			Global_BellatiaDuplication[room_id].pangkorrams.z - 60 + RandRange(1, 120), 0)
		table.insert(Global_BellatiaDuplication[room_id].soldiers, _soldier)
	end
	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do
	--	�Ҧ��{�t�[�J����
		Global_BellatiaDuplication[room_id].npc_team_move:add(soldier)
	--	��F��R��
		soldier:addEventListener(AddyTeamMoveEvent.Arrived, function(event)
			event.target:removeEventListener(AddyTeamMoveEvent.AllArrived)
			event.target:delete()
		end)
	end

	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
	Global_BellatiaDuplication[room_id].ironrose:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)

	-----------------------------------------------------------------
	--	��t
	-----------------------------------------------------------------
	local scripts = {
	--	���s���p�J�i���G�ү��箦���ҧ@�Ҭ��N�M�ΩҦ��촵�먺�����F�A�L�����N�Ѩ�ۤv����L���M�I���ɽu�A�ڭ̤@�w�n����L�I
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_1]", time = 1, is_done = false},
	--	���s���p�J�i���G�L�}�a�k��ù�S���ʦL�A�O�o�ѥi�Ȫ��O�q���^�촵�먺�C
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_2]", time = 4, is_done = false},
	--	���s���p�J�i���G�ٷQ�B�Ϊk��ù�S���O�q�}�a�t�@�Ӥ������ʦL�A��O�k��ù�S�A�N�i��N�촵�먺�Ƭ��@�������A�Y�O�A�h�@�W�������A��G����......
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_3]", time = 7, is_done = false},
	--	���s���p�J�i���G�]���A�ڭ̤��骺�ԪG�N�M�w�촵�먺���R�B�I�i��I���F�촵�먺�I
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_4]", time = 10, is_done = false},
	--	�H���d�Ժ��D�d�ĩi�G�ڽ�W�d�ĩi�@�ڤ��W�A�H������A�o�}�@�w�|���Ѱү��箦�I���H�L�����ߩM�ޭp�I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_5]", time = 13, is_done = false},
	--	���������x�d�����G���ӭp���A�ڭ̥����Y�}�a�L�̪����èt�ΡA���q����ʪ����ɶ��I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_6]", time = 16, is_done = false}
	}

	while Lua_BellatiaDuplication_check_status(room_id, "advance") and not scripts[#scripts].is_done do
		current_time = GetSystime(0)
		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end
	--	��t����X�o
		if scripts[#scripts].is_done and not Global_BellatiaDuplication[room_id].npc_team_move.is_active and not Global_BellatiaDuplication[room_id].pangkorrams_move.is_active then
			Global_BellatiaDuplication[room_id].npc_team_move:start()
			Global_BellatiaDuplication[room_id].pangkorrams_move:start()
			Global_BellatiaDuplication[room_id].door_entrance:delFromPartition()
		end
		Global_BellatiaDuplication:sleep(1)
	end
	
	Global_BellatiaDuplication:debug("first advance drama1 end")
end

-----------------------------------------------------------------
--	��t2
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_drama2()
	Global_BellatiaDuplication:debug("ACTIVE > first advance drama2 -> Lua_BellatiaDuplication_FirstAdvance_drama2()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local start_time = GetSystime(0)
	local current_time = start_time
	local npcs = {Global_BellatiaDuplication[room_id].cassam, Global_BellatiaDuplication[room_id].ironrose}
	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do table.insert(npcs, soldier) end

	-----------------------------------------------------------------
	--	��t
	-----------------------------------------------------------------
	local scripts = {
	--	�f�P�̨t�Ρy���X�z�G�A�̸չϪ������Ѻ��@�̱�����ϡA�M��ڤ誺�O�q�N�|�촲�H�گu���ӭn�D�D�H�s�W���n�����
		{speaker = "scriptMessage", content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_7]", time = 1, is_done = false},
	--	�f�P�̨t�Ρy���X�z�G�A�����Ӫ��D�o�ئ�ʥu�|�a�Ӥ@�ؤU���a�H
		{speaker = "scriptMessage", content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_11]", time =4, is_done = false},
	--	�d�����G�ݨӦ��H�Q���ڭ̿���w�ﬣ��H
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_12]", time = 7, is_done = false},
	--	���p�J�i���G�i�h�̡A�H���~��V�e���ħa�I�d�����A�A�̯���_�o�ǰl�L�ܡH
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_13]", time = 10, is_done = false},
	--	�d�����G��o�ǲr�k�ӻ����Ӥ��O���ơA�d���̡I�@�����O��L�h�I
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_14]", time = 13, is_done = false},
	--	�d�ĩi�G�d�����A�کM��Z�g���j�𥦭̤@���I
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_15]", time = 16, is_done = false},
	--	��Z�g�G�H���A�z���I�ᦳ�ڦu�@�ۡC
		{speaker = Global_BellatiaDuplication[room_id].ironrose, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_16]", time = 19, is_done = false}
	}

	while Lua_BellatiaDuplication_check_status(room_id, "advance") and not scripts[#scripts].is_done do
		current_time = GetSystime(0)
		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]" .. script.content, 3) end
				else script.speaker:say(script.content, 5) end
			end
		end
	--	��t�L��X�o
		if scripts[#scripts].is_done then
			for index, npc in pairs(npcs) do
				npc.fight = false
				npc.strike_back = false
				npc.search_enemy = false
				npc:stopAttack()
				for buff_orgid, buff in pairs(npc.buff) do
					if not buff.is_good_buff then npc:cancelBuff(buff_orgid) end
				end
			end
			Global_BellatiaDuplication:sleep(2)
			for index, npc in pairs(npcs) do
				npc.fight = true
				npc.strike_back = true
				npc.search_enemy = true
			end
		end
		Global_BellatiaDuplication:sleep(1)
	end

	Global_BellatiaDuplication:debug("first advance drama2 end")
end

-----------------------------------------------------------------
--	��t3
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_drama3()
	Global_BellatiaDuplication:debug("ACTIVE > first advance drama3 -> Lua_BellatiaDuplication_FirstAdvance_drama3()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local start_time = GetSystime(0)
	local current_time = start_time

	-----------------------------------------------------------------
	--	��l���A�]�w
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].morrok.gravity = false
	Global_BellatiaDuplication[room_id].morrok.align_to_surface = false
	Global_BellatiaDuplication[room_id].morrok.fight = false
	Global_BellatiaDuplication[room_id].morrok.strike_back = false
	Global_BellatiaDuplication[room_id].morrok.search_enemy = false
	Global_BellatiaDuplication[room_id].morrok:stopAttack()
	for buff_orgid, buff in pairs(Global_BellatiaDuplication[room_id].morrok.buff) do Global_BellatiaDuplication[room_id].morrok:cancelBuff(buff_orgid) end
	Global_BellatiaDuplication[room_id].jill.gravity = false
	Global_BellatiaDuplication[room_id].jill.align_to_surface = false
	Global_BellatiaDuplication[room_id].jill.fight = false
	Global_BellatiaDuplication[room_id].jill.strike_back = false
	Global_BellatiaDuplication[room_id].jill.search_enemy = false
	Global_BellatiaDuplication[room_id].jill:stopAttack()
	for buff_orgid, buff in pairs(Global_BellatiaDuplication[room_id].jill.buff) do Global_BellatiaDuplication[room_id].jill:cancelBuff(buff_orgid) end

	-----------------------------------------------------------------
	--	��t
	-----------------------------------------------------------------
	local scripts = {
	--	����J�E��L�S�G�N��A�ڭ̱q�Ť��]�ۼĤH�C
		{speaker = Global_BellatiaDuplication[room_id].morrok, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_17]", time =1, is_done = false},
	--	�N��E��J���G���I
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_18]", time = 3, is_done = false}
	}

	while Lua_BellatiaDuplication_check_status(room_id, "advance") and not scripts[#scripts].is_done do
		current_time = GetSystime(0)
		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end
	--	��t����X�o
		if scripts[#scripts].is_done then
			SetDefIdleMotion(Global_BellatiaDuplication[room_id].morrok.GUID, ruFUSION_MIME_RUN_FORWARD)
			SetDefIdleMotion(Global_BellatiaDuplication[room_id].jill.GUID, ruFUSION_MIME_RUN_FORWARD)

			Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication[room_id].morrok.x, Global_BellatiaDuplication[room_id].morrok.y + 150, Global_BellatiaDuplication[room_id].morrok.z + 500, 0)
			Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication[room_id].jill.x, Global_BellatiaDuplication[room_id].jill.y + 150, Global_BellatiaDuplication[room_id].jill.z + 500, 0)

			Global_BellatiaDuplication:sleep(2)
			Global_BellatiaDuplication[room_id].morrok:delFromPartition()
			Global_BellatiaDuplication[room_id].jill:delFromPartition()
		end
		Global_BellatiaDuplication:sleep(1)
	end

	Global_BellatiaDuplication:debug("first advance drama3 end")
end