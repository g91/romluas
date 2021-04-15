------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function gm_dungeon_196_1_1_create()
	local me = this()
	local boss = Christine.Npc:new()
	boss:create(108947, me.x, me.y, me.z)
	boss:addToPartition(me.room_id)
end

function gm_dungeon_196_1_1_step_2()
	local me = this()
	dungeon_196_1_1[me.room_id].boss.hp = dungeon_196_1_1[me.room_id].boss.max_hp * 0.5
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcCreate_108947()
	debugmsg(0, 0, "npcCreateEvent_108947")
	dungeonInitialize_196_1_1(this().room_id)
	Cl_Resist_HackersBossNum()
end

function npcDead_108947()
	debugmsg(0, 0, "npcDeadEvent_108947")
	if dungeon_196_1_1 and dungeon_196_1_1[this().room_id] and dungeon_196_1_1[this().room_id].status == "fight" then
		dungeon_196_1_1[this().room_id].status = "success"
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108947_04]", 0)
	end
	Cl_Resist_HackersBossDead()
end

function npcBeginFight_108947()
	debugmsg(0, 0, "npcBeginFightEvent_108947")
	if dungeon_196_1_1 and dungeon_196_1_1[this().room_id] and dungeon_196_1_1[this().room_id].status ~= "fight" then
		dungeonActive_196_1_1(this().room_id)
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108947_01]", 0)
	else
		debugmsg(0, 0, "!!!!!!!!!!!!!!!!!!!!!!!"..type(dungeon_196_1_1))
		debugmsg(0, 0, "!!!!!!!!!!!!!!!!!!!!!!!"..type(dungeon_196_1_1[this().room_id]))
	end
end

function npcEndFight_108947()
	debugmsg(0, 0, "npcEndFightEvent_108947")
	if dungeon_196_1_1 and dungeon_196_1_1[this().room_id] and dungeon_196_1_1[this().room_id].status == "fight" then
		dungeon_196_1_1[this().room_id].status = "fail"
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcBeAttacked_108993(_base_magic_id, _damage)
	debugmsg(0, 0, "npcBeAttackedEvent_108993 : _base_magic_id = ".._base_magic_id..", _damage = ".._damage)
	local npc = this()
	local player = that(npc.register1)
	npc:systemCastSpell(player, 851868, _damage)
	return _damage
end

function npcDead_108993()
	debugmsg(0, 0, "npcDeadEvent_108993")
	local npc = this()
	local player = that(npc.register1)
	player:cancelBuff(625771)
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function dungeonInitialize_196_1_1(room_id)
	debugmsg(0, 0, "dungeonInitialize_196_1_1")

	if not dungeon_196_1_1 then
		dungeonSetting_196_1_1()
	elseif  dungeon_196_1_1.alpha then
		--
		dungeonSetting_196_1_1()
	end

	dungeon_196_1_1[room_id] = {}

	dungeon_196_1_1[room_id].boss = this()
	dungeon_196_1_1[room_id].status = "ready"
	dungeon_196_1_1[room_id].step = 1

	for orgid, buff in pairs(dungeon_196_1_1[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_196_1_1[room_id].boss:addSkill("skill1", dungeon_196_1_1.skill.skill1)
	dungeon_196_1_1[room_id].boss:addSkill("skill2", dungeon_196_1_1.skill.skill2)
	dungeon_196_1_1[room_id].boss:addSkill("skill3", dungeon_196_1_1.skill.skill3)
	dungeon_196_1_1[room_id].boss:addSkill("skill4", dungeon_196_1_1.skill.skill4)
	dungeon_196_1_1[room_id].boss:addSkill("skill5", dungeon_196_1_1.skill.skill5):lock()

	dungeon_196_1_1[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_196_1_1[room_id].battle_listener:add(dungeon_196_1_1[room_id].boss)

end

function dungeonSetting_196_1_1()
	debugmsg(0, 0, "dungeonSetting_196_1_1")

	dungeon_196_1_1 = Christine.System:new("dungeon_196_1_1")
	dungeon_196_1_1.alpha = false
	dungeon_196_1_1.beta = true
	dungeon_196_1_1.delay = 1

	dungeon_196_1_1.skill = {}

	-- 刺穿
	dungeon_196_1_1.skill.skill1 = Christine.Skill:new()
	dungeon_196_1_1.skill.skill1.name = "skill1"
	dungeon_196_1_1.skill.skill1.cd = 5
	function dungeon_196_1_1.skill.skill1:active(caster, target)
		dungeon_196_1_1:debug("useSkill : "..self.name)
		dungeon_196_1_1:sleep(2)
		return caster:castSpell(target, 851841)
	end

	-- 地面截擊
	dungeon_196_1_1.skill.skill2 = Christine.Skill:new()
	dungeon_196_1_1.skill.skill2.name = "skill2"
	dungeon_196_1_1.skill.skill2.cd = 7
	function dungeon_196_1_1.skill.skill2:active(caster, targets)
		dungeon_196_1_1:debug("useSkill : "..self.name)
		local select_targets = {}
		if #targets > 2 then
			for index, target in ipairs(targets) do
				if target.guid ~= caster.attack_target_GUID then
					table.insert(select_targets, target)
				end
			end
		else
			select_targets = targets
		end
		if #select_targets > 0 then
			dungeon_196_1_1:sleep(2)
			for index, target in ipairs(select_targets) do
				if index == 1 then
					caster:castSpell(target, 851842)
				else
					caster:systemCastSpell(target, 851842)
				end
			end
			return true
		else
			return false
		end
	end

	-- 破地震攝
	dungeon_196_1_1.skill.skill3 = Christine.Skill:new()
	dungeon_196_1_1.skill.skill3.name = "skill3"
	dungeon_196_1_1.skill.skill3.cd = 13
	function dungeon_196_1_1.skill.skill3:active(caster)
		dungeon_196_1_1:debug("useSkill : "..self.name)
		dungeon_196_1_1:sleep(1)
		return caster:castSpell(caster, 851844)
	end

	-- 蟲蝕
	dungeon_196_1_1.skill.skill4 = Christine.Skill:new()
	dungeon_196_1_1.skill.skill4.name = "skill4"
	dungeon_196_1_1.skill.skill4.cd = 17
	function dungeon_196_1_1.skill.skill4:active(caster, targets)
		dungeon_196_1_1:debug("useSkill : "..self.name)
		local _bug
		for index, target in ipairs(targets) do
			_bug = Christine.Npc:new()
			_bug:create(108994, caster.x, caster.y, caster.z, caster.direction)
			_bug:addToPartition(caster.room_id)
			_bug.search_enemy = false
			_bug.strike_back = false
			_bug:callPlot("npcAI_108994", caster.room_id, target.guid)
--			dungeon_196_1_1[caster.room_id].battle_listener:add(_bug)
		end
		return true
	end

	-- 共生
	dungeon_196_1_1.skill.skill5 = Christine.Skill:new()
	dungeon_196_1_1.skill.skill5.name = "skill5"
	dungeon_196_1_1.skill.skill5.cd = 32
	function dungeon_196_1_1.skill.skill5:active(caster, targets)
		dungeon_196_1_1:debug("useSkill : "..self.name)
		dungeon_196_1_1:sleep(1)
		local target = table.random(targets, 1)[1]
		--caster:castSpell(target, 851871)
		target:addBuff(625771)
		local npc = Christine.Npc:create(108993, target.x, target.y, target.z, target.direction)
		npc.search_enemy = false
		npc.strike_back = false
		npc.movable = false
		npc.live_time = 25
		npc.register1 = target.guid
		npc:addToPartition(caster.room_id)
		return true
	end
end

function dungeonActive_196_1_1(room_id)
	debugmsg(0, 0, "dungeonActive_196_1_1")

	dungeon_196_1_1[room_id].status = "fight"
	dungeon_196_1_1[room_id].boss:callPlot("dungeonMain_196_1_1", room_id)
	dungeon_196_1_1[room_id].boss:callPlot("npcAI_108947", room_id)
	
	return true
end

function dungeonMain_196_1_1(room_id)
	debugmsg(0, 0, "dungeonMain_196_1_1")

	local boss = dungeon_196_1_1[room_id].boss
	local battle_listener = dungeon_196_1_1[room_id].battle_listener

	local bbb = true

	while dungeon_196_1_1[room_id].status == "fight" do
		battle_listener:start()

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108947_02]", 0)
			boss:addBuff(625770)
		end

		if dungeon_196_1_1[room_id].step == 1 and boss.hp < boss.max_hp * 0.51 then
			dungeon_196_1_1[room_id].step = 2
			boss.skill.skill5:unlock()
			debugmsg(0, 0, "change step 2")
		end

		dungeon_196_1_1:sleep()
	end
	battle_listener:stop()

	if dungeon_196_1_1[room_id].status == "success" then
		dungeon_196_1_1:debug("success")
	elseif dungeon_196_1_1[room_id].status == "fail" then
		dungeon_196_1_1:debug("fail")
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_108947_03]", 0)
		boss:delFromPartition():sleep(3):addToPartition(room_id)
	end
end

------------------------------------------------------------------------------
--
------------------------------------------------------------------------------

function npcAI_108947(room_id)
	debugmsg(0, 0, "npcAI_108947")

	local boss = dungeon_196_1_1[room_id].boss
	local battle_listener = dungeon_196_1_1[room_id].battle_listener

	while dungeon_196_1_1[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			boss:useSkill("skill1", that(boss.attack_target_GUID))
			boss:useSkill("skill2", battle_listener.players)
			boss:useSkill("skill3")
			boss:useSkill("skill4", battle_listener.players)
			if dungeon_196_1_1[room_id].step == 2 then
				boss:useSkill("skill5", battle_listener.players)
			end
		end
		dungeon_196_1_1:sleep()
	end
end

function npcAI_108994(room_id, target_guid)
	debugmsg(0, 0, "npcAI_108994 : room_id = "..room_id..", target_guid = "..target_guid)
	local bug = this()

	if not dungeon_196_1_1 or not dungeon_196_1_1[room_id] then
		debugmsg(0, 0, "not found dungeon_196_1_1...")
		bug.live_time = 0
		return false
	end

	local target = that(target_guid)
	dungeon_196_1_1:debug("npcAI_108994 : loop start")
	while dungeon_196_1_1[room_id].status == "fight" do
		bug:stopAttack()
		bug:move(target.x, target.y, target.z)
		if bug:distanceTo(target) < 25 then
			break
		end
		dungeon_196_1_1:sleep()
	end
	dungeon_196_1_1:debug("npcAI_108994 : loop end")
	bug:castSpell(bug, 851843)
	bug.live_time = 3
	return true
end
