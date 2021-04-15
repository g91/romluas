function LuaS_love_music_dog_npc()										-- 愛默森。羅的對話
	local player = OwnerID()
	local npc = TargetID()

	if CheckScriptFlag(player, 547578) then									-- 今日以參加過的對話
		SetSpeakDetail(player, "[SC_2013MUSIC_121868_01]")
	else													-- 遊戲介紹
		SetSpeakDetail(player, "[SC_2013MUSIC_121868_03]")
		AddSpeakOption(player, npc, "[SC_2013MUSIC_121868_04]", "LuaS_love_music_dog_explain", 0)	-- 當然要參加!
	end
end

function LuaS_love_music_dog_explain()										-- 遊戲解說
	local player = OwnerID()
	local npc = TargetID()

	AddBuff(player, 624151, 1, 86400)										-- 移動關閉對話

	SetSpeakDetail(player, "[SC_2013MUSIC_121868_05]")
	AddSpeakOption(player, npc, "[SC_2013MUSIC_121868_06]", "LuaS_love_music_dog_standby", 0)		-- 馬上開始!
end

function LuaS_love_music_dog_standby()										-- 遊戲前置工作，報名、等待、傳送
	local player = OwnerID()
	local npc = TargetID()

	if CheckBuff(npc, 623546) then										-- 活動中請稍候
		SetSpeakDetail(player, "[SC_2013MUSIC_121868_02]")
	else													-- 遊戲前的相關設定
		get_multiplayer(npc, player, 2, 10, {							-- 設定多人遊戲 get_multiplayer()
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

function LuaS_love_music_dog_regist_success(event)								-- 玩家報名成功後處理
	local npc = event.register
	local player = event.player
	local current_time = event.current_time
	StartClientCountDown(player, current_time, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]")
	DW_CancelMount(player)										-- 下馬
	PlayMotion(player, ruFUSION_ACTORSTATE_NORMAL)
	AddBuff(player, 620265, 0, 86400)
	set_position_to_flag(player, 781262, RandRange(1, 5) - 1, 0, 40, 0, 0)					-- 將玩家傳送到遊戲位置 move flag 781262#5是玩家結束遊戲後的落地位置，要剃除
	DesignLog( Player , 121868 , " 2013Music game is Start " )				--3/28狗狗加，記錄活動報名人次
	CloseSpeak(player)
end

function LuaS_love_music_dog(event)							-- 主要流程函式
	
	local player = event.players							-- 玩家陣列

	local npc = OwnerID()								-- 報名npc

	local game_time = 60								-- 遊戲總時間

	local rookie_mode = {								-- 難易度菜鳥等級的設定
		limit = 0,
		delay = {30},								-- 每次出球延遲時間
		amount = {3},								-- 每次出球球數
		music_note_id = {117149, 117151},					-- 每次出球球種
		speed_buff = {504489}							-- 音符球的加速buff
	}

	local amateur_mode = {								-- 難易度業餘等級的設定
		limit = 30,
		delay = {10},
		amount = {3},
		music_note_id = {117149, 117150, 117151, 117148},
		speed_buff = {504490}
	}

	local expert_mode = {								-- 難易度專家等級的設定
		limit = 50,
		delay = {5, 10, 20},							-- 每次出球延遲時間，隨機選取一個數值
		amount = {3, 5},							-- 每次出球球數，隨機選取一個數值	--3/20狗狗改，減少出球同時增加5分球出球設定
		music_note_id = {117149, 117150, 117151, 117148},			--3/20狗狗改，刪除5分球，5分球加在(special_mode)
		speed_buff = {504489, 504490, 504491}
	}

	local special_mode = {								-- 3/20狗狗加，難易度專家等級的5分球設定
		limit = 50,
		delay = {20},							-- 每次出球延遲時間
		amount = {1},							-- 每次出球球數
		music_note_id = {117152},					--出球種類：5分球
		speed_buff = {504491}
	}

	local buff = {									-- 遊戲用buff，記分用和技能用
		score = 500984,
		skill = 624012
	}

	local activiting_buff = 623546							-- 遊戲中禁止報名buff

	local quest_complete = 547578							-- 完成任務的flag

	local flag = 781262								-- 活動用move flag

	AddBuff(npc, activiting_buff, 1, 86400)						-- 遊戲開始，npc上遊戲中禁止報名buff

	for time = 1, 0, -1 do								-- 遊戲前倒數計時
		if time == 0 then
--			Say(npc, "game start!")
		else
--			Say(npc, time)
		end
		Sleep(10)
	end

	local activiting = true											-- 遊戲進行狀況 true = 進行中

	local music_note = {}											-- table，存放音符球的guid

	for index = 1, #player do										-- 遊戲開始前對每一位玩家的前置設定
		if CheckBuff(player[index], buff["score"]) then CancelBuff(player[index], buff["score"]) end	-- 萬一玩家身上有計分buff，取消計分buff
		if CheckBuff(player[index], 620265) then CancelBuff(player[index], 620265) end			-- 解除定身

		AddBuff(player[index], buff["skill"], 0, game_time)						-- 上所有活動需要的buff

		WriteRoleValue(player[index], EM_RoleValue_Register1, npc)					-- 記錄npc的guid，為了取得記錄在npc身上的其他玩家guid
		WriteRoleValue(npc, EM_RoleValue_Register + index, player[index])
	end

	while activiting do											-- 遊戲迴圈 start，如果activiting = true，持續進行遊戲
		local player_count = 0										-- 記錄目前玩家人數
		local power = 0											-- 記錄玩家得分數
		for index = 1, #player do												--檢察玩家身上的buff狀況，判斷是否遊戲進行中
			if CheckBuff(player[index], buff["skill"]) then
				player_count = player_count + 1
				power = BuffInfo(player[index], Lua_BuffPosSearch(player[index], buff["score"]), EM_BuffInfoType_Power)	-- 取得記分buff的power數
				local buff_time = BuffInfo(player[index], Lua_BuffPosSearch(player[index], buff["skill"]), EM_BuffInfoType_Time)
				if buff_time < 10 then											-- 遊戲結束前倒數提示
					ScriptMessage(npc, player[index], 1, "[SC_2013MUSIC_121868_SYSTEM_02] " .. buff_time .. "[SYS_SECOND]", 0)
				end
			end
		end
		if player_count == 0 then												-- 如果玩家人數 == 0 結束遊戲
			activiting = false 
			break
		end

		if power >= expert_mode["limit"] then											-- 如果power大於等於level_3的limit進入level_3
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(expert_mode, flag))
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(special_mode, flag))			--3/20狗狗加，將5分球加入出球順序中
		elseif power >= amateur_mode["limit"] then										-- 如果power大於等於level_2的limit進入level_2
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(amateur_mode, flag))
		else															-- 如果都沒有進入level_1
			table.inserttable(music_note, LuaS_love_music_dog_create_music_note(rookie_mode, flag))
		end
		LuaS_love_music_dog_clean_music_note(music_note, flag)									-- 每次loop執行清除沒用音符球的函式
	end																-- 遊戲迴圈 end

	for i, v in pairs(music_note) do				-- 清除剩餘音符球
		DelObj(v)
	end

	CancelBuff(npc, activiting_buff)				-- 清除遊戲中禁止報名buff

end

function LuaS_love_music_dog_magic_check()			-- magic object
	if CheckBuff(OwnerID(), 500985) then			--  {624120, 624121, 624122, 624123, 500985
		return false					--   624038, 504696, 504697, 504698, 504699的施法檢查
	end							-- 如果有500985(暈眩音符buff)施法失敗
end

function LuaS_love_music_dog_magic_do()			-- script of  magic object 624038，飛到do,re,mi,fa,so音階的技能
	set_position_to_flag(OwnerID(), 781262, 0, 0, 30, 0, 0)	-- set_position_to_flag(GUID, flag_group, flag_id, x修正值, y修正值, z修正值, direction修正值)
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

function LuaS_love_music_dog_note_casting()			-- 音符球產出後持續施放法術
	local note = OwnerID()
	local id = ReadRoleValue(note, EM_RoleValue_OrgID)
	local magic = {}
	magic[117149] = 850685				-- do re mi fa so各種音符球持續施放的法術
	magic[117150] = 850686
	magic[117151] = 850687
	magic[117152] = 850688
	magic[117148] = 850689

	while true do
		SysCastSpellLv(note, note, magic[id], 0 )
		sleep(1)					-- 0.1秒一次
	end
end

function LuaS_love_music_dog_note_check()									-- 音符產出後持續施放法術的檢查
	DebugMsg(OwnerID(), 0, "function LuaS_love_music_dog_note_check()")
	local player = TargetID()
	local note = OwnerID()
	if CheckBuff( player , 500985 ) == true then	--3/18狗狗加，檢查玩家有暈眩BUFF時，不給分
		return false		
	elseif ReadRoleValue(note, EM_RoleValue_Register1) ~= 1 and CheckBuff(player, 624012) then			-- 確定音符球還沒發動過，角色有活動技能return true
		return true
	else
		return false
	end
end

function LuaS_love_music_dog_catch_note(score)									-- 音符產出後持續施放法術的得分效果，並公告得分
	DebugMsg(OwnerID(), 0, "LuaS_love_music_dog_catch_note()")
	local player = TargetID()
	local note = OwnerID()
	local npc = ReadRoleValue(player, EM_RoleValue_Register1)

	if score == 0 then											-- 如果score = 0代表暈眩，上falling動作
		PlayMotion(player, ruFUSION_ACTORSTATE_FALLING)
		return
	end

	local is_single = true
	if ReadRoleValue(npc, EM_RoleValue_Register2) ~= 0 and ReadRoleValue(npc, EM_RoleValue_Register3) ~= 0 then
		if CheckBuff(ReadRoleValue(npc, EM_RoleValue_Register2), 624012) and CheckBuff(ReadRoleValue(npc, EM_RoleValue_Register3), 624012) then
			is_single = false
		end
	end

	for index = 1, 2 do											-- 讀取npc上的報名玩家guid
		local player_guid = ReadRoleValue(npc, EM_RoleValue_Register + index)
		if player_guid ~= 0 then									-- 如果不是0 (代表有玩家報名)
			AddBuff(player_guid, 500984, score - 1, 86400)					-- 所有玩家加分
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
		AddBuff(player_guid,501118, -1, -1)							-- 得分特效
	end

	DelObj(note)												-- 發動成功後刪除

	WriteRoleValue(note, EM_RoleValue_Register1, 1)								-- 成功施放記號
end

function LuaS_love_music_dog_create_music_step()								-- 專門生產白色音階的函式。該函式不會執行，請在配置玩move flag後在遊戲內執行/gm ? runplot LuaS_love_music_dog_create_music_step
	music_step_id = 115560

	flag = 781262

	local result = {}													-- 存放產出的白色音階的guid

	for index = 0, GetMoveFlagCount(flag) -1 , 1 do									-- 取得活動用moveflag各個id
		local _obj = create_object(										-- 建造白色音階 create_object( OrgID, x, y, z, direction, { mode_type, boolean } )
			music_step_id,
			GetMoveFlagValue(flag, index, EM_RoleValue_X),
			GetMoveFlagValue(flag, index, EM_RoleValue_Y) + 30,						-- 為了讓音階懸浮所以增加高度
			GetMoveFlagValue(flag, index, EM_RoleValue_Z),
			GetMoveFlagValue(flag, index, EM_RoleValue_Dir),
			{EM_SetModeType_Obstruct, true,								-- 開啟碰撞
			 EM_SetModeType_Gravity, false}								-- 關閉重力
		)
		table.insert(result, _obj)											-- 將剛剛生產的白色音階丟入result
	end

	return result													-- 返回result
end


function LuaS_love_music_dog_create_music_note(level_mode, flag)							-- 專門生產音符球的函式

	local result = {}													-- 存放產出的音符球的guid

	local _delay = level_mode["delay"][RandRange(1, #level_mode["delay"])]						-- 每次產出音符球的間隔時間

	local _amount = level_mode["amount"][RandRange(1, #level_mode["amount"])]					-- 每次產出音符球的數量

	local angle = GetMoveFlagValue(flag, 0, EM_RoleValue_Dir) / 180 * math.pi + math.pi / 2

	for times = 1, _amount do											-- 生產音符球
		local _music_note_id = level_mode["music_note_id"][RandRange(1, #level_mode["music_note_id"])]		-- 要產出的音符球OrgID
		local _index = RandRange(1, GetMoveFlagCount(flag)) - 1							-- 要產出的音符球所在的moveflag的id
		local _obj = create_object(										-- 建造音符球 create_object( OrgID, x, y, z, direction, { mode_type, boolean } )
			_music_note_id,
			GetMoveFlagValue(flag, _index, EM_RoleValue_X) + math.sin(angle) * 50,
			GetMoveFlagValue(flag, _index, EM_RoleValue_Y) + 35,						-- 根據move flag修正高度
			GetMoveFlagValue(flag, _index, EM_RoleValue_Z) + math.cos(angle) * 50,						-- 根據move flag修正距離
			GetMoveFlagValue(flag, _index, EM_RoleValue_Dir),
			{EM_SetModeType_Gravity, false}								-- 關閉音符球的重力
		)
		local move_time = Move(										-- 讓音符球往玩家移動
			_obj,
			GetMoveFlagValue(flag, _index, EM_RoleValue_X) - math.sin(angle) * 20,
			GetMoveFlagValue(flag, _index, EM_RoleValue_Y) + 35,
			GetMoveFlagValue(flag, _index, EM_RoleValue_Z) - math.cos(angle) * 20
		)
		MoveToFlagEnabled(_obj, false)										-- 關閉巡邏，避免音符球往回跑

		local speed_buff = level_mode["speed_buff"][RandRange(1, #level_mode["speed_buff"])]			-- 隨機選擇一種加速速度
		WriteRoleValue(_obj, EM_RoleValue_Register1, GetMoveFlagValue(flag, _index, EM_RoleValue_X) - math.sin(angle) * 20)	-- 記錄目標X值
		AddBuff(_obj, speed_buff, 0, 3600)									-- 加速buff，沒有的話非很慢，分數很難拿的高

		table.insert(result, _obj)											-- 把剛剛產出的音符球guid塞入result
		Sleep(6)												-- 間隔0.6秒產出下一顆
	end

	Sleep(_delay)													-- 下一波音符球產出前的間隔時間

	return result													-- 返回result
end

function LuaS_love_music_dog_clean_music_note(music_note, flag)							-- 清除沒用的音符球
	for i, v in pairs(music_note) do											-- 檢查所有音符球
		if CheckID(v) then
			if ReadRoleValue(v, EM_RoleValue_Register1) == ReadRoleValue(v, EM_RoleValue_X) then	-- 如果目標X值就砍掉
				DelObj(v)
				table.remove(music_note, i)
			end
		else
				table.remove(music_note, i)
		end
	end
end

--==================================
--		以下，愛樂節活動(3/27狗狗整合加入)
--==================================
function Lua_jiyi_Npc_121868_04() --給予獎勵劇情
	local Player = OwnerID() 
	local Npc = TargetID()
	local MusicBuff = { 500984 , 500985 } --愛樂音符 , 守球員狀態
	local MusicFlag = 547578 --領過獎勵
	local BuffLv =  FN_CountBuffLevel( Player , MusicBuff[1] ) --檢查玩家身上BUFF
	local reward = { 204457 , 724509 } --樂譜、活動藥水
	local String = "[SC_2013MUSIC_121868_07]" --感謝參與本次活動，您在本次活動中獲得

	String = String..(BuffLv+1).."[SC_2013MUSIC_121868_13]"
	if BuffLv <= 0 then --BuffLv顯示1
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --感謝參與本次活動，您在本次活動中獲得活動藥水
		GiveBodyItem( Player , reward[2] , 1 ) --給一個藥水
	elseif BuffLv >= 1 and BuffLv < 39 then --BuffLv2~39
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --感謝參與本次活動，您在本次活動中獲得樂譜
		GiveBodyItem( Player , reward[1] , 1 ) --給一張樂譜
	elseif BuffLv >= 39 and BuffLv < 69 then --BuffLv40~69
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --感謝參與本次活動，您在本次活動中獲得樂譜
		GiveBodyItem( Player , reward[1] , 3 ) --給3張樂譜
	elseif BuffLv >= 69 and BuffLv < 79 then --BuffLv70~79
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --感謝參與本次活動，您在本次活動中獲得樂譜
		GiveBodyItem( Player , reward[1] , 5 ) --給5張樂譜
	elseif BuffLv >= 79 then --BuffLv顯示>=80
		ScriptMessage( Npc , Player , 2 , String , C_SYSTEM ) --感謝參與本次活動，您在本次活動中獲得樂譜
		GiveBodyItem( Player , reward[1] , 5 ) --給5張樂譜
		GiveBodyItem( Player , reward[2] , 1 ) --給一個藥水			
	end	
	CancelBuff( Player , MusicBuff[1] )
	CancelBuff( Player , MusicBuff[2] )	
	SetFlag( Player , MusicFlag , 1 ) -- 已經領取過獎勵旗標
	DesignLog( Player , 1218681 , " 2013Music game is over " )	--記錄完成人次
	Lua_Festival_05_All(Player) 	--全勤獎
end
------------------------------------------------------------------------------------------測試指令
function Lua_jiyi_2013Music_test_01(lv) --測試分數
	local Player = OwnerID()
	local BuffLv =  FN_CountBuffLevel( Player , 500984 ) --檢查玩家身上BUFF
	AddBuff( Player , 500984 , lv , 60 )
end	
