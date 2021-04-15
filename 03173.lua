function gmDungeon1973_create()
	local me = this()
	local boss = Christine.Npc:new():create(108964, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeonBuff_197_3()
	local me = this()
	me:systemCastSpell(me, 851998)
end
function gmDungeonBuff2_197_3()
	this():cancelBuff(625855)
	this():cancelBuff(625860)
end
function gmDungeonShadow_197_3()
	local target = this()
	local shadow = Christine.Npc:new()
	shadow:create(109075, target.x, target.y, target.z, 0)
	shadow.show_role_head = false
	shadow.hide_name = true
	shadow.hide_hp_mp = true
	shadow.mark = false
	shadow.fight = false
	shadow.search_enemy = false
	shadow.strike_back = false
	shadow:addBuff(625861)
	shadow:addToPartition(0)
	shadow:beginPlot("dungeonShadow_197_3", 2)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108964()
	local room_id = this().room_id
	dungeonInitialize_197_3(room_id)
	Cl_Resist_HackersBossNum()
end
function npcDead_108964()
	local room_id = this().room_id
	if not dungeon_197_3 or not dungeon_197_3[room_id] then
		debugmsg(0, 0, "not found dungeon_197_3")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108964_04]", 0)
	if dungeon_197_3[room_id].status == "fight" then
		dungeon_197_3[room_id].status = "success"
		Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108964()
	local room_id = this().room_id
	if not dungeon_197_3 or not dungeon_197_3[room_id] then
		debugmsg(0, 0, "not found dungeon_197_3")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108964_01]", 0)
	if dungeon_197_3[room_id].status == "ready" then
		dungeonActive_197_3(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108964()
	local room_id = this().room_id
	if not dungeon_197_3 or not dungeon_197_3[room_id] then
		debugmsg(0, 0, "not found dungeon_197_3")
		return false
	end
	if dungeon_197_3[room_id].status == "fight" then
		dungeon_197_3[room_id].status = "fail"
		dungeon_197_3[room_id].boss.search_enemy = false
		dungeon_197_3[room_id].boss.strike_back = false
		dungeon_197_3[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
-- 牢籠打破
function npcDead_109075()
	local room_id = this().room_id
	if not dungeon_197_3 or not dungeon_197_3[room_id] then
		debugmsg(0, 0, "not found dungeon_197_3")
		return false
	end
	dungeon_197_3:debug("npcDead_109075 remove buffs")

	if dungeon_197_3[room_id].jail_target:checkBuff(625855) then
		local buff_power = dungeon_197_3[room_id].jail_target.buff[625855].power
		if buff_power > 0 then
			buff_power = buff_power - 1
		end
		dungeon_197_3[room_id].jail_target:cancelBuff(625855)
		if buff_power > 0 then
			dungeon_197_3[room_id].jail_target:addBuff(625855, buff_power)
		end
	end
	
	dungeon_197_3[room_id].jail_target:cancelBuff(625860)
end
------------------------------------------------------------------
------------------------------------------------------------------
-- 呼吸困難結果
function magicObject_625856()
	local player = that()
	if player.buff[625856].power >= 2 or player:checkBuff(625857) then
		player:addBuff(625857)
		player:beginPlot("magicObject_625857")
	end
end
-- 窒息取消呼吸困難
function magicObject_625857()
	local player = that()
	player:cancelBuff(625856)
	return true
end
-- 雷雲結果
function magicObject_625854()
	local player = that()
	local boss = this()
	if player:checkBuff(625855) then
		boss:systemCastSpell(player, 851992, player.buff[625855].power or 0)
--		player:say("a")
	else
--		player:say("b")
	end
	debugmsg(0, 0, "magicObject_625854")
end
-- 電流麻痺
function magicObject_625859()
	local player = that()
	local r = RandRange(1, 100)
	if player:checkBuff(625859) then
		if player.buff[625859].power >= 2 then
			if r > 10 then
				player:addBuff(507158)
			end
		elseif player.buff[625859].power >= 1 then
			if r > 40 then
				player:addBuff(507158)
			end
		elseif player.buff[625859].power >= 0 then
			if r > 70 then
				player:addBuff(507158)
			end
		end
	end
end
-- 陰影後打雷
function dungeonShadow_197_3()
	local room_id = this().room_id

	if not dungeon_197_3 or not dungeon_197_3[room_id] then
		debugmsg(0, 0, "not found dungeon_197_3")
		return false
	end

	local shadow = this()
	dungeon_197_3[room_id].boss:systemCastSpell(shadow.x, shadow.y, shadow.z, 851991)
--	shadow:systemCastSpell(shadow.x, shadow.y, shadow.z, 851991)
	shadow:delete()
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_197_3()
	debugmsg(0, 0, "dungeonSetting_197_3")

	dungeon_197_3 = Christine.System:new("dungeon_197_3")
	dungeon_197_3.alpha = false
	dungeon_197_3.beta = false
	dungeon_197_3.delay = 1

	dungeon_197_3.skill = {}

--	漣漪
	dungeon_197_3.skill.skill1 = Christine.Skill:new()
	dungeon_197_3.skill.skill1.name = "skill1"
	dungeon_197_3.skill.skill1.cd = 7
	function dungeon_197_3.skill.skill1:active(caster, target)
		dungeon_197_3:sleep()
		return caster:castSpell(target, 851987)
	end

--	冰換水晶
	dungeon_197_3.skill.skill2 = Christine.Skill:new()
	dungeon_197_3.skill.skill2.name = "skill2"
	dungeon_197_3.skill.skill2.cd = 8
	function dungeon_197_3.skill.skill2:active(caster)
		dungeon_197_3:sleep()
		return caster:castSpell(caster, 851988)
	end

--	水勢甯珠
	dungeon_197_3.skill.skill3 = Christine.Skill:new()
	dungeon_197_3.skill.skill3.name = "skill3"
	dungeon_197_3.skill.skill3.cd = 13
	function dungeon_197_3.skill.skill3:active(caster, targets, current_target)
		local final_targets = {}
		for index, target in ipairs(targets) do
			if target.guid ~= current_target.guid then
				table.insert(final_targets, target)
			end
		end

		local target

		if #final_targets > 0 then
			target = table.random(final_targets, 1)[1]
		else
			target = current_target
		end

		local result = caster:systemCastSpell(target, 851989)

		if result then
			dungeon_197_3:debug("cast 851989 successful")
			local room_id = caster.room_id
			dungeon_197_3[room_id].jail_target = target
			dungeon_197_3[room_id].jail = Christine.Npc:new()
			dungeon_197_3[room_id].jail:create(109075, target.x, target.y, target.z, 0)
			dungeon_197_3[room_id].jail:addBuff(507370)--水牢特效
			dungeon_197_3[room_id].jail.search_enemy = false
			dungeon_197_3[room_id].jail.strike_back = false
			dungeon_197_3[room_id].jail.patrol = false
			dungeon_197_3[room_id].jail.movable = false
			dungeon_197_3[room_id].jail.live_time = 10
			dungeon_197_3[room_id].jail:addToPartition(room_id)
		end
		
		return result
	end

--	水勢但
	dungeon_197_3.skill.skill4 = Christine.Skill:new()
	dungeon_197_3.skill.skill4.name = "skill4"
	dungeon_197_3.skill.skill4.cd = 19
	function dungeon_197_3.skill.skill4:active(caster)
		return caster:castSpell(caster, 851990)
	end

--	陰影雷雲
	dungeon_197_3.skill.skill5 = Christine.Skill:new()
	dungeon_197_3.skill.skill5.name = "skill4"
	dungeon_197_3.skill.skill5.cd = 9
	function dungeon_197_3.skill.skill5:active(caster, targets)
		local target = table.random(targets, 1)[1]
		local shadow = Christine.Npc:new()
		shadow:create(109075, target.x, target.y, target.z, 0)
		shadow.show_role_head = false
		shadow.hide_name = true
		shadow.hide_hp_mp = true
		shadow.mark = false
		shadow.fight = false
		shadow.search_enemy = false
		shadow.strike_back = false
		shadow:addBuff(625861)
		shadow:addToPartition(caster.room_id)
		shadow:beginPlot("dungeonShadow_197_3", 2)
		return true
	end
end

function dungeonInitialize_197_3(room_id)
	debugmsg(0, 0, "dungeonInitialize_197_3")

	if not dungeon_197_3 then
		dungeonSetting_197_3()
	elseif dungeon_197_3.alpha then
		dungeonSetting_197_3()
	end

	dungeon_197_3[room_id] = {}
	dungeon_197_3[room_id].boss = this()
	dungeon_197_3[room_id].boss.search_enemy = true
	dungeon_197_3[room_id].boss.strike_back = true
	dungeon_197_3[room_id].boss.fight = true

	dungeon_197_3[room_id].boss:addSkill("skill1", dungeon_197_3.skill.skill1)
	dungeon_197_3[room_id].boss:addSkill("skill2", dungeon_197_3.skill.skill2)
	dungeon_197_3[room_id].boss:addSkill("skill3", dungeon_197_3.skill.skill3)
	dungeon_197_3[room_id].boss:addSkill("skill4", dungeon_197_3.skill.skill4)
	dungeon_197_3[room_id].boss:addSkill("skill5", dungeon_197_3.skill.skill5)

	dungeon_197_3[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_197_3[room_id].battle_listener:add(dungeon_197_3[room_id].boss)

	dungeon_197_3[room_id].status = "ready"
end

function dungeonActive_197_3(room_id)
	debugmsg(0, 0, "dungeonActive_197_3")

	dungeon_197_3[room_id].status = "fight"
	dungeon_197_3[room_id].boss:callPlot("dungeonMain_197_3", room_id)
	dungeon_197_3[room_id].boss:callPlot("npcAI_108964", room_id)
end

function dungeonMain_197_3(room_id)
	debugmsg(0, 0, "dungeonMain_197_3")

	local boss = dungeon_197_3[room_id].boss
	local battle_listener = dungeon_197_3[room_id].battle_listener
	local bbb = true
	while dungeon_197_3[room_id].status == "fight" do
		battle_listener:start()
		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108964_02]", 0)
			boss:addBuff(625798)
		end

		dungeon_197_3:sleep()
	end

	battle_listener:stop()

	if dungeon_197_3[room_id].status == "success" then
		dungeon_197_3:debug("success")
	elseif dungeon_197_3[room_id].status == "fail" then
		dungeon_197_3:debug("fail")
		ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108964_03]", 0)
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
		dungeonInitialize_197_3(room_id)
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcAI_108964(room_id)
	debugmsg(0, 0, "npcAI_108964")

	local boss = dungeon_197_3[room_id].boss
	local battle_listener = dungeon_197_3[room_id].battle_listener

	while dungeon_197_3[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill1", that(boss.attack_target_GUID)) then
			elseif boss:useSkill("skill2") then
			elseif boss:useSkill("skill3", battle_listener.players, that(boss.attack_target_GUID)) then
			elseif boss:useSkill("skill4") then
			elseif boss:useSkill("skill5", battle_listener.players) then
			end
		end
		dungeon_197_3:sleep()
	end
end