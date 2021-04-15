function LuaS_love_music_dog_npc()										-- �R�q�ˡCù�����
	local player = OwnerID()
	local npc = TargetID()

	if CheckScriptFlag(player, 547578) then									-- ����H�ѥ[�L�����
		SetSpeakDetail(player, "[SC_2013MUSIC_121868_01]")
	else													-- �C������
		SetSpeakDetail(player, "[SC_2013MUSIC_121868_03]")
		AddSpeakOption(player, npc, "[SC_2013MUSIC_121868_04]", "LuaS_love_music_dog_explain", 0)	-- ��M�n�ѥ[!
	end
end

function LuaS_love_music_dog_explain()										-- �C���ѻ�
	local player = OwnerID()
	local npc = TargetID()

	AddBuff(player, 624151, 1, 86400)										-- �����������

	SetSpeakDetail(player, "[SC_2013MUSIC_121868_05]")
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121868_06]", "LuaS_love_music_dog_standby", 0)		-- ���W�}�l!
end

function LuaS_love_music_dog_standby()										-- �C���e�m�u�@�A���W�B���ݡB�ǰe
	local player = OwnerID()
	local npc = TargetID()

	if CheckBuff(npc, 623546) then										-- ���ʤ��еy��
		SetSpeakDetail(player, "[SC_2013MUSIC_121868_02]")
	else													-- �C���e�������]�w
		get_multiplayer(npc, player, 2, 10, {							-- �]�w�h�H�C�� get_multiplayer()
			success = "LuaS_love_music_dog_regist_success",
			fully_booked = "LuaS_love_music_dog_fully_booked",
			has_regist = "LuaS_love_music_dog_has_regist",
			complete = "LuaS_love_music_dog"
		})
	end
end

function LuaS_love_music_dog_fully_booked(event)
	SetSpeakDetail(player, "[SC_2013MUSIC_121868_SYSTEM_03]")	
end

function LuaS_love_music_dog_has_regist(event)
	SetSpeakDetail(player, "[SC_2013MUSIC_121868_SYSTEM_04]")
end

function LuaS_love_music_dog_regist_success(event)								-- ���a���W���\��B�z
	local npc = event.register
	local player = event.player
	local current_time = event.current_time
	StartClientCountDown(player, current_time, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]")
	DW_CancelMount(player)										-- �U��
	PlayMotion(player, ruFUSION_ACTORSTATE_NORMAL)
	AddBuff(player, 620265, 0, 86400)
	set_position_to_flag(player, 781262, RandRange(1, 5) - 1, 0, 40, 0, 0)					-- �N���a�ǰe��C����m move flag 781262#5�O���a�����C���᪺���a��m�A�n�c��
	DesignLog( Player , 121868 , " 2013Music game is Start " )				--3/28�����[�A�O�����ʳ��W�H��
	CloseSpeak(player)
end

function LuaS_love_music_dog(event)							-- �D�n�y�{�禡
	
	local player = event.players							-- ���a�}�C

	local npc = OwnerID()								-- ���Wnpc

	local game_time = 60								-- �C���`�ɶ�

	local rookie_mode = {								-- �����׵泾���Ū��]�w
		limit = 0,
		delay = {30},								-- �C���X�y����ɶ�
		amount = {3},								-- �C���X�y�y��
		music_note_id = {117149, 117151},					-- �C���X�y�y��
		speed_buff = {504489}							-- ���Ųy���[�tbuff
	}

	local amateur_mode = {								-- �����׷~�l���Ū��]�w
		limit = 30,
		delay = {10},
		amount = {3},
		music_note_id = {117149, 117150, 117151, 117148},
		speed_buff = {504490}
	}

	local expert_mode = {								-- �����ױM�a���Ū��]�w
		limit = 50,
		delay = {5, 10, 20},							-- �C���X�y����ɶ��A�H������@�Ӽƭ�
		amount = {3, 5},							-- �C���X�y�y�ơA�H������@�Ӽƭ�	--3/20������A��֥X�y�P�ɼW�[5���y�X�y�]�w
		music_note_id = {117149, 117150, 117151, 117148},			--3/20������A�R��5���y�A5���y�[�b(special_mode)
		speed_buff = {504489, 504490, 504491}
	}

	local special_mode = {								-- 3/20�����[�A�����ױM�a���Ū�5���y�]�w
		limit = 50,
		delay = {20},							-- �C���X�y����ɶ�
		amount = {1},							-- �C���X�y�y��
		music_note_id = {117152},					--�X�y�����G5���y
		speed_buff = {504491}
	}

	local buff = {									-- �C����buff�A�O���ΩM�ޯ��
		score = 500984,
		skill = 624012
	}

	local activiting_buff = 623546							-- �C�����T����Wbuff

	local quest_complete = 547578							-- �������Ȫ�flag

	local flag = 781262								-- ���ʥ�move flag

	AddBuff(npc, activiting_buff, 1, 86400)						-- �C���}�l�Anpc�W�C�����T����Wbuff

	for time = 1, 0, -1 do								-- �C���e�˼ƭp��
		if time == 0 then
--			Say(npc, "game start!")
		else
--			Say(npc, time)
		end
		Sleep(10)
	end

	local activiting = true											-- �C���i�檬�p true = �i�椤

	local music_note = {}											-- table�A�s�񭵲Ųy��guid

	for index = 1, #player do										-- �C���}�l�e��C�@�쪱�a���e�m�]�w
		if CheckBuff(player[index], buff["score"]) then CancelBuff(player[index], buff["score"]) end	-- �U�@���a���W���p��buff�A�����p��buff
		if CheckBuff(player[index], 620265) then CancelBuff(player[index], 620265) end			-- �Ѱ��w��

		AddBuff(player[index], buff["skill"], 0, game_time)						-- �W�Ҧ����ʻݭn��buff

		WriteRoleValue(player[index], EM_RoleValue_Register1, npc)					-- �O��npc��guid�A���F���o�O���bnpc���W����L���aguid
		WriteRoleValue(npc, EM_RoleValue_Register + index, player[index])
	end

	while activiting do											-- �C���j�� start�A�p�Gactiviting = true�A����i��C��
		local player_count = 0										-- �O���ثe���a�H��
		local power = 0											-- �O�����a�o����
		for index = 1, #player do												--�˹�a���W��buff���p�A�P�_�O�_�C���i�椤
			if CheckBuff(player[index], buff["skill"]) then
				player_count = player_count + 1
				power = BuffInfo(player[index], Lua_BuffPosSearch(player[index], buff["score"]), EM_BuffInfoType_Power)	-- ���o�O��buff��power��
				local buff_time = BuffInfo(player[index], Lua_BuffPosSearch(player[index], buff["skill"]), EM_BuffInfoType_Time)
				if buff_time < 10 then											-- �C�������e�˼ƴ���
					ScriptMessage(npc, player[index], 1, "[SC_2013MUSIC_121868_SYSTEM_02] " .. buff_time .. "[SYS_SECOND]", 0)
				end
			end
		end
		if player_count == 0 then												-- �p�G���a�H�� == 0 �����C��
			activiting = false 
			break
		end

		if power >= expert_mode["limit"] then											-- �p�Gpower�j�󵥩�level_3��limit�i�Jlevel_3
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(expert_mode, flag))
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(special_mode, flag))			--3/20�����[�A�N5���y�[�J�X�y���Ǥ�
		elseif power >= amateur_mode["limit"] then										-- �p�Gpower�j�󵥩�level_2��limit�i�Jlevel_2
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(amateur_mode, flag))
		else															-- �p�G���S���i�Jlevel_1
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(rookie_mode, flag))
		end
		LuaS_love_music_dog_clean_music_note(music_note, flag)									-- �C��loop����M���S�έ��Ųy���禡
	end																-- �C���j�� end

	for i, v in pairs(music_note) do				-- �M���Ѿl���Ųy
		DelObj(v)
	end

	CancelBuff(npc, activiting_buff)				-- �M���C�����T����Wbuff

end

function LuaS_love_music_dog_magic_check()			-- magic object
	if CheckBuff(OwnerID(), 500985) then			--  {624120, 624121, 624122, 624123, 500985
		return false					--   624038, 504696, 504697, 504698, 504699���I�k�ˬd
	end							-- �p�G��500985(�w�t����buff)�I�k����
end

function LuaS_love_music_dog_magic_do()			-- script of  magic object 624038�A����do,re,mi,fa,so�������ޯ�
	set_position_to_flag(OwnerID(), 781262, 0, 0, 30, 0, 0)	-- set_position_to_flag(GUID, flag_group, flag_id, x�ץ���, y�ץ���, z�ץ���, direction�ץ���)
end

function LuaS_love_music_dog_magic_re()			-- script of  magic object 504696
	set_position_to_flag(OwnerID(), 781262, 1, 0, 30, 0, 0)
end

function LuaS_love_music_dog_magic_mi()			-- script of  magic object 504697
	set_position_to_flag(OwnerID(), 781262, 2, 0, 30, 0, 0)
end

function LuaS_love_music_dog_magic_fa()			-- script of  magic object 504698
	set_position_to_flag(OwnerID(), 781262, 3, 0, 30, 0, 0)
end

function LuaS_love_music_dog_magic_so()			-- script of  magic object 504699
	set_position_to_flag(OwnerID(), 781262, 4, 0, 30, 0, 0)
end

function LuaS_love_music_dog_note_casting()			-- ���Ųy���X�����I��k�N
	local note = OwnerID()
	local id = ReadRoleValue(note, EM_RoleValue_OrgID)
	local magic = {}
	magic[117149] = 850685				-- do re mi fa so�U�ح��Ųy����I�񪺪k�N
	magic[117150] = 850686
	magic[117151] = 850687
	magic[117152] = 850688
	magic[117148] = 850689

	while true do
		SysCastSpellLv(note, note, magic[id], 0 )
		sleep(1)					-- 0.1��@��
	end
end

function LuaS_love_music_dog_note_check()									-- ���Ų��X�����I��k�N���ˬd
	DebugMsg(OwnerID(), 0, "function LuaS_love_music_dog_note_check()")
	local player = TargetID()
	local note = OwnerID()
	if CheckBuff( player , 500985 ) == true then	--3/18�����[�A�ˬd���a���w�tBUFF�ɡA������
		return false		
	elseif ReadRoleValue(note, EM_RoleValue_Register1) ~= 1 and CheckBuff(player, 624012) then			-- �T�w���Ųy�٨S�o�ʹL�A���⦳���ʧޯ�return true
		return true
	else
		return false
	end
end

function LuaS_love_music_dog_catch_note(score)									-- ���Ų��X�����I��k�N���o���ĪG�A�ä��i�o��
	DebugMsg(OwnerID(), 0, "LuaS_love_music_dog_catch_note()")
	local player = TargetID()
	local note = OwnerID()
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)

	if score == 0 then											-- �p�Gscore = 0�N��w�t�A�Wfalling�ʧ@
		PlayMotion(player, ruFUSION_ACTORSTATE_FALLING)
		return
	end

	local is_single = true
	if ReadRoleValue(npc, EM_RoleValue_Register2) ~= 0 and ReadRoleValue(npc, EM_RoleValue_Register3) ~= 0 then
		if CheckBuff(ReadRoleValue(npc, EM_RoleValue_Register2), 624012) and CheckBuff(ReadRoleValue(npc, EM_RoleValue_Register3), 624012) then
			is_single = false
		end
	end

	for index = 1, 2 do											-- Ū��npc�W�����W���aguid
		local player_guid = ReadRoleValue(npc, EM_RoleValue_Register + index)
		if player_guid ~= 0 then									-- �p�G���O0 (�N�����a���W)
			AddBuff(player_guid, 500984, score - 1, 86400)					-- �Ҧ����a�[��
			if is_single then
				if score == 1 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_08]", C_SYSTEM) end
				if score == 2 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_09]", C_SYSTEM) end
				if score == 3 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_10]", C_SYSTEM) end
				if score == 5 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_12]", C_SYSTEM) end
			else
				if score == 1 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_14]", C_SYSTEM) end
				if score == 2 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_15]", C_SYSTEM) end
				if score == 3 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_16]", C_SYSTEM) end
				if score == 5 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_17]", C_SYSTEM) end
			end
			if score == 0 then ScriptMessage(npc, player_guid, 1, "[SC_2013MUSIC_121868_11]", C_SYSTEM) end
		end
		PlayMotion(player, ruFUSION_ACTORSTATE_THROW)
		AddBuff(player_guid,501118, -1, -1)							-- �o���S��
	end

	DelObj(note)												-- �o�ʦ��\��R��

	WriteRoleValue(note, EM_RoleValue_Register1, 1)								-- ���\�I��O��
end

function LuaS_love_music_dog_create_music_step()								-- �M���Ͳ��զ⭵�����禡�C�Ө禡���|����A�Цb�t�m��move flag��b�C��������/gm ? runplot LuaS_love_music_dog_create_music_step
	music_step_id = 115560

	flag = 781262

	local result = {}													-- �s�񲣥X���զ⭵����guid

	for index = 0, GetMoveFlagCount(flag) -1 , 1 do									-- ���o���ʥ�moveflag�U��id
		local _obj = create_object(										-- �سy�զ⭵�� create_object( OrgID, x, y, z, direction, { mode_type, boolean } )
			music_step_id,
			GetMoveFlagValue(flag, index, EM_RoleValue_X),
			GetMoveFlagValue(flag, index, EM_RoleValue_Y) + 30,						-- ���F�������a�B�ҥH�W�[����
			GetMoveFlagValue(flag, index, EM_RoleValue_Z),
			GetMoveFlagValue(flag, index, EM_RoleValue_Dir),
			{EM_SetModeType_Obstruct, true,								-- �}�ҸI��
			 EM_SetModeType_Gravity, false}								-- �������O
		)
		table.insert(result, _obj)											-- �N���Ͳ����զ⭵����Jresult
	end

	return result													-- ��^result
end


function LuaS_love_music_dog_create_music_note(level_mode, flag)							-- �M���Ͳ����Ųy���禡

	local result = {}													-- �s�񲣥X�����Ųy��guid

	local _delay = level_mode["delay"][RandRange(1, #level_mode["delay"])]						-- �C�����X���Ųy�����j�ɶ�

	local _amount = level_mode["amount"][RandRange(1, #level_mode["amount"])]					-- �C�����X���Ųy���ƶq

	local angle = GetMoveFlagValue(flag, 0, EM_RoleValue_Dir) / 180 * math.pi + math.pi / 2

	for times = 1, _amount do											-- �Ͳ����Ųy
		local _music_note_id = level_mode["music_note_id"][RandRange(1, #level_mode["music_note_id"])]		-- �n���X�����ŲyOrgID
		local _index = RandRange(1, GetMoveFlagCount(flag)) - 1							-- �n���X�����Ųy�Ҧb��moveflag��id
		local _obj = create_object(										-- �سy���Ųy create_object( OrgID, x, y, z, direction, { mode_type, boolean } )
			_music_note_id,
			GetMoveFlagValue(flag, _index, EM_RoleValue_X) + math.sin(angle) * 50,
			GetMoveFlagValue(flag, _index, EM_RoleValue_Y) + 35,						-- �ھ�move flag�ץ�����
			GetMoveFlagValue(flag, _index, EM_RoleValue_Z) + math.cos(angle) * 50,						-- �ھ�move flag�ץ��Z��
			GetMoveFlagValue(flag, _index, EM_RoleValue_Dir),
			{EM_SetModeType_Gravity, false}								-- �������Ųy�����O
		)
		local move_time = Move(										-- �����Ųy�����a����
			_obj,
			GetMoveFlagValue(flag, _index, EM_RoleValue_X) - math.sin(angle) * 20,
			GetMoveFlagValue(flag, _index, EM_RoleValue_Y) + 35,
			GetMoveFlagValue(flag, _index, EM_RoleValue_Z) - math.cos(angle) * 20
		)
		MoveToFlagEnabled(_obj, false)										-- �������ޡA�קK���Ųy���^�]

		local speed_buff = level_mode["speed_buff"][RandRange(1, #level_mode["speed_buff"])]			-- �H����ܤ@�إ[�t�t��
		WriteRoleValue(_obj, EM_RoleValue_Register1, GetMoveFlagValue(flag, _index, EM_RoleValue_X) - math.sin(angle) * 20)	-- �O���ؼ�X��
		AddBuff(_obj, speed_buff, 0, 3600)									-- �[�tbuff�A�S�����ܫD�ܺC�A���ƫ���������

		table.insert(result, _obj)											-- ���貣�X�����Ųyguid��Jresult
		Sleep(6)												-- ���j0.6���X�U�@��
	end

	Sleep(_delay)													-- �U�@�i���Ųy���X�e�����j�ɶ�

	return result													-- ��^result
end

function LuaS_love_music_dog_clean_music_note(music_note, flag)							-- �M���S�Ϊ����Ųy
	for i, v in pairs(music_note) do											-- �ˬd�Ҧ����Ųy
		if CheckID(v) then
			if ReadRoleValue(v, EM_RoleValue_Register1) == ReadRoleValue(v, EM_RoleValue_X) then	-- �p�G�ؼ�X�ȴN�屼
				DelObj(v)
				table.remove(music_note, i)
			end
		else
				table.remove(music_note, i)
		end
	end
end

--==================================
--		�H�U�A�R�ָ`����(3/27������X�[�J)
--==================================
function Lua_jiyi_Npc_121868_04() --�������y�@��
	local Player = OwnerID() 
	local Npc = TargetID()
	local MusicBuff = { 500984 , 500985 } --�R�֭��� , �u�y�����A
	local MusicFlag = 547578 --��L���y
	local BuffLv =  FN_CountBuffLevel( Player , MusicBuff[1] ) --�ˬd���a���WBUFF
	local reward = { 204457 , 724509 } --���СB�����Ĥ�
	local String = "[SC_2013MUSIC_121868_07]" --�P�°ѻP�������ʡA�z�b�������ʤ���o

	String = String..(BuffLv+1).."[SC_2013MUSIC_121868_13]"
	if BuffLv <= 0 then --BuffLv���1
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --�P�°ѻP�������ʡA�z�b�������ʤ���o�����Ĥ�
		GiveBodyItem( Player , reward[2] , 1 ) --���@���Ĥ�
	elseif BuffLv >= 1 and BuffLv < 39 then --BuffLv2~39
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --�P�°ѻP�������ʡA�z�b�������ʤ���o����
		GiveBodyItem( Player , reward[1] , 1 ) --���@�i����
	elseif BuffLv >= 39 and BuffLv < 69 then --BuffLv40~69
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --�P�°ѻP�������ʡA�z�b�������ʤ���o����
		GiveBodyItem( Player , reward[1] , 3 ) --��3�i����
	elseif BuffLv >= 69 and BuffLv < 79 then --BuffLv70~79
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --�P�°ѻP�������ʡA�z�b�������ʤ���o����
		GiveBodyItem( Player , reward[1] , 5 ) --��5�i����
	elseif BuffLv >= 79 then --BuffLv���>=80
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --�P�°ѻP�������ʡA�z�b�������ʤ���o����
		GiveBodyItem( Player , reward[1] , 5 ) --��5�i����
		GiveBodyItem( Player , reward[2] , 1 ) --���@���Ĥ�			
	end	
	CancelBuff( Player , MusicBuff[1] )
	CancelBuff( Player , MusicBuff[2] )	
	SetFlag( Player , MusicFlag , 1 ) -- �w�g����L���y�X��
	DesignLog( Player , 1218681 , " 2013Music game is over " )	--�O�������H��
	Lua_Festival_05_All(Player) 	--���Լ�
end
------------------------------------------------------------------------------------------���ի��O
function Lua_jiyi_2013Music_test_01(lv) --���դ���
	local Player = OwnerID()
	local BuffLv =  FN_CountBuffLevel( Player , 500984 ) --�ˬd���a���WBUFF
	AddBuff( Player , 500984 , lv , 60 )
end	
