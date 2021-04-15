--------------------------------------------------------------------------
--	2013 巧藝節 扭轉動力 全域資料表
--
--	Global_2013_TwistPower	遊戲過程使用
--	Global_2013_TwistPower_Setting	遊戲設定使用
--------------------------------------------------------------------------
function Lua_twist_power_setting()
	Global_2013_TwistPower_Setting = {}

	--	遊戲啟動區間(小時)
	Global_2013_TwistPower_Setting.game_start_hour = {2, 6, 10, 14, 18, 22}

	--	遊戲開放報名時間(>=)(分)
	Global_2013_TwistPower_Setting.register_start_time = 10

	--	遊戲結束報名時間(<=)(分)
	Global_2013_TwistPower_Setting.register_stop_time = 19

	--	遊戲啟動時間(==)(分)
	Global_2013_TwistPower_Setting.game_start_time = 20

	--	遊戲開放報名提醒功能(npc載入自動啟動)
	Global_2013_TwistPower_Setting.is_reminder_active = false

	--	活動使用旗幟編號
	Global_2013_TwistPower_Setting.flag = 781082

	Global_2013_TwistPower_Setting.sensitivity = 30

	-- 迴圈延遲秒數
	Global_2013_TwistPower_Setting.delay = 0.5

	-- 能量流失延遲
	Global_2013_TwistPower_Setting.out_flow_delay = 6

	-- 母體能量power影響能量流失間距
	Global_2013_TwistPower_Setting.out_flow_gap = 10

	--	debug訊息開關
	Global_2013_TwistPower_Setting.debug = true
end

--------------------------------------------------------------------------
--	2013 巧藝節 扭轉動力 測試指令
--------------------------------------------------------------------------
-- 	[直接報名並啟動遊戲程序]
--	請對同一個npc使用
--	/GM ? zone 2 0 2125.3 67.4 1924
--	/gm ? pcall GM_twist_power_join_game(%t_id)
function GM_twist_power_join_game(npc)

	-- 必須指定一個npc作為註冊npc
	if not npc then
		DebugMsg(0, 0, "[ERROR] please select one npc, and the others must select the same one.")
		return
	end

	get_multiplayer(
		-- npc
		npc,
		-- 玩家
		OwnerID(),
		-- 報名人數上限
		10,
		-- 報名時間(秒)
		20,
		{-- 報名成功
		 success = "Lua_twist_power_join_success",
		 -- 報名額滿
		 fully_booked = "Lua_twist_power_join_fully_booked",
		 -- 重複報名
		 has_regist = "Lua_twist_power_join_has_regist",
		 -- 報名截止
		 complete = "Lua_twist_power_join_complete",
		-- timer事件debug用
		timer = "Lua_twist_power_join_timer"},
		-- 開啟debugmsg
		true
	)
end

-- 清除遊戲
-- 如果遊戲出現bug中斷，造成之後遊戲不能啟動，請先清除遊戲
function GM_twist_power_initialize()
	Global_2013_TwistPower = nil
	Lua_twist_power_setting()
end

--	手動開啟扭轉動力每小時的報名提醒功能
--	請對報名npc使用
--	/gm ? pcall GM_twist_power_open_reminder(%t_id)
function GM_twist_power_open_reminder(guid)
	if not Global_2013_TwistPower_Setting then
		Lua_twist_power_setting()
	end
	Global_2013_TwistPower_Setting.is_reminder_active = true
	CallPlot(guid, "Lua_twist_power_reminder")
end

--	手動關閉扭轉動力每小時的報名功能
function GM_twist_power_close_reminder()
	Global_2013_TwistPower_Setting.is_reminder_active = false
end

--	修正巨大法陣高度
function GM_twist_power_huge_pattern_higher()
	if not Global_2013_TwistPower.huge_pattern.fix_hight then
		Global_2013_TwistPower.huge_pattern.fix_hight = 0
	end
	Global_2013_TwistPower.huge_pattern:move(Global_2013_TwistPower.huge_pattern.x, Global_2013_TwistPower.huge_pattern.y + 4, Global_2013_TwistPower.huge_pattern.z)
	Global_2013_TwistPower.huge_pattern.fix_hight = Global_2013_TwistPower.huge_pattern.fix_hight + 4
	DebugMsg(0, 0, "[INFO] TwistPower : fix hieght : " .. Global_2013_TwistPower.huge_pattern.fix_hight)
end

--	修正巨大法陣高度
function GM_twist_power_huge_pattern_lower()
	if not Global_2013_TwistPower.huge_pattern.fix_hight then
		Global_2013_TwistPower.huge_pattern.fix_hight = 0
	end
	Global_2013_TwistPower.huge_pattern:move(Global_2013_TwistPower.huge_pattern.x, Global_2013_TwistPower.huge_pattern.y - 4, Global_2013_TwistPower.huge_pattern.z)
	Global_2013_TwistPower.huge_pattern.fix_hight = Global_2013_TwistPower.huge_pattern.fix_hight - 4
	DebugMsg(0, 0, "[INFO] TwistPower : fix hieght : " .. Global_2013_TwistPower.huge_pattern.fix_hight)
end

--	修改遊戲圈數GM_twist_power_set_cycle_count(<修改圈數>)
--	/gm ? pcall GM_twist_power_set_cycle_count()
function GM_twist_power_set_cycle_count(_number)
	if Global_2013_TwistPower then
		Global_2013_TwistPower.cycle_counter = _number
		for index, player in pairs(Global_2013_TwistPower.players) do
			-- 圈數提示
			Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_24]" .. Global_2013_TwistPower.cycle_counter .. "[SC_2013TWISTPOWER_121397_19]", 2)
		end
	else
		DebugMsg(0, 0, "[ERROR] game is not exist")
	end
end

--------------------------------------------------------------------------
--	2013 巧藝節 扭轉動力 NPC對話
--------------------------------------------------------------------------
function Lua_twist_power_npc_speak()

	--------------------------------------------------------------------------
	-- 報名npc
	-- 第一層對話
	--------------------------------------------------------------------------

	if not Global_2013_TwistPower_Setting then
		Lua_twist_power_setting()
	end

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- 今天已經完過
	if CheckFlag(player.GUID, 548009) then
		-- 你今天已經扭轉動力，避免你的體力無法負荷，今天就先好好休息，明天再來吧。
		npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_01]")
		return
	end

	-- 目前是否是遊戲可以報名的時間
	for index, hour in pairs(Global_2013_TwistPower_Setting.game_start_hour) do
		if GetSystime(1) == hour and GetSystime(2) >= Global_2013_TwistPower_Setting.register_start_time and GetSystime(2) <=Global_2013_TwistPower_Setting.register_stop_time then

			-- 遊戲介紹
			npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_03]")

			-- 我要怎麼協助扭轉動力呢？
			npc:addSpeakOption("[SC_2013TWISTPOWER_121397_04]", "Lua_twist_power_game_explain")

			-- I am man power, 不解釋
			npc:addSpeakOption("[SC_2013TWISTPOWER_121397_33]", "Lua_twist_power_join_game")

			return
		end
	end
	-- 現在還不是扭轉動力的時侯，請等到2點10分、6點10分、10點10分、14點10分、18點10分、22點10分，再跟我報名參加活動吧。
	npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_10]")
end

function Lua_twist_power_game_explain()

	--------------------------------------------------------------------------
	-- 報名npc
	-- 第二層對話：遊戲說明
	--------------------------------------------------------------------------

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- 遊戲說明一
	npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_05]")

	-- 我要怎麼獲得能量符文和冷卻符文呢？
	npc:addSpeakOption("[SC_2013TWISTPOWER_121397_06]", "Lua_twist_power_game_explain2")
end

function Lua_twist_power_game_explain2()

	--------------------------------------------------------------------------
	-- 報名npc
	-- 第三層對話：遊戲說明
	--------------------------------------------------------------------------

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- 遊戲說明二
	npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_07]")

	-- 我確定我準備好和大家合作，一起扭轉動力。
	npc:addSpeakOption("[SC_2013TWISTPOWER_121397_08]", "Lua_twist_power_join_game")
end

function Lua_twist_power_join_game()

	--------------------------------------------------------------------------
	-- 報名npc
	-- 第四層對話：報名遊戲
	--------------------------------------------------------------------------

	local player = AddyPlayer:new(OwnerID())
	local npc = AddyQuestNpc:new(TargetID())

	-- 計算誤差秒數，以2013年1月1日0點整為標準
	local delta = (GetSystime(0) - 1366819200) % 60

	-- 再次檢查報名時間
	if GetSystime(2) >= Global_2013_TwistPower_Setting.register_start_time and GetSystime(2) <=Global_2013_TwistPower_Setting.register_stop_time then
		DebugMsg(player.GUID, 0, "[INFO] TwisterPower : you have sent out the registeration.")

		get_multiplayer(
			-- npc
			npc.GUID,
			-- 玩家
			player.GUID,
			-- 報名人數上限
			100,
			-- 報名時間(秒)
			(Global_2013_TwistPower_Setting.game_start_time - GetSystime(2)) * 60 - delta,
			{-- 報名成功
			 success = "Lua_twist_power_join_success",
			 -- 報名額滿
			 fully_booked = "Lua_twist_power_join_fully_booked",
			 -- 重複報名
			 has_regist = "Lua_twist_power_join_has_regist",
			 -- 報名截止
			 complete = "Lua_twist_power_join_complete",
			fail = "Lua_twist_power_join_fail",
			-- timer事件debug用
			timer = "Lua_twist_power_join_timer"},
			-- 開啟debugmsg
			false
		)
	else
		-- 喔，不，你錯過報名時段了，我現在要先去啟動能量晶體，等下一個報名時段再來找我報名吧。
		npc:setSpeakDetail("[SC_2013TWISTPOWER_121397_11]")
	end
end

function Lua_twist_power_join_fail(event)

	--------------------------------------------------------------------------
	-- 報名失敗
	--------------------------------------------------------------------------

	DebugMsg(0, 0, "[INFO] TwisterPower : register system has a unkown error.")
end

function Lua_twist_power_join_success(event)

	--------------------------------------------------------------------------
	-- 報名成功
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)
	local player = AddyPlayer:new(event.player)

	-- 第一次遊戲初始化
	if not Global_2013_TwistPower then
		Global_2013_TwistPower = {}
		Global_2013_TwistPower.flag = AddyFlagGroup:new(Global_2013_TwistPower_Setting.flag)
		Global_2013_TwistPower.huge_pattern = AddyNpc:new()

		-- 設定巨大魔法陣
		Global_2013_TwistPower.huge_pattern:create(121108, Global_2013_TwistPower.flag[0].x, Global_2013_TwistPower.flag[0].y + 8, Global_2013_TwistPower.flag[0].z, Global_2013_TwistPower.flag[0].direction)
		Global_2013_TwistPower.huge_pattern.gravity = false
		Global_2013_TwistPower.huge_pattern.patrol = false
		Global_2013_TwistPower.huge_pattern:addToPartition()
	end

	-- 我要扭轉動力buff
	player:addBuff(624164)

	-- 你已經完成報名了！請記得在整點前回來集合！
	npc:scriptMessage(player, "[SC_2013TWISTPOWER_121397_14]", 2)
	CloseSpeak(player.GUID)
end

function Lua_twist_power_join_fully_booked(event)

	--------------------------------------------------------------------------
	-- 報名額滿
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)
	local player = AddyPlayer:new(event.player)

	-- 抱歉，目前已經額滿囉！
	npc:scriptMessage( player , "[SC_2013TWISTPOWER_121397_13]", 2)	--4/23狗狗修改
	CloseSpeak(player.GUID)
end

function Lua_twist_power_join_has_regist(event)

	--------------------------------------------------------------------------
	-- 重複報名
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)
	local player = AddyPlayer:new(event.player)

	-- 你已經報名成功，請等待整點活動開始，並確認活動開始時，有在活動範圍內。
	npc:scriptMessage( player , "[SC_2013TWISTPOWER_121397_02]", 2)

	CloseSpeak(player.GUID)
end

function Lua_twist_power_join_timer(event)

	--------------------------------------------------------------------------
	-- 報名倒數，每秒執行一次
	--------------------------------------------------------------------------

	local npc = AddyNpc:new(event.register)

	--DebugMsg(0, 0, "event.waiting_time = " .. event.waiting_time .. ", event.current_time = " .. event.current_time)

	-- 報名時間剩2分鐘提示
	if event.current_time == 120 then
		-- 再過幾分鐘就要開始扭轉動力，有意願幫助我的冒險者，現在請過來跟我報名參加活動。
		npc:say( "[SC_2013TWISTPOWER_121397_12]" )	--4/23狗狗修改，scriptMessage>NPCSAY
	end

	-- 報名時間剩30秒提示
	if event.current_time == 30 then
		-- 扭轉動力馬上就要開始了！請在30秒內進到活動範圍內集合！
		npc:scriptMessage(0, "[SC_2013TWISTPOWER_121397_17]", 2)
	end
end

function Lua_twist_power_join_complete(event)

	--------------------------------------------------------------------------
	-- 報名截止，啟動遊戲
	--------------------------------------------------------------------------

	-- 開始遊戲
	Lua_twist_power_main(event.players)
end

--------------------------------------------------------------------------
--	2013 巧藝節 扭轉動力 遊戲主要流程
--------------------------------------------------------------------------
function Lua_twist_power_main(players)

	--------------------------------------------------------------------------
	-- 初始化遊戲物件
	--------------------------------------------------------------------------
	Lua_twist_power_class_initialize()

	--------------------------------------------------------------------------
	-- 設置
	--------------------------------------------------------------------------
	-- 母體跑的圈數
	Global_2013_TwistPower.cycle_counter = 0
	-- 開始時間 單位：秒
	Global_2013_TwistPower.start_time = GetSystime(0)
	-- 能量母體
	Global_2013_TwistPower.matrix = AddyNpc:new()
	-- 參與玩家
	Global_2013_TwistPower.players = {}
	-- 能量裝置(能量供應&母體冷卻)
	Global_2013_TwistPower.source_base = {}
	-- 遊戲活動狀態
	Global_2013_TwistPower.is_active = true
	-- 
	Global_2013_TwistPower.current_time = 0
	-- power source種類計數器
	Global_2013_TwistPower.source_type_count = {
		booster = 0,
		cooler = 0
	}
	-- 遊戲開始前等待時間
	local ready_time = 10
	local last_second = GetSystime(0)
	local has_warning = false
	local out_flow_delay = Global_2013_TwistPower_Setting.out_flow_delay
	local out_flow_trigger = true
	local record = {}

	--------------------------------------------------------------------------
	-- 捷徑
	--------------------------------------------------------------------------
	local twist_power = Global_2013_TwistPower
	local matrix = Global_2013_TwistPower.matrix
	local flag = Global_2013_TwistPower.flag

	--------------------------------------------------------------------------
	-- 能量母體
	--------------------------------------------------------------------------
	matrix:create(103890, flag[17].x, flag[17].y, flag[17].z, flag[0].direction)
	-- 可點選
	matrix.show_role_head = true
	-- 不可戰鬥
	matrix.fight = false
	-- 不巡邏
	matrix.patrol = false
	matrix:addToPartition()
	SetPlot(matrix.GUID, "collision", "Lua_twist_power_MatrixCollision", 10)

	--------------------------------------------------------------------------
	-- 能量水晶
	--------------------------------------------------------------------------
	if Global_2013_TwistPower_Setting.crystal then
		Global_2013_TwistPower.crystal = Global_2013_TwistPower_Setting.crystal
		DebugMsg(0, 0, "[TwistPower] <get> Crystal")
	else
		Global_2013_TwistPower.crystal = AddyNpc:new()
		Global_2013_TwistPower.crystal:create(121479, flag[0].x, flag[0].y, flag[0].z, flag[0].direction)
	end

	--------------------------------------------------------------------------
	-- 玩家
	--------------------------------------------------------------------------
	for index, player_guid in pairs(players) do
		local player = AddyPlayer:new(player_guid)
		if Global_2013_TwistPower.crystal:distanceTo(player) <= 300 then

			--------------------------------------------------------------------------
			-- 玩家加入遊戲前的設定
			--------------------------------------------------------------------------
			-- 強制下馬
			DW_CancelMount(player.GUID)	--4/23狗狗加，強制下馬
			-- 遊戲buff
			player:addBuff(624165)
			-- 顯示倒數計時器
			StartClientCountDown(player.GUID, ready_time, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]")
			--------------------------------------------------------------------------

			-- 塞進遊戲的玩家列表
			table.insert(Global_2013_TwistPower.players, player)
		else
			-- 抱歉，你目前距離活動範圍太遠，無法參加本次活動！
			Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_16]", 2)
		end
		-- 清除報名buff
		player:cancelBuff(624164)
	end

	--------------------------------------------------------------------------
	-- 根據玩家人數決定能源buff種類
	--------------------------------------------------------------------------
	if #Global_2013_TwistPower.players > 10 then
		Global_2013_TwistPower.power_buff = 507825
	elseif #Global_2013_TwistPower.players > 5 then
		Global_2013_TwistPower.power_buff = 507824
	else
		Global_2013_TwistPower.power_buff = 623964
	end

	--------------------------------------------------------------------------
	-- 產生能源供應器1~16
	--------------------------------------------------------------------------
	for index = 1, 16 do
		local _source_base = Class_TwistPowerSourceBase:new()
		_source_base:create(flag[index].x, flag[index].y, flag[index].z)
		_source_base:addToPartition()
		table.insert(Global_2013_TwistPower.source_base, _source_base)
	end

	-- 開始前10秒倒數
	Sleep(ready_time * 10)

	--------------------------------------------------------------------------
	-- 亂數產生加速能源或冷卻劑
	--------------------------------------------------------------------------
	local random_table = Lua_twist_power_get_type_by_rate(4, 1)
	for index, source_base in pairs(Global_2013_TwistPower.source_base) do
		-- 產生能量球
		source_base:produce(random_table[index])
		Sleep(RandRange(1, 2))
	end

	--------------------------------------------------------------------------
	-- 移除巨大魔法陣
	--------------------------------------------------------------------------
	if Global_2013_TwistPower.huge_pattern then
		Global_2013_TwistPower.huge_pattern:delete()
		Global_2013_TwistPower.huge_pattern = nil
	end

	--------------------------------------------------------------------------
	-- 監視遊戲玩家狀況
	--------------------------------------------------------------------------
	Global_2013_TwistPower.crystal:beginPlot("Lua_twist_power_watcher")

	--------------------------------------------------------------------------
	-- 遊戲主要迴圈
	--------------------------------------------------------------------------
	while Global_2013_TwistPower.is_active do

		--------------------------------------------------------------------------
		-- 統計當前場上能量種類
		--------------------------------------------------------------------------
		Global_2013_TwistPower.source_type_count.booster = 0
		Global_2013_TwistPower.source_type_count.cooler = 0
		-- 檢查所有能量基座
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
		-- 能原被取走5秒後重生
		--------------------------------------------------------------------------
		for index, source_base in pairs(Global_2013_TwistPower.source_base) do
			if not source_base.source and GetSystime(0) - source_base.last_time >= 5 then
				--確保所有種類能量最少有2個，否則隨機生產
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
		-- 母體的移動路線 17~36
		--------------------------------------------------------------------------
		if matrix.buff[Global_2013_TwistPower.power_buff] then
			for index = 17, 36 do
				-- 判斷母體在哪一根旗子
				if flag[index]:distanceTo(matrix) < Global_2013_TwistPower_Setting.sensitivity then
					-- 在最後一根
					if index == 36 and not Global_2013_TwistPower.cycle_check and matrix.move_target_flag == 36 then
						-- 前往第一根
						matrix.move_target_flag = 17
						-- 打開加圈數開關
						Global_2013_TwistPower.cycle_check = true
					-- 如果在第17跟而且加圈數開關打開
					elseif index == 17 and Global_2013_TwistPower.cycle_check then
						matrix.move_target_flag = index + 1
						-- 加圈數
						Global_2013_TwistPower.cycle_counter = Global_2013_TwistPower.cycle_counter + 1
						table.insert(record, {Global_2013_TwistPower.cycle_counter, Global_2013_TwistPower.current_time})
						Global_2013_TwistPower.cycle_check = false
						matrix:systemCastSpell(Global_2013_TwistPower.crystal, 495513)
						for index, player in pairs(Global_2013_TwistPower.players) do
							-- 圈數提示
							Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_24]" .. Global_2013_TwistPower.cycle_counter .. "[SC_2013TWISTPOWER_121397_19]", 2, C_SYSTEM)	--4/24狗狗加
						end
					elseif index == 36 then
						matrix.move_target_flag = 17
					else
						-- 前往下一根
						matrix.move_target_flag = index + 1
					end
				end
			end
		else
			-- 沒有能量不會動
			matrix.move_target_flag = nil
		end

		--------------------------------------------------------------------------
		-- 有目標就移動
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
			-- 重新計算移動
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
		-- 掉一層能量，遊戲時間越長調越快
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
		-- 最後30秒開始每10秒提醒
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.current_time >= 150 and Global_2013_TwistPower.current_time ~= 180 and Global_2013_TwistPower.current_time % 10 == 0 then
			for index, player in pairs(Global_2013_TwistPower.players) do
				Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_23]" .. (180 - Global_2013_TwistPower.current_time) .. "[SC_2013TWISTPOWER_121397_29]", 2, C_SYSTEM)
			end
		end

		--------------------------------------------------------------------------
		-- 180秒後結束遊戲
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.current_time >= 180 then
			Global_2013_TwistPower.is_active = false
		end

		--------------------------------------------------------------------------
		-- 延遲
		--------------------------------------------------------------------------
		Sleep(Global_2013_TwistPower_Setting.delay * 10)
	end

	--------------------------------------------------------------------------
	-- 給予獎勵
	--------------------------------------------------------------------------
--	DebugMsg(0, 0, "Global_2013_TwistPower.cycle_counter = " .. Global_2013_TwistPower.cycle_counter)
	-- 所有參加玩家發獎品
	for index, player in pairs(Global_2013_TwistPower.players) do
		Lua_twist_power_reward(player)
		player:cancelBuff(624165)
		player:cancelBuff(501308)
		player:cancelBuff(501309)
	end

	--------------------------------------------------------------------------
	-- 清除物件
	--------------------------------------------------------------------------
	-- 清除母體
	matrix:delete()
--	DebugMsg(0, 0, "[INFO] TwisterPower : remove object matrix.")
	-- 清除基座
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
	-- 清除遊戲
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
	-- 遊戲監控：玩家條件，母體條件
	--------------------------------------------------------------------------

	--------------------------------------------------------------------------
	-- 
	--------------------------------------------------------------------------
	local random_table
	while Global_2013_TwistPower.is_active do
		for index, player in pairs(Global_2013_TwistPower.players) do

			--------------------------------------------------------------------------
			-- 每20秒能量球洗牌
			--------------------------------------------------------------------------
			if Global_2013_TwistPower.current_time % 20 == 0 then
				random_table = Lua_twist_power_get_type_by_rate(4, 1)
				-- 打亂table
				random_table = get_random_table(random_table, #random_table)
				for index, source_base in pairs(Global_2013_TwistPower.source_base) do
					-- 產生能量球
					source_base:produce(random_table[index])
					Sleep(RandRange(1, 2))
				end
				DebugMsg(0, 0, "random power")
			end

			--------------------------------------------------------------------------
			-- 距離太遠
			--------------------------------------------------------------------------
			if Global_2013_TwistPower.crystal:distanceTo(player) >= 250 and Global_2013_TwistPower.crystal:distanceTo(player) < 300 then
				Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_22]", 2 , C_SYSTEM )	--即將超過活動範圍，請回到活動範圍內進行活動。
			elseif Global_2013_TwistPower.crystal:distanceTo(player) >= 300 then
				Global_2013_TwistPower.crystal:scriptMessage(player, "[SC_2013TWISTPOWER_121397_20]", 2  , C_SYSTEM )	--距離活動範圍太遠，取消驅動母體資格。
				player:cancelBuff(624165)
			end

			--------------------------------------------------------------------------
			-- 沒有遊戲buff
			--------------------------------------------------------------------------
			if not player.buff[624165] then
				--母體驅動資格取消，無法再進行活動。
				Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_21]", 1)
				-- 謝謝協助本次扭轉動力活動，能量母體目前轉了
				Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_30]", 2 , C_SYSTEM )
				-- 給予當前獎勵
				Lua_twist_power_reward(player)
				table.remove(Global_2013_TwistPower.players, index)
			end

			--------------------------------------------------------------------------
			-- 斷線
			--------------------------------------------------------------------------
			if not CheckID(player.GUID) then
				table.remove(Global_2013_TwistPower.players, index)
			end
		end

		--------------------------------------------------------------------------
		-- 遊戲人數低於0人結束遊戲
		--------------------------------------------------------------------------
		if #Global_2013_TwistPower.players <= 0 then
			Global_2013_TwistPower.is_active = false
		end

		--------------------------------------------------------------------------
		-- 母體加速buff檢查
		--------------------------------------------------------------------------
		if Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff] and Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff].power >= 99 then
			-- DebugMsg(0, 0, "Explode!!")
			-- power達到100施放爆炸
			Global_2013_TwistPower.matrix:castSpell(Global_2013_TwistPower.matrix, 850618)
			-- 損失所有能量
			Global_2013_TwistPower.matrix:cancelBuff(Global_2013_TwistPower.power_buff)
			Global_2013_TwistPower.matrix:cancelBuff(623965)
		elseif Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff] and Global_2013_TwistPower.matrix.buff[Global_2013_TwistPower.power_buff].power > 89 and not Global_2013_TwistPower.matrix.buff[623965] then
			-- DebugMsg(0, 0, "broken")
			-- power超過90上損壞buff
			Global_2013_TwistPower.matrix:addBuff(623965)
			for index, player in pairs(Global_2013_TwistPower.players) do
				-- 快爆炸提示
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
	-- 玩家獎勵
	--------------------------------------------------------------------------

	-- 提示字串
	Global_2013_TwistPower.crystal:scriptMessage(player , "[SC_2013TWISTPOWER_121397_18]"..Global_2013_TwistPower.cycle_counter.."[SC_2013TWISTPOWER_121397_19]" , 2 , C_SYSTEM )	--4/23狗狗修改，修正字串內容

	--------------------------------------------------------------------------
	-- 母體轉10圈以上
	--------------------------------------------------------------------------
	if Global_2013_TwistPower.cycle_counter >= 9 then
		GiveBodyItem( player.GUID, 240060, 3 )
		GiveBodyItem( player.GUID, 724509, 1 )

	--------------------------------------------------------------------------
	-- 母體轉10圈以上
	--------------------------------------------------------------------------
--	elseif Global_2013_TwistPower.cycle_counter >= 7 then
--		GiveBodyItem( player.GUID, 240060, 3 )

	--------------------------------------------------------------------------
	-- 母體轉7圈以上
	--------------------------------------------------------------------------
	elseif Global_2013_TwistPower.cycle_counter >= 7 then
		GiveBodyItem( player.GUID, 240060, 2 )

	--------------------------------------------------------------------------
	-- 母體轉4圈以上
	--------------------------------------------------------------------------
	elseif Global_2013_TwistPower.cycle_counter >= 1 then
		GiveBodyItem( player.GUID, 240060, 1 )

	--------------------------------------------------------------------------
	-- 其他狀況
	--------------------------------------------------------------------------
	else
		GiveBodyItem( player.GUID, 724509, 1 )
	end

	--------------------------------------------------------------------------
	-- 已經領取過獎勵旗標
	--------------------------------------------------------------------------
	SetFlag(player.GUID, 548009 , 1 )

	--------------------------------------------------------------------------
	-- 記錄完成人次
	--------------------------------------------------------------------------
	DesignLog(player.GUID, 103890, " 2013TwistPower game is over ")

	--------------------------------------------------------------------------
	-- 全勤獎
	--------------------------------------------------------------------------
	Lua_Festival_06_All(player.GUID)
end

function Lua_twist_power_MatrixCollision()

	--------------------------------------------------------------------------
	-- 母體碰撞劇情，碰撞後把玩家身上的能量傳給母體
	--------------------------------------------------------------------------

	--------------------------------------------------------------------------
	-- 檢查遊戲
	--------------------------------------------------------------------------
	if not Global_2013_TwistPower then
--		DebugMsg(0, 0, "[ERROR] TwisterPower : game is not exist.")
		return
	end

	--------------------------------------------------------------------------
	-- 檢查玩家
	--------------------------------------------------------------------------
	local player = AddyPlayer:new(OwnerID())
	if not player.buff[501308] and not player.buff[501309] then
		-- 身上沒有能量
--		DebugMsg(player.GUID, 0, "[INFO] TwistPower : you don't have any power source.")
		return
	end
	--------------------------------------------------------------------------

	local matrix = Global_2013_TwistPower.matrix

	--------------------------------------------------------------------------
	-- 驅動能量
	--------------------------------------------------------------------------
	if player.buff[501308] then
--		DebugMsg(player.GUID, 0, "[INFO] TwistPower : matrix get positive power source.")
		-- 母體缺乏能量
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
			-- 母體增加驅動能量
			matrix:addBuff(Global_2013_TwistPower.power_buff, player.buff[501308].power)
		end
	end

	--------------------------------------------------------------------------
	-- 冷卻能量
	--------------------------------------------------------------------------
	if player.buff[501309] then
--		DebugMsg(player.GUID, 0, "[INFO] TwistPower : matrix get negative power source.")
		-- 母體缺乏能量
		if matrix.buff[508392] then
			matrix:addBuff(508392, player.buff[501309].power)
--			matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_27]", 2, C_SYSTEM)
		else
			-- 降低母體buff
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
			-- 提示母體目前能量
			matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_35]" .. matrix.buff[Global_2013_TwistPower.power_buff].power + 1 .. "[SC_2013TWISTPOWER_121397_25]", 2)	--4/24狗狗加
		end
	else
		for index, player in pairs(Global_2013_TwistPower.players) do
			matrix:scriptMessage(player, "[SC_2013TWISTPOWER_121397_27]", 2, C_SYSTEM)	--4/24狗狗加
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
--	2013 巧藝節 扭轉動力 遊戲開放報名提醒
--------------------------------------------------------------------------
function Lua_twist_power_reminder()
	--------------------------------------------------------------------------
	-- initialize setting
	--------------------------------------------------------------------------
	if not Global_2013_TwistPower_Setting then
		Lua_twist_power_setting()
	end
	--------------------------------------------------------------------------
	-- reminder已經啟動返回
	--------------------------------------------------------------------------
	if Global_2013_TwistPower_Setting.is_reminder_active then
		return
	end

	--------------------------------------------------------------------------
	-- 啟動reminder
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
		--	每小時50分發動
		--------------------------------------------------------------------------
		_hour = GetSystime(1)
		_minute = GetSystime(2)
		_second = GetSystime(0) % 60

		--------------------------------------------------------------------------
		-- 尋找下一場的時間
		--------------------------------------------------------------------------
		for index, hour in pairs(Global_2013_TwistPower_Setting.game_start_hour) do
			-- 這小時沒有場次
			if hour > _hour then
				_next_hour = hour
				break
			-- 這小時有場次
			elseif hour == _hour then
				-- 是否已經錯過場次?
				if _minute < Global_2013_TwistPower_Setting.register_start_time then
					-- 如果剛好在遊戲區間且遊戲還沒開始
					_delay = ((Global_2013_TwistPower_Setting.register_start_time - _minute)*60) - _second
					break
				end
				-- 在場次時間內提示訊息
				if math.abs(_minute - Global_2013_TwistPower_Setting.register_start_time) <= 1 then
					npc:say("[SC_2013TWISTPOWER_121397_12]")
				end
			end
		end

		-- 如果這小時沒有場次，計算到下場次的時間
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