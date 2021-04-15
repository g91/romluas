function LuaS_addy_music_box_npc_0()
	SetPlot(OwnerID(), "touch", "LuaS_addy_music_box_npc", 50)
end

function LuaS_addy_music_box_npc()	-- �����d�n����ܤ��e
	local player = OwnerID()
	local npc = TargetID()

	-- ���ʤ����
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_3]")
		return
	end

	-- ����w�g����
	if CheckScriptFlag(player, 547704) then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_1]")
		return
	end

	-- �ʤֳּ�
	if CountBodyItem(player, 241641) <=0 then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_2]")
		return	
	end

	SetSpeakDetail(player, "[SC_2013MUSIC_121964_RULE]")	
	
	-- ��ܲĤ@�ֳ�
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121964_OPTION_1]", "Lua_2013music_phonograph_first_movement", 0)
	-- ��ܲĤG�ֳ�
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121964_OPTION_2]", "Lua_2013music_phonograph_second_movement", 0)
	-- ��ܲĤT�ֳ�
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121964_OPTION_3]", "Lua_2013music_phonograph_third_movement", 0)
--	-- �����ȼҪO
--	LoadQuestOption(player)
end

function Lua_2013music_phonograph_first_movement()	-- �Ĥ@�ֳ����
	-- �C���e�ǳ�
	Lua_2013music_phonograph_standby({OwnerID()}, "first_movement")
end

function Lua_2013music_phonograph_second_movement()	-- �ĤG�ֳ����
	-- �ˬd����
	Lua_2013music_phonograph_checkteam("second_movement")
end

function Lua_2013music_phonograph_third_movement()	-- �ĤT�ֳ����
	-- �ˬd����
	Lua_2013music_phonograph_checkteam("third_movement")
end

function Lua_2013music_phonograph_checkteam(movement)	-- ����H���ˬd�A�G�B�T�ֳ���
	local player = OwnerID()
	local npc = TargetID()

	-- ���o�������guid
	local players = get_player_from_party(player)
	local valid_players = {}

	-- �S���ն����ڵ����
	if #players == 0 then
		if CountBodyItem( player, 241641) == false then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_2]")
		else
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_15]")	
		end	
		return
	end

	-- �ˬd����Ҧ�����
	for index, team_player in pairs(players) do
		if CheckDistance(npc, team_player, 200) then
			table.insert(valid_players, team_player)
		end
	end

	for index, valid_player in pairs(valid_players) do
		if CheckScriptFlag(valid_player, 547704) then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_14]") --����w���������Ѷi��L�����ʤF�I
			return
		end
	end

	-- ��ĤG�ֳ����H�Ƥ��ŦX
	if movement == "second_movement" then
		if #valid_players < 2 or #valid_players > 3 then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_15]")
			return
		end
	end

	-- ��ĤT�ֳ����H�Ƥ��ŦX
	if movement == "third_movement" then
		if #valid_players < 4 or #valid_players > 6 then
			SetSpeakDetail(player, "[SC_2013MUSIC_121964_15]")
			return
		end
	end

	-- �C���e�ǳ�
	Lua_2013music_phonograph_standby(valid_players, movement)
end

function Lua_2013music_phonograph_standby(players, movement)	-- �C���e�m�ǳ�
	local player = OwnerID()
	local npc = TargetID()
	local players = players or {OwnerID()}

	-- ���ʤ����
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then
		SetSpeakDetail(player, "[SC_2013MUSIC_121964_3]")
		return
	end

	-- ���h�H�P�ɳ��W�����~
	WriteRoleValue(npc, EM_RoleValue_Register1, player)

	-- ��֤@���״_���ֳ�
	DelBodyItem(OwnerID(), 241641, 1)

	-- �I�s�C���D�禡�A�ǤJ���a�M��ֳܼ�
	CallPlot(npc, "Lua_2013music_phonograph_main", players, movement)

	CloseSpeak(OwnerID())
end

function Lua_2013music_phonograph_main(players, movement)	-- �C���D�禡

	-- ���ʧޯ�buff
	local skill_buff = 624098
	-- �O����buff
	local score_buff_for_party = 624054
	local score_buff_for_single = 624135

	-- �w����key item
	local complete_item = 547704

	-- �Ĥ@�ֳ��]�w
	local the_first_movement_mode = {
		--�X��
		flag = 781260,
		-- �C�^�X�X�ʶq
		active_amount = 1
	}

	-- �ĤG�ֳ��]�w
	local the_second_movement_mode = {
		-- �X��
		flag = 781260,
		-- �C�^�X�X�ʶq
		active_amount = 2
	}

	-- �ĤT�ֳ��]�w
	local the_third_movement_mode = {
		-- �X��
		flag = 781263,
		-- �C�^�X�X�ʶq
		active_amount = 4
	}

	-- �Ҧ��]�w
	local mode

	-- �ھڿ�ֳܼ��]�w�Ҧ�
	if movement == "first_movement" then
		mode = the_first_movement_mode
	elseif movement == "second_movement" then
		mode = the_second_movement_mode
	elseif movement == "third_movement" then
		mode = the_third_movement_mode
	else
		mode = the_first_movement_mode
	end

	-- �C���D�禡�Ѽ�
	local phonograph = {
		guid = OwnerID(),
		-- �X��
		flag = mode.flag,
		-- �C���X�ʼƶq
		active_amount = mode.active_amount,
		-- �s���X�ʲ�����
		power_source = {},
		-- ���a�C��
		players = players,
		-- �O�_�b�C����
		is_activiting = true,
		-- ���a�O�_�k��
		is_escape = false,
		-- �p�ɾ�
		timer = 0,
		-- �ثe�C���i���_��
		paragraph
	}

	-- ��l�ƹC��
	Lua_2013music_phonograph_initialize(phonograph)
	local tips = create_object(122139, ReadRoleValue(phonograph.guid, EM_RoleValue_X), ReadRoleValue(phonograph.guid, EM_RoleValue_Y), ReadRoleValue(phonograph.guid, EM_RoleValue_Z), 0)

	-- �]�m���a��l���A
	for index, player in pairs(phonograph.players) do
		Lua_FE_Reset(player)
		-- �b���aRegister1�O���d�n��guid
		WriteRoleValue(player, EM_RoleValue_Register1, phonograph.guid)
		-- �b�d�n��Register2~7�O�����aguid
		WriteRoleValue(phonograph.guid, EM_RoleValue_Register + index, player)
		-- �d�n���}�l�B�@
		ScriptMessage(player, player, 3, "[SC_2013MUSIC_121964_6]", 0)
		-- �W�C���ޯ�buff
		AddBuff(player, skill_buff, 1, 86400)
		-- �I�swatcher�A�ʱ����a���A�A�M�������U��
			local Lv = ReadRoleValue(player, EM_RoleValue_Lv )
			local SubLv = ReadRoleValue( player , EM_RoleValue_LV_SUB )
			DesignLog( player, 121964 ,  "Lv = "..Lv.." SubLv = "..SubLv ) 
			--�[�WDesignLog
		CallPlot(phonograph.guid, "Lua_2013music_phonograph_watcher", phonograph)
		-- �I�s�C���e�˼Ƥ�����
		StartClientCountDown(player, 5, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]")
	end
	-- �Τ���
	Sleep(40)
	DelObj(tips)
	Sleep(10)

	-- �C���}�l
	-- �I�swatcher�A�ʱ����a���A�A�M�������U��
	CallPlot(phonograph.guid, "Lua_2013music_phonograph_watcher", phonograph)
	-- ���ʤ�����loop
	while phonograph.is_activiting do
		-- �p�G��F�T�ŷl�a����
		if CheckBuff(phonograph.guid, 624105)==true then
			local BuffLV = FN_CountBuffLevel(phonograph.guid, 624105) 
		--	DebugMsg( 0, 0 , "BuffLV1 ="..BuffLV)
			if BuffLV > 1 then
				phonograph.is_activiting = false
			end
		end
		-- 24���Ĥ@���q
		if phonograph.timer < 240 then
			if phonograph.timer % 60 == 0 then
				Lua_2013music_phonograph_paragraph_1(phonograph)
			end
		-- 24���44��ĤG���q
		elseif phonograph.timer < 440 then
			if phonograph.timer % 40 == 0 then
				Lua_2013music_phonograph_paragraph_2(phonograph)
			end
		-- 44���ĤT���q
		else
			Lua_2013music_phonograph_paragraph_3(phonograph)
		end
		-- 60�����C��
		if phonograph.timer >= 600 then
			CancelBuff( phonograph.guid, 624105)
			phonograph.is_activiting = false
		end
		-- ��e�C�����a
		local playing_player = 0
		-- �ˬd���a���A
		for index, player in pairs(players) do
			if CheckBuff(player, skill_buff) then
				playing_player = playing_player + 1
			end
		end
		-- �p�G�S�����a�A�P�_���a�k���C��
		if playing_player <= 0 then
			phonograph.is_escape = true
			phonograph.is_activiting = false
		end

		phonograph.timer = phonograph.timer + 5
		Sleep(5)
	end

	-- �M���X�ʲ�
	for index, power_source in pairs(phonograph.power_source) do
		if ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
			DelObj(ReadRoleValue(power_source, EM_RoleValue_Register1))
		end
		MagicInterrupt(power_source)
		DelObj(power_source)
	end

	-- �B��ʧ@end
	PlayMotion(phonograph.guid, 147)

	-- �C�������禡
	for index, player in pairs(players) do
		-- �d�n���a��
		if BuffInfo(phonograph.guid, Lua_BuffPosSearch(phonograph.guid, 624105), EM_BuffInfoType_Power) > 1 then			
			ScriptMessage(phonograph.guid, player, 1, "[SC_2013MUSIC_121964_9]", 0)
		-- �k���C��
		elseif phonograph.is_escape then
			-- �ѥ[��
	--		GiveBodyItem(player, 724509, 1)
		-- �C�����
		else
			ScriptMessage(phonograph.guid, player, 2, "[SC_2013MUSIC_121964_7]", C_SYSTEM)
		end
		-- ��������w�g�ѥ[key item
	--	GiveBodyItem(player, complete_item, 1)
		Lua_2013music_phonograph_award(player, movement)

		-- ��������buff
		CancelBuff(player, skill_buff)
		CancelBuff(player, score_buff_for_party)
		CancelBuff(player, score_buff_for_single)
		-- �M���d�n��guid
		WriteRoleValue(player, EM_RoleValue_Register1, 0)
	end

	--�M���d�n�����l�abuff
	CancelBuff(phonograph.guid, 624105)

	-- �M���d�����W����T
	for index = 0, 6 do
		WriteRoleValue(phonograph.guid, EM_RoleValue_Register + index, 0)
	end
end

function Lua_2013music_phonograph_initialize(phonograph)	-- ��l�ƹC��

	-- �X�ʲ�
	local power_source_id = 121966

	-- ���X�ʲ�
	for index = 1, GetMoveFlagCount(phonograph.flag) do
		local x, y, z, direction = DW_Location(phonograph.flag, index - 1)
		phonograph.power_source[index] = create_object(power_source_id, x, y, z, direction)
		SetModeEx( phonograph.power_source[index] , EM_SetModeType_HideName, true )--�W��	
		WriteRoleValue(phonograph.power_source[index], EM_RoleValue_Register1, 0)
	end

	-- �d�n���B��ʧ@begin
	PlayMotion(phonograph.guid, 145)
	Sleep(20)
	-- �B��ʧ@loop
	PlayMotion(phonograph.guid, 146)
end

function Lua_2013music_phonograph_watcher(phonograph)	-- �ʱ����a�M�X�ʴ�

	while ReadRoleValue(phonograph.guid, EM_RoleValue_Register1) ~= 0 do
		-- �M���ݦs�]�k�}
		for index, power_source in pairs(phonograph.power_source) do
			if BuffCount(power_source) == 0 and ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
				DelObj(ReadRoleValue(power_source, EM_RoleValue_Register1))
			end
		end
		for index, player in pairs(phonograph.players) do
			if CheckBuff(player, 624098) then
				if CheckDistance(phonograph.guid, player, 200) == false then
					-- �������
					ScriptMessage(phonograph.guid, player, 1, "[SC_2013MUSIC_121964_5]", 0)
				--	GiveBodyItem(player, 547704, 1)
					Lua_2013music_phonograph_award(player)
					-- �M���C���ޯ�
					CancelBuff(player, 624098)
					CancelBuff(player, 624054)
					CancelBuff(player, 624135)
				elseif CheckDistance(phonograph.guid, player, 150) == false then
					-- ĵ�i
					ScriptMessage(phonograph.guid, player, 1, "[SC_2013MUSIC_121964_4]", 0)
				end
			end
		end
		Sleep(5)
	end

end

function Lua_2013music_phonograph_award(player, movement)
	-- �O����buff
	local score_buff_for_party = 624054
	local score_buff_for_single = 624135
	local phonograph = ReadRoleValue(player, EM_RoleValue_Register1)
	local party_score = BuffInfo(player, Lua_BuffPosSearch(player, score_buff_for_party), EM_BuffInfoType_Power) +1
	
	if CheckFlag( player , 547704) == False then
		-- ����w���L�аO
		GiveBodyItem(player, 547704, 1)
		-- �����ֳ�204428���Ĥ�724509
		if movement == "first_movement" then
			DebugMsg( 0 , 0 , party_score)
			-- 
			if party_score >= 10 then
				GiveBodyItem(player, 204428, 3)
			--
			elseif party_score >= 6 then
				GiveBodyItem(player, 204428, 2)
			--
			elseif party_score >= 3 then
				GiveBodyItem(player, 204428, 1)
			--
			else
				GiveBodyItem(player, 724509, 1)
			end
		elseif movement == "second_movement" then 
			DebugMsg( 0 , 0 , party_score)
			--
			if party_score >= 25 then
				GiveBodyItem(player, 204428, 5)
			--
			elseif party_score >= 19 then
				GiveBodyItem(player, 204428, 4)
			--
			elseif party_score >= 13 then
				GiveBodyItem(player, 204428, 3)
			--
			elseif party_score >= 8 then
				GiveBodyItem(player, 204428, 2)
			--
			elseif party_score >= 3 then
				GiveBodyItem(player, 204428, 1)
			--
			else
				GiveBodyItem(player, 724509, 1)
			end
		elseif movement == "third_movement" then
			DebugMsg( 0 , 0 , party_score)
			--
			if party_score >= 48 then
				GiveBodyItem(player, 204428, 7)
			--
			elseif party_score >= 36 then
				GiveBodyItem(player, 204428, 5)
			--
			elseif party_score >= 24 then
				GiveBodyItem(player, 204428, 4)
			--
			elseif party_score >= 13 then
				GiveBodyItem(player, 204428, 2)
			--
			elseif party_score >= 3 then
				GiveBodyItem(player, 204428, 1)
			--
			else
				GiveBodyItem(player, 724509, 1)
			end
		-- �ӤH���Ƽ��y
		end
		local single_score = BuffInfo(player, Lua_BuffPosSearch(player, score_buff_for_single), EM_BuffInfoType_Power)+1
		if single_score >= 12 then
			GiveBodyItem(player, 530953, 1)
		end
	end

	-- ���B���`�`�l�[
	Lua_Festival_05_All(player)
	local Lv = ReadRoleValue( player , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( player , EM_RoleValue_LV_SUB )
	DesignLog( player, 1219641 , "Lv = "..Lv.." SubLv = "..SubLv )
	--�[�W����DesignLog_END
end

function Lua_2013music_phonograph_paragraph_1(phonograph)	-- �Ĥ@�q��
--	DebugMsg(0, 0, "paragraph 1")
	-- �o�O�Ĥ@�q��
	phonograph.paragraph = 1

	-- ���o�H�����X�ʲ��C��
	local power_source_list = get_random_table(phonograph.power_source, phonograph.active_amount)
	-- �v�@�_��
	for index, power_source in pairs(power_source_list) do
		Lua_2013music_phonograph_active_power_source(phonograph, power_source)
	end
end

function Lua_2013music_phonograph_paragraph_2(phonograph)	-- �ĤG�q��
--	DebugMsg(0, 0, "paragraph 2")
	-- �o�O�ĤG�q��
	phonograph.paragraph = 2

	-- ���o�H�����X�ʲ��C��
	local power_source_list = get_random_table(phonograph.power_source, phonograph.active_amount)
	-- �v�@�_��
	for index, power_source in pairs(power_source_list) do
		Lua_2013music_phonograph_active_power_source(phonograph, power_source)
	end
end

function Lua_2013music_phonograph_paragraph_3(phonograph)	-- �ĤT�q��
--	DebugMsg(0, 0, "paragraph 3")
	-- �o�O�ĤG�q��
	phonograph.paragraph = 3

	-- ��e�Ұʪ��X�ʲ��ƶq
	local actived_power_source_amount = 0
	-- �|���Ұʪ��X�ʲ��C��
	local unactived_power_source_list = {}

	-- �ˬd�Ҧ��X�ʲ�
	for index, power_source in pairs(phonograph.power_source) do
		-- �p�G�Ұʤ��A��e�Ұ��X�ʲ��ƶq�W�[
		if ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
			actived_power_source_amount = actived_power_source_amount + 1
		-- �S�ҰʴN�[�J�C��
		else
			table.insert(unactived_power_source_list, power_source)
		end
	end

	-- �p�G�ثe�Ұʶq�֩�C�^�X�Ұʶq�N�~��Ұ�
	if actived_power_source_amount < phonograph.active_amount then
		-- �q���ҰʦC����o�H���X�ʲ��C��
		local power_source_list = get_random_table(unactived_power_source_list, phonograph.active_amount - actived_power_source_amount)
		-- �v�@�_��
		for index, power_source in pairs(power_source_list) do
			Lua_2013music_phonograph_active_power_source(phonograph, power_source)
		end
	end
end

function Lua_2013music_phonograph_active_power_source(phonograph, power_source)	-- �o���X�ʲ��禡
	if ReadRoleValue(power_source, EM_RoleValue_Register1) ~= 0 then
		return
	end
	-- �ޯ�ðۮɶ��Alevel 1�O7��Alevel 2�O5��
	local symbol_time = 7
	local type_1 = {	-- �ʤO�εo�ʨϥΪ��k�N�Mbuff�C��
		{skill = 850675, buff = 624101, symbol = 122138},	-- ���
--		{skill = 850676, buff = 624102, symbol = 122139},	-- �Ǧ�
		{skill = 850677, buff = 624103, symbol = 122140},	-- �Ŧ�
--		{skill = 850678, buff = 624104, symbol = 122141},	-- ����
		{skill = 850736, buff = 624166, symbol = 122142},	-- ����
		{skill = 850737, buff = 624167, symbol = 122143}	-- ����
	}
	local type_2 = {	-- �ʤO�εo�ʨϥΪ��k�N�Mbuff�C��
		{skill = 850730, buff = 624101, symbol = 122138},	-- ���
--		{skill = 850731, buff = 624102, symbol = 122139},	-- �Ǧ�
		{skill = 850732, buff = 624103, symbol = 122140},	-- �Ŧ�
--		{skill = 850733, buff = 624104, symbol = 122141},	-- ����
		{skill = 850734, buff = 624166, symbol = 122142},	-- ����
		{skill = 850735, buff = 624167, symbol = 122143}	-- ����
	}
	-- �Ұʤ覡
	local active_type
	-- �p�G�j��Ĥ@�q���ϥ�type 2
	if phonograph.paragraph > 1 then
		active_type = type_2
		symbol_time = 5
	-- ���M��type 1
	else
		active_type = type_1
		symbol_time = 7
	end

	-- �H����@���C��
	local type = active_type[RandRange(1, #active_type)]

	-- �b�X�ʲ�����m����symbol�A�]�N�O�]�k�}
	local x, y, z, direction = DW_Location(power_source)
	local symbol_guid = create_object(type.symbol, x, y + 4, z, direction, {EM_SetModeType_Gravity, false})
	-- ��k�}guid�O���b�X�ʲ���register1
	WriteRoleValue(power_source, EM_RoleValue_Register1, symbol_guid)

	-- ��d�n���ϥηl�a�k�N
	CastSpell(power_source, phonograph.guid, type.skill)
	-- �W�C��аO
	AddBuff(power_source, type.buff, 1, symbol_time + 1)
end

-- ////////////////////////////////////////////////////////////////////////////////////
-- �H�U�O�ޯ�Ĳ�o
-- ////////////////////////////////////////////////////////////////////////////////////

function LuaS_bm_624108()	-- �ʤO�ΨS���ήɸѰ���I��[���ֲ��G��]�ˬd
	local phonograph = TargetID()
	local power_source = OwnerID()
	DelObj(ReadRoleValue(power_source, EM_RoleValue_Register1))
	WriteRoleValue(power_source, EM_RoleValue_Register1, 0)
	-- �R���o��buff
	for index = 1, BuffCount(power_source) do
		CancelBuff(power_source, BuffInfo(power_source, index, EM_BuffInfoType_OwnerID))
	end
	local Player = SearchRangePlayer(phonograph , 200)
	for i = 0 , table.getn(Player) do
		if CheckBuff(Player[i] , 624098 ) == true then 
			ScriptMessage(phonograph, Player[i], 1, "[SC_2013MUSIC_121964_11]", 0)
		end
	end
	AddBuff(phonograph, 624105, 0, -1)
end

function LuaS_check_624109()		--�Ѱ����S��check
	return LuaS_2013music_check_buff(624101)	--���S�ĬI��check
end

function LuaS_check_624110()		--�Ѱ��Ǧ�S��check
	return LuaS_2013music_check_buff(624102) 	--�Ǧ�S�ĬI��check
end

function LuaS_check_624111()		--�Ѱ��Ŧ�S��check
	return LuaS_2013music_check_buff(624103)	--�Ŧ�S�ĬI��check
end

function LuaS_check_624112()		--�Ѱ�����S��check
	return LuaS_2013music_check_buff(624104) --����S�ĬI��check
end

function LuaS_check_624168()		--�Ѱ�����S��check
	return LuaS_2013music_check_buff(624166)--����S�ĬI��check
end

function LuaS_check_624169()		--�Ѱ�����S��check
	return LuaS_2013music_check_buff(624167)--����S�ĬI��check
end

function LuaS_check_2013music_skill()
	local player = OwnerID()
	-- phonograph��guid
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)
	local power_source = SearchRangeNPC(OwnerID(), 20)
	local is_active_power = false
	local is_activing = false
	-- �Ȧs���Ұʾ�
	local ps
	for i, v in pairs(power_source) do
		if ReadRoleValue(v, EM_RoleValue_OrgID) == 121966 then
			is_active_power = true
		end
		if is_active_power and ReadRoleValue(v, EM_RoleValue_Register1) ~= 0 then
			is_activing = true
		end
		if is_active_power and is_activing then
			-- �p�⪱�a�P�Ұʾ����V����
			local delta_x = ReadRoleValue(player,EM_RoleValue_X) - ReadRoleValue(v, EM_RoleValue_X)
			local delta_z = ReadRoleValue(player,EM_RoleValue_Z) - ReadRoleValue(v, EM_RoleValue_Z)
			local correct_direction = CalDir(delta_x, delta_z) - 180
			local delta_direction = ReadRoleValue(player, EM_RoleValue_Dir) - correct_direction
		--	if delta_direction >= 180 then delta_direction = delta_direction - 360 end
			-- �~�t�P�\+-30��
		--	if delta_direction >= -30 and delta_direction <= 30 then
				return true
	--		else
	--			-- ���������X�ʲ�
	--			ScriptMessage(npc, player, 1, "[SC_2013MUSIC_121964_13]", C_SYSTEM)
	--			return false
	--		end
		end
	end
	return false
end

function LuaS_2013music_check_buff(_buff)
	local player = OwnerID()
	-- phonograph��guid
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)
	local power_source = SearchRangeNPC(OwnerID(), 20)
	local is_active_power = false
	local is_activing = false
	for i, v in pairs(power_source) do
		if ReadRoleValue(v, EM_RoleValue_OrgID) == 121966 then
			is_active_power = true
		end
		if is_active_power and ReadRoleValue(v, EM_RoleValue_Register1) ~= 0 then
			is_activing = true
		end
		-- ���\�Ѱ�
		if CheckBuff(v, _buff) and is_activing then
			-- ���_�l�a�I�k
			MagicInterrupt(v)
			-- �R���k�}
			DelObj(ReadRoleValue(v, EM_RoleValue_Register1))
			WriteRoleValue(v, EM_RoleValue_Register1, 0)
			-- �R���o��buff
			for index = 1, BuffCount(v) do
				CancelBuff(v, BuffInfo(v, index, EM_BuffInfoType_OwnerID))
			end
			ScriptMessage(npc, player, 2, "[SC_2013MUSIC_121964_10]", 0)
			-- �o���S��
			CastSpell(v, npc, 850738)
			return true
		end
	end
	-- �Ѱ�����
	if is_active_power and is_activing then
		ScriptMessage(npc, player, 1, "[SC_2013MUSIC_121964_8]", 0)
	end
	return false
end

function LuaS_mb_result()	-- ���\�Ѱ����^�X
	local player = OwnerID()
	local target = TargetID()
	-- phonograph��guid
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)
	-- �O����buff
	local score_buff_for_party = 624054
	local score_buff_for_single = 624135
	-- �ӤH���ƥ[��
	AddBuff(player, score_buff_for_single, 0, 86400)
	-- �qphonograph���o�������
	for index = 1, 6 do
		local _player = ReadRoleValue(npc, EM_RoleValue_Register + index)
		if _player ~= 0 then
			AddBuff(_player, score_buff_for_party, 0, 86400)
		end
	end
end