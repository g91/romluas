-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	二王前機關
-----------------------------------------------------------------

-----------------------------------------------------------------
--	設定
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_setting()
	Global_BellatiaDuplication:debug("SETTING > second advance -> Lua_BellatiaDuplication_SecondAdvance_setting()")

	-----------------------------------------------------------------
	--	通用
	-----------------------------------------------------------------
		Global_BellatiaDuplication_SecondAdvance = {}
	--	延遲秒數
		Global_BellatiaDuplication_SecondAdvance.delay = 1
	--	光龍路線
		Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag = AddyFlagGroup:new(781281)
		Global_BellatiaDuplication_SecondAdvance.pangkorrams_route = {
	--		step1
			{Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[1],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[2],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[3],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[4],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[5],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[6],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[7],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[8]},
	--		step2
			{Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[9],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[10],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[11],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[12],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[13],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[14],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[15],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[16]},
	--		step3
			{Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[17],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[18],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[19],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[20],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[21],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[22],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[23],
			 Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[24]}
		}

	-----------------------------------------------------------------
	--	螞蟻設定
	-----------------------------------------------------------------
	--	螞蟻種類
		Global_BellatiaDuplication_SecondAdvance.ant_type = {103030, 103031, 103362}
		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_SecondAdvance.ant_type = {108026, 108027, 108028}
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_SecondAdvance.ant_type = {108091, 108092, 108093}
		end
		
	--	螞蟻出生旗標
		Global_BellatiaDuplication_SecondAdvance.ant_birth_flag = AddyFlagGroup:new(781280)
	--	螞蟻出生點
		Global_BellatiaDuplication_SecondAdvance.ant_birth_point = {
	--		step1
			{Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[1]},
	--		step2
			{Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[2],
			 Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[3]},
	--		step3
			{Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[4],
			 Global_BellatiaDuplication_SecondAdvance.ant_birth_flag[5]}
		}
	--	螞蟻巡邏旗標
		Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag = AddyFlagGroup:new(781287)
	--	螞蟻巡邏點
		Global_BellatiaDuplication_SecondAdvance.ant_patrol_point = {
	--		step1
			{Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[1],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[2],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[3],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[4]},
	--		step2
			{Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[5],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[6],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[7],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[8]},
	--		step3
			{Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[9],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[10],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[11],
			 Global_BellatiaDuplication_SecondAdvance.ant_patrol_flag[12]}
		}
	--
		Global_BellatiaDuplication_SecondAdvance.ant_birth_amount = 3
	--	場面最大數量
		Global_BellatiaDuplication_SecondAdvance.ant_maximum = 9
	--	出生延遲秒數
		Global_BellatiaDuplication_SecondAdvance.ant_delay = 10
		if Global_BellatiaDuplication.type == "normal" then
			Global_BellatiaDuplication_SecondAdvance.ant_maximum = 6
			Global_BellatiaDuplication_SecondAdvance.ant_delay = 12
			Global_BellatiaDuplication_SecondAdvance.ant_birth_amount = 2
		elseif Global_BellatiaDuplication.type == "easy" then
			Global_BellatiaDuplication_SecondAdvance.ant_maximum = 3
			Global_BellatiaDuplication_SecondAdvance.ant_delay = 14
			Global_BellatiaDuplication_SecondAdvance.ant_birth_amount = 2
		end
end

-----------------------------------------------------------------
--	初始化
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_initialize(room_id)
	if not Global_BellatiaDuplication_SecondAdvance or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_SecondAdvance_setting() end
	Global_BellatiaDuplication:debug("INIT > second advance initialize -> Lua_BellatiaDuplication_SecondAdvance_initialize()")

	Global_BellatiaDuplication[room_id].ants = {}
	Global_BellatiaDuplication[room_id].step = 1
	Global_BellatiaDuplication[room_id].is_ai_stop = true
	Global_BellatiaDuplication[room_id].is_rush_stop = true
	Global_BellatiaDuplication[room_id].pangkorrams.move_target = nil

	Lua_BellatiaDuplication_change_status(room_id, "advance")
end

-----------------------------------------------------------------
--	啟動
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_active()
	Global_BellatiaDuplication:debug("ACTIVE > second advance -> Lua_BellatiaDuplication_SecondAdvance_active()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_SecondAdvance_initialize(room_id)

	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_SecondAdvance_rush")
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_SecondAdvance_ai")

	while Lua_BellatiaDuplication_check_status(room_id, "advance") do

		Lua_BellatiaDuplication_update_players(room_id)

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_SecondAdvance.delay)

	--	當光隆打開門而且靠近房間內路線終點時進入下一階段
		if Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step] and Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step].is_open and
		   Global_BellatiaDuplication_SecondAdvance.pangkorrams_route[Global_BellatiaDuplication[room_id].step][#Global_BellatiaDuplication_SecondAdvance.pangkorrams_route[Global_BellatiaDuplication[room_id].step]]:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) < 30 then
			Global_BellatiaDuplication[room_id].step = Global_BellatiaDuplication[room_id].step + 1
			Global_BellatiaDuplication[room_id].pangkorrams.move_target = nil
			Global_BellatiaDuplication:debug("step : " .. Global_BellatiaDuplication[room_id].step)
		elseif Global_BellatiaDuplication[room_id].pangkorrams.move_target == Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag[#Global_BellatiaDuplication_SecondAdvance.pangkorrams_route_flag] and
		           Global_BellatiaDuplication[room_id]["door_ant3"].is_broken then
			Lua_BellatiaDuplication_change_status(room_id, "drama")
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

	while not  Global_BellatiaDuplication[room_id].is_rush_stop or not Global_BellatiaDuplication[room_id].is_ai_stop do Global_BellatiaDuplication:sleep(1) end

	for index, ant in pairs(Global_BellatiaDuplication[room_id].ants) do ant:delete() end
	Global_BellatiaDuplication[room_id].ants = nil
	Global_BellatiaDuplication[room_id].step = nil
	Global_BellatiaDuplication[room_id].is_ai_stop = nil

	-----------------------------------------------------------------
	--	攻略結束先接表演再勝利
	-----------------------------------------------------------------
	if Lua_BellatiaDuplication_check_status(room_id, "drama") then
		Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_SecondAdvance_drama")
	end
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication:debug("second advance fail")
		Lua_BellatiaDuplication_fail()
	end
end

-----------------------------------------------------------------
--	天堂路機關
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_rush()
	Global_BellatiaDuplication:debug("ACTIVE > second advance rush -> Lua_BellatiaDuplication_SecondAdvance_rush()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].is_rush_stop = false

	while Lua_BellatiaDuplication_check_status(room_id, "advance") do

		-----------------------------------------------------------------
		--	生螞蟻
		-----------------------------------------------------------------
		if not Global_BellatiaDuplication[room_id].ant_last_produce_time or
		   #Global_BellatiaDuplication[room_id].ants < Global_BellatiaDuplication_SecondAdvance.ant_maximum and
		   GetSystime(0) - Global_BellatiaDuplication[room_id].ant_last_produce_time >= Global_BellatiaDuplication_SecondAdvance.ant_delay and
		   not Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].is_broken then
			for index = 1, Global_BellatiaDuplication_SecondAdvance.ant_birth_amount do
				local _ant = AddyMonster:new()
				local birth_point = Global_BellatiaDuplication_SecondAdvance.ant_birth_point[Global_BellatiaDuplication[room_id].step][RandRange(1, #Global_BellatiaDuplication_SecondAdvance.ant_birth_point[Global_BellatiaDuplication[room_id].step])]
				_ant:create( Global_BellatiaDuplication_SecondAdvance.ant_type[RandRange(1, #Global_BellatiaDuplication_SecondAdvance.ant_type)], birth_point.x, birth_point.y, birth_point.z)
				_ant.patrol = false
				_ant.is_walk = 0
				_ant:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].ants, _ant)
			end
			Global_BellatiaDuplication[room_id].ant_last_produce_time = GetSystime(0)
			Global_BellatiaDuplication:debug("birth ant")
		end

		-----------------------------------------------------------------
		--	螞蟻AI
		-----------------------------------------------------------------
		for index, ant in pairs(Global_BellatiaDuplication[room_id].ants) do
		--	死亡 : 丟掉
			if ant.hp <= 0 or not CheckID(ant.GUID) then
				table.remove(Global_BellatiaDuplication[room_id].ants, index)
				break
			elseif #ant.hate_list <= 0 then
				ant.attack_target = Global_BellatiaDuplication[room_id].pangkorrams
			elseif #ant.hate_list > 0 then
			--	有仇恨優先考慮仇恨
				ant.attack_target = nil
			end
			if ant.attack_target then ant:attack(ant.attack_target) end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_SecondAdvance.delay)
	end

	Global_BellatiaDuplication[room_id].is_rush_stop = true
end

-----------------------------------------------------------------
--	光龍AI
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_ai()
	Global_BellatiaDuplication:debug("ACTIVE > pangkorrams ai -> Lua_BellatiaDuplication_SecondAdvance_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].is_ai_stop = false

	local scripts = {
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_20]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_21]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_22]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_23]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_24]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_25]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_26]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_27]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_28]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_29]",
		"[SC_BELLATIADUPLICATION_SECOND_ADVANCE_30]"
	}
	local time_mark = GetSystime(0)

	while Lua_BellatiaDuplication_check_status(room_id, "advance") do

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_SecondAdvance.delay)

		-----------------------------------------------------------------
		--	碎碎念
		-----------------------------------------------------------------
		if GetSystime(0) - time_mark >= 10 then
			Global_BellatiaDuplication[room_id].pangkorrams:say(scripts[RandRange(1, #scripts)], 5)
			time_mark = GetSystime(0)
		end

		-----------------------------------------------------------------
		--	搜索路線
		-----------------------------------------------------------------
		if not Global_BellatiaDuplication[room_id].pangkorrams.move_target and Global_BellatiaDuplication[room_id].pangkorrams.spell_magic_ORGID ~= 851040 then
		--	沒有移動目標，沒有拆門 : 前往該階段路線
			Global_BellatiaDuplication[room_id].pangkorrams.move_target = Global_BellatiaDuplication_SecondAdvance.pangkorrams_route[Global_BellatiaDuplication[room_id].step][1]
		--	依序尋找最接近旗標
			for index, flag in pairs(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route[Global_BellatiaDuplication[room_id].step]) do
				if flag:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) < Global_BellatiaDuplication[room_id].pangkorrams.move_target:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) then Global_BellatiaDuplication[room_id].pangkorrams.move_target = flag end
			end
			Global_BellatiaDuplication:debug("pangkorrams search move_target : " .. Global_BellatiaDuplication[room_id].pangkorrams.move_target.index)
		end
		if Global_BellatiaDuplication[room_id].pangkorrams.move_target and Global_BellatiaDuplication[room_id].pangkorrams.move_target.class == "Flag" then
		--	接近移動目標 : 前往下一支旗標
			if Global_BellatiaDuplication[room_id].pangkorrams.move_target:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) < 30 then
				Global_BellatiaDuplication:debug("close move_target.index : " .. Global_BellatiaDuplication[room_id].pangkorrams.move_target.index)
				for index, flag in pairs(Global_BellatiaDuplication_SecondAdvance.pangkorrams_route[Global_BellatiaDuplication[room_id].step]) do
					if Global_BellatiaDuplication[room_id].pangkorrams.move_target == flag then
						Global_BellatiaDuplication[room_id].pangkorrams.move_target = Global_BellatiaDuplication_SecondAdvance.pangkorrams_route[Global_BellatiaDuplication[room_id].step][index + 1]
						break
					end
				end
			end
		end
		if Global_BellatiaDuplication[room_id].pangkorrams.move_target and Global_BellatiaDuplication[room_id].pangkorrams.move_target.class == "Flag" then
			Global_BellatiaDuplication:debug("move_target.index : " .. Global_BellatiaDuplication[room_id].pangkorrams.move_target.index)
		end

		-----------------------------------------------------------------
		--	拆窗
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step] and not Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].is_broken then
		--	距離過遠 : 靠近
			if Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step]:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) > 220 then
				if CheckLine(
				   Global_BellatiaDuplication[room_id].pangkorrams.GUID,
				   Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].x,
				   Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].y,
				   Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].z) then
					Global_BellatiaDuplication[room_id].pangkorrams.move_target = Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step]
					Global_BellatiaDuplication:debug("pangkorrams move_target : door_ant" .. Global_BellatiaDuplication[room_id].step)
				end
		--	距離足夠 : 拆門
			elseif Global_BellatiaDuplication[room_id].pangkorrams.spell_magic_ORGID ~= 851040 then
				Global_BellatiaDuplication[room_id].pangkorrams.move_target = nil
				Global_BellatiaDuplication[room_id].pangkorrams:stopMove()
				Global_BellatiaDuplication[room_id].pangkorrams:faceTo(Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step])
--				Global_BellatiaDuplication[room_id].pangkorrams:castSpell(Global_BellatiaDuplication[room_id].pangkorrams, 851040)
				Global_BellatiaDuplication[room_id].pangkorrams:castSpell(Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step], 851040)
			end
		end

		-----------------------------------------------------------------
		--	拆門
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step] and not Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step].is_open and
		   Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].is_broken then
		--	距離過遠 : 靠近
			if Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step]:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) > 80 then
				if CheckLine(
				   Global_BellatiaDuplication[room_id].pangkorrams.GUID,
				   Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step].x,
				   Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step].y,
				   Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step].z) then
					Global_BellatiaDuplication[room_id].pangkorrams.move_target = Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step]
					Global_BellatiaDuplication:debug("pangkorrams move_target : door_ant_room" .. Global_BellatiaDuplication[room_id].step)
				end
		--	距離足夠 : 開門
			else
				Global_BellatiaDuplication[room_id].pangkorrams.move_target = nil
				Global_BellatiaDuplication[room_id].pangkorrams:stopMove()
				Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
				Global_BellatiaDuplication[room_id].pangkorrams:castSpell(Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step], 850959)
			end
		end

		if Global_BellatiaDuplication[room_id].pangkorrams.spell_magic_ORGID == 851040 then
			Global_BellatiaDuplication[room_id].pangkorrams.movable = false
			Global_BellatiaDuplication[room_id].pangkorrams.strike_back = false
			Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
			Global_BellatiaDuplication[room_id].pangkorrams.disable_rotate = true
		else
			Global_BellatiaDuplication[room_id].pangkorrams.movable = true
			Global_BellatiaDuplication[room_id].pangkorrams.strike_back = true
			Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = true
			Global_BellatiaDuplication[room_id].pangkorrams.disable_rotate = false
		end

		-----------------------------------------------------------------
		--	移動
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].pangkorrams.move_target then
			Global_BellatiaDuplication[room_id].pangkorrams:move(Global_BellatiaDuplication[room_id].pangkorrams.move_target.x, Global_BellatiaDuplication[room_id].pangkorrams.move_target.y, Global_BellatiaDuplication[room_id].pangkorrams.move_target.z, 0)
		end
	end

	Global_BellatiaDuplication[room_id].pangkorrams:interruptMagic()

	Global_BellatiaDuplication[room_id].is_ai_stop = true
end

-----------------------------------------------------------------
--	表演初始化
-----------------------------------------------------------------
function Lua_BellatiaDuplication_SecondAdvance_drama_initialize(room_id)
	Global_BellatiaDuplication:debug("INIT > second advance drama -> Lua_BellatiaDuplication_SecondAdvance_drama_initialize()")

	-- 表演士兵
	Global_BellatiaDuplication[room_id].soldiers = {}
	-- 表演螞蟻
	Global_BellatiaDuplication[room_id].ants = {}
end

-----------------------------------------------------------------
--	光龍拆門法術觸發
-----------------------------------------------------------------
function Lua_zone26_area2_break_door()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Sleep(28)
	Global_BellatiaDuplication:sleep(1)
	Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step]:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	Global_BellatiaDuplication:sleep(1)
	Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step]:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
	Global_BellatiaDuplication[room_id]["door_ant" .. Global_BellatiaDuplication[room_id].step].is_broken = true

	Global_BellatiaDuplication:debug("break door")
end

-----------------------------------------------------------------
--	我輕輕地推開門
-----------------------------------------------------------------
function MagicObject_624346_RunPlot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step]:playMotion(ruFUSION_MIME_ACTIVATE_BEGIN)
	Global_BellatiaDuplication:sleep(1)
	Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step]:setIdleMotion(ruFUSION_MIME_ACTIVATE_LOOP)
	Global_BellatiaDuplication[room_id]["door_ant_room" .. Global_BellatiaDuplication[room_id].step].is_open = true
end