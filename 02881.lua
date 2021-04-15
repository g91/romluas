function power_director(director, players, cast, script, event, debug)

	-- �ˬdpower_director����
	if not Global_PowerDirector then
		Global_PowerDirector = {}
--		DebugMsg(0, 0, "build table Global_PowerDirector")
	end

 	Global_PowerDirector[director] = {
		-- �¤O�ɺt��guid
		guid = director or 0,
		-- �������[�����
		players = players or {},
		-- �A���j�j�d�q�}�e
		cast = cast or {},
		-- �}���禡�W��
		script = script or "",
		-- �U�ƥ�Ĳ�o�禡�W��
		event = {
			-- ��l�ƨƥ�A�ۭq��l��
			initialize = event.initialize,
			-- ��t�}�l�ƥ�C�]�w���abuff�Bnpc��ܵ���
			start = event.start,
			-- ��t�����C�]�w���y�B�������abuff�Bnpc��ܵ���
			complete = event.complete,
			-- ���a���_�B�z�C
			interrupt = event.interrupt,
			-- ���񤤨C�����C�]�w�ˬd�P�B�z����
			playing = event.playing
		},
		-- DebugMsg
		debug = debug or false,
		-- �إߪ��t���W��
		actor = {}
		-- EM_RoleValue_Register1 => �O�_��t��
	}

	-- ���o������
	if Global_PowerDirector[director] then
--		DebugMsg(0, 0, "get Global_PowerDirector data")
	end
	local power_director = Global_PowerDirector[director]

	if power_director.debug then
		DebugMsg(0, 0, "Welcome Power Director!!")
		DebugMsg(0, 0, "------------------------------------------------")
		DebugMsg(0, 0, "power_director.guid = " .. power_director.guid)
		DebugMsg(0, 0, "power_director.players = {" .. table.print(players) .. "}")
		DebugMsg(0, 0, "power_director.cast : ")
		for index, actor in pairs(power_director.cast) do
			DebugMsg(0, 0, "   " .. table.print(actor))
		end
		DebugMsg(0, 0, "power_director.script = " .. power_director.script)
		DebugMsg(0, 0, "------------------------------------------------")
	end

	-- �p�G��J���O��@���a���Otable�A�ഫ��table
	if type(power_director.players) == "number" then
		power_director.players = {players}
	end

	-- �ˬd�O�_�b��t
	if ReadRoleValue(power_director.guid, EM_RoleValue_Register1) == 0 then
		-- ��l�ƪ�t
		power_director_event(power_director, "initialize")
		-- �إߺt��
		power_director_create_actor(power_director)
		-- �Ұʪ�t
		WriteRoleValue(power_director.guid, EM_RoleValue_Register1, 1)
		-- action !!! ���樤��
		CallPlot(power_director.guid, power_director.script, power_director.guid, power_director.actor, players)
	else
		--
	end

	-- start�ƥ�
	power_director_event(power_director, "start")

	-- �p�G��t����
	while ReadRoleValue(power_director.guid, EM_RoleValue_Register1) == 1 do
		-- �ʱ���t
		power_director_watcher(power_director)
		-- playing event
		power_director_event(power_director, "playing")
		-- delay
		Sleep(10)
	end

	-- ��l�ƪ�t
	power_director_event(power_director, "initialize")

	-- complete ��t����
	power_director_event(power_director, "complete")
end

function power_director_initialize(power_director)	-- ��t��l��
	-- �p�G�b���񤤤��n��l��
	if ReadRoleValue(power_director.guid, EM_RoleValue_Register1) ~= 0 then
		return
	end

	if power_director.debug then DebugMsg(0, 0, "function >> power_director_initialize!") end

	-- �p�G���t���٦b�����A�ХL�̥h��K��
	if #power_director.actor ~= 0 then
		for index, actor in pairs(power_director.actor) do
			DelObj(actor)
		end
		power_director.actor = {}
	end
end

function power_director_create_actor(power_director)	-- �إߺt��
	if power_director.debug then DebugMsg(0, 0, "function >> power_director_create_actor!") end
	-- �إߺt��
	for index, actor in pairs(power_director.cast) do
		local name = actor.name or index
		local org_id = actor.id or 0
		local flag = actor.flag or 0
		local pid = actor.pid or 0
		local mode = actor.mode or {}
		power_director.actor[name] = create_object(
			org_id,
			GetMoveFlagValue(flag, pid, EM_RoleValue_X),
			GetMoveFlagValue(flag, pid, EM_RoleValue_Y),
			GetMoveFlagValue(flag, pid, EM_RoleValue_Z),
			GetMoveFlagValue(flag, pid, EM_RoleValue_Dir),
			mode
		)
		MoveToFlagEnabled(power_director.actor[index], false)
		if power_director.debug then
			DebugMsg(0, 0, "power_director.actor[" .. name .. "] = " .. power_director.actor[name])
		end
	end
	if power_director.debug then DebugMsg(0, 0, "------------------------------------------------") end
end

function power_director_watcher(power_director)	-- �ʱ���t
	-- ��C�쪱�a�ˬd
	for index, player in pairs(power_director.players) do
		-- �p�G���O���a!!
		if ReadRoleValue(player, EM_RoleValue_IsPlayer) == 0 then
			-- �Ӫ��aĲ�o���_�ƥ�
			power_director_event(power_director, "interrupt")
			-- ���a�C���W
			table.remove(power_director.players, index)
		end
	end
end

function power_director_stop_movie(guid)
	-- �����t
	WriteRoleValue(guid, EM_RoleValue_Register1, 0)
end

function power_director_event(power_director, event_type, argument)
	local event = {
		director = power_director.guid,
		players = power_director.players
	}

	-- start�ƥ�
	if event_type == "start" then
		if power_director.event.start then
			event.actor = power_director.actor
			CallPlot(power_director.guid, power_director.event.start, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [start]") end
		end
	-- complete�ƥ�
	elseif event_type == "complete" then
		if power_director.event.complete then
			CallPlot(power_director.guid, power_director.event.complete, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [complete]") end
		end
	-- interrupt�ƥ�
	elseif event_type == "interrupt" then
		if power_director.event.interrupt then
			CallPlot(power_director.guid, power_director.event.interrupt, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [interrupt]") end
		end
	-- playing�ƥ�
	elseif event_type == "playing" then
		if power_director.event.playing then
			local event_runner
			for index, player in pairs(power_director.players) do
				if player then
					event_runner = player
					break
				end
			end
			event_runner = event_runner or 0
			CallPlot(event_runner, power_director.event.playing, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [playing]") end
		end
	-- initialize�ƥ�
	elseif event_type == "initialize" then
		if power_director.event.initialize then
			event.actor = power_director.actor
			CallPlot(power_director.guid, power_director.event.initialize, event)
		else
			power_director_initialize(power_director)
		end
	-- ��L�ƥ�
	else
		if power_director.debug then DebugMsg(0, 0, "[ERROR] power_director: unknow event type [" .. event_type .. "]") end
	end
end