function gmDungeon1983_create()
	local me = this()
	local boss = Christine.Npc:new():create(108976, me.x, me.y, me.z, 0):addToPartition(0)
	boss.search_enemy = false
end
function gmDungeon1983_cast(magic_id)
	local room_id = this().room_id
	dungeon_198_3[room_id].boss:castSpell(magic_id)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108976()
	Cl_Resist_HackersBossNum();
	local room_id = this().room_id
	dungeonInitialize_198_3(room_id)
	--Cl_Resist_HackersBossNum()
end
function npcDead_108976()
	Cl_Resist_HackersBossDead();
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108976_04]", 0)
	if dungeon_198_3[room_id].status == "fight" then
		dungeon_198_3[room_id].status = "success"

		--Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108976()
	Cl_Resist_HackersFightBegin();
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108976_01]", 0)
	if dungeon_198_3[room_id].status == "ready" then
		dungeonActive_198_3(room_id)
	end
end
function npcEndFight_108976()
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108976_03]", 0)
	if dungeon_198_3[room_id].status == "fight" then
		dungeon_198_3[room_id].status = "fail"
		dungeon_198_3[room_id].boss.search_enemy = false
		dungeon_198_3[room_id].boss.strike_back = false
		dungeon_198_3[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
-- ¤õµK«¬ºAµ²§ô
function magicObject_626193()
	debugmsg(0, 0, "magicObject_626193")
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	dungeon_198_3[room_id].boss:addBuff(626192)
	dungeon_198_3[room_id].boss.skill.skill1:lock()
	dungeon_198_3[room_id].boss.skill.skill2:lock()
	dungeon_198_3[room_id].boss.skill.skill3:lock()
	dungeon_198_3[room_id].boss.skill.skill5:unlock()
	dungeon_198_3[room_id].boss.skill.skill6:unlock()
	dungeon_198_3[room_id].boss.skill.skill7:unlock()
end
-- ³Ó¥ú«¬ºAµ²§ô
function magicObject_626194()
	debugmsg(0, 0, "magicObject_626194")
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	dungeon_198_3[room_id].boss:addBuff(626191)
	dungeon_198_3[room_id].boss.skill.skill1:unlock()
	dungeon_198_3[room_id].boss.skill.skill2:unlock()
	dungeon_198_3[room_id].boss.skill.skill3:unlock()
	dungeon_198_3[room_id].boss.skill.skill5:lock()
	dungeon_198_3[room_id].boss.skill.skill6:lock()
	dungeon_198_3[room_id].boss.skill.skill7:lock()
end
-- ¤õµK¨`¿Nµ²ªG
function magicObject_626156()
	debugmsg(0, 0, "magicObject_626156")
	local player = that()
	--player:say("check me")
	GiveBodyItem(player.guid, 243280, 1)
	if player:checkBuff(626156) then
		if player.buff[626156].power >= 2 then
			player:addBuff(626157)
			player:cancelBuff(626156)
		end
	end
end
-- ¥ú¼C¨ë°©µ²ªG
function magicObject_626159()
	debugmsg(0, 0, "magicObject_626159")
	local player = that()
	--player:say("check me")
	GiveBodyItem(player.guid, 243279, 1)
	if player:checkBuff(626159) then
		if player.buff[626159].power >= 2 then
			player:addBuff(626160)
			player:cancelBuff(626159)
		end
	end
end
-- ¯PµKÄñ¨­µ²§ô
function magicObject_626195()
	debugmsg(0, 0, "magicObject_626195")
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	local player = this()
	--player:say("player")
	dungeon_198_3[room_id].boss:systemCastSpell(player, 852175)
end
-- ¥úÄ£¨îµôµ²§ô
function magicObject_626196()
	debugmsg(0, 0, "magicObject_626196")
	local room_id = this().room_id
	if not dungeon_198_3 or not dungeon_198_3[room_id] then
		debugmsg(0, 0, "not found dungeon_198_3")
		return false
	end
	local player = this()
	--player:say("player")
	dungeon_198_3[room_id].boss:systemCastSpell(player, 852179)
end
-- ¸t¥úºë¥Û
function itemPlot_243279()
	this():cancelBuff(626155)
end
-- ¤õµKºë¥Û
function itemPlot_243280()
	this():cancelBuff(626158)
end

------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_198_3()
	debugmsg(0, 0, "dungeonSetting_198_3")
	dungeon_198_3 = Christine.System:new("dungeon_198_3")
	dungeon_198_3.alpha = true
	dungeon_198_3.beta = true
	dungeon_198_3.delay = 1

	local position_fix_reference = this()
	dungeon_198_3.position_fixed = {
		x = position_fix_reference.x,
		y = position_fix_reference.y,
		z = position_fix_reference.z,
		--direction = position_fix_reference.direction
		direction = 180
	}

	dungeon_198_3.skill = {}

--	¤õµK¼Qµo
	dungeon_198_3.skill.skill1 = Christine.Skill:new()
	dungeon_198_3.skill.skill1.name = "skill1"
	dungeon_198_3.skill.skill1.cd = 8
	function dungeon_198_3.skill.skill1:active(caster)
		--caster:say(self.name)
		if caster.spell_magic_ORGID ~= 0 then
			return false
		end
		return caster:castSpell(852172)
	end

--	¯PµK§]¾½
	dungeon_198_3.skill.skill2 = Christine.Skill:new()
	dungeon_198_3.skill.skill2.name = "skill2"
	dungeon_198_3.skill.skill2.cd = 8
	function dungeon_198_3.skill.skill2:active(caster)
		--caster:say(self.name)
		if caster.spell_magic_ORGID ~= 0 then
			return false
		end
		return caster:castSpell(852173)
	end

--	¤õ«B
	dungeon_198_3.skill.skill3 = Christine.Skill:new()
	dungeon_198_3.skill.skill3.name = "skill3"
	dungeon_198_3.skill.skill3.cd = 0
	function dungeon_198_3.skill.skill3:active(caster)
		--caster:say(self.name)
		if caster.spell_magic_ORGID ~= 0 then
			return false
		end
		return  caster:castSpell(852174)
	end

--	¸t¥ú¦R®§
	dungeon_198_3.skill.skill5 = Christine.Skill:new()
	dungeon_198_3.skill.skill5.name = "skill5"
	dungeon_198_3.skill.skill5.cd = 8
	function dungeon_198_3.skill.skill5:active(caster)
		--caster:say(self.name)
		if caster.spell_magic_ORGID ~= 0 then
			return false
		end
		return  caster:castSpell(852176)
	end

--	µ´¹ï«Ê¦L
	dungeon_198_3.skill.skill6 = Christine.Skill:new()
	dungeon_198_3.skill.skill6.name = "skill6"
	dungeon_198_3.skill.skill6.cd = 8
	function dungeon_198_3.skill.skill6:active(caster)
		--caster:say(self.name)
		if caster.spell_magic_ORGID ~= 0 then
			return false
		end
		return  caster:castSpell(852177)
	end

--	±ÏÅ«
	dungeon_198_3.skill.skill7 = Christine.Skill:new()
	dungeon_198_3.skill.skill7.name = "skill7"
	dungeon_198_3.skill.skill7.cd = 0
	function dungeon_198_3.skill.skill7:active(caster)
		--caster:say(self.name)
		if caster.spell_magic_ORGID ~= 0 then
			return false
		end
		return  caster:castSpell(852178)
	end
end

function dungeonInitialize_198_3(room_id)
	debugmsg(0, 0, "dungeonInitialize_198_3")

	if not dungeon_198_3 then
		dungeonSetting_198_3()
	end
	if dungeon_198_3.alpha then
		dungeonSetting_198_3()
	end

	dungeon_198_3[room_id] = {}
	dungeon_198_3[room_id].boss = this()
	dungeon_198_3[room_id].boss.search_enemy = true
	dungeon_198_3[room_id].boss.strike_back = true
	dungeon_198_3[room_id].boss.fight = true
	dungeon_198_3[room_id].boss.patrol = false

	for orgid, buff in pairs(dungeon_198_3[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_198_3[room_id].boss:addSkill("skill1", dungeon_198_3.skill.skill1):lock()
	dungeon_198_3[room_id].boss:addSkill("skill2", dungeon_198_3.skill.skill2):lock()
	dungeon_198_3[room_id].boss:addSkill("skill3", dungeon_198_3.skill.skill3):lock()
	dungeon_198_3[room_id].boss:addSkill("skill5", dungeon_198_3.skill.skill5)
	dungeon_198_3[room_id].boss:addSkill("skill6", dungeon_198_3.skill.skill6)
	dungeon_198_3[room_id].boss:addSkill("skill7", dungeon_198_3.skill.skill7)

	dungeon_198_3[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_198_3[room_id].battle_listener:add(dungeon_198_3[room_id].boss)

	dungeon_198_3[room_id].status = "ready"
	
	dungeon_198_3[room_id].boss:beginPlot("dungeonFixPosition_198_3", 2)
end

function dungeonFixPosition_198_3()
	local room_id = this().room_id
	if dungeon_198_3.position_fixed then
		dungeon_198_3[room_id].boss:changePosition(
			dungeon_198_3.position_fixed.x,
			dungeon_198_3.position_fixed.y,
			dungeon_198_3.position_fixed.z,
			dungeon_198_3.position_fixed.direction + 180)
		dungeon_198_3:debug("fix position")
	end
end

function dungeonActive_198_3(room_id)
	debugmsg(0, 0, "dungeonActive_198_3")

	dungeon_198_3[room_id].status = "fight"
	dungeon_198_3[room_id].boss:callPlot("dungeonMain_198_3", room_id)
	dungeon_198_3[room_id].boss:callPlot("npcAI_108976", room_id)

	dungeon_198_3[room_id].boss:addBuff(626192)
end

function dungeonMain_198_3(room_id)
	debugmsg(0, 0, "dungeonMain_198_3")

	local boss = dungeon_198_3[room_id].boss
	local battle_listener = dungeon_198_3[room_id].battle_listener
	local bbb = true

	while dungeon_198_3[room_id].status == "fight" do
		battle_listener:start()
		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108976_02]", 0)
			boss:addBuff(626179)
		end

		for skill_name, skill in pairs(boss.skill) do
			if not skill.is_lock then
				dungeon_198_3:debug(skill_name.." cd : "..skill.cd_counter)
			end
		end

		dungeon_198_3:sleep()
	end

	battle_listener:stop()

	for i = 1, SetSearchAllPlayer(room_id) do
		local player_guid = GetSearchResult()
		DelBodyItem(player_guid, 243279, CountBodyItem(player_guid, 243279))
		DelBodyItem(player_guid, 243280, CountBodyItem(player_guid, 243280))		
	end

	if dungeon_198_3[room_id].status == "success" then
		dungeon_198_3:debug("success")
	elseif dungeon_198_3[room_id].status == "fail" then
		dungeon_198_3:debug("fail")
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
		dungeonInitialize_198_3(room_id)
	end
end

function npcAI_108976(room_id)
	debugmsg(0, 0, "npcAI_108976")

	local boss = dungeon_198_3[room_id].boss
	local battle_listener = dungeon_198_3[room_id].battle_listener

	while dungeon_198_3[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill3") then
				boss.skill.skill3:lock()
				dungeon_198_3:sleep(1.5)
			elseif boss:useSkill("skill7") then
				boss.skill.skill7:lock()
				dungeon_198_3:sleep(1.5)
			elseif boss:useSkill("skill1") then dungeon_198_3:sleep(2.2)
			elseif boss:useSkill("skill2") then dungeon_198_3:sleep(2.2)
			elseif boss:useSkill("skill5") then dungeon_198_3:sleep(2.2)
			elseif boss:useSkill("skill6") then dungeon_198_3:sleep(2.2)
			end
		end
		dungeon_198_3:sleep()
	end
end