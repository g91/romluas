-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------

-----------------------------------------------------------------
--	���U����
-----------------------------------------------------------------
function BellatiaDuplication_register(_obj, _name)
	if not Global_BellatiaDuplication or not Global_BellatiaDuplication[_obj.room_id] then
		Debuglog(2, "[Bellatia Duplication] [" .. _obj.room_id .. "]." .. _name .. " waiting global build ...")
		while not Global_BellatiaDuplication or not Global_BellatiaDuplication[_obj.room_id] do Sleep(10) end
	end
	if not Global_BellatiaDuplication[_obj.room_id][_name] or Global_BellatiaDuplication[_obj.room_id][_name].GUID ~= _obj.GUID then
		Global_BellatiaDuplication[_obj.room_id][_name] = _obj
		Global_BellatiaDuplication:log(_name .. " register")
		Global_BellatiaDuplication:debug(_name .. " register")
		return true
	end
	return false
end
function BellatiaDuplication_register_index(_obj, _name)
	if not Global_BellatiaDuplication or not Global_BellatiaDuplication[_obj.room_id] then
		Debuglog(2, "[Bellatia Duplication] [" .. _obj.room_id .. "]." .. _name .. " waiting global build ...")
		while not Global_BellatiaDuplication or not Global_BellatiaDuplication[_obj.room_id] do Sleep(10) end
	end
	if not Global_BellatiaDuplication[_obj.room_id][_name] then Global_BellatiaDuplication[_obj.room_id][_name] = {} end
	for index, obj in pairs(Global_BellatiaDuplication[_obj.room_id][_name]) do
		if obj.GUID == _obj.GUID then return false end
	end
	table.insert(Global_BellatiaDuplication[_obj.room_id][_name], _obj)
	Global_BellatiaDuplication:log(_name .. " : " .. _obj.GUID .. " register")
	Global_BellatiaDuplication:debug(_name .. " : " .. _obj.GUID .. " register")
	return true
end

-----------------------------------------------------------------
--	�ƥ������ͼ@��
-----------------------------------------------------------------
--	�J�f��
function Lua_zone154_door_entrance() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_entrance") end
--	�@���e������
function Lua_zone154_door_first_advance() if BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_first_advance") then Lua_BellatiaDuplication_initialize_door_first_advance(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�@���e��
function Lua_zone154_door_before_boss1() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_before_boss1") end
--	�@�����
function Lua_zone154_door_after_boss1() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_after_boss1") end
--	���ƾ�����1
function Lua_zone154_door_ant1() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_ant1") end
--	���ƾ�����2
function Lua_zone154_door_ant2() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_ant2") end
--	���ƾ�����3
function Lua_zone154_door_ant3() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_ant3") end
--	���ƪ��ת�1
function Lua_zone154_door_ant_room1() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_ant_room1") end
--	���ƪ��ת�2
function Lua_zone154_door_ant_room2() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_ant_room2") end
--	�G���e��
function Lua_zone154_door_before_boss2() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_before_boss2") end
--	�G�����
function Lua_zone154_door_after_boss2() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_after_boss2") end
--	�K�ǤJ�f��
function Lua_zone154_door_secretentrance() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_secret_entrance") end
--	�K�ǥX�f��
function Lua_zone154_door_secretexit() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_secret_exit") end
--	�|���e��
function Lua_zone154_door_before_boss4() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_before_boss4") end
--	�|�����
function Lua_zone154_door_after_boss4() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_after_boss4") end
--	�����e��
function Lua_zone154_door_before_boss5() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "door_before_boss5") end

-----------------------------------------------------------------
--	NPC���ͼ@��
-----------------------------------------------------------------
--	����J
function QuestNpc_122435_CreatePlot() if BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "morrok") then Lua_BellatiaDuplication_initialize_npc_morrok(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	����J����
function QuestNpc_122752_CreatePlot() if BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "morrok") then Lua_BellatiaDuplication_initialize_npc_morrok(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	����
function QuestNpc_122464_CreatePlot() if BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "jill") then Lua_BellatiaDuplication_initialize_npc_jill(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�Y�ӯ���
function QuestNpc_122753_CreatePlot() if BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "jill") then Lua_BellatiaDuplication_initialize_npc_jill(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�d����
function QuestNpc_122465_CreatePlot() if BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "kangersy") then Lua_BellatiaDuplication_initialize_npc_kangersy(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�d���
function QuestNpc_122608_CreatePlot() if BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "cassam")then Lua_BellatiaDuplication_initialize_npc_cassam(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�k��ù�S����
function QuestNpc_122754_CreatePlot() if BellatiaDuplication_register(AddyAlly:new(OwnerID()), "feitlautrec_sungchili") then Lua_BellatiaDuplication_initialize_npc_feitlautrec_sungchili(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�K����
function Npc_103371_CreatePlot() if BellatiaDuplication_register(AddyAlly:new(OwnerID()), "ironrose")then Lua_BellatiaDuplication_initialize_npc_ironrose(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
--	�����s��
function Npc_102996_CreatePlot() if BellatiaDuplication_register(AddyAlly:new(OwnerID()), "pangkorrams_dragon") then Lua_BellatiaDuplication_initialize_npc_pangkorrams_dragon(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
function Npc_102994_CreatePlot() if BellatiaDuplication_register(AddyAlly:new(OwnerID()), "feitlautrec") then Lua_BellatiaDuplication_initialize_npc_feitlautrec(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
function Npc_102993_CreatePlot() if BellatiaDuplication_register(AddyBoss:new(OwnerID()), "feitlautrec")then Lua_BellatiaDuplication_initialize_npc_feitlautrec(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
function Npc_107858_CreatePlot() if BellatiaDuplication_register(AddyBoss:new(OwnerID()), "feitlautrec") then Lua_BellatiaDuplication_initialize_npc_feitlautrec(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
function Npc_102995_CreatePlot() if BellatiaDuplication_register(AddyBoss:new(OwnerID()), "mansuoruien") then Lua_BellatiaDuplication_initialize_npc_mansuoruien(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)) end end
function Npc_103370_CreatePlot() BellatiaDuplication_register(AddyNpc:new(OwnerID()), "saisimengde") end
function Npc_103360_CreatePlot()
	local obj = AddyNpc:new(OwnerID())
	BellatiaDuplication_register_index(obj, "fire_towers")
	Lua_BellatiaDuplication_initialize_npc_tower(obj)
end
function Npc_103361_CreatePlot()
	local obj = AddyNpc:new(OwnerID())
	BellatiaDuplication_register_index(obj, "power_towers")
	Lua_BellatiaDuplication_initialize_npc_tower(obj)
end

-----------------------------------------------------------------
--	���a���U
-----------------------------------------------------------------
function BellatiaDuplication_player_register()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication then Debuglog(2, "[Bellatia Duplication] [" .. room_id .. "] player(" .. OwnerID() .. ") wait Global_BellatiaDuplication") end
	while not Global_BellatiaDuplication do Sleep(2) end

	if not Global_BellatiaDuplication[room_id] then Debuglog(2, "[Bellatia Duplication] [" .. room_id .. "] player(" .. OwnerID() .. ") wait Global_BellatiaDuplication[" .. room_id .. "]") end
	while not Global_BellatiaDuplication[room_id] do Global_BellatiaDuplication:sleep(0.2) end

	if not Global_BellatiaDuplication[room_id].players then Debuglog(2, "[Bellatia Duplication] [" .. room_id .. "] player(" .. OwnerID() .. ") wait Global_BellatiaDuplication[" .. room_id .. "].players") end
	while not Global_BellatiaDuplication[room_id].players do Global_BellatiaDuplication:sleep(0.2) end

	local _player = AddyPlayer:new(OwnerID())

	if _player.voc == 0 then
		_player.fight = false
		return
	end

	table.insert(Global_BellatiaDuplication[room_id].players, _player)
	Global_BellatiaDuplication:log("player(" .. OwnerID() .. ") register")
	if Global_BellatiaDuplication[room_id].save_point > 1 and Global_BellatiaDuplication[room_id].save_point < 11 then
		_player:setPosition(
			Global_BellatiaDuplication.save_point_flag[Global_BellatiaDuplication[room_id].save_point].x - 40 + RandRange(1, 80),
			Global_BellatiaDuplication.save_point_flag[Global_BellatiaDuplication[room_id].save_point].y,
			Global_BellatiaDuplication.save_point_flag[Global_BellatiaDuplication[room_id].save_point].z - 40 + RandRange(1, 80)
		)
	else _player:setPosition(_player.x, _player.y, _player.z, 0) end
	Lua_BellatiaDuplication_initialize_player(room_id, _player)
	Lua_BellatiaDuplication_update_music_personal(_player, Global_BellatiaDuplication[room_id].save_point)

	_player:addBuff(624672)
	while _player.buff[624672] do Global_BellatiaDuplication:sleep(0.2) end
	_player.music_player:play()
end