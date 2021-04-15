function gmDungeon1971_create()
	local me = this()
	local boss = Christine.Npc:new():create(108962, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1971_buff()
	this():systemCastSpell(this(), 852106)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108962()
	local room_id = this().room_id
	dungeonInitialize_197_1(room_id)
	Cl_Resist_HackersBossNum()
end
function npcDead_108962()
	local room_id = this().room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108962_04]", 0)
	if dungeon_197_1[room_id].status == "fight" then
		dungeon_197_1[room_id].status = "success"

		dungeon_197_1[room_id].trap1:delete()
		dungeon_197_1[room_id].trap2:delete()
		dungeon_197_1[room_id].trap3:delete()
		Cl_Resist_HackersBossDead()
	end
end
function npcBeginFight_108962()
	local room_id = this().room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108962_01]", 0)
	if dungeon_197_1[room_id].status == "ready" then
		dungeonActive_197_1(room_id)
	end
end
function npcEndFight_108962()
	local room_id = this().room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108962_03]", 0)
	if dungeon_197_1[room_id].status == "fight" then
		dungeon_197_1[room_id].status = "fail"
		dungeon_197_1[room_id].boss.search_enemy = false
		dungeon_197_1[room_id].boss.strike_back = false
		dungeon_197_1[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
-- 水溶陷阱
function npcCreate_109072()
	local trap = this()
	local room_id = trap.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	dungeon_197_1[room_id].trap1 = this()
	dungeon_197_1[room_id].trap1.hp = dungeon_197_1[room_id].trap1.max_hp
	dungeon_197_1[room_id].trap1:addBuff(625871)
	dungeon_197_1[room_id].trap1:beginPlot("dungeon_197_1_checkBuff", 1)
	dungeon_197_1[room_id].trap1:defaultIdleMotion(ruFUSION_MIME_SPAWN)
	dungeon_197_1[room_id].trap1.movable = false
	dungeon_197_1[room_id].trap1.strike_back = false
	dungeon_197_1[room_id].trap1.search_enemy = false
	dungeon_197_1[room_id].trap1.revive = true
	dungeon_197_1[room_id].trap1.fight = true
	dungeon_197_1[room_id].trap1.show_role_head = true
	dungeon_197_1[room_id].trap1.mark = true
	dungeon_197_1[room_id].trap1.active = true
	AddBuff( OwnerID() , 505653 , 0 , -1 )
end
function npcDead_109072()
	if this().guid == that().guid then
		return true
	end
	local trap = this()
	local room_id = trap.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	trap.fight = false
	trap.show_role_head = false
	trap.mark = false
	dungeon_197_1[room_id].trap1.active = false
	local killer = that()
	--killer:addBuff(625837)
	trap:systemCastSpell(killer, 852106)
	trap:systemCastSpell(killer, 851982)
	dungeon_197_1[room_id].boss:cancelBuff(625841)
	trap:beginPlot("dungeonReborn_197_1", 0.5)
	return false
end
-- 霜氣陷阱
function npcCreate_109073()
	local trap = this()
	local room_id = trap.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	dungeon_197_1[room_id].trap2 = this()
	dungeon_197_1[room_id].trap2.hp = dungeon_197_1[room_id].trap2.max_hp
	dungeon_197_1[room_id].trap2:addBuff(625871)
	dungeon_197_1[room_id].trap2:beginPlot("dungeon_197_1_checkBuff", 1)
	dungeon_197_1[room_id].trap2:defaultIdleMotion(ruFUSION_MIME_SPAWN)
	dungeon_197_1[room_id].trap2.movable = false
	dungeon_197_1[room_id].trap2.strike_back = false
	dungeon_197_1[room_id].trap2.search_enemy = false
	dungeon_197_1[room_id].trap2.revive = true
	dungeon_197_1[room_id].trap2.fight = true
	dungeon_197_1[room_id].trap2.show_role_head = true
	dungeon_197_1[room_id].trap2.mark = true
	dungeon_197_1[room_id].trap2.active = true
	AddBuff( OwnerID() , 505653 , 0 , -1 )
end
function npcDead_109073()
	if this().guid == that().guid then
		return true
	end
	local trap = this()
	local room_id = trap.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	trap.fight = false
	trap.show_role_head = false
	trap.mark = false
	dungeon_197_1[room_id].trap2.active = false
	local killer = that()
	--killer:addBuff(625838)
	trap:systemCastSpell(killer, 852107)
	trap:systemCastSpell(killer, 851982)
	dungeon_197_1[room_id].boss:cancelBuff(625841)
	trap:beginPlot("dungeonReborn_197_1", 0.5)
	return false
end
-- 負電陷阱
function npcCreate_109074()
	local trap = this()
	local room_id = trap.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	dungeon_197_1[room_id].trap3 = this()
	dungeon_197_1[room_id].trap3.hp = dungeon_197_1[room_id].trap3.max_hp
	dungeon_197_1[room_id].trap3:addBuff(625871)
	dungeon_197_1[room_id].trap3:beginPlot("dungeon_197_1_checkBuff", 1)
	dungeon_197_1[room_id].trap3:defaultIdleMotion(ruFUSION_MIME_SPAWN)
	dungeon_197_1[room_id].trap3.movable = false
	dungeon_197_1[room_id].trap3.strike_back = false
	dungeon_197_1[room_id].trap3.search_enemy = false
	dungeon_197_1[room_id].trap3.revive = true
	dungeon_197_1[room_id].trap3.fight = true
	dungeon_197_1[room_id].trap3.show_role_head = true
	dungeon_197_1[room_id].trap3.mark = true
	dungeon_197_1[room_id].trap3.active = true
	AddBuff( OwnerID() , 505653 , 0 , -1 )
end
function npcDead_109074()
	if this().guid == that().guid then
		return true
	end
	local trap = this()
	local room_id = trap.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	trap.fight = false
	trap.show_role_head = false
	trap.mark = false
	dungeon_197_1[room_id].trap3.active = false
	local killer = that()
	--killer:addBuff(625839)
	trap:systemCastSpell(killer, 852108)
	trap:systemCastSpell(killer, 851982)
	dungeon_197_1[room_id].boss:cancelBuff(625841)
	trap:beginPlot("dungeonReborn_197_1", 0.5)
	return false
end
-- 8秒重生
function dungeonReborn_197_1()
	dungeon_197_1:debug("dungeonReborn_197_1")
	--this():kill()
	local trap = this()
	trap:delFromPartition()
	dungeon_197_1:sleep(8)
	trap:addToPartition(-1)
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeon_197_1_checkBuff()
	local room_id = this().room_id
	if dungeon_197_1[room_id].trap1 and dungeon_197_1[room_id].trap1.active and
	   dungeon_197_1[room_id].trap2 and dungeon_197_1[room_id].trap2.active and
	   dungeon_197_1[room_id].trap3 and dungeon_197_1[room_id].trap3.active then
		dungeon_197_1[room_id].boss:addBuff(625841)
	else
		dungeon_197_1[room_id].boss:cancelBuff(625841)
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
-- 水溶持續檢查
function magicObject_625844()
	local owner = this()
	local target = that()
	if owner:checkBuff(625834) and target:checkBuff(625837) then
		owner:cancelBuff(625834)
		target:cancelBuff(625837)
	elseif owner:checkBuff(625837) and target:checkBuff(625834) then
		owner:cancelBuff(625837)
		target:cancelBuff(625834)
	elseif target:checkBuff(625835) or target:checkBuff(625836) or target:checkBuff(625838) or target:checkBuff(625839) then
		target:systemCastSpell(target, 851979)
	end
	return false
end
-- 霜氣持續檢查
function magicObject_625845()
	local owner = this()
	local target = that()
	if owner:checkBuff(625835) and target:checkBuff(625838) then
		owner:cancelBuff(625835)
		target:cancelBuff(625838)
	elseif owner:checkBuff(625838) and target:checkBuff(625835) then
		owner:cancelBuff(625838)
		target:cancelBuff(625835)
	elseif target:checkBuff(625834) or target:checkBuff(625836) or target:checkBuff(625837) or target:checkBuff(625839) then
		target:systemCastSpell(target, 851979)
	end
	return false
end
-- 負電持續檢查
function magicObject_625846()
	local owner = this()
	local target = that()
	if owner:checkBuff(625836) and target:checkBuff(625839) then
		owner:cancelBuff(625836)
		target:cancelBuff(625839)
	elseif owner:checkBuff(625839) and target:checkBuff(625836) then
		owner:cancelBuff(625839)
		target:cancelBuff(625836)
	elseif target:checkBuff(625835) or target:checkBuff(625834) or target:checkBuff(625838) or target:checkBuff(625837) then
		target:systemCastSpell(target, 851979)
	end
	return false
end
-- 核心融解詠唱完畢
function magicObject_625887()
	local boss = this()
	local room_id = boss.room_id
	if not dungeon_197_1 or not dungeon_197_1[room_id] then
		debugmsg(0, 0, "not found dungeon_197_1")
		return false
	end
	local targets = dungeon_197_1[room_id].battle_listener.players
	targets = table.random(targets, 3)
	for index, target in ipairs(targets) do
		if index == 1 then
			boss:systemCastSpell(target, 851978)
		elseif index == 2 then
			boss:systemCastSpell(target, 851980)
		elseif index == 3 then
			boss:systemCastSpell(target, 851986)
		end
	end
end
-- 水溶量過剩結果
function magicObject_625837()
	local player = that()
	if player.buff[625837].power > 3 then
		dungeon_197_1[player.room_id].boss:systemCastSpell(player, 851981)
	end
end
-- 霜氣量過剩結果
function magicObject_625838()
	local player = that()
	if player.buff[625838].power > 3 then
		dungeon_197_1[player.room_id].boss:systemCastSpell(player, 851981)
	end
end
-- 負電量過剩結果
function magicObject_625839()
	local player = that()
	if player.buff[625839].power > 3 then
		dungeon_197_1[player.room_id].boss:systemCastSpell(player, 851981)
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_197_1()
	debugmsg(0, 0, "dungeonSetting_197_1")
	dungeon_197_1 = Christine.System:new("dungeon_197_1")
	dungeon_197_1.alpha = false
	dungeon_197_1.beta = false
	dungeon_197_1.delay = 1

	local position_fix_reference = this()
	dungeon_197_1.position_fixed = {
		x = position_fix_reference.x,
		y = position_fix_reference.y,
		z = position_fix_reference.z,
		--direction = position_fix_reference.direction
		direction = 180
	}

	dungeon_197_1.skill = {}

--	水文衝擊
	dungeon_197_1.skill.skill1 = Christine.Skill:new()
	dungeon_197_1.skill.skill1.name = "skill1"
	dungeon_197_1.skill.skill1.cd = 7
	function dungeon_197_1.skill.skill1:active(caster, target)
		return caster:castSpell(target, 851976)
	end

--	流水電網
	dungeon_197_1.skill.skill2 = Christine.Skill:new()
	dungeon_197_1.skill.skill2.name = "skill2"
	dungeon_197_1.skill.skill2.cd = 9
	function dungeon_197_1.skill.skill2:active(caster)
		return caster:castSpell(caster, 851977)
	end

--	核心溶解
	dungeon_197_1.skill.skill3 = Christine.Skill:new()
	dungeon_197_1.skill.skill3.name = "skill3"
	dungeon_197_1.skill.skill3.cd = 19
	function dungeon_197_1.skill.skill3:active(caster)
		return  caster:castSpell(caster, 851997)
	end
end

function dungeonInitialize_197_1(room_id)
	debugmsg(0, 0, "dungeonInitialize_197_1")

	if not dungeon_197_1 then
		dungeonSetting_197_1()
	end
	if dungeon_197_1.alpha then
		dungeonSetting_197_1()
	end

	dungeon_197_1[room_id] = {}
	dungeon_197_1[room_id].boss = this()
	dungeon_197_1[room_id].boss.search_enemy = true
	dungeon_197_1[room_id].boss.strike_back = true
	dungeon_197_1[room_id].boss.fight = true
	dungeon_197_1[room_id].boss.patrol = false

	for orgid, buff in pairs(dungeon_197_1[room_id].boss.buff) do
		buff:remove(false)
	end

	dungeon_197_1[room_id].boss:addSkill("skill1", dungeon_197_1.skill.skill1)
	dungeon_197_1[room_id].boss:addSkill("skill2", dungeon_197_1.skill.skill2)
	dungeon_197_1[room_id].boss:addSkill("skill3", dungeon_197_1.skill.skill3)

	local boss = dungeon_197_1[room_id].boss
	for index = 1, 3 do
		local angle = math.pi / 180 * 120 * index
		local x = boss.x + (40 * math.cos(angle))
		local z = boss.z + (40 * math.sin(angle))
		local y = getHeight(x, boss.y, z)
		npc = Christine.Npc:new()
		npc:create((109071 + index), x, y, z, 0)
		npc:addToPartition(room_id)
	end

	dungeon_197_1[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_197_1[room_id].battle_listener:add(dungeon_197_1[room_id].boss)

	dungeon_197_1[room_id].status = "ready"
	
	dungeon_197_1[room_id].boss:beginPlot("dungeonFixPosition_197_1", 2)
end

function dungeonFixPosition_197_1()
	local room_id = this().room_id
	if dungeon_197_1.position_fixed then
		dungeon_197_1[room_id].boss:changePosition(
			dungeon_197_1.position_fixed.x,
			dungeon_197_1.position_fixed.y,
			dungeon_197_1.position_fixed.z,
			dungeon_197_1.position_fixed.direction)
		dungeon_197_1:debug("fix position")
	end
end

function dungeonActive_197_1(room_id)
	debugmsg(0, 0, "dungeonActive_197_1")

	dungeon_197_1[room_id].status = "fight"
	dungeon_197_1[room_id].boss:callPlot("dungeonMain_197_1", room_id)
	dungeon_197_1[room_id].boss:callPlot("npcAI_108962", room_id)
end

function dungeonMain_197_1(room_id)
	debugmsg(0, 0, "dungeonMain_197_1")

	local boss = dungeon_197_1[room_id].boss
	local battle_listener = dungeon_197_1[room_id].battle_listener
	local bbb = true
	while dungeon_197_1[room_id].status == "fight" do
		battle_listener:start()
		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108962_02]", 0)
			boss:addBuff(625798)
		end

		dungeon_197_1_checkBuff()

		dungeon_197_1:sleep()
	end

	battle_listener:stop()

	dungeon_197_1[room_id].trap1:delete()
	dungeon_197_1[room_id].trap2:delete()
	dungeon_197_1[room_id].trap3:delete()

	if dungeon_197_1[room_id].status == "success" then
		dungeon_197_1:debug("success")
	elseif dungeon_197_1[room_id].status == "fail" then
		dungeon_197_1:debug("fail")
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
		dungeonInitialize_197_1(room_id)
	end
end

function npcAI_108962(room_id)
	debugmsg(0, 0, "npcAI_108962")

	local boss = dungeon_197_1[room_id].boss
	local battle_listener = dungeon_197_1[room_id].battle_listener

	while dungeon_197_1[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			boss:useSkill("skill3")
			boss:useSkill("skill1", that(boss.attack_target_GUID))
			boss:useSkill("skill2")
		end
		dungeon_197_1:sleep()
	end
end