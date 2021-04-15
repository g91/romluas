-----------------------------------------------------------------
--	五王第一階段
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_first_step()
	Global_BellatiaDuplication:debug("active > fifth boss first loop -> function Lua_BellatiaDuplication_FifthBoss_first_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	mansuoruien AI
		Global_BellatiaDuplication[room_id].mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_mansuoruien_ai")
	-----------------------------------------------------------------

	while Global_BellatiaDuplication[room_id].step == 1 and Lua_BellatiaDuplication_check_status(room_id, "boss") do

		-----------------------------------------------------------------
		--	系統延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBoss.delay)
	end
	Global_BellatiaDuplication:debug("leave first loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do Global_BellatiaDuplication:sleep(0.1) end

	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	五王第二階段
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_second_step()
	Global_BellatiaDuplication:debug("active > fifth boss second loop -> function Lua_BellatiaDuplication_FifthBoss_second_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local ai_stop_counter = 0
	local live_counter = 0
	local start_time = Global_BellatiaDuplication[room_id].battleListener.current_time
	local temp = 0

	-----------------------------------------------------------------
	--	初始化分身
		Lua_BellatiaDuplication_FifthBoss_Sungchili_initialize(room_id)
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	曼索瑞恩影分身之術
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			mansuoruien:setPosition(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, Global_BellatiaDuplication[room_id].mansuoruien.direction)
		end

		local mansuoruien_hp = Global_BellatiaDuplication[room_id].mansuoruien.hp

	--	曼索瑞恩主體消失
--		Global_BellatiaDuplication[room_id].mansuoruien.hide = true
		Global_BellatiaDuplication[room_id].mansuoruien.show = false
		Global_BellatiaDuplication[room_id].mansuoruien.strike_back = false
		Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = false
		Global_BellatiaDuplication[room_id].mansuoruien.movable = false
		Global_BellatiaDuplication[room_id].mansuoruien.fight = false
		Global_BellatiaDuplication[room_id].mansuoruien.mark = false
		Global_BellatiaDuplication[room_id].mansuoruien:stopAttack()
		Global_BellatiaDuplication[room_id].mansuoruien:stopMove()

	--	分身進場，橫向左右散開
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			mansuoruien.movable = true
			mansuoruien:addToPartition(room_id)
			if index == #Global_BellatiaDuplication[room_id].mansuoruiens then mansuoruien:move(mansuoruien.x + (math.cos(math.pi / 2 * index) * 70), mansuoruien.y, mansuoruien.z + (math.sin(math.pi / 2 * index) * 70))
			else mansuoruien:move(mansuoruien.x + (math.cos(math.pi / 2 * index) * 70), mansuoruien.y, mansuoruien.z + (math.sin(math.pi / 2 * index) * 70), 0) end
		end

	--	分身後轉向，啟動AI
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			mansuoruien:adjustDirection(0)
			mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_Sungchili_ai")
		end
	-----------------------------------------------------------------

	while Global_BellatiaDuplication[room_id].step == 2 and Lua_BellatiaDuplication_check_status(room_id, "boss") do

		-----------------------------------------------------------------
		--	系統
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBoss.delay)

		-----------------------------------------------------------------
		--	進入第三階段：戰鬥時間超過。設置位置在Lua_BellatiaDuplication_FifthBoss_setting()
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].battleListener.duration_time - start_time > Global_BellatiaDuplication_FifthBoss.step2_duration then
			Global_BellatiaDuplication[room_id].step = 3
		end

		-----------------------------------------------------------------
		--	進入第三階段：剩一隻分身
		-----------------------------------------------------------------
		live_counter = 0
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if mansuoruien.is_live then
				live_counter = live_counter + 1
				temp = mansuoruien.index
			end
		end
		if live_counter <= 1 then Global_BellatiaDuplication[room_id].step = 3 end
	end
	Global_BellatiaDuplication:debug("leave second loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do
		Global_BellatiaDuplication:debug("waiting for ai stop")
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if not mansuoruien.is_live then Global_BellatiaDuplication[room_id].battleListener:remove(mansuoruien) end
		end
		ai_stop_counter = 0
		for index, is_stop in pairs(Global_BellatiaDuplication[room_id].sungchili_ai_stop) do
			if is_stop then ai_stop_counter = ai_stop_counter + 1 end
		end
		if ai_stop_counter >= #Global_BellatiaDuplication[room_id].sungchili_ai_stop then
			Global_BellatiaDuplication[room_id].is_ai_stop = true
			Global_BellatiaDuplication:debug("all ai is stop")
		end
		Global_BellatiaDuplication:sleep(0.5)
	end

	-----------------------------------------------------------------
	--	回收曼索瑞恩
	--	如果有分身在場上就隨機選一隻
		live_counter = 0
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if mansuoruien.is_live then live_counter = live_counter + 1 end
		end
		if live_counter > 0 then
	--		曼索瑞恩們集合
			for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
				mansuoruien.fight = false
				mansuoruien.strike_back = false
				mansuoruien.search_enemy = false
				mansuoruien:stopAttack()
				mansuoruien:stopMove()
				mansuoruien:move(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, 0)
			end
			Global_BellatiaDuplication:sleep(0.4)
	--		繼承能力
			for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
				if mansuoruien.is_live then
					Global_BellatiaDuplication:debug("mansuoruien inheritor index : " .. mansuoruien.index)
					if mansuoruien.index == 1 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624597)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("fatal_ruling", Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling)
					elseif mansuoruien.index == 2 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624598)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("vacuum_extrusion", Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion)
					elseif mansuoruien.index == 3 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624599)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("devastating_chain", Global_BellatiaDuplication_FifthBoss.skill_devastating_chain)
					elseif mansuoruien.index == 4 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624600)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
					end
				end
			end
		else
			if temp == 1 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624597)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("fatal_ruling", Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling)
			elseif temp == 2 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624598)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("vacuum_extrusion", Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion)
			elseif temp == 3 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624599)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("devastating_chain", Global_BellatiaDuplication_FifthBoss.skill_devastating_chain)
			elseif temp == 4 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624600)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
			end
		end
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			Global_BellatiaDuplication[room_id].battleListener:remove(mansuoruien)
			mansuoruien:delete()
		end
		Global_BellatiaDuplication[room_id].mansuoruiens = {}

	--	如果有分身就以分身位置出現，很剛好都被宰了就原地出現
--		Global_BellatiaDuplication[room_id].mansuoruien.hide = false
		Global_BellatiaDuplication[room_id].mansuoruien.show = true
		Global_BellatiaDuplication[room_id].mansuoruien.strike_back = true
		Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = true
		Global_BellatiaDuplication[room_id].mansuoruien.movable = true
		Global_BellatiaDuplication[room_id].mansuoruien.fight = true
		Global_BellatiaDuplication[room_id].mansuoruien.mark = true
	-----------------------------------------------------------------

	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	五王第三階段
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_third_step()
	Global_BellatiaDuplication:debug("active > fifth boss third loop -> function Lua_BellatiaDuplication_FifthBoss_third_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	mansuoruien AI
		Global_BellatiaDuplication[room_id].mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_mansuoruien_ai")
	-----------------------------------------------------------------

	while Global_BellatiaDuplication[room_id].step == 3 and Lua_BellatiaDuplication_check_status(room_id, "boss") do
		-----------------------------------------------------------------
		--	系統延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBoss.delay)
	end
	Global_BellatiaDuplication:debug("leave third loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do Global_BellatiaDuplication:sleep(0.1) end

	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	五王第四階段
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_fourth_step()
	Global_BellatiaDuplication:debug("active > fifth boss fourth loop -> function Lua_BellatiaDuplication_FifthBoss_fourth_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local ai_stop_counter = 0
	local live_counter = 0
	local start_time = Global_BellatiaDuplication[room_id].battleListener.current_time
	local temp = 0

	-----------------------------------------------------------------
	--	初始化分身
		Lua_BellatiaDuplication_FifthBoss_Sungchili_initialize(room_id)
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	曼索瑞恩影分身之術
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			mansuoruien:setPosition(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, Global_BellatiaDuplication[room_id].mansuoruien.direction)
		end

		local mansuoruien_hp = Global_BellatiaDuplication[room_id].mansuoruien.hp

	--	曼索瑞恩主體消失
--		Global_BellatiaDuplication[room_id].mansuoruien.hide = true
		Global_BellatiaDuplication[room_id].mansuoruien.show = false
		Global_BellatiaDuplication[room_id].mansuoruien.strike_back = false
		Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = false
		Global_BellatiaDuplication[room_id].mansuoruien.movable = false
		Global_BellatiaDuplication[room_id].mansuoruien.fight = false
		Global_BellatiaDuplication[room_id].mansuoruien.mark = false
		Global_BellatiaDuplication[room_id].mansuoruien:stopAttack()
		Global_BellatiaDuplication[room_id].mansuoruien:stopMove()

	--	分身進場，橫向左右散開
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			mansuoruien.movable = true
			mansuoruien:addToPartition(room_id)
			if index == #Global_BellatiaDuplication[room_id].mansuoruiens then mansuoruien:move(mansuoruien.x + (math.cos(math.pi / 2 * index) * 50), mansuoruien.y, mansuoruien.z + (math.sin(math.pi / 2 * index) * 50))
			else mansuoruien:move(mansuoruien.x + (math.cos(math.pi / 2 * index) * 50), mansuoruien.y, mansuoruien.z + (math.sin(math.pi / 2 * index) * 50), 0) end
		end

	--	分身後轉向，啟動AI
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			mansuoruien:adjustDirection(0)
			mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_Sungchili_ai")
		end
	-----------------------------------------------------------------

	while Global_BellatiaDuplication[room_id].step == 4 and Lua_BellatiaDuplication_check_status(room_id, "boss") do

		-----------------------------------------------------------------
		--	系統
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBoss.delay)

		-----------------------------------------------------------------
		--	進入第三階段：戰鬥時間超過。設置位置在Lua_BellatiaDuplication_FifthBoss_setting()
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].battleListener.duration_time - start_time > Global_BellatiaDuplication_FifthBoss.step4_duration then
			Global_BellatiaDuplication[room_id].step = 5
		end

		-----------------------------------------------------------------
		--	進入第三階段：剩一隻分身
		-----------------------------------------------------------------
		live_counter = 0
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if mansuoruien.is_live then
				live_counter = live_counter + 1
				temp = mansuoruien.index
			end
		end
		if live_counter <= 1 then Global_BellatiaDuplication[room_id].step = 5 end
	end
	Global_BellatiaDuplication:debug("leave fourth loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do
		Global_BellatiaDuplication:debug("waiting for ai stop")
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if not mansuoruien.is_live then Global_BellatiaDuplication[room_id].battleListener:remove(mansuoruien) end
		end
		ai_stop_counter = 0
		for index, is_stop in pairs(Global_BellatiaDuplication[room_id].sungchili_ai_stop) do
			if is_stop then ai_stop_counter = ai_stop_counter + 1 end
		end
		if ai_stop_counter >= #Global_BellatiaDuplication[room_id].sungchili_ai_stop then
			Global_BellatiaDuplication[room_id].is_ai_stop = true
			Global_BellatiaDuplication:debug("all ai is stop")
		end
		Global_BellatiaDuplication:sleep(0.5)
	end

	-----------------------------------------------------------------
	--	回收曼索瑞恩
	--	如果有分身在場上就隨機選一隻
		live_counter = 0
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if mansuoruien.is_live then live_counter = live_counter + 1 end
		end
		if live_counter > 0 then
	--		曼索瑞恩們集合
			for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
				mansuoruien.fight = false
				mansuoruien.strike_back = false
				mansuoruien.search_enemy = false
				mansuoruien:stopAttack()
				mansuoruien:stopMove()
				mansuoruien:move(Global_BellatiaDuplication[room_id].mansuoruien.x, Global_BellatiaDuplication[room_id].mansuoruien.y, Global_BellatiaDuplication[room_id].mansuoruien.z, 0)
			end
			Global_BellatiaDuplication:sleep(0.4)
	--		繼承能力
			for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
				if mansuoruien.is_live then
					Global_BellatiaDuplication:debug("mansuoruien inheritor index : " .. mansuoruien.index)
					if mansuoruien.index == 1 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624597)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("fatal_ruling", Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling)
					elseif mansuoruien.index == 2 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624598)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("vacuum_extrusion", Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion)
					elseif mansuoruien.index == 3 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624599)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("devastating_chain", Global_BellatiaDuplication_FifthBoss.skill_devastating_chain)
					elseif mansuoruien.index == 4 then
						Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624600)
						Global_BellatiaDuplication[room_id].mansuoruien:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
					end
				end
			end
		else
			if temp == 1 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624597)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("fatal_ruling", Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling)
			elseif temp == 2 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624598)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("vacuum_extrusion", Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion)
			elseif temp == 3 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624599)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("devastating_chain", Global_BellatiaDuplication_FifthBoss.skill_devastating_chain)
			elseif temp == 4 then
				Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624600)
				Global_BellatiaDuplication[room_id].mansuoruien:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
			end
		end
		for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			Global_BellatiaDuplication[room_id].battleListener:remove(mansuoruien)
			mansuoruien:delete()
		end
		Global_BellatiaDuplication[room_id].mansuoruiens = {}

	--	如果有分身就以分身位置出現，很剛好都被宰了就原地出現
--		Global_BellatiaDuplication[room_id].mansuoruien.hide = false
		Global_BellatiaDuplication[room_id].mansuoruien.show = true
		Global_BellatiaDuplication[room_id].mansuoruien.strike_back = true
		Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = true
		Global_BellatiaDuplication[room_id].mansuoruien.movable = true
		Global_BellatiaDuplication[room_id].mansuoruien.fight = true
		Global_BellatiaDuplication[room_id].mansuoruien.mark = true
	-----------------------------------------------------------------

	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	五王第五階段
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_fifth_step()
	Global_BellatiaDuplication:debug("active > fifth boss fifth loop -> function Lua_BellatiaDuplication_FifthBoss_fifth_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	mansuoruien AI
		Global_BellatiaDuplication[room_id].mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_mansuoruien_ai")
	-----------------------------------------------------------------

	while Global_BellatiaDuplication[room_id].step == 5 and Lua_BellatiaDuplication_check_status(room_id, "boss") do

		-----------------------------------------------------------------
		--	系統延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBoss.delay)

	end
	Global_BellatiaDuplication:debug("leave fifth loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do Global_BellatiaDuplication:sleep(0.1) end

	Global_BellatiaDuplication[room_id].step_trigger = true
end

-----------------------------------------------------------------
--	五王第六階段
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_sixth_step()
	Global_BellatiaDuplication:debug("active > fifth boss sixth loop -> function Lua_BellatiaDuplication_FifthBoss_sixth_step()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	五王第六階段初始化
		Global_BellatiaDuplication[room_id].mansuoruien.skill.core_of_disintegration:unlock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.space_of_storm:unlock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.incredible_shock:unlock()
	--	關閉招式
		Global_BellatiaDuplication[room_id].mansuoruien.skill.fear_spread:lock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.space_conversion:lock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.hourglass_of_life:lock()
		Global_BellatiaDuplication[room_id].mansuoruien.skill.dark_rift:lock()
	--	普攻附加放逐之拳
		Global_BellatiaDuplication[room_id].mansuoruien:addBuff(624457)
		
	--	第六階段cd縮短
		Global_BellatiaDuplication_FifthBoss.skill_dark_arrows.cd = 9
	--	Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.cd = 25
		Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor.cd = 10
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	mansuoruien AI
		Global_BellatiaDuplication[room_id].mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_mansuoruien_ai")
	-----------------------------------------------------------------

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do

		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
			Global_BellatiaDuplication[room_id].mansuoruien:hate(player)
		end

		-----------------------------------------------------------------
		--	系統延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBoss.delay)
	end
	Global_BellatiaDuplication:debug("leave sixth loop")

	while not Global_BellatiaDuplication[room_id].is_ai_stop do Global_BellatiaDuplication:sleep(0.1) end

	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end