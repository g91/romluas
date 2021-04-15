-------------------------------------------------------------------
--	Zone 26 World Boss	qulanda
-------------------------------------------------------------------
-------------------------------------------------------------------
--	Main
-------------------------------------------------------------------
-------------------------------------------------------------------
--	npc:107698 create plot
-------------------------------------------------------------------
function Npc_107698_CreatePlot()
	DebugMsg(0, 0, "Qulanda : create")

	if not Global_WorldBoss_Qulanda or Global_WorldBoss_Qulanda.alpha then
		Global_WorldBoss_Qulanda = Christine.System:new("Qulanda")
		Global_WorldBoss_Qulanda.handler = Christine.Npc:new()
		Global_WorldBoss_Qulanda.handler:create(107698, this().x, this().y, this().z)
		WorldBoss_Qulanda_Setting()
	end

	WorldBoss_Qulanda_Inintialize()

	Global_WorldBoss_Qulanda.qulanda:property({
		movable = true,
		search_enemy = true,
		strike_back = true,
		fight = true
	})
end
function Npc_107698_BeginAttack()
	if Global_WorldBoss_Qulanda.status == "standby" then
		Global_WorldBoss_Qulanda:debug("qulanda begin attack")
		Lua_DW_WBGUIDRecord(1)
		WorldBoss_Qulanda_Active()
	end
end
function Npc_107698_EndAttack()
	if not Global_WorldBoss_Qulanda.qulanda.is_dead then
		Global_WorldBoss_Qulanda:debug("qulanda end attack")
		Global_WorldBoss_Qulanda.status = "fail"
	end
end
function Npc_107698_DeadPlot()
	Global_WorldBoss_Qulanda:debug("qulanda dead")
	Global_WorldBoss_Qulanda.status = "success"
	Global_WorldBoss_Qulanda.qulanda.mood = "success"
	Global_WorldBoss_Qulanda.qulanda:say("[SC_WORLDBOSSQULANDA_15]", 3)
end
function Npc_107759_DeadPlot()
	Global_WorldBoss_Qulanda:debug("sun dead")
	Global_WorldBoss_Qulanda.battle_listener:remove(Global_WorldBoss_Qulanda.sun)
	Global_WorldBoss_Qulanda.sun = nil
	Global_WorldBoss_Qulanda.sun_die_time_mark = Global_WorldBoss_Qulanda.battle_listener.current_time
end
function Npc_107760_DeadPlot()
	Global_WorldBoss_Qulanda:debug("meteor dead")
	Global_WorldBoss_Qulanda.battle_listener:remove(Global_WorldBoss_Qulanda.meteor)
	Global_WorldBoss_Qulanda.meteor = nil
	Global_WorldBoss_Qulanda.meteor_die_time_mark = Global_WorldBoss_Qulanda.battle_listener.current_time
end
-------------------------------------------------------------------
--	initialize
-------------------------------------------------------------------
function WorldBoss_Qulanda_Inintialize()
	Global_WorldBoss_Qulanda.battle_listener = Christine.BattleListener:new()
	Global_WorldBoss_Qulanda.battle_listener.kick_out_player_delay = 0

	-------------------------------------------------------------------
	--	status : standby, fight, success, fail
	-------------------------------------------------------------------
	Global_WorldBoss_Qulanda.status = "standby"
	Global_WorldBoss_Qulanda.players = Global_WorldBoss_Qulanda.battle_listener.players
	Global_WorldBoss_Qulanda.servants = {}
	Global_WorldBoss_Qulanda.flames = {}
	Global_WorldBoss_Qulanda.spread_flames = {}
	Global_WorldBoss_Qulanda.sun_die_time_mark = 0
	Global_WorldBoss_Qulanda.meteor_die_time_mark = 0
	--
	WorldBoss_Qulanda_Inintialize_Qulanda()
	--

	Global_WorldBoss_Qulanda:debug("initialized")
end
function WorldBoss_Qulanda_Inintialize_Qulanda()
	Global_WorldBoss_Qulanda.qulanda = this()

	Global_WorldBoss_Qulanda.qulanda.hp = Global_WorldBoss_Qulanda.qulanda.max_hp

	Global_WorldBoss_Qulanda.qulanda.mood = "pride"
	Global_WorldBoss_Qulanda.qulanda.hp_less_then_30_percent = false
	Global_WorldBoss_Qulanda.qulanda.is_spell_success = false

	Global_WorldBoss_Qulanda.qulanda:addBuff(624762)
--	暫停自動回血
	Global_WorldBoss_Qulanda.qulanda:addBuff(502707)
	Global_WorldBoss_Qulanda.qulanda:addSkill("summon_sun", Global_WorldBoss_Qulanda.skill.summon_sun)
	Global_WorldBoss_Qulanda.qulanda:addSkill("summon_meteor", Global_WorldBoss_Qulanda.skill.summon_meteor)
	Global_WorldBoss_Qulanda.qulanda:addSkill("summon_punisher", Global_WorldBoss_Qulanda.skill.summon_punisher)
	Global_WorldBoss_Qulanda.qulanda:addSkill("meditation", Global_WorldBoss_Qulanda.skill.meditation)
	Global_WorldBoss_Qulanda.qulanda:addSkill("fire_of_extreme_anger", Global_WorldBoss_Qulanda.skill.fire_of_extreme_anger)
	Global_WorldBoss_Qulanda.qulanda:addSkill("domination_of_fire_element", Global_WorldBoss_Qulanda.skill.domination_of_fire_element)
	Global_WorldBoss_Qulanda.qulanda:addSkill("punisher_bbq", Global_WorldBoss_Qulanda.skill.punisher_bbq)

	Global_WorldBoss_Qulanda.battle_listener:add(Global_WorldBoss_Qulanda.qulanda)
end
function WorldBoss_Qulanda_Inintialize_Sun(_position)
	if Global_WorldBoss_Qulanda.sun then
		Global_WorldBoss_Qulanda.battle_listener:remove(Global_WorldBoss_Qulanda.sun)
		Global_WorldBoss_Qulanda.sun:delete()
	end
	Global_WorldBoss_Qulanda.sun = Christine.Npc:new()
	Global_WorldBoss_Qulanda.sun:create(107759, _position.x, _position.y, _position.z)
	Global_WorldBoss_Qulanda.sun.fight = false
	Global_WorldBoss_Qulanda.sun.search_enemy = false
	Global_WorldBoss_Qulanda.sun.strike_back = false
	Global_WorldBoss_Qulanda.sun.revive = false

	Global_WorldBoss_Qulanda.qulanda.is_spell_success = false
	Global_WorldBoss_Qulanda.sun.keep_energy = false

--	暫停自動回血
	Global_WorldBoss_Qulanda.sun:addBuff(502707)
	Global_WorldBoss_Qulanda.sun:addBuff(624222)
	Global_WorldBoss_Qulanda.sun:addSkill("switch_magnetic_field", Global_WorldBoss_Qulanda.skill.switch_magnetic_field)
	Global_WorldBoss_Qulanda.sun:addSkill("solar_storm", Global_WorldBoss_Qulanda.skill.solar_storm)
	Global_WorldBoss_Qulanda.sun:addSkill("coronal_loop_from_hell", Global_WorldBoss_Qulanda.skill.coronal_loop_from_hell)
	Global_WorldBoss_Qulanda.sun:addSkill("conversion_of_alpha_energy", Global_WorldBoss_Qulanda.skill.conversion_of_alpha_energy)

	Global_WorldBoss_Qulanda.battle_listener:add(Global_WorldBoss_Qulanda.sun)
	Global_WorldBoss_Qulanda.sun:beginPlot("WorldBoss_Qulanda_Sun_AI")
end
function WorldBoss_Qulanda_Inintialize_Meteor(_position)
	if Global_WorldBoss_Qulanda.meteor then
		Global_WorldBoss_Qulanda.battle_listener:remove(Global_WorldBoss_Qulanda.meteor)
		Global_WorldBoss_Qulanda.meteor:delete()
	end
	Global_WorldBoss_Qulanda.meteor = Christine.Npc:new()
	Global_WorldBoss_Qulanda.meteor:create(107760, _position.x, _position.y, _position.z)
	Global_WorldBoss_Qulanda.meteor.fight = false
	Global_WorldBoss_Qulanda.meteor.search_enemy = false
	Global_WorldBoss_Qulanda.meteor.strike_back = false
	Global_WorldBoss_Qulanda.meteor.revive = false

	Global_WorldBoss_Qulanda.meteor.keep_energy = false

--	暫停自動回血
	Global_WorldBoss_Qulanda.meteor:addBuff(502707)
	Global_WorldBoss_Qulanda.meteor:addBuff(624223)
	Global_WorldBoss_Qulanda.meteor:addSkill("strike_of_meteor", Global_WorldBoss_Qulanda.skill.strike_of_meteor)
	Global_WorldBoss_Qulanda.meteor:addSkill("high_energy_explosion", Global_WorldBoss_Qulanda.skill.high_energy_explosion)

	Global_WorldBoss_Qulanda.battle_listener:add(Global_WorldBoss_Qulanda.meteor)
	Global_WorldBoss_Qulanda.meteor:beginPlot("WorldBoss_Qulanda_Meteor_AI")
end
-------------------------------------------------------------------
--	active	
-------------------------------------------------------------------
function WorldBoss_Qulanda_Active()
	if Global_WorldBoss_Qulanda.status == "fight" then return end

	Global_WorldBoss_Qulanda:debug("active")

	Global_WorldBoss_Qulanda.status = "fight"
	Global_WorldBoss_Qulanda.handler:beginPlot("WorldBoss_Qulanda_MainLoop")

	Global_WorldBoss_Qulanda.qulanda:say("[SC_WORLDBOSSQULANDA_01]", 3)
	Global_WorldBoss_Qulanda:sleep(2)
	Global_WorldBoss_Qulanda.qulanda:say("[SC_WORLDBOSSQULANDA_02]", 3)

	Global_WorldBoss_Qulanda.qulanda:beginPlot("WorldBoss_Qulanda_Boss_AI")
	Global_WorldBoss_Qulanda.qulanda:hate(this())
	Global_WorldBoss_Qulanda:sleep(2)
	Global_WorldBoss_Qulanda.qulanda:say("[SC_WORLDBOSSQULANDA_03]", 3)
end
function WorldBoss_Qulanda_MainLoop()
	Global_WorldBoss_Qulanda:debug("active : main loop")

	-------------------------------------------------------------------
	--	temporary variable
	-------------------------------------------------------------------
	local is_match = false
	local kick_out_list = {}
	local counter = 0
	local buff_energy_of_alpha_time_mark = 0
	local buff_energy_of_speed_time_mark = 0

	Global_WorldBoss_Qulanda:debug("main loop start")
	while Global_WorldBoss_Qulanda.status == "fight" do

		Global_WorldBoss_Qulanda.battle_listener:start()

		-------------------------------------------------------------------
		--	檢查
		-------------------------------------------------------------------
		if not Global_WorldBoss_Qulanda.qulanda.hp_less_then_30_percent and
		   Global_WorldBoss_Qulanda.qulanda.hp / Global_WorldBoss_Qulanda.qulanda.max_hp <= 0.3 then
			Global_WorldBoss_Qulanda:debug("qulanda hp less then 30 percent")
			Global_WorldBoss_Qulanda.qulanda.hp_less_then_30_percent = true
		end

		-------------------------------------------------------------------
		--	[火元素感應] 檢查 : power等級等於場面火焰數量
		-------------------------------------------------------------------
		if #Global_WorldBoss_Qulanda.spread_flames > 0 then
			if not Global_WorldBoss_Qulanda.qulanda.buff[624692] or
			   Global_WorldBoss_Qulanda.qulanda.buff[624692].power ~= #Global_WorldBoss_Qulanda.spread_flames - 1 then
				Global_WorldBoss_Qulanda.qulanda:cancelBuff(624692)
				Global_WorldBoss_Qulanda.qulanda:addBuff(624692, #Global_WorldBoss_Qulanda.spread_flames - 1)
			end
		else
			Global_WorldBoss_Qulanda.qulanda:cancelBuff(624692)
		end

		-------------------------------------------------------------------
		--	[曼索瑞恩的失望] 檢查 : 血量低於30%後每12秒疊加一層
		-------------------------------------------------------------------
		if Global_WorldBoss_Qulanda.qulanda.hp_less_then_30_percent and Global_WorldBoss_Qulanda.battle_listener.duration_time % 12 == 0 then
			Global_WorldBoss_Qulanda.qulanda:addBuff(624694)
		end

		-------------------------------------------------------------------
		--	[α粒子能量] 檢查 : 太陽，每6秒疊加一層
		-------------------------------------------------------------------
		if Global_WorldBoss_Qulanda.sun then
			if buff_energy_of_alpha_time_mark <= Global_WorldBoss_Qulanda.battle_listener.current_time then
				Global_WorldBoss_Qulanda.sun:addBuff(624695)
				buff_energy_of_alpha_time_mark = Global_WorldBoss_Qulanda.battle_listener.current_time + 6 - ((#Global_WorldBoss_Qulanda.flames + #Global_WorldBoss_Qulanda.spread_flames) / 2)
			end
		end

		-------------------------------------------------------------------
		--	[高速能量] 檢查 : 流星，每8秒疊加一層，血越少疊越快
		-------------------------------------------------------------------
		if Global_WorldBoss_Qulanda.meteor and not Global_WorldBoss_Qulanda.meteor.buff[624776] then
			if buff_energy_of_speed_time_mark <= Global_WorldBoss_Qulanda.battle_listener.current_time then
				Global_WorldBoss_Qulanda.meteor:addBuff(624698)
				buff_energy_of_speed_time_mark = Global_WorldBoss_Qulanda.battle_listener.current_time + tonumber(string.format("%.0f", Global_WorldBoss_Qulanda.meteor.hp / Global_WorldBoss_Qulanda.meteor.max_hp * 8))
			end
		end

		-------------------------------------------------------------------
		--	場面火焰控制
		-------------------------------------------------------------------
		kick_out_list = {}
		for index, flame in pairs(Global_WorldBoss_Qulanda.flames) do
			if not flame.is_burning or not flame.is_legal or flame.is_dead then
				table.insert(kick_out_list, flame)
			elseif flame.ORGID == 108115 and not flame.first_check_time then
		--		如果是小火就記下開始燃燒的時間
				flame.first_check_time = Global_WorldBoss_Qulanda.battle_listener.current_time
			end
		end
		for index, flame in pairs(Global_WorldBoss_Qulanda.flames) do
		--	小火燃燒8秒後變大火
			if flame.first_check_time and flame.is_burning and
			   Global_WorldBoss_Qulanda.battle_listener.current_time - flame.first_check_time > Global_WorldBoss_Qulanda.flames_start_spread then
				Global_WorldBoss_Qulanda:debug("fire spread")
				local spread_flames = Christine.Npc:new()
				spread_flames:create(108116, flame.x, flame.y, flame.z)
				spread_flames.fight = false
				spread_flames.strike_back = false
				spread_flames.search_enemy = false
				spread_flames.mark = false
				spread_flames.show_role_head = false
				spread_flames.patrol = false
				spread_flames.movable = false
				spread_flames.hide_hp_mp = true
				spread_flames.hide_name = true
				spread_flames.live_time = Global_WorldBoss_Qulanda.spread_flames_live_time
				spread_flames.is_burning = true
				spread_flames:addToPartition()
				spread_flames:addBuff(624755)
				table.insert(Global_WorldBoss_Qulanda.spread_flames, spread_flames)
				flame.is_burning = false
				flame:delete()
			end
		end
		if (#Global_WorldBoss_Qulanda.flames - #kick_out_list) > Global_WorldBoss_Qulanda.flames_max_amount then
			for index = 1, #Global_WorldBoss_Qulanda.flames - #kick_out_list - Global_WorldBoss_Qulanda.flames_max_amount do
				table.insert(kick_out_list, Global_WorldBoss_Qulanda.flames[index])
			end
		end
		for index = 1, #kick_out_list do
			for index, flame in pairs(Global_WorldBoss_Qulanda.flames) do
				if flame == kick_out_list[index] then
					table.remove(Global_WorldBoss_Qulanda.flames, index)
					break
				end
			end
		end

		-------------------------------------------------------------------
		--	場面延燒火焰控制
		-------------------------------------------------------------------
		kick_out_list = {}
		for index, spread_flame in pairs(Global_WorldBoss_Qulanda.spread_flames) do
			if not spread_flame.is_burning or not spread_flame.is_legal or spread_flame.is_dead then
				table.insert(kick_out_list, spread_flame)
			end
		end
		for index = 1, #kick_out_list do
			for index, flame in pairs(Global_WorldBoss_Qulanda.spread_flames) do
				if flame == kick_out_list[index] then
					table.remove(Global_WorldBoss_Qulanda.spread_flames, index)
					break
				end
			end
		end

		-------------------------------------------------------------------
		--	場面制裁者控制
		-------------------------------------------------------------------
		kick_out_list = {}
		for index, servant in pairs(Global_WorldBoss_Qulanda.servants) do
			if not servant.is_legal or servant.is_dead then table.insert(kick_out_list, servant) end
		end
		for index = 1, #kick_out_list do
			for index, servant in pairs(Global_WorldBoss_Qulanda.servants) do
				if servant == kick_out_list[index] then
					table.remove(Global_WorldBoss_Qulanda.servants, index)
					break
				end
			end
		end

		-------------------------------------------------------------------
		--	戰鬥結束條件 : 開戰5秒後才開始判斷
		-------------------------------------------------------------------
		if Global_WorldBoss_Qulanda.battle_listener.duration_time > 4 and #Global_WorldBoss_Qulanda.players <= 0 then
			Global_WorldBoss_Qulanda.status = "fail"
		end
		-------------------------------------------------------------------
		--	戰鬥結束條件 : 奎蘭達走出門
		-------------------------------------------------------------------
		if Global_WorldBoss_Qulanda.qulanda.z > -8310 then
			Global_WorldBoss_Qulanda.status = "fail"
		end

		-------------------------------------------------------------------
		--	debug message
		-------------------------------------------------------------------
		--	戰鬥時間 & 戰鬥人數
--		Global_WorldBoss_Qulanda:debug("duration_time : " .. Global_WorldBoss_Qulanda.battle_listener.duration_time .. ", #players : " .. #Global_WorldBoss_Qulanda.players)
		--	玩家列表第一位的監視
--		if #Global_WorldBoss_Qulanda.players > 0 then Global_WorldBoss_Qulanda:debug("players.last_check_time : " .. Global_WorldBoss_Qulanda.players[1].last_check_time .. ", current_time : " .. Global_WorldBoss_Qulanda.battle_listener.current_time) end
		--	仇恨表第一位的仇恨監視
--		if #Global_WorldBoss_Qulanda.qulanda.hate_list > 0 then Global_WorldBoss_Qulanda:debug("hate_list[1].GUID : " .. Global_WorldBoss_Qulanda.qulanda.hate_list[1].GUID .. ", hate_point : " .. Global_WorldBoss_Qulanda.qulanda.hate_list[1].hate_point) end
		--	火焰數量監視
--		Global_WorldBoss_Qulanda:debug("#flames : " .. #Global_WorldBoss_Qulanda.flames .. ", #spread_flames : " .. #Global_WorldBoss_Qulanda.spread_flames)
		--	火元素控制技能監視
--		Global_WorldBoss_Qulanda:debug("domination_of_fire_element cd_counter : " .. Global_WorldBoss_Qulanda.qulanda.skill.domination_of_fire_element.cd_counter .. ", cd : " .. Global_WorldBoss_Qulanda.qulanda.skill.domination_of_fire_element.cd .. ", ready : " .. tostring(Global_WorldBoss_Qulanda.qulanda.skill.domination_of_fire_element.ready))
		--	太陽 &流星監視
--		Global_WorldBoss_Qulanda:debug("sun : " .. tostring(Global_WorldBoss_Qulanda.sun) .. ", meteor : " .. tostring(Global_WorldBoss_Qulanda.meteor))
		--	仇恨表 & 玩家數量監視
--		Global_WorldBoss_Qulanda:debug("#hate_list : " .. #Global_WorldBoss_Qulanda.qulanda.hate_list .. ", #players : " .. #Global_WorldBoss_Qulanda.players)
--		Global_WorldBoss_Qulanda:debug("punishers amount : " .. #Global_WorldBoss_Qulanda.servants)

		-------------------------------------------------------------------
		--	延遲
		-------------------------------------------------------------------
		Global_WorldBoss_Qulanda:sleep()
		
	end
	Global_WorldBoss_Qulanda.battle_listener:stop()

	for index, servant in pairs(Global_WorldBoss_Qulanda.servants) do servant:delete() end
	if Global_WorldBoss_Qulanda.sun then Global_WorldBoss_Qulanda.sun:delete() end
	if Global_WorldBoss_Qulanda.meteor then Global_WorldBoss_Qulanda.meteor:delete() end

	-------------------------------------------------------------------
	--	result
	-------------------------------------------------------------------
	if Global_WorldBoss_Qulanda.status == "success" then
		Global_WorldBoss_Qulanda:debug("success !")
	elseif Global_WorldBoss_Qulanda.status == "fail" then
		Global_WorldBoss_Qulanda:debug("fail !")
		for buff_id, buff in pairs(Global_WorldBoss_Qulanda.qulanda.buff) do
			Global_WorldBoss_Qulanda.qulanda:cancelBuff(buff_id, false)
		end
		Global_WorldBoss_Qulanda.qulanda:delFromPartition()
		Global_WorldBoss_Qulanda:sleep(10)
		Global_WorldBoss_Qulanda.qulanda:addToPartition()
	end

	Global_WorldBoss_Qulanda:debug("main loop stop")
end