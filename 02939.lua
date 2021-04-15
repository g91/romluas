-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------

-----------------------------------------------------------------
--	五王初始化
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_initialize(room_id)
	Global_BellatiaDuplication:debug("initialize > fifth boss")

	-----------------------------------------------------------------
	--	初始化設定
	-----------------------------------------------------------------
	if not Global_BellatiaDuplication_FifthBoss or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_setting() end

	-----------------------------------------------------------------
	--	初始化npc
	-----------------------------------------------------------------
		Global_BellatiaDuplication[room_id].saisimengde:delFromPartition()
		Global_BellatiaDuplication[room_id].mansuoruien:setPosition(
			Global_BellatiaDuplication.boss_initial_position_flag[5].x,
			Global_BellatiaDuplication.boss_initial_position_flag[5].y,
			Global_BellatiaDuplication.boss_initial_position_flag[5].z,
			Global_BellatiaDuplication.boss_initial_position_flag[5].direction
		)
		Global_BellatiaDuplication[room_id].mansuoruien:addToPartition(room_id)
		Global_BellatiaDuplication[room_id].mansuoruien.show = true
--		Global_BellatiaDuplication[room_id].mansuoruien.hide = false
		Global_BellatiaDuplication[room_id].mansuoruien.skill = {}
		Global_BellatiaDuplication[room_id].mansuoruien.hp = Global_BellatiaDuplication[room_id].mansuoruien.max_hp
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("fear_spread", Global_BellatiaDuplication_FifthBoss.skill_fear_spread)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("space_conversion", Global_BellatiaDuplication_FifthBoss.skill_space_conversion)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("dark_arrows", Global_BellatiaDuplication_FifthBoss.skill_dark_arrows)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("hourglass_of_life", Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("dark_rift", Global_BellatiaDuplication_FifthBoss.skill_dark_rift)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("the_anger_of_emperor", Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("core_of_disintegration", Global_BellatiaDuplication_FifthBoss.skill_core_of_disintegration)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("space_of_storm", Global_BellatiaDuplication_FifthBoss.skill_space_of_storm)
		Global_BellatiaDuplication[room_id].mansuoruien:addSkill("incredible_shock", Global_BellatiaDuplication_FifthBoss.skill_incredible_shock)
		Global_BellatiaDuplication[room_id].mansuoruien.skill.core_of_disintegration:lock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.space_of_storm:lock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.incredible_shock:lock()
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624592)	-- 左手特效
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624593)	-- 右手特效
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624594)	-- 左腳特效
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624595)	-- 右腳特效
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624596)	-- 胸前特效
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624471)

	-----------------------------------------------------------------
	--	五王參數
	-----------------------------------------------------------------
	--	階段1~5
		Global_BellatiaDuplication[room_id].step = 0
	--	轉換階段開關
		Global_BellatiaDuplication[room_id].step_trigger = false
	--	分身列表
		Global_BellatiaDuplication[room_id].mansuoruiens = {}
	--	崩解之核列表
		Global_BellatiaDuplication[room_id].cores_of_disintegration = {}
	--	全局和主體AI狀態
		Global_BellatiaDuplication[room_id].is_ai_stop = true
	--	曼索瑞恩分身AI狀態
		Global_BellatiaDuplication[room_id].sungchili_ai_stop = {true, true, true, true}
	--	戰鬥紀錄器
		Global_BellatiaDuplication[room_id].battleListener = AddyBattleListener:new()
		Global_BellatiaDuplication[room_id].battleListener:add(Global_BellatiaDuplication[room_id].mansuoruien)

	-----------------------------------------------------------------
	--	五王表演控制
	-----------------------------------------------------------------
	--	表演階段
		Global_BellatiaDuplication[room_id].drama_step = 0
	--	表演轉換開關
		Global_BellatiaDuplication[room_id].drama_step_trigger = false
	--	表演用隊伍移動
		Global_BellatiaDuplication[room_id].drama_npcs = {}
	--	表演紀錄
		Global_BellatiaDuplication[room_id].drama_record = {false, false, false, false, false, false, false, false, false, false, false, false, false, false}
	--	卡薩姆和康葛斯隨機閒聊紀錄
		Global_BellatiaDuplication[room_id].drama_random_record = {false, false, false, false, false}

	-----------------------------------------------------------------
	--	改變區域副本狀態
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_change_status(room_id, "boss")
end

-----------------------------------------------------------------
--	分身初始化
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_Sungchili_initialize(room_id)
	Global_BellatiaDuplication:debug("initialize > fifth boss sungchili" )
	-----------------------------------------------------------------
	--	建曼索瑞恩們
	-----------------------------------------------------------------
	for index = 1, 4 do
		local _mansuoruien = AddyBoss:new()
		_mansuoruien:create(Global_BellatiaDuplication_FifthBoss.mansuoruien_sungchili_orgid)
		_mansuoruien.movable = false
		_mansuoruien.fight = false
		_mansuoruien.search_enemy = false
		_mansuoruien.strike_back = false
		_mansuoruien.patrol = false
		_mansuoruien.is_live = true
		_mansuoruien.index = index
		_mansuoruien.hp = Global_BellatiaDuplication[room_id].mansuoruien.hp / Global_BellatiaDuplication[room_id].mansuoruien.max_hp * _mansuoruien.max_hp
		_mansuoruien:addBuff(624592)	-- 左手特效
		_mansuoruien:addBuff(624593)	-- 右手特效
		_mansuoruien:addBuff(624594)	-- 左腳特效
		_mansuoruien:addBuff(624595)	-- 右腳特效
		_mansuoruien:addBuff(624596)	-- 胸前特效
		_mansuoruien:addBuff(624471)
		Global_BellatiaDuplication[room_id].battleListener:add(_mansuoruien)
		LockHP(_mansuoruien.GUID, 1, "BellatiaDuplication_deadplot")
		table.insert(Global_BellatiaDuplication[room_id].mansuoruiens, _mansuoruien)
		Global_BellatiaDuplication:debug("fifth boss sungchili : Global_BellatiaDuplication[" .. room_id .. "].mansuoruiens[" .. index .. "].GUID = " .. Global_BellatiaDuplication[room_id].mansuoruiens[index].GUID)
	end

	-----------------------------------------------------------------
	--	曼索瑞恩們技能設定
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].mansuoruiens[1]:addBuff(624597)
	Global_BellatiaDuplication[room_id].mansuoruiens[1]:addSkill("fatal_ruling", Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling)
	Global_BellatiaDuplication[room_id].mansuoruiens[2]:addBuff(624598)
	Global_BellatiaDuplication[room_id].mansuoruiens[2]:addSkill("vacuum_extrusion", Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion)
	Global_BellatiaDuplication[room_id].mansuoruiens[3]:addBuff(624599)
	Global_BellatiaDuplication[room_id].mansuoruiens[3]:addSkill("devastating_chain", Global_BellatiaDuplication_FifthBoss.skill_devastating_chain)
	Global_BellatiaDuplication[room_id].mansuoruiens[4]:addBuff(624600)
	Global_BellatiaDuplication[room_id].mansuoruiens[4]:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
end

-----------------------------------------------------------------
--	啟動
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_active()
	Global_BellatiaDuplication:debug("active > fifth boss -> function Lua_BellatiaDuplication_FifthBoss_active()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	初始化
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_FifthBoss_initialize(room_id)

	-----------------------------------------------------------------
	--	開始主迴圈
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_mainloop")

	-----------------------------------------------------------------
	--	第一階段劇情
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].drama_step = 1
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
	Lua_BellatiaDuplication_change_status(room_id, "drama")
end

function Lua_BellatiaDuplication_FifthBoss_mainloop()
	Global_BellatiaDuplication:debug("active > fifth boss main loop -> function Lua_BellatiaDuplication_FifthBoss_mainloop()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local _counter = 0
	local nobody_fear_spread = true
	local nobody_fear_spread_time_mark = Global_BellatiaDuplication[room_id].battleListener.current_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") or Lua_BellatiaDuplication_check_status(room_id, "drama") do

		Global_BellatiaDuplication[room_id].battleListener:start()
		if Global_BellatiaDuplication.type ~= "easy" and Global_BellatiaDuplication[room_id].battleListener.duration_time >= 1200 and not Global_BellatiaDuplication[room_id].mansuoruien.buff[624243] then
			Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624243)
		end

		-----------------------------------------------------------------
		--	劇情
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].drama_step_trigger then
			Global_BellatiaDuplication[room_id].drama_step_trigger = false
		--	drama1：卡薩姆沒頭一皺，認為事情並不單純
			if Global_BellatiaDuplication[room_id].drama_step == 1 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama1") end
		--	drama2：反派角色開戰前嗆聲
			if Global_BellatiaDuplication[room_id].drama_step == 2 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama2") end
		--	drama3：反派角色戰鬥中碎碎念1
			if Global_BellatiaDuplication[room_id].drama_step == 3 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama3") end
		--	drama4：反派角色戰鬥中碎碎念2
			if Global_BellatiaDuplication[room_id].drama_step == 4 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama4") end
		--	drama5：反派角色戰鬥中碎碎念3
			if Global_BellatiaDuplication[room_id].drama_step == 5 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama5") end
		--	drama6：反派角色戰鬥中碎碎念4
			if Global_BellatiaDuplication[room_id].drama_step == 6 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama6") end
		--	drama7：反派角色戰鬥中碎碎念5
			if Global_BellatiaDuplication[room_id].drama_step == 7 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama7") end
		--	drama8：反派角色戰鬥中碎碎念6
			if Global_BellatiaDuplication[room_id].drama_step == 8 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama8") end
		--	drama9：反派角色戰鬥中碎碎念7
			if Global_BellatiaDuplication[room_id].drama_step == 9 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama9") end
		--	drama10：反派角色戰鬥中碎碎念8
			if Global_BellatiaDuplication[room_id].drama_step == 10 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama10") end
		--	drama11：反派角色戰鬥中碎碎念9
			if Global_BellatiaDuplication[room_id].drama_step == 11 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama11") end
		--	drama12：反派角色戰鬥中碎碎念10
			if Global_BellatiaDuplication[room_id].drama_step == 12 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama12") end
		--	drama13：反派角色戰鬥中碎碎念11
			if Global_BellatiaDuplication[room_id].drama_step == 13 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama13") end
		--	drama14：傻傻的二人組終於回來打爆蔓索瑞恩
			if Global_BellatiaDuplication[room_id].is_ai_stop and
			   Global_BellatiaDuplication[room_id].drama_step == 14 then
				Global_BellatiaDuplication[room_id].drama_step_trigger = false
				Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama14")
			end
		--	drama15：卡喪母和康葛斯前往舞王路途
			if Global_BellatiaDuplication[room_id].drama_step == 15 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama15") end
		--	drama16：卡喪母和康葛斯前往舞王路途隨機abcde
			if Global_BellatiaDuplication[room_id].drama_step == 16 then
				for index, value in pairs(Global_BellatiaDuplication[room_id].drama_random_record) do
					if not value then break
					elseif index == #Global_BellatiaDuplication[room_id].drama_random_record then
						Global_BellatiaDuplication[room_id].drama_random_record = {false, false, false, false, false}
					end
				end
				local random = RandRange(1, 5)
				while Global_BellatiaDuplication[room_id].drama_random_record[random] do
					random = RandRange(1, 5)
					Global_BellatiaDuplication:sleep(0.1)
				end
				if random == 1 then
					Global_BellatiaDuplication[room_id].drama_random_record[1] = true
					Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama16a")
				elseif random == 2 then
					Global_BellatiaDuplication[room_id].drama_random_record[2] = true
					Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama16b")
				elseif random == 3 then
					Global_BellatiaDuplication[room_id].drama_random_record[3] = true
					Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama16c")
				elseif random == 4 then
					Global_BellatiaDuplication[room_id].drama_random_record[4] = true
					Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama16d")
				elseif random == 5 then
					Global_BellatiaDuplication[room_id].drama_random_record[5] = true
					Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_drama16e")
				end
			end
		end

		-----------------------------------------------------------------
		--	戰鬥
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].step_trigger and Global_BellatiaDuplication[room_id].is_ai_stop then
			Global_BellatiaDuplication:debug("step_trigger has been open")
			Global_BellatiaDuplication[room_id].step_trigger = false
		--	啟動五王第一階段
			if Global_BellatiaDuplication[room_id].step == 1 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_first_step") end
		--	啟動五王第二階段
			if Global_BellatiaDuplication[room_id].step == 2 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_second_step") end
		--	啟動五王第三階段
			if Global_BellatiaDuplication[room_id].step == 3 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_third_step") end
		--	啟動五王第四階段
			if Global_BellatiaDuplication[room_id].step == 4 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_fourth_step") end
		--	啟動五王第五階段
			if Global_BellatiaDuplication[room_id].step == 5 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_fifth_step") end
		--	啟動五王第六階段
			if Global_BellatiaDuplication[room_id].step == 6 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_sixth_step") end
		end

		-----------------------------------------------------------------
		--	系統延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(1)

		-----------------------------------------------------------------
		--	表演觸發條件
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.97 and
		   not Global_BellatiaDuplication[room_id].drama_record[7] then
			Global_BellatiaDuplication[room_id].drama_record[7] = true
			Global_BellatiaDuplication[room_id].drama_step = 7
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.96 and
		   not Global_BellatiaDuplication[room_id].drama_record[3] then
			Global_BellatiaDuplication[room_id].drama_record[3] = true
			Global_BellatiaDuplication[room_id].drama_step = 3
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.94 and
		   not Global_BellatiaDuplication[room_id].drama_record[8] then
			Global_BellatiaDuplication[room_id].drama_record[8] = true
			Global_BellatiaDuplication[room_id].drama_step = 8
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.91 and
		   not Global_BellatiaDuplication[room_id].drama_record[4] then
			Global_BellatiaDuplication[room_id].drama_record[4] = true
			Global_BellatiaDuplication[room_id].drama_step = 4
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.88 and
		   not Global_BellatiaDuplication[room_id].drama_record[9] then
			Global_BellatiaDuplication[room_id].drama_record[9] = true
			Global_BellatiaDuplication[room_id].drama_step = 9
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.86 and
		   not Global_BellatiaDuplication[room_id].drama_record[5] then
			Global_BellatiaDuplication[room_id].drama_record[5] = true
			Global_BellatiaDuplication[room_id].drama_step = 5
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.84 and
		   not Global_BellatiaDuplication[room_id].drama_record[10] then
			Global_BellatiaDuplication[room_id].drama_record[10] = true
			Global_BellatiaDuplication[room_id].drama_step = 10
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.81 and
		   not Global_BellatiaDuplication[room_id].drama_record[6] then
			Global_BellatiaDuplication[room_id].drama_record[6] = true
			Global_BellatiaDuplication[room_id].drama_step = 6
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.78 and
		   not Global_BellatiaDuplication[room_id].drama_record[11] then
			Global_BellatiaDuplication[room_id].drama_record[11] = true
			Global_BellatiaDuplication[room_id].drama_step = 11
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.75 and 
		   not Global_BellatiaDuplication[room_id].drama_record[12] then
			Global_BellatiaDuplication[room_id].drama_record[12] = true
			Global_BellatiaDuplication[room_id].drama_step = 12
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.72 and
		   not Global_BellatiaDuplication[room_id].drama_record[13] then
			Global_BellatiaDuplication[room_id].drama_record[13] = true
			Global_BellatiaDuplication[room_id].drama_step = 13
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end
		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.71 and
		   not Global_BellatiaDuplication[room_id].drama_record[14] then
			Global_BellatiaDuplication[room_id].drama_record[14] = true
			Global_BellatiaDuplication[room_id].drama_step = 14
			Lua_BellatiaDuplication_change_status(room_id, "drama")
		end

		-----------------------------------------------------------------
		--	戰鬥觸發條件
		-----------------------------------------------------------------
--		綁在死亡劇情觸發
--		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.96 and
--		   Global_BellatiaDuplication[room_id].step < 2 then
--			Global_BellatiaDuplication[room_id].step = 2
--		end
--		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.86 and
--		   Global_BellatiaDuplication[room_id].step < 4 then
--			Global_BellatiaDuplication[room_id].step = 4
--		end
--		if Global_BellatiaDuplication[room_id].mansuoruien.hp < Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.81 and
--		   Global_BellatiaDuplication[room_id].step < 6 then
--			Global_BellatiaDuplication[room_id].step = 6
--		end

		-----------------------------------------------------------------
		--	檢查
		-----------------------------------------------------------------
		_counter = 0
		nobody_fear_spread = true
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
			if player.room_id ~= room_id or
			   player.hp <= 0 or
			   player.buff[624591] or
			   player.z < Global_BellatiaDuplication[room_id].door_before_boss5.z and Lua_BellatiaDuplication_check_status(room_id, "boss") then
				_counter = _counter + 1
			elseif player.buff[624444] then
				nobody_fear_spread = false
				nobody_fear_spread_time_mark = nil
			end
		end
		if _counter >= #Global_BellatiaDuplication[room_id].players or #Global_BellatiaDuplication[room_id].players == 0 then
			Lua_BellatiaDuplication_change_status(room_id, "fail")
		end

		-----------------------------------------------------------------
		--	恐懼蔓延檢查
		-----------------------------------------------------------------
		if nobody_fear_spread and not nobody_fear_spread_time_mark then
			nobody_fear_spread_time_mark = Global_BellatiaDuplication[room_id].battleListener.current_time
		end
		if Global_BellatiaDuplication[room_id].step > 0 and nobody_fear_spread and nobody_fear_spread_time_mark and Global_BellatiaDuplication[room_id].battleListener.current_time - nobody_fear_spread_time_mark > 2 then
			Global_BellatiaDuplication[room_id].mansuoruien:useSkill("fear_spread")
		end
		
	end
	Global_BellatiaDuplication[room_id].battleListener:stop()
	Global_BellatiaDuplication:debug("leave main loop")

	while not Global_BellatiaDuplication[room_id].step_trigger and not Global_BellatiaDuplication[room_id].drama_step_trigger do Global_BellatiaDuplication:sleep(1) end

	-----------------------------------------------------------------
	--	清除崩解之核
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].cores_of_disintegration then
		for index, cores_of_disintegration in pairs(Global_BellatiaDuplication[room_id].cores_of_disintegration) do cores_of_disintegration:delete() end
		Global_BellatiaDuplication[room_id].cores_of_disintegration = nil
	end

	-----------------------------------------------------------------
	--	清除分身
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].mansuoruiens then
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do mansuoruien:delete() end
		Global_BellatiaDuplication[room_id].mansuoruiens = nil
	end

	-----------------------------------------------------------------
	--	清除變數
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].step = nil
	Global_BellatiaDuplication[room_id].step_trigger = nil
	Global_BellatiaDuplication[room_id].is_ai_stop = nil
	Global_BellatiaDuplication[room_id].sungchili_ai_stop = nil
	Global_BellatiaDuplication[room_id].drama_step = nil
	Global_BellatiaDuplication[room_id].drama_step_trigger = nil
	Global_BellatiaDuplication[room_id].drama_record = nil
	Global_BellatiaDuplication[room_id].battleListener = nil
	Global_BellatiaDuplication[room_id].drama_random_record = nil

	-----------------------------------------------------------------
	--	清除debuff
	-----------------------------------------------------------------
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		for buff_id, buff in pairs(player.buff) do
			if not buff.is_good_buff then player:cancelBuff(buff_id) end
		end
	end
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		for buff_id, buff in pairs(player.buff) do
			if not buff.is_good_buff then player:cancelBuff(buff_id) end
		end
	end
	for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].mansuoruien.buff) do
		Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(buff_id)
	end
	for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].cassam.buff) do
		Global_BellatiaDuplication[room_id].cassam:cancelBuff(buff_id)
	end
	for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].kangersy.buff) do
		Global_BellatiaDuplication[room_id].kangersy:cancelBuff(buff_id)
	end

	-----------------------------------------------------------------
	--	成功
	-----------------------------------------------------------------
	if Lua_BellatiaDuplication_check_status(room_id, "success") then
		Global_BellatiaDuplication:debug("fifth boss success")
	end

	-----------------------------------------------------------------
	--	失敗
	-----------------------------------------------------------------
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication:debug("fifth boss fail")
		Lua_BellatiaDuplication_fail()
	end
	Global_BellatiaDuplication:debug("Lua_BellatiaDuplication_FifthBoss_mainloop end")
end