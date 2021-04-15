function gmDungeon1991_create()
	local me = this()
	local boss = Christine.Npc:new():create(108988, me.x, me.y, me.z, 0):addToPartition(0)
end

function gmDungeon1991_addbuff()
	 dungeon_199_1[this().room_id].boss1:addBuff(626267)
end

function gmDungeon1991_castspell()
	 dungeon_199_1[this().room_id].boss1:castSpell(852234)
end

function gmDungeon1991_clearglobal()
	dungeon_199_1 = nil
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108988()
	local room_id = this().room_id
	SetModeEx( OwnerID() , EM_SetModeType_Mark, true )
	SetModeEx( OwnerID() , EM_SetModeType_Show, true )--是否繪製出模型
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not dungeon_199_1 or not dungeon_199_1["..room_id.."]")
		dungeonInitialize_199_1(room_id)
--	elseif dungeon_199_1[room_id].handler_orgid == this().ORGID then
--		debugmsg(0, 0, "dungeon_199_1[room_id].handler_orgid == 108988")
--		dungeonInitialize_199_1(room_id)
	end
end
function npcDead_108988()
	debugmsg(0, 0, "--npcDead_108988--")
	local room_id = this().room_id
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not found dungeon_199_1")
		return false
	end

	local boss, another_boss
	local another_boss_is_dead = true
	if dungeon_199_1[room_id].boss1.guid == this().guid then
		boss = dungeon_199_1[room_id].boss1
		another_boss = dungeon_199_1[room_id].boss2
		dungeon_199_1[room_id].boss1dead = true
		if not dungeon_199_1[room_id].boss2dead then
			another_boss_is_dead = false
		end
		debugmsg(0, 0, "boss1 dead")
	else
		boss = dungeon_199_1[room_id].boss2
		another_boss = dungeon_199_1[room_id].boss1
		dungeon_199_1[room_id].boss2dead = true
		if not dungeon_199_1[room_id].boss1dead then
			another_boss_is_dead = false
		end
		debugmsg(0, 0, "boss2 dead")
	end

	if not another_boss_is_dead then
		debugmsg(0, 0, "another_boss alive")
		if dungeon_199_1[room_id].handler_orgid == boss.ORGID then
			another_boss:callPlot("dungeonMain_199_1", room_id)
			dungeon_199_1[room_id].handler_orgid = another_boss.ORGID
			debugmsg(0, 0, "change handler, dungeon_199_1["..room_id.."].handler_orgid = "..dungeon_199_1[room_id].handler_orgid..", type = "..type(dungeon_199_1[room_id].handler_orgid))
		end
--		WriteRoleValue( dungeon_199_1[room_id].boss2.guid ,  EM_RoleValue_Register + 1 , 1 );
--		local boss1 = this()
--		boss1.search_enemy = false
--		boss1.strike_back = false
--		boss1.fight = false
--		boss1:stopAttack()
--		boss1:beginPlot("npcDead_108988_wait")
--		--PlayMotion(boss1.guid, ruFUSION_ACTORSTATE_DEAD)
--		PlayMotionEX(boss1.guid, ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD)
--		return false
	else
		debugmsg(0, 0, "another_boss dead")
		if not dungeon_199_1[room_id].created_treasure then
			debugmsg(0, 0, "create treasure")
			Christine.Npc:new():create(
				108458,
				boss.x,
				boss.y,
				boss.z,
				0
			):addToPartition(room_id)
			dungeon_199_1[room_id].created_treasure = true
		end
	end
	return true
end

--function npcDead_108988_wait()
--	debugmsg(0, 0, "--npcDead_108988_wait--")
--	local room_id = this().room_id
--	local boss1 = this();
--	if not dungeon_199_1 or not dungeon_199_1[room_id] then
--		debugmsg(0, 0, "not found dungeon_199_1")
--		return false
--	end
--
--	while not dungeon_199_1[room_id].boss2.is_dead and ReadRoleValue( dungeon_199_1[room_id].boss2.guid ,  EM_RoleValue_Register + 1 ) == 1 do
--		debugmsg(0, 0, "--")
--		SetModeEx( boss1.guid , EM_SetModeType_Mark, false )
--		SetModeEx( boss1.guid , EM_SetModeType_Show, false )--是否繪製出模型
--		dungeon_199_1:sleep()
--	end
--
--	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108988_04]", 0)
--	if dungeon_199_1[room_id].status == "fight" then
--		dungeon_199_1[room_id].status = "success"
--		--Cl_Resist_HackersBossDead()
--	elseif dungeon_199_1[room_id].status == "fail" then
--		PlayMotion(boss1.guid, ruFUSION_ACTORSTATE_REVIVING)
--	end
----	SetModeEx( boss1.guid , EM_SetModeType_Mark, true )
----	SetModeEx( boss1.guid , EM_SetModeType_Show, true )--是否繪製出模型
----	SetDefIdleMotion(dungeon_199_1[room_id].boss1.guid, ruFUSION_MIME_DEATH_DOWN)
----	this():kill(this())
----	SetDefIdleMotion(dungeon_199_1[room_id].boss1.guid, ruFUSION_MIME_DEATH_DOWN)
--end

function npcBeginFight_108988()
	local room_id = this().room_id
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not found dungeon_199_1")
		return false
	end
	this():addBuff(626267)
	if dungeon_199_1[room_id].status ~= "ready" then
		debugmsg(0, 0, "108988 fight has began")
	else
		debugmsg(0, 0, "108988 begin fight")
		ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108988_01]", 0)
		dungeonActive_199_1(room_id)
	end
	dungeon_199_1[room_id].boss2:attack(that(dungeon_199_1[room_id].boss1.attack_target_GUID))
	dungeon_199_1[room_id].boss1:attack(that(dungeon_199_1[room_id].boss2.attack_target_GUID))
end
function npcEndFight_108988()
	local room_id = this().room_id
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not found dungeon_199_1")
		return false
	end
--	local boss2_attack_target_guid = dungeon_199_1[room_id].boss2.attack_target_GUID
--	if boss2_attack_target_guid ~= 0 then
--		this():attack(that(boss2_attack_target_guid))
--		return false
--	end
	--dungeon_199_1[room_id].boss2:attack(that(dungeon_199_1[room_id].boss1.attack_target_GUID))
	--dungeon_199_1[room_id].boss1:attack(that(dungeon_199_1[room_id].boss2.attack_target_GUID))
end
function npcCreate_108989()
	local room_id = this().room_id
	debugmsg(0, 0, "npcCreate_108989, dungeon_199_1["..room_id.."].handler_orgid = "..dungeon_199_1[room_id].handler_orgid..", type = "..type(dungeon_199_1[room_id].handler_orgid))
--	if dungeon_199_1 and dungeon_199_1[room_id] and dungeon_199_1[room_id].handler_orgid == this().ORGID then
--		debugmsg(0, 0, "dungeon_199_1[room_id].handler_orgid == 108989")
--		dungeonInitialize_199_1(room_id)
--	end
	Cl_Resist_HackersBossNum()
end
function npcDead_108989()
	local room_id = this().room_id
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not found dungeon_199_1")
		return false
	end

	local boss, another_boss
	local another_boss_is_dead = true
	if dungeon_199_1[room_id].boss1.guid == this().guid then
		boss = dungeon_199_1[room_id].boss1
		another_boss = dungeon_199_1[room_id].boss2
		dungeon_199_1[room_id].boss1dead = true
		if not dungeon_199_1[room_id].boss2dead then
			another_boss_is_dead = false
		end
		debugmsg(0, 0, "boss1 dead")
	else
		boss = dungeon_199_1[room_id].boss2
		another_boss = dungeon_199_1[room_id].boss1
		dungeon_199_1[room_id].boss2dead = true
		if not dungeon_199_1[room_id].boss1dead then
			another_boss_is_dead = false
		end
		debugmsg(0, 0, "boss2 dead")
	end

	if not another_boss_is_dead then
		debugmsg(0, 0, "another_boss alive")
		if dungeon_199_1[room_id].handler_orgid == boss.ORGID then
			another_boss:callPlot("dungeonMain_199_1", room_id)
			dungeon_199_1[room_id].handler_orgid = another_boss.ORGID
			debugmsg(0, 0, "change handler, dungeon_199_1["..room_id.."].handler_orgid = "..dungeon_199_1[room_id].handler_orgid..", type = "..type(dungeon_199_1[room_id].handler_orgid))
		end
--		WriteRoleValue( dungeon_199_1[room_id].boss2.guid ,  EM_RoleValue_Register + 1 , 1 );
--		local boss1 = this()
--		boss1.search_enemy = false
--		boss1.strike_back = false
--		boss1.fight = false
--		boss1:stopAttack()
--		boss1:beginPlot("npcDead_108988_wait")
--		--PlayMotion(boss1.guid, ruFUSION_ACTORSTATE_DEAD)
--		PlayMotionEX(boss1.guid, ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD)
--		return false
	else
		debugmsg(0, 0, "another_boss dead")
		if not dungeon_199_1[room_id].created_treasure then
			debugmsg(0, 0, "create treasure")
			Christine.Npc:new():create(
				108458,
				boss.x,
				boss.y,
				boss.z,
				0
			):addToPartition(room_id)
			dungeon_199_1[room_id].created_treasure = true
		end
	end
	Cl_Resist_HackersBossDead()
	return true
end
function npcBeginFight_108989()
	local room_id = this().room_id
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not found dungeon_199_1")
		return false
	end
	this():addBuff(626268)
	if dungeon_199_1[room_id].status ~= "ready" then
		debugmsg(0, 0, "108989 fight has began")
	else
		debugmsg(0, 0, "108989 begin fight")
		ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108988_01]", 0)
		dungeonActive_199_1(room_id)
		--Cl_Resist_HackersFightBegin()
	end
	dungeon_199_1[room_id].boss2:attack(that(dungeon_199_1[room_id].boss1.attack_target_GUID))
	dungeon_199_1[room_id].boss1:attack(that(dungeon_199_1[room_id].boss2.attack_target_GUID))
end
function npcEndFight_108989()
	local room_id = this().room_id
	if not dungeon_199_1 or not dungeon_199_1[room_id] then
		debugmsg(0, 0, "not found dungeon_199_1")
		return false
	end
--	local boss1_attack_target_guid = dungeon_199_1[room_id].boss1.attack_target_GUID
--	if boss1_attack_target_guid ~= 0 then
--		this():attack(that(boss1_attack_target_guid))
--		return false
--	end
	--dungeon_199_1[room_id].boss2:attack(that(dungeon_199_1[room_id].boss1.attack_target_GUID))
	--dungeon_199_1[room_id].boss1:attack(that(dungeon_199_1[room_id].boss2.attack_target_GUID))
end
------------------------------------------------------------------
------------------------------------------------------------------
function magicObject_626208()
	local room_id = this().room_id
	if dungeon_199_1[room_id].boss2dead then
		return false
	end
	if ReadRoleValue(TargetID(), EM_RoleValue_OrgID) == 108989 then
		return true
	end
	return false
end
function magicObject_626208r()
	local room_id = this().room_id
	local targets = table.random(dungeon_199_1[room_id].battle_listener.players, 2)
	for index, target in ipairs(targets) do
		dungeon_199_1[room_id].boss1:systemCastSpell(target.x, target.y, target.z, 852235)
	end
end
function magicObject_626217()
	local room_id = this().room_id
	if dungeon_199_1[room_id].boss1dead then
		return false
	end
	if ReadRoleValue(TargetID(), EM_RoleValue_OrgID) == 108988 then
		return true
	end
	return false
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_199_1()
	debugmsg(0, 0, "dungeonSetting_199_1")
	dungeon_199_1 = Christine.System:new("dungeon_199_1")
	dungeon_199_1.alpha = false
	dungeon_199_1.beta = true
	dungeon_199_1.delay = 1

	dungeon_199_1.flags = Christine.FlagGroup:new(781441)

	local position_fix_reference = this() -- 108988
	dungeon_199_1.position_fixed = {
		x = position_fix_reference.x,
		y = position_fix_reference.y,
		z = position_fix_reference.z,
--		direction = position_fix_reference.direction
		direction = 180;
	}

	debugmsg(0, 0, "direction="..position_fix_reference.direction)

	dungeon_199_1.skill = {}

--	碧雅娜恩賜, 禮讚	對另一隻BOSS放
--	dungeon_199_1.skill.skill1 = Christine.Skill:new()
--	dungeon_199_1.skill.skill1.name = "skill1"
--	dungeon_199_1.skill.skill1.cd = 20
--	function dungeon_199_1.skill.skill1:active(caster, target)
--		--caster:say(self.name)
--		return caster:castSpell(target, 852153)
--	end

--	崩擊
	dungeon_199_1.skill.skill2 = Christine.Skill:new()
	dungeon_199_1.skill.skill2.name = "skill2"
	dungeon_199_1.skill.skill2.cd = 13
	function dungeon_199_1.skill.skill2:active(caster, target)
		--caster:say(self.name)
		return caster:castSpell(target, 852236)
	end

--	碧雅娜聖典
	dungeon_199_1.skill.skill3 = Christine.Skill:new()
	dungeon_199_1.skill.skill3.name = "skill3"
	dungeon_199_1.skill.skill3.cd = 17
	function dungeon_199_1.skill.skill3:active(caster, targets)
		--caster:say(self.name)
		local target = table.random(targets, 1)[1]
--		if caster:attack(target) and caster:castSpell(target, 852237) then	
		if caster:castSpell(target, 852237) then
--			debugmsg(0, 0, "caster="..caster.guid)
--			debugmsg(0, 0, "target="..TargetID())
			SetAttack( caster.guid , target.guid )
			return true
		else
			return  false
		end
	end

--	極善之殤
	dungeon_199_1.skill.skill4 = Christine.Skill:new()
	dungeon_199_1.skill.skill4.name = "skill4"
	dungeon_199_1.skill.skill4.cd = 19
	function dungeon_199_1.skill.skill4:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852238)
	end

--	莎多薩咒言	對另一隻BOSS放
--	dungeon_199_1.skill.skill5 = Christine.Skill:new()
--	dungeon_199_1.skill.skill5.name = "skill5"
--	dungeon_199_1.skill.skill5.cd = 20
--	function dungeon_199_1.skill.skill5:active(caster, target)
--		--caster:say(self.name)
--		return caster:castSpell(target, 852153)
--	end

--	咒血沸騰
	dungeon_199_1.skill.skill6 = Christine.Skill:new()
	dungeon_199_1.skill.skill6.name = "skill6"
	dungeon_199_1.skill.skill6.cd = 7
	function dungeon_199_1.skill.skill6:active(caster, target)
		--caster:say(self.name)
		return caster:castSpell(target, 852240)
	end

--	莎多薩噩念
	dungeon_199_1.skill.skill7 = Christine.Skill:new()
	dungeon_199_1.skill.skill7.name = "skill7"
	dungeon_199_1.skill.skill7.cd = 17
	function dungeon_199_1.skill.skill7:active(caster, targets)
		--caster:say(self.name)
		local target = table.random(targets, 1)[1]
--		if caster:attack(target) and caster:castSpell(target, 852241) then
		if caster:castSpell(target, 852241) then
			SetAttack( caster.guid , target.guid )
			return true
		else
			return  false
		end
	end

--	極惡之慟
	dungeon_199_1.skill.skill8 = Christine.Skill:new()
	dungeon_199_1.skill.skill8.name = "skill8"
	dungeon_199_1.skill.skill8.cd = 23
	function dungeon_199_1.skill.skill8:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852242)
	end
end

function dungeonInitialize_199_1(room_id)
	debugmsg(0, 0, "dungeonInitialize_199_1")

	if not dungeon_199_1 then
		dungeonSetting_199_1()
	end
	if dungeon_199_1.alpha then
		dungeonSetting_199_1()
	end

	SetModeEx( OwnerID() , EM_SetModeType_Mark, true )
	SetModeEx( OwnerID() , EM_SetModeType_Show, true )--是否繪製出模型

	dungeon_199_1[room_id] = {}
	dungeon_199_1[room_id].boss1 = this() -- 108988 or 108989
	dungeon_199_1[room_id].boss1.hp = dungeon_199_1[room_id].boss1.max_hp
	dungeon_199_1[room_id].boss1.search_enemy = true
	dungeon_199_1[room_id].boss1.strike_back = true
	dungeon_199_1[room_id].boss1.fight = true
	dungeon_199_1[room_id].boss1.patrol = false

	debugmsg(0, 0, "-----dungeonInitialize_199_1")
	debugmsg(0, 0, "----"..dungeon_199_1[room_id].boss1.guid)
	
	--dungeon_199_1[room_id].boss1:beginPlot("dungeonFixPosition_199_1", 2)

	for orgid, buff in pairs(dungeon_199_1[room_id].boss1.buff) do
		buff:remove(false)
	end

	dungeon_199_1[room_id].boss2 = Christine.Npc:new() -- 108988 or 108989
	dungeon_199_1:debug("dungeon_199_1[room_id].boss1.ORGID = "..dungeon_199_1[room_id].boss1.ORGID)
	if dungeon_199_1[room_id].boss1.ORGID == 108988 then
		dungeon_199_1:debug("boss1 is 108988")
		dungeon_199_1[room_id].boss2:create(108989, 1328, -83.5, -1728, 134):addToPartition(room_id)
		dungeon_199_1[room_id].boss1:changePosition(1348.9, -83.5, -1997.9, 183) -- 108988
		--dungeon_199_1[room_id].boss2:create(108989, 480, -257.2, 480, 0):addToPartition(room_id) -- 測試區
		--dungeon_199_1[room_id].boss1:changePosition(677, -257.2, 480, 0) -- 108988
		--dungeon_199_1[room_id].boss2:create(108989, dungeon_199_1[room_id].boss1.x, dungeon_199_1[room_id].boss1.y, dungeon_199_1[room_id].boss1.z, 134):addToPartition(room_id)
	else
		dungeon_199_1:debug("boss1 is 108989")
		dungeon_199_1[room_id].boss2:create(108988, 1348.9, -83.5, -1997.9, 183):addToPartition(room_id) -- 108988
		dungeon_199_1[room_id].boss1:changePosition(1328, -83.5, -1728, 134)
		--dungeon_199_1[room_id].boss2:create(108988, 677, -257.2, 480, 0):addToPartition(room_id) -- 測試區
		--dungeon_199_1[room_id].boss1:changePosition(480, -257.2, 480, 0)
		--dungeon_199_1[room_id].boss2:create(108988, dungeon_199_1[room_id].boss1.x, dungeon_199_1[room_id].boss1.y, dungeon_199_1[room_id].boss1.z, 134):addToPartition(room_id)
	end
	dungeon_199_1[room_id].boss2.search_enemy = true
	dungeon_199_1[room_id].boss2.strike_back = true
	dungeon_199_1[room_id].boss2.fight = true
	dungeon_199_1[room_id].boss2.patrol = false
	--dungeon_199_1[room_id].boss2.patrol = false

	WriteRoleValue( dungeon_199_1[room_id].boss2.guid ,  EM_RoleValue_Register + 1 , 0 );

	if dungeon_199_1[room_id].boss1.ORGID == 108988 then
		dungeon_199_1[room_id].boss1:addSkill("skill2", dungeon_199_1.skill.skill2)
		dungeon_199_1[room_id].boss1:addSkill("skill3", dungeon_199_1.skill.skill3)
		dungeon_199_1[room_id].boss1:addSkill("skill4", dungeon_199_1.skill.skill4)

		dungeon_199_1[room_id].boss2:addSkill("skill6", dungeon_199_1.skill.skill6)
		dungeon_199_1[room_id].boss2:addSkill("skill7", dungeon_199_1.skill.skill7)
		dungeon_199_1[room_id].boss2:addSkill("skill8", dungeon_199_1.skill.skill8)
		dungeon_199_1[room_id].anti_hacker = dungeon_199_1[room_id].boss2.guid
	else
		dungeon_199_1[room_id].boss2:addSkill("skill2", dungeon_199_1.skill.skill2)
		dungeon_199_1[room_id].boss2:addSkill("skill3", dungeon_199_1.skill.skill3)
		dungeon_199_1[room_id].boss2:addSkill("skill4", dungeon_199_1.skill.skill4)

		dungeon_199_1[room_id].boss1:addSkill("skill6", dungeon_199_1.skill.skill6)
		dungeon_199_1[room_id].boss1:addSkill("skill7", dungeon_199_1.skill.skill7)
		dungeon_199_1[room_id].boss1:addSkill("skill8", dungeon_199_1.skill.skill8)
		dungeon_199_1[room_id].anti_hacker = dungeon_199_1[room_id].boss1.guid
	end

	dungeon_199_1[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_199_1[room_id].battle_listener:add(dungeon_199_1[room_id].boss1)
	dungeon_199_1[room_id].battle_listener:add(dungeon_199_1[room_id].boss2)

	dungeon_199_1[room_id].status = "ready"
	dungeon_199_1[room_id].boss1dead = false
	dungeon_199_1[room_id].boss2dead = false
	dungeon_199_1[room_id].bbb = true
	dungeon_199_1[room_id].handler_orgid = this().ORGID
	dungeon_199_1[room_id].created_treasure = false
end

function dungeonFixPosition_199_1()
	local room_id = this().room_id
	if dungeon_199_1.position_fixed then
		dungeon_199_1[room_id].boss1:changePosition(
			dungeon_199_1.position_fixed.x,
			dungeon_199_1.position_fixed.y,
			dungeon_199_1.position_fixed.z,
			180)
--			dungeon_199_1.position_fixed.direction)
			
		dungeon_199_1:debug("fix position")
	end
end

function dungeonActive_199_1(room_id)
	debugmsg(0, 0, "dungeonActive_199_1")

	dungeon_199_1[room_id].status = "fight"
	--dungeon_199_1[room_id].boss1:callPlot("dungeonMain_199_1", room_id)
	if dungeon_199_1[room_id].handler_orgid == dungeon_199_1[room_id].boss1.ORGID then
		dungeon_199_1[room_id].boss1:callPlot("dungeonMain_199_1", room_id)
	else
		dungeon_199_1[room_id].boss2:callPlot("dungeonMain_199_1", room_id)
	end

	if dungeon_199_1[room_id].boss1.ORGID == 108988 then
		dungeon_199_1[room_id].boss1:callPlot("npcAI_108988", room_id)
		dungeon_199_1[room_id].boss2:callPlot("npcAI_108989", room_id)
	else
		dungeon_199_1[room_id].boss2:callPlot("npcAI_108988", room_id)
		dungeon_199_1[room_id].boss1:callPlot("npcAI_108989", room_id)
	end
end

function dungeonMain_199_1(room_id)
	debugmsg(0, 0, "dungeonMain_199_1")

	local boss1 = dungeon_199_1[room_id].boss1
	local boss2 = dungeon_199_1[room_id].boss2
	local battle_listener = dungeon_199_1[room_id].battle_listener

	while dungeon_199_1[room_id].status == "fight" do
		battle_listener:start()
		if dungeon_199_1[room_id].bbb and battle_listener.duration_time > 480 then
			dungeon_199_1[room_id].bbb = false
			ScriptMessage(boss1.guid, 0, 3, "[$MUTE]".."[SC_108988_02]", 0)
			boss1:addBuff(626207)
			boss2:addBuff(626207)
		end

		dungeon_199_1:debug("#battle_listener.players"..#battle_listener.players)
		if battle_listener.duration_time > 3 and #battle_listener.players < 1 then
			dungeon_199_1[room_id].status = "fail"
		end

		dungeon_199_1:sleep()
	end

	battle_listener:stop()
	if this().guid == boss1.guid then
		boss2:delete()
	else
		boss1:delete()
	end

	dungeon_199_1[room_id].boss1:cancelBuff(626267)
	dungeon_199_1[room_id].boss2:cancelBuff(626268)

	if dungeon_199_1[room_id].status == "success" then
		--dungeon_199_1:debug("success")
	elseif dungeon_199_1[room_id].status == "fail" then
		dungeon_199_1:debug("fail")
		if this().guid == boss1.guid then
			boss1:hide_from_room():sleep(6)
			local boss_orgid = boss1.ORGID
			if boss_orgid == 108988 then
				boss1:changePosition(1308, -83.5, -1911, 170)
			else
				boss1:changePosition(1328, -83.5, -1728, 134)
			end
			boss2:delete()
			boss1:show_to_room(room_id)
		else
			boss2:hide_from_room():sleep(6)
			local boss_orgid = boss2.ORGID
			if boss_orgid == 108988 then
				boss2:changePosition(1308, -83.5, -1911, 170)
			else
				boss2:changePosition(1328, -83.5, -1728, 134)
			end
			boss1:delete()
			boss2:show_to_room(room_id)
		end
		--dungeonInitialize_199_1(room_id)
		this():callPlot("dungeonInitialize_199_1", room_id)
	end
end

function npcAI_108988(room_id)
	debugmsg(0, 0, "npcAI_108988")

	local me
	if dungeon_199_1[room_id].boss1.ORGID == 108988 then
		me = dungeon_199_1[room_id].boss1
	else
		me = dungeon_199_1[room_id].boss2
	end
	local battle_listener = dungeon_199_1[room_id].battle_listener

	while dungeon_199_1[room_id].status == "fight" do
		if #me.hate_list > 0 then
			if me:useSkill("skill2", that(me.attack_target_GUID)) then
				dungeon_199_1:sleep(1.5)
			elseif me:useSkill("skill3", battle_listener.players) then
				dungeon_199_1:sleep(1.5)
			elseif me:useSkill("skill4") then
				dungeon_199_1:sleep(1.5)
			end
		end
		dungeon_199_1:sleep()
	end
end

function npcAI_108989(room_id)
	debugmsg(0, 0, "npcAI_108989")

	local me
	if dungeon_199_1[room_id].boss1.ORGID == 108988 then
		me = dungeon_199_1[room_id].boss2
	else
		me = dungeon_199_1[room_id].boss1
	end
	local battle_listener = dungeon_199_1[room_id].battle_listener

	while dungeon_199_1[room_id].status == "fight" do
		if #me.hate_list > 0 then
			if me:useSkill("skill6", that(me.attack_target_GUID)) then
				dungeon_199_1:sleep(1.5)
			elseif me:useSkill("skill7", battle_listener.players) then
				dungeon_199_1:sleep(1.5)
			elseif me:useSkill("skill8") then
				dungeon_199_1:sleep(1.5)
			end
		end
		dungeon_199_1:sleep()
	end
end

