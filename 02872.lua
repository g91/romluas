--------------------------------------------------------------------------
--	2013 �����` ����ʤO �����ƪ�
--
--	Global_2013_TwistPower	�C���L�{�ϥ�
--	Global_2013_TwistPower_Setting	�C���]�w�ϥ�
--------------------------------------------------------------------------
function Lua_twist_power_setting()
	Global_2013_TwistPower_Setting = {}

	--	�C���Ұʰ϶�(�p��)
	Global_2013_TwistPower_Setting.game_start_hour = {2, 6, 10, 14, 18, 22}

	--	�C���}����W�ɶ�(>=)(��)
	Global_2013_TwistPower_Setting.register_start_time = 10

	--	�C���������W�ɶ�(<=)(��)
	Global_2013_TwistPower_Setting.register_stop_time = 19

	--	�C���Ұʮɶ�(==)(��)
	Global_2013_TwistPower_Setting.game_start_time = 20

	--	�C���}����W�����\��(npc���J�۰ʱҰ�)
	Global_2013_TwistPower_Setting.is_reminder_active = false

	--	���ʨϥκX�m�s��
	Global_2013_TwistPower_Setting.flag = 781082

	Global_2013_TwistPower_Setting.sensitivity = 30

	-- �j�驵����
	Global_2013_TwistPower_Setting.delay = 0.5

	-- ��q�y������
	Global_2013_TwistPower_Setting.out_flow_delay = 6

	-- �����qpower�v�T��q�y�����Z
	Global_2013_TwistPower_Setting.out_flow_gap = 10

	--	debug�T���}��
	Global_2013_TwistPower_Setting.debug = true
end

--------------------------------------------------------------------------
--	2013 �����` ����ʤO ���ի��O
--------------------------------------------------------------------------
-- 	[�������W�ñҰʹC���{��]
--	�й�P�@��npc�ϥ�
--	/GM ? zone 2 0 2125.3 67.4 1924
--	/gm ? pcall GM_twist_power_join_game(%t_id)
function GM_twist_power_join_game(npc)

	-- �������w�@��npc�@�����Unpc
	if not npc then
		DebugMsg(0, 0, "[ERROR] please select one npc, and the others must select the same one.")
		return
	end

	get_multiplayer(
		-- npc
		npc,
		-- ���a
		OwnerID(),
		-- ���W�H�ƤW��
		10,
		-- ���W�ɶ�(��)
		20,
		{-- ���W���\
		 success = "Lua_twist_power_join_success",
		 -- ���W�B��
		 fully_booked = "Lua_twist_power_join_fully_booked",
		 -- ���Ƴ��W
		 has_regist = "Lua_twist_power_join_has_regist",
		 -- ���W�I��
		 complete = "Lua_twist_power_join_complete",
		-- timer�ƥ�debug��
		timer = "Lua_twist_power_join_timer"},
		-- �}��debugmsg
		true
	)
end

-- �M���C��
-- �p�G�C���X�{bug���_�A�y������C������ҰʡA�Х��M���C��
function GM_twist_power_initialize()
	Global_2013_TwistPower = nil
	Lua_twist_power_setting()
end

--	��ʶ}�ҧ���ʤO�C�p�ɪ����W�����\��
--	�й���Wnpc�ϥ�
--	/gm ? pcall GM_twist_power_open_reminder(%t_id)
function GM_twist_power_open_reminder(guid)
	if not Global_2013_TwistPower_Setting then
		Lua_twist_power_setting()
	end
	Global_2013_TwistPower_Setting.is_reminder_active = true
	CallPlot(guid, "Lua_twist_power_reminder")
end

--	�����������ʤO�C�p�ɪ����W�\��
function GM_twist_power_close_reminder()
	Global_2013_TwistPower_Setting.is_reminder_active = false
end

--	�ץ����j�k�}����
function GM_twist_power_huge_pattern_higher()
	if not Global_2013_TwistPower.huge_pattern.fix_hight then
		Global_2013_TwistPower.huge_pattern.fix_hight = 0
	end
	Global_2013_TwistPower.huge_pattern:move(Global_2013_TwistPower.huge_pattern.x, Global_2013_TwistPower.huge_pattern.y + 4, Global_2013_TwistPower.huge_pattern.z)
	Global_2013_TwistPower.huge_pattern.fix_hight = Global_2013_TwistPower.huge_pattern.fix_hight + 4
	DebugMsg(0, 0, "[INFO] TwistPower : fix hieght : " .. Global_2013_TwistPower.huge_pattern.fix_hight)
end

--	�ץ����j�k�}����
function GM_twist_power_huge_pattern_lower()
	if not Global_2013_TwistPower.huge_pattern.fix_hight then
		Global_2013_TwistPower.huge_pattern.fix_hight = 0
	end
	Global_2013_TwistPower.huge_pattern:move(Global_2013_TwistPower.huge_pattern.x, Global_2013_TwistPower.huge_pattern.y - 4, Global_2013_TwistPower.huge_pattern.z)
	Global_2013_TwistPower.huge_pattern.fix_hight = Global_2013_TwistPower.huge_pattern.fix_hight - 4
	DebugMsg(0, 0, "[INFO] TwistPower : fix hieght : " .. Global_2013_TwistPower.huge_pattern.fix_hight)
end

--	�ק�C�����GM_twist_power_set_cycle_count(<�ק���>)
--	/gm ? pcall GM_twist_power_set_cycle_count()
function GM_twist_power_set_cycle_count(_number)
	if Global_2013_TwistPower then
		Global_2013_TwistPower.cycle_counter = _number
		for index, player in pairs(Global_2013_TwistPower.players) do
			-- ��ƴ���
			Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_24]" .. Global_2013_TwistPower.cycle_counter .. "[SC_2013TWISTPOWER_121397_19]", 2)
		end
	else
		DebugMsg(0, 0, "[ERROR] game is not exist")
	end
end

--------------------------------------------------------------------------
--	2013 �����` ����ʤO NPC���
--------------------------------------------------------------------------
function Lua_twist_power_npc_speak()

	--------------------------------------------------------------------------
	-- ���Wnpc
	-- �Ĥ@�h���
	--------------------------------------------------------------------------

	if not Global_2013_TwistPower_Setting then
		Lua_twist_power_setting()
	end

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- ���Ѥw�g���L
	if CheckFlag(player.GUID, 548009) then
		-- �A���Ѥw�g����ʤO�A�קK�A����O�L�k�t���A���ѴN���n�n�𮧡A���ѦA�ӧa�C
		npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_01]")
		return
	end

	-- �ثe�O�_�O�C���i�H���W���ɶ�
	for index, hour in pairs(Global_2013_TwistPower_Setting.game_start_hour) do
		if GetSystime(1) == hour and GetSystime(2) >= Global_2013_TwistPower_Setting.register_start_time and GetSystime(2) <=Global_2013_TwistPower_Setting.register_stop_time then

			-- �C������
			npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_03]")

			-- �ڭn����U����ʤO�O�H
			npc:addSpeakOption("[SC_2013TWISTPOWER_121397_04]", "Lua_twist_power_game_explain")

			-- I am man power, ������
			npc:addSpeakOption("[SC_2013TWISTPOWER_121397_33]", "Lua_twist_power_join_game")

			return
		end
	end
	-- �{�b�٤��O����ʤO���ɫJ�A�е���2�I10���B6�I10���B10�I10���B14�I10���B18�I10���B22�I10���A�A��ڳ��W�ѥ[���ʧa�C
	npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_10]")
end

function Lua_twist_power_game_explain()

	--------------------------------------------------------------------------
	-- ���Wnpc
	-- �ĤG�h��ܡG�C������
	--------------------------------------------------------------------------

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- �C�������@
	npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_05]")

	-- �ڭn�����o��q�Ť�M�N�o�Ť�O�H
	npc:addSpeakOption("[SC_2013TWISTPOWER_121397_06]", "Lua_twist_power_game_explain2")
end

function Lua_twist_power_game_explain2()

	--------------------------------------------------------------------------
	-- ���Wnpc
	-- �ĤT�h��ܡG�C������
	--------------------------------------------------------------------------

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- �C�������G
	npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_07]")

	-- �ڽT�w�ڷǳƦn�M�j�a�X�@�A�@�_����ʤO�C
	npc:addSpeakOption("[SC_2013TWISTPOWER_121397_08]", "Lua_twist_power_join_game")
end

function Lua_twist_power_join_game()

	--------------------------------------------------------------------------
	-- ���Wnpc
	-- �ĥ|�h��ܡG���W�C��
	--------------------------------------------------------------------------

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- �p��~�t��ơA�H2013�~1��1��0�I�㬰�з�
	local delta = (GetSystime(0) - 1366819200) % 60

	-- �A���ˬd���W�ɶ�
	if GetSystime(2) >= Global_2013_TwistPower_Setting.register_start_time and GetSystime(2) <=Global_2013_TwistPower_Setting.register_stop_time then
		DebugMsg(player.GUID, 0, "[INFO] TwisterPower : you have sent out the registeration.")

		get_multiplayer(
			-- npc
			npc.GUID,
			-- ���a
			player.GUID,
			-- ���W�H�ƤW��
			100,
			-- ���W�ɶ�(��)
			(Global_2013_TwistPower_Setting.game_start_time - GetSystime(2)) * 60 - delta,
			{-- ���W���\
			 success = "Lua_twist_power_join_success",
			 -- ���W�B��
			 fully_booked = "Lua_twist_power_join_fully_booked",
			 -- ���Ƴ��W
			 has_regist = "Lua_twist_power_join_has_regist",
			 -- ���W�I��
			 complete = "Lua_twist_power_join_complete",
			fail = "Lua_twist_power_join_fail",
			-- timer�ƥ�debug��
			timer = "Lua_twist_power_join_timer"},
			-- �}��debugmsg
			false
		)
	else
		-- ��A���A�A���L���W�ɬq�F�A�ڲ{�b�n���h�Ұʯ�q����A���U�@�ӳ��W�ɬq�A�ӧ�ڳ��W�a�C
		npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_11]")
	end
end

function Lua_twist_power_join_fail(event)

	--------------------------------------------------------------------------
	-- ���W����
	--------------------------------------------------------------------------

	DebugMsg(0, 0, "[INFO] TwisterPower : register system has a unkown error.")
end

function Lua_twist_power_join_success(event)

	--------------------------------------------------------------------------
	-- ���W���\
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)
	local player = AddyPlayer:new(event.player)

	-- �Ĥ@���C����l��
	if not Global_2013_TwistPower then
		Global_2013_TwistPower = {}
		Global_2013_TwistPower.flag = AddyFlagGroup:new(Global_2013_TwistPower_Setting.flag)
		Global_2013_TwistPower.huge_pattern = AddyNpc:new()

		-- �]�w���j�]�k�}
		Global_2013_TwistPower.huge_pattern:create(121108, Global_2013_TwistPower.flag[0].x, Global_2013_TwistPower.flag[0].y + 8, Global_2013_TwistPower.flag[0].z, Global_2013_TwistPower.flag[0].direction)
		Global_2013_TwistPower.huge_pattern.gravity = false
		Global_2013_TwistPower.huge_pattern.patrol = false
		Global_2013_TwistPower.huge_pattern:addToPartition()
	end

	-- �ڭn����ʤObuff
	player:addBuff(624164)

	-- �A�w�g�������W�F�I�аO�o�b���I�e�^�Ӷ��X�I
	npc:scriptMessage(player, "[SC_2013TWISTPOWER_121397_14]", 2)
	CloseSpeak(player.GUID)
end

function Lua_twist_power_join_fully_booked(event)

	--------------------------------------------------------------------------
	-- ���W�B��
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)
	local player = AddyPlayer:new(event.player)

	-- ��p�A�ثe�w�g�B���o�I
	npc:scriptMessage( player , "[SC_2013TWISTPOWER_121397_13]", 2)	--4/23�����ק�
	CloseSpeak(player.GUID)
end

function Lua_twist_power_join_has_regist(event)

	--------------------------------------------------------------------------
	-- ���Ƴ��W
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)
	local player = AddyPlayer:new(event.player)

	-- �A�w�g���W���\�A�е��ݾ��I���ʶ}�l�A�ýT�{���ʶ}�l�ɡA���b���ʽd�򤺡C
	npc:scriptMessage( player , "[SC_2013TWISTPOWER_121397_02]", 2)

	CloseSpeak(player.GUID)
end

function Lua_twist_power_join_timer(event)

	--------------------------------------------------------------------------
	-- ���W�˼ơA�C�����@��
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)

	--DebugMsg(0, 0, "event.waiting_time = " .. event.waiting_time .. ", event.current_time = " .. event.current_time)

	-- ���W�ɶ���2��������
	if event.current_time == 120 then
		-- �A�L�X�����N�n�}�l����ʤO�A���N�@���U�ڪ��_�I�̡A�{�b�йL�Ӹ�ڳ��W�ѥ[���ʡC
		npc:say( "[SC_2013TWISTPOWER_121397_12]" )	--4/23�����ק�AscriptMessage>NPCSAY
	end

	-- ���W�ɶ���30����
	if event.current_time == 30 then
		-- ����ʤO���W�N�n�}�l�F�I�Цb30���i�쬡�ʽd�򤺶��X�I
		npc:scriptMessage(0, "[SC_2013TWISTPOWER_121397_17]", 2)
	end
end

function Lua_twist_power_join_complete(event)

	--------------------------------------------------------------------------
	-- ���W�I��A�ҰʹC��
	--------------------------------------------------------------------------

	-- �}�l�C��
	Lua_twist_power_main(event.players)
end

--------------------------------------------------------------------------
--	2013 �����` ����ʤO �C���D�n�y�{
--------------------------------------------------------------------------
function Lua_twist_power_main(players)

	--------------------------------------------------------------------------
	-- ��l�ƹC������
	--------------------------------------------------------------------------
	Lua_twist_power_class_initialize()

	--------------------------------------------------------------------------
	-- �]�m
	--------------------------------------------------------------------------
	-- ����]�����
	Global_2013_TwistPower.cycle_counter = 0
	-- �}�l�ɶ� ���G��
	Global_2013_TwistPower.start_time = GetSystime(0)
	-- ��q����
	Global_2013_TwistPower.matrix = AddyNpc:new()
	-- �ѻP���a
	Global_2013_TwistPower.players = {}
	-- ��q�˸m(��q����&����N�o)
	Global_2013_TwistPower.source_base = {}
	-- �C�����ʪ��A
	Global_2013_TwistPower.is_active = true
	-- 
	Global_2013_TwistPower.current_time = 0
	-- power source�����p�ƾ�
	Global_2013_TwistPower.source_type_count = {
		booster = 0,
		cooler = 0
	}
	-- �C���}�l�e���ݮɶ�
	local ready_time = 10
	local last_second = GetSystime(0)
	local has_warning = false
	local out_flow_delay = Global_2013_TwistPower_Setting.out_flow_delay
	local out_flow_trigger = true
	local record = {}

	--------------------------------------------------------------------------
	-- ���|
	--------------------------------------------------------------------------
	local twist_power = Global_2013_TwistPower
	local matrix = Global_2013_TwistPower.matrix
	local flag = Global_2013_TwistPower.flag

	--------------------------------------------------------------------------
	-- ��q����
	--------------------------------------------------------------------------
	matrix:create(103890, flag[17].x, flag[17].y, flag[17].z, flag[0].direction)
	-- �i�I��
	matrix.show_role_head = true
	-- ���i�԰�
	matrix.fight = false
	-- ������
	matrix.patrol = false
	matrix:addToPartition()
	SetPlot(matrix.GUID, "collision", "Lua_twist_power_MatrixCollision", 10)

	--------------------------------------------------------------------------
	-- ��q����
	--------------------------------------------------------------------------
	if Global_2013_TwistPower_Setting.crystal then
		Global_2013_TwistPower.crystal = Global_2013_TwistPower_Setting.crystal
		DebugMsg(0, 0, "[TwistPower] <get> Crystal")
	else
		Global_2013_TwistPower.crystal = AddyNpc:new()
		Global_2013_TwistPower.crystal:create(121479, flag[0].x, flag[0].y, flag[0].z, flag[0].direction)
	end

	--------------------------------------------------------------------------
	-- ���a
	--------------------------------------------------------------------------
	for index, player_guid in pairs(players) do
		local player = AddyPlayer:new(player_guid)
		if Global_2013_TwistPower.crystal:distanceTo(player) <= 300 then

			--------------------------------------------------------------------------
			-- ���a�[�J�C���e���]�w
			--------------------------------------------------------------------------
			-- �j��U��
			DW_CancelMount(player.GUID)	--4/23�����[�A�j��U��
			-- �C��buff
			player:addBuff(624165)
			-- ��ܭ˼ƭp�ɾ�
			StartClientCountDown(player.GUID, ready_time, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]")
			--------------------------------------------------------------------------

			-- ��i�C�������a�C��
			table.insert(Global_2013_TwistPower.players, player)
		else
			-- ��p�A�A�ثe�Z�����ʽd��ӻ��A�L�k�ѥ[�������ʡI
			Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_16]", 2)
		end
		-- �M�����Wbuff
		player:cancelBuff(624164)
	end

	--------------------------------------------------------------------------
	-- �ھڪ��a�H�ƨM�w�෽buff����
	--------------------------------------------------------------------------
	if #Global_2013_TwistPower.players > 10 then
		Global_2013_TwistPower.power_buff = 507825
	elseif #Global_2013_TwistPower.players > 5 then
		Global_2013_TwistPower.power_buff = 507824
	else
		Global_2013_TwistPower.power_buff = 623964
	end

	--------------------------------------------------------------------------
	-- ���ͯ෽������1~16
	--------------------------------------------------------------------------
	for index = 1, 16 do
		local _source_base = Class_TwistPowerSourceBase:new()
		_source_base:create(flag[index].x, flag[index].y, flag[index].z)
		_source_base:addToPartition()
		table.insert(Global_2013_TwistPower.source_base, _source_base)
	end

	-- �}�l�e10��˼�
	Sleep(ready_time * 10)

	--------------------------------------------------------------------------
	-- �üƲ��ͥ[�t�෽�ΧN�o��
	--------------------------------------------------------------------------
	local random_table = Lua_twist_power_get_type_by_rate(4, 1)
	for index, source_base in pairs(Global_2013_TwistPower.source_base) do
		-- ���ͯ�q�y
		source_base:produce(random_table[index])
		Sleep(RandRange(1, 2))
	end

	--------------------------------------------------------------------------
	-- �������j�]�k�}
	--------------------------------------------------------------------------
	if Global_2013_TwistPower.huge_pattern then
		Global_2013_TwistPower.huge_pattern:delete()
		Global_2013_TwistPower.huge_pattern = nil
	end

	--------------------------------------------------------------------------
	-- �ʵ��C�����a���p
	--------------------------------------------------------------------------
	Global_2013_TwistPower.crystal:beginPlot("Lua_twist_power_watcher")

	--------------------------------------------------------------------------
	-- �C���D�n�j��
	--------------------------------------------------------------------------
	while Global_2013_TwistPower.is_active do

		--------------------------------------------------------------------------
		-- �έp��e���W��q����
		--------------------------------------------------------------------------
		Global_2013_TwistPower.source_type_count.booster = 0
		Global_2013_TwistPower.source_type_count.cooler = 0
		-- �ˬd�Ҧ���q��y
		for index, source_base in pairs(Global_2013_TwistPower.source_base) do
			if source_base.source then
				if source_base.source.source_type == "booster" then
					Global_2013_TwistPower.source_type_count.booster = Global_2013_TwistPower.source_type_count.booster + 1
				else
					Global_2013_TwistPower.source_type_count.cooler = Global_2013_TwistPower.source_type_count.cooler + 1
				end
			end
		end

		--------------------------------------------------------------------------
		-- ���Q����5��᭫��
		--------------------------------------------------------------------------
		for index, source_base in pairs(Global_2013_TwistPower.source_base) do
			if not source_base.source and GetSystime(0) - source_base.last_time >= 5 then
				--�T�O�Ҧ�������q�̤֦�2�ӡA�_�h�H���Ͳ�
				if Global_2013_TwistPower.source_type_count.booster <= 2 then
					Global_2013_TwistPower.source_type_count.booster = Global_2013_TwistPower.source_type_count.booster + 1
					source_base:produce("booster")
				elseif Global_2013_TwistPower.source_type_count.cooler <= 2 then
					Global_2013_TwistPower.source_type_count.cooler = Global_2013_TwistPower.source_type_count.cooler + 1
					source_base:produce("cooler")
				else
					source_base:produce()
				end
			end
		end

		--------------------------------------------------------------------------
		-- ���骺���ʸ��u 17~36
		--------------------------------------------------------------------------
		if matrix.buff[Global_2013_TwistPower.power_buff] then
			for index = 17, 36 do
				-- �P�_����b���@�ںX�l
				if flag[index]:distanceTo(matrix) < Global_2013_TwistPower_Setting.sensitivity then
					-- �b�̫�@��
					if index == 36 and not Global_2013_TwistPower.cycle_check and matrix.move_target_flag == 36 then
						-- �e���Ĥ@��
						matrix.move_target_flag = 17
						-- ���}�[��ƶ}��
						Global_2013_TwistPower.cycle_check = true
					-- �p�G�b��17��ӥB�[��ƶ}�����}
					elseif index == 17 and Global_2013_TwistPower.cycle_check then
						matrix.move_target_flag = index + 1
						-- �[���
						Global_2013_TwistPower.cycle_counter = Global_2013_TwistPower.cycle_counter + 1
						table.insert(record, {Global_2013_TwistPower.cycle_counter, Global_2013_TwistPower.current_time})
						Global_2013_TwistPower.cycle_check = false
						matrix:systemCastSpell(Global_2013_TwistPower.crystal, 495513)
						for index, player in pairs(Global_2013_TwistPower.players) do
							-- ��ƴ���
							Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_24]" .. Global_2013_TwistPower.cycle_counter .. "[SC_2013TWISTPOWER_121397_19]", 2, C_SYSTEM)	--4/24�����[
						end
					elseif index == 36 then
						matrix.move_target_flag = 17
					else
						-- �e���U�@��
						matrix.move_target_flag = index + 1
					end
				end
			end
		else
			-- �S����q���|��
			matrix.move_target_flag = nil
		end

		--------------------------------------------------------------------------
		-- ���ؼдN����
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.flag and matrix.move_target_flag and
		   Global_2013_TwistPower.flag[matrix.move_target_flag] then
			matrix:move(
				Global_2013_TwistPower.flag[matrix.move_target_flag].x, 
				Global_2013_TwistPower.flag[matrix.move_target_flag].y, 
				Global_2013_TwistPower.flag[matrix.move_target_flag].z, 
				0
			)
--			DebugMsg(0, 0, "[INFO] TwistPower : matrix move to : " .. matrix.move_target_flag)
			-- ���s�p�Ⲿ��
			ReCalculate(matrix.GUID)
		end

		if GetSystime(0) ~= last_second then
			last_second = GetSystime(0)
			out_flow_trigger = true
			Global_2013_TwistPower.current_time = GetSystime(0) - Global_2013_TwistPower.start_time
			DebugMsg(0, 0, "Global_2013_TwistPower.current_time = " .. Global_2013_TwistPower.current_time)
		else
			out_flow_trigger = false
		end
		--------------------------------------------------------------------------
		-- ���@�h��q�A�C���ɶ��V���նV��
		--------------------------------------------------------------------------
		if matrix.buff[Global_2013_TwistPower.power_buff] then
			out_flow_delay = Global_2013_TwistPower_Setting.out_flow_delay - math.floor(matrix.buff[Global_2013_TwistPower.power_buff].power / Global_2013_TwistPower_Setting.out_flow_gap)
		else
			out_flow_delay = Global_2013_TwistPower_Setting.out_flow_delay
		end

		if out_flow_delay <= 0 then out_flow_delay = 1 end
		if Global_2013_TwistPower.cycle_counter > 0 then
			if Global_2013_TwistPower.current_time % out_flow_delay == 0 and out_flow_trigger then
				if matrix.buff[Global_2013_TwistPower.power_buff] then
					if matrix.buff[Global_2013_TwistPower.power_buff].power > 0 then
						local lv = matrix.buff[Global_2013_TwistPower.power_buff].power - 1
						matrix:cancelBuff(Global_2013_TwistPower.power_buff)
						matrix:addBuff(Global_2013_TwistPower.power_buff, lv)
					else
						matrix:cancelBuff(Global_2013_TwistPower.power_buff)
					end
					DebugMsg(0, 0, "power flow out")
				end
			end
		end

		--------------------------------------------------------------------------
		-- �̫�30��}�l�C10����
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.current_time >= 150 and Global_2013_TwistPower.current_time ~= 180 and Global_2013_TwistPower.current_time % 10 == 0 then
			for index, player in pairs(Global_2013_TwistPower.players) do
				Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_23]" .. (180 - Global_2013_TwistPower.current_time) .. "[SC_2013TWISTPOWER_121397_29]", 2, C_SYSTEM)
			end
		end

		--------------------------------------------------------------------------
		-- 180��ᵲ���C��
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.current_time >= 180 then
			Global_2013_TwistPower.is_active = false
		end

		--------------------------------------------------------------------------
		-- ����
		--------------------------------------------------------------------------
		Sleep(Global_2013_TwistPower_Setting.delay * 10)
	end

	--------------------------------------------------------------------------
	-- �������y
	--------------------------------------------------------------------------
--	DebugMsg(0, 0, "Global_2013_TwistPower.cycle_counter = " .. Global_2013_TwistPower.cycle_counter)
	-- �Ҧ��ѥ[���a�o���~
	for index, player in pairs(Global_2013_TwistPower.players) do
		Lua_twist_power_reward(player)
		player:cancelBuff(624165)
		player:cancelBuff(501308)
		player:cancelBuff(501309)
	end

	--------------------------------------------------------------------------
	-- �M������
	--------------------------------------------------------------------------
	-- �M������
	matrix:delete()
--	DebugMsg(0, 0, "[INFO] TwisterPower : remove object matrix.")
	-- �M����y
	for index, source_base in pairs(Global_2013_TwistPower.source_base) do
		source_base:delete()
	end
--	DebugMsg(0, 0, "[INFO] TwisterPower : remove object source base.")

	DebugMsg(0, 0, "[TwistPower] report")
	for i, t in pairs(record) do
		if i > 1 then
			local tt = t[2] - record[i - 1][2]
			DebugMsg(0, 0, "   " .. t[1] .. "\t, time : " .. tt .. "\t, total time : " .. t[2] .. " seconds")
		else
			DebugMsg(0, 0, "   " .. t[1] .. "\t, time : " .. t[2] .. "\t, total time : " .. t[2] .. " seconds")
		end
	end

	Sleep(30)
	--------------------------------------------------------------------------
	-- �M���C��
	--------------------------------------------------------------------------
	Global_2013_TwistPower = nil
	DebugMsg(0, 0, "[INFO] TwisterPower : totally remove twist power game.")
end

function Lua_twist_power_get_type_by_rate(booster_rate, cooler_rate)
	local result = {}
	for index = 1, math.ceil(#Global_2013_TwistPower.source_base / (booster_rate + cooler_rate)) do
		for index = 1, booster_rate do
			table.insert(result, "booster")
		end
		for index = 1, cooler_rate do
			table.insert(result, "cooler")
		end
	end
	return get_random_table(result, #Global_2013_TwistPower.source_base)
end

function Lua_twist_power_watcher()

	--------------------------------------------------------------------------
	-- �C���ʱ��G���a����A�������
	--------------------------------------------------------------------------

	--------------------------------------------------------------------------
	-- 
	--------------------------------------------------------------------------
	local random_table
	while Global_2013_TwistPower.is_active do
		for index, player in pairs(Global_2013_TwistPower.players) do

			--------------------------------------------------------------------------
			-- �C20���q�y�~�P
			--------------------------------------------------------------------------
			if Global_2013_TwistPower.current_time % 20 == 0 then
				random_table = Lua_twist_power_get_type_by_rate(4, 1)
				-- ����table
				random_table = get_random_table(random_table, #random_table)
				for index, source_base in pairs(Global_2013_TwistPower.source_base) do
					-- ���ͯ�q�y
					source_base:produce(random_table[index])
					Sleep(RandRange(1, 2))
				end
				DebugMsg(0, 0, "random power")
			end

			--------------------------------------------------------------------------
			-- �Z���ӻ�
			--------------------------------------------------------------------------
			if Global_2013_TwistPower.crystal:distanceTo(player) >= 250 and Global_2013_TwistPower.crystal:distanceTo(player) < 300 then
				Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_22]", 2 , C_SYSTEM )	--�Y�N�W�L���ʽd��A�Ц^�쬡�ʽd�򤺶i�次�ʡC
			elseif Global_2013_TwistPower.crystal:distanceTo(player) >= 300 then
				Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_20]", 2  , C_SYSTEM )	--�Z�����ʽd��ӻ��A�����X�ʥ�����C
				player:cancelBuff(624165)
			end

			--------------------------------------------------------------------------
			-- �S���C��buff
			--------------------------------------------------------------------------
			if not player.buff[624165] then
				--�����X�ʸ������A�L�k�A�i�次�ʡC
				Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_21]", 1)
				-- ���¨�U��������ʤO���ʡA��q����ثe��F
				Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_30]", 2 , C_SYSTEM )
				-- ������e���y
				Lua_twist_power_reward(player)
				table.remove(Global_2013_TwistPower.players, index)
			end

			--------------------------------------------------------------------------
			-- �_�u
			--------------------------------------------------------------------------
			if not CheckID(player.GUID) then
				table.remove(Global_2013_TwistPower.players, index)
			end
		end

		--------------------------------------------------------------------------
		-- �C���H�ƧC��0�H�����C��
		--------------------------------------------------------------------------
		if #Global_2013_TwistPower.players <= 0 then
			Global_2013_TwistPower.is_active = false
		end

		--------------------------------------------------------------------------
		-- ����[�tbuff�ˬd
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff] and Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff].power >= 99 then
			-- DebugMsg(0, 0, "Explode!!")
			-- power�F��100�I���z��
			Global_2013_TwistPower.matrix:castSpell(Global_2013_TwistPower.matrix, 850618)
			-- �l���Ҧ���q
			Global_2013_TwistPower.matrix:cancelBuff(Global_2013_TwistPower.power_buff)
			Global_2013_TwistPower.matrix:cancelBuff(623965)
		elseif Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff] and Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff].power > 89 and not Global_2013_TwistPower.matrix.buff[623965] then
			-- DebugMsg(0, 0, "broken")
			-- power�W�L90�W�l�abuff
			Global_2013_TwistPower.matrix:addBuff(623965)
			for index, player in pairs(Global_2013_TwistPower.players) do
				-- ���z������
				Global_2013_TwistPower.matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_34]", 1)
			end
		elseif Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff] and Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff].power <= 89 and Global_2013_TwistPower.matrix.buff[623965] then
			Global_2013_TwistPower.matrix:cancelBuff(623965)
		end

		Sleep(Global_2013_TwistPower_Setting.delay * 10)
	end
end

function Lua_twist_power_reward(player)

	--------------------------------------------------------------------------
	-- ���a���y
	--------------------------------------------------------------------------

	-- ���ܦr��
	Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_18]"..Global_2013_TwistPower.cycle_counter.."[SC_2013TWISTPOWER_121397_19]" , 2 , C_SYSTEM )	--4/23�����ק�A�ץ��r�ꤺ�e

	--------------------------------------------------------------------------
	-- ������10��H�W
	--------------------------------------------------------------------------
	if Global_2013_TwistPower.cycle_counter >= 9 then
		GiveBodyItem( player.GUID, 240060, 3 )
		GiveBodyItem( player.GUID, 724509, 1 )

	--------------------------------------------------------------------------
	-- ������10��H�W
	--------------------------------------------------------------------------
--	elseif Global_2013_TwistPower.cycle_counter >= 7 then
--		GiveBodyItem( player.GUID, 240060, 3 )

	--------------------------------------------------------------------------
	-- ������7��H�W
	--------------------------------------------------------------------------
	elseif Global_2013_TwistPower.cycle_counter >= 7 then
		GiveBodyItem( player.GUID, 240060, 2 )

	--------------------------------------------------------------------------
	-- ������4��H�W
	--------------------------------------------------------------------------
	elseif Global_2013_TwistPower.cycle_counter >= 1 then
		GiveBodyItem( player.GUID, 240060, 1 )

	--------------------------------------------------------------------------
	-- ��L���p
	--------------------------------------------------------------------------
	else
		GiveBodyItem( player.GUID, 724509, 1 )
	end

	--------------------------------------------------------------------------
	-- �w�g����L���y�X��
	--------------------------------------------------------------------------
	SetFlag(player.GUID, 548009 , 1 )

	--------------------------------------------------------------------------
	-- �O�������H��
	--------------------------------------------------------------------------
	DesignLog(player.GUID, 103890, " 2013TwistPower game is over ")

	--------------------------------------------------------------------------
	-- ���Լ�
	--------------------------------------------------------------------------
	Lua_Festival_06_All(player.GUID)
end

function Lua_twist_power_MatrixCollision()

	--------------------------------------------------------------------------
	-- ����I���@���A�I����⪱�a���W����q�ǵ�����
	--------------------------------------------------------------------------

	--------------------------------------------------------------------------
	-- �ˬd�C��
	--------------------------------------------------------------------------
	if not Global_2013_TwistPower then
--		DebugMsg(0, 0, "[ERROR] TwisterPower : game is not exist.")
		return
	end

	--------------------------------------------------------------------------
	-- �ˬd���a
	--------------------------------------------------------------------------
	local player = AddyPlayer:new(OwnerID())
	if not player.buff[501308] and not player.buff[501309] then
		-- ���W�S����q
--		DebugMsg(player.GUID, 0, "[INFO] TwistPower : you don't have any power source.")
		return
	end
	--------------------------------------------------------------------------

	local matrix = Global_2013_TwistPower.matrix

	--------------------------------------------------------------------------
	-- �X�ʯ�q
	--------------------------------------------------------------------------
	if player.buff[501308] then
--		DebugMsg(player.GUID, 0, "[INFO] TwistPower : matrix get positive power source.")
		-- ����ʥF��q
		if matrix.buff[508392] then
			local level
			if matrix.buff[508392] then
				level = matrix.buff[508392].power - player.buff[501308].power
				matrix:cancelBuff(508392)
			else
				level = -player.buff[501308].power
			end
			if level > 0 then
				matrix:addBuff(508392, level - 1)
			elseif level < 0 then
				matrix:addBuff(Global_2013_TwistPower.power_buff, math.abs(level) - 1)
			end
		else
			-- ����W�[�X�ʯ�q
			matrix:addBuff(Global_2013_TwistPower.power_buff, player.buff[501308].power)
		end
	end

	--------------------------------------------------------------------------
	-- �N�o��q
	--------------------------------------------------------------------------
	if player.buff[501309] then
--		DebugMsg(player.GUID, 0, "[INFO] TwistPower : matrix get negative power source.")
		-- ����ʥF��q
		if matrix.buff[508392] then
			matrix:addBuff(508392, player.buff[501309].power)
--			matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_27]", 2, C_SYSTEM)
		else
			-- ���C����buff
			local level
			if matrix.buff[Global_2013_TwistPower.power_buff] then
				level = matrix.buff[Global_2013_TwistPower.power_buff].power - player.buff[501309].power
				matrix:cancelBuff(Global_2013_TwistPower.power_buff)
			else
				level = -player.buff[501309].power
			end
			if level > 0 then
				matrix:addBuff(Global_2013_TwistPower.power_buff, math.abs(level) - 1)
			elseif level < 0 then
				matrix:addBuff(508392, math.abs(level) - 1)
			end
		end
	end

	if matrix.buff[Global_2013_TwistPower.power_buff] then
		for index, player in pairs(Global_2013_TwistPower.players) do
			-- ���ܥ���ثe��q
			matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_35]" .. matrix.buff[Global_2013_TwistPower.power_buff].power + 1 .. "[SC_2013TWISTPOWER_121397_25]", 2)	--4/24�����[
		end
	else
		for index, player in pairs(Global_2013_TwistPower.players) do
			matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_27]", 2, C_SYSTEM)	--4/24�����[
		end
	end

	if player.buff[501308] then
		player:cancelBuff(501308)
		matrix:addBuff(501568, 0, 1)
	end
	if player.buff[501309] then
		player:cancelBuff(501309)
		matrix:addBuff(501569, 0, 1)
	end
	ReCalculate(matrix.GUID)
end

--------------------------------------------------------------------------
--	2013 �����` ����ʤO �C���}����W����
--------------------------------------------------------------------------
function Lua_twist_power_reminder()
	--------------------------------------------------------------------------
	-- initialize setting
	--------------------------------------------------------------------------
	if not Global_2013_TwistPower_Setting then
		Lua_twist_power_setting()
	end
	--------------------------------------------------------------------------
	-- reminder�w�g�Ұʪ�^
	--------------------------------------------------------------------------
	if Global_2013_TwistPower_Setting.is_reminder_active then
		return
	end

	--------------------------------------------------------------------------
	-- �Ұ�reminder
	--------------------------------------------------------------------------
	Global_2013_TwistPower_Setting.is_reminder_active = true

	local npc = AddyNpc:new(OwnerID())
	local _hour
	local _minute
	local _second
	local _delay
	local _next_hour
	--
	while Global_2013_TwistPower_Setting.is_reminder_active do
		--------------------------------------------------------------------------
		--	�C�p��50���o��
		--------------------------------------------------------------------------
		_hour = GetSystime(1)
		_minute = GetSystime(2)
		_second = GetSystime(0) % 60

		--------------------------------------------------------------------------
		-- �M��U�@�����ɶ�
		--------------------------------------------------------------------------
		for index, hour in pairs(Global_2013_TwistPower_Setting.game_start_hour) do
			-- �o�p�ɨS������
			if hour > _hour then
				_next_hour = hour
				break
			-- �o�p�ɦ�����
			elseif hour == _hour then
				-- �O�_�w�g���L����?
				if _minute < Global_2013_TwistPower_Setting.register_start_time then
					-- �p�G��n�b�C���϶��B�C���٨S�}�l
					_delay = ((Global_2013_TwistPower_Setting.register_start_time - _minute)*60) - _second
					break
				end
				-- �b�����ɶ������ܰT��
				if math.abs(_minute - Global_2013_TwistPower_Setting.register_start_time) <= 1 then
					npc:say("[SC_2013TWISTPOWER_121397_12]")
				end
			end
		end

		-- �p�G�o�p�ɨS�������A�p���U�������ɶ�
		if _next_hour then
			_delay = ((_next_hour - _hour)*3600) - ((_minute - Global_2013_TwistPower_Setting.register_start_time)*60) - _second
		else
			_next_hour = _hour
		end

		DebugMsg(0, 0, "next register start time : " .. _next_hour .. ":" .. Global_2013_TwistPower_Setting.register_start_time .. ", delay seconds : " .. _delay)
		DebugMsg(0, 0, "delay translate : " .. math.floor(_delay/3600) .. ":" .. math.floor(_delay/60)%60 .. ":" .. _delay%60)
		
		--DebugMsg(0, 0, "next time : " .. _delay)

		Sleep(_delay * 10)
	end
end