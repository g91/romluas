function power_director(director, players, cast, script, event, debug)

	-- 檢查power_director全域
	if not Global_PowerDirector then
		Global_PowerDirector = {}
--		DebugMsg(0, 0, "build table Global_PowerDirector")
	end

 	Global_PowerDirector[director] = {
		-- 威力導演的guid
		guid = director or 0,
		-- 本場次觀賞民眾
		players = players or {},
		-- 你的強大卡司陣容
		cast = cast or {},
		-- 腳本函式名稱
		script = script or "",
		-- 各事件觸發函式名稱
		event = {
			-- 初始化事件，自訂初始化
			initialize = event.initialize,
			-- 表演開始事件。設定玩家buff、npc對話等等
			start = event.start,
			-- 表演結束。設定獎勵、取消玩家buff、npc對話等等
			complete = event.complete,
			-- 玩家中斷處理。
			interrupt = event.interrupt,
			-- 播放中每秒執行。設定檢查與處理等等
			playing = event.playing
		},
		-- DebugMsg
		debug = debug or false,
		-- 建立的演員名單
		actor = {}
		-- EM_RoleValue_Register1 => 是否表演中
	}

	-- 取得全域資料
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

	-- 如果輸入的是單一玩家不是table，轉換成table
	if type(power_director.players) == "number" then
		power_director.players = {players}
	end

	-- 檢查是否在表演
	if ReadRoleValue(power_director.guid, EM_RoleValue_Register1) == 0 then
		-- 初始化表演
		power_director_event(power_director, "initialize")
		-- 建立演員
		power_director_create_actor(power_director)
		-- 啟動表演
		WriteRoleValue(power_director.guid, EM_RoleValue_Register1, 1)
		-- action !!! 執行角本
		CallPlot(power_director.guid, power_director.script, power_director.guid, power_director.actor, players)
	else
		--
	end

	-- start事件
	power_director_event(power_director, "start")

	-- 如果表演播放中
	while ReadRoleValue(power_director.guid, EM_RoleValue_Register1) == 1 do
		-- 監控表演
		power_director_watcher(power_director)
		-- playing event
		power_director_event(power_director, "playing")
		-- delay
		Sleep(10)
	end

	-- 初始化表演
	power_director_event(power_director, "initialize")

	-- complete 表演結束
	power_director_event(power_director, "complete")
end

function power_director_initialize(power_director)	-- 表演初始化
	-- 如果在播放中不要初始化
	if ReadRoleValue(power_director.guid, EM_RoleValue_Register1) ~= 0 then
		return
	end

	if power_director.debug then DebugMsg(0, 0, "function >> power_director_initialize!") end

	-- 如果有演員還在片場，請他們去領便當
	if #power_director.actor ~= 0 then
		for index, actor in pairs(power_director.actor) do
			DelObj(actor)
		end
		power_director.actor = {}
	end
end

function power_director_create_actor(power_director)	-- 建立演員
	if power_director.debug then DebugMsg(0, 0, "function >> power_director_create_actor!") end
	-- 建立演員
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

function power_director_watcher(power_director)	-- 監控表演
	-- 對每位玩家檢查
	for index, player in pairs(power_director.players) do
		-- 如果不是玩家!!
		if ReadRoleValue(player, EM_RoleValue_IsPlayer) == 0 then
			-- 該玩家觸發中斷事件
			power_director_event(power_director, "interrupt")
			-- 玩家列表除名
			table.remove(power_director.players, index)
		end
	end
end

function power_director_stop_movie(guid)
	-- 停止表演
	WriteRoleValue(guid, EM_RoleValue_Register1, 0)
end

function power_director_event(power_director, event_type, argument)
	local event = {
		director = power_director.guid,
		players = power_director.players
	}

	-- start事件
	if event_type == "start" then
		if power_director.event.start then
			event.actor = power_director.actor
			CallPlot(power_director.guid, power_director.event.start, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [start]") end
		end
	-- complete事件
	elseif event_type == "complete" then
		if power_director.event.complete then
			CallPlot(power_director.guid, power_director.event.complete, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [complete]") end
		end
	-- interrupt事件
	elseif event_type == "interrupt" then
		if power_director.event.interrupt then
			CallPlot(power_director.guid, power_director.event.interrupt, event)
		else
			if power_director.debug then DebugMsg(0, 0, "[ALERT] power_director: you didn't define function for event [interrupt]") end
		end
	-- playing事件
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
	-- initialize事件
	elseif event_type == "initialize" then
		if power_director.event.initialize then
			event.actor = power_director.actor
			CallPlot(power_director.guid, power_director.event.initialize, event)
		else
			power_director_initialize(power_director)
		end
	-- 其他事件
	else
		if power_director.debug then DebugMsg(0, 0, "[ERROR] power_director: unknow event type [" .. event_type .. "]") end
	end
end