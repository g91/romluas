----------------------------------------------------------------
--	zone 28 副本 oro_duplication_yetis
----------------------------------------------------------------
--	4王 耶里斯 yetis
----------------------------------------------------------------
function gm_oroduplication_test()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	oro_duplication_yetis[room_id].yetis:addBuff(624919)
end

function Npc_107967_CreatePlot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Cl_Resist_HackersBossNum()
	if oro_duplication_yetis and oro_duplication_yetis[room_id] and oro_duplication_yetis[room_id].handler then
		oro_duplication_yetis[room_id].handler:delete()
	end
	oro_duplication_yetis_initialize(room_id)
end

function Npc_107967_DeadPlot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	oro_duplication_yetis[room_id].status = "success"
	oro_duplication_yetis[room_id].keep_fight = false
	oro_duplication_yetis[room_id].yetis.is_ai_stop = true
	oro_duplication_yetis[room_id].rear_door:delete()
	Cl_Resist_HackersBossDead()
end

function oro_duplication_yetis_setting()
	oro_duplication_yetis = Christine.System:new("ORO Duplication Yetis")
	oro_duplication_yetis.alpha = false
	oro_duplication_yetis.beta = false
	oro_duplication_yetis.delay = 0.5

	oro_duplication_yetis.collision_flags = Christine.FlagGroup:new(781356)
	oro_duplication_yetis.wall_flags = Christine.FlagGroup:new(781347)
	oro_duplication_yetis.yetis_avatar_orgid = 108193
	if this().zone_id == 161 then oro_duplication_yetis.yetis_avatar_orgid = 108308 end
	if this().zone_id == 162 then oro_duplication_yetis.yetis_avatar_orgid = 108315 end

	oro_duplication_yetis.orgin_position = {
		x = this().x,
		y = this().y,
		z = this().z
	}

	oro_duplication_yetis.skill = {}

	----------------------------------------------------------------
	--	迴旋突刺 Rotate Thrusting
	----------------------------------------------------------------
	oro_duplication_yetis.skill.rotate_thrusting = Christine.Skill:new()
	oro_duplication_yetis.skill.rotate_thrusting.name = "rotate_thrusting"
	oro_duplication_yetis.skill.rotate_thrusting.cd = 6
	function oro_duplication_yetis.skill.rotate_thrusting:active(caster)
--		caster:say(self.name)
		caster.movable = false
		caster:stopMove()
		oro_duplication_yetis:sleep(1)
		caster:castSpell(caster, 851243)
		oro_duplication_yetis_create_wave()
		caster.movable = true
		oro_duplication_yetis:sleep(1)
		return true
	end

	----------------------------------------------------------------
	--	致命突刺 Deadly Thrusting
	----------------------------------------------------------------
	oro_duplication_yetis.skill.deadly_thrusting = Christine.Skill:new()
	oro_duplication_yetis.skill.deadly_thrusting.name = "deadly_thrusting"
	oro_duplication_yetis.skill.deadly_thrusting.cd = 11
	function oro_duplication_yetis.skill.deadly_thrusting:active(caster)
		local target = nil
		for index, hater in pairs(caster.hate_list) do
			if not target then target = hater
			elseif hater.hate_point > target.hate_point then target = hater end
		end
		if not target then return false end
--		caster:say(self.name)
		caster.movable = false
		caster:stopMove()
		oro_duplication_yetis:sleep(1)
		caster:castSpell(target, 851241)
		oro_duplication_yetis_create_wave()
		caster.movable = true
		oro_duplication_yetis:sleep(1)
		return true
	end

	----------------------------------------------------------------
	--	震地突襲 Assault
	----------------------------------------------------------------
	oro_duplication_yetis.skill.assault = Christine.Skill:new()
	oro_duplication_yetis.skill.assault.name = "assault"
	oro_duplication_yetis.skill.assault.cd = 16
	function oro_duplication_yetis.skill.assault:active(caster)
--		caster:say(self.name)
		caster.movable = false
		caster:stopMove()
		oro_duplication_yetis:sleep(1)
		caster:castSpell(caster, 851245)
		oro_duplication_yetis_create_wave()
		caster.movable = true
		oro_duplication_yetis:sleep(1)
		return true
	end

	----------------------------------------------------------------
	--	絕音能量釋放 Release the sound of despair
	----------------------------------------------------------------
	oro_duplication_yetis.skill.release_the_sound_of_despair = Christine.Skill:new()
	oro_duplication_yetis.skill.release_the_sound_of_despair.name = "release_the_sound_of_despair"
	oro_duplication_yetis.skill.release_the_sound_of_despair.cd = 0
	function oro_duplication_yetis.skill.release_the_sound_of_despair:active(caster)

		ScriptMessage(caster.guid, 0, 3, "[$MUTE]".."[SC_DUPLICATION_ORO_09]", 0)

--		caster:say(self.name)
		oro_duplication_yetis[caster.room_id].keep_fight = true
		caster:addBuff(624917):addBuff(625261):property {
			fight = false,
			strike_back = false,
			search_enemy = false
		}:stopMove()
		caster:stopAttack()

		local flags = oro_duplication_yetis.collision_flags
		local collision_counter = 0

		while collision_counter <= 10 and oro_duplication_yetis[caster.room_id].status == "boss" do
			if not caster.move_target then
				collision_counter = collision_counter + 1
				if caster.last_move_target then
					local index = caster.last_move_target.index + (#flags / 2) - 25 + RandRange(1, 50)
					if index > #flags then
						index = index - #flags
					end
					caster.move_target = flags[index]
				else
					caster.move_target = flags[RandRange(1, #flags)]
				end
				oro_duplication_yetis:debug("new move_target : " .. caster.move_target.index)
			else
				caster:move(
					caster.move_target.x,
					caster.move_target.y,
					caster.move_target.z
				)
				if caster:distanceTo(caster.move_target) < 35 then
					oro_duplication_yetis:debug("collision")
					caster:property {
						last_move_target = caster.move_target,
						move_target = false,
						movable = false
					} :stopMove():castSpell(caster, 851244):sleep(0.4):property {
						movable = true
					}
				end
				local search_count = SetSearchAllPlayer(caster.room_id)
				local dead_count = 0
				for index = 1, search_count do
					if Christine.Player:new(GetSearchResult()).is_dead then
						dead_count = dead_count + 1
					else
						break
					end
				end
				if dead_count >= search_count then
					oro_duplication_yetis[caster.room_id].status = "fail"
				end
				oro_duplication_yetis:sleep()
			end
		end

		caster:cancelBuff(624917):cancelBuff(625261):property {
			fight = true,
			strike_back = true,
			search_enemy = true
		}
		local search_count = SetSearchAllPlayer(caster.room_id)
		local dead_count = 0
		for index = 1, search_count do
			local player = Christine.Player:new(GetSearchResult())
			if player.is_dead then
				dead_count = dead_count + 1
			else
				caster:hate(player)
			end
		end
		if dead_count < search_count then
			oro_duplication_yetis:sleep(3)
		end
		oro_duplication_yetis[caster.room_id].keep_fight = false
		return true
	end
--	function oro_duplication_yetis.skill.release_the_sound_of_despair:active(caster)
--
--		ScriptMessage(caster.guid, 0, 3, "[$MUTE]".."[SC_DUPLICATION_ORO_09]", 0)
--
----		caster:say(self.name)
----		oro_duplication_yetis[caster.room_id].keep_fight = true
--
--		local train = Christine.Npc:new()
--		train:create(caster.ORGID, caster.x, caster.y, caster.z, caster.direction)
--		train:addBuff(624917):addBuff(625261):property {
--			fight = false,
--			strike_back = false,
--			search_enemy = false,
--			movable = true
--		}
--		oro_duplication_yetis:debug("create train")
--
--		caster:addBuff(624917):addBuff(625261):hide_from_room():property {
--			fight = false,
--			strike_back = false,
--			search_enemy = false,
--			show_role_head = false,
--			hide_hp_mp = true,
--			hide_name = true,
--			movable = false
--		}:stopMove()
--		oro_duplication_yetis:debug("hide boss")
----		caster:stopAttack()
--		train:changePosition(caster.x, caster.y, caster.z, caster.direction)
--		train:addToPartition(caster.room_id)
--		oro_duplication_yetis:debug("show train")
--		local flags = oro_duplication_yetis.collision_flags
--		local collision_counter = 0
--
--		while collision_counter <= 10 and oro_duplication_yetis[train.room_id].status == "boss" do
--			if not train.move_target then
--				collision_counter = collision_counter + 1
--				if train.last_move_target then
--					local index = train.last_move_target.index + (#flags / 2) - 25 + RandRange(1, 50)
--					if index > #flags then
--						index = index - #flags
--					end
--					train.move_target = flags[index]
--				else
--					train.move_target = flags[RandRange(1, #flags)]
--				end
--				oro_duplication_yetis:debug("new move_target : " .. train.move_target.index)
--			else
--				train:move(
--					train.move_target.x,
--					train.move_target.y,
--					train.move_target.z
--				)
--				if train:distanceTo(train.move_target) < 35 then
--					oro_duplication_yetis:debug("collision")
--					train:property {
--						last_move_target = train.move_target,
--						move_target = false,
--						movable = false
--					} :stopMove():castSpell(train, 851244):sleep(0.4):property {
--						movable = true
--					}
--				end
----				local search_count = SetSearchAllPlayer(train.room_id)
----				local dead_count = 0
----				for index = 1, search_count do
----					if Christine.Player:new(GetSearchResult()).is_dead then
----						dead_count = dead_count + 1
----					else
----						break
----					end
----				end
----				if dead_count >= search_count then
----					oro_duplication_yetis[train.room_id].status = "fail"
----				end
--				oro_duplication_yetis:sleep()
--			end
--		end
--
--		train:cancelBuff(624917):cancelBuff(625261):property {
--			fight = true,
--			strike_back = true,
--			search_enemy = true,
--			movable = false
--		}:stopMove()
--
--		caster:changePosition(train.x, train.y, train.z, train.direction)
--		train:delFromPartition()
--		oro_duplication_yetis:debug("delete train")
--		caster:cancelBuff(624917):cancelBuff(625261):show_to_room(train.room_id):property {
--			fight = true,
--			strike_back = true,
--			search_enemy = true,
--			show_role_head = true,
--			hide_hp_mp = false,
--			hide_name = false,
--			movable = true
--		}
--		oro_duplication_yetis:debug("show boss")
--
----		local search_count = SetSearchAllPlayer(caster.room_id)
----		for index = 1, search_count do
----			caster:hate(Christine.Player:new(GetSearchResult()))
----		end
--		oro_duplication_yetis:sleep(3)
--		oro_duplication_yetis:debug("skill : release_the_sound_of_despair -> end")
----		oro_duplication_yetis[caster.room_id].keep_fight = false
--		return true
--	end
	function MagicObject_624912()
		local player = Christine.Player:new(TargetID())
		if player.buff[624915] then
			player:systemCastSpell(player, 851251, player.buff[624915].power)
		end
		return true
	end

	----------------------------------------------------------------
	--	爆發音震 Broke the sound of despair 
	----------------------------------------------------------------
	oro_duplication_yetis.skill.broke_the_sound_of_despair = Christine.Skill:new()
	oro_duplication_yetis.skill.broke_the_sound_of_despair.name = "broke_the_sound_of_despair"
	oro_duplication_yetis.skill.broke_the_sound_of_despair.cd = 21
	function oro_duplication_yetis.skill.broke_the_sound_of_despair:active(caster)
--		caster:say(self.name)
--		caster.movable = false
--		oro_duplication_yetis[caster.room_id].keep_fight = true
		caster:property {
			movable = false,
			strike_back = false,
			search_enemy = false,
			fight = false
		} :addBuff(624927):stopMove()

		caster:castSpell(851249)

		local time_mark = 0
		local targets = {}
		local kick_out_list = {}
		oro_duplication_yetis[caster.room_id].npcs = {}

		oro_duplication_yetis:sleep(1)

		oro_duplication_yetis:debug("skill > broke_the_sound_of_despair : begin loop")

		while oro_duplication_yetis[caster.room_id].status == "boss" and
		          (not caster.buff[624907] or caster.buff[624907].power < 9) and
		          (caster.spell_magic_ORGID == 851249 or caster.spell_magic_ORGID == 851250 or caster.spell_magic_ORGID == 851248) do
			if oro_duplication_yetis[caster.room_id].battle_listener.current_time - time_mark > 3 then
				oro_duplication_yetis:debug("skill > broke_the_sound_of_despair : explode")
				time_mark = oro_duplication_yetis[caster.room_id].battle_listener.current_time
				if #oro_duplication_yetis[caster.room_id].players <= 6 then
					targets = oro_duplication_yetis[caster.room_id].players
				else targets = table.random(oro_duplication_yetis[caster.room_id].players, 6) end
				for index, target in pairs(targets) do
					local _npc = Christine.Npc:new():create(oro_duplication_yetis.yetis_avatar_orgid, target.x, target.y, target.z)
					_npc:property {
						fight = false,
						strike_back = false,
						search_enemy = false,
						movable = false,
						show_role_head = false,
						hide_hp_mp = true,
						hide_name = true,
						live_time = 4,
						is_hit = false
					} :addToPartition(caster.room_id):castSpell(851247)
					table.insert(oro_duplication_yetis[caster.room_id].npcs, _npc)
				end
			end
			kick_out_list = {}
			for index, npc in pairs(oro_duplication_yetis[caster.room_id].npcs) do
				if not npc.is_legal then table.insert(kick_out_list, npc) end
			end
			for index = 1, #kick_out_list do
				for _index, _npc in pairs(oro_duplication_yetis[caster.room_id].npcs) do
					if _npc == kick_out_list[index] then
						if not _npc.is_hit then caster:addBuff(624907) end
						table.remove(oro_duplication_yetis[caster.room_id].npcs, _index)
						break
					end
				end
			end
			local search_count = SetSearchAllPlayer(caster.room_id)
			local dead_count = 0
			for index = 1, search_count do
				if Christine.Player:new(GetSearchResult()).is_dead then
					dead_count = dead_count + 1
				else
					break
				end
			end
			if dead_count >= search_count then
				oro_duplication_yetis[caster.room_id].status = "fail"
			end
			oro_duplication_yetis:debug("skill > broke_the_sound_of_despair : loop")
			oro_duplication_yetis:sleep()
		end
		oro_duplication_yetis:debug("skill > broke_the_sound_of_despair : loop end")
		oro_duplication_yetis:sleep(1)

		for index, npc in pairs(oro_duplication_yetis[caster.room_id].npcs) do npc:delete() end

--		caster.movable = true
		caster:property {
			movable = true,
			strike_back = true,
			search_enemy = true,
			fight = true
		} :cancelBuff(624927):cancelBuff(624907):interruptMagic()
--		for index, player in pairs(oro_duplication_yetis[caster.room_id].players) do caster:hate(player) end
		oro_duplication_yetis:sleep(3)
--		oro_duplication_yetis[caster.room_id].keep_fight = false
		oro_duplication_yetis:debug("skill > broke_the_sound_of_despair : end")
		return true
	end
	function MagicObject_624918()
	--	爆發音震命中
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		local npc = nil
		for index, _npc in pairs(oro_duplication_yetis[room_id].npcs) do
			if OwnerID() == _npc.GUID then npc = _npc break end
		end
		if npc then npc.is_hit = true end
		return true
	end
	function oro_duplication_yetis_test()
		oro_duplication_yetis[thisPlayer().room_id].yetis:castSpell(851250)
	end

	----------------------------------------------------------------
	--	震盪檢查
	----------------------------------------------------------------
	function MagicObject_624902()
		local player = Christine.Player:new(TargetID())
		if player.buff[624902] and player.buff[624902].power > 8 then
			player.buff[624902]:remove()
			if oro_duplication_yetis[player.room_id].battle_listener.current_time % 2 == 0 then
				player:addBuff(624903)
			else
				player:addBuff(624904)
			end
			return false
		end
		return true
	end

	----------------------------------------------------------------
	--	音波命中
	----------------------------------------------------------------
	function MagicObject_624925()
		local target = Christine.Role:new(TargetID())

		if thisNpc().register1 == 1 and target.GUID == oro_duplication_yetis[target.room_id].yetis.GUID then
			oro_duplication_yetis[target.room_id].yetis:addBuff(624919)
			if not oro_duplication_yetis[target.room_id].yetis.buff[624921] then
				oro_duplication_yetis[target.room_id].yetis:addBuff(624921)
			elseif not oro_duplication_yetis[target.room_id].yetis.buff[624923] then
				oro_duplication_yetis[target.room_id].yetis:addBuff(624923)
			elseif not oro_duplication_yetis[target.room_id].yetis.buff[624924] then
				oro_duplication_yetis[target.room_id].yetis:addBuff(624924)
			end
			thisNpc():delete()
		elseif target.is_player and not target.is_dead then
			target:addBuff(624905)
		end
	end

	oro_duplication_yetis:debug("setting done")
end

function oro_duplication_yetis_initialize(room_id)
	if not oro_duplication_yetis or oro_duplication_yetis.alpha then oro_duplication_yetis_setting() end

	local rear_door

	if oro_duplication_yetis and
	   oro_duplication_yetis[room_id] and
	   oro_duplication_yetis[room_id].rear_door and
	   oro_duplication_yetis[room_id].rear_door.is_legal then
		rear_door = oro_duplication_yetis[room_id].rear_door
	end

	oro_duplication_yetis[room_id] = {}

	if rear_door then
		oro_duplication_yetis[room_id].rear_door = rear_door
	else
		oro_duplication_yetis[room_id].rear_door = Christine.Npc:new()
		oro_duplication_yetis[room_id].rear_door:create(108515, -1295, 3600, -530, 310)
		oro_duplication_yetis[room_id].rear_door:property {
			mark = false,
			fight = false,
			search_enemy = false,
			strike_back = false,
			hide_hp_mp = true,
			hide_name = true,
			obstruct = true,
			movable = false
		} :addToPartition(room_id)
	end

	oro_duplication_yetis[room_id].handler = Christine.Npc:new()
	oro_duplication_yetis[room_id].handler:create(107967)

	oro_duplication_yetis[room_id].players = {}
	oro_duplication_yetis[room_id].waves = {}
	oro_duplication_yetis[room_id].walls = {}
	oro_duplication_yetis[room_id].npcs = {}
	oro_duplication_yetis[room_id].status = "standby"
	oro_duplication_yetis[room_id].keep_fight = false
	oro_duplication_yetis[room_id].battle_listener = Christine.BattleListener:new()

	oro_duplication_yetis[room_id].yetis = Christine.Npc:new(OwnerID())
	oro_duplication_yetis[room_id].yetis.is_ai_stop = true

	for buff_id, buff in pairs(oro_duplication_yetis[room_id].yetis.buff) do buff:remove(false) end

	oro_duplication_yetis[room_id].yetis:property {
		search_enemy = true,
		revive = false,
		is_walk = false,
		hp = oro_duplication_yetis[room_id].yetis.max_hp
	}
	oro_duplication_yetis[room_id].yetis:addBuff(624906)
	oro_duplication_yetis[room_id].yetis:addSkill("rotate_thrusting", oro_duplication_yetis.skill.rotate_thrusting)
	oro_duplication_yetis[room_id].yetis:addSkill("deadly_thrusting", oro_duplication_yetis.skill.deadly_thrusting)
	oro_duplication_yetis[room_id].yetis:addSkill("assault", oro_duplication_yetis.skill.assault)
	oro_duplication_yetis[room_id].yetis:addSkill("release_the_sound_of_despair", oro_duplication_yetis.skill.release_the_sound_of_despair)
	oro_duplication_yetis[room_id].yetis:addSkill("broke_the_sound_of_despair", oro_duplication_yetis.skill.broke_the_sound_of_despair)

	oro_duplication_yetis[room_id].battle_listener:add(oro_duplication_yetis[room_id].yetis)

	oro_duplication_yetis:debug("initialize done")
end

function oro_duplication_yetis_active()

	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if oro_duplication_yetis[room_id] and oro_duplication_yetis[room_id].status ~= "standby" then
		return false
	end

	oro_duplication_yetis:debug("oro_duplication_yetis_active()")

	for index = 1, SetSearchAllPlayer(room_id) do
		that(GetSearchResult()):changePosition(-883, 3602.8, -125)
	end

	for index, flag in ipairs(oro_duplication_yetis.wall_flags) do
		local wall = Christine.Npc:new():create(
			108192,
			flag.x,
			flag.y,
			flag.z,
			flag.direction
		):property {
			fight = false,
			strike_back = false,
			search_enemy = false,
			movable = false,
			obstruct = true,
			mark = false,
			hide_from_mini_map = true,
			hide_hp_mp = true,
			hide_name = true,
			show_role_head = false
		} :addToPartition(room_id)
		table.insert(oro_duplication_yetis[room_id].walls, wall)
	end

	oro_duplication_yetis:sleep(2)

	oro_duplication_yetis[room_id].status = "boss"

	oro_duplication_yetis[room_id].handler:beginPlot("oro_duplication_yetis_main")
	oro_duplication_yetis[room_id].yetis:beginPlot("oro_duplication_yetis_ai")

	oro_duplication_yetis[room_id].yetis:addBuff(502707)	-- 停止回血502707

	Cl_Resist_HackersFightBegin()
end

function oro_duplication_yetis_main()
	oro_duplication_yetis:debug("oro_duplication_yetis_main() start")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local kick_out_list, is_match = {}, false

	local yetis = oro_duplication_yetis[room_id].yetis
	local battle_listener = oro_duplication_yetis[room_id].battle_listener
	local players = oro_duplication_yetis[room_id].players

	ScriptMessage(yetis.guid, 0, 3, "[$MUTE]".."[SC_DUPLICATION_ORO_06]", 0)

	while oro_duplication_yetis[room_id].status == "boss" do
		battle_listener:start()

		for index, hater in ipairs(yetis.hate_list) do
			is_match = false
			for player_index, player in pairs(players) do
				if hater.GUID == player.GUID then
					player.last_check_time = battle_listener.current_time
					is_match = true
					break
				end
			end
			if not is_match then
				hater.last_check_time = battle_listener.current_time
				table.insert(players, hater)
			end
		end

		kick_out_list = {}
		for index, player in pairs(players) do
			player.last_check_time = player.last_check_time or battle_listener.current_time
			if battle_listener.current_time - player.last_check_time > 10 then
				table.insert(kick_out_list, player)
			end
		end
		for index = 1, #kick_out_list do
			for player_index, player in pairs(players) do
				if player == kick_out_list[index] then table.remove(players, player_index) break end
			end
		end

		oro_duplication_yetis:sleep()

		if not oro_duplication_yetis[room_id].keep_fight then
			if battle_listener.duration_time > 3 and #players <= 0 then
				oro_duplication_yetis[room_id].status = "fail"
				yetis.fight = false
				yetis.strike_back = false
				yetis.search_enemy = false
				yetis:stopAttack()
			end
		end

		----------------------------------------------------------------
		--	debug
		----------------------------------------------------------------
--		oro_duplication_yetis:debug("#hate_list : " .. #yetis.hate_list .. ", #players : " .. #players)

	end
	battle_listener:stop()

	oro_duplication_yetis:sleep(1)

	oro_duplication_yetis:debug("wait ai stop ...")

	while not oro_duplication_yetis[room_id].yetis.is_ai_stop do oro_duplication_yetis:sleep() end

	oro_duplication_yetis:debug("ai has stop")

	for index, wave in pairs(oro_duplication_yetis[room_id].waves) do wave:delete() end
	for index, wall in pairs(oro_duplication_yetis[room_id].walls) do wall:delete() end

	yetis:cancelBuff(502707)		-- 移除停止回血502707

	if oro_duplication_yetis[room_id].status == "success" then
		oro_duplication_yetis:debug("success")

		ScriptMessage(yetis.guid, 0, 3, "[$MUTE]".."[SC_DUPLICATION_ORO_08]", 0)

	elseif oro_duplication_yetis[room_id].status == "fail" then
		oro_duplication_yetis:debug("fail")

		ScriptMessage(yetis.guid, 0, 3, "[$MUTE]".."[SC_DUPLICATION_ORO_07]", 0)

		for buff_id, buff in pairs(yetis.buff) do buff:remove(false) end
		yetis:hide_from_room()
		yetis:position {
			x = oro_duplication_yetis.orgin_position.x,
			y = oro_duplication_yetis.orgin_position.y,
			z = oro_duplication_yetis.orgin_position.z
		}
		oro_duplication_yetis:sleep(3)
		yetis:show_to_room(room_id)
		yetis:callPlot("oro_duplication_yetis_initialize", room_id)
	end

	oro_duplication_yetis:debug("oro_duplication_yetis_main() end")
end

function oro_duplication_yetis_ai()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local yetis = oro_duplication_yetis[room_id].yetis
	local battle_listener = oro_duplication_yetis[room_id].battle_listener

	yetis.is_ai_stop = false
	yetis:property {
		fight = true,
		movable = true,
		strike_back = true,
		search_enemy = true
	}

	while oro_duplication_yetis[room_id].status == "boss" do
		if #yetis.hate_list > 0 then
			if yetis.buff[624919] and yetis.buff[624919].power >= 2 then
				yetis:useSkill("release_the_sound_of_despair")
				yetis.buff[624919]:remove()
			end
			yetis:useSkill("broke_the_sound_of_despair")
			yetis:useSkill("assault")
			yetis:useSkill("deadly_thrusting")
			yetis:useSkill("rotate_thrusting")
		end
		oro_duplication_yetis:sleep()
	end

	yetis.is_ai_stop = true
end

function oro_duplication_yetis_create_wave()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	for index = 1, 2 do
		local wave = Christine.Npc:new():create(
			oro_duplication_yetis.yetis_avatar_orgid,
			oro_duplication_yetis[room_id].yetis.x,
			oro_duplication_yetis[room_id].yetis.y,
			oro_duplication_yetis[room_id].yetis.z,
			oro_duplication_yetis[room_id].yetis.direction
		):property {
			fight = false,
			strike_back = false,
			search_enemy = false,
			hide_from_mini_map = true,
			hide_hp_mp = true,
			hide_name = true,
			show_role_head = false,
			register1 = 0	-- 是否第一次碰撞
		} :addToPartition(room_id):addBuff(624908):beginPlot("oro_duplication_yetis_waveai")
		table.insert(oro_duplication_yetis[room_id].waves, wave)
	end
end

function oro_duplication_yetis_waveai()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local wave = nil
	for index, _wave in pairs(oro_duplication_yetis[room_id].waves) do
		if _wave.GUID == OwnerID() then wave = _wave break end
	end
	if not wave then return end

	local flags = oro_duplication_yetis.collision_flags
	local collision_counter = 0

	while wave.is_legal do
		if not wave.move_target then
			if wave.last_move_target then
				local index = wave.last_move_target.index + (#flags / 2) - 25 + RandRange(1, 50)
				if index > #flags then
					index = index - #flags
				end
				wave.move_target = flags[index]
			else
				wave.move_target = flags[RandRange(1, #flags)]
			end
		else
			wave:move(
				wave.move_target.x,
				wave.move_target.y,
				wave.move_target.z
			)
			if wave:distanceTo(wave.move_target) < 35 then
				wave.last_move_target = wave.move_target
				wave.move_target = nil
				collision_counter = collision_counter + 1
				if collision_counter > 3 then
					wave:delete()
				else
					wave:addBuff(624908)
				end
				if collision_counter > 0 then
					wave.register1 = 1
				end
			end
			oro_duplication_yetis:sleep()
		end
		wave:systemCastSpell(wave, 851240)
	end
end

function GM_oro_duplication_yetis_debug()
	local me = this()
	oro_duplication_yetis:addRoomRecipient(me.room_id, me)
	oro_duplication_yetis:debug("GM_oro_duplication_yetis_debug : " .. me.guid)
end

function GM_oro_duplication_yetis_deamge()
	local me = this()
	oro_duplication_yetis[me.room_id].yetis.hp = oro_duplication_yetis[me.room_id].yetis.hp / 2
end