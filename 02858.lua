-- /// --------------------------------------------------------------------------------
-- /// get_multiplayer會判斷當前狀況 : 待命中、報名開始、倒數中、報名截止，並在玩家執行到get_multiplayer時判斷是否開始倒數。
-- /// 當玩家執行到get_multiplayer時，會先被記錄在register的EM_RoleValue_Register3~10，之後再逐一給予"有效報名"資格。
-- /// 在給予"有效報名"資格之前會檢查是否超過人數。這是為了避免多人同時報名造成錯誤。但可能會讓同時報名的數人只有一名報名成功。
-- /// 
-- /// 所謂的"有效報名"是在成功報名後會獲得buff，基本法術624158，效果維持到報名截止後5秒。
-- /// 玩家報名截止前待在報名範圍內並持有該buff就可以成為"有效參加"玩家。
-- /// --------------------------------------------------------------------------------
-- get_multiplayer(register, player, range, maximum_player, waiting_time, event_callback, debug)
-- /// arguments
-- /// register : number			記錄用物件，會在register的RoleValue記錄資料，EM_RoleValue_Register1記錄當前報名人數，EM_RoleValue_Register2記錄當前倒數時間，EM_RoleValue_Register3~10緩衝多人報名
-- /// player : number			當前要報名的玩家
-- /// maximum_player : number	報名人數上限
-- /// waiting_time : number		報名時間，單位是秒
-- /// event_callback : table		定義各個事件要執行的函式
-- /// debug : boolean			是否開啟debug
-- /// --------------------------------------------------------------------------------
-- /// get_multiplayer的event
-- /// success				玩家報名成功觸發
-- /// fail				玩家報名失敗觸發
-- /// has_regist			玩家重複報名觸發
-- /// fully_booked			報名名額已滿觸發
-- /// complete				報名截止後觸發
-- /// timer				報名截止前每秒觸發一次
-- /// --------------------------------------------------------------------------------
-- /// event.register : number		觸發該事件的register
-- /// event.player : number		觸發該事件的玩家
-- /// event.current_time : number	觸發該事件時的倒數時間
-- /// event.waiting_time : number	僅timer事件存在，觸發該事件的waiting_time
-- /// event.players : table		僅complete事件存在，所有"有效參與"玩家的guid陣列
-- /// --------------------------------------------------------------------------------
-- function Lua_npc_talk()
-- 	AddSpeakOption(npc, player, "I want play game!", "Lua_sign_up", 0)
-- end
-- 
-- function Lua_sign_up()
-- 	get_multiplayer(
-- 		npc,								-- 跑報名函式的物件guid
-- 		player,								-- 報名玩家的guid
-- 		5,								-- 報名人數上限
-- 		20,								-- 等待時間
-- 		{success = "Lua_when_sign_up_success",			-- 報名成功後執行函式名稱
--		 complete = "Lua_when_sign_up_complete",			-- 報名結束後執行函式名稱
-- 		 timer = "Lua_timer"},						-- 報名結束前每秒執行一次函式名稱
-- 		true								-- 開啟DebugMsg訊息
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
	local get_multiplayer = {	-- 報名系統
		-- 報名實體guid
		register = register,
		-- 當前執行報名系統玩家guid
		player = player,
		-- 報名人數上限
		maximum_player = maximum_player,
		-- 報名總時間
		waiting_time = waiting_time,
		-- 等待時間每秒觸發函式名稱
		waiting_callback = event_callback.timer,
		-- 報名成功觸發函式名稱
		success_callback = event_callback.success,
		-- 報名失敗觸發函式名稱
		fail_callback = event_callback.fail,
		-- 重複報名觸發函式名稱
		repeat_callback = event_callback.has_regist,
		-- 報名人數已滿觸發函式名稱
		fully_booked_callback = event_callback.fully_booked,
		-- 結束報名後觸發函式名稱
		complete_callback = event_callback.complete,
		-- 記錄當前時間
		current_time = ReadRoleValue(register, EM_RoleValue_Register2),
		-- 是否開啟debugmsg
		debug = debug or false
	}

	-- 重複報名
	if CheckBuff(player, 624158) then
		-- 觸發has_regist事件
		get_multiplayer_event(get_multiplayer, "has_regist")
		return
	end

	-- 搜索register3~10暫存變數是否有空值，暫存玩家guid
	for index = 2, 8 do
		-- 報名前先將玩家guid記錄在npc身上，再依序登記報名，避免玩家同時報名
		if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register + index) == 0 then
			WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register + index, get_multiplayer.player)
			break
		end
	end

	for index = 2, 8 do
		-- 檢查報名資格
		if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register + index) == get_multiplayer.player then
			-- 檢查目前報名人數是否達上限
			if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register1) < get_multiplayer.maximum_player then
				-- 初始化後第一次使用
				if ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register1) == 0 then
					CallPlot(get_multiplayer.register, "get_multiplayer_wait", get_multiplayer)
					WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register2, get_multiplayer.waiting_time)
				end
				-- 記錄報名人數
				WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register1, ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register1) + 1)
				-- 參加活動標記
				AddBuff(get_multiplayer.player, 624158, 1, get_multiplayer.waiting_time + 5)
				-- 觸發success事件
				get_multiplayer_event(get_multiplayer, "success", get_multiplayer.player)
			else	-- 報名人數已滿
				-- 觸發fully_booked事件
				get_multiplayer_event(get_multiplayer, "fully_booked")
			end
			WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register + index, 0)
			return
		end
	end
	-- 報名失敗
	-- 觸發fail事件
	get_multiplayer_event(get_multiplayer, "fail")
end

function get_multiplayer_event(get_multiplayer, event_type, arg)	-- 定義get_multiplayer的各種事件
	local event = {	-- 事件
		register = get_multiplayer.register,
		player = get_multiplayer.player,
		current_time = ReadRoleValue(get_multiplayer.register, EM_RoleValue_Register2)
	}
	-- 定義success事件
	if event_type == "success" then
		if get_multiplayer.success_callback then
			event.player = arg
			CallPlot(get_multiplayer.register, get_multiplayer.success_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [success]") end
		end
	-- 定義fail事件
	elseif event_type == "fail" then
		if get_multiplayer.fail_callback then
			CallPlot(get_multiplayer.register, get_multiplayer.fail_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [fail]") end
		end
	-- 定義has_regist事件
	elseif event_type == "has_regist" then
		if get_multiplayer.repeat_callback then
			CallPlot(get_multiplayer.register, get_multiplayer.repeat_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [has_regist]") end
		end
	-- 定義timer事件
	elseif event_type == "timer" then
		WriteRoleValue(get_multiplayer.register, EM_RoleValue_Register2, arg)
		if get_multiplayer.waiting_callback then
			event.waiting_time = get_multiplayer.waiting_time
			event.current_time = arg
			CallPlot(get_multiplayer.register, get_multiplayer.waiting_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [timer]") end
		end
	-- 定義fully_booked事件
	elseif event_type == "fully_booked" then
		if get_multiplayer.fully_booked_callback then
			CallPlot(get_multiplayer.register, get_multiplayer.fully_booked_callback, event)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [fully_booked]") end
		end
	-- 定義complete事件
	elseif event_type == "complete" then
		if get_multiplayer.complete_callback then
			event.players = arg
			CallPlot(get_multiplayer.register, get_multiplayer.complete_callback, event)
			-- 報名complete後重置報名
			get_multiplayer_initialize(get_multiplayer.register)
		else
			if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: you didn't define function for event [complete]") end
		end
	-- 定義未知事件
	else
		if get_multiplayer.debug then DebugMsg(0, 0, "[ERROR] get_multiplayer: error event type.") end
	end
end

function get_multiplayer_wait(get_multiplayer)	-- 報名計時器函式
	for time = get_multiplayer.waiting_time, 0, -1 do
		-- 觸發timer事件
		get_multiplayer_event(get_multiplayer, "timer", time)
		Sleep(10)
	end
	-- 如果倒數結束觸發success函式
	-- 抓取range範圍內有效報名的玩家
	local players = {}
	local all_players = SetSearchAllPlayer(ReadRoleValue(get_multiplayer.register, EM_RoleValue_RoomID))
	for index = 0, all_players do
		local player = GetSearchResult()
		if CheckBuff(player, 624158) then
			table.insert(players, player)
		end
	end
	-- 觸發complete事件
	get_multiplayer_event(get_multiplayer, "complete", players)
end

function get_multiplayer_initialize(register)	-- 報名初始化函式
	for index = 0, 8 do
		WriteRoleValue(register, EM_RoleValue_Register + index, 0)
	end
end