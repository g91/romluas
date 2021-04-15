------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function gm_dungeon_196_1_4_create()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(108950, me.x, me.y, me.z)
	boss:addToPartition(me.room_id)
end

function gm_dungeon_196_1_4_create2()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(108950, me.x, me.y, me.z)
	boss.fight = false
	boss.search_enemy = false
	boss.strike_back = false
	boss:addToPartition(me.room_id)
	boss:addBuff(625763)
end

function  gm_dungeon_196_1_4_castspell()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(108950, me.x, me.y, me.z)
	boss.fight = false
	boss.search_enemy = false
	boss.strike_back = false
	boss.hp = 100
	boss:addToPartition(me.room_id)
	boss:addBuff(502707)
	this():castspell(this(), 851864)
end

function gm_dungeon_196_1_4_create106130()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(106130, me.x, me.y, me.z)
	boss:addToPartition(me.room_id)
end

function gm_dungeon_196_1_4_step_2()
	local me = this()
	dungeon_196_1_4[me.room_id].boss.hp = dungeon_196_1_4[me.room_id].boss.hp - dungeon_196_1_4[me.room_id].boss.max_hp * 0.17
end

function gm_dungeon_196_1_4_check_step()
	local me = this()
	if dungeon_196_1_4 and dungeon_196_1_4[me.room_id] then
		dungeon_196_1_4:debug("dungeon_196_1_4["..me.room_id.."].step = "..dungeon_196_1_4[me.room_id].step)
	end
end

function  gm_dungeon_196_1_4_check_buff()
	local me = this()
	--me:addBuff(625764)
	SetPlot(me.guid, "dead", "dungeon_196_1_4_player", 1)
end

function gm_dungeon_196_1_4_breakShield()
	local me = this()
	dungeon_196_1_4[me.room_id].boss:cancelBuff(625763)
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcCreate_108950()
	debugmsg(0, 0, "npcCreateEvent_108950")
	dungeonInitialize_196_1_4(this().room_id)
	Cl_Resist_HackersBossNum()
end

function npcDead_108950()
	debugmsg(0, 0, "npcDeadEvent_108950")
	if dungeon_196_1_4 and dungeon_196_1_4[this().room_id] and dungeon_196_1_4[this().room_id].status == "fight" then
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108950_04]", 0)
		dungeon_196_1_4[this().room_id].status = "success"
		sasa_ZoneDungeon_title_01(530983)
		Cl_Resist_HackersBossDead()
	end
end

function npcBeginFight_108950()
	debugmsg(0, 0, "npcBeginFightEvent_108950")
	local room_id = this().room_id
	if dungeon_196_1_4 and dungeon_196_1_4[room_id] then
		if dungeon_196_1_4[room_id].status ~= "fight" then
			dungeonActive_196_1_4(room_id)
			scriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108950_01]", 0)
			Cl_Resist_HackersFightBegin()
		elseif dungeon_196_1_4[room_id].keep_fight then
			dungeon_196_1_4[room_id].battle_listener.kick_out_player_delay = 0
			dungeon_196_1_4[room_id].keep_fight = false
		end
	end
end

function npcEndFight_108950()
	debugmsg(0, 0, "npcEndFightEvent_108950")
	local room_id = this().room_id
	if dungeon_196_1_4 and dungeon_196_1_4[room_id] and dungeon_196_1_4[room_id].status == "fight" then
		if not dungeon_196_1_4[room_id].keep_fight then
			dungeon_196_1_4[room_id].status = "fail"
			dungeon_196_1_4[room_id].boss.search_enemy = true
			dungeon_196_1_4[room_id].boss.strike_back = true
			dungeon_196_1_4[room_id].boss.movable = true
		end
	end
end

------------------------------------------------------------------------------
--106130
------------------------------------------------------------------------------
function npcDead_106130()
	local me = this()
	local npc = Christine.Npc:new()
	npc:create(106547, me.x, me.y, me.z)
	npc.mark = false
	npc.fight = false
	npc.search_enemy = false
	npc.strike_back = false
	npc.movable = false
	npc:addToPartition(me.room_id)
	npc:addBuff(625768)
	npc.live_time = 4
	return true
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------
-- ¸Ñ¬r
function magicObject_625769()
	local player = that()
	player:cancelBuff(625760)
	return true
end

-- ªá¬Þµ²§ô
function magicObject_625803()
	debugmsg(0, 0, "magicObject_625803")
	local room_id = this().room_id
	if not dungeon_196_1_4 or not dungeon_196_1_4[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_4...")
		return false
	end
	--dungeon_196_1_4[room_id].boss:systemCastSpell(dungeon_196_1_4[room_id].boss, 851866)
	dungeon_196_1_4:debug("step 2 end!!!!!!!")
	dungeon_196_1_4[room_id].step = 1
	dungeon_196_1_4[room_id].boss:interruptMagic()
	dungeon_196_1_4[room_id].boss.search_enemy = true
	dungeon_196_1_4[room_id].boss.strike_back = true
	dungeon_196_1_4[room_id].boss.movable = true
	return true
end

-- ªá¬Þ®É¶¡¨ì
function magicObject_625775()
	debugmsg(0, 0, "magicObject_625775")
	local room_id = this().room_id
	if not dungeon_196_1_4 or not dungeon_196_1_4[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_4...")
		return false
	end
	dungeon_196_1_4[room_id].boss:systemCastSpell(dungeon_196_1_4[room_id].boss, 851866)
	dungeon_196_1_4:debug("step 2 end!!!!!!!")
	dungeon_196_1_4[room_id].step = 1
	dungeon_196_1_4[room_id].boss:interruptMagic()
	dungeon_196_1_4[room_id].boss.search_enemy = true
	dungeon_196_1_4[room_id].boss.strike_back = true
	dungeon_196_1_4[room_id].boss.movable = true
	return true
end

-- ¦åÂ«ÃÃ½¯ÀË¬d
function magicObject_625766()
	local player = that()
	if player:checkBuff(625764) then
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108950_05]", 0)
		return true
	end
	return false
end

-- ³ê¦åÃÃ½¯
function magicObject_625764()
	debugmsg(0, 0, "magicObject_625764")
	local room_id = this().room_id
	if not dungeon_196_1_4 or not dungeon_196_1_4[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_4...")
		return false
	end
	local me = that()
	SetPlot(me.guid, "dead", "dungeon_196_1_4_player", 1)
end

-- ³ê¦åÃÃ½¯µ²§ô
function magicObject_625801()
	debugmsg(0, 0, "magicObject_625801")
	local room_id = this().room_id
	if not dungeon_196_1_4 or not dungeon_196_1_4[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_4...")
		return false
	end
	local me = that()
	SetPlot(me.guid, "dead", "", 0)
end

-- ª±®a¦º¤`¼@±¡
function dungeon_196_1_4_player()
	debugmsg(0, 0, "dungeon_196_1_4_player")
	local room_id = this().room_id
	if not dungeon_196_1_4 or not dungeon_196_1_4[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_4...")
		return false
	end
	local me = this()
	SetPlot(me.guid, "dead", "", 0)
	dungeon_196_1_4[room_id].boss:systemCastSpell(dungeon_196_1_4[room_id].boss, 851865)
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function dungeonInitialize_196_1_4(room_id)
	debugmsg(0, 0, "dungeonInitialize_196_1_4")

	if not dungeon_196_1_4 then
		dungeonSetting_196_1_4()
	elseif  dungeon_196_1_4.alpha then
		--
		dungeonSetting_196_1_4()
	end

	dungeon_196_1_4[room_id] = {}

	dungeon_196_1_4[room_id].boss = this()
	dungeon_196_1_4[room_id].boss.search_enemy = true
	dungeon_196_1_4[room_id].boss.strike_back = true
	dungeon_196_1_4[room_id].boss.movable = true
	dungeon_196_1_4[room_id].status = "ready"
	dungeon_196_1_4[room_id].step = 1
	dungeon_196_1_4[room_id].keep_fight = false

	for orgid, buff in pairs(dungeon_196_1_4[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_196_1_4[room_id].boss:addSkill("skill1", dungeon_196_1_4.skill.skill1)
	dungeon_196_1_4[room_id].boss:addSkill("skill2", dungeon_196_1_4.skill.skill2)
	dungeon_196_1_4[room_id].boss:addSkill("skill3", dungeon_196_1_4.skill.skill3)
	dungeon_196_1_4[room_id].boss:addSkill("skill4", dungeon_196_1_4.skill.skill4)
--	dungeon_196_1_4[room_id].boss:addSkill("skill5", dungeon_196_1_4.skill.skill5)
	dungeon_196_1_4[room_id].boss:addSkill("skill6", dungeon_196_1_4.skill.skill6)
--	dungeon_196_1_4[room_id].boss:addSkill("skill7", dungeon_196_1_4.skill.skill7)
--	dungeon_196_1_4[room_id].boss:addSkill("skill8", dungeon_196_1_4.skill.skill8)

	dungeon_196_1_4[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_196_1_4[room_id].battle_listener:add(dungeon_196_1_4[room_id].boss)

end

function dungeonSetting_196_1_4()
	debugmsg(0, 0, "dungeonSetting_196_1_4")

	dungeon_196_1_4 = Christine.System:new("dungeon_196_1_4")
	dungeon_196_1_4.alpha = false
	dungeon_196_1_4.beta = true
	dungeon_196_1_4.delay = 1

	dungeon_196_1_4.skill = {}

	-- ²`«×¼ì¶Ë
	dungeon_196_1_4.skill.skill1 = Christine.Skill:new()
	dungeon_196_1_4.skill.skill1.name = "skill1"
	dungeon_196_1_4.skill.skill1.cd = 6
	function dungeon_196_1_4.skill.skill1:active(caster, target)
		dungeon_196_1_4:debug("useSkill : "..self.name)
		dungeon_196_1_4:sleep(1)
		return caster:castSpell(target, 851859)
	end

	-- ¦a¨ë
	dungeon_196_1_4.skill.skill2 = Christine.Skill:new()
	dungeon_196_1_4.skill.skill2.name = "skill2"
	dungeon_196_1_4.skill.skill2.cd = 6
	function dungeon_196_1_4.skill.skill2:active(caster, targets)
		dungeon_196_1_4:debug("useSkill : "..self.name)
		dungeon_196_1_4:sleep(1)
		local select_targets = {}
		if #targets > 4 then
			select_targets = table.random(targets, 4)
		else
			select_targets = targets
		end
		if #select_targets > 0 then
			for index, target in ipairs(select_targets) do
				if index == 1 then
					caster:castSpell(target, 851860)
				else
					caster:systemCastSpell(target, 851860)
				end
			end
			return true
		else
			return false
		end
	end

	-- «¶©g¶®¦L°O
	dungeon_196_1_4.skill.skill3 = Christine.Skill:new()
	dungeon_196_1_4.skill.skill3.name = "skill3"
	dungeon_196_1_4.skill.skill3.cd = 11
	function dungeon_196_1_4.skill.skill3:active(caster)
		dungeon_196_1_4:debug("useSkill : "..self.name)
		dungeon_196_1_4:sleep(1)
		return caster:castSpell(caster, 851861)
	end

	-- ¦ÛµM¤§·½
	dungeon_196_1_4.skill.skill4 = Christine.Skill:new()
	dungeon_196_1_4.skill.skill4.name = "skill4"
	dungeon_196_1_4.skill.skill4.cd = 19
	function dungeon_196_1_4.skill.skill4:active(caster)
		dungeon_196_1_4:debug("useSkill : "..self.name)
		dungeon_196_1_4:sleep(1)
		return caster:castSpell(caster, 851862)
	end

	-- ªá¬Þ
--	dungeon_196_1_4.skill.skill5 = Christine.Skill:new()
--	dungeon_196_1_4.skill.skill5.name = "skill5"
--	dungeon_196_1_4.skill.skill5.cd = 0
--	function dungeon_196_1_4.skill.skill5:active(caster)
--		dungeon_196_1_4:debug("useSkill : "..self.name)
--		dungeon_196_1_4:sleep(1)
--		return caster:castSpell(caster, 851863)
--	end

	-- ³ê¦åÃÃ½¯
	dungeon_196_1_4.skill.skill6 = Christine.Skill:new()
	dungeon_196_1_4.skill.skill6.name = "skill6"
	dungeon_196_1_4.skill.skill6.cd = 0
	function dungeon_196_1_4.skill.skill6:active(caster)
		dungeon_196_1_4:debug("useSkill : "..self.name)
		dungeon_196_1_4:sleep(1)
		return caster:systemCastSpell(caster, 851864)
	end

	-- ´_¦åÃÃ½¯
--	dungeon_196_1_4.skill.skill7 = Christine.Skill:new()
--	dungeon_196_1_4.skill.skill7.name = "skill7"
--	dungeon_196_1_4.skill.skill7.cd = 60
--	function dungeon_196_1_4.skill.skill7:active(caster)
--		dungeon_196_1_4:debug("useSkill : "..self.name)
--		dungeon_196_1_4:sleep(1)
--		return caster:castSpell(target, 851865)
--	end

	-- ¦åÂ«ÃÃ½¯
--	dungeon_196_1_4.skill.skill8 = Christine.Skill:new()
--	dungeon_196_1_4.skill.skill8.name = "skill8"
--	dungeon_196_1_4.skill.skill8.cd = 60
--	function dungeon_196_1_4.skill.skill8:active(caster)
--		dungeon_196_1_4:debug("useSkill : "..self.name)
--		dungeon_196_1_4:sleep(1)
--		return caster:castSpell(caster, 851866)
--	end

	-- ¤ÑµM­ß¤õ
	dungeon_196_1_4.skill.skill9 = Christine.Skill:new()
	dungeon_196_1_4.skill.skill9.name = "skill9"
	dungeon_196_1_4.skill.skill9.cd = 1
	function dungeon_196_1_4.skill.skill9:active(caster, targets)
		dungeon_196_1_4:debug("useSkill : "..self.name)
		local select_targets = {}
		if #targets > 2 then
			select_targets = table.random(targets, 2)
		else
			select_targets = targets
		end
		if #select_targets > 0 then
			for index, target in ipairs(select_targets) do
				if index == 1 then
					caster:castSpell(target, 851867)
				else
					caster:systemCastSpell(target, 851867)
				end
			end
			return true
		else
			return false
		end
	end
end

function dungeonActive_196_1_4(room_id)
	debugmsg(0, 0, "dungeonActive_196_1_4")

	dungeon_196_1_4[room_id].status = "fight"
	dungeon_196_1_4[room_id].boss:callPlot("dungeonMain_196_1_4", room_id)
	dungeon_196_1_4[room_id].boss:callPlot("npcAI_108950", room_id)
	
	return true
end

function dungeonMain_196_1_4(room_id)
	debugmsg(0, 0, "dungeonMain_196_1_4")

	local boss = dungeon_196_1_4[room_id].boss
	local battle_listener = dungeon_196_1_4[room_id].battle_listener

	local change_step_pointer = 0.85
	local timestamp = 0

	local bbb = true

	while dungeon_196_1_4[room_id].status == "fight" do
		battle_listener:start()

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108950_02]", 0)
			boss:addBuff(625770)
		end

		if battle_listener.duration_time % 15 == 14 then
			local npc, x, y, z, angle, distance
			for index = 1, 2 do
				distance = RandRange(15, 85)
				angle = RandRange(1, 180) / 180 * math.pi
				x = boss.x + (distance * math.cos(angle))
				z = boss.z + (distance * math.sin(angle))
				y = GetHeight(x, boss.y, z)
				npc = Christine.Npc:new()
				npc:create(106130, x, y, z, RandRange(1, 360))
				npc.movable = false
				npc.live_time = 10
				npc:addSkill("skill9", dungeon_196_1_4.skill.skill9)
				npc:addToPartition(room_id)
				battle_listener:add(npc)
				npc:callPlot("npcAI_106130", room_id)
			end
		end

		if dungeon_196_1_4[room_id].step == 1 and boss.hp < boss.max_hp * change_step_pointer then
			change_step_pointer = change_step_pointer - 0.15
			dungeon_196_1_4[room_id].step = 2
			boss:interruptMagic()
			boss:addBuff(625763)
			boss:addBuff(626276)
			battle_listener.kick_out_player_delay = 24
			dungeon_196_1_4[room_id].keep_fight = true
			timestamp = battle_listener.current_time
			boss.search_enemy = false
			boss.strike_back = false
			boss.movable = false
			boss:stopAttack()
			dungeon_196_1_4:sleep()
			boss:castspell(this(), 851954)
			boss:useSkill("skill6")
		end

		if dungeon_196_1_4[room_id].keep_fight then
			local count = 0
			local players_count = #battle_listener.players
			if players_count <= 0 then
				battle_listener.kick_out_player_delay = 0
				dungeon_196_1_4[room_id].keep_fight = false
				dungeon_196_1_4[room_id].status = "fail"
			end
			for index, player in ipairs(battle_listener.players) do
				if player.is_dead then
					count = count + 1
				end
				if count >= players_count then
					battle_listener.kick_out_player_delay = 0
					dungeon_196_1_4[room_id].keep_fight = false
					dungeon_196_1_4[room_id].status = "fail"
				end
			end
			if battle_listener.current_time - timestamp > 20 then
				boss.search_enemy = true
				boss.strike_back = true
				boss.movable = true
			end
		end

		dungeon_196_1_4:sleep()
	end
	battle_listener:stop()

	local players_count = SetSearchAllPlayer(room_id)
	for i = 1, players_count do
		local player = that(GetSearchResult())
		player:cancelBuff(625760)
	end

	if dungeon_196_1_4[room_id].status == "success" then
		dungeon_196_1_4:debug("success")
	elseif dungeon_196_1_4[room_id].status == "fail" then
		dungeon_196_1_4:debug("fail")
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108950_03]", 0)
		boss:delFromPartition():sleep(3):addToPartition(room_id)
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcAI_108950(room_id)
	debugmsg(0, 0, "npcAI_108950")

	local boss = dungeon_196_1_4[room_id].boss
	local battle_listener = dungeon_196_1_4[room_id].battle_listener

	while dungeon_196_1_4[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if dungeon_196_1_4[room_id].step == 1 then
				if boss:useSkill("skill1", that(boss.attack_target_GUID)) then
				elseif boss:useSkill("skill2", battle_listener.players) then
				elseif boss:useSkill("skill3") then
				elseif boss:useSkill("skill4") then
				end
			end
		end
		dungeon_196_1_4:sleep()
	end
end

function npcAI_106130(room_id)
	debugmsg(0, 0, "npcAI_106130")

	local me = this()
	local boss = dungeon_196_1_4[room_id].boss
	local battle_listener = dungeon_196_1_4[room_id].battle_listener

	for index, npc in ipairs(dungeon_196_1_4[room_id].battle_listener.list) do
		if npc.guid == me.guid then
			me = npc
			break
		end
	end

	while dungeon_196_1_4[room_id].status == "fight" do
		if #dungeon_196_1_4[room_id].battle_listener.players > 0 then
			me:useSkill("skill9", dungeon_196_1_4[room_id].battle_listener.players)
		end
		dungeon_196_1_4:sleep()
	end

	me.live_time = 0
end