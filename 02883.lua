-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	�|��
-----------------------------------------------------------------
-----------------------------------------------------------------
--	��l��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_initialize(room_id)
	Global_BellatiaDuplication:debug("INIT > fourth boss")

	-----------------------------------------------------------------
	--	��l�Ƴ]�w
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
	--	�|���Ѽ�
	-----------------------------------------------------------------
	--	�԰����q
		Global_BellatiaDuplication[room_id].fight_step = 0
	--	�԰����q�}��
		Global_BellatiaDuplication[room_id].fight_step_trigger = false
	--	�p�ǦC��
		Global_BellatiaDuplication[room_id].feitlautrec_servants = {}
	--	�Ĥ@���q�l�ꦸ��
		Global_BellatiaDuplication[room_id].summon_servants_times = 0
	--	���K�C��
		Global_BellatiaDuplication[room_id].feitlautrec_flames = {}
	--	���s�O�@�n��q
		Global_BellatiaDuplication[room_id].protective_cover_power = Global_BellatiaDuplication_FourthBoss.protective_cover_power
	--	AI���A
		Global_BellatiaDuplication[room_id].is_ai_stop = true
	--	���s�O�@�n
	--	Global_BellatiaDuplication[room_id].protective_cover

		Global_BellatiaDuplication[room_id].fire_mark_time_mark = 0

	--	��t���q
		Global_BellatiaDuplication[room_id].step = 0
	--	��t���q�}��
		Global_BellatiaDuplication[room_id].step_trigger = false
	--	��t�Τp��
		Global_BellatiaDuplication[room_id].enemies = {}
	--	��t�Τh�L
		Global_BellatiaDuplication[room_id].allies = {}
	--	��t����
		Global_BellatiaDuplication[room_id].drama_record = {false, false, false, false, false, false, false, false}

	--	�԰���ť��
		Global_BellatiaDuplication[room_id].battle_listener = AddyBattleListener:new()

	-----------------------------------------------------------------
	--	change status
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_change_status(room_id, "boss")
end

-----------------------------------------------------------------
--	�Ұ�
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_active()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss -> Lua_BellatiaDuplication_FourthBoss_active()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].feitlautrec:addBuff(624471)

	-----------------------------------------------------------------
	--	��l��
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_FourthBoss_initialize(room_id)

	-----------------------------------------------------------------
	--	�}�l�D�j��
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_mainloop")

	-----------------------------------------------------------------
	--	�Ĥ@���q��t
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].step = 1
	Global_BellatiaDuplication[room_id].step_trigger = true
	Lua_BellatiaDuplication_change_status(room_id, "drama")
end

-----------------------------------------------------------------
--	�|���D�n�j��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_mainloop()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss main loop -> Lua_BellatiaDuplication_FourthBoss_mainloop()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	���K�L�O�ܼ�
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
		--	�t�Ω���
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FourthBoss.delay)

		if Global_BellatiaDuplication[room_id].step_trigger and Lua_BellatiaDuplication_check_status(room_id, "drama") then
			Global_BellatiaDuplication[room_id].step_trigger = false
			--	��t1�G�G�񪺰��@�̻P�N�઺�i��
			if Global_BellatiaDuplication[room_id].step == 1 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama1") end
			--	��t2�G�d�ĩi�P��Z�g�����O
			if Global_BellatiaDuplication[room_id].step == 2 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama2") end
			--	��t3�G�d�ĩi����ı�����s�\�Q�l
			if Global_BellatiaDuplication[room_id].step == 3 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama3") end
			--	��t4�G�d�����m��	�����_�԰�
			if Global_BellatiaDuplication[room_id].step == 4 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama4") end
			--	��t5�G���s�묹
			if Global_BellatiaDuplication[room_id].step == 5 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama5") end
			--	��t6�G�k��ù�S�M���_���L	�����_�԰�
			if Global_BellatiaDuplication[room_id].step == 6 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama6") end
			--	��t7�G�k��ù�S�˱o���X�ܤ��ΪA
			if Global_BellatiaDuplication[room_id].step == 7 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama7") end
		end

		if Global_BellatiaDuplication[room_id].fight_step_trigger and Lua_BellatiaDuplication_check_status(room_id, "boss") then
			Global_BellatiaDuplication[room_id].fight_step_trigger = false
			--	�԰�1 : ���\����G�k��ù�SHP 60%�C���ѱ���G�O�@�n���}
			if Global_BellatiaDuplication[room_id].fight_step == 1 then
				Global_BellatiaDuplication[room_id].door_before_boss4:addToPartition(room_id)
				Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_first_step")
			end

			--	�԰�2 : ���\����G�k��ù�SHP 5%�C���ѱ���G�d�������`
			if Global_BellatiaDuplication[room_id].fight_step == 2 then
				Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_second_step")
			end
		end

		-----------------------------------------------------------------
		--	�d�������`
		-----------------------------------------------------------------
		if Global_BellatiaDuplication[room_id].kangersy.hp <= 1 and Global_BellatiaDuplication[room_id].kangersy.buff[624415] then
			Global_BellatiaDuplication[room_id].step = 0
			Global_BellatiaDuplication[room_id].fight_step = 0
			Lua_BellatiaDuplication_change_status(room_id, "fail")
		end

		-----------------------------------------------------------------
		--	�����ˬd
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
	--	���ݥ��y�{����
	-----------------------------------------------------------------
	while not Global_BellatiaDuplication[room_id].step_trigger and not Global_BellatiaDuplication[room_id].fight_step_trigger do Sleep(5) end

	-----------------------------------------------------------------
	--	�M���p��
	-----------------------------------------------------------------
	for index, flame in pairs(Global_BellatiaDuplication[room_id].feitlautrec_flames) do flame:delete() end

	-----------------------------------------------------------------
	--	�R���O�@�n
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
	--	�M��
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].feitlautrec_flames = nil
	Global_BellatiaDuplication[room_id].fight_step = nil
	Global_BellatiaDuplication[room_id].fight_step_trigger = nil
	Global_BellatiaDuplication[room_id].protective_cover_power = nil
	Global_BellatiaDuplication[room_id].summon_servants_times = nil

	-----------------------------------------------------------------
	--	�Ҧ��H�^�_��t�]�w
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
	--	����
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

