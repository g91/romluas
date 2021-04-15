-----------------------------------------------------------------
--	五王AI
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_mansuoruien_ai()
	Global_BellatiaDuplication:debug("active > fifth boss ai -> Lua_BellatiaDuplication_FifthBoss_mansuoruien_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	local mansuoruien = Global_BellatiaDuplication[room_id].mansuoruien
	local current_step = Global_BellatiaDuplication[room_id].step
	Global_BellatiaDuplication:debug("fifth boss ai : current_step = " .. current_step) 

	Global_BellatiaDuplication[room_id].is_ai_stop = false
	mansuoruien.fight = true
	mansuoruien.strike_back = true
	mansuoruien.search_enemy = true

	mansuoruien.hate_list_duplication = {}
--	mansuoruien.fear_spread_trigger = true

	local around_range_check_40 = false

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and current_step == Global_BellatiaDuplication[room_id].step do
		mansuoruien.hate_list_duplication = mansuoruien.hate_list

		-----------------------------------------------------------------
		--	仇恨距離檢查
			around_range_check_40 = false
			for index, player in pairs(mansuoruien.hate_list_duplication) do
				if not around_range_check_40 and mansuoruien:distanceTo(player) < 40 then around_range_check_40 = true end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	最終段招式，cd完就放
			if mansuoruien.skill and mansuoruien.skill.core_of_disintegration then mansuoruien:useSkill("core_of_disintegration") end
			if mansuoruien.skill and mansuoruien.skill.space_of_storm then mansuoruien:useSkill("space_of_storm") end
			if mansuoruien.skill and mansuoruien.skill.incredible_shock then mansuoruien:useSkill("incredible_shock") end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	一三段招式，cd完就放
			if mansuoruien.skill and mansuoruien.skill.space_conversion then mansuoruien:useSkill("space_conversion") end
			if mansuoruien.skill and mansuoruien.skill.dark_arrows then mansuoruien:useSkill("dark_arrows") end
			if mansuoruien.skill and mansuoruien.skill.hourglass_of_life then mansuoruien:useSkill("hourglass_of_life") end
			if mansuoruien.skill and mansuoruien.skill.dark_rift then mansuoruien:useSkill("dark_rift") end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	吸收分身獲得的招式，cd完就放
			if mansuoruien.skill and mansuoruien.skill.fatal_ruling then mansuoruien:useSkill("fatal_ruling") end
			if mansuoruien.skill and mansuoruien.skill.vacuum_extrusion then mansuoruien:useSkill("vacuum_extrusion") end
			if mansuoruien.skill and mansuoruien.skill.devastating_chain then mansuoruien:useSkill("devastating_chain") end
			if mansuoruien.skill and mansuoruien.skill.cracking_torrent then mansuoruien:useSkill("cracking_torrent") end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	魔帝之怒：40碼內有敵人才施放
			if mansuoruien.skill and mansuoruien.skill.the_anger_of_emperor and around_range_check_40 then mansuoruien:useSkill("the_anger_of_emperor") end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	恐懼蔓延：有人因為此招死掉fear_spread_trigger才會打開
		--	開場施放一次
--			if mansuoruien.skill and mansuoruien.skill.fear_spread and mansuoruien.fear_spread_trigger then mansuoruien:useSkill("fear_spread") end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	延遲
			Sleep(Global_BellatiaDuplication_FifthBoss.delay * 10)
		-----------------------------------------------------------------

	end
	Global_BellatiaDuplication:debug("fifth boss ai stop")
	Global_BellatiaDuplication[room_id].is_ai_stop = true
	Global_BellatiaDuplication:debug("all ai is stop")
end

-----------------------------------------------------------------
--	分身AI
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_Sungchili_ai()
	Global_BellatiaDuplication:debug("active > Sungchili ai : " .. OwnerID() .. " -> Lua_BellatiaDuplication_FifthBoss_Sungchili_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local mansuoruien = nil
	local current_step = Global_BellatiaDuplication[room_id].step
	Global_BellatiaDuplication:debug("fifth boss ai : current_step = " .. current_step)
	Global_BellatiaDuplication[room_id].is_ai_stop = false

	-----------------------------------------------------------------
	--	從Global_BellatiaDuplication[room_id].mansuoruiens認領自己
		for index, _mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
			if _mansuoruien.GUID == OwnerID() then
				mansuoruien = _mansuoruien
				Global_BellatiaDuplication[room_id].sungchili_ai_stop[mansuoruien.index] = false
				Global_BellatiaDuplication:debug("Sungchili ai : " .. index .. " get body " .. OwnerID() .. " !")
				break
			end
		end
	-----------------------------------------------------------------

	if not mansuoruien then return end

	mansuoruien.fight = true
	mansuoruien.strike_back = true
	mansuoruien.search_enemy = true

	-----------------------------------------------------------------
	--	仇恨表副本
		mansuoruien.hate_list_duplication = {}
	-----------------------------------------------------------------

	Sleep(20)

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and current_step == Global_BellatiaDuplication[room_id].step and mansuoruien.is_live do
		mansuoruien.hate_list_duplication = mansuoruien.hate_list

		-----------------------------------------------------------------
		--	分身放招
			if mansuoruien.skill and mansuoruien.skill.fatal_ruling then mansuoruien:useSkill("fatal_ruling") end
			if mansuoruien.skill and mansuoruien.skill.vacuum_extrusion then mansuoruien:useSkill("vacuum_extrusion") end
			if mansuoruien.skill and mansuoruien.skill.devastating_chain then mansuoruien:useSkill("devastating_chain") end
			if mansuoruien.skill and mansuoruien.skill.cracking_torrent then mansuoruien:useSkill("cracking_torrent") end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
		--	延遲
			Sleep(Global_BellatiaDuplication_FifthBoss.delay * 10)
		-----------------------------------------------------------------

	end
	Global_BellatiaDuplication:debug("Sungchili ai stop")
	
	-----------------------------------------------------------------
	--	紀錄分身ai已經關閉
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].sungchili_ai_stop[mansuoruien.index] = true
	Global_BellatiaDuplication:debug("mansuoruien " .. mansuoruien.index .. " ai is stop")
end

-----------------------------------------------------------------
--	崩解之核AI
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_core_ai()
	Global_BellatiaDuplication:debug("active > fifth boss core ai -> Lua_BellatiaDuplication_FifthBoss_core_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local core_of_disintegration = nil
	-----------------------------------------------------------------
	--	Global_BellatiaDuplication[room_id].cores_of_disintegration認領自己
		for index, _core_of_disintegration in pairs(Global_BellatiaDuplication[room_id].cores_of_disintegration) do
			if _core_of_disintegration.GUID == OwnerID() then
				core_of_disintegration = _core_of_disintegration
				Global_BellatiaDuplication:debug("core_of_disintegration ai : " .. index .. " get body " .. OwnerID() .. " !")
				break
			end
		end
	-----------------------------------------------------------------

	if not core_of_disintegration then return end

	core_of_disintegration:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
	core_of_disintegration:addSkill("cure", Global_BellatiaDuplication_FifthBoss.skill_cure)

	if Global_BellatiaDuplication[room_id].battleListener then
		Global_BellatiaDuplication[room_id].battleListener:add(core_of_disintegration)
		Global_BellatiaDuplication:debug("core_of_disintegration has been add to battleListener")
	end

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do

		core_of_disintegration:useSkill("cracking_torrent")

		if core_of_disintegration:distanceTo(Global_BellatiaDuplication[room_id].mansuoruien) <= 35 then core_of_disintegration:useSkill("cure") end
		
		-----------------------------------------------------------------
		--	延遲
			Sleep(Global_BellatiaDuplication_FifthBoss.delay * 10)
		-----------------------------------------------------------------
	end
end

function Lua_BellatiaDuplication_FifthBoss_cassam_ai()
	Global_BellatiaDuplication:debug("active > cassam ai -> Lua_BellatiaDuplication_FifthBoss_cassam_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local cassam = Global_BellatiaDuplication[room_id].cassam

	cassam:addBuff(624659)

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do
		if not cassam.attack_target then 
			if Global_BellatiaDuplication[room_id].step == 2 or Global_BellatiaDuplication[room_id].step == 4 then
				for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
					if mansuoruien.is_live then cassam.attack_target = mansuoruien break end
				end
			else
				cassam.attack_target = Global_BellatiaDuplication[room_id].mansuoruien
			end
--			if Global_BellatiaDuplication[room_id].mansuoruien.fight then
--				cassam.attack_target = Global_BellatiaDuplication[room_id].mansuoruien
--			elseif #Global_BellatiaDuplication[room_id].mansuoruiens > 0 then
--				cassam.attack_target = Global_BellatiaDuplication[room_id].mansuoruiens[RandRange(1, #Global_BellatiaDuplication[room_id].mansuoruiens)]
--			end
		else cassam:hate(cassam.attack_target) end
		
		-----------------------------------------------------------------
		--	延遲
			Sleep(Global_BellatiaDuplication_FifthBoss.delay * 10)
		-----------------------------------------------------------------
	end
	Global_BellatiaDuplication:debug("cassam ai stop")
end

function Lua_BellatiaDuplication_FifthBoss_kangersy_ai()
	Global_BellatiaDuplication:debug("active > kangersy ai -> Lua_BellatiaDuplication_FifthBoss_kangersy_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local kangersy = Global_BellatiaDuplication[room_id].kangersy

	kangersy:addBuff(624659)

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do
		if not kangersy.attack_target then 
			if Global_BellatiaDuplication[room_id].step == 2 or Global_BellatiaDuplication[room_id].step == 4 then
				for index, mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
					if mansuoruien.is_live then kangersy.attack_target = mansuoruien break end
				end
			else
				kangersy.attack_target = Global_BellatiaDuplication[room_id].mansuoruien
			end
--			if Global_BellatiaDuplication[room_id].mansuoruien.fight then
--				kangersy.attack_target = Global_BellatiaDuplication[room_id].mansuoruien
--			elseif #Global_BellatiaDuplication[room_id].mansuoruiens > 0 then
--				kangersy.attack_target = Global_BellatiaDuplication[room_id].mansuoruiens[RandRange(1, #Global_BellatiaDuplication[room_id].mansuoruiens)]
--			end
		else kangersy:hate(kangersy.attack_target) end
		
		-----------------------------------------------------------------
		--	延遲
			Sleep(Global_BellatiaDuplication_FifthBoss.delay * 10)
		-----------------------------------------------------------------
	end
	Global_BellatiaDuplication:debug("kangersy ai stop")
end