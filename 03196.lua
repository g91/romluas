function gmDungeon1982_create()
	local me = this()
	local boss = Christine.Npc:new():create(108975, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1982_random()
	local room_id = this().room_id
	dungeonRandomBuff_198_2(room_id)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108975()
	Cl_Resist_HackersBossNum();
	local room_id = this().room_id
	dungeonInitialize_198_2(room_id)
	--Cl_Resist_HackersBossNum()
end
function npcDead_108975()
	Cl_Resist_HackersBossDead()
	local room_id = this().room_id
	if not dungeon_198_2 or not dungeon_198_2[room_id] then
		debugmsg(0, 0, "not found dungeon_198_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108975_04]", 0)
	if dungeon_198_2[room_id].status == "fight" then
		dungeon_198_2[room_id].status = "success"

		--Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108975()
	local room_id = this().room_id
	if not dungeon_198_2 or not dungeon_198_2[room_id] then
		debugmsg(0, 0, "not found dungeon_198_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108975_01]", 0)
	if dungeon_198_2[room_id].status == "ready" then
		dungeonActive_198_2(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108975()
	local room_id = this().room_id
	if not dungeon_198_2 or not dungeon_198_2[room_id] then
		debugmsg(0, 0, "not found dungeon_198_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108975_03]", 0)
	if dungeon_198_2[room_id].status == "fight" then
		dungeon_198_2[room_id].status = "fail"
		dungeon_198_2[room_id].boss.search_enemy = false
		dungeon_198_2[room_id].boss.strike_back = false
		dungeon_198_2[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function magicObject_626190()
	debugmsg(0, 0, "magicObject_626190")
	local room_id = this().room_id
	dungeonRandomBuff_198_2(room_id)
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_198_2()
	debugmsg(0, 0, "dungeonSetting_198_2")
	dungeon_198_2 = Christine.System:new("dungeon_198_2")
	dungeon_198_2.alpha = true
	dungeon_198_2.beta = true
	dungeon_198_2.delay = 1

	local position_fix_reference = this()
	dungeon_198_2.position_fixed = {
		x = position_fix_reference.x,
		y = position_fix_reference.y,
		z = position_fix_reference.z,
		--direction = position_fix_reference.direction
		direction = 180
	}

	dungeon_198_2.skill = {}

--	»RÆF¤§¿V
	dungeon_198_2.skill.skill1 = Christine.Skill:new()
	dungeon_198_2.skill.skill1.name = "skill1"
	dungeon_198_2.skill.skill1.cd = 7
	function dungeon_198_2.skill.skill1:active(caster)
		--caster:say(self.name)
		return caster:castSpell(852160)
	end

--	¤õµK¼Q®g
	dungeon_198_2.skill.skill2 = Christine.Skill:new()
	dungeon_198_2.skill.skill2.name = "skill2"
	dungeon_198_2.skill.skill2.cd = 7
	function dungeon_198_2.skill.skill2:active(caster)
		--caster:say(self.name)
		return caster:castSpell(852161)
	end

--	Àø¨|¤§¤õ
	dungeon_198_2.skill.skill3 = Christine.Skill:new()
	dungeon_198_2.skill.skill3.name = "skill3"
	dungeon_198_2.skill.skill3.cd = 3
	function dungeon_198_2.skill.skill3:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852162)
	end

--	§N¨æ¯ºÃC
	dungeon_198_2.skill.skill4 = Christine.Skill:new()
	dungeon_198_2.skill.skill4.name = "skill4"
	dungeon_198_2.skill.skill4.cd = 11
	function dungeon_198_2.skill.skill4:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852163)
	end

--	­ì¤õÃzµo
	dungeon_198_2.skill.skill5 = Christine.Skill:new()
	dungeon_198_2.skill.skill5.name = "skill5"
	dungeon_198_2.skill.skill5.cd = 4
	function dungeon_198_2.skill.skill5:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852164)
	end

--	­«¤õ¥´À»
	dungeon_198_2.skill.skill6 = Christine.Skill:new()
	dungeon_198_2.skill.skill6.name = "skill6"
	dungeon_198_2.skill.skill6.cd = 11
	function dungeon_198_2.skill.skill6:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852165)
	end

--	¯}¸H¤õ»R
	dungeon_198_2.skill.skill7 = Christine.Skill:new()
	dungeon_198_2.skill.skill7.name = "skill7"
	dungeon_198_2.skill.skill7.cd = 3
	function dungeon_198_2.skill.skill7:active(caster, target)
		--caster:say(self.name)
		return  caster:castSpell(target, 852166)
	end

--	«s«è¤§¬Þ
	dungeon_198_2.skill.skill8 = Christine.Skill:new()
	dungeon_198_2.skill.skill8.name = "skill8"
	dungeon_198_2.skill.skill8.cd = 11
	function dungeon_198_2.skill.skill8:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852167)
	end

--	«s¶Ë¤§¬Þ
	dungeon_198_2.skill.skill9 = Christine.Skill:new()
	dungeon_198_2.skill.skill9.name = "skill9"
	dungeon_198_2.skill.skill9.cd = 11
	function dungeon_198_2.skill.skill9:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852168)
	end

--	¤õÆF¤W¨­
--	dungeon_198_2.skill.skill10 = Christine.Skill:new()
--	dungeon_198_2.skill.skill10.name = "skill10"
--	dungeon_198_2.skill.skill10.cd = 9
--	function dungeon_198_2.skill.skill10:active(caster)
--		return  caster:castSpell(caster, 852169)
--	end

--	§Ë¤õÂø­A
	dungeon_198_2.skill.skill11 = Christine.Skill:new()
	dungeon_198_2.skill.skill11.name = "skill11"
	dungeon_198_2.skill.skill11.cd = 3
	function dungeon_198_2.skill.skill11:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(852170)
	end
end

function dungeonInitialize_198_2(room_id)
	debugmsg(0, 0, "dungeonInitialize_198_2")

	if not dungeon_198_2 then
		dungeonSetting_198_2()
	end
	if dungeon_198_2.alpha then
		dungeonSetting_198_2()
	end

	dungeon_198_2[room_id] = {}
	dungeon_198_2[room_id].boss = this()
	dungeon_198_2[room_id].boss.search_enemy = true
	dungeon_198_2[room_id].boss.strike_back = true
	dungeon_198_2[room_id].boss.fight = true
	dungeon_198_2[room_id].boss.patrol = false

	for orgid, buff in pairs(dungeon_198_2[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_198_2[room_id].boss:addSkill("skill1", dungeon_198_2.skill.skill1)
	dungeon_198_2[room_id].boss:addSkill("skill2", dungeon_198_2.skill.skill2)
	dungeon_198_2[room_id].boss:addSkill("skill3", dungeon_198_2.skill.skill3):lock()
	dungeon_198_2[room_id].boss:addSkill("skill4", dungeon_198_2.skill.skill4):lock()
	dungeon_198_2[room_id].boss:addSkill("skill5", dungeon_198_2.skill.skill5):lock()
	dungeon_198_2[room_id].boss:addSkill("skill6", dungeon_198_2.skill.skill6):lock()
	dungeon_198_2[room_id].boss:addSkill("skill7", dungeon_198_2.skill.skill7):lock()
	dungeon_198_2[room_id].boss:addSkill("skill8", dungeon_198_2.skill.skill8):lock()
	dungeon_198_2[room_id].boss:addSkill("skill9", dungeon_198_2.skill.skill9):lock()
	--dungeon_198_2[room_id].boss:addSkill("skill10", dungeon_198_2.skill.skill10):lock()
	dungeon_198_2[room_id].boss:addSkill("skill11", dungeon_198_2.skill.skill11):lock()

	dungeon_198_2[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_198_2[room_id].battle_listener:add(dungeon_198_2[room_id].boss)

	dungeon_198_2[room_id].status = "ready"
	dungeon_198_2[room_id].fireSpirit = nil
	
	dungeon_198_2[room_id].boss:beginPlot("dungeonFixPosition_198_2", 2)
end

function dungeonFixPosition_198_2()
	local room_id = this().room_id
	if dungeon_198_2.position_fixed then
		dungeon_198_2[room_id].boss:changePosition(
			dungeon_198_2.position_fixed.x,
			dungeon_198_2.position_fixed.y,
			dungeon_198_2.position_fixed.z,
			dungeon_198_2.position_fixed.direction)
		dungeon_198_2:debug("fix position")
	end
end

function dungeonRandomBuff_198_2(room_id)
	debugmsg(0, 0, "dungeonRandomBuff_198_2")
	local boss = dungeon_198_2[room_id].boss
	local buffs = {626186, 626187, 626188}
	for index, buff_id in ipairs(buffs) do
		boss:cancelBuff(buff_id)
	end
	boss:cancelBuff(626189)

	local randomBuff = table.random(buffs, 1)[1]
	boss:addBuff(randomBuff)

	dungeonSetSkill_198_2(room_id, randomBuff)
	
	dungeon_198_2:sleep(5)

	local flags = Christine.FlagGroup:new(781442)
	local flag = table.random(flags, 1)[1]
	if dungeon_198_2[room_id].fireSpirit then
		dungeon_198_2[room_id].fireSpirit:delete()
	end
	dungeon_198_2[room_id].fireSpirit = Christine.Npc:new()
	dungeon_198_2[room_id].fireSpirit:create(109199, flag.x, flag.y, flag.z, flag.direction)
	dungeon_198_2[room_id].fireSpirit.fight = false
	dungeon_198_2[room_id].fireSpirit.strike_back = false
	dungeon_198_2[room_id].fireSpirit.search_enemy = false
	dungeon_198_2[room_id].fireSpirit:addTouchPlot("dungeonTouch_198_2", 24)
	SetCursorType(dungeon_198_2[room_id].fireSpirit.guid,eCursor_Hyperlink)
	dungeon_198_2[room_id].fireSpirit:addToPartition(room_id)
end

function dungeonSetSkill_198_2(room_id, randomBuff)
	debugmsg(0, 0, "dungeonSetSkill_198_2")
	local boss = dungeon_198_2[room_id].boss
	local buffs = {626186, 626187, 626188, 626189}

	if randomBuff == buffs[1] then
		boss:cancelBuff(626146)
		boss.skill.skill3:unlock()
		boss.skill.skill4:unlock()
		boss.skill.skill5:lock()
		boss.skill.skill6:lock()
		boss.skill.skill7:lock()
		boss.skill.skill8:lock()
		boss.skill.skill9:lock()
--		boss.skill.skill10:lock()
		boss.skill.skill11:lock()
	elseif randomBuff == buffs[2] then
		boss:cancelBuff(626146)
		boss.skill.skill3:lock()
		boss.skill.skill4:lock()
		boss.skill.skill5:unlock()
		boss.skill.skill6:unlock()
		boss.skill.skill7:lock()
		boss.skill.skill8:lock()
		boss.skill.skill9:lock()
--		boss.skill.skill10:lock()
		boss.skill.skill11:lock()
	elseif randomBuff == buffs[3] then
		boss:cancelBuff(626146)
		boss.skill.skill3:lock()
		boss.skill.skill4:lock()
		boss.skill.skill5:lock()
		boss.skill.skill6:lock()
		boss.skill.skill7:unlock()
		if RandRange(1, 2) == 1 then
			boss.skill.skill8:unlock()
			boss.skill.skill9:lock()
		else
			boss.skill.skill8:lock()
			boss.skill.skill9:unlock()
		end
--		boss.skill.skill10:lock()
		boss.skill.skill11:lock()
	elseif randomBuff == buffs[4] then
		boss:addBuff(626146)
		boss.skill.skill3:lock()
		boss.skill.skill4:lock()
		boss.skill.skill5:lock()
		boss.skill.skill6:lock()
		boss.skill.skill7:lock()
		boss.skill.skill8:lock()
		boss.skill.skill9:lock()
--		boss.skill.skill10:unlock()
		boss.skill.skill11:unlock()
	end
end

function dungeonTouch_198_2()
	debugmsg(0, 0, "dungeonTouch_198_2")
	local room_id = this().room_id
	local target = that()
	local player = this()
	local boss = dungeon_198_2[room_id].boss
	target:castSpell(852171)
	if target:distanceTo(boss) < 50 then
		target:beginPlot("dungeonAfterTouch_198_2a", 3.1)
	else
		target:beginPlot("dungeonAfterTouch_198_2b", 3.1)
	end
end
function dungeonAfterTouch_198_2b()
	debugmsg(0, 0, "dungeonAfterTouch_198_2b")
	local npc = this()
	local room_id = npc.room_id
	npc:delFromPartition()
	Sleep(150)
	npc:addToPartition(room_id)
end
function dungeonAfterTouch_198_2a()
	debugmsg(0, 0, "dungeonAfterTouch_198_2a")
	local room_id = this().room_id
	local boss = dungeon_198_2[room_id].boss
	local buffs = {626186, 626187, 626188}
	for index, buff_id in ipairs(buffs) do
		boss:cancelBuff(buff_id)
	end
	boss:addBuff(626189)
	dungeonSetSkill_198_2(room_id, 626189)
	this():removeTouchPlot()
	this().live_time = 1
end

function dungeonActive_198_2(room_id)
	debugmsg(0, 0, "dungeonActive_198_2")

	dungeon_198_2[room_id].status = "fight"
	dungeon_198_2[room_id].boss:callPlot("dungeonMain_198_2", room_id)
	dungeon_198_2[room_id].boss:callPlot("npcAI_108975", room_id)
end

function dungeonMain_198_2(room_id)
	debugmsg(0, 0, "dungeonMain_198_2")

	local boss = dungeon_198_2[room_id].boss
	local battle_listener = dungeon_198_2[room_id].battle_listener
	local bbb = true

	Sleep(10)

	dungeonRandomBuff_198_2(room_id)

	while dungeon_198_2[room_id].status == "fight" do
		battle_listener:start()
		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108975_02]", 0)
			boss:addBuff(626179)
		end

		for skill_name, skill in pairs(boss.skill) do
			if not skill.is_lock then
				dungeon_198_2:debug(skill_name.." cd : "..skill.cd_counter)
			end
		end

		dungeon_198_2:sleep()
	end

	dungeon_198_2[room_id].fireSpirit:delete()

	battle_listener:stop()

	if dungeon_198_2[room_id].status == "success" then
		dungeon_198_2:debug("success")
	elseif dungeon_198_2[room_id].status == "fail" then
		dungeon_198_2:debug("fail")
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
		dungeonInitialize_198_2(room_id)
	end
end

function npcAI_108975(room_id)
	debugmsg(0, 0, "npcAI_108975")

	local boss = dungeon_198_2[room_id].boss
	local battle_listener = dungeon_198_2[room_id].battle_listener

	while dungeon_198_2[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill4") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill3") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill6") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill5") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill8") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill9") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill7", that(boss.attack_target_GUID)) then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill11") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill1") then dungeon_198_2:sleep(1.5)
			elseif boss:useSkill("skill2") then dungeon_198_2:sleep(1.5)
			end
		end
		dungeon_198_2:sleep()
	end
end