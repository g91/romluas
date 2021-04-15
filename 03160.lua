------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function gm_dungeon_196_1_3_create()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(108949, me.x, me.y, me.z)
	boss:addToPartition(me.room_id)
end

function gm_dungeon_196_1_3_buff1()
	npcChangeBuff_108949(625741)
end

function gm_dungeon_196_1_3_buff2()
	npcChangeBuff_108949(625742)
end

function gm_dungeon_196_1_3_buff3()
	npcChangeBuff_108949(625743)
end

function gm_dungeon_196_1_3_buff4()
	npcChangeBuff_108949(625744)
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcCreate_108949()
	debugmsg(0, 0, "npcCreateEvent_108949")
	dungeonInitialize_196_1_3(this().room_id)
	Cl_Resist_HackersBossNum()
end

function npcDead_108949()
	debugmsg(0, 0, "npcDeadEvent_108949")
	if dungeon_196_1_3 and dungeon_196_1_3[this().room_id] and dungeon_196_1_3[this().room_id].status == "fight" then
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108949_04]", 0)
		dungeon_196_1_3[this().room_id].status = "success"
	else
		debugmsg(0, 0, "!!!!!!!!!!!!!!!!!!!!!!!"..type(dungeon_196_1_3))
		debugmsg(0, 0, "!!!!!!!!!!!!!!!!!!!!!!!"..type(dungeon_196_1_3[this().room_id]))
	end
	Cl_Resist_HackersBossDead()
end

function npcBeginFight_108949()
	debugmsg(0, 0, "npcBeginFightEvent_108949")
	if dungeon_196_1_3 and dungeon_196_1_3[this().room_id] and dungeon_196_1_3[this().room_id].status ~= "fight" then
		dungeonActive_196_1_3(this().room_id)
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108949_01]", 0)
	end
	Cl_Resist_HackersFightBegin()
end

function npcEndFight_108949()
	debugmsg(0, 0, "npcEndFightEvent_108949")
	if dungeon_196_1_3 and dungeon_196_1_3[this().room_id] and dungeon_196_1_3[this().room_id].status == "fight" then
		dungeon_196_1_3[this().room_id].status = "fail"
	end
end

function npcChangeBuff_108949(index)
	local boss = dungeon_196_1_3[this().room_id].boss
	boss:cancelBuff(625741)
	boss:cancelBuff(625742)
	boss:cancelBuff(625743)
	boss:cancelBuff(625744)
	boss.skill.skill1:lock()
	boss.skill.skill2:lock()
	boss.skill.skill3:lock()
	boss.skill.skill4:lock()
	boss.skill.skill5:lock()
	boss.skill.skill6:lock()
	boss.skill.skill7:lock()
	boss.skill.skill8:lock()
	boss:addBuff(index or RandRange(625741, 625744))
	if boss:checkBuff(625741) then
		boss.skill.skill1:unlock()
		boss.skill.skill2:unlock()
	elseif boss:checkBuff(625742) then
		boss.skill.skill3:unlock()
		boss.skill.skill4:unlock()
	elseif boss:checkBuff(625743) then
		boss.skill.skill5:unlock()
		boss.skill.skill6:unlock()
	elseif boss:checkBuff(625744) then
		boss.skill.skill7:unlock()
		boss.skill.skill8:unlock()
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

-- 聖樹能量被攻擊
function magicObject_625773()
	debugmsg(0, 0, "magicObject_625773")
	local room_id = this().room_id
	if not dungeon_196_1_3 or not dungeon_196_1_3[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_3...")
		return false
	end

	local holy_energy = dungeon_196_1_3[room_id].holy_energy
	local dark_tree = dungeon_196_1_3[room_id].dark_tree

	holy_energy:stopAttack()
	holy_energy:move(dark_tree.x, dark_tree.y, dark_tree.z)
	beginPlot(holy_energy.guid, "magicObject_625773s", 10)

	return true
end
-- 聖樹走1秒停下來
function magicObject_625773s()
	this():stopAttack()
	this():stopMove()
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function dungeonInitialize_196_1_3(room_id)
	debugmsg(0, 0, "dungeonInitialize_196_1_3")

	if not dungeon_196_1_3 then
		dungeonSetting_196_1_3()
	elseif  dungeon_196_1_3.alpha then
		--
		dungeonSetting_196_1_3()
	end

	dungeon_196_1_3[room_id] = {}

	dungeon_196_1_3[room_id].boss = this()
	dungeon_196_1_3[room_id].status = "ready"
	dungeon_196_1_3[room_id].boss:addBuff(625774)

	for orgid, buff in pairs(dungeon_196_1_3[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_196_1_3[room_id].boss:addSkill("skill1", dungeon_196_1_3.skill.skill1):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill2", dungeon_196_1_3.skill.skill2):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill3", dungeon_196_1_3.skill.skill3):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill4", dungeon_196_1_3.skill.skill4):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill5", dungeon_196_1_3.skill.skill5):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill6", dungeon_196_1_3.skill.skill6):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill7", dungeon_196_1_3.skill.skill7):lock()
	dungeon_196_1_3[room_id].boss:addSkill("skill8", dungeon_196_1_3.skill.skill8):lock()

	dungeon_196_1_3[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_196_1_3[room_id].battle_listener:add(dungeon_196_1_3[room_id].boss)

	local boss = dungeon_196_1_3[room_id].boss
	dungeon_196_1_3[room_id].light_tree = Christine.Npc:new()
	dungeon_196_1_3[room_id].light_tree:create(106124, boss.x, boss.y, boss.z - 60)
	dungeon_196_1_3[room_id].light_tree.search_enemy = false
	dungeon_196_1_3[room_id].light_tree.strike_back = false
	dungeon_196_1_3[room_id].light_tree.fight = false
	dungeon_196_1_3[room_id].light_tree.movable = false
	dungeon_196_1_3[room_id].light_tree:addToPartition(room_id)

	dungeon_196_1_3[room_id].dark_tree = Christine.Npc:new()
	dungeon_196_1_3[room_id].dark_tree:create(106129, boss.x, boss.y, boss.z + 60)
	dungeon_196_1_3[room_id].dark_tree.search_enemy = false
	dungeon_196_1_3[room_id].dark_tree.strike_back = false
	dungeon_196_1_3[room_id].dark_tree.fight = false
	dungeon_196_1_3[room_id].dark_tree.movable = false
	dungeon_196_1_3[room_id].dark_tree:addToPartition(room_id)

	local light_tree = dungeon_196_1_3[room_id].light_tree
	dungeon_196_1_3[room_id].holy_energy = Christine.Npc:new()
	dungeon_196_1_3[room_id].holy_energy:create(106133, light_tree.x, light_tree.y, light_tree.z)
	dungeon_196_1_3[room_id].holy_energy.search_enemy = false
	dungeon_196_1_3[room_id].holy_energy.strike_back = false
	dungeon_196_1_3[room_id].holy_energy:addBuff(625772)
	dungeon_196_1_3[room_id].holy_energy:addToPartition(room_id)
	dungeon_196_1_3[room_id].holy_energy:addBuff(509844, 94)

end

function dungeonSetting_196_1_3()
	debugmsg(0, 0, "dungeonSetting_196_1_3")

	dungeon_196_1_3 = Christine.System:new("dungeon_196_1_3")
	dungeon_196_1_3.alpha = false
	dungeon_196_1_3.beta = true
	dungeon_196_1_3.delay = 1

	dungeon_196_1_3.skill = {}

	-- 樹人之力
	dungeon_196_1_3.skill.skill1 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill1.name = "skill1"
	dungeon_196_1_3.skill.skill1.cd = 7
	function dungeon_196_1_3.skill.skill1:active(caster, target)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(target, 851851)
	end

	-- 神聖懲戒
	dungeon_196_1_3.skill.skill2 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill2.name = "skill2"
	dungeon_196_1_3.skill.skill2.cd = 11
	function dungeon_196_1_3.skill.skill2:active(caster)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(caster, 851852)
	end

	-- 自然吸收
	dungeon_196_1_3.skill.skill3 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill3.name = "skill3"
	dungeon_196_1_3.skill.skill3.cd = 13
	function dungeon_196_1_3.skill.skill3:active(caster)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(caster, 851853)
	end

	-- 極速枯萎
	dungeon_196_1_3.skill.skill4 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill4.name = "skill4"
	dungeon_196_1_3.skill.skill4.cd = 11
	function dungeon_196_1_3.skill.skill4:active(caster)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(caster, 851854)
	end

	-- 反嗜
	dungeon_196_1_3.skill.skill5 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill5.name = "skill5"
	dungeon_196_1_3.skill.skill5.cd = 7
	function dungeon_196_1_3.skill.skill5:active(caster, target)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(target, 851855)
	end

	-- 地底震撼
	dungeon_196_1_3.skill.skill6 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill6.name = "skill6"
	dungeon_196_1_3.skill.skill6.cd = 11
	function dungeon_196_1_3.skill.skill6:active(caster)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(caster, 851856)
	end

	-- 樹族詛咒
	dungeon_196_1_3.skill.skill7 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill7.name = "skill7"
	dungeon_196_1_3.skill.skill7.cd = 7
	function dungeon_196_1_3.skill.skill7:active(caster)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(caster, 851857)
	end

	-- 枯木嚴審
	dungeon_196_1_3.skill.skill8 = Christine.Skill:new()
	dungeon_196_1_3.skill.skill8.name = "skill8"
	dungeon_196_1_3.skill.skill8.cd = 11
	function dungeon_196_1_3.skill.skill8:active(caster)
		dungeon_196_1_3:debug("useSkill : "..self.name)
		dungeon_196_1_3:sleep(1)
		return caster:castSpell(caster, 851858)
	end
end

function dungeonActive_196_1_3(room_id)
	debugmsg(0, 0, "dungeonActive_196_1_3")

	dungeon_196_1_3[room_id].status = "fight"
	dungeon_196_1_3[room_id].boss:callPlot("dungeonMain_196_1_3", room_id)
	dungeon_196_1_3[room_id].boss:callPlot("npcAI_108949", room_id)
	dungeon_196_1_3[room_id].holy_energy:callPlot("npcAI_106133", room_id)
	
	return true
end

function dungeonMain_196_1_3(room_id)
	debugmsg(0, 0, "dungeonMain_196_1_3")

	local boss = dungeon_196_1_3[room_id].boss
	local battle_listener = dungeon_196_1_3[room_id].battle_listener

	local change_buff_pointer = 1

	npcChangeBuff_108949()

	local bbb = true

	while dungeon_196_1_3[room_id].status == "fight" do
		battle_listener:start()

		if battle_listener.duration_time % 15 == 0 then
			ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108949_05]", 0)
		end

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108949_02]", 0)
			boss:addBuff(625770)
		end

		if boss.hp < boss.max_hp * change_buff_pointer then
			change_buff_pointer = change_buff_pointer - 0.1
			npcChangeBuff_108949()
		end

		dungeon_196_1_3:sleep()
	end
	battle_listener:stop()

	if dungeon_196_1_3[room_id].status == "success" then
		dungeon_196_1_3:debug("success")
	elseif dungeon_196_1_3[room_id].status == "fail" then
		dungeon_196_1_3:debug("fail")
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108949_03]", 0)
		boss:delFromPartition():sleep(3):addToPartition(room_id)
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcAI_108949(room_id)
	debugmsg(0, 0, "npcAI_108949")

	local boss = dungeon_196_1_3[room_id].boss
	local battle_listener = dungeon_196_1_3[room_id].battle_listener

	while dungeon_196_1_3[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			boss:useSkill("skill1", that(boss.attack_target_GUID))
			boss:useSkill("skill2")
			boss:useSkill("skill3")
			boss:useSkill("skill4")
			boss:useSkill("skill5", that(boss.attack_target_GUID))
			boss:useSkill("skill6")
			boss:useSkill("skill7")
			boss:useSkill("skill8")
		end
		dungeon_196_1_3:sleep()
	end
end

function npcAI_106133(room_id)
	debugmsg(0, 0, "npcAI_106133")

	local boss = dungeon_196_1_3[room_id].boss
	local holy_energy = dungeon_196_1_3[room_id].holy_energy
	local light_tree = dungeon_196_1_3[room_id].light_tree
	local dark_tree = dungeon_196_1_3[room_id].dark_tree

	local sleep_time = 3

	while dungeon_196_1_3[room_id].status == "fight" do
--		holy_energy:move(light_tree.x, light_tree.y, light_tree.z)

		if sleep_time == 10 then
			holy_energy.fight = true
			holy_energy:stopAttack()
			holy_energy:move(light_tree.x, light_tree.y, light_tree.z)
			sleep_time = 3
		end

		if holy_energy:distanceTo(dark_tree) < 20 and sleep_time == 3 then
			dungeon_196_1_3[room_id].boss:cancelBuff(625774)
			holy_energy.fight = false
			sleep_time = 10
		elseif holy_energy:distanceTo(dark_tree) >= 20 then
			dungeon_196_1_3[room_id].boss:addBuff(625774)
		end

		dungeon_196_1_3:sleep(sleep_time)
	end
	holy_energy.live_time = 1
	light_tree.live_time = 1
	dark_tree.live_time = 1
end