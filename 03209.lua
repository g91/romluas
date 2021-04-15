function gmDungeon1992_create()
	local me = this()
	local boss = Christine.Npc:new():create(108990, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1992_create2()
	local me = this()
	local t = Christine.Npc:new():create(124058,me.x,me.y,me.z,me.direction)
	t:addTouchPlot("npcTouch_124058", 40)
	--	t:addBuff(626234)
	t:addToPartition(room_id)
	BeginPlot( t.guid , "Lua_Stone_Start", 0 );
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108990()
	local room_id = this().room_id
	dungeonInitialize_199_2(room_id)
	Cl_Resist_HackersBossNum()
end
function npcDead_108990()
	local room_id = this().room_id
	if not dungeon_199_2 or not dungeon_199_2[room_id] then
		debugmsg(0, 0, "not found dungeon_199_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108990_04]", 0)
	if dungeon_199_2[room_id].status == "fight" then
		dungeon_199_2[room_id].status = "success"
		if dungeon_199_2[room_id].shadow1 then
			dungeon_199_2[room_id].shadow1:delete()
		end
		if dungeon_199_2[room_id].shadow2 then
			dungeon_199_2[room_id].shadow2:delete()
		end
		for i, s in ipairs(dungeon_199_2[room_id].stones) do
			s:delete()
		end

		Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108990()
	local room_id = this().room_id
	if not dungeon_199_2 or not dungeon_199_2[room_id] then
		debugmsg(0, 0, "not found dungeon_199_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108990_01]", 0)
	if dungeon_199_2[room_id].status == "ready" then
		dungeonActive_199_2(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108990()
	local room_id = this().room_id
	if not dungeon_199_2 or not dungeon_199_2[room_id] then
		debugmsg(0, 0, "not found dungeon_199_2")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108990_03]", 0)
	if dungeon_199_2[room_id].status == "fight" then
		dungeon_199_2[room_id].status = "fail"
		dungeon_199_2[room_id].boss.search_enemy = false
		dungeon_199_2[room_id].boss.strike_back = false
		dungeon_199_2[room_id].boss.fight = false
		dungeon_199_2[room_id].boss.movable = false
	end
end
------------------------------------------------------------------
-- 轉化石124058
-- 匹努之影109228
------------------------------------------------------------------
function npcDead_109228()
	local me = this()
	local room_id = me.room_id
	if not dungeon_199_2 or not dungeon_199_2[room_id] then
		debugmsg(0, 0, "not found dungeon_199_2")
		return false
	end
	if me.guid == dungeon_199_2[room_id].shadow1.guid then
		dungeon_199_2[room_id].shadow1_dead = true
	end
	if me.guid == dungeon_199_2[room_id].shadow2.guid then
		dungeon_199_2[room_id].shadow2_dead = true
	end
	local t = Christine.Npc:new():create(124058,me.x,me.y,me.z,me.direction)
	t:addTouchPlot("npcTouch_124058", 40)
--	t:addBuff(626234)
	t:addToPartition(room_id)
	BeginPlot( t.guid , "Lua_Stone_Start", 0 );
--	CastSpell( t.guid , t.guid , 852216 ) 
	table.insert(dungeon_199_2[room_id].stones, t)
	return true
end
function Lua_Stone_Start()
	local _this = this();
	local _timer = 0;
	while true do
		Sleep(10);
		if ReadRoleValue( _this.guid ,  EM_RoleValue_Register + 1 ) == 0 then
		--	DebugMsg(0,0,"_timer=".._timer);
		--	if _timer == 5 then
				_this:addBuff(626234);
				CastSpell( _this.guid , _this.guid , 852216 );
		--	end
		--else
		--	_timer = 0;
			_timer = _timer + 1
			if _timer >= 5 then
				_this:interruptMagic()
				_this:systemCastSpell(852250)
				_timer = 0
				Sleep(5)
				WriteRoleValue( _this.guid ,  EM_RoleValue_Register + 1 , 1 );
				_this:cancelBuff(626234):beginPlot("npcAfterTouch_124058", 0)
				_this:interruptMagic()
				_this:cancelBuff(626234)
			end
		end
		--debugmsg(0, 0, "EM_RoleValue_Register1 = "..ReadRoleValue( _this.guid ,  EM_RoleValue_Register + 1 )..", _timer = ".._timer)
		--if _timer == 10 then
		--	_timer = 0;
		--end
		--_timer = _timer + 1;
	end
end
function npcTouch_124058()
	DebugMsg(0,0,"--npcTouch_124058--")
	local _this = this();
	local _that = that();
	if _this:checkBuff(626236) then
		return false
	end
	WriteRoleValue( _that.guid ,  EM_RoleValue_Register + 1 , 1 );
	_that:cancelBuff(626234):beginPlot("npcAfterTouch_124058", 0)
	_that:interruptMagic()
	_that:cancelBuff(626234)
	--_that:castSpell( _this, 852251)
	_this:addBuff(626236)
end
function npcAfterTouch_124058()
	this():removeTouchPlot()
	DebugMsg(0,0,"--npcAfterTouch_124058--")
	Sleep(100)
--	this():addBuff(626234)
--	CastSpell( this().guid , this().guid , 852216 ) 
	WriteRoleValue( this().guid ,  EM_RoleValue_Register + 1 , 0 );
	this():addTouchPlot("npcTouch_124058", 40)
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_199_2()
	debugmsg(0, 0, "dungeonSetting_199_2")
	dungeon_199_2 = Christine.System:new("dungeon_199_2")
	dungeon_199_2.alpha = false
	dungeon_199_2.beta = false
	dungeon_199_2.delay = 1

	dungeon_199_2.flags = Christine.FlagGroup:new(781441)

	local position_fix_reference = this()
	dungeon_199_2.position_fixed = {
		x = position_fix_reference.x,
		y = position_fix_reference.y,
		z = position_fix_reference.z,
		--direction = position_fix_reference.direction
		direction = position_fix_reference.direction
	}

	dungeon_199_2.skill = {}

--	斷鏢X
	dungeon_199_2.skill.skill1 = Christine.Skill:new()
	dungeon_199_2.skill.skill1.name = "skill1"
	dungeon_199_2.skill.skill1.cd = 7
	function dungeon_199_2.skill.skill1:active(caster, target)
		--caster:say(self.name)
		return caster:castSpell(target, 852244)
	end

--	物質瞬轉
	dungeon_199_2.skill.skill2 = Christine.Skill:new()
	dungeon_199_2.skill.skill2.name = "skill2"
	dungeon_199_2.skill.skill2.cd = 7
	function dungeon_199_2.skill.skill2:active(caster)
		--caster:say(self.name)
		return caster:castSpell(caster, 852245)
	end

--	舞刃
	dungeon_199_2.skill.skill3 = Christine.Skill:new()
	dungeon_199_2.skill.skill3.name = "skill3"
	dungeon_199_2.skill.skill3.cd = 9
	function dungeon_199_2.skill.skill3:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852246)
	end

--	
	dungeon_199_2.skill.skill4 = Christine.Skill:new()
	dungeon_199_2.skill.skill4.name = "skill4"
	dungeon_199_2.skill.skill4.cd = 9
	function dungeon_199_2.skill.skill4:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852247)
	end

--	斷鏢Y
	dungeon_199_2.skill.skill5 = Christine.Skill:new()
	dungeon_199_2.skill.skill5.name = "skill5"
	dungeon_199_2.skill.skill5.cd = 9
	function dungeon_199_2.skill.skill5:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852248)
	end

--	
	dungeon_199_2.skill.skill6 = Christine.Skill:new()
	dungeon_199_2.skill.skill6.name = "skill6"
	dungeon_199_2.skill.skill6.cd = 9
	function dungeon_199_2.skill.skill6:active(caster)
		--caster:say(self.name)
		return  caster:castSpell(caster, 852249)
	end
end

function dungeonInitialize_199_2(room_id)
	debugmsg(0, 0, "dungeonInitialize_199_2")

	if not dungeon_199_2 then
		dungeonSetting_199_2()
	end
	if dungeon_199_2.alpha then
		dungeonSetting_199_2()
	end

	dungeon_199_2[room_id] = {}
	dungeon_199_2[room_id].boss = this()
	dungeon_199_2[room_id].boss.search_enemy = true
	dungeon_199_2[room_id].boss.strike_back = true
	dungeon_199_2[room_id].boss.fight = true
	dungeon_199_2[room_id].boss.movable = false
	dungeon_199_2[room_id].boss.patrol = false

	for orgid, buff in pairs(dungeon_199_2[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_199_2[room_id].boss:addSkill("skill1", dungeon_199_2.skill.skill1)
	dungeon_199_2[room_id].boss:addSkill("skill2", dungeon_199_2.skill.skill2)
	dungeon_199_2[room_id].boss:addSkill("skill3", dungeon_199_2.skill.skill3)
	dungeon_199_2[room_id].boss:addSkill("skill4", dungeon_199_2.skill.skill4)

	dungeon_199_2[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_199_2[room_id].battle_listener:add(dungeon_199_2[room_id].boss)

	dungeon_199_2[room_id].status = "ready"
	dungeon_199_2[room_id].stones = {}
	dungeon_199_2[room_id].shadow1_dead = false
	dungeon_199_2[room_id].shadow2_dead = false
	
	dungeon_199_2[room_id].boss:beginPlot("dungeonFixPosition_199_2", 2)
end

function dungeonFixPosition_199_2()
	local room_id = this().room_id
	if dungeon_199_2.position_fixed then
--		dungeon_199_2[room_id].boss:changePosition(
--			dungeon_199_2.position_fixed.x,
--			dungeon_199_2.position_fixed.y,
--			dungeon_199_2.position_fixed.z,
--			dungeon_199_2.position_fixed.direction)
		dungeon_199_2[room_id].boss:changePosition(
			3781,
			-314,
			-1607,
			218)
		dungeon_199_2:debug("fix position")
--		DebugMsg( 0 , 0 ,"X="..dungeon_199_2.position_fixed.x )
--		DebugMsg( 0 , 0 ,"Y="..dungeon_199_2.position_fixed.y )
--		DebugMsg( 0 , 0 ,"Z="..dungeon_199_2.position_fixed.z )
--		DebugMsg( 0 , 0 ,"DIR="..dungeon_199_2.position_fixed.direction )
	end
end

function dungeonActive_199_2(room_id)
	debugmsg(0, 0, "dungeonActive_199_2")

	dungeon_199_2[room_id].status = "fight"
	dungeon_199_2[room_id].boss:callPlot("dungeonMain_199_2", room_id)
	dungeon_199_2[room_id].boss:callPlot("npcAI_108990", room_id)
	dungeon_199_2[room_id].boss:addBuff(626225)

	local boss = dungeon_199_2[room_id].boss
	dungeon_199_2[room_id].shadow1 = Christine.Npc:new()
	dungeon_199_2[room_id].shadow1:create(109228, boss.x, boss.y, boss.z, boss.direction)
	dungeon_199_2[room_id].shadow1:addToPartition(room_id)
	dungeon_199_2[room_id].shadow1:addSkill("skill5", dungeon_199_2.skill.skill5)
	dungeon_199_2[room_id].shadow1:callPlot("npcAI_109228", room_id)
	dungeon_199_2[room_id].battle_listener:add(dungeon_199_2[room_id].shadow1)

	dungeon_199_2[room_id].shadow2 = Christine.Npc:new()
	dungeon_199_2[room_id].shadow2:create(109228, boss.x, boss.y, boss.z, boss.direction)
	dungeon_199_2[room_id].shadow2:addToPartition(room_id)
	dungeon_199_2[room_id].shadow2:addSkill("skill6", dungeon_199_2.skill.skill6)
	dungeon_199_2[room_id].shadow2:callPlot("npcAI_109228", room_id)
	dungeon_199_2[room_id].battle_listener:add(dungeon_199_2[room_id].shadow2)
end

function dungeonMain_199_2(room_id)
	debugmsg(0, 0, "dungeonMain_199_2")

	local boss = dungeon_199_2[room_id].boss
	local battle_listener = dungeon_199_2[room_id].battle_listener
	local bbb = true

	while dungeon_199_2[room_id].status == "fight" do
		battle_listener:start()
		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108990_02]", 0)
			boss:addBuff(626207)
		end

		dungeon_199_2:sleep()

		if boss:checkBuff(626225) then
			if dungeon_199_2[room_id].shadow1_dead and
			   dungeon_199_2[room_id].shadow2_dead then
				dungeon_199_2[room_id].boss:cancelBuff(626225)
				dungeon_199_2[room_id].boss.movable = true;
			end
		end
	end

	battle_listener:stop()
	if dungeon_199_2[room_id].shadow1 then
		dungeon_199_2[room_id].shadow1:delete()
	end
	if dungeon_199_2[room_id].shadow2 then
		dungeon_199_2[room_id].shadow2:delete()
	end
	for i, s in ipairs(dungeon_199_2[room_id].stones) do
		s:delete()
	end

	if dungeon_199_2[room_id].status == "success" then
		dungeon_199_2:debug("success")
	elseif dungeon_199_2[room_id].status == "fail" then
		dungeon_199_2:debug("fail")
		dungeonInitialize_199_2(room_id)
		boss:hide_from_room():sleep(3)
--		boss:show_to_room(room_id)
--		dungeonInitialize_199_2(room_id)
		boss:show_to_room(room_id)
	end
end

function npcAI_108990(room_id)
	debugmsg(0, 0, "npcAI_108990")

	local boss = dungeon_199_2[room_id].boss
	local battle_listener = dungeon_199_2[room_id].battle_listener

	while dungeon_199_2[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill1", that(boss.attack_target_GUID)) then
				dungeon_199_2:sleep(1.5)
			elseif boss:useSkill("skill2") then
				dungeon_199_2:sleep(1.5)
			elseif boss:useSkill("skill3") then
				dungeon_199_2:sleep(1.5)
			elseif boss:useSkill("skill4") then
				dungeon_199_2:sleep(1.5)
			end
		end
		dungeon_199_2:sleep()
	end
end

function npcAI_109228(room_id)
	debugmsg(0, 0, "npcAI_109228")

	local shadow, skill_name

	if dungeon_199_2[room_id].shadow1.guid == OwnerID() then
		shadow = dungeon_199_2[room_id].shadow1
		skill_name = "skill5"
	elseif dungeon_199_2[room_id].shadow2.guid == OwnerID() then
		shadow = dungeon_199_2[room_id].shadow2
		skill_name = "skill6"
	end

	if not shadow or not skill_name then
		dungeon_199_2:debug("not found shadow or skill")
		return false
	end
	local battle_listener = dungeon_199_2[room_id].battle_listener

	while dungeon_199_2[room_id].status == "fight" do
		if #shadow.hate_list > 0 then
			if shadow:useSkill(skill_name) then
			end
		end
		dungeon_199_2:sleep()
	end
end