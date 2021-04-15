-------------------------------------------------------------------
--	Zone 26 World Boss	qulanda
-------------------------------------------------------------------
-------------------------------------------------------------------
--	Setting
-------------------------------------------------------------------
function WorldBoss_Qulanda_Setting()
	Global_WorldBoss_Qulanda.alpha = false
	Global_WorldBoss_Qulanda.beta = false
	Global_WorldBoss_Qulanda.delay = 0.5

	Global_WorldBoss_Qulanda.qulanda_orgid = 107698
	Global_WorldBoss_Qulanda.sun_orgid = 107759
	Global_WorldBoss_Qulanda.meteor_orgid = 107760

--	火焰上限
	Global_WorldBoss_Qulanda.flames_max_amount = 8
--	火焰持續時間
	Global_WorldBoss_Qulanda.flames_live_time = 12
--	延燒火焰持續時間
	Global_WorldBoss_Qulanda.spread_flames_live_time = 12
--	火焰開始延燒時間
	Global_WorldBoss_Qulanda.flames_start_spread = 8
--	制裁者上限
	Global_WorldBoss_Qulanda.servants_max_amount = 3
	
	-------------------------------------------------------------------
	--	奎蘭達技能設定
	-------------------------------------------------------------------
	Global_WorldBoss_Qulanda.skill = {}
	--	召喚太陽
	Global_WorldBoss_Qulanda.skill.summon_sun = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.summon_sun.name = "summon_sun"
	Global_WorldBoss_Qulanda.skill.summon_sun.cd = 0
	function Global_WorldBoss_Qulanda.skill.summon_sun:active(caster)
	--	選擇目標，仇恨最高
		local target = nil
		for index, hater in pairs(caster.hate_list_duplication) do
			if not target then target = hater
			elseif hater.hate_point > target.hate_point then target = hater end
		end
		if not target then return false end
		caster.movable = false
		WorldBoss_Qulanda_Inintialize_Sun {x = target.x, y = target.y, z = target.z}
		caster:say("[SC_WORLDBOSSQULANDA_07]", 3)
		for index, player in pairs(Global_WorldBoss_Qulanda.players) do
			if player ~= target then player:message("[$MUTE]".."[SC_WORLDBOSSQULANDA_08]")
			else player:message("[$MUTE]".."[SC_WORLDBOSSQULANDA_08]") end
		end
		caster:castSpell(target.x, target.y, target.z, 851118)
		Global_WorldBoss_Qulanda:sleep(1.5)
		Global_WorldBoss_Qulanda.sun:addToPartition()
		Global_WorldBoss_Qulanda.sun.fight = true
		Global_WorldBoss_Qulanda.sun.search_enemy = true
		Global_WorldBoss_Qulanda.sun.strike_back = true
		Global_WorldBoss_Qulanda.sun:hate(target)
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(3)
		return true
	end
	--	召喚流星
	Global_WorldBoss_Qulanda.skill.summon_meteor = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.summon_meteor.name = "summon_meteor"
	Global_WorldBoss_Qulanda.skill.summon_meteor.cd = 0
	function Global_WorldBoss_Qulanda.skill.summon_meteor:active(caster)
	--	選擇目標，仇恨最低
		local target = nil
		for index, hater in pairs(caster.hate_list_duplication) do
			if not target then target = hater
			elseif hater.hate_point < target.hate_point then target = hater end
		end
		if not target then return false end
		caster.movable = false
		WorldBoss_Qulanda_Inintialize_Meteor {x = target.x, y = target.y, z = target.z}
		caster:say("[SC_WORLDBOSSQULANDA_07]", 3)
		for index, player in pairs(Global_WorldBoss_Qulanda.players) do
			if player ~= target then player:message("[$MUTE]".."[SC_WORLDBOSSQULANDA_08]")
			else player:message("[$MUTE]".."[SC_WORLDBOSSQULANDA_08]") end
		end
		caster:castSpell(target.x, target.y, target.z, 851119)
		Global_WorldBoss_Qulanda:sleep(1.5)
		Global_WorldBoss_Qulanda.meteor:addToPartition()
		Global_WorldBoss_Qulanda.meteor.fight = true
		Global_WorldBoss_Qulanda.meteor.search_enemy = true
		Global_WorldBoss_Qulanda.meteor.strike_back = true
		Global_WorldBoss_Qulanda.meteor:hate(target)
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(3)
		return true
	end
	--	召喚制裁者
	Global_WorldBoss_Qulanda.skill.summon_punisher = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.summon_punisher.name = "summon_punisher"
	Global_WorldBoss_Qulanda.skill.summon_punisher.cd = 10
	function Global_WorldBoss_Qulanda.skill.summon_punisher:active(caster)
		local target = Global_WorldBoss_Qulanda.players[RandRange(1, #Global_WorldBoss_Qulanda.players)]
		if not target then return false end
		caster.movable = false
		if Global_WorldBoss_Qulanda.qulanda.mood == "anxious" or Global_WorldBoss_Qulanda.qulanda.mood == "angry" then
			caster:say("[SC_WORLDBOSSQULANDA_11]", 3)
		else caster:say("[SC_WORLDBOSSQULANDA_10]", 3) end
		caster:castSpell(target.x, target.y, target.z, 851120)
		local _servant = Christine.Npc:new()
		_servant:create(108114, target.x, target.y, target.z)
		_servant.fight = true
		_servant.strike_back = true
		_servant.search_enemy = true
		_servant.patrol = false
		_servant.revive = false
		_servant.is_walk = 0
		_servant:addToPartition()
		_servant:hate(target)
		_servant:beginPlot("WorldBoss_Qulanda_Punisher_AI")
		table.insert(Global_WorldBoss_Qulanda.servants, _servant)
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(3)
		return true
	end
	--	冥想
	Global_WorldBoss_Qulanda.skill.meditation = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.meditation.name = "meditation"
	Global_WorldBoss_Qulanda.skill.meditation.cd = 32
	function Global_WorldBoss_Qulanda.skill.meditation:active(caster)
		caster.strike_back = false
		caster.search_enemy = false
		caster.movable = false
		caster:stopMove()
		caster:castSpell(caster, 851121)
		while Global_WorldBoss_Qulanda.status == "fight" and caster.spell_magic_ORGID == 851121 do
			Global_WorldBoss_Qulanda:sleep()
		end
		Global_WorldBoss_Qulanda:sleep(1)
		if Global_WorldBoss_Qulanda.qulanda.is_spell_success then
			Global_WorldBoss_Qulanda:debug("skill > meditation success")
			Global_WorldBoss_Qulanda.qulanda.is_spell_success = false
			caster:say("[SC_WORLDBOSSQULANDA_14]", 3)
			if Global_WorldBoss_Qulanda.sun then Global_WorldBoss_Qulanda.sun:addBuff(624695, 10) end
			if Global_WorldBoss_Qulanda.meteor then Global_WorldBoss_Qulanda.meteor:addBuff(624698, 10) end
		else
			Global_WorldBoss_Qulanda:debug("skill > meditation fail")
			caster:say("[SC_WORLDBOSSQULANDA_12]", 3)
			caster:playMotion(ruFUSION_MIME_KNOCKDOWN_END)
			Global_WorldBoss_Qulanda:sleep(1.5)
			caster:playMotion(ruFUSION_MIME_KNOCKDOWN_RECOVER)
			Global_WorldBoss_Qulanda:sleep(1)
		end
		caster.strike_back = true
		caster.search_enemy = true
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	--	怒火狂燒
	Global_WorldBoss_Qulanda.skill.fire_of_extreme_anger = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.fire_of_extreme_anger.name = "fire_of_extreme_anger"
	Global_WorldBoss_Qulanda.skill.fire_of_extreme_anger.cd = 18
	function Global_WorldBoss_Qulanda.skill.fire_of_extreme_anger:active(caster)
	--	選擇目標，仇恨最高
		local target = nil
		for index, hater in pairs(caster.hate_list_duplication) do
			if not target then target = hater
			elseif hater.hate_point > target.hate_point then target = hater end
		end
		if not target then return false end
		caster.movable = false
		caster:stopMove()
		caster:castSpell(target, 851122)
		while Global_WorldBoss_Qulanda.status == "fight" and caster.spell_magic_ORGID == 851122 do
			Global_WorldBoss_Qulanda:sleep()
		end
		Global_WorldBoss_Qulanda:sleep(1)
		if Global_WorldBoss_Qulanda.qulanda.is_spell_success then
			Global_WorldBoss_Qulanda.qulanda.is_spell_success = false
			Global_WorldBoss_Qulanda:debug("skill > fire_of_extreme_anger success")
			caster:systemCastSpell(caster, 851126)
			Global_WorldBoss_Qulanda:sleep(1.5)
			caster:systemCastSpell(caster, 851126)
		else
			Global_WorldBoss_Qulanda:debug("skill > fire_of_extreme_anger fail")
		end
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	--	火元素支配
	Global_WorldBoss_Qulanda.skill.domination_of_fire_element = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.domination_of_fire_element.name = "domination_of_fire_element"
	Global_WorldBoss_Qulanda.skill.domination_of_fire_element.cd = 18
	function Global_WorldBoss_Qulanda.skill.domination_of_fire_element:active(caster)
		local targets = {}
		if #caster.hate_list_duplication > 2 then
			targets = table.random(caster.hate_list_duplication, 2)
		else
			targets = caster.hate_list_duplication
		end
		if not targets or #targets <= 0 then return false end
		caster.movable = false
		caster:stopMove()
		for index = 1, #targets do
			caster:castSpell(targets[index], 851123)
		end
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	--	炭烤制裁者
	Global_WorldBoss_Qulanda.skill.punisher_bbq = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.punisher_bbq.name = "punisher_bbq"
	Global_WorldBoss_Qulanda.skill.punisher_bbq.cd = 48
	function Global_WorldBoss_Qulanda.skill.punisher_bbq:active(caster)
		local targets = Global_WorldBoss_Qulanda.servants
		if #targets <= 0 then return false end
		Global_WorldBoss_Qulanda:debug("skill > punisher_bbq, #targets : " .. #targets)
		for index, target in pairs(targets) do
			caster:systemCastSpell(target, 851124)
		end
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	--	火元素攻擊(普攻附加)
--	Global_WorldBoss_Qulanda.skill.fire_attack = Christine.Skill:new()
--	Global_WorldBoss_Qulanda.skill.fire_attack.name = "fire_attack"
--	Global_WorldBoss_Qulanda.skill.fire_attack.cd = 1
--	function Global_WorldBoss_Qulanda.skill.fire_attack:active(caster) caster:say(self.name) end

	-------------------------------------------------------------------
	--	太陽技能設定
	-------------------------------------------------------------------
	--	磁場轉換
	Global_WorldBoss_Qulanda.skill.switch_magnetic_field = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.switch_magnetic_field.name = "switch_magnetic_field"
	Global_WorldBoss_Qulanda.skill.switch_magnetic_field.cd = 18
	function Global_WorldBoss_Qulanda.skill.switch_magnetic_field:active(caster)
		local _lv = caster.buff[624695].power - 5
		caster:cancelBuff(624695)
		caster:addBuff(624695, _lv)
		caster:cancelBuff(624697)
		if caster.buff[624697] then caster:cancelBuff(624697) end
		caster.movable = false
		caster:stopAttack()
		caster:stopMove()
		caster:castSpell(caster, 851127)
		for index, servant in pairs(Global_WorldBoss_Qulanda.servants) do
			if caster:distanceTo(servant) <= 200 then servant:addBuff(624778) end
		end
		caster.movable = true
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	function Global_WorldBoss_Qulanda.skill.switch_magnetic_field:inactive(caster)
		if not caster.buff[624697] then caster:addBuff(624697) end
	end
	--	太陽風暴
	Global_WorldBoss_Qulanda.skill.solar_storm = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.solar_storm.name = "solar_storm"
	Global_WorldBoss_Qulanda.skill.solar_storm.cd = 12
	function Global_WorldBoss_Qulanda.skill.solar_storm:active(caster)
		local _lv = caster.buff[624695].power - 3
		caster:cancelBuff(624695)
		caster:addBuff(624695, _lv)
		caster:cancelBuff(624696)
		if caster.buff[624696] then caster:cancelBuff(624696) end
		caster:castSpell(caster, 851128)
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	function Global_WorldBoss_Qulanda.skill.solar_storm:inactive(caster)
		if not caster.buff[624696] then caster:addBuff(624696) end
	end
	--	地獄冕圈
	Global_WorldBoss_Qulanda.skill.coronal_loop_from_hell = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.coronal_loop_from_hell.name = "coronal_loop_from_hell"
	Global_WorldBoss_Qulanda.skill.coronal_loop_from_hell.cd = 12
	function Global_WorldBoss_Qulanda.skill.coronal_loop_from_hell:active(caster, target)
	--	選擇目標，仇恨最高
		local target = nil
		for index, hater in pairs(caster.hate_list_duplication) do
			if not target then target = hater
			elseif hater.hate_point > target.hate_point then target = hater end
		end
		if not target then return false end
		local _lv = caster.buff[624695].power - 1
		caster:cancelBuff(624695)
		caster:addBuff(624695, _lv)
		caster:systemCastSpell(target, 851129)
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	--	α粒子能量轉換
	Global_WorldBoss_Qulanda.skill.conversion_of_alpha_energy = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.conversion_of_alpha_energy.name = "conversion_of_alpha_energy"
	Global_WorldBoss_Qulanda.skill.conversion_of_alpha_energy.cd = 24
	function Global_WorldBoss_Qulanda.skill.conversion_of_alpha_energy:active(caster)
		caster:castSpell(Global_WorldBoss_Qulanda.qulanda, 851130, caster.buff[624695].power)
		Global_WorldBoss_Qulanda:sleep(1.5)
		caster:cancelBuff(624695)
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end

	-------------------------------------------------------------------
	--	流星技能設定
	-------------------------------------------------------------------
	--	流星衝撞
	Global_WorldBoss_Qulanda.skill.strike_of_meteor = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.strike_of_meteor.name = "strike_of_meteor"
	Global_WorldBoss_Qulanda.skill.strike_of_meteor.cd = 24
	function Global_WorldBoss_Qulanda.skill.strike_of_meteor:active(caster, target)
	--	選擇目標，距離最遠
		local target = nil
		for index, player in pairs(Global_WorldBoss_Qulanda.players) do
			if not target then target = player
			elseif caster:distanceTo(player) > caster:distanceTo(target) then target = player end
		end
		if not target then return false end
		caster:addBuff(624776)
		caster.fight = false
		local time_mark = Global_WorldBoss_Qulanda.battle_listener.current_time
		while Global_WorldBoss_Qulanda.meteor.buff[624698] do
			if not caster.move_target then
				local _targets = {}
				if #Global_WorldBoss_Qulanda.players > 2 then
					for index, player in pairs(Global_WorldBoss_Qulanda.players) do
						if player.GUID ~= Global_WorldBoss_Qulanda.qulanda.attack_target_GUID and not player.is_dead and caster:distanceTo(player) < 500 then
							table.insert(_targets, player)
						end
					end
				else
					_targets = Global_WorldBoss_Qulanda.players
				end
				caster.move_target = _targets[RandRange(1, #_targets)]
			elseif caster:distanceTo(caster.move_target) <= 15 then
				caster.move_target = nil
			else caster:move(caster.move_target.x, caster.move_target.y, caster.move_target.z) end			
			Global_WorldBoss_Qulanda:sleep()
		end
		caster.fight = true
		caster:cancelBuff(624776)
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end
	--	高能爆炸
	Global_WorldBoss_Qulanda.skill.high_energy_explosion = Christine.Skill:new()
	Global_WorldBoss_Qulanda.skill.high_energy_explosion.name = "high_energy_explosion"
	Global_WorldBoss_Qulanda.skill.high_energy_explosion.cd = 3
	function Global_WorldBoss_Qulanda.skill.high_energy_explosion:active(caster)
		Global_WorldBoss_Qulanda:debug("meteor skill > high_energy_explosion")
		caster.fight = false
		caster.strike_back = false
		caster.search_enemy = false
		caster:stopMove():stopAttack():castSpell(caster, 851132)
		for index = 1, 3 do
			local _flame = Christine.Npc:new()
			_flame:create(108115, caster.x - 40 + RandRange(1, 80), caster.y - 40 + RandRange(1, 80), caster.z - 40 + RandRange(1, 80))
			_flame.fight = false
			_flame.strike_back = false
			_flame.search_enemy = false
			_flame.mark = false
			_flame.show_role_head = false
			_flame.patrol = false
			_flame.movable = false
			_flame.hide_hp_mp = true
			_flame.hide_name = true
			_flame.live_time = Global_WorldBoss_Qulanda.flames_live_time
			_flame.is_burning = true
			_flame:addToPartition()
			_flame:addBuff(624754)
			table.insert(Global_WorldBoss_Qulanda.flames, _flame)
		end
		Global_WorldBoss_Qulanda:sleep(1)
		caster:kill(caster)
		Global_WorldBoss_Qulanda:sleep(2)
		return true
	end

	Global_WorldBoss_Qulanda:debug("setting done")
end

-------------------------------------------------------------------
--	急救箱
-------------------------------------------------------------------
function QuestNPC_122912_create()
	local aid_kit = Christine.Npc:new(OwnerID())
	aid_kit:addTouchPlot("QuestNPC_122912_touch", 20)
	aid_kit:cursorType(eCursor_Pickup)
	aid_kit.register1 = 0
end
function QuestNPC_122912_touch()
	if not Global_WorldBoss_Qulanda or Global_WorldBoss_Qulanda.status ~= "fight" then
		Global_WorldBoss_Qulanda:debug("not in fight")
		return false
	end
	local player = nil
	local aid_kit = Christine.Npc:new(TargetID())
	for index, _player in pairs(Global_WorldBoss_Qulanda.players) do
		if _player.GUID == OwnerID() then player = _player end
	end
	if not player then
		Global_WorldBoss_Qulanda:debug("not found player")
		return false
	end
	if aid_kit.register1 == 0 then aid_kit.register1 = player.GUID end
	aid_kit:beginPlot("QuestNPC_122912_cd")
	if aid_kit.register1 ~= player.GUID then return false end
	if player.mild_burn_level then
		player:cancelBuff(624700)
		Global_WorldBoss_Qulanda:debug("mild_burn_level : " .. player.mild_burn_level)
	elseif player.severe_burn_level then
		player:cancelBuff(624701)
		Global_WorldBoss_Qulanda:debug("severe_burn_level : " .. player.severe_burn_level)
	else
		Global_WorldBoss_Qulanda:debug("not burn")
	end
	return true
end
function QuestNPC_122912_cd()
	local aid_kit = Christine.Npc:new(OwnerID())
	aid_kit:property {
		show = false,
		show_role_head = false,
		mark = false,
		hide_hp_mp = true,
		hide_name = true
	}
	Global_WorldBoss_Qulanda:sleep(24)
	aid_kit:property {
		register1 = 0,
		show = true,
		show_role_head = true,
		mark = true,
		hide_hp_mp = false,
		hide_name = false
	}
end

-------------------------------------------------------------------
--	唱法成功
-------------------------------------------------------------------
function WorldBoss_Qulanda_Spell_Success()
	Global_WorldBoss_Qulanda:debug("spell success!")
	Global_WorldBoss_Qulanda.qulanda.is_spell_success = true
end

-------------------------------------------------------------------
--	制裁者燒毀
-------------------------------------------------------------------
function WorldBoss_Qulanda_Burn_Out()
	Global_WorldBoss_Qulanda:debug("punisher burn out")
	local this = nil
	for index, punisher in pairs(Global_WorldBoss_Qulanda.servants) do
		if punisher.GUID == OwnerID() then this = punisher end
	end
	if not this then return end
	KillID(this.GUID, this.GUID)
end

-------------------------------------------------------------------
--	產生火焰
-------------------------------------------------------------------
function WorldBoss_Qulanda_Create_Fire()
	Global_WorldBoss_Qulanda:debug("create fire")
	local target = Christine.Player:new(TargetID())
	local _flame = Christine.Npc:new()
	_flame:create(108115, target.x, target.y, target.z)
	_flame.fight = false
	_flame.strike_back = false
	_flame.search_enemy = false
	_flame.mark = false
	_flame.show_role_head = false
	_flame.patrol = false
	_flame.movable = false
	_flame.hide_hp_mp = true
	_flame.hide_name = true
	_flame.live_time = Global_WorldBoss_Qulanda.flames_live_time
	_flame.is_burning = true
	_flame:addToPartition()
	_flame:addBuff(624754)
	table.insert(Global_WorldBoss_Qulanda.flames, _flame)
end

-------------------------------------------------------------------
--	輕度灼傷檢查
-------------------------------------------------------------------
function MagicObject_624700_check()
	local target = nil
	for index, player in pairs(Global_WorldBoss_Qulanda.players) do
		if player.GUID == TargetID() then
			target = player
		end
	end
	if not target then
		target = Christine.Player:new(TargetID())
		target.last_check_time = Global_WorldBoss_Qulanda.battle_listener.current_time
		table.insert(Global_WorldBoss_Qulanda.players, target)
	end
	if target.mild_burn_level and target.mild_burn_level > 4 then
		target.mild_burn_level = nil
		target.severe_burn_level = 0
		target:cancelBuff(624700, false)
		target:addBuff(624701)
		return false
	elseif target.mild_burn_level then
		target.mild_burn_level = target.mild_burn_level + 1
		target:cancelBuff(624700, false)
		target:addBuff(624700, target.mild_burn_level)
		return false
	elseif target.severe_burn_level then
		target.severe_burn_level = target.severe_burn_level + 1
		if target.severe_burn_level > 5 then target.severe_burn_level = 5 end
		target:cancelBuff(624701, false)
		target:addBuff(624701, target.severe_burn_level)
		return false
	end
	target.mild_burn_level = 0
	return true
end

-------------------------------------------------------------------
--	重度灼傷檢查
-------------------------------------------------------------------
function MagicObject_624701_check()
	local target = nil
	for index, player in pairs(Global_WorldBoss_Qulanda.players) do
		if player.GUID == TargetID() then
			target = player
		end
	end
	if not target then
		target = Christine.Player:new(TargetID())
		target.last_check_time = Global_WorldBoss_Qulanda.battle_listener.current_time
		table.insert(Global_WorldBoss_Qulanda.players, target)
	end
	if target.mild_burn_level then
		target.mild_burn_level = nil
		target.severe_burn_level = 0
		target:cancelBuff(624700, false)
		target:addBuff(624701, target.mild_burn_level)
		return false
	elseif target.severe_burn_level then
		target.severe_burn_level = target.severe_burn_level + 1
		if target.severe_burn_level > 5 then target.severe_burn_level = 5 end
		target:cancelBuff(624701, false)
		target:addBuff(624701, target.severe_burn_level)
		return false
	end
	target.severe_burn_level = 0
	return true
end

-------------------------------------------------------------------
--	燒傷情況減緩
-------------------------------------------------------------------
function MagicCollection_851161_check()
--	Global_WorldBoss_Qulanda:debug("magic collection 851161 check")
	return true
end
function MagicObject_624761_check()
--	Global_WorldBoss_Qulanda:debug("magic object 624761 check")
	return true
end
function MagicObject_624761()
	if Global_WorldBoss_Qulanda.status ~= "fight" then return false end
	local target = nil
	for index, player in pairs(Global_WorldBoss_Qulanda.players) do
		if player.GUID == TargetID() then
			target = player
		end
	end
	if not target then Global_WorldBoss_Qulanda:debug("not found in players list") return end
	if target.mild_burn_level and target.mild_burn_level > 0 then
		target.mild_burn_level = target.mild_burn_level - 1
		target:cancelBuff(624700, false)
		target:addBuff(624700, target.mild_burn_level)
		return
	elseif target.mild_burn_level then
		target.mild_burn_level = nil
	elseif target.severe_burn_level and target.severe_burn_level > 0 then
		target.severe_burn_level = target.severe_burn_level - 1
		target:cancelBuff(624701, false)
		target:addBuff(624701, target.severe_burn_level)
		return
	elseif target.severe_burn_level then
		target.severe_burn_level = nil
		target.mild_burn_level = 2
		target:cancelBuff(624701, false)
		target:addBuff(624700, target.mild_burn_level)
		return
	end
end

-------------------------------------------------------------------
--	流星衝撞
-------------------------------------------------------------------
function MagicCollection_851131_check()
	if not Global_WorldBoss_Qulanda.meteor.buff[624698] then return false end
	if Global_WorldBoss_Qulanda.meteor.buff[624698].power == 0 then
		Global_WorldBoss_Qulanda.meteor:cancelBuff(624698)
	else
		local _lv = Global_WorldBoss_Qulanda.meteor.buff[624698].power - 1
		Global_WorldBoss_Qulanda.meteor:cancelBuff(624698)
		Global_WorldBoss_Qulanda.meteor:addBuff(624698, _lv)
	end
	return true
end

-------------------------------------------------------------------
--	炙燒
-------------------------------------------------------------------
function MagicObject_624699_check()
	return true
end

-------------------------------------------------------------------
--	火元素攻擊
-------------------------------------------------------------------
function MagicCollection_851125_check()
	Global_WorldBoss_Qulanda:debug("attack of fire element")
	return true
end
function MagicObject_624704_check()
	Global_WorldBoss_Qulanda:debug("create fire!")
	return true
end