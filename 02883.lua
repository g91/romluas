-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	四王
-----------------------------------------------------------------
-----------------------------------------------------------------
--	初始化
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_initialize(room_id)
	Global_BellatiaDuplication:debug("INIT > fourth boss")

	-----------------------------------------------------------------
	--	初始化設定
	-----------------------------------------------------------------
	if not Global_BellatiaDuplication_FourthBoss or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_setting() end

	-----------------------------------------------------------------
	--	npc initialize
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].door_before_boss4:delFromPartition()
	Global_BellatiaDuplication[room_id].pangkorrams_dragon:delFromPartition()
	Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.max_hp
	Global_BellatiaDuplication[room_id].feitlautrec:delFromPartition()
	Global_BellatiaDuplication[room_id].feitlautrec.skill = {}
	Global_BellatiaDuplication[room_id].feitlautrec:addSkill("prairie_fire", Global_BellatiaDuplication_FourthBoss.skill_prairie_fire)
	Global_BellatiaDuplication[room_id].feitlautrec:addSkill("fuel_grenade", Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade)
	Global_BellatiaDuplication[room_id].feitlautrec:addSkill("fire_marking", Global_BellatiaDuplication_FourthBoss.skill_fire_marking)
	Global_BellatiaDuplication[room_id].feitlautrec:addSkill("summon_servants", Global_BellatiaDuplication_FourthBoss.skill_summon_servants)
	Global_BellatiaDuplication[room_id].feitlautrec.skill.fire_marking:lock()

	-----------------------------------------------------------------
	--	四王參數
	-----------------------------------------------------------------
	--	戰鬥階段
		Global_BellatiaDuplication[room_id].fight_step = 0
	--	戰鬥階段開關
		Global_BellatiaDuplication[room_id].fight_step_trigger = false
	--	小怪列表
		Global_BellatiaDuplication[room_id].feitlautrec_servants = {}
	--	第一階段召喚次數
		Global_BellatiaDuplication[room_id].summon_servants_times = 0
	--	火焰列表
		Global_BellatiaDuplication[room_id].feitlautrec_flames = {}
	--	光龍保護罩血量
		Global_BellatiaDuplication[room_id].protective_cover_power = Global_BellatiaDuplication_FourthBoss.protective_cover_power
	--	AI狀態
		Global_BellatiaDuplication[room_id].is_ai_stop = true
	--	光龍保護罩
	--	Global_BellatiaDuplication[room_id].protective_cover

		Global_BellatiaDuplication[room_id].fire_mark_time_mark = 0

	--	表演階段
		Global_BellatiaDuplication[room_id].step = 0
	--	表演階段開關
		Global_BellatiaDuplication[room_id].step_trigger = false
	--	表演用小怪
		Global_BellatiaDuplication[room_id].enemies = {}
	--	表演用士兵
		Global_BellatiaDuplication[room_id].allies = {}
	--	表演紀錄
		Global_BellatiaDuplication[room_id].drama_record = {false, false, false, false, false, false, false, false}

	--	戰鬥監聽器
		Global_BellatiaDuplication[room_id].battle_listener = AddyBattleListener:new()

	-----------------------------------------------------------------
	--	change status
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_change_status(room_id, "boss")
end

-----------------------------------------------------------------
--	啟動
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_active()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss -> Lua_BellatiaDuplication_FourthBoss_active()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].feitlautrec:addBuff(624471)

	-----------------------------------------------------------------
	--	初始化
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_FourthBoss_initialize(room_id)

	-----------------------------------------------------------------
	--	開始主迴圈
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_mainloop")

	-----------------------------------------------------------------
	--	第一階段表演
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].step = 1
	Global_BellatiaDuplication[room_id].step_trigger = true
	Lua_BellatiaDuplication_change_status(room_id, "drama")
end

-----------------------------------------------------------------
--	四王主要迴圈
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_mainloop()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss main loop -> Lua_BellatiaDuplication_FourthBoss_mainloop()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	火焰印記變數
	-----------------------------------------------------------------
	local fire_marking_624418 = {}
	local fire_marking_624419 = {}
	local fire_marking_624420 = {}
	local fire_marking_624421 = {}

	while Lua_BellatiaDuplication_check_status(room_id, "boss") or Lua_BellatiaDuplication_check_status(room_id, "drama") do

		Lua_BellatiaDuplication_update_players(room_id)

		Global_BellatiaDuplication[room_id].battle_listener:start()

		if Global_BellatiaDuplication.type == "hard" and Global_BellatiaDuplication[room_id].battle_listener.duration_time >= 480 and not Global_BellatiaDuplication[room_id].feitlautrec.buff[624243] then
			Global_BellatiaDuplication[room_id].feitlautrec:addBuff(624243)
		elseif Global_BellatiaDuplication.type == "normal" and Global_BellatiaDuplication[room_id].battle_listener.duration_time >= 360 and not Global_BellatiaDuplication[room_id].feitlautrec.buff[624243] then
			Global_BellatiaDuplication[room_id].feitlautrec:addBuff(624243)
		end

		-----------------------------------------------------------------
		--	系統延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FourthBoss.delay)

		if Global_BellatiaDuplication[room_id].step_trigger and Lua_BellatiaDuplication_check_status(room_id, "drama") then
			Global_BellatiaDuplication[room_id].step_trigger = false
			--	表演1：逼近的堅護者與吉兒的告白
			if Global_BellatiaDuplication[room_id].step == 1 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama1") end
			--	表演2：卡薩姆與伊崔妮的離別
			if Global_BellatiaDuplication[room_id].step == 2 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama2") end
			--	表演3：卡薩姆幫睡覺的光龍蓋被子
			if Global_BellatiaDuplication[room_id].step == 3 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama3") end
			--	表演4：康葛斯獻祭	不中斷戰鬥
			if Global_BellatiaDuplication[room_id].step == 4 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama4") end
			--	表演5：光龍犧牲
			if Global_BellatiaDuplication[room_id].step == 5 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama5") end
			--	表演6：法伊羅特和維奇鬥嘴	不中斷戰鬥
			if Global_BellatiaDuplication[room_id].step == 6 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama6") end
			--	表演7：法伊羅特弄得維琪很不舒服
			if Global_BellatiaDuplication[room_id].step == 7 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama7") end
		end

		if Global_BellatiaDuplication[room_id].fight_step_trigger and Lua_BellatiaDuplication_check_status(room_id, "boss") then
			Global_BellatiaDuplication[room_id].fight_step_trigger = false
			--	戰鬥1 : 成功條件：法伊羅特HP 60%。失敗條件：保護罩擊破
			if Global_BellatiaDuplication[room_id].fight_step == 1 then
				Global_BellatiaDuplication[room_id].door_before_boss4:addToPartition(room_id)
				Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_first_step")
			end

			--	戰鬥2 : 成功條件：法伊羅特HP 5%。失敗條件：康葛斯死亡
			if Global_BellatiaDuplication[room_id].fight_step == 2 then
				Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_second_step")
			end
		end

		-----------------------------------------------------------------
		--	康葛斯死亡
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].kangersy.hp <= 1 and Global_BellatiaDuplication[room_id].kangersy.buff[624415] then
			Global_BellatiaDuplication[room_id].step = 0
			Global_BellatiaDuplication[room_id].fight_step = 0
			Lua_BellatiaDuplication_change_status(room_id, "fail")
		end

		-----------------------------------------------------------------
		--	滅團檢查
		-----------------------------------------------------------------
		local _counter = 0
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
			if player.room_id ~= room_id or player.hp <= 0 or
			   player.x > Global_BellatiaDuplication[room_id].door_before_boss4.x and Lua_BellatiaDuplication_check_status(room_id, "boss") then _counter = _counter + 1 end
		end
		if _counter >= #Global_BellatiaDuplication[room_id].players or #Global_BellatiaDuplication[room_id].players == 0 then
			Lua_BellatiaDuplication_change_status(room_id, "fail")
		end

	end
	Global_BellatiaDuplication:debug("fourth boss main loop end")
	Global_BellatiaDuplication[room_id].battle_listener:stop()
	Global_BellatiaDuplication:sleep(2)

	-----------------------------------------------------------------
	--	等待全流程停止
	-----------------------------------------------------------------
	while not Global_BellatiaDuplication[room_id].step_trigger and not Global_BellatiaDuplication[room_id].fight_step_trigger do Sleep(5) end

	-----------------------------------------------------------------
	--	清除小怪
	-----------------------------------------------------------------
	for index, flame in pairs(Global_BellatiaDuplication[room_id].feitlautrec_flames) do flame:delete() end

	-----------------------------------------------------------------
	--	刪除保護罩
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].protective_cover then
		for index, node in pairs(Global_BellatiaDuplication[room_id].protective_cover.node) do node:delete() end
		Global_BellatiaDuplication[room_id].protective_cover:delete()
		Global_BellatiaDuplication[room_id].protective_cover = nil
	end
	Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624433)
	Global_BellatiaDuplication[room_id].Cassam:cancelBuff(624433)
	if Global_BellatiaDuplication[room_id].Cassam.sword then
		SetRoleEquip(Global_BellatiaDuplication[room_id].cassam.GUID, EM_EQWearPos_MainHand, 213696, 1)
		Global_BellatiaDuplication[room_id].Cassam.sword:delete()
		Global_BellatiaDuplication[room_id].Cassam.sword = nil
	end

	-----------------------------------------------------------------
	--	清除
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].feitlautrec_flames = nil
	Global_BellatiaDuplication[room_id].fight_step = nil
	Global_BellatiaDuplication[room_id].fight_step_trigger = nil
	Global_BellatiaDuplication[room_id].protective_cover_power = nil
	Global_BellatiaDuplication[room_id].summon_servants_times = nil

	-----------------------------------------------------------------
	--	所有人回復原廠設定
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].kangersy.is_imperishable = true
	Global_BellatiaDuplication[room_id].Kangersy:interruptMagic()
	Global_BellatiaDuplication[room_id].Kangersy:cancelBuff(624471)
	Global_BellatiaDuplication[room_id].Kangersy:cancelBuff(624415)
	Global_BellatiaDuplication[room_id].kangersy:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].kangersy.GUID, ruFUSION_MIME_IDLE_STAND)
	Global_BellatiaDuplication[room_id].Morrok:interruptMagic()
	Global_BellatiaDuplication[room_id].Morrok:playMotion(ruFUSION_ACTORSTATE_NORMAL)
	Global_BellatiaDuplication[room_id].Morrok:cancelBuff(624428)
	Global_BellatiaDuplication[room_id].Jill:interruptMagic()
	Global_BellatiaDuplication[room_id].Jill:playMotion(ruFUSION_ACTORSTATE_NORMAL)
	Global_BellatiaDuplication[room_id].Jill:cancelBuff(624428)
	Global_BellatiaDuplication[room_id].cassam:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
	Global_BellatiaDuplication[room_id].feitlautrec:cancelBuff(624243)
	Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.max_hp
	Global_BellatiaDuplication[room_id].feitlautrec:cancelBuff(624471)
	Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(509923)
	Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624413)
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do player:cancelBuff(624433) end

	-----------------------------------------------------------------
	--	失敗
	-----------------------------------------------------------------
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication:debug("fourth boss fail")
		Lua_BellatiaDuplication_fail()
		Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_SLEEP_END)
		Global_BellatiaDuplication[room_id].pangkorrams_dragon:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
		SetDefIdleMotion(Global_BellatiaDuplication[room_id].pangkorrams_dragon.GUID, ruFUSION_MIME_IDLE_STAND)
	end
	Global_BellatiaDuplication:debug("fourth boss main loop -> Lua_BellatiaDuplication_FourthBoss_mainloop() end")
end

