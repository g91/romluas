-----------------------------------------------------------------
--	�|���Ĥ@���q�԰�
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_first_step()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss first loop -> Lua_BellatiaDuplication_FourthBoss_first_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	local pangkorrams = Global_BellatiaDuplication[room_id].pangkorrams_dragon
	local morrok = Global_BellatiaDuplication[room_id].morrok
	local jill = Global_BellatiaDuplication[room_id].jill
	local kangersy = Global_BellatiaDuplication[room_id].kangersy
	local feitlautrec = Global_BellatiaDuplication[room_id].feitlautrec
	local servants = Global_BellatiaDuplication[room_id].feitlautrec_servants

	-----------------------------------------------------------------
	--	���A��l��
		morrok.fight = true
		morrok.movable = true
		morrok.strike_back = true
		morrok.search_enemy = true

		jill.fight = true
		jill.movable = true
		jill.strike_back = true
		jill.search_enemy = true

		kangersy.fight = true
		kangersy.movable = true
		kangersy.strike_back = true
		kangersy.search_enemy = true

		feitlautrec.fight = true
		feitlautrec.movable = true
		feitlautrec.strike_back = true
		feitlautrec.search_enemy = true
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	feitlautrec AI
		Global_BellatiaDuplication[room_id].feitlautrec:beginPlot("Lua_BellatiaDuplication_FourthBoss_ai")
	-----------------------------------------------------------------

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do

		Sleep(Global_BellatiaDuplication_FourthBoss.delay * 10)

		-----------------------------------------------------------------
		--	����J�P�N��Z�k��ù�S
			morrok:systemCastSpell(feitlautrec, 495751)
			jill:systemCastSpell(feitlautrec, 495751)
			feitlautrec:systemCastSpell(morrok, 495751, 100)
			feitlautrec:systemCastSpell(jill, 495751, 100)
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�a����s�O�@�n
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if player:distanceTo(pangkorrams) <= Global_BellatiaDuplication_FourthBoss.protective_cover_radius and player.hp > 0 then player:addBuff(624433)
				else player:cancelBuff(624433) end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�p��AI
			for index, servant in pairs(servants) do
				if not servant.is_live then
					table.remove(servants, index)
				else

				-----------------------------------------------------------------
				--	�p��������y�N
					if servant.ORGID == Global_BellatiaDuplication_FourthBoss.small_fire_element then
						if servant.hp > 1 and Global_BellatiaDuplication[room_id].protective_cover then
							for index, node in pairs(Global_BellatiaDuplication[room_id].protective_cover.node) do
								if not servant.attack_target then servant.attack_target = node end
								if servant:distanceTo(node) < servant:distanceTo(servant.attack_target) then servant.attack_target = node end
							end
							servant.attack_target:systemCastSpell(servant, 495751)
					--		�Τ��y�N���O�@�n
							if servant:distanceTo(servant.attack_target) > 200 then servant:move(servant.attack_target.x, servant.attack_target.y, servant.attack_target.z, 0)
							else servant:castSpell(servant.attack_target, 850918) end
						end
					end
				-----------------------------------------------------------------

				-----------------------------------------------------------------
				--	�j��������}
					if servant.ORGID == Global_BellatiaDuplication_FourthBoss.big_fire_element then
						if not servant.attack_target then
							servant.attack_target = feitlautrec.hate_list[RandRange(1, #feitlautrec.hate_list)]
						elseif servant.attack_target.hp <= 0 or not CheckID(servant.attack_target.GUID) then
							servant.attack_target  = nil
						else
							servant.attack_target:systemCastSpell(servant, 495751)
						end
						servant:castSpell(servant, 850917)
					end
				-----------------------------------------------------------------

				-----------------------------------------------------------------
				--	�p�Ƕ]�i�O�@�n�B�z
					if servant:distanceTo(Global_BellatiaDuplication[room_id].protective_cover) <= Global_BellatiaDuplication_FourthBoss.protective_cover_radius then
						local delta_distence = Global_BellatiaDuplication_FourthBoss.protective_cover_radius - servant:distanceTo(Global_BellatiaDuplication[room_id].protective_cover)
						local vector = {}
						vector.x = servant.x - Global_BellatiaDuplication[room_id].protective_cover.x
						vector.z = servant.z - Global_BellatiaDuplication[room_id].protective_cover.z
						vector.lenght = (vector.x ^ 2 + vector.z ^ 2) ^ 0.5
						vector.unit_x = vector.x / vector.lenght
						vector.unit_z = vector.z / vector.lenght
						vector.delta_x = vector.unit_x * delta_distence + 5
						vector.delta_z = vector.unit_z * delta_distence + 5
						servant:setPosition(servant.x + vector.delta_x, GetHeight(servant.x + vector.delta_x, servant.y, servant.z + vector.delta_z), servant.z + vector.delta_z, servant.direction)
					end
				-----------------------------------------------------------------
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	����J�ΦN�঺�`
			if morrok.hp <= 1 or jill.hp <= 1 then
				Global_BellatiaDuplication[room_id].step = 0
				Global_BellatiaDuplication[room_id].fight_step = 0
				Lua_BellatiaDuplication_change_status(room_id, "fail")
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	���@�n�}��
			if not Global_BellatiaDuplication[room_id].protective_cover_power or Global_BellatiaDuplication[room_id].protective_cover_power <= 0 then
				Global_BellatiaDuplication:debug("protective cover is broken")
				for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
					Global_BellatiaDuplication.handler:scriptMessage(player, "[SC_BELLATIADUPLICATION_FOURTH_BOSS_60]", 1)
				end
				Lua_BellatiaDuplication_change_status(room_id, "fail")
			end
		-----------------------------------------------------------------

--		-----------------------------------------------------------------
--		--	�k��ù�Shp�C�󵥩�60%
--			if Global_BellatiaDuplication[room_id].feitlautrec.hp <= Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.61 and not Global_BellatiaDuplication[room_id].drama_record[5] then
--				Global_BellatiaDuplication:debug("feitlautrec hp <= 60%")
--		--		�i�Jstep5��t�G���s�묹
--				Global_BellatiaDuplication[room_id].drama_record[5] = true
--				Global_BellatiaDuplication[room_id].step = 5
--				Lua_BellatiaDuplication_change_status(room_id, "drama")
--			end
--		-----------------------------------------------------------------
--
--		-----------------------------------------------------------------
--		--	�k��ù�Shp�C�󵥩�75%
--			if Global_BellatiaDuplication[room_id].feitlautrec.hp <= Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.79 and not Global_BellatiaDuplication[room_id].drama_record[4] then
--				Global_BellatiaDuplication:debug("feitlautrec hp <= 79%")
--		--		�i�Jstep4��t�G�d�����m��
--				Global_BellatiaDuplication[room_id].drama_record[4] = true
--				Global_BellatiaDuplication[room_id].step = 4
--				Global_BellatiaDuplication[room_id].step_trigger = true
--			end
--		-----------------------------------------------------------------
	end
	Global_BellatiaDuplication:debug("leave first loop")

	-----------------------------------------------------------------
	--	�M���p��
		for index, servant in pairs(Global_BellatiaDuplication[room_id].feitlautrec_servants) do servant:delete() end
		Global_BellatiaDuplication[room_id].feitlautrec_servants = {}
	-----------------------------------------------------------------

	while not Global_BellatiaDuplication[room_id].is_ai_stop do Sleep(10) end

	-----------------------------------------------------------------
	--	�������q
		Global_BellatiaDuplication[room_id].step_trigger = true
		Global_BellatiaDuplication:debug("change to step 5")
	-----------------------------------------------------------------
end

-----------------------------------------------------------------
--	�|���ĤG���q�԰�
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_second_step()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss second loop -> Lua_BellatiaDuplication_FourthBoss_second_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Lua_BellatiaDuplication_change_status(room_id, "boss")

	local morrok = Global_BellatiaDuplication[room_id].morrok
	local jill = Global_BellatiaDuplication[room_id].jill
	local feitlautrec = Global_BellatiaDuplication[room_id].feitlautrec
	local kangersy = Global_BellatiaDuplication[room_id].kangersy
	local IronRose = Global_BellatiaDuplication[room_id].IronRose
	local servants = Global_BellatiaDuplication[room_id].feitlautrec_servants
	local time_mark = Global_BellatiaDuplication[room_id].battle_listener.duration_time
	local fire_marking_624418 = {}	-- ��
	local fire_marking_624419 = {}	-- ��
	local fire_marking_624420 = {}	-- ��
	local fire_marking_624421 = {}	-- ��

	-----------------------------------------------------------------
	--	���A��l��
	-----------------------------------------------------------------
	morrok.fight = true
	jill.fight = true
	feitlautrec.fight = true
	feitlautrec.movable = true
	feitlautrec.strike_back = true
	feitlautrec.search_enemy = true
	if not kangersy.buff[624415] then
		kangersy:addBuff(624415)
		kangersy:addBuff(624471)
		kangersy:castSpell(kangersy, 850921)
		kangersy:setIdleMotion(ruFUSION_ACTORSTATE_DEAD_WATER)
		kangersy.is_imperishable = false
		kangersy.search_enemy = false
		kangersy.strike_back = false
		kangersy.fight = false
	end

	Global_BellatiaDuplication[room_id].feitlautrec.skill.fire_marking:unlock()

	-----------------------------------------------------------------
	--	feitlautrec AI
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].feitlautrec:beginPlot("Lua_BellatiaDuplication_FourthBoss_ai")

	-----------------------------------------------------------------
	--	�Ĥ@���q�S�l���8���A�o���q�����l��
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].summon_servants_times < 8 then
		for index = 1, 8 - Global_BellatiaDuplication[room_id].summon_servants_times do
			-- �@��j����
			local _servant = AddyMonster:new()
			_servant:create(Global_BellatiaDuplication_FourthBoss.big_fire_element, feitlautrec.x - 60 + RandRange(1, 120), feitlautrec.y, feitlautrec.z - 60 + RandRange(1, 120))
			_servant:addToPartition(room_id)
			-- ����ƥ[850916
			_servant:addBuff(624427)
			table.insert(Global_BellatiaDuplication[room_id].feitlautrec_servants, _servant)
			Global_BellatiaDuplication:debug("use skill> summon servants -> 1 big element summoned")

			-- �Ⱖ�p����
			for index = 1, 2 do
				local _servant = AddyMonster:new()
				_servant:create(Global_BellatiaDuplication_FourthBoss.small_fire_element, feitlautrec.x - 60 + RandRange(1, 120), feitlautrec.y, feitlautrec.z - 60 + RandRange(1, 120))
				_servant:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].feitlautrec_servants, _servant)
				Global_BellatiaDuplication:debug("use skill> summon servants -> 1 small element summoned")
			end
		end
	end

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FourthBoss.delay)

		-----------------------------------------------------------------
		--	���K�L�O�B�z
		-----------------------------------------------------------------
		fire_marking_624418 = {}	-- ��
		fire_marking_624419 = {}	-- ��
		fire_marking_624420 = {}	-- ��
		fire_marking_624421 = {}	-- ��

	--	���a����
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
			if player.buff[624418] then table.insert(fire_marking_624418, player) end
			if player.buff[624419] then table.insert(fire_marking_624419, player) end
			if player.buff[624420] then table.insert(fire_marking_624420, player) end
			if player.buff[624421] then table.insert(fire_marking_624421, player) end
		end

		if Global_BellatiaDuplication[room_id].battle_listener.duration_time % 2 == 0 and time_mark ~= Global_BellatiaDuplication[room_id].battle_listener.duration_time and Global_BellatiaDuplication[room_id].battle_listener.current_time - Global_BellatiaDuplication[room_id].fire_mark_time_mark > 3 then
			time_mark = Global_BellatiaDuplication[room_id].battle_listener.duration_time
		--	Lua_BellatiaDuplication_fire_mark_formula( �v�T��H, 50�X�v�T��, 70�X�v�T��, buff�s�� )
			if #fire_marking_624418 > 0 then Lua_BellatiaDuplication_fire_mark_formula(fire_marking_624418, fire_marking_624419, fire_marking_624420, 624418) end
			if #fire_marking_624419 > 0 then Lua_BellatiaDuplication_fire_mark_formula(fire_marking_624419, fire_marking_624420, fire_marking_624421, 624419) end
		elseif Global_BellatiaDuplication[room_id].battle_listener.duration_time % 2 == 0 and time_mark == Global_BellatiaDuplication[room_id].battle_listener.duration_time and Global_BellatiaDuplication[room_id].battle_listener.current_time - Global_BellatiaDuplication[room_id].fire_mark_time_mark > 3 then
			if #fire_marking_624420 > 0 then Lua_BellatiaDuplication_fire_mark_formula(fire_marking_624420, fire_marking_624419, fire_marking_624418, 624420) end
			if #fire_marking_624421 > 0 then Lua_BellatiaDuplication_fire_mark_formula(fire_marking_624421, fire_marking_624418, fire_marking_624419, 624421) end
		end

		-----------------------------------------------------------------
		--	�a�񼯷�J&�N��O�@�n
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if (player:distanceTo(morrok) <= 46 or player:distanceTo(jill) <= 46) and player.hp > 0 then player:addBuff(624433)
				else player:cancelBuff(624433) end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	�p��AI
			for index, servant in pairs(servants) do
				if not CheckID(servant.GUID) or servant.hp <= 0 then
					table.remove(servants, index)
				else
					if #servant.hate_list <= 0 and #feitlautrec.hate_list > 0 then
						servant:hate(feitlautrec.hate_list[RandRange(1, #feitlautrec.hate_list)])
					end

					-----------------------------------------------------------------
					--	�p�Ƕ]�i�O�@�n�B�z
						if servant:distanceTo(morrok) <= 48 then
							local delta_distence = 48 - servant:distanceTo(morrok)
							local vector = {}
							vector.x = servant.x - morrok.x
							vector.z = servant.z - morrok.z
							vector.lenght = (vector.x ^ 2 + vector.z ^ 2) ^ 0.5
							vector.unit_x = vector.x / vector.lenght
							vector.unit_z = vector.z / vector.lenght
							vector.delta_x = vector.unit_x * delta_distence + 5
							vector.delta_z = vector.unit_z * delta_distence + 5
							servant:setPosition(servant.x + vector.delta_x, GetHeight(servant.x + vector.delta_x, servant.y, servant.z + vector.delta_z), servant.z + vector.delta_z, servant.direction)
						end
						if servant:distanceTo(jill) <= 48 then
							local delta_distence = 48 - servant:distanceTo(jill)
							local vector = {}
							vector.x = servant.x - jill.x
							vector.z = servant.z - jill.z
							vector.lenght = (vector.x ^ 2 + vector.z ^ 2) ^ 0.5
							vector.unit_x = vector.x / vector.lenght
							vector.unit_z = vector.z / vector.lenght
							vector.delta_x = vector.unit_x * delta_distence + 5
							vector.delta_z = vector.unit_z * delta_distence + 5
							servant:setPosition(servant.x + vector.delta_x, GetHeight(servant.x + vector.delta_x, servant.y, servant.z + vector.delta_z), servant.z + vector.delta_z, servant.direction)
						end
					-----------------------------------------------------------------
				end
			end
		-----------------------------------------------------------------

--		-----------------------------------------------------------------
--		--	�k��ù�Shp�C��5%
--			if Global_BellatiaDuplication[room_id].feitlautrec.hp <= Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.06 and not Global_BellatiaDuplication[room_id].drama_record[7] then
--		--		�i�Jstep7��t�G�k��ù�S�˵h���X
--				Global_BellatiaDuplication[room_id].drama_record[7] = true
--				Global_BellatiaDuplication[room_id].step = 7
--				Lua_BellatiaDuplication_change_status(room_id, "drama")
--			end
--		-----------------------------------------------------------------

--		-----------------------------------------------------------------
--		--	�k��ù�Shp�C��50%
--			if Global_BellatiaDuplication[room_id].feitlautrec.hp <= Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.51 and not Global_BellatiaDuplication[room_id].drama_record[6] then
--		--		�i�Jstep6��t�G�k��ù�S�M���X���L
--				Global_BellatiaDuplication[room_id].drama_record[6] = true
--				Global_BellatiaDuplication[room_id].step = 6
--				Global_BellatiaDuplication[room_id].step_trigger = true
--			end
--		-----------------------------------------------------------------
	end
	Global_BellatiaDuplication:debug("leave second loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do Sleep(10) end

	-----------------------------------------------------------------
	--	�M���p��
		for index, servant in pairs(Global_BellatiaDuplication[room_id].feitlautrec_servants) do servant:delete() end
		Global_BellatiaDuplication[room_id].feitlautrec_servants = {}
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	�������q
		Global_BellatiaDuplication[room_id].step_trigger = true
	-----------------------------------------------------------------
end

