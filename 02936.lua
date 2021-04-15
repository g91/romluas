-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	�@���e����
-----------------------------------------------------------------
-----------------------------------------------------------------
--	���x�W�p��AI�]�w
-----------------------------------------------------------------
function Lua_BellatiaDuplication_platai_setting()

	Global_BellatiaDuplication_FirstAdvance_Plat_ai = {}

	Global_BellatiaDuplication_FirstAdvance_Plat_ai.search_range = 600
	-----------------------------------------------------------------
	--	���ʽd��A���ܶH�����ܥi��ݭn�վ�ai�b�ݾ��ɪ��H�������޿�
	-----------------------------------------------------------------
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max = 2240
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min = 2170
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max = -1230
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min = -1510
	-----------------------------------------------------------------
	--	������
	-----------------------------------------------------------------
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.delay = 1
	-----------------------------------------------------------------
	--	�Ǫ��]�w
	-----------------------------------------------------------------
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster = {}
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[103000] = {ORGID = 493660, range = 300, cd = 7}
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[103369] = {ORGID = 496247, range = 400, cd = 8}
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[103368] = {ORGID = 493660, range = 300, cd = 7}

	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[108021] = {ORGID = 496247, range = 400, cd = 8}
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[108018] = {ORGID = 493660, range = 300, cd = 7}

	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[108086] = {ORGID = 496247, range = 400, cd = 8}
	Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster[108083] = {ORGID = 493660, range = 300, cd = 7}
end
-----------------------------------------------------------------
--	���x�W�p��AI
-----------------------------------------------------------------
function Lua_BellatiaDuplication_platai()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local monster = AddyMonster:new(OwnerID())
	while not Global_BellatiaDuplication or not Global_BellatiaDuplication[room_id] do Global_BellatiaDuplication:sleep(1) end
	if not Global_BellatiaDuplication_FirstAdvance_Plat_ai or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_platai_setting() end
	Global_BellatiaDuplication:debug("ACTIVE > first advance plat ai -> function Lua_BellatiaDuplication_platai()")

	monster.patrol = false
	monster.strike_back = false
	monster.search_enemy = false
	-- �S�����
	monster.special_hate_list = {}
	-- ������H
	monster.attack_target = nil
	-- ���ʤ�V
	monster.move_target = nil
	-- �ޯ��
	monster.skill = nil
	-- ���Ǫ��ޯ�A�S���ޯ��o���@�ˡA����
	for ORGID, skill in pairs(Global_BellatiaDuplication_FirstAdvance_Plat_ai.monster) do
		if ORGID == monster.ORGID then monster.skill = skill break end
	end
	if not monster.skill then monster:delete() return end
	-- �Ǫ���
	table.insert(Global_BellatiaDuplication[room_id].plat_enemies, monster)

	local _distance, _move_x, _move_z = 0, 0, 0

	Global_BellatiaDuplication:debug("first advance plat ai main loop start")
	while monster.hp > 0 do
		if monster.x > Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max or
		   monster.x < Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min or
		   monster.z > Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max or
		   monster.z < Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min then
			-----------------------------------------------------------------
			--	�u���P�_�����קK���U���x
			-----------------------------------------------------------------
			if monster.x > Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max then monster:setPosition(Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max, monster.y, monster.z) end
			if monster.x < Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min then monster:setPosition(Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min, monster.y, monster.z) end
			if monster.z > Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max then monster:setPosition(monster.x, monster.y, Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max) end
			if monster.z < Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min then monster:setPosition(monster.x, monster.y, Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min) end
		else
			-----------------------------------------------------------------
			--	��s�����
			-----------------------------------------------------------------
			monster.special_hate_list = {}
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if monster:distanceTo(player) < Global_BellatiaDuplication_FirstAdvance_Plat_ai.search_range then table.insert(monster.special_hate_list, player) end
			end
			-----------------------------------------------------------------
			--	��w�̪񪺪��a
			-----------------------------------------------------------------
			for index, player in pairs(monster.special_hate_list) do
				if not monster.attack_target or monster:distanceTo(player) < monster:distanceTo(monster.attack_target) then monster.attack_target = player end
			end
			-----------------------------------------------------------------
			--	�a���H
			-----------------------------------------------------------------
			if monster.attack_target then
				monster.disable_rotate = false
				_distance = monster:distanceTo(monster.attack_target)
				_move_x = (monster.attack_target.x - monster.x) * (_distance - 150) / _distance
				_move_z = (monster.attack_target.z - monster.z) * (_distance - 150) / _distance
				monster.move_target = {}
				monster.move_target.x = monster.x + _move_x
				monster.move_target.y = monster.y
				monster.move_target.z = monster.z + _move_z 
			end
			-----------------------------------------------------------------
			--	��w�ؼ�
			-----------------------------------------------------------------
			if monster.attack_target and monster:distanceTo(monster.attack_target) <= monster.skill.range then
				-----------------------------------------------------------------
				--	�ؼЦb300�X��
				-----------------------------------------------------------------
				monster.move_target = nil
				monster.disable_rotate = true
				monster:faceTo(monster.attack_target)
				monster:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN)
				Sleep(15)
				monster:systemCastSpell(monster.attack_target, monster.skill.ORGID)
				Sleep(monster.skill.cd * 9)
			elseif monster.attack_target and monster:distanceTo(monster.attack_target) > Global_BellatiaDuplication_FirstAdvance_Plat_ai.search_range then
				monster.attack_target = nil
			else
				-----------------------------------------------------------------
				--	�ݾ��B�z
				-----------------------------------------------------------------
				monster.move_target = {}
				monster.move_target.x = RandRange(Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min, Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max)
				monster.move_target.y = monster.y
				monster.move_target.z = -RandRange(math.abs(Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max), math.abs(Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min))
			end
			-----------------------------------------------------------------
			--	�����ˬd
			-----------------------------------------------------------------
			if monster.move_target then
				-- �ץ�����y��
				if monster.move_target.x > Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max then monster.move_target.x = Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_max end
				if monster.move_target.x < Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min then monster.move_target.x = Global_BellatiaDuplication_FirstAdvance_Plat_ai.x_min end
				if monster.move_target.z > Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max then monster.move_target.z = Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_max end
				if monster.move_target.z < Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min then monster.move_target.z = Global_BellatiaDuplication_FirstAdvance_Plat_ai.z_min end
				-- ����
				monster:move(monster.move_target.x, monster.y, monster.move_target.z, 0)
			end
		end

		Sleep(Global_BellatiaDuplication_FirstAdvance_Plat_ai.delay * 10)
	end
	Global_BellatiaDuplication:debug("first advance plat ai main loop over")
end
-----------------------------------------------------------------
--	������M��q�𪺲��ͼ@��
-----------------------------------------------------------------
-- �Q�����q�C��50%���ܴ��}��
function Lua_BellatiaDuplication_initialize_npc_tower(_obj)
	_obj.mark = true
end

function Lua_zone26_area1_tool_lock()
	local tower = AddyNpc:new(OwnerID())
	if tower.camp_id == 3 then tower.camp_id = 5
	elseif tower.camp_id == 5 then tower.camp_id = 3 end
	tower.hp = tower.register1
end

function MagicObjectPlot_623237()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not Global_BellatiaDuplication[room_id].door_first_advance.hit_counter then Global_BellatiaDuplication[room_id].door_first_advance.hit_counter = 0 end
	Global_BellatiaDuplication[room_id].door_first_advance.hit_counter = Global_BellatiaDuplication[room_id].door_first_advance.hit_counter + 1
	if Global_BellatiaDuplication[room_id].door_first_advance.hit_counter >= Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp then
		Global_BellatiaDuplication[room_id].door_first_advance:delFromPartition()
		Global_BellatiaDuplication[room_id].door_is_broken = true
	end
	Global_BellatiaDuplication:debug("area 1, before boss. hit door!!, hit_counter = " .. Global_BellatiaDuplication[room_id].door_first_advance.hit_counter)
end

function Lua_BellatiaDuplication_ad1dead()
	Global_BellatiaDuplication:debug("enemy with buff dead.")
	local target = AddyMonster:new(OwnerID())
	LockHP(target.GUID, 0, "")
	target:playMotion(ruFUSION_ACTORSTATE_DEAD)
	if target.buff[Global_BellatiaDuplication_FirstAdvance.fire_buff] then
		for index, fire_tower in pairs(Global_BellatiaDuplication[target.room_id].fire_towers) do
			if target:distanceTo(fire_tower) < 40 then
				fire_tower:castSpell(Global_BellatiaDuplication[target.room_id].door_first_advance.x,
						       Global_BellatiaDuplication[target.room_id].door_first_advance.y,
						       Global_BellatiaDuplication[target.room_id].door_first_advance.z,
						       850788)
				Global_BellatiaDuplication:debug("fire tower fire !")
				return
			end
		end
	elseif target.buff[Global_BellatiaDuplication_FirstAdvance.power_buff] then
		for index, power_tower in pairs(Global_BellatiaDuplication[target.room_id].power_towers) do
			if target:distanceTo(power_tower) < 40 then
				for index, monster in pairs(Global_BellatiaDuplication[target.room_id].plat_enemies) do
					power_tower:systemCastSpell(monster.x, monster.y, monster.z, 850789)
					break
				end
				Global_BellatiaDuplication:debug("power tower fire !")
				return
			end
		end
	end
	Global_BellatiaDuplication:debug("there is no tower")
	killid(target.GUID, target.GUID)
end