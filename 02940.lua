-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	�|���]�w
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_setting()
	Global_BellatiaDuplication:debug("INIT > fourth boss setting -> Lua_BellatiaDuplication_FourthBoss_setting()")

	Global_BellatiaDuplication_FourthBoss = {}

	-- ������
	Global_BellatiaDuplication_FourthBoss.delay = 0.5
	-- �O�@�n��q
	Global_BellatiaDuplication_FourthBoss.protective_cover_power = 30
	-- �O�@�n�b�|
	Global_BellatiaDuplication_FourthBoss.protective_cover_radius = 120
	-- �O�@�norgid
	Global_BellatiaDuplication_FourthBoss.protective_cover_orgid = 107830
	-- �O�@�n�`�Iorid
	Global_BellatiaDuplication_FourthBoss.protective_cover_node_orgid = 107831
	-- �_�c
	Global_BellatiaDuplication_FourthBoss.treasure_orgid = 107866
	-- �j������
	Global_BellatiaDuplication_FourthBoss.big_fire_element = 107827
	-- �p������
	Global_BellatiaDuplication_FourthBoss.small_fire_element = 107826
	-- ��z���k��ù�S
	Global_BellatiaDuplication_FourthBoss.feitlautrec_weak_orgid = 107858
	-- �k��ù�S���ե�
	Global_BellatiaDuplication_FourthBoss.feitlautrec_sungchili_orgid = 122754

	if Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication_FourthBoss.protective_cover_power = 40
		Global_BellatiaDuplication_FourthBoss.treasure_orgid = 107998
		Global_BellatiaDuplication_FourthBoss.big_fire_element = 107995
		Global_BellatiaDuplication_FourthBoss.small_fire_element = 107994
		Global_BellatiaDuplication_FourthBoss.feitlautrec_weak_orgid = 107996
		Global_BellatiaDuplication_FourthBoss.feitlautrec_sungchili_orgid = 122754
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication_FourthBoss.protective_cover_power = 50
		Global_BellatiaDuplication_FourthBoss.treasure_orgid = 108061
		Global_BellatiaDuplication_FourthBoss.big_fire_element = 108058
		Global_BellatiaDuplication_FourthBoss.small_fire_element = 108057
		Global_BellatiaDuplication_FourthBoss.feitlautrec_weak_orgid = 108059
		Global_BellatiaDuplication_FourthBoss.feitlautrec_sungchili_orgid = 122754
	end

	-----------------------------------------------------------------
	--	�X��
	-----------------------------------------------------------------
	-- �|���e��|������X��
	Global_BellatiaDuplication_FourthBoss.goto_route_flag = AddyFlagGroup:new(781289)
	-- �|���}�ԫe����X��
	Global_BellatiaDuplication_FourthBoss.beginning_position_flag = AddyFlagGroup:new(781290)
	-- �p�ǥl���I
	Global_BellatiaDuplication_FourthBoss.summon_servants_flag = AddyFlagGroup:new(781291)

	-----------------------------------------------------------------
	--	�ޯ�
	-----------------------------------------------------------------
	-----------------------------------------------------------------
	--	�|���ޯ�
	-----------------------------------------------------------------
	-- �P���R��
	Global_BellatiaDuplication_FourthBoss.skill_prairie_fire = AddySkill:new()
	Global_BellatiaDuplication_FourthBoss.skill_prairie_fire.name = "prairie_fire"
	Global_BellatiaDuplication_FourthBoss.skill_prairie_fire.cd = 0
	function Global_BellatiaDuplication_FourthBoss.skill_prairie_fire:active(caster)
		Global_BellatiaDuplication:debug("use skill> prairie fire")

		caster.movable = false
		caster.strike_back = false
		caster.search_enemy = false

		caster:addBuff(624677)
		for index, player in pairs(Global_BellatiaDuplication[caster.room_id].players) do
			caster:scriptMessage(player, "[$MUTE]".."[SC_BELLATIA_DUPLICATION_FOURTH_BOSS_2]", 3)
		end
		Sleep(20)
		caster:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
		caster:systemCastSpell(caster, 850913)
		Global_BellatiaDuplication:debug("use skill> prairie fire -> feitlautrec cast spell 850913")

		caster.movable = true
		caster.strike_back = true
		caster.search_enemy = true
		Sleep(10)
		caster:cancelBuff(624677)
	end

	-- �U�o���u
	Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade = AddySkill:new()
	Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade.name = "fuel_grenade"
	Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade.cd = 11
	if Global_BellatiaDuplication.type == "hard" then
		Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade.lv = 0
	elseif Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade.lv = 0
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade.lv = 0
	end
	function Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade:active(caster)
		Global_BellatiaDuplication:debug("use skill> fuel grenade")

		caster.movable = false
		caster.strike_back = false
		caster.search_enemy = false

		local targets = {}
	--	�ư����ת��~��
		for index, player in pairs(Global_BellatiaDuplication[caster.room_id].players) do
			if player.x <= Global_BellatiaDuplication[caster.room_id].door_before_boss4.x then table.insert(targets, player) end
		end
		if #targets > 3 then targets = get_random_table(targets, 3) end

		for index, target in pairs(targets) do
			Global_BellatiaDuplication:debug("use skill> fuel grenade -> " .. index)
			caster:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN)
			Sleep(3)
			caster:systemCastSpell(target, 850915, Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade.lv)
			Sleep(12)
			for index = 1, 2 do
				local _flame = AddyNpc:new()
				_flame:create(107829, target.x - 8 + RandRange(1, 16), target.y, target.z - 8 + RandRange(1, 16))
				_flame.live_time = 5
				_flame.mark = false
				_flame.fight = false
				_flame.strike_back = false
				_flame.search_enemy = false
				_flame.movable = false
				_flame.revive = false
				_flame.show_role_head = false
				_flame.hide_hp_mp = true
				_flame.hide_name = true
				_flame:addBuff(624434)
				if Global_BellatiaDuplication[caster.room_id].feitlautrec_flames then table.insert(Global_BellatiaDuplication[caster.room_id].feitlautrec_flames, _flame) end
				_flame:addToPartition(target.room_id)
			end
		end

		caster.movable = true
		caster.strike_back = true
		caster.search_enemy = true
		Sleep(5)
	end

	-- ���K�L�O
	Global_BellatiaDuplication_FourthBoss.skill_fire_marking = AddySkill:new()
	Global_BellatiaDuplication_FourthBoss.skill_fire_marking.name = "fire_marking"
	Global_BellatiaDuplication_FourthBoss.skill_fire_marking.cd = 30
	if Global_BellatiaDuplication.type == "hard" then
		Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv = 0
	elseif Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv = 0
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv = 0
	end
	function Global_BellatiaDuplication_FourthBoss.skill_fire_marking:active(caster)
		Global_BellatiaDuplication:debug("use skill> fire marking")

		caster.movable = false
		caster.strike_back = false
		caster.search_enemy = false
		Sleep(5)

		caster:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN)
		Sleep(5)
		local targets = {}
	--	�ư����ת��~��
		for index, player in pairs(Global_BellatiaDuplication[caster.room_id].players) do
			if player.x <= Global_BellatiaDuplication[caster.room_id].door_before_boss4.x and player.hp > 0 then table.insert(targets, player) end
		end
		local buff = {624418, 624419, 624420, 624421}
		targets = get_random_table(targets, #targets)
		buff = get_random_table(buff, #buff)

		Global_BellatiaDuplication[caster.room_id].fire_mark_time_mark = Global_BellatiaDuplication[caster.room_id].battle_listener.current_time

		local _buff = {}
		for index, target in pairs(targets) do
			_buff = target.buff
			if _buff[624418] then target:cancelBuff(624418) end
			if _buff[624419] then target:cancelBuff(624419) end
			if _buff[624420] then target:cancelBuff(624420) end
			if _buff[624421] then target:cancelBuff(624421) end
		end

		for index = 0, #targets / 4 do
			if targets[1 + index * 4] then targets[1 + index * 4]:addBuff(buff[1], Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv) end
			if targets[2 + index * 4] then targets[2 + index * 4]:addBuff(buff[2], Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv) end
			if targets[3 + index * 4] then targets[3 + index * 4]:addBuff(buff[3], Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv) end
			if targets[4 + index * 4] then targets[4 + index * 4]:addBuff(buff[4], Global_BellatiaDuplication_FourthBoss.skill_fire_marking.lv) end
		end
		Sleep(5)
		caster:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN)
		Sleep(5)

		caster.movable = true
		caster.strike_back = true
		caster.search_enemy = true
		Sleep(5)
	end

	-- �۳�p��
	Global_BellatiaDuplication_FourthBoss.skill_summon_servants = AddySkill:new()
	Global_BellatiaDuplication_FourthBoss.skill_summon_servants.name = "summon_servants"
	Global_BellatiaDuplication_FourthBoss.skill_summon_servants.cd = 3
	function Global_BellatiaDuplication_FourthBoss.skill_summon_servants:active(caster)
		Global_BellatiaDuplication:debug("use skill> summon servants")

		local random_index = 0
		local summon_servants_flag = Global_BellatiaDuplication_FourthBoss.summon_servants_flag

		-- �@��j����
		local _servant = AddyMonster:new()
		random_index = RandRange(1, #summon_servants_flag)
		_servant:create(Global_BellatiaDuplication_FourthBoss.big_fire_element, summon_servants_flag[random_index].x, summon_servants_flag[random_index].y, summon_servants_flag[random_index].z)
		_servant.is_live = true
		_servant:addToPartition(caster.room_id)
		-- ����ƥ[850916
		_servant:addBuff(624427)
		if Global_BellatiaDuplication[caster.room_id].fight_step == 1 then LockHP(_servant.GUID, 1, "BellatiaDuplication_deadplot") end
		table.insert(Global_BellatiaDuplication[caster.room_id].feitlautrec_servants, _servant)
		Global_BellatiaDuplication:debug("use skill> summon servants -> 1 big element summoned")

		-- �Ⱖ�p����
		for index = 1, 3 do
			local _servant = AddyMonster:new()
			random_index = RandRange(1, #summon_servants_flag)
			_servant:create(Global_BellatiaDuplication_FourthBoss.small_fire_element , summon_servants_flag[random_index].x, summon_servants_flag[random_index].y, summon_servants_flag[random_index].z)
			_servant:addToPartition(caster.room_id)
			_servant:addBuff(502707)
			if Global_BellatiaDuplication[caster.room_id].fight_step == 1 then
				LockHP(_servant.GUID, 1, "BellatiaDuplication_deadplot")
				_servant.strike_back = false
				_servant.search_enemy = false
				_servant.is_live = true
			else
				_servant.strike_back = true
				_servant.search_enemy = true
				_servant.is_live = true
			end
			table.insert(Global_BellatiaDuplication[caster.room_id].feitlautrec_servants, _servant)
			Global_BellatiaDuplication:debug("use skill> summon servants -> 1 small element summoned")
		end

		Global_BellatiaDuplication[caster.room_id].summon_servants_times = Global_BellatiaDuplication[caster.room_id].summon_servants_times + 1
		Global_BellatiaDuplication:debug("use skill> summon servants times : " .. Global_BellatiaDuplication[caster.room_id].summon_servants_times)
	end

end

-----------------------------------------------------------------
--	�|��AI
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_ai()
	Global_BellatiaDuplication:debug("ACTIVE > fourth boss ai -> Lua_BellatiaDuplication_FourthBoss_ai()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].is_ai_stop = false

	local current_step = Global_BellatiaDuplication[room_id].step

	local feitlautrec = Global_BellatiaDuplication[room_id].feitlautrec
	local servants = Global_BellatiaDuplication[room_id].feitlautrec_servants
	local battleListener = Global_BellatiaDuplication[room_id].battle_listener
	battleListener:add(feitlautrec)

	-----------------------------------------------------------------
	--	AI�ܼ�
	-----------------------------------------------------------------
	--	���������O�_���`
		local no_big_fire_element = true
	--	�P���R��}��
		local prairie_fire_trigger = false
	--	�U�@���I��P���R�쪺�ͩR�ʤ���
		local prairie_fire_hp_rate = 0.8

	--	��z��HP�q60%�}�l
	if Global_BellatiaDuplication[room_id].fight_step == 2 then prairie_fire_hp_rate = 0.6 end

	while Lua_BellatiaDuplication_check_status(room_id, "boss") do
		if #feitlautrec.hate_list > 0 then

			-----------------------------------------------------------------
			--	�۳�p��
			-----------------------------------------------------------------
			if Global_BellatiaDuplication[room_id].fight_step == 1 then
				no_big_fire_element = true
				for index, servant in pairs(servants) do
					if servant.ORGID == Global_BellatiaDuplication_FourthBoss.big_fire_element then no_big_fire_element = false break end
				end
				if Global_BellatiaDuplication[room_id].summon_servants_times < 8 and no_big_fire_element then
					feitlautrec:useSkill("summon_servants")
				end
			else
				if #servants < 3 then feitlautrec:useSkill("summon_servants") end
			end

			-----------------------------------------------------------------
			--	�P���R��
			-----------------------------------------------------------------
			if feitlautrec.hp <= feitlautrec.max_hp * prairie_fire_hp_rate then
				Global_BellatiaDuplication:debug("feitlautrec hp : " .. feitlautrec.hp)
			--	0.6�ɭn�i��t�A����o��
				if prairie_fire_hp_rate ~= 0.6 then prairie_fire_trigger = true end
				prairie_fire_hp_rate = prairie_fire_hp_rate - 0.2
				Global_BellatiaDuplication:debug("prairie_fire_trigger : " .. tostring(prairie_fire_trigger) .. ", prairie_fire_hp_rate : " .. prairie_fire_hp_rate)
			end
			if prairie_fire_trigger then
				prairie_fire_trigger = false
				feitlautrec:useSkill("prairie_fire")
			end

			-- ���K�L�O
			feitlautrec:useSkill("fire_marking")

			-- �U�o���u
			feitlautrec:useSkill("fuel_grenade")
		end

		Sleep(Global_BellatiaDuplication_FourthBoss.delay * 10)
	end
	battleListener:remove(feitlautrec)
--	��t�����^��
	feitlautrec:addBuff(624471)
	feitlautrec:stopAttack()
	feitlautrec:stopMove()
	feitlautrec.strike_back = false
	feitlautrec.search_enemy = false
	feitlautrec.fight = false
	feitlautrec.movable = false
	Global_BellatiaDuplication:debug("fourth boss ai end")
	Global_BellatiaDuplication[room_id].is_ai_stop = true
end

-----------------------------------------------------------------
--	�P���R���ˬd
-----------------------------------------------------------------
function Lua_MagicObject_624414()
	local target = AddyRole:new(TargetID())
	local owner = AddyRole:new(OwnerID())
	if target.buff[624433] or target.buff[624428] or target.buff[624415] or
	   target.GUID == Global_BellatiaDuplication[target.room_id].pangkorrams.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].pangkorrams_dragon.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].cassam.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].kangersy.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].morrok.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].jill.GUID then
		return false
	end
	return true
end

-----------------------------------------------------------------
--	�z�������ˬd
-----------------------------------------------------------------
function Lua_MagicObject_624425()
	local target = AddyRole:new(TargetID())
	local owner = AddyRole:new(OwnerID())
	if target.buff[624433] or target.buff[624428] or target.buff[624415] or
	   target.GUID == Global_BellatiaDuplication[target.room_id].pangkorrams.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].pangkorrams_dragon.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].cassam.GUID then return false end
	return true
end

-----------------------------------------------------------------
--	���K�U�N�ˬd
-----------------------------------------------------------------
function Lua_MagicObject_624417()
	local target = AddyRole:new(TargetID())
	local owner = AddyRole:new(OwnerID())
	if target.GUID == Global_BellatiaDuplication[target.room_id].pangkorrams.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].pangkorrams_dragon.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].cassam.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].kangersy.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].morrok.GUID or
	   target.GUID == Global_BellatiaDuplication[target.room_id].jill.GUID then
		return false
	end
	return true
end

-----------------------------------------------------------------
--	���K�L�O����
-----------------------------------------------------------------
function Lua_BellatiaDuplication_fire_mark_formula(targets, near_influencers, far_influencers, buff_orgid)

	-----------------------------------------------------------------
	--	
		local buff_lv = 0
		local rate = 0
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	targets �Ҧ���H
		for index, target in pairs(targets) do
		-----------------------------------------------------------------
		--	�T�{targets ��buff
			if target.buff[buff_orgid] then
			-----------------------------------------------------------------
			--	��l�ƼȦs
				buff_lv = 0
			--	���ŤW��10�šA�Ҧ����a�v�T�̼v�T�W��5�šC
				rate =1 / ( #near_influencers + #far_influencers)
			-----------------------------------------------------------------
			-----------------------------------------------------------------
			--	��Z���v�T�̭p��
				for index, near_influencer in pairs(near_influencers) do
				-----------------------------------------------------------------
				--	�p�G�v�T��H�b90�X���p��
					if target:distanceTo(near_influencer) <= 90 then
						buff_lv = buff_lv + ((target:distanceTo(near_influencer)/90) * 5 * rate)
				--	�W�X90�X�~�g�@
					else buff_lv = 10 end
				end
			-----------------------------------------------------------------
			-----------------------------------------------------------------
			--	���Z���v�T�̭p��
				for index, far_influencer in pairs(far_influencers) do
				-----------------------------------------------------------------
				--	�p�G�v�T��H�b100�X�~�p��
					if target:distanceTo(far_influencer) >= 100 and target:distanceTo(far_influencer) < 190 then
						buff_lv = buff_lv + (((190 - target:distanceTo(far_influencer))/90) * 5 * rate)
				--	�]�J100�X���g�@
					elseif target:distanceTo(far_influencer) < 100 then buff_lv = 10 end
				end
			-----------------------------------------------------------------
			-----------------------------------------------------------------
			--	buff�����ˬd
				if buff_lv > 10 then buff_lv = 10 end
			-----------------------------------------------------------------
			-----------------------------------------------------------------
			--	���K�L�O�ˮ`
				Global_BellatiaDuplication[target.room_id].feitlautrec:systemCastSpell(target, 850963, buff_lv)
			-----------------------------------------------------------------
			end
		-----------------------------------------------------------------
		end
	-----------------------------------------------------------------
end

-----------------------------------------------------------------
--	���y�N�R���O�@�n�B�z�C���b624424
-----------------------------------------------------------------
function Lua_MagicObject_624424()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].protective_cover_power = Global_BellatiaDuplication[room_id].protective_cover_power - 1
	if Global_BellatiaDuplication[room_id].protective_cover_power < 20 then
		for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
			Global_BellatiaDuplication.handler:scriptMessage(player, "[SC_BELLATIADUPLICATION_FOURTH_BOSS_61]", 1)
		end
	end
	if Global_BellatiaDuplication[room_id].protective_cover_power >0 then
		for index, node in pairs(Global_BellatiaDuplication[room_id].protective_cover.node) do
			node.hp = Global_BellatiaDuplication[room_id].protective_cover.max_hp * Global_BellatiaDuplication[room_id].protective_cover_power / 100
		end
		Global_BellatiaDuplication:debug("hit protective cover : protective cover power = " .. Global_BellatiaDuplication[room_id].protective_cover_power)
	end
end
