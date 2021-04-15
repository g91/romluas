-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	一王前
-----------------------------------------------------------------

-----------------------------------------------------------------
--	設定
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_setting()
	Global_BellatiaDuplication:debug("SETTING > first advance -> Lua_BellatiaDuplication_FirstAdvance_setting()")

	-----------------------------------------------------------------
	--	通用
	-----------------------------------------------------------------
		Global_BellatiaDuplication_FirstAdvance = {}
	--	延遲秒數
		Global_BellatiaDuplication_FirstAdvance.delay = 1
	--	光龍路線
		Global_BellatiaDuplication_FirstAdvance.pangkorrams_route_flag = AddyFlagGroup:new(781279)
		Global_BellatiaDuplication_FirstAdvance.pangkorrams_route_flag2 = AddyFlagGroup:new(781332)
	--	隊伍進攻路線
		Global_BellatiaDuplication_FirstAdvance.team_route_flag = AddyFlagGroup:new(781311)
	--	城門血量
		Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp = 15
		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp = 10
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_FirstAdvance.door_first_advance_hp = 7
		end

	-----------------------------------------------------------------
	--	制裁者
	-----------------------------------------------------------------
	--	制裁者種類
		Global_BellatiaDuplication_FirstAdvance.enemy_type = Global_BellatiaDuplication.enemy_type
	--	制裁者出生點
		Global_BellatiaDuplication_FirstAdvance.enemy_birth_flag = AddyFlagGroup:new(781276)
	--	制裁者路線
		Global_BellatiaDuplication_FirstAdvance.enemy_route_flag = AddyFlagGroup:new(781278)
	--	場面最大數量
		Global_BellatiaDuplication_FirstAdvance.enemy_maximum = 8
	--	場面最小數量
		Global_BellatiaDuplication_FirstAdvance.enemy_minimum = 4
	--	出生延遲秒數
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
	--	能量buff
		Global_BellatiaDuplication_FirstAdvance.power_buff = 620844
	--	火砲buff
		Global_BellatiaDuplication_FirstAdvance.fire_buff = 624261
	--	平台上小怪出生點
		Global_BellatiaDuplication_FirstAdvance.plat_enemy_birth_flag = AddyFlagGroup:new(781333)
	--	平台上小怪種類
		Global_BellatiaDuplication_FirstAdvance.plat_enemy_type = {103000, 103369, 103368}

	-----------------------------------------------------------------
	--	聯盟兵
	-----------------------------------------------------------------
	--	聯盟兵種類
		Global_BellatiaDuplication_FirstAdvance.ally_type = Global_BellatiaDuplication.ally_type
	--	聯盟兵出生點
		Global_BellatiaDuplication_FirstAdvance.ally_birth_flag = AddyFlagGroup:new(781277)
	--	聯盟兵路線
		Global_BellatiaDuplication_FirstAdvance.ally_route_flag = AddyFlagGroup:new(781283)
	--	場面最大數量
		Global_BellatiaDuplication_FirstAdvance.ally_maximum = 6
	--	場面最小數量
		Global_BellatiaDuplication_FirstAdvance.ally_minimum = 4
	--	出生延遲秒數
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
--	初始化
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_initialize(room_id)
	Global_BellatiaDuplication:debug("INIT > first advance -> Lua_BellatiaDuplication_FirstAdvance_initialize()")
	if not Global_BellatiaDuplication_FirstAdvance or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FirstAdvance_setting() end

	-----------------------------------------------------------------
	--	全域
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].battle_listener = AddyBattleListener:new()
	Global_BellatiaDuplication[room_id].is_stop_product = true
	Global_BellatiaDuplication[room_id].door_is_broken = false
	--	場上制裁者
	Global_BellatiaDuplication[room_id].enemies_team_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.enemy_route_flag)
	Global_BellatiaDuplication[room_id].enemies_team_move.move_tolerance = 30
	Global_BellatiaDuplication[room_id].enemies_last_produce_time = nil
	--	場上聯盟兵
	Global_BellatiaDuplication[room_id].allies_team_move = AddyTeamMove:new(Global_BellatiaDuplication_FirstAdvance.ally_route_flag)
	Global_BellatiaDuplication[room_id].allies_team_move.move_tolerance = 30
	Global_BellatiaDuplication[room_id].allies_last_produce_time = nil
	--	平台小怪
	Global_BellatiaDuplication[room_id].plat_enemies = {}
	--	士兵臨演
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
	--	表演
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].step = 1
	Global_BellatiaDuplication[room_id].step_trigger = true

	Lua_BellatiaDuplication_change_status(room_id, "advance")
end

-----------------------------------------------------------------
--	啟動
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_active()
	Global_BellatiaDuplication:debug("ACTIVE > first advance -> Lua_BellatiaDuplication_FirstAdvance_active()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_FirstAdvance_initialize(room_id)

	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FirstAdvance_rush")

	-----------------------------------------------------------------
	--	給任務旗標
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
		--	我得為後續艱苦的戰鬥保留力量，設法突破前方的能量障壁吧！
			if duration % 40 == 0 then Global_BellatiaDuplication[room_id].pangkorrams:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_33]", 5) end
		--	他們正利用地形攻擊！反擊！
			if duration % 36 == 0 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_31]", 2) end
		--	佔領監護者設置的電能符文柱反制遠方平台上的制裁者
			if duration % 36 == 3 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_32]", 2) end
		--	我得為後續艱苦的戰鬥保留力量，設法突破前方的能量障壁吧！
			if duration % 36 == 6 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_34]", 2) end
		--	佔領監護者設置的烈焰符文柱以干擾能量障壁
			if duration % 36 == 9 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_35]", 2) end
		--	利用監護者自身的能源補充這些符文柱！
			if duration % 36 == 12 and Global_BellatiaDuplication[room_id].allies_team_move.npcs[1] then Global_BellatiaDuplication[room_id].allies_team_move.npcs[1]:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_36]", 2) end
		end

		-----------------------------------------------------------------
		--	表演
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
		--	觸發表演
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
		--	我們已經攻入貝拉蒂亞王城結構內部，提高警覺...
			Global_BellatiaDuplication[room_id].pangkorrams:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_38]", 5)
			Global_BellatiaDuplication[room_id].pangkorrams_move:addEventListener(AddyTeamMoveEvent.AllArrived, function(event)
				event.target:removeEventListener(AddyTeamMoveEvent.AllArrived)
				event.target:stop()
		--		接下來的戰鬥將更加嚴峻，做好準備之後告訴我
				Global_BellatiaDuplication[room_id].pangkorrams:say("[SC_BELLATIADUOLICATION_FIRSTADVANCE_39]", 5)
				Lua_BellatiaDuplication_change_status(room_id, "success")
			end)
			Global_BellatiaDuplication[room_id].pangkorrams_move:add(Global_BellatiaDuplication[room_id].pangkorrams)
			Global_BellatiaDuplication[room_id].pangkorrams_move:start()
		end

		-----------------------------------------------------------------
		--	檢查
		-----------------------------------------------------------------
		--	人數計數器
		_counter = 0
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		--	玩家不在副本房間內計數器+1
			if player.room_id ~= room_id or player.hp <= 0 then _counter = _counter + 1 end
		end
		if _counter >= #Global_BellatiaDuplication[room_id].players or #Global_BellatiaDuplication[room_id].players == 0 then
		--	如果所有人都不在房間內判斷為滅團失敗
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
	--	結束後清除場面垃圾
	-----------------------------------------------------------------
	--	清除制裁者
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies_team_move.npcs) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #enemies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].enemies_team_move.npcs)
	Global_BellatiaDuplication[room_id].enemies_team_move.npcs = {}
	--	清除聯盟兵
	for index, ally in pairs(Global_BellatiaDuplication[room_id].allies_team_move.npcs) do ally:delete() end
	Global_BellatiaDuplication:debug("first advance, ally rush, #allies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].allies_team_move.npcs)
	Global_BellatiaDuplication[room_id].allies_team_move.npcs = {}
	--	清除表演士兵
	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do soldier:delete() end
	Global_BellatiaDuplication[room_id].soldiers = nil
	--	清除平台小怪
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].plat_enemies) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #plat_enemies = " .. #Global_BellatiaDuplication[room_id].plat_enemies)
	Global_BellatiaDuplication[room_id].plat_enemies = {}

	-----------------------------------------------------------------
	--	清變數
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].is_stop_product = nil
	Global_BellatiaDuplication[room_id].enemies_team_move = nil
	Global_BellatiaDuplication[room_id].allies_team_move = nil
	Global_BellatiaDuplication[room_id].soldiers = nil
	Global_BellatiaDuplication[room_id].plat_enemies = nil
	Global_BellatiaDuplication[room_id].pangkorrams_move = nil
	Global_BellatiaDuplication[room_id].npc_team_move = nil

	-----------------------------------------------------------------
	--	勝利和失敗的處理
	-----------------------------------------------------------------
	--	勝利
	if Lua_BellatiaDuplication_check_status(room_id, "success") then
		Global_BellatiaDuplication:debug("first advance success")
		Lua_BellatiaDuplication_update_save_point(room_id)
	end
	--	失敗
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication:debug("first advance fail")
		Lua_BellatiaDuplication_fail()
	end
end

-----------------------------------------------------------------
--	天堂路機關
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_rush()
	Global_BellatiaDuplication:debug("ACTIVE > first advance rush -> Lua_BellatiaDuplication_FirstAdvance_rush()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].is_stop_product = false

	-----------------------------------------------------------------
	--	開啟npc隊伍移動
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].enemies_team_move:start()
	Global_BellatiaDuplication[room_id].allies_team_move:start()

	while Lua_BellatiaDuplication_check_status(room_id, "advance") and not Global_BellatiaDuplication[room_id].door_is_broken do
		-----------------------------------------------------------------
		--	生產制裁者&聯盟兵
		-----------------------------------------------------------------
		--	制裁者
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
		--	聯盟兵
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
		--	生平台小怪
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

	--	清除制裁者
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies_team_move.npcs) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #enemies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].enemies_team_move.npcs)
	--	清除聯盟兵
	for index, ally in pairs(Global_BellatiaDuplication[room_id].allies_team_move.npcs) do ally:delete() end
	Global_BellatiaDuplication:debug("first advance, ally rush, #allies_team_move.npcs = " .. #Global_BellatiaDuplication[room_id].allies_team_move.npcs)
	--	清除平台小怪
	for index, enemy in pairs(Global_BellatiaDuplication[room_id].plat_enemies) do enemy:delete() end
	Global_BellatiaDuplication:debug("first advance, enemy rush, #plat_enemies = " .. #Global_BellatiaDuplication[room_id].plat_enemies)

	Global_BellatiaDuplication:debug("first advance rush end")
	Global_BellatiaDuplication[room_id].is_stop_product = true
end

-----------------------------------------------------------------
--	表演1
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_drama1()
	Global_BellatiaDuplication:debug("ACTIVE > first advance drama1 -> Lua_BellatiaDuplication_FirstAdvance_drama1()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local start_time = GetSystime(0)
	local current_time = start_time

	-----------------------------------------------------------------
	--	找臨演
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
	--	所有臨演加入隊伍
		Global_BellatiaDuplication[room_id].npc_team_move:add(soldier)
	--	到達後刪除
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
	--	表演
	-----------------------------------------------------------------
	local scripts = {
	--	光龍邦雷克姆斯：曼索瑞恩的所作所為將危及所有伊斯般那的生靈，他不曾意識到自己正跨過那危險的界線，我們一定要阻止他！
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_1]", time = 1, is_done = false},
	--	光龍邦雷克姆斯：他破壞法伊羅特的封印，令這股可怕的力量重回伊斯般那。
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_2]", time = 4, is_done = false},
	--	光龍邦雷克姆斯：還想運用法伊羅特的力量破壞另一個元素王封印，單是法伊羅特，就可能將伊斯般那化為一片火海，若是再多一名元素王，後果難料......
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_3]", time = 7, is_done = false},
	--	光龍邦雷克姆斯：因此，我們今日的戰果將決定伊斯般那的命運！進攻！為了伊斯般那！
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_4]", time = 10, is_done = false},
	--	人王卡拉維．卡薩姆：我賭上卡薩姆一族之名，人王之血，發誓一定會擊敗曼索瑞恩！粉碎他的野心和詭計！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_5]", time = 13, is_done = false},
	--	突擊指揮官康葛斯：按照計劃，我們先分頭破壞他們的防衛系統，儘量替行動爭取時間！
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
	--	表演完後出發
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
--	表演2
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_drama2()
	Global_BellatiaDuplication:debug("ACTIVE > first advance drama2 -> Lua_BellatiaDuplication_FirstAdvance_drama2()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local start_time = GetSystime(0)
	local current_time = start_time
	local npcs = {Global_BellatiaDuplication[room_id].cassam, Global_BellatiaDuplication[room_id].ironrose}
	for index, soldier in pairs(Global_BellatiaDuplication[room_id].soldiers) do table.insert(npcs, soldier) end

	-----------------------------------------------------------------
	--	表演
	-----------------------------------------------------------------
	local scripts = {
	--	審判者系統『維琪』：你們試圖直接擊敗監護者控制的中樞，然後我方的力量就會潰散？我真應該要求主人新增笑聲的資料
		{speaker = "scriptMessage", content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_7]", time = 1, is_done = false},
	--	審判者系統『維琪』：你們應該知道這種行動只會帶來一種下場吧？
		{speaker = "scriptMessage", content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_11]", time =4, is_done = false},
	--	康葛斯：看來有人想幫我們辦個歡迎派對？
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_12]", time = 7, is_done = false},
	--	邦雷克姆斯：勇士們，隨我繼續向前殺敵吧！康葛斯，你們能阻斷這些追兵嗎？
		{speaker = Global_BellatiaDuplication[room_id].pangkorrams, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_13]", time = 10, is_done = false},
	--	康葛斯：對這些猛男來說應該不是難事，攔住它們！一隻都別放過去！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_14]", time = 13, is_done = false},
	--	卡薩姆：康葛斯，我和伊崔妮先強攻它們一輪！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_15]", time = 16, is_done = false},
	--	伊崔妮：人王，您的背後有我守護著。
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
	--	表演無後出發
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
--	表演3
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FirstAdvance_drama3()
	Global_BellatiaDuplication:debug("ACTIVE > first advance drama3 -> Lua_BellatiaDuplication_FirstAdvance_drama3()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local start_time = GetSystime(0)
	local current_time = start_time

	-----------------------------------------------------------------
	--	初始狀態設定
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
	--	表演
	-----------------------------------------------------------------
	local scripts = {
	--	摩瑞克‧渥林特：吉兒，我們從空中包抄敵人。
		{speaker = Global_BellatiaDuplication[room_id].morrok, content = "[SC_BELLATIADUOLICATION_FIRSTADVANCE_17]", time =1, is_done = false},
	--	吉兒‧艾克辛：走！
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
	--	表演完後出發
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