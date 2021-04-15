function gmDungeon1972_create()
	local me = this()
	local boss = Christine.Npc:new():create(108963, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1972_5hp()
	dungeon_197_2[this().room_id].boss.hp = dungeon_197_2[this().room_id].boss.hp - (dungeon_197_2[this().room_id].boss.max_hp * 0.051)
end
function gmDungeon1972_cast1()
	local me = this()
	me:castSpell(me, 852007)
end
function gmDungeon1972_cast2()
	local me = this()
	me:castSpell(me, 852006)
end
function gmDungeon1972_getBuff()
	this():addBuff(625899)
end
function gmDungeon1972_fog1()
	local me = this()
	local fog = Christine.Npc:new()
	fog:create(109082, me.x, me.y, me.z + 50, 0)
	fog.fight = false
	fog.strike_back = false
	fog.search_enemy = false
	fog.movable = false
	fog:addToPartition(0)
	fog:addBuff(625905)
	fog.live_time = 10
end
function gmDungeon1972_fog2()
	local me = this()
	local fog = Christine.Npc:new()
	fog:create(109082, me.x, me.y, me.z + 50, 0)
	fog.fight = false
	fog.strike_back = false
	fog.search_enemy = false
	fog.movable = false
	fog:addToPartition(0)
	fog:addBuff(625906)
	fog.live_time = 10
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108963()
	local room_id = this().room_id
	dungeonInitialize_197_2(room_id)
	Cl_Resist_HackersBossNum() 
end
function npcDead_108963()
	local room_id = this().room_id
	if not dungeon_197_2 or not dungeon_197_2[room_id] then
		debugmsg(0, 0, "not found dungeon_197_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108963_04]", 0)
	if dungeon_197_2[room_id].status == "fight" then
		dungeon_197_2[room_id].status = "success"
		Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108963()
	local room_id = this().room_id
	if not dungeon_197_2 or not dungeon_197_2[room_id] then
		debugmsg(0, 0, "not found dungeon_197_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108963_01]", 0)
	if dungeon_197_2[room_id].status == "ready" then
		dungeonActive_197_2(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108963()
	local room_id = this().room_id
	if not dungeon_197_2 or not dungeon_197_2[room_id] then
		debugmsg(0, 0, "not found dungeon_197_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108963_03]", 0)
	if dungeon_197_2[room_id].status == "fight" then
		dungeon_197_2[room_id].status = "fail"
		dungeon_197_2[room_id].boss.search_enemy = false
		dungeon_197_2[room_id].boss.strike_back = false
		dungeon_197_2[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
-- 假孩子
function npcDead_108671()
	local room_id = this().room_id
	if not dungeon_197_2 or not dungeon_197_2[room_id] then
		debugmsg(0, 0, "not found dungeon_197_2")
		return false
	end
	--dungeon_197_2[room_id].boss:beginPlot("dungeon_197_2_healing")
	local boss_hp = dungeon_197_2[room_id].boss.hp
	local boss_max_hp = dungeon_197_2[room_id].boss.max_hp
	if boss_hp > boss_max_hp * 0.01 then
		dungeon_197_2[room_id].boss.hp = boss_hp + boss_max_hp * 0.05
	end
	dungeon_197_2:debug("fake son dead")
end
function dungeon_197_2_healing()
	this():systemCastSpell(852012)
end
-- 真孩子
function npcDead_108678()
	local room_id = this().room_id
	if not dungeon_197_2 or not dungeon_197_2[room_id] then
		debugmsg(0, 0, "not found dungeon_197_2")
		return false
	end
	dungeon_197_2[room_id].boss:cancelBuff(625896)
	dungeon_197_2:debug("real son dead")
	if dungeon_197_2[room_id].son2 then dungeon_197_2[room_id].son2:delete() end
	if dungeon_197_2[room_id].son3 then dungeon_197_2[room_id].son3:delete() end
end
------------------------------------------------------------------
------------------------------------------------------------------
function magicObject_625897()
	local target = that()
	if target:checkBuff(625898) then
		target:cancelBuff(625898)
		target:systemCastSpell(target, 852013) -- 瀕死邊緣
		return false
	else
		return true
	end
end
function magicObject_625898()
	local target = that()
	if target:checkBuff(625897) then
		target:cancelBuff(625897)
		target:systemCastSpell(target, 852013) -- 瀕死邊緣
		return false
	else
		return true
	end
end
 -- 瀕死邊緣 檢查
function magicObject_625899a()
	local target = that()
	if target:checkBuff(625900) then
		return false
	else
		return true
	end
end
 -- 瀕死邊緣 結果
function magicObject_625899b()
	local target = that()
	target:addBuff(625900)
	target:cancelBuff(625897)
	target:cancelBuff(625898)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcRange_109082a()
	local player = this()
	local npc = that()
	npc:systemCastSpell(npc, 852008)
end
function npcRange_109082b()
	local player = this()
	local npc = that()
	npc:systemCastSpell(npc, 852009)
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_197_2()
	debugmsg(0, 0, "dungeonSetting_197_2")

	dungeon_197_2 = Christine.System:new("dungeon_197_2")
	dungeon_197_2.alpha = false
	dungeon_197_2.beta = false
	dungeon_197_2.delay = 1

	dungeon_197_2.skill = {}

--	重拳連打
	dungeon_197_2.skill.skill1 = Christine.Skill:new()
	dungeon_197_2.skill.skill1.name = "skill1"
	dungeon_197_2.skill.skill1.cd = 7
	function dungeon_197_2.skill.skill1:active(caster, target)
		dungeon_197_2:sleep()
		return caster:castSpell(target, 852004)
	end

--	毀滅衝擊波
	dungeon_197_2.skill.skill2 = Christine.Skill:new()
	dungeon_197_2.skill.skill2.name = "skill2"
	dungeon_197_2.skill.skill2.cd = 7
	function dungeon_197_2.skill.skill2:active(caster)
		dungeon_197_2:sleep()
		return caster:castSpell(caster, 852005)
	end

--	死亡幻想
	dungeon_197_2.skill.skill3 = Christine.Skill:new()
	dungeon_197_2.skill.skill3.name = "skill3"
	dungeon_197_2.skill.skill3.cd = 3
	function dungeon_197_2.skill.skill3:active(caster)
		dungeon_197_2:sleep()
		return caster:castSpell(caster, 852006)
	end

--	心靈操控
	dungeon_197_2.skill.skill4 = Christine.Skill:new()
	dungeon_197_2.skill.skill4.name = "skill4"
	dungeon_197_2.skill.skill4.cd = 9999
	function dungeon_197_2.skill.skill4:active(caster)
		dungeon_197_2:sleep()
		local result = caster:castSpell(caster, 852007)
		--local result = CastSpell(caster.guid, 852007, 0)
		if result then
			dungeon_197_2:sleep(5)
		end
		return result
	end

--	浪濤阻隔
	dungeon_197_2.skill.skill5 = Christine.Skill:new()
	dungeon_197_2.skill.skill5.name = "skill5"
	dungeon_197_2.skill.skill5.cd = 9999
	function dungeon_197_2.skill.skill5:active(caster, target)
		local room_id = caster.room_id
		if dungeon_197_2[room_id].son1 then dungeon_197_2[room_id].son1:delete() end
		if dungeon_197_2[room_id].son2 then dungeon_197_2[room_id].son2:delete() end
		if dungeon_197_2[room_id].son3 then dungeon_197_2[room_id].son3:delete() end
		caster:addBuff(625896)
		local npc, x, y, z, angle, distance
		for i = 1, 3 do
			angle = RandRange(1, 360) / 180 * math.pi
			distance = RandRange(10, 30)
			x = caster.x + math.cos(angle) * distance
			z = caster.z + math.sin(angle) * distance
			y = GetHeight(x, caster.y, z)
			npc = Christine.Npc:new()
			if i == 1 then
				npc:create(108678, x, y, z, 0)
				npc:addBuff(625901) -- 水核心
			else
				npc:create(108471, x, y, z, 0)
				npc:addBuff(625904)
			end
			npc:addBuff(625903)
			if RandRange(1, 2) == 1 then
				npc:addBuff(625902)
			end
			npc:addToPartition(caster.room_id)
			npc:attack(target)
			dungeon_197_2[caster.room_id]["son"..i] = npc
		end
		return true
	end
end

function dungeonInitialize_197_2(room_id)
	debugmsg(0, 0, "dungeonInitialize_197_2")

	if not dungeon_197_2 then
		dungeonSetting_197_2()
	elseif dungeon_197_2.alpha then
		dungeonSetting_197_2()
	end

	dungeon_197_2[room_id] = {}

	dungeon_197_2[room_id].boss = this()
	dungeon_197_2[room_id].boss.search_enemy = true
	dungeon_197_2[room_id].boss.strike_back = true
	dungeon_197_2[room_id].boss.fight = true

	dungeon_197_2[room_id].boss:addSkill("skill1", dungeon_197_2.skill.skill1)
	dungeon_197_2[room_id].boss:addSkill("skill2", dungeon_197_2.skill.skill2)
	dungeon_197_2[room_id].boss:addSkill("skill3", dungeon_197_2.skill.skill3)
	dungeon_197_2[room_id].boss:addSkill("skill4", dungeon_197_2.skill.skill4)
	dungeon_197_2[room_id].boss:addSkill("skill5", dungeon_197_2.skill.skill5)

	dungeon_197_2[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_197_2[room_id].battle_listener:add(dungeon_197_2[room_id].boss)

	dungeon_197_2[room_id].status = "ready"
end

function dungeonActive_197_2(room_id)
	debugmsg(0, 0, "dungeonActive_197_2")

	dungeon_197_2[room_id].status = "fight"
	dungeon_197_2[room_id].boss:callPlot("dungeonMain_197_2", room_id)
	dungeon_197_2[room_id].boss:callPlot("npcAI_108963", room_id)
end

function dungeonMain_197_2(room_id)
	debugmsg(0, 0, "dungeonMain_197_2")

	local boss = dungeon_197_2[room_id].boss
	local battle_listener = dungeon_197_2[room_id].battle_listener
	local bbb = true
	local flags = Christine.FlagGroup:new(781422)

	local hp_pointer = 0.45
	local hp_trigger = false

	dungeon_197_2[room_id].skill3_trigger = false
	local skill3_start_count = false
	local skill3_start_count_timestamp
	local skill3_end_count_timestamp

	while dungeon_197_2[room_id].status == "fight" do
		battle_listener:start()

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108963_02]", 0)
			boss:addBuff(625798)
		end

		if boss.hp < boss.max_hp * hp_pointer then
			hp_pointer = hp_pointer - 0.05
			boss.skill.skill4.cd_counter = 0
			if hp_trigger then
				boss.skill.skill5.cd_counter = 0
				hp_trigger = false
			else
				hp_trigger = true
			end
		end

		if skill3_start_count then
			if battle_listener.current_time - skill3_start_count_timestamp > 9 then
				skill3_start_count = false
				dungeon_197_2[room_id].skill3_trigger = true
				skill3_end_count_timestamp = battle_listener.current_time
			end
		else
			if not skill3_end_count_timestamp then
				skill3_end_count_timestamp = battle_listener.current_time
			end
			if battle_listener.current_time - skill3_end_count_timestamp > 10 then
				-- 產生迷霧
				local flags = Christine.FlagGroup:new(781436)
				local random_flags = table.random(flags, 2)
				dungeon_197_2[room_id].servant1 = Christine.Npc:new()
				dungeon_197_2[room_id].servant1:create(109082, random_flags[1].x, random_flags[1].y, random_flags[1].z, 0)
				dungeon_197_2[room_id].servant1.fight = false
				dungeon_197_2[room_id].servant1.strike_back = false
				dungeon_197_2[room_id].servant1.search_enemy = false
				dungeon_197_2[room_id].servant1.movable = false
				dungeon_197_2[room_id].servant1:addToPartition(room_id)
				dungeon_197_2[room_id].servant1:addRangePlot("npcRange_109082a", 30)
				dungeon_197_2[room_id].servant1:addBuff(625905)
				dungeon_197_2[room_id].servant1.live_time = 14
				dungeon_197_2[room_id].servant2 = Christine.Npc:new()
				dungeon_197_2[room_id].servant2:create(109082, random_flags[2].x, random_flags[2].y, random_flags[2].z, 0)
				dungeon_197_2[room_id].servant2.fight = false
				dungeon_197_2[room_id].servant2.strike_back = false
				dungeon_197_2[room_id].servant2.search_enemy = false
				dungeon_197_2[room_id].servant2.movable = false
				dungeon_197_2[room_id].servant2:addToPartition(room_id)
				dungeon_197_2[room_id].servant2:addRangePlot("npcRange_109082b", 30)
				dungeon_197_2[room_id].servant2:addBuff(625906)
				dungeon_197_2[room_id].servant2.live_time = 14
				skill3_start_count = true
				skill3_start_count_timestamp = battle_listener.current_time
			end
		end

		if dungeon_197_2[room_id].servant1 and dungeon_197_2[room_id].servant1.is_legal then
			for index, player in ipairs(battle_listener.players) do
				if player.is_player then
					if player:distanceTo(dungeon_197_2[room_id].servant1) < 30 then
						dungeon_197_2[room_id].servant1:systemCastSpell(852008)
					end
				end
			end
		end
		if dungeon_197_2[room_id].servant2 and dungeon_197_2[room_id].servant2.is_legal then
			for index, player in ipairs(battle_listener.players) do
				if player.is_player then
					if player:distanceTo(dungeon_197_2[room_id].servant2) < 30 then
						dungeon_197_2[room_id].servant2:systemCastSpell(852009)
					end
				end
			end
		end

		dungeon_197_2:sleep()
	end

	if dungeon_197_2[room_id].servant1 then dungeon_197_2[room_id].servant1:delete() end
	if dungeon_197_2[room_id].servant2 then dungeon_197_2[room_id].servant2:delete() end
	if dungeon_197_2[room_id].son1 then dungeon_197_2[room_id].son1:delete() end
	if dungeon_197_2[room_id].son2 then dungeon_197_2[room_id].son2:delete() end
	if dungeon_197_2[room_id].son3 then dungeon_197_2[room_id].son3:delete() end

	battle_listener:stop()

	if dungeon_197_2[room_id].status == "success" then
		dungeon_197_2:debug("success")
	elseif dungeon_197_2[room_id].status == "fail" then
		dungeon_197_2:debug("fail")
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
		dungeonInitialize_197_2(room_id)
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcAI_108963(room_id)
	debugmsg(0, 0, "npcAI_108963")

	local boss = dungeon_197_2[room_id].boss
	local battle_listener = dungeon_197_2[room_id].battle_listener

	while dungeon_197_2[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if dungeon_197_2[room_id].skill3_trigger and boss:useSkill("skill3") then
				dungeon_197_2[room_id].skill3_trigger = false
			elseif boss:useSkill("skill5", that(boss.attack_target_GUID)) then
			elseif boss:useSkill("skill4") then
			elseif boss:useSkill("skill1", that(boss.attack_target_GUID)) then
			elseif boss:useSkill("skill2") then
			end
		end
		dungeon_197_2:sleep()
	end
end