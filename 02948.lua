-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	卡薩姆對話
-----------------------------------------------------------------
function Lua_BellatiaDuplicationCassamSpeak()
	Global_BellatiaDuplication:debug("speak > cassam")

	local player = AddyPlayer:new(OwnerID())
	local room_id = player.room_id
	local cassam = Global_BellatiaDuplication[room_id].cassam
	cassam.register9 = player.GUID
	if cassam.register9 ~= OwnerID() then cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end

	-----------------------------------------------------------------
	--	更新資訊
	--	更新區域全域
		Lua_BellatiaDuplication_update_global(room_id)
		local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------

	Lua_BellatiaDuplication_change_status(room_id, "standby")
	cassam:playMotion(ruFUSION_ACTORSTATE_EMOTE_SPEAK)

	-----------------------------------------------------------------
	--	卡薩姆對話選項
	-----------------------------------------------------------------
	if save_point == 1 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_1]") return
	elseif save_point == 4 and Global_26IN_Boss2AlreadyBEdefeat and Global_26IN_Boss2AlreadyBEdefeat[room] then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_5]") return
	elseif save_point == 4 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_4]") return
	elseif save_point == 5 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_6]") return
	elseif save_point == 6 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_7]") return
	elseif save_point == 7 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_8]") return
	elseif save_point == 8 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_9]") return
	elseif save_point == 9 then
		cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_CASSAM_1]")
		cassam:addSpeakOption("[SC_BELLATIA_DUOLICATION_CASSAM_1_OPTION]", "Lua_BellatiaDuplicationcassamSpeak1")
		return
	elseif save_point == 10 then
		cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_CASSAM_2]")
		cassam:addSpeakOption("[SC_BELLATIA_DUOLICATION_CASSAM_2_OPTION]", "Lua_BellatiaDuplicationcassamSpeak2")
		return
	elseif save_point == 11 then
		cassam:setSpeakDetail("[SC_26IN_DIALOGUE_KALAWAY_END]")
	end
end
function Lua_BellatiaDuplicationCassamSpeak1()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication[room_id].cassam.register9 ~= OwnerID() then Global_BellatiaDuplication[room_id].cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	Global_BellatiaDuplication[room_id].cassam:closeSpeak()
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_begin")
end
function Lua_BellatiaDuplicationCassamSpeak2()
	local room_id = ReadRoleValue(TargetID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication[room_id].cassam.register9 ~= OwnerID() then Global_BellatiaDuplication[room_id].cassam:setSpeakDetail("[SC_BELLATIA_DUOLICATION_PANGKORRAMS_17]") return end
	Global_BellatiaDuplication[room_id].cassam:closeSpeak()
	Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FifthBoss_active")
end

-----------------------------------------------------------------
--	表演設定
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama_setting()
	Global_BellatiaDuplication:debug("active > fifth boss drama setting -> function Lua_BellatiaDuplication_FifthBoss_drama_setting()")

	Global_BellatiaDuplication_FifthBossDrama = {}
	Global_BellatiaDuplication_FifthBossDrama.delay = 0.5
	Global_BellatiaDuplication_FifthBossDrama.drama_flag = AddyFlagGroup:new(781295)
	Global_BellatiaDuplication_FifthBossDrama.route_flag = AddyFlagGroup:new(781293)
end

-----------------------------------------------------------------
--	五王現身帶走摩瑞克吉兒
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_begin()
	Global_BellatiaDuplication:debug("active > fifth boss drama 1 -> function Lua_BellatiaDuplication_FifthBoss_begin()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	Lua_BellatiaDuplication_change_status(room_id, "drama")

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	Global_BellatiaDuplication[room_id].mansuoruien:setPosition(Global_BellatiaDuplication_FifthBossDrama.drama_flag[1].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[1].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[1].z)
	Global_BellatiaDuplication[room_id].mansuoruien:addToPartition(room_id)
	Global_BellatiaDuplication[room_id].mansuoruien:faceTo(Global_BellatiaDuplication[room_id].morrok)

	--	曼索瑞恩：沒想到邦喀雷姆斯選擇自我了斷，將我控制火元素王的計劃徹底摧毀……
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_01]", 5)

	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:faceTo(Global_BellatiaDuplication[room_id].mansuoruien)
	Sleep(30)

	--	曼索瑞恩：我的計劃應該是完美的，為什麼真龍一個個都在阻礙我！
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_02]", 5)
	Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_ATTACK_2H)
	Sleep(30)

	--	吉兒‧艾克辛：曼索瑞恩，伊斯般娜的平衡並非你能掌控，你的計劃就到今天為止！
	Global_BellatiaDuplication[room_id].jill:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_03]", 5)
	Global_BellatiaDuplication[room_id].jill:playMotion(ruFUSION_ACTORSTATE_ATTACK_1H_SP)
	Sleep(30)

	--	曼索瑞恩：妳這個叛徒火氣倒是不小，但是想要與我為敵，你們還閒太早！
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_04]", 5)
	Global_BellatiaDuplication[room_id].mansuoruien:playMotion(ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(30)

	Global_BellatiaDuplication[room_id].mansuoruien.movable = true
	Global_BellatiaDuplication[room_id].mansuoruien.gravity = false
	Global_BellatiaDuplication[room_id].mansuoruien.align_to_surface = false
	Global_BellatiaDuplication[room_id].morrok.gravity = false
	Global_BellatiaDuplication[room_id].morrok.align_to_surface = false
	Global_BellatiaDuplication[room_id].jill.gravity = false
	Global_BellatiaDuplication[room_id].jill.align_to_surface = false

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID, ruFUSION_MIME_RUN_FORWARD)
	Global_BellatiaDuplication[room_id].mansuoruien:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].x - 50 + RandRange(1, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].y + RandRange(80, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].z - 50 + RandRange(1, 100), 0)
	Sleep(5)

	--	吉兒‧艾克辛：攔住他！
	Global_BellatiaDuplication[room_id].jill:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_05]", 5)
	Global_BellatiaDuplication[room_id].jill:playMotion(ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)

	--	摩瑞克‧渥林特：你們留下調查，或許曼索瑞恩還留有什麼陰謀！
	Global_BellatiaDuplication[room_id].morrok:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_06]", 5)
	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].cassam)
	Global_BellatiaDuplication[room_id].morrok:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(5)

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].morrok.GUID, ruFUSION_MIME_RUN_FORWARD)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].jill.GUID, ruFUSION_MIME_RUN_FORWARD)
	Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].x - 50 + RandRange(1, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].y + RandRange(60, 80), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].z - 50 + RandRange(1, 100), 0)
	Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].x - 50 + RandRange(1, 100), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].y + RandRange(50, 70), Global_BellatiaDuplication_FifthBossDrama.drama_flag[2].z - 50 + RandRange(1, 100), 0)

	Sleep(20)

	Global_BellatiaDuplication[room_id].mansuoruien:delFromPartition()
	Global_BellatiaDuplication[room_id].morrok:delFromPartition()
	Global_BellatiaDuplication[room_id].jill:delFromPartition()

	SetDefIdleMotion(Global_BellatiaDuplication[room_id].mansuoruien.GUID, ruFUSION_MIME_IDLE_STAND)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].morrok.GUID, ruFUSION_MIME_IDLE_STAND)
	SetDefIdleMotion(Global_BellatiaDuplication[room_id].jill.GUID, ruFUSION_MIME_IDLE_STAND)

	Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication.npc_initial_position_flag[104].x, Global_BellatiaDuplication.npc_initial_position_flag[104].y, Global_BellatiaDuplication.npc_initial_position_flag[104].z, 0)
	Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication.npc_initial_position_flag[105].x, Global_BellatiaDuplication.npc_initial_position_flag[105].y, Global_BellatiaDuplication.npc_initial_position_flag[105].z)
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:move(Global_BellatiaDuplication.npc_initial_position_flag[108].x, Global_BellatiaDuplication.npc_initial_position_flag[108].y, Global_BellatiaDuplication.npc_initial_position_flag[108].z)

	Lua_BellatiaDuplication_change_save_point(room_id, 10)
	Lua_BellatiaDuplication_change_status(room_id, "standby")

	Global_BellatiaDuplication:debug("fifth boss drama begin end")
end

-----------------------------------------------------------------
--	出發前對話
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama1()
	Global_BellatiaDuplication:debug("active > fifth boss drama 1 -> function Lua_BellatiaDuplication_FifthBoss_drama1()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[1] = true

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:faceTo(Global_BellatiaDuplication[room_id].cassam)

	local scripts = {
	--	法伊羅特：我從維琪那裡奪取的資料顯示，曼索瑞恩有一個陰險的計劃正在進行。
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec_sungchili, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_07]", time = 2, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].feitlautrec_sungchili)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec_sungchili)
			Global_BellatiaDuplication[room_id].feitlautrec_sungchili:playMotion(ruFUSION_ACTORSTATE_PARRY_UNARMED)
		end},
	--	法伊羅特：計劃的詳情並不清楚，但在通道盡頭有間詭異的密室，可以感受到一股非比尋常的強大能量正在累積。
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec_sungchili, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_08]", time = 5, is_done = false},
	--	康葛斯：聽起來可不太妙啊！人王，發號司令的權責交還給你，我們現在該怎麼辦？
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_09]", time = 8, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
			Sleep(4)
			Global_BellatiaDuplication[room_id].kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP)
		end},
	--	卡拉維‧卡薩姆：按照法伊羅特的說法，制止曼索瑞恩的行動不能耽擱。
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_10]", time = 11, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].kangersy:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_END)
			Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		end},
	--	卡拉維‧卡薩姆：我們繼續前進！法伊羅特，你可以替我們通知在空中的摩瑞克他們嗎？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_11]", time = 14, is_done = false},
	--	法伊羅特：好吧！原本我想親自教訓曼索瑞恩的，這個機會只好讓給你們了！
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec_sungchili, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_12]", time = 17, is_done = false, action = function()
			Global_BellatiaDuplication[room_id].feitlautrec_sungchili:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[3].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[3].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[3].z)
			Global_BellatiaDuplication[room_id].feitlautrec_sungchili:delFromPartition()
			Global_BellatiaDuplication[room_id].cassam.movable = true
			Global_BellatiaDuplication[room_id].kangersy.movable = true
			Global_BellatiaDuplication[room_id].door_before_boss5:delFromPartition()
	--		接路途中閒聊第一段
			Global_BellatiaDuplication[room_id].drama_step = 15
			Global_BellatiaDuplication[room_id].drama_step_trigger = true
		end}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 1 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss5_beginning)

	--	移動
	table.insert(Global_BellatiaDuplication[room_id].drama_npcs, Global_BellatiaDuplication[room_id].kangersy)
	table.insert(Global_BellatiaDuplication[room_id].drama_npcs, Global_BellatiaDuplication[room_id].cassam)
	Global_BellatiaDuplication[room_id].cassam.move_target = nil
	Global_BellatiaDuplication[room_id].kangersy.move_target = nil
	local is_arrived = false
	Global_BellatiaDuplication:debug("npcs start move")
	while Lua_BellatiaDuplication_check_status(room_id, "drama") and not is_arrived do
		for index, npc in pairs(Global_BellatiaDuplication[room_id].drama_npcs) do
			if #npc.hate_list <= 0 then
				if not npc.move_target then
					npc.move_target = Global_BellatiaDuplication_FifthBossDrama.route_flag[1]
					for flag_index, flag in ipairs(Global_BellatiaDuplication_FifthBossDrama.route_flag) do
						if flag:distanceTo(npc) < npc.move_target:distanceTo(npc) then npc.move_target = flag end
					end
					Global_BellatiaDuplication:debug(npc.GUID .. " move.target : flag" .. "[" .. npc.move_target.index .. "]")
					if Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1] and
					   CheckLine(npc.GUID, Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1].x, Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1].y, Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1].z) then
						npc.move_target = Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1]
					end
				end
				if npc.move_target:isInheritorOf("Flag") and npc.move_target:distanceTo(npc) < 30 then npc.move_target = Global_BellatiaDuplication_FifthBossDrama.route_flag[npc.move_target.index + 1] end
			elseif #npc.hate_list > 0 then npc.move_target = nil end
			for another_index, another in pairs(Global_BellatiaDuplication[room_id].drama_npcs) do
				if another.GUID ~= npc.GUID and not another.move_target then npc.move_target = another end
			end
			if npc.move_target then npc:move(npc.move_target.x - 15 + RandRange(1, 30), npc.move_target.y, npc.move_target.z - 15 + RandRange(1, 30), 0) end
		end
		if Global_BellatiaDuplication_FifthBossDrama.route_flag[#Global_BellatiaDuplication_FifthBossDrama.route_flag]:distanceTo(Global_BellatiaDuplication[room_id].kangersy) < 80 and
		   Global_BellatiaDuplication_FifthBossDrama.route_flag[#Global_BellatiaDuplication_FifthBossDrama.route_flag]:distanceTo(Global_BellatiaDuplication[room_id].cassam) < 80 then
			Global_BellatiaDuplication:debug("cassam and kangersy arrived")
			Global_BellatiaDuplication[room_id].drama_step = 2
			is_arrived = true
		end
		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end
	Global_BellatiaDuplication:debug("npcs stop move")

	Global_BellatiaDuplication:debug("fifth boss drama 1 end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

function Lua_BellatiaDuplication_FifthBoss_drama2()
	Global_BellatiaDuplication:debug("active > fifth boss drama 2 -> function Lua_BellatiaDuplication_FifthBoss_drama2()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication[room_id].drama_record[2] = true

	--	康葛斯：有空再說
	Global_BellatiaDuplication[room_id].kangersy:say("[SC_BELLATIA_FIFTHADVANCE_END]", 5)

	Global_BellatiaDuplication[room_id].mansuoruien.movable = true
	Global_BellatiaDuplication[room_id].mansuoruien:move(Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].x, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].y, Global_BellatiaDuplication_FifthBossDrama.drama_flag[4].z, 0)

	--	曼索瑞恩：失去神使的幫助，你們以為自己還有任何勝算？
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_13]", 5)
	Sleep(25)

	--	曼索瑞恩：事實上就算那兩個傢伙存在，在我面前你們也只有送死的份！
	Global_BellatiaDuplication[room_id].mansuoruien:say("[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_14]", 5)

	--	開啟第一戰鬥流程
	Lua_BellatiaDuplication_update_players(room_id)
	Global_BellatiaDuplication[room_id].door_before_boss5:addToPartition(room_id)
	Global_BellatiaDuplication[room_id].step = 1
	Lua_BellatiaDuplication_change_status(room_id, "boss")
	Global_BellatiaDuplication[room_id].step_trigger = true

	--	npc ai
	Global_BellatiaDuplication[room_id].cassam:beginPlot("Lua_BellatiaDuplication_FifthBoss_cassam_ai")
	Global_BellatiaDuplication[room_id].kangersy:beginPlot("Lua_BellatiaDuplication_FifthBoss_kangersy_ai")

	Global_BellatiaDuplication:debug("fifth boss drama 2 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama3()
	Global_BellatiaDuplication:debug("active > fifth boss drama 3 -> function Lua_BellatiaDuplication_FifthBoss_drama3()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	曼索瑞恩：我打破了禁忌符文的規則，使這些強大符文為我所用！有這等智慧才有資格掌控伊斯般那！
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_15]", time = 1, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 3 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 3 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama4()
	Global_BellatiaDuplication:debug("active > fifth boss drama 4 -> function Lua_BellatiaDuplication_FifthBoss_drama4()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	曼索瑞恩：年輕的人王，我懷念與你先祖卡貝斯特一起行動的日子，若不是他的善良與愚昧，我又怎能獲得取得「魔帝」稱號的機會！
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_16]", time = 1, is_done = false},
	--	卡拉維．卡薩姆：對於忘恩負義的小人，我沒有什麼話想對你說的！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_17]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 4 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 4 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama5()
	Global_BellatiaDuplication:debug("active > fifth boss drama 5 -> function Lua_BellatiaDuplication_FifthBoss_drama5()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	曼索瑞恩：你們難道沒有從歷史中獲得教訓？真龍只會帶來毀壞與混亂，統一人類世界不是我的目標，我最終的目的是要消滅萬惡之首真龍的存在！
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_18]", time = 1, is_done = false},
	--	康葛斯：我已經夠瘋瘋顛顛的了！沒想到還有人比我更像個瘋子！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_19]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 5 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 5 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama6()
	Global_BellatiaDuplication:debug("active > fifth boss drama 6 -> function Lua_BellatiaDuplication_FifthBoss_drama6()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	曼索瑞恩：我處處隱忍，暗中策劃，這一切都是為了伊斯般那著想，豈是你們這些小人物可以理解的！
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_20]", time = 1, is_done = false},
	--	卡拉維．卡薩姆：我在取得伊蘭薩爾時看到了過去的記憶，莫非你還沒發現自己偏離了正道？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_21]", time = 4, is_done = false},
	--	卡拉維．卡薩姆：你殺害夥伴，挑起戰爭，無所不用其極的破壞伊斯般娜的和平……
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_22]", time = 7, is_done = false},
	--	卡拉維．卡薩姆：不管當初你是否真心想平定紛亂的世界，為人類帶來美好的日子，現在的你只是在復仇心的驅使下，打著正義的名號對世界進行復仇罷了！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_23]", time = 10, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 6 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 6 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama7()
	Global_BellatiaDuplication:debug("active > fifth boss drama 7 -> function Lua_BellatiaDuplication_FifthBoss_drama7()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	曼索瑞恩：你們這些廢物，省點力氣回家吃奶吧！！
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_101]", time = 1, is_done = false},
	--	卡薩姆：別理會他的狂妄挑性！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_102]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 7 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 7 end")
end

function Lua_BellatiaDuplication_FifthBoss_drama8()
	Global_BellatiaDuplication:debug("active > fifth boss drama 8 -> function Lua_BellatiaDuplication_FifthBoss_drama8()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	曼索瑞恩：哈哈哈！康葛斯，有沒有興趣加入我阿！？
		{speaker = Global_BellatiaDuplication[room_id].mansuoruien, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_103]", time = 1, is_done = false},
	--	康葛斯：我們雖然都是瘋子，但對你我真的望塵莫及...
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_104]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "boss") and not scripts[#scripts].is_done and Global_BellatiaDuplication[room_id].drama_step == 8 do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				script.speaker:say(script.content, 5)
			end
		end

		Sleep(Global_BellatiaDuplication_FifthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 8 end")
end