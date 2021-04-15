-----------------------------------------------------------------
--	���s��ܼ@��
-----------------------------------------------------------------
function Lua_BellatiaDuplicationHandlerSpeak()
	local player = AddyPlayer:new(OwnerID())
	local room_id = player.room_id
	local PangkorRams = Global_BellatiaDuplication[room_id].pangkorrams
	PangkorRams.register9 = player.GUID
	if PangkorRams.register9 ~= OwnerID() then PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end

	-----------------------------------------------------------------
	--	��s�ϰ����
	-----------------------------------------------------------------
	Lua_BellatiaDuplication_update_global(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	Lua_BellatiaDuplication_change_status(room_id, "standby")
	PangkorRams:playMotion(ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	-----------------------------------------------------------------
	--	���s��ܿﶵ
	-----------------------------------------------------------------
	Global_BellatiaDuplication:debug("save_point="..save_point)
	if save_point == 1 then
		PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_1]");
		PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_2]", "Lua_BellatiaDuplication_area1_start");return
	elseif save_point == 2 then
		PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_3]");
		PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_4]", "lua_26in_boss1_replace");return
		--PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_4]", "Lua_26instance_boss1_begin");return
	elseif save_point == 3 then
		PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_6]");
		PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_7]", "Lua_BellatiaDuplication_area2_start");
		return
	elseif save_point == 4 and Global_26IN_Boss2AlreadyBEdefeat and Global_26IN_Boss2AlreadyBEdefeat[room_id]  then
	--	2���w���A���s���ݪ��a���_�ɪ����
			PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_10]");
			PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_11]", "lua_26in_afterboss2_changeEXE");
			return
	elseif save_point == 4 then
	--	��2�����e
		PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_8]")
		PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_9]", "lua_26in_boss2_set")
		return
	elseif save_point == 5 then
		PangkorRams:setSpeakDetail("[SC_26IN_FOREBOSS3_R]")
	--	���s�i�J�ڦ椧�v
		PangkorRams:addSpeakOption("[SC_26IN_FOREBOSS3_H]", "lua_26in_foreboss3_changeEXE")
		return
	elseif save_point == 6 then
		PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_12]")
		PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_2]", "lua_26in_foreboss4_changeEXE")
		return
	elseif save_point == 7 then
		PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_13]")
		PangkorRams:addSpeakOption("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_14]", "lua_26in_foreboss4_changeEXE_a")
		return
	elseif save_point == 8 then
		PangkorRams:setSpeakDetail("[SC_BELLATIADUPLICATION_FOURTH_BOSS_01]")
		PangkorRams:addSpeakOption("[SC_26IN_FOREBOSS3_H]", "Lua_BellatiaDuplication_area4_boss")
		return
	end
end

-----------------------------------------------------------------
--	�Ұʤ@���e����
-----------------------------------------------------------------
function Lua_BellatiaDuplication_area1_start()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	local PangkorRams = Global_BellatiaDuplication[room_id].pangkorrams
	if PangkorRams.register9 ~= OwnerID() then PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	PangkorRams:beginPlot("Lua_BellatiaDuplication_FirstAdvance_active")
	PangkorRams:closeSpeak()
end

-----------------------------------------------------------------
--	�Ұʤ@��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_area1_boss()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	local PangkorRams = Global_BellatiaDuplication[room_id].pangkorrams
	if PangkorRams.register9 ~= OwnerID() then PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	PangkorRams:closeSpeak()
end

-----------------------------------------------------------------
--	�ҰʤG���e����
-----------------------------------------------------------------
function Lua_BellatiaDuplication_area2_start()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	local PangkorRams = Global_BellatiaDuplication[room_id].pangkorrams
	if PangkorRams.register9 ~= OwnerID() then PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	PangkorRams:beginPlot("Lua_BellatiaDuplication_SecondAdvance_active")
	PangkorRams:closeSpeak()
end

-----------------------------------------------------------------
--	�Ұʥ|��
-----------------------------------------------------------------
function Lua_BellatiaDuplication_area4_boss()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	local PangkorRams = Global_BellatiaDuplication[room_id].pangkorrams
	if PangkorRams.register9 ~= OwnerID() then PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	PangkorRams:beginPlot("Lua_BellatiaDuplication_FourthBoss_active")
	PangkorRams:closeSpeak()
end

-----------------------------------------------------------------
--	�Ұʤ���
-----------------------------------------------------------------
function Lua_BellatiaDuplication_area5_boss()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	local PangkorRams = Global_BellatiaDuplication[room_id].pangkorrams
	if PangkorRams.register9 ~= OwnerID() then PangkorRams:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	PangkorRams:beginPlot("Lua_BellatiaDuplication_FifthBoss_active")
	PangkorRams:closeSpeak()
end