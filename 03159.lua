------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function gm_dungeon_196_1_2_create()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(108948, me.x, me.y, me.z)
	boss:addToPartition(me.room_id)
end

function gm_dungeon_196_1_2_killlittletree()
	local search_result = SearchRangeNPC(this().guid, 500)
	for index, guid in pairs(search_result) do
		local _orgid =  that(guid).orgid
		if _orgid == 104098 then
			DelObj(guid)
		end
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcCreate_108948()
	debugmsg(0, 0, "npcCreateEvent_108948")
	dungeonInitialize_196_1_2(this().room_id)
	Cl_Resist_HackersBossNum()
end

function npcDead_108948()
	debugmsg(0, 0, "npcDeadEvent_108948")
	if dungeon_196_1_2 and dungeon_196_1_2[this().room_id] and dungeon_196_1_2[this().room_id].status == "fight" then
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108948_04]", 0)
		dungeon_196_1_2[this().room_id].status = "success"
		local search_result = SearchRangeNPC(this().guid, 500)
		for index, guid in pairs(search_result) do
			local _orgid =  that(guid).orgid
			if _orgid == 106131 or _orgid == 104098 then
				DelObj(guid)
			end
		end
	end
	Cl_Resist_HackersBossDead()
end

function npcBeginFight_108948()
	debugmsg(0, 0, "npcBeginFightEvent_108948")
	if dungeon_196_1_2 and dungeon_196_1_2[this().room_id] and dungeon_196_1_2[this().room_id].status ~= "fight" then
		dungeonActive_196_1_2(this().room_id)
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108948_01]", 0)
	else
		debugmsg(0, 0, "!!!!!!!!!!!!!!!!!!!!!!!"..type(dungeon_196_1_2))
		debugmsg(0, 0, "!!!!!!!!!!!!!!!!!!!!!!!"..type(dungeon_196_1_2[this().room_id]))
	end
	Cl_Resist_HackersFightBegin()
end

function npcEndFight_108948()
	debugmsg(0, 0, "npcEndFightEvent_108948")
	if dungeon_196_1_2 and dungeon_196_1_2[this().room_id] and dungeon_196_1_2[this().room_id].status == "fight" then
		dungeon_196_1_2[this().room_id].status = "fail"
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function magicObject_625740()
	debugmsg(0, 0, "magicObject_625740")
	local target = that()
	target:cancelBuff(625739)
	return true
end

function magicObject_625737()
	local room_id = this().room_id
	if not dungeon_196_1_2 or not dungeon_196_1_2[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_2...")
		return false
	end

	if targetid() == dungeon_196_1_2[room_id].boss.guid then
		return true
	end
	return false
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function dungeonInitialize_196_1_2(room_id)
	debugmsg(0, 0, "dungeonInitialize_196_1_2")

	if not dungeon_196_1_2 then
		dungeonSetting_196_1_2()
	elseif  dungeon_196_1_2.alpha then
		--
		dungeonSetting_196_1_2()
	end

	dungeon_196_1_2[room_id] = {}

	dungeon_196_1_2[room_id].boss = this()
	dungeon_196_1_2[room_id].status = "ready"
	dungeon_196_1_2[room_id].skill4_trigger = false

	dungeon_196_1_2[room_id].boss:cancelBuff(625737)

	for orgid, buff in pairs(dungeon_196_1_2[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_196_1_2[room_id].boss:addSkill("skill1", dungeon_196_1_2.skill.skill1)
	dungeon_196_1_2[room_id].boss:addSkill("skill2", dungeon_196_1_2.skill.skill2)
	dungeon_196_1_2[room_id].boss:addSkill("skill4", dungeon_196_1_2.skill.skill4)
	dungeon_196_1_2[room_id].boss:addSkill("skill5", dungeon_196_1_2.skill.skill5)

	dungeon_196_1_2[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_196_1_2[room_id].battle_listener:add(dungeon_196_1_2[room_id].boss)

end

function dungeonSetting_196_1_2()
	debugmsg(0, 0, "dungeonSetting_196_1_2")

	dungeon_196_1_2 = Christine.System:new("dungeon_196_1_2")
	dungeon_196_1_2.alpha = false
	dungeon_196_1_2.beta = true
	dungeon_196_1_2.delay = 1

	dungeon_196_1_2.skill = {}

	-- ¤ìÆF­«Âñ
	dungeon_196_1_2.skill.skill1 = Christine.Skill:new()
	dungeon_196_1_2.skill.skill1.name = "skill1"
	dungeon_196_1_2.skill.skill1.cd = 7
	function dungeon_196_1_2.skill.skill1:active(caster, target)
		dungeon_196_1_2:debug("useSkill : "..self.name)
		dungeon_196_1_2:sleep(1)
		return caster:castSpell(target, 851845)
	end

	-- ¸¨¸­¬ïÅé
	dungeon_196_1_2.skill.skill2 = Christine.Skill:new()
	dungeon_196_1_2.skill.skill2.name = "skill2"
	dungeon_196_1_2.skill.skill2.cd = 11
	function dungeon_196_1_2.skill.skill2:active(caster)
		dungeon_196_1_2:debug("useSkill : "..self.name)
		dungeon_196_1_2:sleep(1)
		return caster:castSpell(caster, 851846)
	end

	-- ¾ð¤HÃg§Ù
	dungeon_196_1_2.skill.skill4 = Christine.Skill:new()
	dungeon_196_1_2.skill.skill4.name = "skill4"
	dungeon_196_1_2.skill.skill4.cd = 23
	function dungeon_196_1_2.skill.skill4:active(caster)
		dungeon_196_1_2:debug("useSkill : "..self.name)
		dungeon_196_1_2:sleep(1)
		local magic_lv = 0

		self.temp_data = {}
		local search_result = SearchRangeNPC(caster.guid, 500)
		dungeon_196_1_2:debug("#search_result = "..#search_result)
		for index, npc_guid in pairs(search_result) do
			local npc = that(npc_guid)
			if not npc.is_dead and npc.ORGID == 104098 then
				table.insert(self.temp_data, npc)
				magic_lv = magic_lv + 1
			end
		end


		return caster:castSpell(caster, 851848, magic_lv)
	end

	-- ¾ð¤H­­¬É
	dungeon_196_1_2.skill.skill5 = Christine.Skill:new()
	dungeon_196_1_2.skill.skill5.name = "skill5"
	dungeon_196_1_2.skill.skill5.cd = 60
	function dungeon_196_1_2.skill.skill5:active(caster, targets)
		dungeon_196_1_2:debug("useSkill : "..self.name)
		dungeon_196_1_2:sleep(1)
		local target = table.random(targets, 1)[1]
		return caster:castSpell(target, 851849)
	end
end

function dungeonActive_196_1_2(room_id)
	debugmsg(0, 0, "dungeonActive_196_1_2")

	dungeon_196_1_2[room_id].status = "fight"
	dungeon_196_1_2[room_id].boss:callPlot("dungeonMain_196_1_2", room_id)
	dungeon_196_1_2[room_id].boss:callPlot("npcAI_108948", room_id)
	
	return true
end

function dungeonMain_196_1_2(room_id)
	debugmsg(0, 0, "dungeonMain_196_1_2")

	local boss = dungeon_196_1_2[room_id].boss
	local battle_listener = dungeon_196_1_2[room_id].battle_listener

	local skill5_hp_pointer = 0.91
	dungeon_196_1_2[room_id].skill5_trigger = false

	local bbb = true
	local monster_trigger = false
	local skill4_start_count = false
	local skill4_count_start_time = 0
	dungeon_196_1_2[room_id].skill4_stop_count = true
	battle_listener:start()
	dungeon_196_1_2[room_id].skill4_count_stop_time = battle_listener.current_time

	while dungeon_196_1_2[room_id].status == "fight" do
		battle_listener:start()

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108948_02]", 0)
			boss:addBuff(625770)
		end

		if boss.hp < boss.max_hp * skill5_hp_pointer then
			dungeon_196_1_2[room_id].skill5_trigger = true
			skill5_hp_pointer = skill5_hp_pointer - 0.1
		end

		if battle_listener.duration_time % 13 == 12 then
			npc = Christine.Npc:new()
			npc:create(106131, boss.x, boss.y, boss.z, 0)
			npc.movable = false
			npc.search_enemy = false
			npc.strike_back = false
			npc.live_time = 13
			npc.mark = false
			npc:addBuff(625776)
			npc:addToPartition(room_id)
			for index = 1, 2 do
				distance = RandRange(65, 135)
				angle = RandRange(1, 360) / 180 * math.pi
				x = boss.x + (distance * math.cos(angle))
				z = boss.z + (distance * math.sin(angle))
				y = GetHeight(x, boss.y, z)
				npc = Christine.Npc:new()
				npc:create(106131, x, y, z, 0)
				npc.movable = false
				npc.search_enemy = false
				npc.strike_back = false
				npc.live_time = 13
				npc.mark = false
				npc:addBuff(625776)
				npc:addToPartition(room_id)
				battle_listener:add(npc)
			end
		end

		if dungeon_196_1_2[room_id].skill4_stop_count and battle_listener.current_time - dungeon_196_1_2[room_id].skill4_count_stop_time >= 13 then
			dungeon_196_1_2[room_id].skill4_stop_count = false
			monster_trigger = true
		end

		if monster_trigger and not dungeon_196_1_2[room_id].skill4_trigger then
			monster_trigger = false
			skill4_start_count = true
			skill4_count_start_time = battle_listener.current_time

			local npc, x, y, z, angle, distance
			for index = 1, 10 do
				distance = RandRange(15, 85)
				angle = RandRange(1, 180) / 180 * math.pi
				x = boss.x + (distance * math.cos(angle))
				z = boss.z + (distance * math.sin(angle))
				y = GetHeight(x, boss.y, z)
				npc = Christine.Npc:new()
				npc:create(104098, x, y, z, RandRange(1, 360))
				npc.movable = false
				npc.search_enemy = false
				npc.strike_back = false
				npc.live_time = 26
				npc:addToPartition(room_id)
			end
		end

		if skill4_start_count and battle_listener.current_time - skill4_count_start_time >= 10 then
			skill4_start_count = false
			dungeon_196_1_2[room_id].skill4_trigger = true
		end
		dungeon_196_1_2:sleep()
	end
	battle_listener:stop()

	

	local search_result = SearchRangeNPC(boss.guid, 500)
	for index, guid in pairs(search_result) do
		local _orgid =  that(guid).orgid
		if _orgid == 106131 or _orgid == 104098 then
			DelObj(guid)
		end
	end

	if dungeon_196_1_2[room_id].status == "success" then
		dungeon_196_1_2:debug("success")
	elseif dungeon_196_1_2[room_id].status == "fail" then
		dungeon_196_1_2:debug("fail")
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108948_03]", 0)
		boss:delFromPartition():sleep(3):addToPartition(room_id)
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcAI_108948(room_id)
	debugmsg(0, 0, "npcAI_108948")

	local boss = dungeon_196_1_2[room_id].boss
	local battle_listener = dungeon_196_1_2[room_id].battle_listener

	while dungeon_196_1_2[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if dungeon_196_1_2[room_id].skill4_trigger and boss:useSkill("skill4")  then
				for index, npc in ipairs(boss.skill.skill4.temp_data) do
					npc.live_time = 1
				end

				dungeon_196_1_2[room_id].skill4_stop_count = true
				dungeon_196_1_2[room_id].skill4_count_stop_time = battle_listener.current_time
				dungeon_196_1_2:sleep(2)
				dungeon_196_1_2[room_id].skill4_trigger = false
			elseif dungeon_196_1_2[room_id].skill5_trigger and boss:useSkill("skill5", battle_listener.players) then
				dungeon_196_1_2[room_id].skill5_trigger = false
			elseif boss:useSkill("skill1", that(boss.attack_target_GUID)) then
			elseif boss:useSkill("skill2") then
			end
		end
		dungeon_196_1_2:sleep()
	end
end