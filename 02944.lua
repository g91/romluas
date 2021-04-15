-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	�����]�w
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_setting()
	Global_BellatiaDuplication:debug("setting > fifth boss -> function Lua_BellatiaDuplication_FifthBoss_setting()")

	Global_BellatiaDuplication_FifthBoss = {}

	-----------------------------------------------------------------
	--	�]�w
	-----------------------------------------------------------------
	--	�j�驵����
		Global_BellatiaDuplication_FifthBoss.delay = 0.5
	--	�ĤG���q�ɭ�
		Global_BellatiaDuplication_FifthBoss.step2_duration = 180
	--	�ĥ|���q�ɭ�
		Global_BellatiaDuplication_FifthBoss.step4_duration = 180
	--	�����԰����ʺX�m
		Global_BellatiaDuplication_FifthBoss.boss_flag = AddyFlagGroup:new(781294)
	--	����orgid
		Global_BellatiaDuplication_FifthBoss.mansuoruien_sungchili_orgid = 107883
	--	�Y�Ѥ���orgid
		Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid = 107848
	--	�Y�Ѥ��ֳz���yorgid
		Global_BellatiaDuplication_FifthBoss.core_of_disintegration_transparent_orgid = 107865
	--	�ҩҷ箦�z���yorgid
		Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid = 107863
	--	�v��orgid
		Global_BellatiaDuplication_FifthBoss.ghost_orgid = 107864
	--	�����iorgid
		Global_BellatiaDuplication_FifthBoss.shockwave_orgid = 107841
	--	���M�t��orgid
		Global_BellatiaDuplication_FifthBoss.scapegoat_orgid = 107840
	--	�_�c
		Global_BellatiaDuplication_FifthBoss.treasure_orgid = 107867

		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.mansuoruien_sungchili_orgid = 108007
			Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid = 108002
			Global_BellatiaDuplication_FifthBoss.core_of_disintegration_transparent_orgid = 108005
			Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid = 108003
			Global_BellatiaDuplication_FifthBoss.ghost_orgid = 108004
			Global_BellatiaDuplication_FifthBoss.shockwave_orgid = 108001
			Global_BellatiaDuplication_FifthBoss.scapegoat_orgid = 108000
			Global_BellatiaDuplication_FifthBoss.treasure_orgid = 108006
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.mansuoruien_sungchili_orgid = 108070
			Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid = 108065
			Global_BellatiaDuplication_FifthBoss.core_of_disintegration_transparent_orgid = 108068
			Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid = 108066
			Global_BellatiaDuplication_FifthBoss.ghost_orgid = 108067
			Global_BellatiaDuplication_FifthBoss.shockwave_orgid = 108064
			Global_BellatiaDuplication_FifthBoss.scapegoat_orgid = 108063
			Global_BellatiaDuplication_FifthBoss.treasure_orgid = 108069
		end

	-----------------------------------------------------------------
	--	�ޯ�
	-----------------------------------------------------------------
	--	���M�R�B
		Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.name = "fatal_ruling"
		Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.cd = 50
	--	�ƥ����׽վ�ޯ൥��
	--	�ү��箦�M�������|�I����M�R�B�A�ү��箦�I�񵥯ŷ|�b���WGlobal_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv_rate
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv = 1
			Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv_rate = 3
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv = 1
			Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv_rate = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv = 1
			Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv_rate = 2
		end
		function Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling:active(caster)
			local targets = {}
			for index, hater in pairs(caster.hate_list_duplication) do
				if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
			end
			local target = targets[RandRange(1, #targets)]
			Global_BellatiaDuplication:debug("skill fatal ruling -> create scapegoat")
			if not target then
				self.cd_counter = 10
				Global_BellatiaDuplication:debug("skill fatal ruling -> not target")
				return
			end
			local lv = Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv_rate * Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv
			caster.show = false
			caster.fight = false
	--		caster.strike_back = false
	--		caster.search_enemy = false
			caster.movable = false
			caster.mark = false
			caster:addBuff(507646) -- ���������
	--		caster:stopAttack()
			caster:stopMove()

	--		�ү��箦���M�t��
			local scapegoat = AddyNpc:new()
			scapegoat:create(Global_BellatiaDuplication_FifthBoss.scapegoat_orgid, caster.x, caster.y, caster.z, caster.direction)
			scapegoat.fight = true
			scapegoat.movable = false
			scapegoat.strike_back = false
			scapegoat.search_enemy = false
			scapegoat.live_time = 6
			scapegoat:addToPartition(caster.room_id)

	--		�k�N�޾�
			scapegoat:castSpell(target, 850911, lv)
			target:addBuff(624660)

	--		���ݤ޾�
			while Lua_BellatiaDuplication_check_status(caster.room_id, "boss") and scapegoat.hp > 0 and scapegoat.spell_magic_ORGID == 850911 do Global_BellatiaDuplication:sleep(0.2) end
			target:cancelBuff(624660)

			Global_BellatiaDuplication:debug("skill fatal ruling -> guide over")

	--		�^�_���A
			scapegoat:delete()
			caster.show = true
			caster.fight = true
	--		caster.strike_back = true
	--		caster.search_enemy = true
			caster.movable = true
			caster.mark = true
			caster:cancelBuff(507646) -- ���������

			Global_BellatiaDuplication:debug("skill fatal ruling end")
		end

	-----------------------------------------------------------------
	--	�u������
		Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.name = "vacuum_extrusion"
		Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.cd = 11
	--	�ھڰƥ����׽վ�ޯ൥��
	--	624440 �ˮ`hp�ʤ��� -300% �ޯ൥�żv�T33% �ˮ`�i����
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.lv = 3
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.lv = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.lv = 1
		end
		function Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion:active(caster)
			local targets = {}
			for index, hater in pairs(caster.hate_list_duplication) do
				if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
			end
			local target = targets[RandRange(1, #targets)]
			if not target then
				self.cd_counter = 10
				return
			end
			if not target then
				self.cd_counter = 10
				Global_BellatiaDuplication:debug("skill vacuum extrusion -> not target")
				return
			end
			target:addBuff(624454)
			caster:castSpell(target, 850912, Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.lv)
			Sleep(30)
			target:cancelBuff(624454)
			Sleep(10)
		end

	-----------------------------------------------------------------
	--	�����s��
		Global_BellatiaDuplication_FifthBoss.skill_devastating_chain = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.name = "devastating_chain"
		Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.cd = 45
	--	�ھڰƥ����׽վ�ޯ൥��
	--	�ޯ൥�� = �����i�i�������ơC�����i�b�����W�L�������ƫ�άO������ؼЫ�|����
	--	�����i�C�����@���ˮ`���ŷ|�U���@��
	--	624441 �ˮ`hp�ʤ��� -8% �ޯ൥�żv�T150% �ˮ`�i����
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv = 3
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv = 1
		end
		function Global_BellatiaDuplication_FifthBoss.skill_devastating_chain:active(caster)
			local amount = 1
	--		�ү��箦�I��2�D�����i
			if caster == Global_BellatiaDuplication[caster.room_id].mansuoruien then amount = 2 end
			for index = 1, amount do
				local _shockwave = AddyMonster:new()
				_shockwave:create(Global_BellatiaDuplication_FifthBoss.shockwave_orgid, caster.x, caster.y, caster.z, caster.direction)
				_shockwave.fight = false
				_shockwave.strike_back = false
				_shockwave.search_enemy = false
				_shockwave.live_time = 20
				_shockwave.mark = false
				_shockwave.hide_hp_mp = true
				_shockwave.hide_name = true
				_shockwave.show_role_head = false
				_shockwave:addToPartition(caster.room_id)
				_shockwave:beginPlot("Lua_BellatiaDuplication_FifthBoss_shockwave_ai")
				Global_BellatiaDuplication:debug("skill devastating chain -> create shockwave")
			end
			Global_BellatiaDuplication:debug("skill devastating chain end")
		end
		function Lua_BellatiaDuplication_FifthBoss_shockwave_ai()
			Global_BellatiaDuplication:debug("skill devastating chain shockwave ai start")
			local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
			local shockwave = AddyNpc:new(OwnerID())
			shockwave.hit_counter = 0
			shockwave.move_target = nil
			local targets = {}
			for index, hater in pairs(Global_BellatiaDuplication[room_id].players) do
				if hater.z >= Global_BellatiaDuplication[room_id].door_before_boss5.z then table.insert(targets, hater) end
			end

			while Lua_BellatiaDuplication_check_status(room_id, "boss") and shockwave.hit_counter < Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv do
				if not shockwave.move_target then
					for index, player in pairs(targets) do
						if not shockwave.move_target then shockwave.move_target = player
						elseif shockwave:distanceTo(player) > shockwave:distanceTo(shockwave.move_target) then shockwave.move_target = player end
					end
				end
				shockwave:move(shockwave.move_target.x, shockwave.move_target.y, shockwave.move_target.z, 0)
				for index, player in pairs(targets) do
					if shockwave:distanceTo(player) < 10 and not player.buff[624442] then
						shockwave:systemCastSpell(player, 850920, Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv - shockwave.hit_counter)
						shockwave.hit_counter = shockwave.hit_counter + 1
						if player == shockwave.move_target then shockwave.move_target = nil end
					end
				end
				Sleep(2)
			end

			shockwave:addBuff(620747)
			Sleep(10)
			shockwave:delete()
			Global_BellatiaDuplication:debug("skill devastating chain : shockwave ai over")
		end

	-----------------------------------------------------------------
	--	���Ѭx�y
		Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.name = "cracking_torrent"
		Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.cd = 30
	--	�ھڰƥ����׽վ�u�����v
	--	�u�����Ƭ������H�ƭ��W�u�����v
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate = 4
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate = 3
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate = 3
		end
		function Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent:active(caster)
		--	�]�w�����C�p�G�O�Y�Ѥ��֬I��A���ү��箦�������
			local hate_list_duplication = caster.hate_list_duplication or Global_BellatiaDuplication[caster.room_id].mansuoruien.hate_list_duplication
			if #hate_list_duplication <= 0 then
				self.cd_counter = 10
				Global_BellatiaDuplication:debug("cracking_torrent no target")
				return
			end
		--	�u������
			local spring_times = #Global_BellatiaDuplication[caster.room_id].mansuoruien.hate_list_duplication * Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate
			Global_BellatiaDuplication:debug("skill cracking torrent : spring_times = " .. spring_times)
		--	������e�֩�2�ӤH�u��1���C�קK1�H�u��6�����]�w
			if #hate_list_duplication < 2 then spring_times = 1 end
		--	�����I�k����A�p�G�I�k�̬O�Y�Ѥ��ַ|�令���Ϊ��Y�Ѥ���
			local hidden_model = Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid
			if caster.ORGID == Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid then hidden_model = Global_BellatiaDuplication_FifthBoss.core_of_disintegration_transparent_orgid end
		--	�I�k�u���ؼ�
			local targets = {}
			for index = 1, spring_times do
		--		��2���H�᪺�u��
				if index > 1 then
		--			��ܶZ���W�@���u����H�̪񪺨�L��H
					for hater_index, hater in pairs(hate_list_duplication) do
						if not targets[index] and targets[index - 1].GUID ~= hater.GUID then targets[index] = hater
						elseif hater.hp > 0 and targets[index] and targets[index - 1]:distanceTo(targets[index]) > targets[index - 1]:distanceTo(hater) and targets[index - 1].GUID ~= hater.GUID then targets[index] = hater end
					end
		--			�b��w��H����m�������Ϊ���I�k
					local _npc = AddyNpc:new()
					_npc:create(hidden_model, targets[index - 1].x, targets[index - 1].y, targets[index - 1].z)
					_npc.fight = false
					_npc.movable = false
					_npc.strike_back = false
					_npc.search_enemy = false
					_npc.revive = false
					_npc.show_role_head = false
					_npc.mark = false
		--			2���R��
					_npc.live_time = 2
					_npc:addToPartition(caster.room_id)
					_npc:castSpell(targets[index], 850925)
		--		��1���u���A�k�N�q�I�k�̥X�o
				else
		--			��̪ܳ񪺹�H
					for hater_index, hater in pairs(hate_list_duplication) do
						if not targets[index] then targets[index] = hater
						elseif hater.hp > 0 and caster:distanceTo(targets[index]) > caster:distanceTo(hater) then targets[index] = hater end
					end
					caster:castSpell(targets[index], 850925)
				end
				Global_BellatiaDuplication:debug("cracking_torrent target : " .. type(targets[index]))
				Sleep(4)
			end
			Global_BellatiaDuplication:debug("skill cracking torrent end")
		end

	-----------------------------------------------------------------
	--	���߽���
		Global_BellatiaDuplication_FifthBoss.skill_fear_spread = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_fear_spread.name = "fear_spread"
		Global_BellatiaDuplication_FifthBoss.skill_fear_spread.cd = 3
		function Global_BellatiaDuplication_FifthBoss.skill_fear_spread:active(caster)
	--		�H����w��H
			for index, player in pairs(Global_BellatiaDuplication[caster.room_id].players) do
				if player.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z and Lua_BellatiaDuplication_check_status(caster.room_id, "boss") and player.hp > 0 then
					caster:systemCastSpell(player, 850948)
					break
				end
			end
			Global_BellatiaDuplication:debug("skill fear spread end")
		end
	--	�����ಾ�B�z
		function Lua_MagicObject_624460()
			local me = AddyPlayer:new(OwnerID())
			local room_id = me.room_id
			local closest_player = nil
--			�j���̪񪱮a
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if not closest_player and player.GUID ~= me.GUID then closest_player = player
				elseif closest_player and me:distanceTo(player) < me:distanceTo(closest_player) and player.GUID ~= me.GUID then closest_player = player end
			end
--			�p�G�̪񪱮a�W�L120�X�A��
			if not closest_player or me:distanceTo(closest_player) > 120 then
--					me:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_53]")
				Global_BellatiaDuplication[room_id].mansuoruien:systemCastSpell(me, 850960)
--					Global_BellatiaDuplication[room_id].mansuoruien.fear_spread_trigger = true
				if closest_player then Global_BellatiaDuplication[room_id].mansuoruien:systemCastSpell(closest_player, 850948) end
				Global_BellatiaDuplication:debug("mansuoruien.fear_spread_trigger = " .. tostring(Global_BellatiaDuplication[room_id].mansuoruien.fear_spread_trigger))
--			�̪񪱮a�b120�X���A���L���߽���
			else
				me:systemCastSpell(closest_player, 851039)
				Global_BellatiaDuplication[room_id].mansuoruien:systemCastSpell(closest_player, 850948)
				Global_BellatiaDuplication:debug("fear spread : " .. closest_player.GUID)
			end
		end

	-----------------------------------------------------------------
	--	�Ŷ��ܴ�
		Global_BellatiaDuplication_FifthBoss.skill_space_conversion = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_space_conversion.name = "space_conversion"
	--	�ھڰƥ��j�׾�cd�ɶ�
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_space_conversion.cd = 30
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_space_conversion.cd = 38
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_space_conversion.cd = 45
		end
		function Global_BellatiaDuplication_FifthBoss.skill_space_conversion:active(caster)
	--		�I��k�N�A�k�˩M�w�t
			caster:castSpell(caster, 850950)
			--	��m�洫�B�z
				local targets = {}
				for index, hater in pairs(caster.hate_list_duplication) do
					if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
				end
				Global_BellatiaDuplication:debug("skill space conversion -> #targets = " .. #targets)
			--	��H�C���H������@�b���Ĥ@��
				local targets1 = get_random_table(targets, math.floor(#targets / 2))
				local targets2 = {}
			--	�ѤU���t�@�b���ĤG��
				for index, target in pairs(targets) do
					table.insert(targets2, target)
					for targets1_index, target1 in pairs(targets1) do
						if target == target1 then table.remove(targets2, #targets2) end
					end
				end
				Global_BellatiaDuplication:debug("skill space conversion -> #targets1 = " .. #targets1)
				Global_BellatiaDuplication:debug("skill space conversion -> #targets2 = " .. #targets2)
				local x1, y1, z1, x2, y2, z2 = caster.x, caster.y, caster.z, caster.x, caster.y, caster.z
			--	��զ�m����
				if #targets1 ~= 0 and #targets2 ~= 0 then
					for index, target2 in pairs(targets2) do
						x1, y1, z1, x2, y2, z2 = caster.x, caster.y, caster.z, caster.x, caster.y, caster.z
						if targets1[index] then
							x1, y1, z1 = targets1[index].x, targets1[index].y, targets1[index].z
							x2, y2, z2 = target2.x, target2.y, target2.z
							targets1[index]:setPosition(x2, y2, z2)
							target2:setPosition(x1, y1, z1)
						end
					end
			--		�_�ƳB�z�A�h���H�|�q�Ĥ@���H����@�ӦA���@��
					if #targets2 > #targets1 then
						local random_index = RandRange(1, #targets1)
						x2, y2, z2 = targets2[#targets2].x, targets2[#targets2].y, targets2[#targets2].z
						x1, y1, z1 = targets1[random_index].x, targets1[random_index].y, targets1[random_index].z
						targets2[#targets2]:setPosition(x1, y1, z1)
						targets1[random_index]:setPosition(x2, y2, z2)
					end
				end
			
			Global_BellatiaDuplication:debug("skill space conversion end")
		end

	-----------------------------------------------------------------
	--	���b�B
		Global_BellatiaDuplication_FifthBoss.skill_dark_arrows = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.name = "dark_arrows"
	--	�ھڰƥ��j�׾�cd�ɶ�
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 8
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 11
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 14
		end
		function Global_BellatiaDuplication_FifthBoss.skill_dark_arrows:active(caster)
			local magic_lv = 0
	--		������Ҧ���H
			for index, hater in pairs(caster.hate_list_duplication) do
	--			�ھ�debuff���b���624450�M�w�I�k����
				if hater.buff[624450] then magic_lv = hater.buff[624450].power + 1 end
				caster:systemCastSpell(hater, 850951, magic_lv)
			end
			Global_BellatiaDuplication:debug("skill dark arrows end")
		end

	-----------------------------------------------------------------
	--	�y�u�L�O
		Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.name = "hourglass_of_life"
	--	�ھڰƥ��j�׾�cd�ɶ�
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.cd = 25
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.cd = 30
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.cd = 40
		end
		function Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life:active(caster)
			local targets = {}
	--		�H����3�ӥؼСA�p�G�����֩�3�ӴN�����I��
			if #caster.hate_list_duplication > 3 then
				targets = get_random_table(caster.hate_list_duplication, 3)
			else targets = caster.hate_list_duplication end
	--		�v�@�I��y�u�L�O
			for index, target in pairs(targets) do caster:systemCastSpell(target, 850952) end
			Global_BellatiaDuplication:debug("skill hourglass of life end")
		end

	-----------------------------------------------------------------
	--	������
		Global_BellatiaDuplication_FifthBoss.skill_dark_rift = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_dark_rift.name = "dark_rift"
	--	�ھڰƥ��j�׾�cd�ɶ�
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_rift.cd = 22
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_rift.cd = 28
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_rift.cd = 32
		end
		function Global_BellatiaDuplication_FifthBoss.skill_dark_rift:active(caster)
			local targets = {}
			for index, hater in pairs(caster.hate_list_duplication) do
				if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
			end
			local target = targets[RandRange(1, #targets)]
			Sleep(20)
			if target then caster:castSpell(target, 850953) end
		end
		function Lua_MagicObject_624453()
			local me = AddyPlayer:new(TargetID())
			for index = 1, RandRange(1, 3) do
				local _ghost = AddyMonster:new()
				_ghost:create(Global_BellatiaDuplication_FifthBoss.ghost_orgid, me.x - 40 + RandRange(1, 80), me.y, me.z - 40 + RandRange(1, 80))
				_ghost.fight = true
				_ghost.strike_back = false
				_ghost.search_enemy = false
				_ghost.movable = true
				_ghost.live_time = 20
				_ghost:addToPartition(me.room_id)
				_ghost:beginPlot("Lua_BellatiaDuplication_FifthBoss_ghost_ai")
			end
		end
		function Lua_BellatiaDuplication_FifthBoss_ghost_ai()
			Global_BellatiaDuplication:debug("skill dark_rift ghost ai start")
			local ghost = AddyMonster:new(OwnerID())
			local is_catch_you = false
			local target = Global_BellatiaDuplication[ghost.room_id].mansuoruien.hate_list_duplication[RandRange(1, #Global_BellatiaDuplication[ghost.room_id].mansuoruien.hate_list_duplication)]
			while Lua_BellatiaDuplication_check_status(ghost.room_id, "boss") and not is_catch_you do
				if not target then
					target = Global_BellatiaDuplication[ghost.room_id].mansuoruien.hate_list_duplication[RandRange(1, #Global_BellatiaDuplication[ghost.room_id].mansuoruien.hate_list_duplication)]
				else
					ghost:move(target.x, target.y, target.z)
				end
				if ghost:distanceTo(target) < 10 then
					target:addBuff(624452)
					is_catch_you = true
				end
				Sleep(5)
			end
			ghost:delete()
			Global_BellatiaDuplication:debug("skill dark_rift ghost ai stop")
		end

	-----------------------------------------------------------------
	--	�]�Ҥ���
		Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.name = "the_anger_of_emperor"
	--	�ھڰƥ��j�׾�cd�ɶ��M�ޯ൥��
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.lv = 0
			Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.cd = 40
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.lv = 0
			Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.cd = 45
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.lv = 0
			Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.cd = 50
		end
		function Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor:active(caster)
			local targets = {}
			for index, hater in pairs(caster.hate_list_duplication) do
				if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
			end
			local target = nil
			for index, hater in pairs(targets) do
				if not target then target = hater
				elseif caster:distanceTo(target) > caster:distanceTo(hater) then target = hater end
			end
			if not target then
				self.cd_counter = 10
				Global_BellatiaDuplication:debug("the_anger_of_emperor no target")
				return
			end
			local cast_times = 0
			caster.strike_back = false
			caster:stopAttack()
			while Lua_BellatiaDuplication_check_status(caster.room_id, "boss") and cast_times < 3 do
				if caster:distanceTo(target) > 40 then
					caster:addBuff(620842)
					caster:move(target.x, target.y, target.z, 1)
					caster:setPosition(target.x, target.y, target.z)
					caster:faceTo(target)
					Sleep(2)
				end
				caster:castSpell(caster, 850961, Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.lv)
				cast_times = cast_times + 1
				Sleep(18)
			end
			caster.strike_back = true
			Sleep(10)
			Global_BellatiaDuplication:debug("skill the anger of emperor end")
		end

	-----------------------------------------------------------------
	--	�Y�Ѥ���
		Global_BellatiaDuplication_FifthBoss.skill_core_of_disintegration = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_core_of_disintegration.name = "core_of_disintegration"
		Global_BellatiaDuplication_FifthBoss.skill_core_of_disintegration.cd = 11
		function Global_BellatiaDuplication_FifthBoss.skill_core_of_disintegration:active(caster)
			local targets = {}
			for index, hater in pairs(caster.hate_list_duplication) do
				if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
			end
			local target = targets[RandRange(1, #targets)]
			if not target then
				self.cd_counter = 11
				Global_BellatiaDuplication:debug("core_of_disintegration no target")
				return
			end
			local core_of_disintegration = AddyBoss:new()
			if target then
				core_of_disintegration:create(Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid, target.x - 15 + RandRange(1, 30), target.y + 8, target.z - 15 + RandRange(1, 30), target.direction)
				core_of_disintegration.movable = false
				core_of_disintegration.fight = false
				core_of_disintegration.strike_back = false
				core_of_disintegration.search_enemy = false
				core_of_disintegration.mark = false
				core_of_disintegration.show_role_head = false
				core_of_disintegration.gravity = true
				core_of_disintegration:addToPartition(caster.room_id)
	--			���a�S��
				core_of_disintegration:addBuff(620169)
	--			���a�����ˮ`
				core_of_disintegration:castSpell(core_of_disintegration, 850962)
				core_of_disintegration:beginPlot("Lua_BellatiaDuplication_FifthBoss_core_ai")
				table.insert(Global_BellatiaDuplication[caster.room_id].cores_of_disintegration, core_of_disintegration)
				if #Global_BellatiaDuplication[caster.room_id].cores_of_disintegration > 8 then
					Global_BellatiaDuplication[caster.room_id].cores_of_disintegration[1]:delete()
					table.remove(Global_BellatiaDuplication[caster.room_id].cores_of_disintegration, 1)
				end
			end
			Global_BellatiaDuplication:debug("skill core of disintegration end")
		end

	-----------------------------------------------------------------
	--	�Ŷ��ɴ�
		Global_BellatiaDuplication_FifthBoss.skill_space_of_storm = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.name = "space_of_storm"
	--	�ھڰƥ��j�׾�cd�ɶ�
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.cd = 6
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.cd = 8
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.cd = 10
		end
		function Global_BellatiaDuplication_FifthBoss.skill_space_of_storm:active(caster)
	--		�I�k��t
	--		caster.search_enemy = false
	--		caster.strike_back = false
			caster.movable = false
	--		caster:stopAttack()
			caster:stopMove()
			caster:addBuff(507646) -- ���������
			caster:playMotion(ruFUSION_ACTORSTATE_CAST_SP03)
			Sleep(8)
	--		�������ΰү��箦
			local _npc = AddyNpc:new()
			_npc:create(Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid, caster.x, caster.y, caster.z)
			_npc.fight = false
			_npc.strike_back = false
			_npc.search_enemy = false
			_npc.movable = false
			_npc.live_time = 6
			_npc.mark = false
			_npc.show_role_head = false
			_npc:addToPartition(caster.room_id)
			_npc:castSpell(_npc, 850955)
	--		�I�k��t
			caster:playMotion(ruFUSION_ACTORSTATE_BUFF_SP03)
			Sleep(8)
	--		caster.search_enemy = true
	--		caster.strike_back = true
			caster.movable = true
			caster:cancelBuff(507646) -- ���������
			Global_BellatiaDuplication:debug("skill space of storm end")
		end

	-----------------------------------------------------------------
	--	��ӽ���
		Global_BellatiaDuplication_FifthBoss.skill_incredible_shock = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_incredible_shock.name = "incredible_shock"
		Global_BellatiaDuplication_FifthBoss.skill_incredible_shock.cd = 13
		function Global_BellatiaDuplication_FifthBoss.skill_incredible_shock:active(caster)
	--		�H����w��H��m�I��
			local target = nil
			for index, hater in pairs(caster.hate_list_duplication) do
				if not target then target = hater
				elseif caster:distanceTo(target) < caster:distanceTo(hater) then target = hater end
			end
			if not target then
				self.cd_counter = 13
				Global_BellatiaDuplication:debug("incredible_shock no target")
				return
			end
			caster:castSpell(target.x, target.y, target.z, 850956)
		end

	-----------------------------------------------------------------
	--	�Y�ѲŤ大�O
		Global_BellatiaDuplication_FifthBoss.skill_cure = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_cure.name = "cure"
		Global_BellatiaDuplication_FifthBoss.skill_cure.cd = 12
	--	�ھڰƥ��j�׾�ޯ൥��
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_cure.lv = 3
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_cure.lv = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_cure.lv = 1
		end
		function Global_BellatiaDuplication_FifthBoss.skill_cure:active(caster)
	--		�v���ү��箦
			caster:castSpell(Global_BellatiaDuplication[caster.room_id].mansuoruien, 850958, Global_BellatiaDuplication_FifthBoss.skill_cure.lv)
		end

	-----------------------------------------------------------------
	--	��v����
		function Lua_MagicObject_624590()
			local target = AddyRole:new(TargetID())
			if target.buff[624591] then return false
			elseif target.buff[624590] and target.buff[624590].power >= 4 then
				target:cancelBuff(624590)
				target:addBuff(624591)
				return false
			else return true end
		end
end