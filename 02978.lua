function Lua_BellatiaDuplication_FifthBoss_test()
	CallPlot(OwnerID(), "Lua_BellatiaDuplication_FifthBoss_testt")
end
function Lua_BellatiaDuplication_FifthBoss_testt()
	if Global_BellatiaDuplication.beta then DebugMsg(0, 0, "[BellatiaDuplication] <active> fifth boss -> function Lua_BellatiaDuplication_FifthBoss_active()") end
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local me = AddyPlayer:new(OwnerID())

	Lua_BellatiaDuplication_FifthBoss_setting()

	Global_BellatiaDuplication[room_id].mansuoruien.skill = {}
	Global_BellatiaDuplication[room_id].mansuoruien.hp = Global_BellatiaDuplication[room_id].mansuoruien.max_hp
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("fear_spread", Global_BellatiaDuplication_FifthBoss.skill_fear_spread)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("space_conversion", Global_BellatiaDuplication_FifthBoss.skill_space_conversion)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("dark_arrows", Global_BellatiaDuplication_FifthBoss.skill_dark_arrows)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("hourglass_of_life", Global_BellatiaDuplication_FifthBoss.skill_hourglass_of_life)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("dark_rift", Global_BellatiaDuplication_FifthBoss.skill_dark_rift)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("the_anger_of_emperor", Global_BellatiaDuplication_FifthBoss.skill_the_anger_of_emperor)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("core_of_disintegration", Global_BellatiaDuplication_FifthBoss.skill_core_of_disintegration)
	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("space_of_storm", Global_BellatiaDuplication_FifthBoss.skill_space_of_storm)
--	Global_BellatiaDuplication[room_id].mansuoruien:addSkill("incredible_shock", Global_BellatiaDuplication_FifthBoss.skill_incredible_shock)
--	Global_BellatiaDuplication[room_id].mansuoruien.skill.core_of_disintegration:lock()
--	Global_BellatiaDuplication[room_id].mansuoruien.skill.space_of_storm:lock()
--	Global_BellatiaDuplication[room_id].mansuoruien.skill.incredible_shock:lock()
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

	Global_BellatiaDuplication[room_id].battleListener = AddyBattleListener:new()
	Global_BellatiaDuplication[room_id].battleListener:add(Global_BellatiaDuplication[room_id].Mansuoruien)

	-----------------------------------------------------------------
	--	Mansuoruien AI
		Global_BellatiaDuplication[room_id].Mansuoruien:beginPlot("Lua_BellatiaDuplication_FifthBoss_Mansuoruien_ai")
	-----------------------------------------------------------------

	while CheckID(Global_BellatiaDuplication[room_id].Mansuoruien.GUID) do
		Global_BellatiaDuplication[room_id].battleListener:start()
		for skill_name, skill in pairs(Global_BellatiaDuplication[room_id].Mansuoruien.skill) do
			DebugMsg(0, 0, skill_name .. "'s cd : " .. skill.cd_counter)
		end
		Sleep(10)
	end
	Global_BellatiaDuplication[room_id].battleListener:stop()
end