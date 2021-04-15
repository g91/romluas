-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	全域，副本資料庫

--		Global_BellatiaDuplication
--			Zone 154 的公用全域，26副本的主要資料結構。
--			可用GM指令/gm ? pcall GM_BellatiaDuplication_check_global()查詢公用全域。
--			Global_BellatiaDuplication之下有以下常態資訊：
--				Global_BellatiaDuplication.alpha	--boolean。是否開發階段。
--				Global_BellatiaDuplication.beta	--boolean。是否測試階段，是的話會顯示debug message。目前只有一王前、二王前、四王、五王有用。
--				Global_BellatiaDuplication.save_point_flag	--AddyFlagGroup類別物件，副本儲存點旗標

--		Global_BellatiaDuplication[room_id]
--			存放各副本層的區域資訊。包含該層npc、阻擋門、玩家列表等等。
--			可用GM指令/gm ? pcall GM_BellatiaDuplication_check_local(room_id)查詢區域全域。
--			區域全域存放大部分副本流程使用的資訊。
-----------------------------------------------------------------

-----------------------------------------------------------------
--	區域全域
--		Global_BellatiaDuplication[room_id].PangkorRams
--			光龍

--		Global_BellatiaDuplication[room_id].PangkorRams_dragon
--			光龍龍型態

--		Global_BellatiaDuplication[room_id].Morrok
--			摩瑞克

--		Global_BellatiaDuplication[room_id].Jill
--			吉兒

--		Global_BellatiaDuplication[room_id].Kangersy
--			康葛斯

--		Global_BellatiaDuplication[room_id].Cassam
--			人王卡薩姆

--		Global_BellatiaDuplication[room_id].IronRose
--			鐵薔薇

--		Global_BellatiaDuplication[room_id].Saisimengde
--			賽斯蒙德

--		Global_BellatiaDuplication[room_id].Yulita
--			二王 尤莉塔

--		Global_BellatiaDuplication[room_id].FeitLautrec
--			四王 法伊羅特

--		Global_BellatiaDuplication[room_id].FeitLautrec_SungChiLi
--			四王 法伊羅特分身

--		Global_BellatiaDuplication[room_id].Mansuoruien
--			五王 曼索瑞恩

--		Global_BellatiaDuplication[room_id].PangkorRams.register10
--			當前副本進度。請用下面的函式修改儲存點。
--			Lua_BellatiaDuplication_change_save_point(room_id:number, save_point:number)

--		Global_BellatiaDuplication[room_id].status
--			當前副本狀態。
--			standby	與光龍對話後進入standby狀態
--			advance	王前機關攻略狀態
--			boss		王攻略狀態
--			fail		攻略失敗狀態
--			success	攻略成功狀態
--			Lua_BellatiaDuplication_change_status(room_id:number, status:string)	改變當前狀態
--			Lua_BellatiaDuplication_check_status(room_id:number, status:string)	回傳boolean值，檢查當前狀態

--		Global_BellatiaDuplication[room_id].players
--			玩家列表，內容為AddyPlayer類別物件

--		Global_BellatiaDuplication[room_id].players[1] = AddyPlayer物件
--		Global_BellatiaDuplication[room_id].players[1].GUID = 玩家guid
--			

-----------------------------------------------------------------
-----------------------------------------------------------------
--	副本門列表
-----------------------------------------------------------------
--	入口門
--	Global_BellatiaDuplication[room_id].door_entrance.GUID = <該門物件的GUID>
--	一王前機關城門
--	Global_BellatiaDuplication[room_id].door_first_advance.GUID = <該門物件的GUID>
--	一王前門
--	Global_BellatiaDuplication[room_id].door_before_boss1.GUID = <該門物件的GUID>
--	一王後門
--	Global_BellatiaDuplication[room_id].door_after_boss1.GUID = <該門物件的GUID>
--	第一螞蟻門
--	Global_BellatiaDuplication[room_id].door_ant1.GUID = <該門物件的GUID>
--	第二螞蟻門
--	Global_BellatiaDuplication[room_id].door_ant2.GUID = <該門物件的GUID>
--	第三螞蟻門
--	Global_BellatiaDuplication[room_id].door_ant3.GUID = <該門物件的GUID>
--	二王前門
--	Global_BellatiaDuplication[room_id].door_before_boss2.GUID = <該門物件的GUID>
--	二王後門
--	Global_BellatiaDuplication[room_id].door_after_boss2.GUID = <該門物件的GUID>
--	密室入口
--	Global_BellatiaDuplication[room_id].door_secret_entrance.GUID = <該門物件的GUID>
--	密室出口
--	Global_BellatiaDuplication[room_id].door_secret_exit.GUID = <該門物件的GUID>
--	四王前門
--	Global_BellatiaDuplication[room_id].door_before_boss4.GUID = <該門物件的GUID>
--	四王後門
--	Global_BellatiaDuplication[room_id].door_after_boss4.GUID = <該門物件的GUID>
--	五王前門
--	Global_BellatiaDuplication[room_id].door_before_boss5.GUID = <該門物件的GUID>
-----------------------------------------------------------------

-----------------------------------------------------------------
--	GM
-----------------------------------------------------------------

function GM_BellatiaDuplication_resume_loop()
	Global_BellatiaDuplication.handler:beginPlot("Lua_BellatiaDuplication_global_loop")
end

function GM_BellatiaDuplication_initialize(save_point)
	local me = AddyPlayer:new(OwnerID())
	local room_id = me.room_id
	if not Lua_BellatiaDuplication_change_save_point(room_id, save_point) then return end
	Lua_BellatiaDuplication_initialize_save_point()
	local save_point_flag = Global_BellatiaDuplication.save_point_flag

	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		player:setPosition(save_point_flag[save_point].x - 40 + RandRange(1, 80), save_point_flag[save_point].y, save_point_flag[save_point].z - 40 + RandRange(1, 80))
	end
end

function GM_BellatiaDuplication_check_type(_name)
	if not Global_BellatiaDuplication then return false end
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not Global_BellatiaDuplication[room_id] then return false end
	if not Global_BellatiaDuplication[room_id][_name] then return false end
	local _type = type(Global_BellatiaDuplication[room_id][_name])
	local _class = Global_BellatiaDuplication[room_id][_name].class
	Global_BellatiaDuplication:debug("Global_BellatiaDuplication[" .. room_id .. "][" .. _name .. "].type : " .. _type)
	if _class then Global_BellatiaDuplication:debug("Global_BellatiaDuplication[" .. room_id .. "][" .. _name .. "].class : " .. _class) end
end

function GM_BellatiaDuplication_check_id(_name)
	DebugMsg(0, 0, tostring(CheckID(Global_BellatiaDuplication[ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)][_name].GUID)))
end

function GM_BellatiaDuplication_debuger(_room_id)
	local _room_id = _room_id or ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:addRoomRecipient(_room_id, AddyPlayer:new(OwnerID()))
end

-----------------------------------------------------------------
--	輔助
-----------------------------------------------------------------
function GM_BellatiaDuplication_donot_die_plz()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication and Global_BellatiaDuplication[room_id] then
		Global_BellatiaDuplication[room_id].PangkorRams.hp = Global_BellatiaDuplication[room_id].PangkorRams.hp + 99999999
		Global_BellatiaDuplication[room_id].Morrok.hp = Global_BellatiaDuplication[room_id].Morrok.hp + 99999999
		Global_BellatiaDuplication[room_id].Jill.hp = Global_BellatiaDuplication[room_id].Jill.hp + 99999999
		Global_BellatiaDuplication[room_id].Kangersy.hp = Global_BellatiaDuplication[room_id].Kangersy.hp + 99999999
		Global_BellatiaDuplication[room_id].Cassam.hp = Global_BellatiaDuplication[room_id].Cassam.hp + 99999999
		Global_BellatiaDuplication[room_id].IronRose.hp = Global_BellatiaDuplication[room_id].IronRose.hp + 99999999
	end
end

-- 前往儲存點 1~10
function GM_BellatiaDuplication_gotoSavePoint(index)
	local me = AddyPlayer:new(OwnerID())
	if not Global_BellatiaDuplication.save_point_flag then return end
	if not index or index > #Global_BellatiaDuplication.save_point_flag then
		DebugMsg(0, 0, "[ERROR] it is a wrong index. GM_BellatiaDuplication_gotoSavePoint( index )")
		return
	end
	me:setPosition(Global_BellatiaDuplication.save_point_flag[index].x, Global_BellatiaDuplication.save_point_flag[index].y, Global_BellatiaDuplication.save_point_flag[index].z, Global_BellatiaDuplication.save_point_flag[index].direction)
end

-----------------------------------------------------------------
--	改變參數
-----------------------------------------------------------------
function GM_BellatiaDuplication_change_status(_status)
	Lua_BellatiaDuplication_change_status(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), _status)
end

function GM_BellatiaDuplication_change_step(_step)
	if Global_BellatiaDuplication and Global_BellatiaDuplication[room_id] then
		Global_BellatiaDuplication[room_id].step = _step
		DebugMsg(0, 0, "[BellatiaDuplication] <GM> change step to " .. Global_BellatiaDuplication[room_id].step)
	end
end

-----------------------------------------------------------------
--	查詢參數
-----------------------------------------------------------------
function GM_BellatiaDuplication_check_global()
	if not Global_BellatiaDuplication then
		DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "[BellatiaDuplication] <ERROR> Global_BellatiaDuplication is not found")
		return
	end
	DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "[BellatiaDuplication] <info> check Global_BellatiaDuplication")
	for key, value in pairs(Global_BellatiaDuplication) do
		DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "Global_BellatiaDuplication." .. key .. " = " .. tostring(value))
	end
end

function GM_BellatiaDuplication_check_local(room_id)
	if not Global_BellatiaDuplication then
		DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "[BellatiaDuplication] <ERROR> Global_BellatiaDuplication is not found")
		return
	end
	if not Global_BellatiaDuplication[room_id] then
		DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "[BellatiaDuplication] <ERROR> Global_BellatiaDuplication[" .. room_id .. "] is not found")
		return
	end
	DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "[BellatiaDuplication] <info> check Global_BellatiaDuplication[" .. room_id .. "]")
	for key, value in pairs(Global_BellatiaDuplication[room_id]) do
		DebugMsg(0, ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), "Global_BellatiaDuplication.[" .. room_id .. "]." .. key .. " = " .. tostring(value))
	end
end

function GM_BellatiaDuplication_check_players(room_id)
	if not Global_BellatiaDuplication[room_id] then return end
	Global_BellatiaDuplication:debug("check players at room_id : " .. room_id)
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		Global_BellatiaDuplication:debug("player(" .. player.GUID .. ")")
	end
end

function GM_BellatiaDuplication_check_savepointrecord(room_id)
	Global_BellatiaDuplication:debug("change save point, save_point_record = { " .. table.concat(Global_BellatiaDuplication[room_id].save_point_record, ", ") .. "}")
end

-----------------------------------------------------------------
--	四王
-----------------------------------------------------------------
function GM_BellatiaDuplication_reduce_FeitLautrec_hp()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].FeitLautrec.hp = Global_BellatiaDuplication[room_id].FeitLautrec.hp - (Global_BellatiaDuplication[room_id].FeitLautrec.max_hp * 0.05)
	Global_BellatiaDuplication[room_id].FeitLautrec.summon_servants_times = 8
end

-----------------------------------------------------------------
--	五王
-----------------------------------------------------------------
function GM_BellatiaDuplication_reduce_Mansuoruien_hp()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].Mansuoruien.hp = Global_BellatiaDuplication[room_id].Mansuoruien.hp - (Global_BellatiaDuplication[room_id].Mansuoruien.max_hp * 0.01)
end
function GM_BellatiaDuplication_i_love_Mansuoruien()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].step = 6
	Global_BellatiaDuplication[room_id].drama_step = 14
	Lua_BellatiaDuplication_change_status(room_id, "drama")
end

-----------------------------------------------------------------
--	特別除錯用
-----------------------------------------------------------------
function GM_BellatiaDuplication_cassam_addtopartition()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].cassam:addToPartition(room_id)
end
function GM_BellatiaDuplication_cassam_show()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].cassam.show = true
	Global_BellatiaDuplication[room_id].cassam.hide = false
end
function GM_BellatiaDuplication_kangersy_addtopartition()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].kangersy:addToPartition(room_id)
end
function GM_BellatiaDuplication_kangersy_show()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].kangersy.show = true
	Global_BellatiaDuplication[room_id].kangersy.hide = false
end
function GM_BellatiaDuplication_check_event(_name)
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:debug(_name .. ".event : ")
	for index, event in pairs(Global_BellatiaDuplication[room_id][_name].event) do
		Global_BellatiaDuplication:debug(event.type)
	end
end

function GM_BellatiaDuplication_check_music()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not Global_BellatiaDuplication[room_id].music_listener then return end
	local my_music_player = nil
	for index, music_player in pairs(Global_BellatiaDuplication[room_id].music_listener.list) do
		if music_player.owner.GUID == OwnerID() then my_music_player = music_player end
	end
	if not my_music_player then
		Global_BellatiaDuplication:debug("music_player not found")
	end
	while Global_BellatiaDuplication[room_id].music_listener do
		Global_BellatiaDuplication:debug("music name : " .. my_music_player.music.name .. ", current_time : " .. my_music_player.current_time)
		Global_BellatiaDuplication:sleep(1)
	end
end

function GM_BellatiaDuplication_kangersy_lockhp()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:debug("EM_RoleValue_LockHP : " .. ReadRoleValue(Global_BellatiaDuplication[room_id].kangersy.GUID, EM_RoleValue_LockHP))
end

function GM_BellatiaDuplication_feitlautrec_lockhp()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:debug("EM_RoleValue_LockHP : " .. ReadRoleValue(Global_BellatiaDuplication[room_id].feitlautrec.GUID, EM_RoleValue_LockHP))
end

function GM_BellatiaDuplication_mansuoruien_lockhp()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:debug("EM_RoleValue_LockHP : " .. ReadRoleValue(Global_BellatiaDuplication[room_id].mansuoruien.GUID, EM_RoleValue_LockHP))
end