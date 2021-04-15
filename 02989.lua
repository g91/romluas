-----------------------------------------------------------------------
--	26 duplication - Great Shark Cellar Duplication
--	6 boss - TecolySanzoUzal
--	main process
-----------------------------------------------------------------------

-----------------------------------------------------------------------
--	create plot
-----------------------------------------------------------------------
function CreatePlot_NPC_107832()
	-----------------------------------------------------------------------
	--	Bico anti-hacker
	-----------------------------------------------------------------------
	Cl_Resist_HackersBossNum()

	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------------
	--	remove old handler
	-----------------------------------------------------------------------
	if GreatSharkCellarDuplication_TecolySanzoUzal and
	   GreatSharkCellarDuplication_TecolySanzoUzal[room_id] and
	   GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler then
		AddyGUIDMaker:new():recover(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler.GUID)
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("delete old handler")
	end

	-----------------------------------------------------------------------
	--	initialize
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal_Initialize(room_id)
end
-----------------------------------------------------------------------
--	dead plot
-----------------------------------------------------------------------
function NPC_107832_Dead()
	local room_id = this().room_id
	Cl_Resist_HackersBossDead()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].ai_trigger = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = "success"
end
function NPC_107833_Dead()
	local room_id = this().room_id
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.is_live = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:unlockhp()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi = nil
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:cancelBuff(624607)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.skill.amulet_binding:unlock()
end

-----------------------------------------------------------------------
--	begin attack
-----------------------------------------------------------------------
function NPC_107832_BeginAttack()
	-----------------------------------------------------------------------
	--	Bico anti-hacker
	-----------------------------------------------------------------------
	Cl_Resist_HackersFightBegin()

	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------------
	--	search players
	-----------------------------------------------------------------------
	local players_table = SearchRangePlayer(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.GUID, 350)
	for index = 1, #players_table do table.insert(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players, Christine.Player:new(players_table[#players_table - index])) end

	-----------------------------------------------------------------------
	--	active
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler:beginPlot("GreatSharkCellarDuplication_TecolySanzoUzal_Active")

	for index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
		if player.is_player then player:message("[GSCD_BOSS_SIX_01]") end
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:sleep(2)
	for index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
		if player.is_player then player:message("[GSCD_BOSS_SIX_02]") end
	end

	-----------------------------------------------------------------------
	--	boss setting
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.fight = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.movable = true
end
function NPC_107832_EndAttack()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.is_dead then
		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = "fail"
	end
end

-----------------------------------------------------------------------
--	setting
-----------------------------------------------------------------------
function GreatSharkCellarDuplication_TecolySanzoUzal_Setting()
	-----------------------------------------------------------------------
	--	system
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal = Christine.System:new("GreatSharkCellarDuplication TecolySanzoUzal")
	GreatSharkCellarDuplication_TecolySanzoUzal.alpha = false
	GreatSharkCellarDuplication_TecolySanzoUzal.beta = false
	GreatSharkCellarDuplication_TecolySanzoUzal.delay = 0.5
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("setting start -> function GreatSharkCellarDuplication_TecolySanzoUzal_Setting()")

	-----------------------------------------------------------------------
	--	orgid
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal.TecolySanzoUzal_orgid = 107832
	GreatSharkCellarDuplication_TecolySanzoUzal.TecolySanzoUzal_SungChiLi_orgid = 107833
	GreatSharkCellarDuplication_TecolySanzoUzal.pillar_orgid = 107868
	GreatSharkCellarDuplication_TecolySanzoUzal.black_ball_orgid = 107869
--	GreatSharkCellarDuplication_TecolySanzoUzal.pillar_shield_orgid = 107870

	-----------------------------------------------------------------------
	--	position
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal.origin_position = {x = -43.3, y = 810.3, z = 661.2, direction = 270}
	GreatSharkCellarDuplication_TecolySanzoUzal.block_door_position = {x = 377.8, y = 868.8, z = 688.9, direction = 180}

	-----------------------------------------------------------------------
	--	route flag
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal.pillar_outside_route_flag = Christine.FlagGroup:new(781328)
	GreatSharkCellarDuplication_TecolySanzoUzal.pillar_middle_route_flag = Christine.FlagGroup:new(781329)
	GreatSharkCellarDuplication_TecolySanzoUzal.pillar_inside_route_flag = Christine.FlagGroup:new(781330)

	-----------------------------------------------------------------------
	--	game process
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal.change_step_hp_rate = 0.51

	-----------------------------------------------------------------------
	--	skill
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal.skill = {}
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.sword_of_sky = Christine.Skill:new()
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.sword_of_sky.name = "sword_of_sky"
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.sword_of_sky.cd = 4
	function GreatSharkCellarDuplication_TecolySanzoUzal.skill.sword_of_sky:active(caster)
--		caster:say("SWORD OF SKY")
		for index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[caster.room_id].players) do
			if player.is_player then player:message("[GSCD_BOSS_SIX_03]") end
		end
		local target = nil
		for index, hater in pairs(caster.hate_list_duplication) do
			if not target then target = hater
			elseif caster:distanceTo(target) > caster:distanceTo(hater) then target = hater end
		end
		if not target then return false end
		local _sword = Christine.Npc:new()
		_sword:create(122749, target.x, target.y + 60, target.z)
		_sword.patrol = false
		_sword.gravity = true
		_sword.live_time = 3
		_sword.is_walk = false
		_sword.hide_name = true
		_sword.hide_hp_mp = true
		_sword.mark = false
		_sword:addToPartition(caster.room_id)
		_sword:castSpell(_sword, 851050)
		_sword:move(_sword.x, _sword.y - 60, _sword.z, false)
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(0.8)
		_sword:changePosition(_sword.x, _sword.y - 60, _sword.z)
		caster:castSpell(target, 851041)
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("skill : sword of sky done")
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(2)
		return true
	end
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.denunciation = Christine.Skill:new()
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.denunciation.name = "denunciation"
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.denunciation.cd = 7
	function  GreatSharkCellarDuplication_TecolySanzoUzal.skill.denunciation:active(caster)
--		caster:say("DENUNCIATION")
		caster:castSpell(caster, 851042)
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("skill : denunciation done")
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(2)
		return true
	end
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.back_to_the_sky = Christine.Skill:new()
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.back_to_the_sky.name = "back_to_the_sky"
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.back_to_the_sky.cd = 20
	function GreatSharkCellarDuplication_TecolySanzoUzal.skill.back_to_the_sky:active(caster)
--		caster:say("BACK TO THE SKY")
		for index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[caster.room_id].players) do
			if player.is_player then
				player:message("[GSCD_BOSS_SIX_04]")
			end
		end
		caster.movable = false
		caster:addBuff(624961)
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(1)
		caster:castSpell(851043)
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(3.5)
		caster.movable = true
		caster:cancelBuff(624961)
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("skill : back to the sky done")
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(2)
		return true
	end
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.amulet_binding = Christine.Skill:new()
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.amulet_binding.name = "amulet_binding"
	GreatSharkCellarDuplication_TecolySanzoUzal.skill.amulet_binding.cd = 13
	function GreatSharkCellarDuplication_TecolySanzoUzal.skill.amulet_binding:active(caster)
--		caster:say("AMULET BINDING")
		caster:systemCastSpell(caster, 851049)
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("skill : amulet binding done")
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(2)
		return true
	end

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("setting done")
end

-----------------------------------------------------------------------
--	initialize
-----------------------------------------------------------------------
function GreatSharkCellarDuplication_TecolySanzoUzal_Initialize(room_id)

	-----------------------------------------------------------------------
	--	setting
	-----------------------------------------------------------------------
	if not GreatSharkCellarDuplication_TecolySanzoUzal or GreatSharkCellarDuplication_TecolySanzoUzal.alpha then
		GreatSharkCellarDuplication_TecolySanzoUzal_Setting()
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("initialize start -> function GreatSharkCellarDuplication_TecolySanzoUzal_Initialize()")

	-----------------------------------------------------------------------
	--	handler
	-----------------------------------------------------------------------
	if GreatSharkCellarDuplication_TecolySanzoUzal[room_id] and
	   GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler then
		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler:delete()
	end
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id] = {}
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler = Christine.Npc:new()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler:create(107832, this().x, this().y, this().z)

	-----------------------------------------------------------------------
	--	local system data
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = "standby"
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step = 0
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].ai_trigger = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener = Christine.BattleListener:new()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.kick_out_player_delay = 0

	-----------------------------------------------------------------------
	--	initialize boss
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("initialize boss ...")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal = Christine.Npc:new(OwnerID())
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:changePosition(
		GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.x,
		GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.y,
		GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.z,
		GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.direction
	)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:addSkill("sword_of_sky", GreatSharkCellarDuplication_TecolySanzoUzal.skill.sword_of_sky)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:addSkill("denunciation", GreatSharkCellarDuplication_TecolySanzoUzal.skill.denunciation)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:addSkill("back_to_the_sky", GreatSharkCellarDuplication_TecolySanzoUzal.skill.back_to_the_sky)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:addSkill("amulet_binding", GreatSharkCellarDuplication_TecolySanzoUzal.skill.amulet_binding)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.skill.amulet_binding:lock()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.fight = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.movable = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.search_enemy = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.strike_back = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.patrol = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.is_walk = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.hp = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.max_hp
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener:add(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal)

	-----------------------------------------------------------------------
	--	local npcs data
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("initialize other data ...")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi = Christine.Npc:new()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars = {}
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls = {}
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players = {}

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("initialize done")
end

-----------------------------------------------------------------------
--	active main process
-----------------------------------------------------------------------
function GreatSharkCellarDuplication_TecolySanzoUzal_Active()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("main process start -> function GreatSharkCellarDuplication_TecolySanzoUzal_Active()")

	-----------------------------------------------------------------------
	--	create block door
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].block_door = Christine.Npc:new()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].block_door:create(105536):position {
		x = GreatSharkCellarDuplication_TecolySanzoUzal.block_door_position.x,
		y = GreatSharkCellarDuplication_TecolySanzoUzal.block_door_position.y,
		z = GreatSharkCellarDuplication_TecolySanzoUzal.block_door_position.z,
		direction = GreatSharkCellarDuplication_TecolySanzoUzal.block_door_position.direction,
	} :property {
		fight = false,
		search_enemy = false,
		strike_back = false,
		movable = false,
		mark = false,
		show_role_head = false,
		hide_hp_mp = true,
		obstruct = true
	} :addToPartition(room_id)

	-----------------------------------------------------------------------
	--	temporary variable
	-----------------------------------------------------------------------
	local TecolySanzoUzal = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal
	local battle_listener = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener
	local is_match = false
	local kick_out_list = {}

	-----------------------------------------------------------------------
	--	change to boss status & enter step 1
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = "boss"
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step = 1
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = true

	-----------------------------------------------------------------------
	--	ai
	-----------------------------------------------------------------------
	TecolySanzoUzal:beginPlot("GreatSharkCellarDuplication_TecolySanzoUzal_ai")
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("main process loop start")

	-----------------------------------------------------------------------
	--	main loop
	-----------------------------------------------------------------------
	while GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status == "boss" do

		-----------------------------------------------------------------------
		--	system
		-----------------------------------------------------------------------
		battle_listener:start()
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(1)
		for index, hater in pairs(TecolySanzoUzal.hate_list) do
			is_match = false
			for player_index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
				if hater.GUID == player.GUID then
					player.last_check_time = battle_listener.current_time
					is_match = true
					break
				end
			end
			if not is_match then
				hater.last_check_time = battle_listener.current_time
				table.insert(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players, hater)
			end
		end
		kick_out_list = {}
		for index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
			if not player.last_check_time then player.last_check_time = battle_listener.current_time
			elseif battle_listener.current_time - player.last_check_time > 4 then
				table.insert(kick_out_list, player)
			end
		end
		for kick_out_index, kick_out_player in pairs(kick_out_list) do
			for index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
				if player == kick_out_player then table.remove(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players, index) break end
			end
		end
--		GreatSharkCellarDuplication_TecolySanzoUzal:debug("duration_time : " .. battle_listener.duration_time)
--		GreatSharkCellarDuplication_TecolySanzoUzal:debug("#hate_list : " .. #TecolySanzoUzal.hate_list)
--		GreatSharkCellarDuplication_TecolySanzoUzal:debug("#players : " .. #GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players)
--		GreatSharkCellarDuplication_TecolySanzoUzal:debug("back_to_the_sky cd_counter : " .. TecolySanzoUzal.skill.back_to_the_sky.cd_counter)

		-----------------------------------------------------------------------
		--	480s turbo
		-----------------------------------------------------------------------
		if not TecolySanzoUzal.buff[624632] and battle_listener.duration_time >= 480 then
			TecolySanzoUzal:addBuff(624632)
		end

		-----------------------------------------------------------------------
		--	change step
		-----------------------------------------------------------------------
		if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 1 and
		   TecolySanzoUzal.hp <= TecolySanzoUzal.max_hp * GreatSharkCellarDuplication_TecolySanzoUzal.change_step_hp_rate then
			GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step = 2
		end

		if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger then
			GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = false
			if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 1 then
				GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler:beginPlot("GreatSharkCellarDuplication_TecolySanzoUzal_Step1")
			end
			if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 2 then
				GreatSharkCellarDuplication_TecolySanzoUzal[room_id].handler:beginPlot("GreatSharkCellarDuplication_TecolySanzoUzal_Step2")
			end
		end

		-----------------------------------------------------------------------
		--	check players
		-----------------------------------------------------------------------
		if battle_listener.duration_time >= 4 and #GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players <= 0 then
			GreatSharkCellarDuplication_TecolySanzoUzal:debug("not found players")
			GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = "fail"
		end

		-----------------------------------------------------------------------
		--	pillar add speed per 2 seconds
		-----------------------------------------------------------------------
--		GreatSharkCellarDuplication_TecolySanzoUzal:debug("battle_listener.current_time : " .. battle_listener.current_time)
		if battle_listener.current_time % 2 == 0 then
			for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do
				if not pillar.buff[624618] then
					if not pillar.buff[624614] and not pillar.wait_counter then
						pillar.wait_counter = 5
					elseif not pillar.buff[624614] and pillar.wait_counter > 0 then
						pillar.wait_counter = pillar.wait_counter - 1
					else
						pillar.wait_counter = nil
						pillar:addBuff(624614)
					end
				end
			end
		end
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("main process loop stop")

	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener:stop()

	-----------------------------------------------------------------------
	--	wait combat process & ai stop
	-----------------------------------------------------------------------
	while not GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger or
	           not GreatSharkCellarDuplication_TecolySanzoUzal[room_id].ai_trigger do
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep()
	end

	-----------------------------------------------------------------------
	--	clear objects
	-----------------------------------------------------------------------
	for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do pillar:delete() end
	for index, black_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do black_ball:delete() end
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].block_door:delete()

	-----------------------------------------------------------------------
	--	result
	-----------------------------------------------------------------------
	if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status == "success" then
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("success")
		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:unlockhp()
		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:kill(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal)
		sasa_ZoneDungeon_title_01(530972)

		local players = battle_listener.players

		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(3)
		for index, player in pairs(players) do
			if player.is_player then player:message("[GSCD_BOSS_SIX_05]") end
		end

		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(7)
		for index, player in pairs(players) do
			if player.is_player then player:message("[GSCD_BOSS_SIX_06]") end
		end

		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(12)
		for index, player in pairs(players) do
			if player.is_player then player:message("[GSCD_BOSS_SIX_07]") end
		end

		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(2)

		local seventh_boss = Christine.Npc:new()
		seventh_boss:create(107871, GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.x, GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.y, GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.z, GreatSharkCellarDuplication_TecolySanzoUzal.origin_position.direction)
		seventh_boss:addToPartition(room_id)
	elseif GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status == "fail" then
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("fail")
		for buff_id, buff in pairs(TecolySanzoUzal.buff) do TecolySanzoUzal:cancelBuff(buff_id) end
		TecolySanzoUzal:stopAttack()
		TecolySanzoUzal:stopMove()
		TecolySanzoUzal:delFromPartition()
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep(1)
		TecolySanzoUzal:addToPartition(room_id)
	end

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("main process stop")
end