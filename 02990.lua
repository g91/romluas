-----------------------------------------------------------------------
--	26 duplication - Great Shark Cellar Duplication
--	6 boss - TecolySanzoUzal
--	combat process
-----------------------------------------------------------------------

-----------------------------------------------------------------------
--	step 1
-----------------------------------------------------------------------
function GreatSharkCellarDuplication_TecolySanzoUzal_Step1()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 1 start -> function GreatSharkCellarDuplication_TecolySanzoUzal_Step1()")

	-----------------------------------------------------------------------
	--	intialize pillar
	-----------------------------------------------------------------------
	for index = 1, 3 do
		local _pillar = Christine.Npc:new()
		_pillar.route_flag = GreatSharkCellarDuplication_TecolySanzoUzal.pillar_outside_route_flag
		if index % 3 == 2 then _pillar.route_flag = GreatSharkCellarDuplication_TecolySanzoUzal.pillar_middle_route_flag
		elseif index % 3 == 1 then _pillar.route_flag = GreatSharkCellarDuplication_TecolySanzoUzal.pillar_inside_route_flag end
		local random_index = RandRange(1, #_pillar.route_flag)
		_pillar:create(GreatSharkCellarDuplication_TecolySanzoUzal.pillar_orgid,
			_pillar.route_flag[random_index].x,
			_pillar.route_flag[random_index].y,
			_pillar.route_flag[random_index].z)
		_pillar.search_enemy = false
		_pillar.strike_back = false
		_pillar.patrol = false
		_pillar.mark = true
		_pillar.fight = true
		_pillar.is_walk = false
		_pillar:addToPartition(room_id)
		_pillar:addBuff(624614, 19)
		_pillar:lockhp(_pillar.max_hp, "GreatSharkCellarDuplicationDead")
		table.insert(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars, _pillar)
	end

	-----------------------------------------------------------------------
	--	temporary variable
	-----------------------------------------------------------------------
	local is_black_balls_explode = false
	local last_time_produce_black_balls = 0
	local TecolySanzoUzal = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 1 loop start")
	while GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status == "boss" and GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 1 do

		-----------------------------------------------------------------------
		--	pillars ai
		-----------------------------------------------------------------------
		for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do
			if not pillar.move_target then
				pillar.move_target = 1
		--		recursion every pillar's route_flag element and set the closet flag index for pillar's move_target.
				for flag_index, flag in ipairs(pillar.route_flag) do
					if flag:distanceTo(pillar) < pillar.route_flag[pillar.move_target]:distanceTo(pillar)then pillar.move_target = flag_index end
				end
			end
		--	if pillar is close to position of flag then go to next flag.
			if pillar.route_flag[pillar.move_target]:distanceTo(pillar) < 28 then pillar.move_target = pillar.move_target + 1 end
		--	if number of pillar's move_target bigger then amount of pillar's route_flag then set pillar's move_target for 1
			if pillar.move_target > #pillar.route_flag then pillar.move_target = 1 end
		--	pillar moves
			if pillar.buff[624614] and pillar.move_target then pillar:move(pillar.route_flag[pillar.move_target].x, pillar.route_flag[pillar.move_target].y, pillar.route_flag[pillar.move_target].z, false) end
		end

		-----------------------------------------------------------------------
		--	black balls ai
		-----------------------------------------------------------------------
		for index, black_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do
			if not black_ball.is_live then
				table.remove(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls, index)
			else
		--		refresh black ball's move_target per 3 seconds
				if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.duration_time % 3 == 0 then black_ball.move_target = nil end
		--		set black_ball's move_target for somewhere from position of boss
				if not black_ball.move_target then
					black_ball.move_target = {}
					black_ball.move_target.x = TecolySanzoUzal.x - 300 + RandRange(1, 600)
					black_ball.move_target.y = TecolySanzoUzal.y
					black_ball.move_target.z = TecolySanzoUzal.z - 300 + RandRange(1, 600)
					black_ball.move_target.y = GetHeight(black_ball.move_target.x, black_ball.move_target.y, black_ball.move_target.z)
				end
		--		black ball moves
				black_ball:move(black_ball.move_target.x, black_ball.move_target.y, black_ball.move_target.z, false)
		--		recursion every object and black balls and check all distance between each others
				if not is_black_balls_explode then
					for another_index, another_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do
		--				if the distance between any 2 black balls smaller then 16 than all of black balls explode
						if another_ball ~= black_ball and another_ball:distanceTo(black_ball) < 16 then is_black_balls_explode = true break end
					end
				end
				if not is_black_balls_explode then
					for pillar_index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do
						if pillar:distanceTo(black_ball) < 16 then is_black_balls_explode = true break end
					end
				end
				if not is_black_balls_explode then
					for player_index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
						if player:distanceTo(black_ball) < 16 then is_black_balls_explode = true break end
					end
				end
				if not is_black_balls_explode and TecolySanzoUzal:distanceTo(black_ball) < 16 then is_black_balls_explode = true end
				if is_black_balls_explode then break end
			end
		end
		if is_black_balls_explode then
			GreatSharkCellarDuplication_TecolySanzoUzal:debug("black balls explode")
			is_black_balls_explode = false
			for index, black_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do
				black_ball.movable = false
				black_ball:stopMove()
				black_ball:systemCastSpell(TecolySanzoUzal, 851047)
				black_ball:castSpell(black_ball, 851048)
				black_ball:idleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				black_ball.live_time = 2
			end
			GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls = {}
		end

		-----------------------------------------------------------------------
		--	prduce black balls
		-----------------------------------------------------------------------
		if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.duration_time % 20 == 0 and
		   GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.current_time ~= last_time_produce_black_balls then
			for index, black_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do black_ball:delete() end
			GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls = {}
			GreatSharkCellarDuplication_TecolySanzoUzal:debug("produce black balls")
			last_time_produce_black_balls = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.current_time
			for index = 1, 2 do
				local _black_ball = Christine.Npc:new()
				local _birth_position = {}
				local random_index = RandRange(1, 4)
				if index > 1 then
					if random_index == 1 then
						_birth_position.x = TecolySanzoUzal.x + 200 + RandRange(1, 100)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z + 200 + RandRange(1, 100)
					elseif random_index == 2 then
						_birth_position.x = TecolySanzoUzal.x - 200 - RandRange(1, 100)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z + 200 + RandRange(1, 100)
					elseif random_index == 3 then
						_birth_position.x = TecolySanzoUzal.x + 200 + RandRange(1, 100)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z - 200 - RandRange(1, 100)
					elseif random_index == 4 then
						_birth_position.x = TecolySanzoUzal.x - 200 - RandRange(1, 100)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z - 200 - RandRange(1, 100)
					end
				else
					if random_index == 1 then
						_birth_position.x = TecolySanzoUzal.x + 80 + RandRange(1, 80)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z + 80 + RandRange(1, 80)
					elseif random_index == 2 then
						_birth_position.x = TecolySanzoUzal.x - 80 - RandRange(1, 80)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z + 80 + RandRange(1, 80)
					elseif random_index == 3 then
						_birth_position.x = TecolySanzoUzal.x + 80 + RandRange(1, 80)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z - 80 - RandRange(1, 80)
					elseif random_index == 4 then
						_birth_position.x = TecolySanzoUzal.x - 80 - RandRange(1, 80)
						_birth_position.y = TecolySanzoUzal.y
						_birth_position.z = TecolySanzoUzal.z - 80 - RandRange(1, 80)
					end
				end
				_birth_position.y = GetHeight(_birth_position.x, _birth_position.y, _birth_position.z)
				_black_ball:create(GreatSharkCellarDuplication_TecolySanzoUzal.black_ball_orgid, _birth_position.x, _birth_position.y, _birth_position.z)
				_black_ball.search_enemy = false
				_black_ball.strike_back = false
				_black_ball.patrol = false
				_black_ball.hide_hp_mp = true
				_black_ball.is_walk = false
				_black_ball.obstruct = true
				_black_ball.is_live = true
				_black_ball:addToPartition(room_id)
				table.insert(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls, _black_ball)
				GreatSharkCellarDuplication_TecolySanzoUzal:debug("#GreatSharkCellarDuplication_TecolySanzoUzal[" .. room_id .. "].black_balls, _black_ball" .. #GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls, _black_ball)
			end
			GreatSharkCellarDuplication_TecolySanzoUzal:debug("produce black balls done")
		end

		-----------------------------------------------------------------------
		--	system delay
		-----------------------------------------------------------------------
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep()
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 1 loop stop")

	for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do pillar:delete() end
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars = {}
	for index, black_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do black_ball:delete() end
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls = {}

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 1 stop")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = true
end

-----------------------------------------------------------------------
--	step 2
-----------------------------------------------------------------------
function GreatSharkCellarDuplication_TecolySanzoUzal_Step2()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 2 start -> function GreatSharkCellarDuplication_TecolySanzoUzal_Step2()")

	-----------------------------------------------------------------------
	--	temporary variable
	-----------------------------------------------------------------------
	local TecolySanzoUzal = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal
	local is_pillars_explode = false

	-----------------------------------------------------------------------
	--	intialize TecolySanzoUzal_SungChiLi
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi = Christine.Npc:new()
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:create(GreatSharkCellarDuplication_TecolySanzoUzal.TecolySanzoUzal_SungChiLi_orgid, TecolySanzoUzal.x, TecolySanzoUzal.y, TecolySanzoUzal.z, TecolySanzoUzal.direction)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.fight = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.strike_back = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.search_enemy = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.is_walk = 0
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.patrol = false
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.is_live = true
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:addToPartition(room_id)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:addSkill("sword_of_sky", GreatSharkCellarDuplication_TecolySanzoUzal.skill.sword_of_sky)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:addSkill("denunciation", GreatSharkCellarDuplication_TecolySanzoUzal.skill.denunciation)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:addSkill("back_to_the_sky", GreatSharkCellarDuplication_TecolySanzoUzal.skill.back_to_the_sky)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:addSkill("amulet_binding", GreatSharkCellarDuplication_TecolySanzoUzal.skill.amulet_binding)
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.skill.amulet_binding:lock()
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("intialize TecolySanzoUzal_SungChiLi done")
	local TecolySanzoUzal_SungChiLi = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi

	-----------------------------------------------------------------------
	--	intialize TecolySanzoUzal
	-----------------------------------------------------------------------
	--	if TecolySanzoUzal_SungChiLi is alive then TecolySanzoUzal + 1% dmg per 3 seconds
	TecolySanzoUzal:addBuff(624607)

	-----------------------------------------------------------------------
	--	intialize pillars
	-----------------------------------------------------------------------
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("intialize pillars ...")
	for index = 1, 6 do
		local _pillar = Christine.Npc:new()
	--	pillar's route flag group
		_pillar.route_flag = GreatSharkCellarDuplication_TecolySanzoUzal.pillar_outside_route_flag
		if index % 3 == 2 then _pillar.route_flag = GreatSharkCellarDuplication_TecolySanzoUzal.pillar_middle_route_flag
		elseif index % 3 == 1 then _pillar.route_flag = GreatSharkCellarDuplication_TecolySanzoUzal.pillar_inside_route_flag end
	--	get a random flag index
		local random_index = RandRange(1, #_pillar.route_flag)
		if index > 3 then random_index = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars[index - 3].move_target + 2 end
		if random_index > 4 then random_index = random_index - 4 end
		_pillar:create(GreatSharkCellarDuplication_TecolySanzoUzal.pillar_orgid, _pillar.route_flag[random_index].x, _pillar.route_flag[random_index].y, _pillar.route_flag[random_index].z)
		_pillar.move_target = random_index
		_pillar.last_explode_time = 0
		_pillar.search_enemy = false
		_pillar.strike_back = false
		_pillar.patrol = false
		_pillar.is_walk = false
		_pillar:addToPartition(room_id)
		if index > 3 then _pillar:addBuff(624614, 19)
		else _pillar:addBuff(624618) end
		_pillar:addBuff(502707)
		_pillar:lockhp(_pillar.max_hp, "GreatSharkCellarDuplicationDead")
		table.insert(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars, _pillar)
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("intialize pillars done")

	-----------------------------------------------------------------------
	--	boss setting & ai
	-----------------------------------------------------------------------
	TecolySanzoUzal_SungChiLi:beginPlot("GreatSharkCellarDuplication_TecolySanzoUzal_ai")

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 2 loop start")
	while GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status == "boss" and GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 2 do

		-----------------------------------------------------------------------
		--	pillars ai
		-----------------------------------------------------------------------
		for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do

			if not pillar.move_target then
				pillar.move_target = 1
		--		recursion every pillar's route_flag element and set the closet flag index for pillar's move_target.
				for flag_index, flag in ipairs(pillar.route_flag) do
					if flag:distanceTo(pillar) < pillar.route_flag[pillar.move_target]:distanceTo(pillar)then pillar.move_target = flag_index end
				end
			end
		--	if pillar is close to position of flag then go to next flag.
			if pillar.route_flag[pillar.move_target]:distanceTo(pillar) < 28 then pillar.move_target = pillar.move_target + 1 end
		--	if number of pillar's move_target bigger then amount of pillar's route_flag then set pillar's move_target for 1
			if pillar.move_target > #pillar.route_flag then pillar.move_target = 1 end
		--	pillar moves
			if ( pillar.buff[624614] or pillar.buff[624618] ) and pillar.move_target then pillar:move(pillar.route_flag[pillar.move_target].x, pillar.route_flag[pillar.move_target].y, pillar.route_flag[pillar.move_target].z, false) end
		--	check distance between this pillar and another pillar
			for another_index, another_pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do
				if another_pillar.GUID ~= pillar.GUID and another_pillar:distanceTo(pillar) < 12 then pillar.explode = true break end
			end
		--	check distance between this pillar and players
			for player_index, player in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].players) do
				if player:distanceTo(pillar) < 12 then pillar.explode = true break end
			end
		--	check distance between this pillar and boss
			if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:distanceTo(pillar) < 12 then pillar.explode = true end

			if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.current_time - pillar.last_explode_time > 4 and pillar.explode then
				if not pillar.buff[624618] then
					pillar:castSpell(pillar, 851046)
				end
				pillar.explode = false
				pillar.last_explode_time = GreatSharkCellarDuplication_TecolySanzoUzal[room_id].battle_listener.current_time
			end
		end

		-----------------------------------------------------------------------
		--	system delay
		-----------------------------------------------------------------------
		GreatSharkCellarDuplication_TecolySanzoUzal:sleep()
	end
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 2 loop stop")

	if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi then
		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:delete()
		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi = nil
	end

	GreatSharkCellarDuplication_TecolySanzoUzal:debug("combat process step 2 stop")
	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step_trigger = true
end

-----------------------------------------------------------------------
--	lock hp handler
-----------------------------------------------------------------------
function GreatSharkCellarDuplicationDead()
	local orgid = this().ORGID
	GreatSharkCellarDuplication_TecolySanzoUzal:debug("npc dead plot : " .. orgid)
	if orgid == GreatSharkCellarDuplication_TecolySanzoUzal.pillar_orgid then GreatSharkCellarDuplication_LockHP_pillar()
--	elseif orgid == GreatSharkCellarDuplication_TecolySanzoUzal.pillar_shield_orgid then GreatSharkCellarDuplication_LockHP_pillar_shield()
--	elseif orgid == GreatSharkCellarDuplication_TecolySanzoUzal.TecolySanzoUzal_orgid then GreatSharkCellarDuplication_LockHP_TecolySanzoUzal()
--	elseif orgid == GreatSharkCellarDuplication_TecolySanzoUzal.TecolySanzoUzal_SungChiLi_orgid then GreatSharkCellarDuplication_LockHP_SungChiLi()
	elseif orgid == GreatSharkCellarDuplication_TecolySanzoUzal.black_ball_orgid then GreatSharkCellarDuplication_LockHP_BlackBall() end
end

--function GreatSharkCellarDuplication_LockHP_TecolySanzoUzal()
--	local room_id = this().room_id
--	if GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 1 then
--		LockHP(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.GUID, 1, "GreatSharkCellarDuplicationDead")
--		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step = 2
--		GreatSharkCellarDuplication_TecolySanzoUzal:debug("change step to 2")
--	elseif GreatSharkCellarDuplication_TecolySanzoUzal[room_id].step == 2 then
--		GreatSharkCellarDuplication_TecolySanzoUzal[room_id].status = "success"
--	end
--end

--function GreatSharkCellarDuplication_LockHP_SungChiLi()
--	local room_id = this().room_id
--	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi.is_live = false
--	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi:unlockhp()
--	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal_SungChiLi = nil
--	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal:cancelBuff(624607)
--	GreatSharkCellarDuplication_TecolySanzoUzal[room_id].TecolySanzoUzal.skill.amulet_binding:unlock()
--end

function GreatSharkCellarDuplication_LockHP_pillar()
--	local room_id = this().room_id
	local this_pillar = this()
--	for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do
--		if pillar.GUID == this().GUID then this_pillar = pillar break end
--	end
--	if not this_pillar then return false end
	if this_pillar.buff[624614] and this_pillar.buff[624614].power > 0 then
		local buff_lv = this_pillar.buff[624614].power
		this_pillar:cancelBuff(624614)
		this_pillar:addBuff(624614, buff_lv - 1)
		GreatSharkCellarDuplication_TecolySanzoUzal:debug("hit pillar, " .. this_pillar.buff[624614].power)
	else this_pillar:cancelBuff(624614) end
end

--function GreatSharkCellarDuplication_LockHP_pillar_shield()
--	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
--	local this_pillar = nil
--	for index, pillar in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].pillars) do
--		if pillar.GUID == OwnerID() then this_pillar = pillar break end
--	end
--	if not this_pillar then return false end
--	if this_pillar.is_reverse then
--		this_pillar.is_reverse = false
--		this_pillar:say("Hello!! POKI!!")
--	else
--		this_pillar.is_reverse = true
--		this_pillar:say("Hello!! POKI!!")
--	end
--	this_pillar.hp = this_pillar.max_hp
--end

function GreatSharkCellarDuplication_LockHP_BlackBall()
	local room_id = this().room_id
	local this_black_ball = nil
	for index, black_ball in pairs(GreatSharkCellarDuplication_TecolySanzoUzal[room_id].black_balls) do
		if black_ball.GUID == this().GUID then this_black_ball = black_ball break end
	end
	if not this_black_ball then return false end
	this_black_ball.is_live = false
	this_black_ball:unlockhp()
	this_black_ball:kill(this_black_ball)
end