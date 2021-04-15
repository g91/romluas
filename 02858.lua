-- /// --------------------------------------------------------------------------------
-- /// get_multiplayer�|�P�_��e���p : �ݩR���B���W�}�l�B�˼Ƥ��B���W�I��A�æb���a�����get_multiplayer�ɧP�_�O�_�}�l�˼ơC
-- /// ���a�����get_multiplayer�ɡA�|���Q�O���bregister��EM_RoleValue_Register3~10�A����A�v�@����"���ĳ��W"���C
-- /// �b����"���ĳ��W"��椧�e�|�ˬd�O�_�W�L�H�ơC�o�O���F�קK�h�H�P�ɳ��W�y�����~�C���i��|���P�ɳ��W���ƤH�u���@�W���W���\�C
-- /// 
-- /// �ҿת�"���ĳ��W"�O�b���\���W��|��obuff�A�򥻪k�N624158�A�ĪG��������W�I���5��C
-- /// ���a���W�I��e�ݦb���W�d�򤺨ë�����buff�N�i�H����"���İѥ["���a�C
-- /// --------------------------------------------------------------------------------
-- get_multiplayer(register, player, range, maximum_player, waiting_time, event_callback, debug)
-- /// arguments
-- /// register : number			�O���Ϊ���A�|�bregister��RoleValue�O����ơAEM_RoleValue_Register1�O����e���W�H�ơAEM_RoleValue_Register2�O����e�˼Ʈɶ��AEM_RoleValue_Register3~10�w�Ħh�H���W
-- /// player : number			��e�n���W�����a
-- /// maximum_player : number	���W�H�ƤW��
-- /// waiting_time : number		���W�ɶ��A���O��
-- /// event_callback : table		�w�q�U�Өƥ�n���檺�禡
-- /// debug : boolean			�O�_�}��debug
-- /// --------------------------------------------------------------------------------
-- /// get_multiplayer��event
-- /// success				���a���W���\Ĳ�o
-- /// fail				���a���W����Ĳ�o
-- /// has_regist			���a���Ƴ��WĲ�o
-- /// fully_booked			���W�W�B�w��Ĳ�o
-- /// complete				���W�I���Ĳ�o
-- /// timer				���W�I��e�C��Ĳ�o�@��
-- /// --------------------------------------------------------------------------------
-- /// event.register : number		Ĳ�o�Өƥ�register
-- /// event.player : number		Ĳ�o�Өƥ󪺪��a
-- /// event.current_time : number	Ĳ�o�Өƥ�ɪ��˼Ʈɶ�
-- /// event.waiting_time : number	��timer�ƥ�s�b�AĲ�o�Өƥ�waiting_time
-- /// event.players : table		��complete�ƥ�s�b�A�Ҧ�"���İѻP"���a��guid�}�C
-- /// --------------------------------------------------------------------------------
-- function Lua_npc_talk()
-- 	AddSpeakOption(npc, player, "I want play game!", "Lua_sign_up", 0)
-- end
-- 
-- function Lua_sign_up()
-- 	get_multiplayer(
-- 		npc,								-- �]���W�禡������guid
-- 		player,								-- ���W���a��guid
-- 		5,								-- ���W�H�ƤW��
-- 		20,								-- ���ݮɶ�
-- 		{success = "Lua_when_sign_up_success",			-- ���W���\�����禡�W��
--		 complete = "Lua_when_sign_up_complete",			-- ���W���������禡�W��
-- 		 timer = "Lua_timer"},						-- ���W�����e�C�����@���禡�W��
-- 		true								-- �}��DebugMsg�T��
-- 	)
-- end
-- 
-- function Lua_when_sign_up_success(event)
--	Say(event.register, "welcome to funny game! " .. event.player)
--end
--
--function Lua_when_sign_up_complete(event)
--	local player_list = event.players
-- 	Say(event.register, "hi~ " .. player_list[1] .. ", you are the first one.")
--end
--
--function Lua_timer(event)
--	Say(event.register, "The remaining " .. event.current_time .. "seconds!")
--end
--

function get_multiplayer(register, player, maximum_player, waiting_time, event_callback, debug)	-- main
	local get_multiplayer = {	-- ���W�t��
		-- ���W����guid
		register = register,
		-- ��e������W�t�Ϊ��aguid
		player = player,
		-- ���W�H�ƤW��
		maximum_player = maximum_player,
		-- ���W�`�ɶ�
		waiting_time = waiting_time,
		-- ���ݮɶ��C��Ĳ�o�禡�W��
		waiting_callback = event_callback.timer,
		-- ���W���\Ĳ�o�禡�W��
		success_callback = event_callback.success,
		-- ���W����Ĳ�o�禡�W��
		fail_callback = event_callback.fail,
		-- ���Ƴ��WĲ�o�禡�W��
		repeat_callback = event_callback.has_regist,
		-- ���W�H�Ƥw��Ĳ�o�禡�W��
		fully_booked_callback = event_callback.fully_booked,
		-- �������W��Ĳ�o�禡�W��
		complete_callback = event_callback.complete,
		-- �O����e�ɶ�
		current_time = ReadRoleValue(register, EM_RoleValue_Register2),
		-- �O�_�}��debugmsg
		debug = debug or false
	}

	-- ���Ƴ��W
	if CheckBuff(player, 624158) then
		-- Ĳ�ohas_regist�ƥ�
		get_multiplayer_event(get_multiplayer, "has_regist")
		return
	end

	-- �j��register3~10�Ȧs�ܼƬO�_���ŭȡA�Ȧs���aguid
	for index = 2, 8 do
		-- ���W�e���N���aguid�O���bnpc���W�A�A�̧ǵn�O���W�A�קK���a�P�ɳ��W
		if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register + index) == 0 then
			WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register + index, get_multiplayer.player)
			break
		end
	end

	for index = 2, 8 do
		-- �ˬd���W���
		if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register + index) == get_multiplayer.player then
			-- �ˬd�ثe���W�H�ƬO�_�F�W��
			if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register1) < get_multiplayer.maximum_player then
				-- ��l�ƫ�Ĥ@���ϥ�
				if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register1) == 0 then
					CallPlot(get_multiplayer.register, "get_multiplayer_wait", get_multiplayer)
					WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register2, get_multiplayer.waiting_time)
				end
				-- �O�����W�H��
				WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register1, ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register1) + 1)
				-- �ѥ[���ʼаO
				AddBuff(get_multiplayer.player, 624158, 1, get_multiplayer.waiting_time + 5)
				-- Ĳ�osuccess�ƥ�
				get_multiplayer_event(get_multiplayer, "success", get_multiplayer.player)
			else	-- ���W�H�Ƥw��
				-- Ĳ�ofully_booked�ƥ�
				get_multiplayer_event(get_multiplayer, "fully_booked")
			end
			WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register + index, 0)
			return
		end
	end
	-- ���W����
	-- Ĳ�ofail�ƥ�
	get_multiplayer_event(get_multiplayer, "fail")
end

function get_multiplayer_event(get_multiplayer, event_type, arg)	-- �w�qget_multiplayer���U�بƥ�
	local event = {	-- �ƥ�
		register = get_multiplayer.register,
		player = get_multiplayer.player,
		current_time = ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register2)
	}
	-- �w�qsuccess�ƥ�
	if event_type == "success" then
		if get_multiplayer.success_callback then
			event.player = arg
			CallPlot(get_multiplayer.register, get_multiplayer.success_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [success]") end
		end
	-- �w�qfail�ƥ�
	elseif event_type == "fail" then
		if get_multiplayer.fail_callback then
			CallPlot(get_multiplayer.register, get_multiplayer.fail_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [fail]") end
		end
	-- �w�qhas_regist�ƥ�
	elseif event_type == "has_regist" then
		if get_multiplayer.repeat_callback then
			CallPlot(get_multiplayer.register, get_multiplayer.repeat_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [has_regist]") end
		end
	-- �w�qtimer�ƥ�
	elseif event_type == "timer" then
		WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register2, arg)
		if get_multiplayer.waiting_callback then
			event.waiting_time = get_multiplayer.waiting_time
			event.current_time = arg
			CallPlot(get_multiplayer.register, get_multiplayer.waiting_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [timer]") end
		end
	-- �w�qfully_booked�ƥ�
	elseif event_type == "fully_booked" then
		if get_multiplayer.fully_booked_callback then
			CallPlot(get_multiplayer.register, get_multiplayer.fully_booked_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [fully_booked]") end
		end
	-- �w�qcomplete�ƥ�
	elseif event_type == "complete" then
		if get_multiplayer.complete_callback then
			event.players = arg
			CallPlot(get_multiplayer.register, get_multiplayer.complete_callback, event)
			-- ���Wcomplete�᭫�m���W
			get_multiplayer_initialize(get_multiplayer.register)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [complete]") end
		end
	-- �w�q�����ƥ�
	else
		if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: error event type.") end
	end
end

function get_multiplayer_wait(get_multiplayer)	-- ���W�p�ɾ��禡
	for time = get_multiplayer.waiting_time, 0, -1 do
		-- Ĳ�otimer�ƥ�
		get_multiplayer_event(get_multiplayer, "timer", time)
		Sleep(10)
	end
	-- �p�G�˼Ƶ���Ĳ�osuccess�禡
	-- ���range�d�򤺦��ĳ��W�����a
	local players = {}
	local all_players = SetSearchAllPlayer(ReadRoleValue(get_multiplayer.register, EM_RoleValue_RoomID))
	for index = 0, all_players do
		local player = GetSearchResult()
		if CheckBuff(player, 624158) then
			table.insert(players, player)
		end
	end
	-- Ĳ�ocomplete�ƥ�
	get_multiplayer_event(get_multiplayer, "complete", players)
end

function get_multiplayer_initialize(register)	-- ���W��l�ƨ禡
	for index = 0, 8 do
		WriteRoleValue(register, EM_RoleValue_Register + index, 0)
	end
end