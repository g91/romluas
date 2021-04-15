-----------------------------------------------------------------
--	四王劇情設定
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
--	四王段落開場劇情
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
	--	吉兒‧艾克辛：光龍，在出發前我想先為自己以往幼稚的舉動道歉。
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_02]", time = 3, is_done = false},
	--	吉兒‧艾克辛：我不該因為拯救不了勞勃而把怒氣發洩在你和聯盟身上。
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_03]", time = 6, is_done = false},
	--	邦雷克姆斯：孩子，我們只是妳和摩瑞克所經歷的試煉中極小部分的一段課題。
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_04]", time = 9, is_done = false},
	--	邦雷克姆斯：任何錯誤都有修補的空間，妳需要的不是原諒，而是發自內心的醒悟。
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_05]", time = 12, is_done = false},
	--	邦雷克姆斯：透過這段時間的學習，相信妳和摩瑞克已有成長。
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_06]", time = 15, is_done = false},
	--	康葛斯：老實講我真的蠻感動的，可是有句話我還是得說……我們快被包圍了喔！！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_07]", time = 18, is_done = false},
	--	不用擔心，指揮官。這些監護者是攔不住我們的！
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
		--	劇情對話
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
--					for index, player in pairs(Global_BellatiaDuplication[room_id].players) do script.speaker:scriptMessage(player, script.content, 3) end
					script.speaker:say(script.content, 5)
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	戰鬥
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
		--	光龍走到哪，哪就生怪
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
		--		有怪打怪
				if #Global_BellatiaDuplication[room_id].enemies > 0 then ally:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)])
		--		沒怪跟著鐵薔薇走
				elseif ally:distanceTo(Global_BellatiaDuplication[room_id].ironrose) > 40 then ally:move(Global_BellatiaDuplication[room_id].ironrose.x - 30 + RandRange(1, 60), Global_BellatiaDuplication[room_id].ironrose.y, Global_BellatiaDuplication[room_id].ironrose.z - 30 + RandRange(1, 60), 0) end
			end
			for index, npc in pairs(team_move.npcs) do
				if #Global_BellatiaDuplication[room_id].enemies > 0 then npc:attack(Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]) end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	靠近第3支旗標進劇情
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
--	進四王前，鐵薔薇殿後阻擋湧入的制裁者
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
	--	審判者系統『維琪』：主人，法伊羅特不斷在測試封印陣的弱點，我擔心它......(殊不知邦克雷姆斯就是維琪!!?故事到底會怎麼發展下去呢!?)
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_09]", time = 1, is_done = false},
	--	曼索瑞恩：別擔心，我們之前就做過測試，它不可能突破我們的封印。去吧！試試它的元素力量，將這些可笑的小丑燒成灰燼！
		{speaker = "scriptMessage" , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_10]", time = 4, is_done = false},
	--	康葛斯：糟糕，監護者源源不絕的出現，這將阻擾我們的作戰計劃。
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_11]", time = 7, is_done = false},
	--	伊崔妮：人王，請將這裡交給我！
		{speaker = Global_BellatiaDuplication[room_id].ironrose, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_12]", time = 10, is_done = false},
	--	卡拉維‧卡薩姆：指揮官，伊崔妮沒問題的。我相信她可以阻擋監護者的支援
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_13]", time = 13, is_done = false},
	--	康葛斯：吧！鐵薔薇你就帶隊守住這裡，別讓監護者干擾我們！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_14]", time = 16, is_done = false},
	--	卡拉維‧卡薩姆：伊崔妮...
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_15]", time = 18, is_done = false},
	--	卡拉維‧卡薩姆：別死......
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_16]", time = 20, is_done = false},
	--	伊崔妮：人王......我不會讓你失望的
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
		--	劇情對話
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	不斷湧入的怪
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
		--	小怪小兵AI
			for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do
				if enemy.hp <= 0 then table.remove(Global_BellatiaDuplication[room_id].enemies, index) end
		--		有小兵打小兵，沒小兵打鐵薔薇
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
		--	所有npc打怪
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
		--	劇情跑完開始移動
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
	--	清表演怪
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
--	四王開戰前劇情
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
--	--	邦雷克姆斯：光龍邦喀雷姆斯：我的朋友，你依舊沉默得很。但是，不說聲再見嗎？
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
--	--	光龍變身睡覺
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
--	--	法伊羅特現身
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
--	--	初代龍使卡貝斯特：老友，沒想到最後是我要送你一程。
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_19]", 3) end
--
--	--	邦雷克姆斯：光龍邦喀雷姆斯：世局萬變，就像我們沒料到曼索瑞恩會背叛，他也不會料到最後是由你的血脈來中止他的瘋狂計劃。我的龍軀就交由你們保護了
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_20]", 3) end
--
--	-----------------------------------------------------------------
--	--	人王開防護罩
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
--	--	卡拉維．卡薩姆：卡貝斯特… …
--		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_21]", 3) end
--
--	--	叫出神劍
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
--	--	初代龍使卡貝斯特：真龍只在真心信任下，才會將夢行之眠時的安全將由他人來守護。你做得很好
--		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_22]", 3) end
--	-----------------------------------------------------------------
--
--	-----------------------------------------------------------------
--	--	保護罩
--	--	建立16個節點在保護罩周圍，攻擊光龍優先攻擊最近的保護罩節點
--	--	保護罩半徑
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
--	--		保護罩
--			_node:addBuff(624433)
--	--		不回血
--			_node:addBuff(624471)
--			table.insert(Global_BellatiaDuplication[room_id].protective_cover.node, _node)
--		end
--		Global_BellatiaDuplication[room_id].protective_cover.max_hp = Global_BellatiaDuplication[room_id].protective_cover.node[1].hp
--	--	烈火燎原免死
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(624433)
--		Global_BellatiaDuplication[room_id].cassam:addBuff(624433)
--	-----------------------------------------------------------------
--
--	--	卡拉維．卡薩姆：除了光龍，還有許多人也信任著我們。
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_12]", 3) end
--	Global_BellatiaDuplication:sleep(2.5)
--
--	--	卡拉維．卡薩姆：絕對不能辜負他們的期望，有我們守在這裡，誰也別想突破這道防線！
--	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_13]", 3) end
--	Global_BellatiaDuplication:sleep(2.5)
--
--	--	卡拉維．卡薩姆：伊蘭薩爾！守護你的創造者！展現你真正的力量！
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
	--		邦雷克姆斯：光龍邦喀雷姆斯：我的朋友，你依舊沉默得很。但是，不說聲再見嗎？
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_18]", 3) end
			Global_BellatiaDuplication[room_id].pangkorrams:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
		end, time = 0, is_done = false},
	--	光龍變身睡覺
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
	--	光隆睡覺loop
	--	法伊羅特現身
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
	--		初代龍使卡貝斯特：老友，沒想到最後是我要送你一程。
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_19]", 3) end
		end, time = 5, is_done = false},
		{action = function()
	--		邦雷克姆斯：光龍邦喀雷姆斯：世局萬變，就像我們沒料到曼索瑞恩會背叛，他也不會料到最後是由你的血脈來中止他的瘋狂計劃。我的龍軀就交由你們保護了
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_20]", 3) end
		end, time = 7, is_done = false},
	--	人王開防護罩
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
	--		卡拉維．卡薩姆：卡貝斯特… …
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_21]", 3) end
		end, time = 9, is_done = false},
	--	叫出神劍
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
	--		初代龍使卡貝斯特：真龍只在真心信任下，才會將夢行之眠時的安全將由他人來守護。你做得很好
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]".."[SC_BELLATIADUPLICATION_FOURTH_BOSS_22]", 3) end
		end, time = 11, is_done = false},
	--	保護罩
		{action = function()
		--	建立16個節點在保護罩周圍，攻擊光龍優先攻擊最近的保護罩節點
		--	保護罩半徑
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
		--		保護罩
				_node:addBuff(624433)
		--		不回血
				_node:addBuff(624471)
				table.insert(Global_BellatiaDuplication[room_id].protective_cover.node, _node)
			end
			Global_BellatiaDuplication[room_id].protective_cover.max_hp = Global_BellatiaDuplication[room_id].protective_cover.node[1].hp
		--	烈火燎原免死
			Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(624433)
			Global_BellatiaDuplication[room_id].cassam:addBuff(624433)
		end, time = 12, is_done = false},
		{action = function()
			--	卡拉維．卡薩姆：除了光龍，還有許多人也信任著我們。
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_12]", 3) end
		end, time = 14, is_done = false},
		{action = function()
			--	卡拉維．卡薩姆：絕對不能辜負他們的期望，有我們守在這裡，誰也別想突破這道防線！
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].cassam:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_13]", 3) end
		end, time = 16, is_done = false},
		{action = function()
			--	卡拉維．卡薩姆：伊蘭薩爾！守護你的創造者！展現你真正的力量！
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

