-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	偉大的中央控制器！
-----------------------------------------------------------------

-----------------------------------------------------------------
--	光龍產生劇情
-----------------------------------------------------------------
function Lua_122201_CreateScript()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	-----------------------------------------------------------------
	--	初始化等待
	-----------------------------------------------------------------
	Debuglog(2, "[Bellatia Duplication] <delay> wait for Lua_BellatiaDuplication_initialize_global() loaded ...")
	while not Lua_BellatiaDuplication_initialize_global do Sleep(10) end
	Debuglog(2, "[Bellatia Duplication] Lua_BellatiaDuplication_initialize_global() loaded")

	-----------------------------------------------------------------
	--	BellatiaDuplication主全域，開機後自動執行一次
	-----------------------------------------------------------------
	if not Global_BellatiaDuplication then Lua_BellatiaDuplication_initialize_global() end

	-----------------------------------------------------------------
	--	初始化等待
	-----------------------------------------------------------------
	Debuglog(2, "[Bellatia Duplication] <delay> wait for Lua_BellatiaDuplication_initialize_local() loaded ...")
	while not Lua_BellatiaDuplication_initialize_local and not Global_BellatiaDuplication.is_active do Sleep(10) end
	Debuglog(2, "[Bellatia Duplication] Lua_BellatiaDuplication_initialize_local() loaded")

	-----------------------------------------------------------------
	--	BellatiaDuplication區域全域，各區建立後執行
	-----------------------------------------------------------------
	if not Global_BellatiaDuplication[room_id] then Lua_BellatiaDuplication_initialize_local(room_id) end

	-----------------------------------------------------------------
	--	註冊到全域
	-----------------------------------------------------------------
	BellatiaDuplication_register(AddyQuestFighter:new(OwnerID()), "pangkorrams")
	Lua_BellatiaDuplication_initialize_npc_pangkorrams(room_id)
end

-----------------------------------------------------------------
--	設定
-----------------------------------------------------------------
function Lua_BellatiaDuplication_setting()
	Global_BellatiaDuplication:log("setting -> Lua_BellatiaDuplication_setting()")

	-----------------------------------------------------------------
	-- 	開發，每次初始化設定
	-----------------------------------------------------------------
	Global_BellatiaDuplication.alpha = true

	-----------------------------------------------------------------
	-- 	測試，顯示debug訊息
	-----------------------------------------------------------------
	Global_BellatiaDuplication.beta = true

	-----------------------------------------------------------------
	-- 	延遲
	-----------------------------------------------------------------
	Global_BellatiaDuplication.delay = 0.1

	-----------------------------------------------------------------
	-- 	副本儲存點旗標
	-----------------------------------------------------------------
	Global_BellatiaDuplication.save_point_flag = AddyFlagGroup:new(781282)

	-----------------------------------------------------------------
	--	NPC初始化站位旗標
	-----------------------------------------------------------------
	Global_BellatiaDuplication.npc_initial_position_flag = AddyFlagGroup:new(781312)

	-----------------------------------------------------------------
	--	反派角色初始化站位旗標
	-----------------------------------------------------------------
	Global_BellatiaDuplication.boss_initial_position_flag = AddyFlagGroup:new(781313)

	-----------------------------------------------------------------
	--	副本難度
	-----------------------------------------------------------------
	Global_BellatiaDuplication.types = {}
	Global_BellatiaDuplication.types[154] = "hard"
	Global_BellatiaDuplication.types[155] = "normal"
	Global_BellatiaDuplication.types[156] = "easy"
	Global_BellatiaDuplication.zone_id = ReadRoleValue(OwnerID(), EM_RoleValue_ZoneID)
	Global_BellatiaDuplication.type = Global_BellatiaDuplication.types[Global_BellatiaDuplication.zone_id]
	-----------------------------------------------------------------
	--	垃圾冰orgid
	-----------------------------------------------------------------
	Global_BellatiaDuplication.ally_type = {103291, 103357, 103358, 103359}
	Global_BellatiaDuplication.enemy_type = {107885, 107886, 107887, 107888, 107889, 107890}

	if Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication.ally_type = {108013, 108014, 108015, 108016}
		Global_BellatiaDuplication.enemy_type = {108035, 108036, 108037, 108038, 108039, 108040}
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication.ally_type = {108077, 108078, 108079, 108080}
		Global_BellatiaDuplication.enemy_type = {108100, 108101, 108102, 108103, 108104, 108105}
	end

	-----------------------------------------------------------------
	--	音樂設定
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_music_setting()
end

-----------------------------------------------------------------
--	初始化全域
-----------------------------------------------------------------
function Lua_BellatiaDuplication_initialize_global()
	Global_BellatiaDuplication = AddySystem:new("Bellatia Duplication")
	Global_BellatiaDuplication:log("initialize global -> Lua_BellatiaDuplication_initialize_global()")

	Lua_BellatiaDuplication_setting()

	-----------------------------------------------------------------
	--	全域
	-----------------------------------------------------------------
	Global_BellatiaDuplication.search_player_queue = {}
	Global_BellatiaDuplication.search_npc_queue = {}
	Global_BellatiaDuplication.is_active = false

	-----------------------------------------------------------------
	--	啟動全域loop
	-----------------------------------------------------------------
	Global_BellatiaDuplication.handler = AddyNpc:new(AddyGUIDMaker:new():produce())
	Global_BellatiaDuplication.handler:beginPlot("Lua_BellatiaDuplication_global_loop")

	-----------------------------------------------------------------
	--	初始化小宏全域
	-----------------------------------------------------------------
	--lua_initialset_instance26_globaldata()
end

-----------------------------------------------------------------
--	全域loop
-----------------------------------------------------------------
function Lua_BellatiaDuplication_global_loop()
	Global_BellatiaDuplication:log("active global loop -> Lua_BellatiaDuplication_global_loop()")
	Global_BellatiaDuplication.is_active = true

	-----------------------------------------------------------------
	--	全域loop用來取各層玩家資料
	--	為了避免多個層同時使用SetSeachPlayer和GetSearchResult造成問題，每一層要求玩家資料時會在這個loop排隊輪流取玩家資料。
	-----------------------------------------------------------------

	-----------------------------------------------------------------
	--	暫存變數
	-----------------------------------------------------------------
	local amount = 0
	local room_id = 0
	local _players = {}
	local _guid = 0
	local _kick_out = {}
	local is_match = false

	while Global_BellatiaDuplication do
		-----------------------------------------------------------------
		--	取玩家資料
		-----------------------------------------------------------------
		if #Global_BellatiaDuplication.search_player_queue > 0 then
		--	取出請求資料
			room_id = table.remove(Global_BellatiaDuplication.search_player_queue, 1)
		--	取玩家資料
			amount = SetSearchAllPlayer(room_id)
		--	更新玩家資料
			for index = 1, amount do
				_guid = GetSearchResult()
				is_match = false
				for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
					if player.GUID == _guid then is_match = true break end
				end
				if not is_match then table.insert(Global_BellatiaDuplication[room_id].players, AddyPlayer:new(_guid)) end
			end
			for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
				if not CheckID(player.GUID) or player.is_player == 0 or player.voc == 0 or player.room_id ~= room_id or player.zone_id ~= Global_BellatiaDuplication.zone_id then
					table.insert(_kick_out, player)
				end
			end
			for kick_out_player_index, kick_out_player in pairs(_kick_out) do
				for player_index, player in pairs(Global_BellatiaDuplication[room_id].players) do
					if kick_out_player == player then
						if player.music_player then
							Global_BellatiaDuplication[room_id].music_listener:remove(player.music_player)
							player.music_player:stop()
							player:playBGM()
						end
						table.remove(Global_BellatiaDuplication[room_id].players, player_index)
						break
					end
				end
			end
		end

		-----------------------------------------------------------------
		--	停止npc攻擊
		-----------------------------------------------------------------
		if #Global_BellatiaDuplication.search_npc_queue > 0 then
			Global_BellatiaDuplication:debug("search npc, queue : " .. #Global_BellatiaDuplication.search_npc_queue)
			room_id = table.remove(Global_BellatiaDuplication.search_npc_queue, 1)
			Global_BellatiaDuplication:debug("search npc at room_id : " .. room_id)
			amount = SetSearchAllNPC(room_id)
			Global_BellatiaDuplication:debug("search result amount of npc : " .. amount)
			for index = 1, amount do
				_npc = AddyFighter:new(GetSearchResult())
				_npc:stopAttack()
				_npc:stopMove()
			end
		end

		-----------------------------------------------------------------
		--	監聽各層狀態
		-----------------------------------------------------------------
		for room_id, room_data in ipairs(Global_BellatiaDuplication) do
		--	音樂
			Global_BellatiaDuplication[room_id].music_listener:start()
		--	副本是否重置
			if not CheckID(Global_BellatiaDuplication[room_id].pangkorrams.GUID) then 
				Global_BellatiaDuplication[room_id] = nil
				Global_BellatiaDuplication:debug("room_id " .. room_id .. " destroy")
				Global_BellatiaDuplication:log("room_id " .. room_id .. " destroy")
			end
		end

		-----------------------------------------------------------------
		--	延遲
		-----------------------------------------------------------------
		Global_BellatiaDuplication:sleep()
	end
	DelObj(OwnerID())
end

-----------------------------------------------------------------
--	初始化區域全域
-----------------------------------------------------------------
function Lua_BellatiaDuplication_initialize_local(room_id)
	if not room_id then return end
	Global_BellatiaDuplication:log("initialize local -> Lua_BellatiaDuplication_initialize_local(" .. room_id .. ")")

	-----------------------------------------------------------------
	--	room data
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id] = {}
	Global_BellatiaDuplication[room_id].players = {}
	Global_BellatiaDuplication[room_id].music_listener = AddyMusicListener:new()

	-----------------------------------------------------------------
	--	儲存點更新紀錄
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].save_point_record = {1, 0}
	Global_BellatiaDuplication[room_id].save_point = 1
end

-----------------------------------------------------------------
--	初始化阻擋門
-----------------------------------------------------------------
function Lua_BellatiaDuplication_initialize_door(room_id)
	Global_BellatiaDuplication:debug("initialize door -> Lua_BellatiaDuplication_initialize_door(" .. room_id .. ")")

	-----------------------------------------------------------------
	--	初始化阻擋門
	-----------------------------------------------------------------
	--	入口門
	if Global_BellatiaDuplication[room_id].save_point < 2 then Global_BellatiaDuplication[room_id].door_entrance:addToPartition(room_id)
	else Global_BellatiaDuplication[room_id].door_entrance:delFromPartition(room_id) end

	--	一王前機關
	--	不重置

	--	一王前門
	if Global_BellatiaDuplication[room_id].save_point > 2 then
		Global_BellatiaDuplication[room_id].door_before_boss1.show = false
--		Global_BellatiaDuplication[room_id].door_before_boss1.hide = true
		Global_BellatiaDuplication[room_id].door_before_boss1.obstruct = false
	else
		Global_BellatiaDuplication[room_id].door_before_boss1.show = true
--		Global_BellatiaDuplication[room_id].door_before_boss1.hide = false
		Global_BellatiaDuplication[room_id].door_before_boss1.obstruct = true
	end

	--	一王後門
	if Global_BellatiaDuplication[room_id].save_point < 3 then
		Global_BellatiaDuplication[room_id].door_after_boss1:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_END)
		Global_BellatiaDuplication[room_id].door_after_boss1.obstruct = true
	else
		Global_BellatiaDuplication[room_id].door_after_boss1:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		Global_BellatiaDuplication[room_id].door_after_boss1:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
		Global_BellatiaDuplication[room_id].door_after_boss1.obstruct = false
	end

	--	二王前門
	if Global_BellatiaDuplication[room_id].save_point > 4 then
		Global_BellatiaDuplication[room_id].door_before_boss2.show = false
--		Global_BellatiaDuplication[room_id].door_before_boss2.hide = true
		Global_BellatiaDuplication[room_id].door_before_boss2.obstruct = false
	else
		Global_BellatiaDuplication[room_id].door_before_boss2.show = true
--		Global_BellatiaDuplication[room_id].door_before_boss2.hide = false
		Global_BellatiaDuplication[room_id].door_before_boss2.obstruct = true
	end

	--	二王後門，密室前門
	if Global_BellatiaDuplication[room_id].save_point > 4 then
		Global_BellatiaDuplication[room_id].door_after_boss2:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		Global_BellatiaDuplication[room_id].door_after_boss2:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
		Global_BellatiaDuplication[room_id].door_after_boss2.obstruct = false
		Global_BellatiaDuplication[room_id].door_secret_entrance:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		Global_BellatiaDuplication[room_id].door_secret_entrance:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
		Global_BellatiaDuplication[room_id].door_secret_entrance.obstruct = false
	else
		Global_BellatiaDuplication[room_id].door_after_boss2:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_END)
		Global_BellatiaDuplication[room_id].door_after_boss2.obstruct = true
		Global_BellatiaDuplication[room_id].door_secret_entrance:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_END)
		Global_BellatiaDuplication[room_id].door_secret_entrance.obstruct = true
	end

	--	密室後門
	if Global_BellatiaDuplication[room_id].save_point > 6 then
		Global_BellatiaDuplication[room_id].door_secret_exit:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		Global_BellatiaDuplication[room_id].door_secret_exit:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
		Global_BellatiaDuplication[room_id].door_secret_exit.obstruct = false
	else
		Global_BellatiaDuplication[room_id].door_secret_exit:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_END)
		Global_BellatiaDuplication[room_id].door_secret_exit.obstruct = true
	end

	--	四王前門
	if Global_BellatiaDuplication[room_id].save_point > 8 then Global_BellatiaDuplication[room_id].door_before_boss4:delFromPartition(room_id)
	else Global_BellatiaDuplication[room_id].door_before_boss4:addToPartition(room_id) end

	--	四王後門
	if Global_BellatiaDuplication[room_id].save_point > 8 then
		Global_BellatiaDuplication[room_id].door_after_boss4:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		Global_BellatiaDuplication[room_id].door_after_boss4:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
	else Global_BellatiaDuplication[room_id].door_after_boss4:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_END) end

	--	五王前門
	if Global_BellatiaDuplication[room_id].save_point > 10 then Global_BellatiaDuplication[room_id].door_before_boss5:delFromPartition(room_id)
	else Global_BellatiaDuplication[room_id].door_before_boss5:addToPartition(room_id) end
end

-----------------------------------------------------------------
--	初始化到儲存點
-----------------------------------------------------------------
function Lua_BellatiaDuplication_initialize_save_point()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:debug("initialize duplication for save point -> Lua_BellatiaDuplication_initialize_save_point(" .. Global_BellatiaDuplication[room_id].save_point .. ")")
--	if not Lua_BellatiaDuplication_change_save_point(room_id, save_point) then return end

	if not Global_BellatiaDuplication.search_npc_queue then Global_BellatiaDuplication.search_npc_queue = {} end
	table.insert(Global_BellatiaDuplication.search_npc_queue, room_id)

	-----------------------------------------------------------------
	--	初始化阻擋門
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_initialize_door(room_id)

	-----------------------------------------------------------------
	--	初始化npc
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_initialize_npc(room_id)

	-----------------------------------------------------------------
	--	初始化player
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_initialize_players(room_id)

	-----------------------------------------------------------------
	--	初始化環境
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].save_point == 4 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_SecondAdvance_drama2") end
	if Global_BellatiaDuplication[room_id].save_point > 8 then Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama8") end
end

function Lua_BellatiaDuplication_initialize_players(room_id)
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		Lua_BellatiaDuplication_initialize_player(room_id, player)
	end
end
function Lua_BellatiaDuplication_initialize_player(room_id, player)
	if Global_BellatiaDuplication[room_id].save_point == 6 then player:addBuff(624292) else player:cancelBuff(624292) end
end

-----------------------------------------------------------------
--	更新副本全域資訊
-----------------------------------------------------------------
function Lua_BellatiaDuplication_update_global(room_id)
	Lua_BellatiaDuplication_update_players(room_id)
	Lua_BellatiaDuplication_update_save_point(room_id)
	Lua_BellatiaDuplication_update_music(room_id)
end

-----------------------------------------------------------------
--	更新儲存點
-----------------------------------------------------------------
function Lua_BellatiaDuplication_update_save_point(room_id)
	-----------------------------------------------------------------
	--	搜尋30碼內的儲存點
	-----------------------------------------------------------------
	for index = 1, #Global_BellatiaDuplication.save_point_flag do
		if Global_BellatiaDuplication.save_point_flag[index]:distanceTo(Global_BellatiaDuplication[room_id].pangkorrams) <= 30 and index > Global_BellatiaDuplication[room_id].save_point then
			Global_BellatiaDuplication:debug("search save point : " .. index)
			Lua_BellatiaDuplication_change_save_point(room_id, index)
		end
	end
	Global_BellatiaDuplication:debug("UPDATE > save point : " .. Global_BellatiaDuplication[room_id].save_point)
end

-----------------------------------------------------------------
--	更新玩家資訊
-----------------------------------------------------------------
function Lua_BellatiaDuplication_update_players(room_id)
	table.insert(Global_BellatiaDuplication.search_player_queue, room_id)
end

-----------------------------------------------------------------
--	修改儲存點
-----------------------------------------------------------------
function Lua_BellatiaDuplication_change_save_point(room_id, save_point)
	-----------------------------------------------------------------
	--	alpha狀態下不檢查儲存點合法性
	-----------------------------------------------------------------
	if Global_BellatiaDuplication.alpha then
		Global_BellatiaDuplication[room_id].save_point = save_point
		return true
	end

	if Global_BellatiaDuplication[room_id].save_point >= save_point then return end

	-----------------------------------------------------------------
	--	比對 save_point 和 save_point_record的合法性
	-----------------------------------------------------------------
	for index, _save_point in pairs(Global_BellatiaDuplication[room_id].save_point_record) do
	--	如果儲存點沒有依序增加即為不合法儲存點
		if save_point ~= _save_point + index then
			Global_BellatiaDuplication:debug("ERROR > illegal save point record")
	--		若儲存點不合法重置玩家到上一個合法儲存點
			Global_BellatiaDuplication[room_id].save_point = _save_point
			Lua_BellatiaDuplication_fail()
			return false
		end
	end

	-----------------------------------------------------------------
	--	合法儲存點加入儲存點紀錄表
	-----------------------------------------------------------------
	table.insert(Global_BellatiaDuplication[room_id].save_point_record, 1, save_point)

	-----------------------------------------------------------------
	--	修改儲存點
	-----------------------------------------------------------------
	Global_BellatiaDuplication[room_id].save_point = save_point
	--	更新音樂
	Lua_BellatiaDuplication_update_music(room_id)

	Global_BellatiaDuplication:debug("change save point, save_point_record = { " .. table.concat(Global_BellatiaDuplication[room_id].save_point_record, ", ") .. "}")
	return true
end

-----------------------------------------------------------------
--	副本狀態
-----------------------------------------------------------------
function Lua_BellatiaDuplication_change_status(room_id, _status)
	-----------------------------------------------------------------
	--	副本尚未建立
	-----------------------------------------------------------------
	if not Global_BellatiaDuplication[room_id] then Global_BellatiaDuplication:debug("ERROR > room_id error : function Lua_BellatiaDuplication_status( room_id : number, status : string )") return false end

	-----------------------------------------------------------------
	--	錯誤的狀態
	-----------------------------------------------------------------
	if type(_status) ~= "string" then Global_BellatiaDuplication:debug("ERROR > argument error : function Lua_BellatiaDuplication_status( room_id : number, status : string )") return false end
	if _status ~= "standby" and _status ~= "advance" and _status ~= "boss" and _status ~= "fail" and _status ~= "success" and _status ~= "drama" then Global_BellatiaDuplication:debug("ERROR > unkown status : status : standby, advance, boss, fail, success, drama") return false end

	Global_BellatiaDuplication[room_id].status = _status

	Global_BellatiaDuplication.debug("[BellatiaDuplication] <info> change status : " .. Global_BellatiaDuplication[room_id].status)

	-----------------------------------------------------------------
	--	狀態轉換處理，副本攻略中關閉對話
		if Global_BellatiaDuplication[room_id].status == "advance" or Global_BellatiaDuplication[room_id].status == "boss" or Global_BellatiaDuplication[room_id].status == "drama" then
			Global_BellatiaDuplication.debug("disable npc's quest")
			Global_BellatiaDuplication[room_id].pangkorrams.disable_quest = true
			Global_BellatiaDuplication[room_id].morrok.disable_quest = true
			Global_BellatiaDuplication[room_id].jill.disable_quest = true
			Global_BellatiaDuplication[room_id].kangersy.disable_quest = true
			Global_BellatiaDuplication[room_id].cassam.disable_quest = true
		else
			Global_BellatiaDuplication.debug("able npc's quest")
			Global_BellatiaDuplication[room_id].pangkorrams.disable_quest = false
			Global_BellatiaDuplication[room_id].morrok.disable_quest = false
			Global_BellatiaDuplication[room_id].jill.disable_quest = false
			Global_BellatiaDuplication[room_id].kangersy.disable_quest = false
			Global_BellatiaDuplication[room_id].cassam.disable_quest = false
		end
	-----------------------------------------------------------------
end
function Lua_BellatiaDuplication_check_status(room_id, _status)
	-----------------------------------------------------------------
	--	副本尚未建立
	-----------------------------------------------------------------
	if not room_id then Global_BellatiaDuplication:debug("ERROR > room_id error : function Lua_BellatiaDuplication_status( room_id : number, status : string )") return false end

	-----------------------------------------------------------------
	--	錯誤的狀態
	-----------------------------------------------------------------
	if type(_status) ~= "string" then Global_BellatiaDuplication:debug("ERROR > argument error : function Lua_BellatiaDuplication_status( room_id : number, status : string )") return false end
	if _status ~= "standby" and _status ~= "advance" and _status ~= "boss" and _status ~= "fail" and _status ~= "success" and _status ~= "drama" then Global_BellatiaDuplication:debug("ERROR > unkown status : status : standby, advance, boss, fail, success, drama") return false end

	return Global_BellatiaDuplication[room_id].status == _status
end

-----------------------------------------------------------------
--	攻略失敗
-----------------------------------------------------------------
function Lua_BellatiaDuplication_fail()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	local save_point_flag = Global_BellatiaDuplication.save_point_flag

	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[SC_BELLATIADUPLICATION_FAIL]", 1) end
	Global_BellatiaDuplication:sleep(2)

	Lua_BellatiaDuplication_initialize_save_point(save_point)

	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		player:beginPlot("Lua_BellatiaDuplication_backtosavepoint")
	end
end

-----------------------------------------------------------------
--	傳送回儲存點
-----------------------------------------------------------------
function Lua_BellatiaDuplication_backtosavepoint()
	Global_BellatiaDuplication:debug("player wait for revive")
	local player = AddyPlayer:new(OwnerID())
	local room_id = player.room_id
	local save_point = Global_BellatiaDuplication[room_id].save_point
	local save_point_flag = Global_BellatiaDuplication.save_point_flag
	while player.is_dead == 1 do Global_BellatiaDuplication:sleep(0.1) end
	Global_BellatiaDuplication:debug("back to savepoint")
	for buff_id, buff in pairs(player.buff) do
		if not buff.is_good_buff then player:cancelBuff(buff_id) end
	end
	Global_BellatiaDuplication:sleep(2)
	for buff_id, buff in pairs(player.buff) do
		if not buff.is_good_buff then player:cancelBuff(buff_id) end
	end
	player:setPosition(save_point_flag[save_point].x - 40 + RandRange(1, 80), save_point_flag[save_point].y, save_point_flag[save_point].z - 40 + RandRange(1, 80))
end

-----------------------------------------------------------------
--	廣播器(可修改 顏色
-----------------------------------------------------------------
function Lua_BroadCast_RoomStingTypeColor(room, string, type, color)
	if not type then type=2; end--預設類型2
	if not color then color=0; end--預設顏色無修改
	local msg="";
	if(type==2)then
		msg="[$MUTE]"..string;
	else
		msg=string;
	end
	for index, player in pairs(Global_BellatiaDuplication[room].players) do
		ScriptMessage(player.guid, player.guid, type, msg, color);
	end
end