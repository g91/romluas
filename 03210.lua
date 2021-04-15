function gmDungeon1993_create()
	local me = this()
	local boss = Christine.Npc:new():create(108991, me.x, me.y, me.z, 0):addToPartition(0)
end

function gmDungeon1993_hphp()
	local room_id = this().room_id
	dungeon_199_3[room_id].boss.hp = dungeon_199_3[room_id].boss.hp - dungeon_199_3[room_id].boss.hp * 0.051
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108991()
	local room_id = this().room_id
	dungeonInitialize_199_3(room_id)
	Cl_Resist_HackersBossNum()
end
function npcDead_108991()
	local room_id = this().room_id
	if not dungeon_199_3 or not dungeon_199_3[room_id] then
		debugmsg(0, 0, "not found dungeon_199_3")
		return false
	end
	if dungeon_199_3[room_id].status == "fight" then
		ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108991_04]", 0)
		dungeon_199_3[room_id].status = "success"

		for index, rune in ipairs(dungeon_199_3[room_id].runes) do
			rune:delete()
		end

		for count = 1, SetSearchAllPlayer(room_id) do
			that(GetSearchResult()):cancelBuff(626247)
		end

		Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108991()
	local room_id = this().room_id
	if not dungeon_199_3 or not dungeon_199_3[room_id] then
		debugmsg(0, 0, "not found dungeon_199_3")
		return false
	end
	if dungeon_199_3[room_id].keep_fight then
		return false
	end
	for count = 1, SetSearchAllPlayer(room_id) do
		ScriptMessage(OwnerID(), GetSearchResult(), 3, "[$MUTE]".."[SC_108991_01]", 0)
	end
	if dungeon_199_3[room_id].status == "ready" then
		dungeonActive_199_3(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108991()
	local room_id = this().room_id
	if not dungeon_199_3 or not dungeon_199_3[room_id] then
		debugmsg(0, 0, "not found dungeon_199_3")
		return false
	end
	if dungeon_199_3[room_id].keep_fight then
		return false
	end
	if dungeon_199_3[room_id].status == "fight" then
		ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108991_03]", 0)
		dungeon_199_3[room_id].status = "fail"
		dungeon_199_3[room_id].boss.search_enemy = false
		dungeon_199_3[room_id].boss.strike_back = false
		dungeon_199_3[room_id].boss.fight = false

		for index, rune in ipairs(dungeon_199_3[room_id].runes) do
			rune:delete()
		end

		for count = 1, SetSearchAllPlayer(room_id) do
			that(GetSearchResult()):cancelBuff(626247)
		end
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function magicObject_626237()
	local room_id = this().room_id
	if not dungeon_199_3 or not dungeon_199_3[room_id] then
		debugmsg(0, 0, "not found dungeon_199_3")
		return false
	end
	local boss = dungeon_199_3[room_id].boss
	boss.skill.skill1:unlock()
	boss.skill.skill2:lock()
	boss.skill.skill3:lock()
end
function magicObject_626238()
	local room_id = this().room_id
	if not dungeon_199_3 or not dungeon_199_3[room_id] then
		debugmsg(0, 0, "not found dungeon_199_3")
		return false
	end
	local boss = dungeon_199_3[room_id].boss
	boss.skill.skill1:lock()
	boss.skill.skill2:unlock()
	boss.skill.skill3:lock()
end
function magicObject_626239()
	local room_id = this().room_id
	if not dungeon_199_3 or not dungeon_199_3[room_id] then
		debugmsg(0, 0, "not found dungeon_199_3")
		return false
	end
	local boss = dungeon_199_3[room_id].boss
	boss.skill.skill1:lock()
	boss.skill.skill2:lock()
	boss.skill.skill3:unlock()
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_199_3()
	debugmsg(0, 0, "dungeonSetting_199_3")
	dungeon_199_3 = Christine.System:new("dungeon_199_3")
	dungeon_199_3.alpha = false
	dungeon_199_3.beta = false
	dungeon_199_3.delay = 1

	dungeon_199_3.flags = Christine.FlagGroup:new(781441)

	local position_fix_reference = this()
	dungeon_199_3.position_fixed = {
		x = 1241,
		y = -190,
		z = -4192,
		direction = 323
	}

	dungeon_199_3.skill = {}

--	¾Ô§q
	dungeon_199_3.skill.skill1 = Christine.Skill:new()
	dungeon_199_3.skill.skill1.name = "skill1"
	dungeon_199_3.skill.skill1.cd = 7
	function dungeon_199_3.skill.skill1:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852255)
	end

--	ÆZ¤O²rÀ»
	dungeon_199_3.skill.skill2 = Christine.Skill:new()
	dungeon_199_3.skill.skill2.name = "skill2"
	dungeon_199_3.skill.skill2.cd = 7
	function dungeon_199_3.skill.skill2:active(caster, target)
		--caster:say(self.name)
		return caster:castSpell(target, 852256)
	end

--	¨³±¶½Ä¼²
	dungeon_199_3.skill.skill3 = Christine.Skill:new()
	dungeon_199_3.skill.skill3.name = "skill3"
	dungeon_199_3.skill.skill3.cd = 7
	function dungeon_199_3.skill.skill3:active(caster, targets)
		--caster:say(self.name)
		local target = table.random(targets, 1)[1]
		return  caster:castSpell(target, 852257)
	end

--	·À»î¤§«ã
	dungeon_199_3.skill.skill4 = Christine.Skill:new()
	dungeon_199_3.skill.skill4.name = "skill4"
	dungeon_199_3.skill.skill4.cd = 7
	function dungeon_199_3.skill.skill4:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852259)
	end

--	´ý¨P¤Ï¾½
	dungeon_199_3.skill.skill5 = Christine.Skill:new()
	dungeon_199_3.skill.skill5.name = "skill5"
	dungeon_199_3.skill.skill5.cd = 13
	function dungeon_199_3.skill.skill5:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852260)
	end

--	Àe°©½ÄÀ»
	dungeon_199_3.skill.skill6 = Christine.Skill:new()
	dungeon_199_3.skill.skill6.name = "skill6"
	dungeon_199_3.skill.skill6.cd = 19
	function dungeon_199_3.skill.skill6:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852261)
	end
end

function dungeonInitialize_199_3(room_id)
	debugmsg(0, 0, "dungeonInitialize_199_3")

	if not dungeon_199_3 then
		dungeonSetting_199_3()
	end
	if dungeon_199_3.alpha then
		dungeonSetting_199_3()
	end

	dungeon_199_3[room_id] = {}
	dungeon_199_3[room_id].boss = this()
	dungeon_199_3[room_id].boss.hp = dungeon_199_3[room_id].boss.max_hp
	dungeon_199_3[room_id].boss.search_enemy = true
	dungeon_199_3[room_id].boss.strike_back = true
	dungeon_199_3[room_id].boss.fight = true
	dungeon_199_3[room_id].boss.movable = true
	dungeon_199_3[room_id].boss.patrol = true

	for orgid, buff in pairs(dungeon_199_3[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_199_3[room_id].boss:addSkill("skill1", dungeon_199_3.skill.skill1):lock()
	dungeon_199_3[room_id].boss:addSkill("skill2", dungeon_199_3.skill.skill2):lock()
	dungeon_199_3[room_id].boss:addSkill("skill3", dungeon_199_3.skill.skill3):lock()
	dungeon_199_3[room_id].boss:addSkill("skill4", dungeon_199_3.skill.skill4)
	dungeon_199_3[room_id].boss:addSkill("skill5", dungeon_199_3.skill.skill5)
	--dungeon_199_3[room_id].boss:addSkill("skill6", dungeon_199_3.skill.skill6):lock()

	dungeon_199_3[room_id].runes = {}
	local boss = this()
	local rune_position = {
		{1241+90, -190, -4192},
		{1241, -190, -4192+90},
		{1241-90, -190, -4192}
	}

	for i = 1, 3 do
		local rune = Christine.Npc:new()
		rune:create(109228 + i, rune_position[i][1], rune_position[i][2], rune_position[i][3])
		rune:addToPartition(room_id)
		rune.fight = false
		rune.strike_back = false
		rune.search_enemy = false
		rune.buff_id = 626236 + i
		table.insert(dungeon_199_3[room_id].runes, rune)
	end

	dungeon_199_3[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_199_3[room_id].battle_listener:add(dungeon_199_3[room_id].boss)

	dungeon_199_3[room_id].status = "ready"
	dungeon_199_3[room_id].keep_fight = false
	dungeon_199_3[room_id].check_hp_offset = dungeon_199_3[room_id].boss.max_hp * 0.05
	dungeon_199_3[room_id].check_hp_gap = dungeon_199_3[room_id].boss.max_hp - dungeon_199_3[room_id].check_hp_offset
	
	dungeon_199_3[room_id].boss:beginPlot("dungeonFixPosition_199_3", 2)
end

function dungeonFixPosition_199_3()
	local room_id = this().room_id
	if dungeon_199_3.position_fixed then
		dungeon_199_3[room_id].boss:changePosition(
			1241,
			-190,
			-4192,
			323)
--		dungeon_199_3[room_id].boss:changePosition(
--			dungeon_199_3.position_fixed.x,
--			dungeon_199_3.position_fixed.y,
--			dungeon_199_3.position_fixed.z,
--			dungeon_199_3.position_fixed.direction)
--		DebugMsg(0,0,"X="..dungeon_199_3.position_fixed.x)
--		DebugMsg(0,0,"Y="..dungeon_199_3.position_fixed.y)
--		DebugMsg(0,0,"Z="..dungeon_199_3.position_fixed.z)
--		DebugMsg(0,0,"D="..dungeon_199_3.position_fixed.direction)
		dungeon_199_3:debug("fix position")
	end
end

function dungeonActive_199_3(room_id)
	debugmsg(0, 0, "dungeonActive_199_3")

	dungeon_199_3[room_id].status = "fight"
	dungeon_199_3[room_id].boss:callPlot("dungeonMain_199_3", room_id)
	dungeon_199_3[room_id].boss:callPlot("npcAI_108991", room_id)
	--dungeon_199_3[room_id].boss:callPlot("dungeon_199_3_getbuff", room_id)
	dungeon_199_3[room_id].boss:addBuff(502707)
end

function dungeon_199_3_getbuff(room_id)
	debugmsg(0, 0, "dungeon_199_3_getbuff")
	dungeon_199_3[room_id].battle_listener.kick_out_player_delay = 90
	dungeon_199_3[room_id].keep_fight = true
	local boss = dungeon_199_3[room_id].boss
	boss.search_enemy = false
	boss.strike_back = false
	boss.fight = false
	boss.patrol = false
	boss:stopAttack()
	local target_rune = table.random(dungeon_199_3[room_id].runes, 1)[1]
	while dungeon_199_3[room_id].status == "fight" do
		if boss:distanceTo(target_rune) > 20 then
			boss:move(target_rune.x, target_rune.y, target_rune.z)
		else
			break
		end
		dungeon_199_3:sleep(1)
	end
	--boss.skill.skill1:lock()
	--boss.skill.skill2:lock()
	--boss.skill.skill3:lock()
	boss:addBuff(target_rune.buff_id)
	if target_rune.buff_id == 626237 then
		boss.skill.skill1:unlock()
	elseif target_rune.buff_id == 626238 then
		boss.skill.skill2:unlock()
	elseif target_rune.buff_id == 626239 then
		boss.skill.skill3:unlock()
	end
	boss.search_enemy = true
	boss.strike_back = true
	boss.fight = true
	boss.patrol = true
	if #dungeon_199_3[room_id].battle_listener.players > 0 then
		boss:attack(table.random(dungeon_199_3[room_id].battle_listener.players, 1)[1])
	else
		for i = 1, SetSearchAllPlayer(room_id) do
			local player_guid = GetSearchResult()
			boss:attack(that(player_guid))
		end
	end
	dungeon_199_3[room_id].keep_fight = false
	dungeon_199_3[room_id].battle_listener.kick_out_player_delay = 0
end

function dungeonMain_199_3(room_id)
	debugmsg(0, 0, "dungeonMain_199_3")

	local boss = dungeon_199_3[room_id].boss
	local battle_listener = dungeon_199_3[room_id].battle_listener
	local bbb = true

	local phase_check = true
	local phase6_check = false
	local phase_hp_gap = boss.max_hp * 0.4

	while dungeon_199_3[room_id].status == "fight" do
		battle_listener:start()
		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108991_02]", 0)
			boss:addBuff(626207)
		end

		if phase_check and boss.hp <= phase_hp_gap then
			phase_check = false
			boss.skill.skill5:lock()
			--boss.skill.skill6:unlock()
			phase6_check = true
		end

		if phase6_check and battle_listener.duration_time % 19 == 0 then
			boss:systemCastSpell(boss, 852261)
		end

		if boss.hp < dungeon_199_3[room_id].check_hp_gap then
			boss:cancelBuff(626237)
			boss:cancelBuff(626238)
			boss:cancelBuff(626239)
			boss.skill.skill1:lock()
			boss.skill.skill2:lock()
			boss.skill.skill3:lock()
			dungeon_199_3[room_id].check_hp_gap = dungeon_199_3[room_id].check_hp_gap - dungeon_199_3[room_id].check_hp_offset
		end

		if dungeon_199_3[room_id].keep_fight then
			if #battle_listener.players <= 0 then
				dungeon_199_3[room_id].status = "fail"
			end
		end

		if battle_listener.duration_time % 17 == 0 then
			dungeon_199_3_getbuff(room_id)
		end

		dungeon_199_3:sleep()
	end

	dungeon_199_3[room_id].boss:cancelBuff(502707)
	dungeon_199_3[room_id].boss:cancelBuff(626237)
	dungeon_199_3[room_id].boss:cancelBuff(626238)
	dungeon_199_3[room_id].boss:cancelBuff(626239)

	battle_listener:stop()

	if dungeon_199_3[room_id].status == "success" then
		dungeon_199_3:debug("success")
	elseif dungeon_199_3[room_id].status == "fail" then
		dungeon_199_3:debug("fail")
		dungeonInitialize_199_3(room_id)
		boss:hide_from_room():sleep(4)
		boss:show_to_room(room_id)
--		dungeonInitialize_199_3(room_id)
	end
end

function npcAI_108991(room_id)
	debugmsg(0, 0, "npcAI_108991")

	local boss = dungeon_199_3[room_id].boss
	local battle_listener = dungeon_199_3[room_id].battle_listener

	while dungeon_199_3[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill1") then
				dungeon_199_3:sleep(1.5)
			elseif boss:useSkill("skill2", that(boss.attack_target_GUID)) then
				dungeon_199_3:sleep(1.5)
			elseif boss:useSkill("skill3", battle_listener.players) then
				dungeon_199_3:sleep(1.5)
			elseif boss:useSkill("skill4") then
				dungeon_199_3:sleep(1.5)
			elseif boss:useSkill("skill5") then
				dungeon_199_3:sleep(1.5)
			--elseif boss:useSkill("skill6") then
			--	dungeon_199_3:sleep(1.5)
			end
		end
		dungeon_199_3:sleep()
	end
end