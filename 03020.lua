-------------------------------------------------------------------
--	Zone 26 World Boss	qulanda
-------------------------------------------------------------------
-------------------------------------------------------------------
--	AI
-------------------------------------------------------------------
-------------------------------------------------------------------
--	qulanda AI
-------------------------------------------------------------------
function WorldBoss_Qulanda_Boss_AI()
	Global_WorldBoss_Qulanda:debug("qulanda ai start")
	local first_summon_sun = false
	local first_summon_meteor = false
	local first_summon_punicher = false
	local _hate_list_guid = {}

	local qulanda = Global_WorldBoss_Qulanda.qulanda

	Global_WorldBoss_Qulanda.qulanda.hate_list_duplication = {}

	while Global_WorldBoss_Qulanda.status == "fight" do

		qulanda.hate_list_duplication = qulanda.hate_list

		_hate_list_guid = {}
		for index, player in pairs(Global_WorldBoss_Qulanda.battle_listener.players) do
			table.insert(_hate_list_guid, player.GUID)
		end
		Lua_DW_WBLvCheck_Table(_hate_list_guid)

		-------------------------------------------------------------------
		--	心情
		-------------------------------------------------------------------
		if qulanda.hp > qulanda.max_hp * 0.9 then
			if not qulanda.buff[624762] then
				qulanda.mood = "pride"
				qulanda:addBuff(624762)
				qulanda:cancelBuff(624763)
				qulanda:cancelBuff(624764)
				qulanda:cancelBuff(624770)
			end
		elseif qulanda.hp > qulanda.max_hp * 0.5 then
			if not qulanda.buff[624763] then
				qulanda.mood = "excited"
				qulanda:cancelBuff(624762)
				qulanda:addBuff(624763)
				qulanda:cancelBuff(624764)
				qulanda:cancelBuff(624770)
				qulanda:say("[SC_WORLDBOSSQULANDA_04]", 3)
			end
		elseif qulanda.hp > qulanda.max_hp * 0.25 then
			if not qulanda.buff[624764] then
				qulanda.mood = "anxious"
				qulanda:cancelBuff(624762)
				qulanda:cancelBuff(624763)
				qulanda:addBuff(624764)
				qulanda:cancelBuff(624770)
				qulanda:say("[SC_WORLDBOSSQULANDA_05]", 3)
			end
		else
			if not qulanda.buff[624770] then
				qulanda.mood = "angry"
				qulanda:cancelBuff(624763)
				qulanda:cancelBuff(624764)
				qulanda:cancelBuff(624764)
				qulanda:addBuff(624770)
				qulanda:say("[SC_WORLDBOSSQULANDA_06]", 3)
			end
		end

		if #Global_WorldBoss_Qulanda.qulanda.hate_list_duplication > 0 then

			-------------------------------------------------------------------
			--	開戰後先召喚太陽流星制裁者
			-------------------------------------------------------------------
			if not first_summon_punicher then
				if Global_WorldBoss_Qulanda.qulanda:useSkill("summon_punisher") then first_summon_punicher = true end
			end
			if not first_summon_sun then
				if Global_WorldBoss_Qulanda.qulanda:useSkill("summon_sun") then first_summon_sun = true end
			end
			if not first_summon_meteor then
				if Global_WorldBoss_Qulanda.qulanda:useSkill("summon_meteor") then first_summon_meteor = true end
			end

			-------------------------------------------------------------------
			--	如果：危急狀態、HP低於50%
			-------------------------------------------------------------------
			if Global_WorldBoss_Qulanda.qulanda.mood == "anxious" and
			   Global_WorldBoss_Qulanda.qulanda.hp < Global_WorldBoss_Qulanda.qulanda.max_hp * 0.5 then
				-------------------------------------------------------------------
				--	如果：有太陽、太陽磁場轉換CD完、太陽距離奎蘭達110碼內
				-------------------------------------------------------------------
				if Global_WorldBoss_Qulanda.sun and
				   Global_WorldBoss_Qulanda.sun.skill.switch_magnetic_field.ready and
				   Global_WorldBoss_Qulanda.qulanda:distanceTo(Global_WorldBoss_Qulanda.sun) < 110 then
				--	太陽扣招
					Global_WorldBoss_Qulanda.sun.keep_energy = true
					-------------------------------------------------------------------
					--	如果：太陽能量足夠施放磁場轉換
					-------------------------------------------------------------------
					if Global_WorldBoss_Qulanda.sun.buff[624695] and
					   Global_WorldBoss_Qulanda.sun.buff[624695].power > 4 and
					   Global_WorldBoss_Qulanda.qulanda.skill.meditation.ready then
						Global_WorldBoss_Qulanda.qulanda:say("[SC_WORLDBOSSQULANDA_13]", 3)
					--	解除太陽扣招
						Global_WorldBoss_Qulanda.sun.keep_energy = false
					--	奎蘭達開始冥想
						Global_WorldBoss_Qulanda.qulanda:useSkill("meditation")
					end
				-------------------------------------------------------------------
				--	沒有太陽協助
				-------------------------------------------------------------------
				else
				--	如果有太陽取消太陽扣招
					if Global_WorldBoss_Qulanda.sun then Global_WorldBoss_Qulanda.sun.keep_energy = false end
					Global_WorldBoss_Qulanda.qulanda:useSkill("meditation")
				end
			end

			if Global_WorldBoss_Qulanda.qulanda.mood ~= "pride" then
				if not Global_WorldBoss_Qulanda.sun and Global_WorldBoss_Qulanda.battle_listener.current_time - Global_WorldBoss_Qulanda.sun_die_time_mark > 30 then
					Global_WorldBoss_Qulanda:debug("no sun : skill summon_sun ready : " .. tostring(Global_WorldBoss_Qulanda.qulanda.skill.summon_sun.ready))
					Global_WorldBoss_Qulanda.qulanda:useSkill("summon_sun")
				end
				if not Global_WorldBoss_Qulanda.meteor and Global_WorldBoss_Qulanda.battle_listener.current_time - Global_WorldBoss_Qulanda.meteor_die_time_mark > 20 then
					Global_WorldBoss_Qulanda.qulanda:useSkill("summon_meteor")
				end
				Global_WorldBoss_Qulanda.qulanda:useSkill("fire_of_extreme_anger")
			end
			if #Global_WorldBoss_Qulanda.servants < Global_WorldBoss_Qulanda.servants_max_amount then
				Global_WorldBoss_Qulanda.qulanda:useSkill("summon_punisher")
			end
			if Global_WorldBoss_Qulanda.qulanda.mood ~= "anxious" then
				Global_WorldBoss_Qulanda.qulanda:useSkill("punisher_bbq")
				Global_WorldBoss_Qulanda.qulanda:useSkill("domination_of_fire_element")
			end
		end
	
		Global_WorldBoss_Qulanda:sleep()
	end

	Global_WorldBoss_Qulanda:debug("qulanda ai end")
end

-------------------------------------------------------------------
--	sun AI
-------------------------------------------------------------------
function WorldBoss_Qulanda_Sun_AI()
	Global_WorldBoss_Qulanda:debug("sun ai start")

	Global_WorldBoss_Qulanda.sun.hate_list_duplication = {}

	while Global_WorldBoss_Qulanda.status == "fight" do

		Global_WorldBoss_Qulanda.sun.hate_list_duplication = Global_WorldBoss_Qulanda.sun.hate_list

		if #Global_WorldBoss_Qulanda.sun.hate_list_duplication > 0 and not Global_WorldBoss_Qulanda.sun.keep_energy then
			if Global_WorldBoss_Qulanda.sun.buff[624695] then
				-------------------------------------------------------------------
				--	如果：奎蘭達冥想CD中、奎蘭達血量低於40%、太陽能量轉換CD完
				-------------------------------------------------------------------
				if not Global_WorldBoss_Qulanda.qulanda.skill.meditation.ready and
				   Global_WorldBoss_Qulanda.qulanda.hp < Global_WorldBoss_Qulanda.qulanda.max_hp * 0.41 and
				   Global_WorldBoss_Qulanda.sun.skill.conversion_of_alpha_energy.ready then
					Global_WorldBoss_Qulanda.sun:useSkill("conversion_of_alpha_energy")
				end
				if Global_WorldBoss_Qulanda.sun.buff[624695].power > 4 then
					Global_WorldBoss_Qulanda.sun:useSkill("switch_magnetic_field")
				end
				if Global_WorldBoss_Qulanda.sun.buff[624695].power > 2 then
					Global_WorldBoss_Qulanda.sun:useSkill("solar_storm")
				end
				if Global_WorldBoss_Qulanda.sun.buff[624695].power > 0 then
					Global_WorldBoss_Qulanda.sun:useSkill("coronal_loop_from_hell")
				end
			end
		elseif #Global_WorldBoss_Qulanda.players > 0 then
			Global_WorldBoss_Qulanda.sun:hate(Global_WorldBoss_Qulanda.players[RandRange(1, #Global_WorldBoss_Qulanda.players)])
		else
			Global_WorldBoss_Qulanda.sun:move(Global_WorldBoss_Qulanda.qulanda.x, Global_WorldBoss_Qulanda.qulanda.y, Global_WorldBoss_Qulanda.qulanda.z, false)
		end

		Global_WorldBoss_Qulanda:sleep()
	end

	Global_WorldBoss_Qulanda:debug("sun ai end")
end

-------------------------------------------------------------------
--	meteor AI
-------------------------------------------------------------------
function WorldBoss_Qulanda_Meteor_AI()
	Global_WorldBoss_Qulanda:debug("meteor ai start")

	Global_WorldBoss_Qulanda.meteor.hate_list_duplication = {}

	while Global_WorldBoss_Qulanda.status == "fight" do

		Global_WorldBoss_Qulanda.meteor.hate_list_duplication = Global_WorldBoss_Qulanda.meteor.hate_list

		if Global_WorldBoss_Qulanda.meteor.buff[624698] and Global_WorldBoss_Qulanda.meteor.buff[624698].power >= 9 then
			Global_WorldBoss_Qulanda.meteor:useSkill("high_energy_explosion")
		end
		if #Global_WorldBoss_Qulanda.meteor.hate_list_duplication > 0 and not Global_WorldBoss_Qulanda.meteor.keep_energy then
			if Global_WorldBoss_Qulanda.meteor.buff[624698] and Global_WorldBoss_Qulanda.meteor.buff[624698].power > 2 then
				Global_WorldBoss_Qulanda.meteor:useSkill("strike_of_meteor")
			end
		elseif #Global_WorldBoss_Qulanda.players > 0 then
			Global_WorldBoss_Qulanda.meteor:hate(Global_WorldBoss_Qulanda.players[RandRange(1, #Global_WorldBoss_Qulanda.players)])
		else
			Global_WorldBoss_Qulanda.meteor:move(Global_WorldBoss_Qulanda.qulanda.x, Global_WorldBoss_Qulanda.qulanda.y, Global_WorldBoss_Qulanda.qulanda.z, false)
		end

		Global_WorldBoss_Qulanda:sleep()
	end

	Global_WorldBoss_Qulanda:debug("meteor ai end")
end

-------------------------------------------------------------------
--	punisher AI
-------------------------------------------------------------------
function WorldBoss_Qulanda_Punisher_AI()
	Global_WorldBoss_Qulanda:debug("punisher ai start")

	local this = nil
	for index, servant in pairs(Global_WorldBoss_Qulanda.servants) do
		if servant.GUID == OwnerID() then this = servant end
	end
	if not this then return end

	while Global_WorldBoss_Qulanda.status == "fight" do
		-------------------------------------------------------------------
		--	磁場轉換狀態設置
		-------------------------------------------------------------------
		if not this.is_disoriented and this.buff[624778] then
			Global_WorldBoss_Qulanda:debug("punisher become disoriented")
			this.is_disoriented = true
			this.strike_back = false
			this.search_enemy = false
		elseif this.is_disoriented and not this.buff[624778] then
			Global_WorldBoss_Qulanda:debug("punisher leave disoriented")
			this.is_disoriented = false
			this.strike_back = true
			this.search_enemy = true
		end

		-------------------------------------------------------------------
		--	炙燒狀態設置
		-------------------------------------------------------------------
		if not this.is_bbq and this.buff[624699] then
			Global_WorldBoss_Qulanda:debug("punisher become bbq")
			this.is_bbq = true
			this.strike_back = false
			this.search_enemy = false
		end

		-------------------------------------------------------------------
		--	磁場轉換狀態和炙燒狀態
		-------------------------------------------------------------------
		if this.is_bbq or this.is_disoriented then
			if not this.move_target then
				Global_WorldBoss_Qulanda:debug("bbq punisher look for target")
				local _targets = {}
				if #Global_WorldBoss_Qulanda.players > 2 then
					for index, player in pairs(Global_WorldBoss_Qulanda.players) do
						if player.GUID ~= Global_WorldBoss_Qulanda.qulanda.attack_target_GUID and not player.is_dead and this:distanceTo(player) < 500 then
							table.insert(_targets, player)
						end
					end
				else
					_targets = Global_WorldBoss_Qulanda.players
				end
				local _target = _targets[RandRange(1, #_targets)]
				if _target then this.move_target = {x = _target.x, y = _target.y, z = _target.z} end
			else
				this:move(this.move_target.x, this.move_target.y, this.move_target.z)
				this.move_target = nil
			end
		-------------------------------------------------------------------
		--	一般狀態
		-------------------------------------------------------------------
		else
		--	沒有仇恨隨便挑一個打
			if #this.hate_list <= 0 then
				this:hate(Global_WorldBoss_Qulanda.players[RandRange(1, #Global_WorldBoss_Qulanda.players)])
			end
		--	踩熄火焰
			for index, flame in pairs(Global_WorldBoss_Qulanda.flames) do
				if this:distanceTo(flame) < 15 then
					flame:delete()
					flame.is_burning = false
				end
			end
		--	踩熄延燒火焰
			for index, spread_flames in pairs(Global_WorldBoss_Qulanda.spread_flames) do
				if this:distanceTo(spread_flames) < 15 then
					local _flame = Christine.Npc:new()
					_flame:create(108115, spread_flames.x, spread_flames.y, spread_flames.z)
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
					spread_flames.is_burning = false
					spread_flames:delete()
					this:addBuff(624699)
				end
			end
		end

		Global_WorldBoss_Qulanda:sleep()
	end

	Global_WorldBoss_Qulanda:debug("punisher ai end")
end