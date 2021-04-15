function gmDungeon1994_create()
	local me = this()
	local boss = Christine.Npc:new():create(108992, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1994_phase2()
	local room_id = this().room_id
	dungeon_199_4[room_id].boss.hp = dungeon_199_4[room_id].boss.max_hp * 0.69
end
function gmDungeon1994_phase3()
	local room_id = this().room_id
	dungeon_199_4[room_id].boss.hp = dungeon_199_4[room_id].boss.max_hp * 0.39
end
function gmDungeon1994_create2()
	local me = this()
	local boss = Christine.Npc:new():create(108992, me.x, me.y, me.z, 0):addToPartition(0)
	boss.strike_back = false
	boss.search_enemy = false
	this():addBuff(626264)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108992()
	local room_id = this().room_id
	dungeonInitialize_199_4(room_id)
	Cl_Resist_HackersBossNum()
end
function npcDead_108992()
	local room_id = this().room_id
	if not dungeon_199_4 or not dungeon_199_4[room_id] then
		debugmsg(0, 0, "not found dungeon_199_4")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108992_04]", 0)
	if dungeon_199_4[room_id].status == "fight" then
		dungeon_199_4[room_id].status = "success"

		Cl_Resist_HackersBossDead()
		sasa_ZoneDungeon_title_01(530986)
	end
end
function npcBeginFight_108992()
	local room_id = this().room_id
	if not dungeon_199_4 or not dungeon_199_4[room_id] then
		debugmsg(0, 0, "not found dungeon_199_4")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108992_01]", 0)
	if dungeon_199_4[room_id].status == "ready" then
		dungeonActive_199_4(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108992()
	local room_id = this().room_id
	if not dungeon_199_4 or not dungeon_199_4[room_id] then
		debugmsg(0, 0, "not found dungeon_199_4")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108992_03]", 0)
	if dungeon_199_4[room_id].status == "fight" then
		dungeon_199_4[room_id].status = "fail"
		dungeon_199_4[room_id].boss.search_enemy = false
		dungeon_199_4[room_id].boss.strike_back = false
		dungeon_199_4[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcDead_109232()
	this():delFromPartition():callPlot("npcDead_109232wait", this().room_id)
end
function npcDead_109232wait(room_id)
	dungeon_199_4:sleep(2)
	this():addToPartition(room_id)
end
function npcCreate_109233()
	local room_id = this().room_id
	if not dungeon_199_4 or not dungeon_199_4[room_id] then
		debugmsg(0, 0, "not found dungeon_199_4")
		return false
	end
	dungeon_199_4[room_id].boss:addBuff(626255)
end
function npcDead_109233()
	local room_id = this().room_id
	if not dungeon_199_4 or not dungeon_199_4[room_id] then
		debugmsg(0, 0, "not found dungeon_199_4")
		return false
	end
	local me = this()
	if me.guid == that().guid then
		if this():distanceTo(dungeon_199_4[room_id].boss) < 50 then
			if dungeon_199_4[room_id].boss:checkBuff(626255) then
				local buff_power = dungeon_199_4[room_id].boss.buff[626255].power
				dungeon_199_4[room_id].boss:cancelBuff(626255)
				if buff_power > 0 then
					dungeon_199_4[room_id].boss:addBuff(626255, buff_power-1)
				end
				dungeon_199_4:debug("reduce boss buff")
			end
		end
		return true
	else
		me:castSpell(me, 852267)
		return false
	end
	me.live_time = 1
end
------------------------------------------------------------------
------------------------------------------------------------------
--ª±®a¼²À»¤ÏÀ³
function magicObject_626265()
	local me = this()
	me:castSpell(me, 852268)
	me:stopMove()
end
--BOSS¼²À»¤ÏÀ³
function magicObject_626270()
	local me = this()
	local target = that()
	if target.ORGID ~= 108992 then
		return false
	end
	if target.ORGID == 108992 then
		me:castSpell(target, 852269)
		me:stopMove()
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_199_4()
	debugmsg(0, 0, "dungeonSetting_199_4")
	dungeon_199_4 = Christine.System:new("dungeon_199_4")
	dungeon_199_4.alpha = true
	dungeon_199_4.beta = true
	dungeon_199_4.delay = 1

	dungeon_199_4.chaos_path = Christine.FlagGroup:new(781445)--´ý¨P²¾°Ê¦ì¸m
	dungeon_199_4.creating_flags = Christine.FlagGroup:new(781453)--½Ã§L¤Û§¯¥X²{¦ì¸m

	local position_fix_reference = this()
	dungeon_199_4.position_fixed = {
		x = -981,
		y = -18,
		z = -4107,
		direction = 2
	}

	dungeon_199_4.skill = {}

--	¶¿¦å³N
	dungeon_199_4.skill.skill1 = Christine.Skill:new()
	dungeon_199_4.skill.skill1.name = "skill1"
	dungeon_199_4.skill.skill1.cd = 7
	function dungeon_199_4.skill.skill1:active(caster, target)
		--caster:say(self.name)
		return caster:castSpell(target, 852262)
	end

--	Å]¦å¥|Âq
	dungeon_199_4.skill.skill2 = Christine.Skill:new()
	dungeon_199_4.skill.skill2.name = "skill2"
	dungeon_199_4.skill.skill2.cd = 7
	function dungeon_199_4.skill.skill2:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852263)
	end

--	«èÆFÄñ¨­
	dungeon_199_4.skill.skill3 = Christine.Skill:new()
	dungeon_199_4.skill.skill3.name = "skill3"
	dungeon_199_4.skill.skill3.cd = 9
	function dungeon_199_4.skill.skill3:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852264)
	end

--	¶Ý¦å
	dungeon_199_4.skill.skill4 = Christine.Skill:new()
	dungeon_199_4.skill.skill4.name = "skill4"
	dungeon_199_4.skill.skill4.cd = 17
	function dungeon_199_4.skill.skill4:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852265)
	end

--	ÆFÀ£
	dungeon_199_4.skill.skill5 = Christine.Skill:new()
	dungeon_199_4.skill.skill5.name = "skill5"
	dungeon_199_4.skill.skill5.cd = 3
	function dungeon_199_4.skill.skill5:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852266)
	end

--	¨¸³NÃzµõ
--	dungeon_199_4.skill.skill6 = Christine.Skill:new()
--	dungeon_199_4.skill.skill6.name = "skill6"
--	dungeon_199_4.skill.skill6.cd = 9
--	function dungeon_199_4.skill.skill6:active(caster)
--		--caster:say(self.name)
--		return  caster:castSpell(caster, 852267)
--	end

--	´ý¨PÃzµõ
--	dungeon_199_4.skill.skill7 = Christine.Skill:new()
--	dungeon_199_4.skill.skill7.name = "skill7"
--	dungeon_199_4.skill.skill7.cd = 7
--	function dungeon_199_4.skill.skill7:active(caster, target)
--		--caster:say(self.name)
--		return caster:castSpell(target, 852268)
--	end

--	¨gÀ»
	dungeon_199_4.skill.skill8 = Christine.Skill:new()
	dungeon_199_4.skill.skill8.name = "skill8"
	dungeon_199_4.skill.skill8.cd = 7
	function dungeon_199_4.skill.skill8:active(caster, target)
		--caster:say(self.name)
		return caster:castSpell(target, 852270)
	end

--	Å]·N§l¨ú
	dungeon_199_4.skill.skill9 = Christine.Skill:new()
	dungeon_199_4.skill.skill9.name = "skill9"
	dungeon_199_4.skill.skill9.cd = 9
	function dungeon_199_4.skill.skill9:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852271)
	end

--	¯¦ªk«ÊÂê
	dungeon_199_4.skill.skill10 = Christine.Skill:new()
	dungeon_199_4.skill.skill10.name = "skill10"
	dungeon_199_4.skill.skill10.cd = 7
	function dungeon_199_4.skill.skill10:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852272)
	end

--	Ãzµõ¤Û¼v
	dungeon_199_4.skill.skill11 = Christine.Skill:new()
	dungeon_199_4.skill.skill11.name = "skill11"
	dungeon_199_4.skill.skill11.cd = 9
	function dungeon_199_4.skill.skill11:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852273)
	end
end

function dungeonInitialize_199_4(room_id)
	debugmsg(0, 0, "dungeonInitialize_199_4")

	if not dungeon_199_4 then
		dungeonSetting_199_4()
	end
	if dungeon_199_4.alpha then
		dungeonSetting_199_4()
	end

	dungeon_199_4[room_id] = {}
	dungeon_199_4[room_id].boss = this()
	dungeon_199_4[room_id].boss.search_enemy = true
	dungeon_199_4[room_id].boss.strike_back = true
	dungeon_199_4[room_id].boss.fight = true
	dungeon_199_4[room_id].boss.patrol = false

	for orgid, buff in pairs(dungeon_199_4[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_199_4[room_id].boss:addSkill("skill1", dungeon_199_4.skill.skill1)
	dungeon_199_4[room_id].boss:addSkill("skill2", dungeon_199_4.skill.skill2)
	dungeon_199_4[room_id].boss:addSkill("skill3", dungeon_199_4.skill.skill3)
	dungeon_199_4[room_id].boss:addSkill("skill4", dungeon_199_4.skill.skill4)

	dungeon_199_4[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_199_4[room_id].battle_listener:add(dungeon_199_4[room_id].boss)

	dungeon_199_4[room_id].status = "ready"
	dungeon_199_4[room_id].servants = {}
	dungeon_199_4[room_id].chaos = {}
	
	dungeon_199_4[room_id].boss:beginPlot("dungeonFixPosition_199_4", 2)
end

function dungeonFixPosition_199_4()
	local room_id = this().room_id
	if dungeon_199_4.position_fixed then
		dungeon_199_4[room_id].boss:changePosition(
			-981,
			-18,
			-4107,
			2)
--		dungeon_199_4[room_id].boss:changePosition(
--			dungeon_199_4.position_fixed.x,
--			dungeon_199_4.position_fixed.y,
--			dungeon_199_4.position_fixed.z,
--			dungeon_199_4.position_fixed.direction)
--		DebugMsg(0,0,"X="..dungeon_199_4.position_fixed.x)
--		DebugMsg(0,0,"Y="..dungeon_199_4.position_fixed.y)
--		DebugMsg(0,0,"Z="..dungeon_199_4.position_fixed.z)
--		DebugMsg(0,0,"D="..dungeon_199_4.position_fixed.direction)
		dungeon_199_4:debug("fix position")
	end
end

function dungeonActive_199_4(room_id)
	debugmsg(0, 0, "dungeonActive_199_4")

	dungeon_199_4[room_id].status = "fight"
	dungeon_199_4[room_id].boss:callPlot("dungeonMain_199_4", room_id)
	dungeon_199_4[room_id].boss:callPlot("npcAI_108992", room_id)
end

function dungeonMain_199_4(room_id)
	debugmsg(0, 0, "dungeonMain_199_4")

	local boss = dungeon_199_4[room_id].boss
	local battle_listener = dungeon_199_4[room_id].battle_listener
	local bbb = true

	local hp_70_percents = boss.max_hp * 0.7
	local hp_40_percents = boss.max_hp * 0.4
	local hp_70_percents_check = true
	local hp_40_percents_check = true
	local guard_trigger = false
	local guard_orgid = 109234

	while dungeon_199_4[room_id].status == "fight" do
		battle_listener:start()

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108992_02]", 0)
			boss:addBuff(626207)
		end

		if battle_listener.duration_time  % 18 == 0 then
			if #dungeon_199_4[room_id].servants < 4 then
				local servant
				for i = 1, 3 do
					servant = Christine.Npc:new()
					servant:create(109233, boss.x, boss.y, boss.z)
					servant:addToPartition(room_id)
					servant:addSkill("skill5", dungeon_199_4.skill.skill5)
					--servant:addSkill("skill6", dungeon_199_4.skill.skill6)
					dungeon_199_4[room_id].battle_listener:add(servant)
					table.insert(dungeon_199_4[room_id].servants, servant)
					servant:callPlot("npcAI_109233", room_id)
					if #battle_listener.players ~= 0 then
						servant:hate(battle_listener.players[RandRange(1, #battle_listener.players)])
					end
				end
			end
		end

		if guard_trigger and battle_listener .duration_time % 20 == 0 then
			for i = 1, 2 do
				local servant, p
				if dungeon_199_4.creating_flags[i+1] then
					p = dungeon_199_4.creating_flags[i+1]
				else
					p = boss
				end
				servant = Christine.Npc:new()
				servant:create(guard_orgid, p.x, p.y, p.z)
				servant:addToPartition(room_id)
				if guard_orgid == 109234 then
					servant:addSkill("skill8", dungeon_199_4.skill.skill8)
					servant:addSkill("skill9", dungeon_199_4.skill.skill9)
					servant:callPlot("npcAI_109234", room_id)
				else
					servant:addSkill("skill10", dungeon_199_4.skill.skill10)
					servant:addSkill("skill11", dungeon_199_4.skill.skill11)
					servant:callPlot("npcAI_109235", room_id)
				end
				dungeon_199_4[room_id].battle_listener:add(servant)
				table.insert(dungeon_199_4[room_id].servants, servant)
				servant:attack(that(boss.attack_target_GUID))
			end
		end

		if hp_70_percents_check and boss.hp < hp_70_percents then
			hp_70_percents_check = false
			guard_trigger = true

			local servant, create_position
			for i = 1, 8 do
				create_position = table.random(dungeon_199_4.chaos_path, 1)[1]
				servant = Christine.Npc:new()
				servant:create(109232, create_position.x, create_position.y, create_position.z)
				servant:addBuff(626264)--player
				servant:addBuff(626269)--boss
				servant:addBuff(626272)--´«ÁÜ
				servant:addToPartition(room_id)
				table.insert(dungeon_199_4[room_id].chaos, servant)
				servant:callPlot("npcAI_109232", room_id)
			end
		end

		if hp_40_percents_check and boss.hp < hp_40_percents then
			hp_40_percents_check = false
			guard_orgid = 109235
		end

		local servants = {}
		for index, servant in ipairs(dungeon_199_4[room_id].servants) do
			if servant.is_legal then
				table.insert(servants, servant)
			end
		end
		dungeon_199_4[room_id].servants = servants

		if battle_listener.duration_time > 4 and #battle_listener.players <= 0 then
			dungeon_199_4[room_id].status = "fail"
		end

		dungeon_199_4:sleep(1)
	end

	battle_listener:stop()
	for index, servant in ipairs(dungeon_199_4[room_id].servants) do
		servant:delete()
	end
	for index, chaos in ipairs(dungeon_199_4[room_id].chaos) do
		chaos:delete()
	end

	if dungeon_199_4[room_id].status == "success" then
		dungeon_199_4:debug("success")
	elseif dungeon_199_4[room_id].status == "fail" then
		dungeon_199_4:debug("fail")
		dungeonInitialize_199_4(room_id)
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
--		dungeonInitialize_199_4(room_id)
	end
end

function npcAI_108992(room_id)
	debugmsg(0, 0, "npcAI_108992")

	local boss = dungeon_199_4[room_id].boss
	local battle_listener = dungeon_199_4[room_id].battle_listener

	while dungeon_199_4[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill4") then
				dungeon_199_4:sleep(1.5)
			elseif boss:useSkill("skill3") then
				dungeon_199_4:sleep(1.5)
			elseif boss:useSkill("skill1", that(boss.attack_target_GUID)) then
				dungeon_199_4:sleep(1.5)
			elseif boss:useSkill("skill2") then
				dungeon_199_4:sleep(1.5)
			end
		end
		dungeon_199_4:sleep()
	end
end

--´ý¨P
function npcAI_109232(room_id)
	debugmsg(0, 0, "npcAI_109232")

	local me = this()
	me.fight = false
	me.strike_back = false
	me.search_enemy = false
	local not_found = true
	for index, chaos in ipairs(dungeon_199_4[room_id].chaos) do
		if me.guid == chaos.guid then
			me = chaos
			not_found = false
		end
	end
	if not_found then
		dungeon_199_4:debug("chaos not found")
		return false
	end

	local boss = dungeon_199_4[room_id].boss
	local battle_listener = dungeon_199_4[room_id].battle_listener
	local path = dungeon_199_4.chaos_path
	local p

	while dungeon_199_4[room_id].status == "fight" do
		if me:checkBuff(626283) then
			dungeon_199_4:sleep()
		else
			p = table.random(path, 1)[1]
			me:move(p.x, p.y, p.z, true)
			dungeon_199_4:sleep()
		end
	end
end

--¤`ÆF
function npcAI_109233(room_id)
	debugmsg(0, 0, "npcAI_109232")

	local me = this()
	local not_found = true
	for index, servant in ipairs(dungeon_199_4[room_id].servants) do
		if servant.guid == me.guid then
			me = servant
			not_found = false
		end
	end
	if not_found then
		dungeon_199_4:debug("servant not found")
		return false
	end
	
	local battle_listener = dungeon_199_4[room_id].battle_listener

	while dungeon_199_4[room_id].status == "fight" do
		if #me.hate_list > 0 then
			if me:useSkill("skill5") then
				dungeon_199_4:sleep(1.5)
			end
		end
		dungeon_199_4:sleep()
	end
end

--½Ã§L
function npcAI_109234(room_id)
	debugmsg(0, 0, "npcAI_109232")

	local me = this()
	local not_found = true
	for index, servant in ipairs(dungeon_199_4[room_id].servants) do
		if servant.guid == me.guid then
			me = servant
			not_found = false
		end
	end
	if not_found then
		dungeon_199_4:debug("servant not found")
		return false
	end

	local battle_listener = dungeon_199_4[room_id].battle_listener

	while dungeon_199_4[room_id].status == "fight" do
		if #me.hate_list > 0 then
			if me:useSkill("skill8", that(me.attack_target_GUID)) then
				dungeon_199_4:sleep(1.5)
			elseif me:useSkill("skill9") then
				dungeon_199_4:sleep(1.5)
			end
		end
		dungeon_199_4:sleep()
	end
end

--´«ÁÜ
function npcAI_109235(room_id)
	debugmsg(0, 0, "npcAI_109232")

	local me = this()
	local not_found = true
	for index, servant in ipairs(dungeon_199_4[room_id].servants) do
		if servant.guid == me.guid then
			me = servant
			not_found = false
		end
	end
	if not_found then
		dungeon_199_4:debug("servant not found")
		return false
	end

	local battle_listener = dungeon_199_4[room_id].battle_listener

	while dungeon_199_4[room_id].status == "fight" do
		if #me.hate_list > 0 then
			if me:useSkill("skill10") then
				dungeon_199_4:sleep(1.5)
			elseif me:useSkill("skill11") then
				dungeon_199_4:sleep(1.5)
			end
		end
		dungeon_199_4:sleep()
	end
end