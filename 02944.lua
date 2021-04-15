-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	五王設定
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_setting()
	Global_BellatiaDuplication:debug("setting > fifth boss -> function Lua_BellatiaDuplication_FifthBoss_setting()")

	Global_BellatiaDuplication_FifthBoss = {}

	-----------------------------------------------------------------
	--	設定
	-----------------------------------------------------------------
	--	迴圈延遲秒數
		Global_BellatiaDuplication_FifthBoss.delay = 0.5
	--	第二階段時限
		Global_BellatiaDuplication_FifthBoss.step2_duration = 180
	--	第四階段時限
		Global_BellatiaDuplication_FifthBoss.step4_duration = 180
	--	五王戰鬥移動旗幟
		Global_BellatiaDuplication_FifthBoss.boss_flag = AddyFlagGroup:new(781294)
	--	分身orgid
		Global_BellatiaDuplication_FifthBoss.mansuoruien_sungchili_orgid = 107883
	--	崩解之核orgid
		Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid = 107848
	--	崩解之核透明球orgid
		Global_BellatiaDuplication_FifthBoss.core_of_disintegration_transparent_orgid = 107865
	--	曼所瑞恩透明球orgid
		Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid = 107863
	--	影鬼orgid
		Global_BellatiaDuplication_FifthBoss.ghost_orgid = 107864
	--	衝擊波orgid
		Global_BellatiaDuplication_FifthBoss.shockwave_orgid = 107841
	--	裁決聖盾orgid
		Global_BellatiaDuplication_FifthBoss.scapegoat_orgid = 107840
	--	寶箱
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
	--	技能
	-----------------------------------------------------------------
	--	裁決命運
		Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.name = "fatal_ruling"
		Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.cd = 50
	--	副本難度調整技能等級
	--	曼索瑞恩和分身都會施放裁決命運，曼索瑞恩施放等級會在乘上Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling.lv_rate
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
			caster:addBuff(507646) -- 完全不能動
	--		caster:stopAttack()
			caster:stopMove()

	--		曼索瑞恩裁決聖盾
			local scapegoat = AddyNpc:new()
			scapegoat:create(Global_BellatiaDuplication_FifthBoss.scapegoat_orgid, caster.x, caster.y, caster.z, caster.direction)
			scapegoat.fight = true
			scapegoat.movable = false
			scapegoat.strike_back = false
			scapegoat.search_enemy = false
			scapegoat.live_time = 6
			scapegoat:addToPartition(caster.room_id)

	--		法術引導
			scapegoat:castSpell(target, 850911, lv)
			target:addBuff(624660)

	--		等待引導
			while Lua_BellatiaDuplication_check_status(caster.room_id, "boss") and scapegoat.hp > 0 and scapegoat.spell_magic_ORGID == 850911 do Global_BellatiaDuplication:sleep(0.2) end
			target:cancelBuff(624660)

			Global_BellatiaDuplication:debug("skill fatal ruling -> guide over")

	--		回復狀態
			scapegoat:delete()
			caster.show = true
			caster.fight = true
	--		caster.strike_back = true
	--		caster.search_enemy = true
			caster.movable = true
			caster.mark = true
			caster:cancelBuff(507646) -- 完全不能動

			Global_BellatiaDuplication:debug("skill fatal ruling end")
		end

	-----------------------------------------------------------------
	--	真空擠壓
		Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.name = "vacuum_extrusion"
		Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion.cd = 11
	--	根據副本難度調整技能等級
	--	624440 傷害hp百分比 -300% 技能等級影響33% 傷害可分擔
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
	--	毀滅連鎖
		Global_BellatiaDuplication_FifthBoss.skill_devastating_chain = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.name = "devastating_chain"
		Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.cd = 45
	--	根據副本難度調整技能等級
	--	技能等級 = 衝擊波可撞擊次數。衝擊波在撞擊超過撞擊次數後或是撞擊到目標後會消失
	--	衝擊波每撞擊一次傷害等級會下降一級
	--	624441 傷害hp百分比 -8% 技能等級影響150% 傷害可分擔
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv = 3
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_devastating_chain.lv = 1
		end
		function Global_BellatiaDuplication_FifthBoss.skill_devastating_chain:active(caster)
			local amount = 1
	--		曼索瑞恩施放2道衝擊波
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
	--	裂解洪流
		Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.name = "cracking_torrent"
		Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.cd = 30
	--	根據副本難度調整彈跳倍率
	--	彈跳次數為仇恨表人數乘上彈跳倍率
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate = 4
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate = 3
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate = 3
		end
		function Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent:active(caster)
		--	設定仇恨表。如果是崩解之核施放，取曼索瑞恩的仇恨表
			local hate_list_duplication = caster.hate_list_duplication or Global_BellatiaDuplication[caster.room_id].mansuoruien.hate_list_duplication
			if #hate_list_duplication <= 0 then
				self.cd_counter = 10
				Global_BellatiaDuplication:debug("cracking_torrent no target")
				return
			end
		--	彈跳次數
			local spring_times = #Global_BellatiaDuplication[caster.room_id].mansuoruien.hate_list_duplication * Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent.spring_times_rate
			Global_BellatiaDuplication:debug("skill cracking torrent : spring_times = " .. spring_times)
		--	仇恨表內容少於2個人彈跳1次。避免1人彈跳6次的設定
			if #hate_list_duplication < 2 then spring_times = 1 end
		--	隱型施法物件，如果施法者是崩解之核會改成隱形的崩解之核
			local hidden_model = Global_BellatiaDuplication_FifthBoss.mansuoruien_transparent_orgid
			if caster.ORGID == Global_BellatiaDuplication_FifthBoss.core_of_disintegration_orgid then hidden_model = Global_BellatiaDuplication_FifthBoss.core_of_disintegration_transparent_orgid end
		--	施法彈跳目標
			local targets = {}
			for index = 1, spring_times do
		--		第2次以後的彈跳
				if index > 1 then
		--			選擇距離上一次彈跳對象最近的其他對象
					for hater_index, hater in pairs(hate_list_duplication) do
						if not targets[index] and targets[index - 1].GUID ~= hater.GUID then targets[index] = hater
						elseif hater.hp > 0 and targets[index] and targets[index - 1]:distanceTo(targets[index]) > targets[index - 1]:distanceTo(hater) and targets[index - 1].GUID ~= hater.GUID then targets[index] = hater end
					end
		--			在選定對象的位置產生隱形物件施法
					local _npc = AddyNpc:new()
					_npc:create(hidden_model, targets[index - 1].x, targets[index - 1].y, targets[index - 1].z)
					_npc.fight = false
					_npc.movable = false
					_npc.strike_back = false
					_npc.search_enemy = false
					_npc.revive = false
					_npc.show_role_head = false
					_npc.mark = false
		--			2秒後刪除
					_npc.live_time = 2
					_npc:addToPartition(caster.room_id)
					_npc:castSpell(targets[index], 850925)
		--		第1次彈跳，法術從施法者出發
				else
		--			選擇最近的對象
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
	--	恐懼蔓延
		Global_BellatiaDuplication_FifthBoss.skill_fear_spread = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_fear_spread.name = "fear_spread"
		Global_BellatiaDuplication_FifthBoss.skill_fear_spread.cd = 3
		function Global_BellatiaDuplication_FifthBoss.skill_fear_spread:active(caster)
	--		隨機選定對象
			for index, player in pairs(Global_BellatiaDuplication[caster.room_id].players) do
				if player.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z and Lua_BellatiaDuplication_check_status(caster.room_id, "boss") and player.hp > 0 then
					caster:systemCastSpell(player, 850948)
					break
				end
			end
			Global_BellatiaDuplication:debug("skill fear spread end")
		end
	--	恐懼轉移處理
		function Lua_MagicObject_624460()
			local me = AddyPlayer:new(OwnerID())
			local room_id = me.room_id
			local closest_player = nil
--			搜索最近玩家
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if not closest_player and player.GUID ~= me.GUID then closest_player = player
				elseif closest_player and me:distanceTo(player) < me:distanceTo(closest_player) and player.GUID ~= me.GUID then closest_player = player end
			end
--			如果最近玩家超過120碼，死
			if not closest_player or me:distanceTo(closest_player) > 120 then
--					me:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_53]")
				Global_BellatiaDuplication[room_id].mansuoruien:systemCastSpell(me, 850960)
--					Global_BellatiaDuplication[room_id].mansuoruien.fear_spread_trigger = true
				if closest_player then Global_BellatiaDuplication[room_id].mansuoruien:systemCastSpell(closest_player, 850948) end
				Global_BellatiaDuplication:debug("mansuoruien.fear_spread_trigger = " .. tostring(Global_BellatiaDuplication[room_id].mansuoruien.fear_spread_trigger))
--			最近玩家在120碼內，給他恐懼蔓延
			else
				me:systemCastSpell(closest_player, 851039)
				Global_BellatiaDuplication[room_id].mansuoruien:systemCastSpell(closest_player, 850948)
				Global_BellatiaDuplication:debug("fear spread : " .. closest_player.GUID)
			end
		end

	-----------------------------------------------------------------
	--	空間變換
		Global_BellatiaDuplication_FifthBoss.skill_space_conversion = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_space_conversion.name = "space_conversion"
	--	根據副本強度整cd時間
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_space_conversion.cd = 30
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_space_conversion.cd = 38
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_space_conversion.cd = 45
		end
		function Global_BellatiaDuplication_FifthBoss.skill_space_conversion:active(caster)
	--		施放法術，法傷和緩速
			caster:castSpell(caster, 850950)
			--	位置交換處理
				local targets = {}
				for index, hater in pairs(caster.hate_list_duplication) do
					if hater.z >= Global_BellatiaDuplication[caster.room_id].door_before_boss5.z then table.insert(targets, hater) end
				end
				Global_BellatiaDuplication:debug("skill space conversion -> #targets = " .. #targets)
			--	對象列表隨機抓取一半為第一組
				local targets1 = get_random_table(targets, math.floor(#targets / 2))
				local targets2 = {}
			--	剩下的另一半為第二組
				for index, target in pairs(targets) do
					table.insert(targets2, target)
					for targets1_index, target1 in pairs(targets1) do
						if target == target1 then table.remove(targets2, #targets2) end
					end
				end
				Global_BellatiaDuplication:debug("skill space conversion -> #targets1 = " .. #targets1)
				Global_BellatiaDuplication:debug("skill space conversion -> #targets2 = " .. #targets2)
				local x1, y1, z1, x2, y2, z2 = caster.x, caster.y, caster.z, caster.x, caster.y, caster.z
			--	兩組位置互換
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
			--		奇數處理，多的人會從第一組隨機抓一個再換一次
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
	--	闇能箭雨
		Global_BellatiaDuplication_FifthBoss.skill_dark_arrows = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.name = "dark_arrows"
	--	根據副本強度整cd時間
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 8
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 11
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 14
		end
		function Global_BellatiaDuplication_FifthBoss.skill_dark_arrows:active(caster)
			local magic_lv = 0
	--		仇恨表內所有對象
			for index, hater in pairs(caster.hate_list_duplication) do
	--			根據debuff闇能箭穿刺624450決定施法等級
				if hater.buff[624450] then magic_lv = hater.buff[624450].power + 1 end
				caster:systemCastSpell(hater, 850951, magic_lv)
			end
			Global_BellatiaDuplication:debug("skill dark arrows end")
		end

	-----------------------------------------------------------------
	--	流逝印記
		Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.name = "hourglass_of_life"
	--	根據副本強度整cd時間
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.cd = 25
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.cd = 30
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life.cd = 40
		end
		function Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life:active(caster)
			local targets = {}
	--		隨機選3個目標，如果仇恨表少於3個就全部施放
			if #caster.hate_list_duplication > 3 then
				targets = get_random_table(caster.hate_list_duplication, 3)
			else targets = caster.hate_list_duplication end
	--		逐一施放流逝印記
			for index, target in pairs(targets) do caster:systemCastSpell(target, 850952) end
			Global_BellatiaDuplication:debug("skill hourglass of life end")
		end

	-----------------------------------------------------------------
	--	闇能裂隙
		Global_BellatiaDuplication_FifthBoss.skill_dark_rift = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_dark_rift.name = "dark_rift"
	--	根據副本強度整cd時間
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
	--	魔帝之怒
		Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.name = "the_anger_of_emperor"
	--	根據副本強度整cd時間和技能等級
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
	--	崩解之核
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
	--			落地特效
				core_of_disintegration:addBuff(620169)
	--			落地衝擊傷害
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
	--	空間暴湧
		Global_BellatiaDuplication_FifthBoss.skill_space_of_storm = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.name = "space_of_storm"
	--	根據副本強度整cd時間
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.cd = 6
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.cd = 8
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_space_of_storm.cd = 10
		end
		function Global_BellatiaDuplication_FifthBoss.skill_space_of_storm:active(caster)
	--		施法表演
	--		caster.search_enemy = false
	--		caster.strike_back = false
			caster.movable = false
	--		caster:stopAttack()
			caster:stopMove()
			caster:addBuff(507646) -- 完全不能動
			caster:playMotion(ruFUSION_ACTORSTATE_CAST_SP03)
			Sleep(8)
	--		產生隱形曼索瑞恩
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
	--		施法表演
			caster:playMotion(ruFUSION_ACTORSTATE_BUFF_SP03)
			Sleep(8)
	--		caster.search_enemy = true
	--		caster.strike_back = true
			caster.movable = true
			caster:cancelBuff(507646) -- 完全不能動
			Global_BellatiaDuplication:debug("skill space of storm end")
		end

	-----------------------------------------------------------------
	--	喪志衝擊
		Global_BellatiaDuplication_FifthBoss.skill_incredible_shock = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_incredible_shock.name = "incredible_shock"
		Global_BellatiaDuplication_FifthBoss.skill_incredible_shock.cd = 13
		function Global_BellatiaDuplication_FifthBoss.skill_incredible_shock:active(caster)
	--		隨機選定對象位置施放
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
	--	崩解符文之力
		Global_BellatiaDuplication_FifthBoss.skill_cure = AddySkill:new()
		Global_BellatiaDuplication_FifthBoss.skill_cure.name = "cure"
		Global_BellatiaDuplication_FifthBoss.skill_cure.cd = 12
	--	根據副本強度整技能等級
		if Global_BellatiaDuplication.type == "hard" then
			Global_BellatiaDuplication_FifthBoss.skill_cure.lv = 3
		elseif Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FifthBoss.skill_cure.lv = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FifthBoss.skill_cure.lv = 1
		end
		function Global_BellatiaDuplication_FifthBoss.skill_cure:active(caster)
	--		治療曼索瑞恩
			caster:castSpell(Global_BellatiaDuplication[caster.room_id].mansuoruien, 850958, Global_BellatiaDuplication_FifthBoss.skill_cure.lv)
		end

	-----------------------------------------------------------------
	--	放逐之拳
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