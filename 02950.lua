-----------------------------------------------------------------
--	zone26�ƥ� ���Ը��Ȥ���
-----------------------------------------------------------------
-----------------------------------------------------------------
--	����A�ƥ���Ʈw

--		Global_BellatiaDuplication
--			Zone 154 �����Υ���A26�ƥ����D�n��Ƶ��c�C
--			�i��GM���O/gm ? pcall GM_BellatiaDuplication_check_global()�d�ߤ��Υ���C
--			Global_BellatiaDuplication���U���H�U�`�A��T�G
--				Global_BellatiaDuplication.alpha	--boolean�C�O�_�}�o���q�C
--				Global_BellatiaDuplication.beta	--boolean�C�O�_���ն��q�A�O���ܷ|���debug message�C�ثe�u���@���e�B�G���e�B�|���B�������ΡC
--				Global_BellatiaDuplication.save_point_flag	--AddyFlagGroup���O����A�ƥ��x�s�I�X��

--		Global_BellatiaDuplication[room_id]
--			�s��U�ƥ��h���ϰ��T�C�]�t�Ӽhnpc�B���ת��B���a�C�����C
--			�i��GM���O/gm ? pcall GM_BellatiaDuplication_check_local(room_id)�d�߰ϰ����C
--			�ϰ����s��j�����ƥ��y�{�ϥΪ���T�C
-----------------------------------------------------------------

-----------------------------------------------------------------
--	�ϰ����
--		Global_BellatiaDuplication[room_id].PangkorRams
--			���s

--		Global_BellatiaDuplication[room_id].PangkorRams_dragon
--			���s�s���A

--		Global_BellatiaDuplication[room_id].Morrok
--			����J

--		Global_BellatiaDuplication[room_id].Jill
--			�N��

--		Global_BellatiaDuplication[room_id].Kangersy
--			�d����

--		Global_BellatiaDuplication[room_id].Cassam
--			�H���d�ĩi

--		Global_BellatiaDuplication[room_id].IronRose
--			�K����

--		Global_BellatiaDuplication[room_id].Saisimengde
--			�ɴ��X�w

--		Global_BellatiaDuplication[room_id].Yulita
--			�G�� �ײ���

--		Global_BellatiaDuplication[room_id].FeitLautrec
--			�|�� �k��ù�S

--		Global_BellatiaDuplication[room_id].FeitLautrec_SungChiLi
--			�|�� �k��ù�S����

--		Global_BellatiaDuplication[room_id].Mansuoruien
--			���� �ү��箦

--		Global_BellatiaDuplication[room_id].PangkorRams.register10
--			��e�ƥ��i�סC�ХΤU�����禡�ק��x�s�I�C
--			Lua_BellatiaDuplication_change_save_point(room_id:number, save_point:number)

--		Global_BellatiaDuplication[room_id].status
--			��e�ƥ����A�C
--			standby	�P���s��ܫ�i�Jstandby���A
--			advance	���e�����𲤪��A
--			boss		���𲤪��A
--			fail		�𲤥��Ѫ��A
--			success	�𲤦��\���A
--			Lua_BellatiaDuplication_change_status(room_id:number, status:string)	���ܷ�e���A
--			Lua_BellatiaDuplication_check_status(room_id:number, status:string)	�^��boolean�ȡA�ˬd��e���A

--		Global_BellatiaDuplication[room_id].players
--			���a�C��A���e��AddyPlayer���O����

--		Global_BellatiaDuplication[room_id].players[1] = AddyPlayer����
--		Global_BellatiaDuplication[room_id].players[1].GUID = ���aguid
--			

-----------------------------------------------------------------
-----------------------------------------------------------------
--	�ƥ����C��
-----------------------------------------------------------------
--	�J�f��
--	Global_BellatiaDuplication[room_id].door_entrance.GUID = <�Ӫ�����GUID>
--	�@���e��������
--	Global_BellatiaDuplication[room_id].door_first_advance.GUID = <�Ӫ�����GUID>
--	�@���e��
--	Global_BellatiaDuplication[room_id].door_before_boss1.GUID = <�Ӫ�����GUID>
--	�@�����
--	Global_BellatiaDuplication[room_id].door_after_boss1.GUID = <�Ӫ�����GUID>
--	�Ĥ@���ƪ�
--	Global_BellatiaDuplication[room_id].door_ant1.GUID = <�Ӫ�����GUID>
--	�ĤG���ƪ�
--	Global_BellatiaDuplication[room_id].door_ant2.GUID = <�Ӫ�����GUID>
--	�ĤT���ƪ�
--	Global_BellatiaDuplication[room_id].door_ant3.GUID = <�Ӫ�����GUID>
--	�G���e��
--	Global_BellatiaDuplication[room_id].door_before_boss2.GUID = <�Ӫ�����GUID>
--	�G�����
--	Global_BellatiaDuplication[room_id].door_after_boss2.GUID = <�Ӫ�����GUID>
--	�K�ǤJ�f
--	Global_BellatiaDuplication[room_id].door_secret_entrance.GUID = <�Ӫ�����GUID>
--	�K�ǥX�f
--	Global_BellatiaDuplication[room_id].door_secret_exit.GUID = <�Ӫ�����GUID>
--	�|���e��
--	Global_BellatiaDuplication[room_id].door_before_boss4.GUID = <�Ӫ�����GUID>
--	�|�����
--	Global_BellatiaDuplication[room_id].door_after_boss4.GUID = <�Ӫ�����GUID>
--	�����e��
--	Global_BellatiaDuplication[room_id].door_before_boss5.GUID = <�Ӫ�����GUID>
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
--	���U
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

-- �e���x�s�I 1~10
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
--	���ܰѼ�
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
--	�d�߰Ѽ�
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
--	�|��
-----------------------------------------------------------------
function GM_BellatiaDuplication_reduce_FeitLautrec_hp()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].FeitLautrec.hp = Global_BellatiaDuplication[room_id].FeitLautrec.hp - (Global_BellatiaDuplication[room_id].FeitLautrec.max_hp * 0.05)
	Global_BellatiaDuplication[room_id].FeitLautrec.summon_servants_times = 8
end

-----------------------------------------------------------------
--	����
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
--	�S�O������
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