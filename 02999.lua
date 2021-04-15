

-----------------------------------------------------------------
--	��t
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_drama()
	Global_BellatiaDuplication:debug("ACTIVE > second advance drama -> Lua_BellatiaDuplication_SecondAdvance_drama()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_SecondAdvance_drama_initialize(room_id)

	local pangkorrams = Global_BellatiaDuplication[room_id].pangkorrams
	local morrok = Global_BellatiaDuplication[room_id].morrok
	local jill = Global_BellatiaDuplication[room_id].jill
	local kangersy = Global_BellatiaDuplication[room_id].kangersy
	local cassam = Global_BellatiaDuplication[room_id].cassam
	local ironrose = Global_BellatiaDuplication[room_id].ironrose
	local ant_product_trigger = false

	pangkorrams:move(pangkorrams.x, pangkorrams.y, pangkorrams.z)
	pangkorrams:playMotion(ruFUSION_ACTORSTATE_CROUCH_BEGIN)

	-----------------------------------------------------------------
	--	���J�p�i���G�f�P�̤ާڭ̨즹�A�����u�O�Ф@�몺�w�ǩ_���w��ڭ̡C
		pangkorrams:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_01]", 5)
		pangkorrams:faceTo(Global_BellatiaDuplication[room_id].players[RandRange(1, #Global_BellatiaDuplication[room_id].players)])
		Sleep(25)
	--	���J�p�i���G�����D�O�����A���Y���ѨM�o�Ǯw�ǩ_�ơA�N���i�����ү��箦
		pangkorrams:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_02]", 5)
		pangkorrams:adjustDirection(90)
		Sleep(35)
	--	�����s�K�۬��Y�����P�򪺰��i�סC��
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_SECOND_ADVANCE_03]", 3) end
		pangkorrams:playMotion(ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		Sleep(35)
	--	���J�p�i���G�u��j���}�F�A���a�I
		pangkorrams:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_04]", 5)
		pangkorrams.is_walk = 1
		pangkorrams:move(pangkorrams.x, pangkorrams.y, pangkorrams.z + 20, 0)
		Sleep(15)
		pangkorrams.is_walk = 0
	--	�d�����G�K�㵥���I
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do kangersy:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_SECOND_ADVANCE_05]", 3) end
		Sleep(5)
		pangkorrams:move(pangkorrams.x, pangkorrams.y, pangkorrams.z)
		pangkorrams:faceTo(kangersy)
	-----------------------------------------------------------------

	morrok:setPosition(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x + RandRange(1, 60), Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z - 30 + RandRange(1, 60))
	jill:setPosition(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x + RandRange(1, 60), Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z - 30 + RandRange(1, 60))
	kangersy:setPosition(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x + RandRange(40, 60), Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z - 30 + RandRange(1, 60))
	cassam:setPosition(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x + RandRange(1, 60), Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z - 30 + RandRange(1, 60))
	ironrose:setPosition(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x + RandRange(1, 60), Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z - 30 + RandRange(1, 60))
	morrok:addToPartition(room_id)
	morrok.gravity = true
	jill:addToPartition(room_id)
	jill.gravity = true
	kangersy:addToPartition(room_id)
	cassam:addToPartition(room_id)
	ironrose:addToPartition(room_id)

	for index = 1, 4 do
		local _soldier = AddyAlly:new()
		_soldier:create(
			Global_BellatiaDuplication.ally_type[RandRange(1, #Global_BellatiaDuplication.ally_type)],
			Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x - RandRange(1, 20),
			Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y,
			Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z - 30 + RandRange(1, 60))
		_soldier:addToPartition(room_id)
		_soldier.patrol = false
		_soldier.is_walk = 0
		table.insert(Global_BellatiaDuplication[room_id].soldiers, _soldier)
	end

	local npcs = {morrok, jill, kangersy, cassam, ironrose}
	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do table.insert(npcs, soldier) end

	-----------------------------------------------------------------
	--	�e�����s
		for index, npc in pairs(npcs) do
			npc:move(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[21].x, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[21].y, Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[21].z, 0)
			npc.fight = true
			npc.strike_back = true
			npc.search_enemy = true
		end
		Sleep(20)
		morrok:move(Global_BellatiaDuplication.npc_initial_position_flag[42].x, Global_BellatiaDuplication.npc_initial_position_flag[42].y, Global_BellatiaDuplication.npc_initial_position_flag[42].z, 0)
		jill:move(Global_BellatiaDuplication.npc_initial_position_flag[43].x, Global_BellatiaDuplication.npc_initial_position_flag[43].y, Global_BellatiaDuplication.npc_initial_position_flag[43].z, 0)
		cassam:move(Global_BellatiaDuplication.npc_initial_position_flag[45].x, Global_BellatiaDuplication.npc_initial_position_flag[45].y, Global_BellatiaDuplication.npc_initial_position_flag[45].z, 0)
		ironrose:move(Global_BellatiaDuplication.npc_initial_position_flag[46].x, Global_BellatiaDuplication.npc_initial_position_flag[46].y, Global_BellatiaDuplication.npc_initial_position_flag[46].z, 0)
		for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do
			soldier:move(Global_BellatiaDuplication.npc_initial_position_flag[46].x - 40 + RandRange(1, 80), Global_BellatiaDuplication.npc_initial_position_flag[46].y, Global_BellatiaDuplication.npc_initial_position_flag[46].z - 40 + RandRange(1, 80), 0)
		end
		pangkorrams:move(Global_BellatiaDuplication.npc_initial_position_flag[41].x, Global_BellatiaDuplication.npc_initial_position_flag[41].y, Global_BellatiaDuplication.npc_initial_position_flag[41].z, 0)
	--	�d�������ʩ���A�d������F��}�l�@��
		kangersy:move(Global_BellatiaDuplication.npc_initial_position_flag[44].x, Global_BellatiaDuplication.npc_initial_position_flag[44].y, Global_BellatiaDuplication.npc_initial_position_flag[44].z)
		Sleep(15)
	-----------------------------------------------------------------

	-----------------------------------------------------------------
		pangkorrams:faceTo(kangersy)
		kangersy:faceTo(pangkorrams)
		morrok:faceTo(pangkorrams)
		cassam:faceTo(pangkorrams)
		ironrose:faceTo(pangkorrams)
	--	�d�����G�ڭ̳Q�ĤH�G��@�B�I���p�����ڡI
		kangersy:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_06]", 5)
		Sleep(15)
	--	���J�p�i���G�ڭ̳Q�w�ǩ_�ƥ]��F......
		pangkorrams:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_17]", 5)
		Sleep(25)
	--	�d�����G�Ӧ��I�o�Ǯw�ǩ_�ƫ����]�������I
		kangersy:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_09]", 5)
		kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)

		pangkorrams:beginPlot("Lua_BellatiaDuplication_SecondAdvance_drama2")

	--	����J�G�o�ˤU�h�ڭ̮ڥ��L�k�~��e�i�I
		morrok:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_10]", 5)
		morrok:playMotion(ruFUSION_ACTORSTATE_ATTACK_1H)
		Sleep(25)
	--	�K�����G�ڭ̥i�H�d�U�I�_�ĤH���l���I�o�̥浹�ڭ̡A�A���~��e�i�a�I
		ironrose:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_11]", 5)
		Sleep(25)
	--	�N��G�����x�I���کM����J�h��U���عp�i���p��H
		jill:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_12]", 5)
		jill:playMotion(ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(25)
	--	�d�����G�ݨӥu��o�ˤF�I�A�M����J�N�[�J���عp�i���������~��e�i�I
		kangersy:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_13]", 5)
		Sleep(25)
	--	�d�����G�A�̥u�ޫO�@�L�P���I�o�Ǯw�ǩ_�ƴN�浹�ڭ̡I
		kangersy:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_14]", 5)
		Sleep(20)
		morrok.fight = false
		morrok.strike_back = false
		morrok.search_enemy = false
		morrok:stopAttack()
		jill.fight = false
		jill.strike_back = false
		jill.search_enemy = false
		jill:stopAttack()
		morrok:move(pangkorrams.x - 40 + RandRange(1, 80), pangkorrams.y, pangkorrams.z - 40 + RandRange(1, 80), 0)
		jill:move(pangkorrams.x - 40 + RandRange(1, 80), pangkorrams.y, pangkorrams.z - 40 + RandRange(1, 80), 0)
		Sleep(15)
	--	�d�����G����o���Խu��ڭ̴N�|�ߨ軰�W�I
		kangersy:say("[SC_BELLATIADUPLICATION_SECOND_ADVANCE_16]", 5)
	-----------------------------------------------------------------

	Global_BellatiaDuplication:debug("second advance drama end")

	Lua_BellatiaDuplication_change_save_point(room_id, 4)
	Lua_BellatiaDuplication_change_status(room_id, "success")
	Global_BellatiaDuplication:debug("second advance success")
end

-----------------------------------------------------------------
--	�G���e�P�G���α���t�A���Ƥ��_��X
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_drama2()
	Global_BellatiaDuplication:debug("ACTIVE > second advance drama2 -> Lua_BellatiaDuplication_SecondAdvance_drama2()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_SecondAdvance or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_SecondAdvance_setting() end

	if not Global_BellatiaDuplication[room_id].soldiers then Global_BellatiaDuplication[room_id].soldiers = {} end
	if not Global_BellatiaDuplication[room_id].ants then Global_BellatiaDuplication[room_id].ants = {} end

	-- ���s������
	Global_BellatiaDuplication[room_id].pangkorrams.fight = false
	Global_BellatiaDuplication[room_id].pangkorrams.strike_back = false
	Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
	Global_BellatiaDuplication[room_id].morrok.fight = false
	Global_BellatiaDuplication[room_id].morrok.movable = false
	Global_BellatiaDuplication[room_id].morrok.strike_back = false
	Global_BellatiaDuplication[room_id].morrok.search_enemy = false
	Global_BellatiaDuplication[room_id].jill.fight = false
	Global_BellatiaDuplication[room_id].jill.movable = false
	Global_BellatiaDuplication[room_id].jill.strike_back = false
	Global_BellatiaDuplication[room_id].jill.search_enemy = false

	Global_BellatiaDuplication[room_id].kangersy.fight = true
	Global_BellatiaDuplication[room_id].kangersy.movable = true
	Global_BellatiaDuplication[room_id].kangersy.strike_back = true
	Global_BellatiaDuplication[room_id].kangersy.search_enemy = true
	Global_BellatiaDuplication[room_id].cassam.fight = true
	Global_BellatiaDuplication[room_id].cassam.movable = true
	Global_BellatiaDuplication[room_id].cassam.strike_back = true
	Global_BellatiaDuplication[room_id].cassam.search_enemy = true
	Global_BellatiaDuplication[room_id].ironrose.fight = true
	Global_BellatiaDuplication[room_id].ironrose.movable = true
	Global_BellatiaDuplication[room_id].ironrose.strike_back = true
	Global_BellatiaDuplication[room_id].ironrose.search_enemy = true

	while not Lua_BellatiaDuplication_check_status(room_id, "boss") and Global_BellatiaDuplication[room_id].save_point < 5 do
		if #Global_BellatiaDuplication[room_id].soldiers < 4 then
			for index = 1, 4 - #Global_BellatiaDuplication[room_id].soldiers do
				local _soldier = AddyAlly:new()
				_soldier:create(
					Global_BellatiaDuplication.ally_type[RandRange(1, #Global_BellatiaDuplication.ally_type)],
					Global_BellatiaDuplication[room_id].ironrose.x - 30 + RandRange(1, 60),
					Global_BellatiaDuplication[room_id].ironrose.y,
					Global_BellatiaDuplication[room_id].ironrose.z - 30 + RandRange(1, 60))
				_soldier:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].soldiers, _soldier)
			end
		end
		if #Global_BellatiaDuplication[room_id].ants < 6 then
			local _ant = AddyMonster:new()
			_ant:create(
				Global_BellatiaDuplication_SecondAdvance.ant_type[RandRange(1, #Global_BellatiaDuplication_SecondAdvance.ant_type)],
				Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].x - 100,
				Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].y,
				Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18].z)
			_ant:addToPartition(room_id)
			table.insert(Global_BellatiaDuplication[room_id].ants, _ant)
		end
		if #Global_BellatiaDuplication[room_id].ants < 4 then
			local _ant = AddyMonster:new()
			local _birth_point = RandRange(4, 5)
			_ant:create(
				Global_BellatiaDuplication_SecondAdvance.ant_type[RandRange(1, #Global_BellatiaDuplication_SecondAdvance.ant_type)],
				Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[_birth_point].x,
				Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[_birth_point].y,
				Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[_birth_point].z)
			_ant:addToPartition(room_id)
			table.insert(Global_BellatiaDuplication[room_id].ants, _ant)
		end
		for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do
			if soldier.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].soldiers, index)
			elseif soldier:distanceTo(Global_BellatiaDuplication[room_id].ironrose) > 200 then
				soldier:move(Global_BellatiaDuplication[room_id].ironrose.x - 80 + RandRange(1, 160), Global_BellatiaDuplication[room_id].ironrose.y, Global_BellatiaDuplication[room_id].ironrose.z - 80 + RandRange(1, 160), 0)
			end
		end
		for index, ant in pairs(Global_BellatiaDuplication[room_id].ants) do
			if ant.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].ants, index)
			else
				if not ant.attack_target then ant.attack_target = Global_BellatiaDuplication[room_id].soldiers[RandRange(1, #Global_BellatiaDuplication[room_id].soldiers)] end
				if ant.attack_target then ant:attack(ant.attack_target) end
				if ant.attack_target and ant.attack_target.hp <= 0 then ant.attack_target = nil end
			end
		end
		Sleep(10)
	end

	Sleep(30)

	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do soldier:delete() end
	Global_BellatiaDuplication[room_id].soldiers = {}
	for index, ant in pairs(Global_BellatiaDuplication[room_id].ants) do ant:delete() end
	Global_BellatiaDuplication[room_id].ants = {}

	Global_BellatiaDuplication:debug("second advance drama2 end")
end