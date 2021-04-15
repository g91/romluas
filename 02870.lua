function Lua_122038_speak()
	local player = OwnerID()
	local npc = TargetID()

	if CheckScriptFlag(player, 547702) then					-- 如果有任務物品解任務
		LoadQuestOption(player)
		return
	end

	if CheckAcceptQuest(player, 426102)  then					-- 表演劇情開始
		if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- 表演中：吉兒現在看起來不像可以溝通的樣子 ，你待會再過來吧。
			SetSpeakDetail(player, "[SC_Z25Q426102_AN_3]")
			return
		end
		SetSpeakDetail(player, "[SC_Z25Q426102_AN_1]")				-- 我跟吉兒溝通的期間，你先在旁邊等一下。
		AddSpeakOption(player, npc, "[SC_Z25Q426102_AN_2]", "Lua_122038_drama", 0)--我知道了。
		return
	end

	SetSpeakDetail(player, "[SC_Z25Q426102_AN_4]")				-- 如果沒有表演任務傳回一般對話：吉兒也太固執了，為什麼她就不能從長計議？這樣爭在一時有什麼好處？
	LoadQuestOption(player)
end

function Lua_122038_drama()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc, EM_RoleValue_Register1) ~= 0 then			-- 表演中：吉兒現在看起來不像可以溝通的樣子 ，你待會再過來吧。
		SetSpeakDetail(player, "[SC_Z25Q426102_AN_3]")
		return
	end
	get_multiplayer(npc, player, 100, 1, {complete = "Lua_122038_drama_setting"})
	CloseSpeak(player)
end

function Lua_122038_drama_setting(event)
	local director = event.register
	local players = event.players
	local cast = {
		{id = 122039, flag = 781272, pid = 5},	-- 1. 摩瑞克．渥林特, 旗子編號5
		{id = 122041, flag = 781272, pid = 6}	-- 2. 吉兒．艾克辛, 旗子編號6
--		{name = "jill", id = 122041, flag = 781272, pid = 6, mode = {EM_SetModeType_Obstruct, true}}
	}

	-- 呼叫威力導演
	power_director(
		-- 把npc當導演，控制整個表演
		director,
		-- 觀眾
		players,
		-- 卡司陣容，上面定義
		cast,
		-- 角本函式
		"Lua_122038_drama_script",
		{start = "Lua_122038_drama_start",		-- 表演開始事件
		 interrupt = "Lua_122038_drama_interrupt",	-- 玩家中斷事件
		 complete = "Lua_122038_drama_complete",	-- 表演完成事件
		 playing = "Lua_122038_drama_playing"		-- 表演中每秒事件
		}
	)
end

function Lua_122038_drama_start(event)
	local players = event.players
	for index, player in pairs(players) do
		-- 表演buff
		Lua_StopBGM(player)
		local MusicID = PlaySoundToPlayer(player, "music/zone/005/zone005_night_02.mp3", false)
		WriteRoleValue(event.director, EM_RoleValue_Register2, MusicID)
		AddBuff(player, 624068, 1, -1 )
	end
end

function Lua_122038_drama_interrupt(event)
	-- 觸發中斷事件的玩家guid
	DebugMsg(0, 0, "event >> Lua_122038_drama_interrupt. player")
end

function Lua_122038_drama_complete(event)
	local players = event.players
	for index, player in pairs(players) do
		-- 有任務和buff才會給獎勵
		if CheckAcceptQuest(player, 426102) and CheckBuff(player, 624068) then
			-- 給予
			GiveBodyItem(player, 547702, 1)
			-- 取消表演buff
			CancelBuff(player, 624068)
		end
		local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
		StopSound(player, MusicID)
		Lua_PlayBGM(player)
	end
end

function Lua_122038_drama_playing(event)
	local director = event.director
	local players = event.players
	for index, player in pairs(players) do
		if CheckBuff(player, 624068) then
			if not CheckDistance(player, director, 150) then
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_5]", 0)
			end
			if not CheckDistance(player, director, 250) then
				-- 距離過遠，任務失敗
				-- 取消表演buff
				ScriptMessage(player, player, 1, "[SC_Z25Q426107_AN_6]", 0)
				CancelBuff(player, 624068)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
			-- 取消任務後清除表演
			if not CheckAcceptQuest(player, 426102) then
				CancelBuff(player, 624068)
				local MusicID = ReadRoleValue(event.director, EM_RoleValue_Register2)
				StopSound(player, MusicID)
				Lua_PlayBGM(player)
			end
		end
	end
end

-- 角本函式，參數有 director, actor, players，導演guid, 演員table, 觀眾table
function Lua_122038_drama_script(director, actor, players)

	AddBuff(actor[2], 624175, 1, -1)

	Say(actor[2], "[SC_Z25Q426102_1]")							-- 吉兒：放開我，你這個卑鄙的傢伙！
	Sleep(25)

	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)			-- 搖頭動作
	Say(actor[1], "[SC_Z25Q426102_2]")							-- 摩瑞克：我只是想再跟妳談一談。
	Sleep(25)

	AdjustDir(actor[2], 30);							--轉向
	Say(actor[2], "[SC_Z25Q426102_3]")							-- 吉兒：談一談？現在才想談一談？
	Sleep(25)

	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)		 		-- "指"動作
	Say(actor[2], "[SC_Z25Q426102_4]")							-- 吉兒：勞勃被龍族帶走時，你冷眼旁觀。
	Sleep(25)

	Say(actor[2], "[SC_Z25Q426102_5]")							-- 吉兒：勞勃被龍族封印後，你隻字不提。
	Sleep(25)

	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_CRY)		 		-- "哭"動作
	Say(actor[2], "[SC_Z25Q426102_6]")							-- 吉兒：在這之前，我們以為遇到了同類，遇見了希望......。
	Sleep(30)

	Say(actor[2], "[SC_Z25Q426102_7]")							-- 吉兒：現在......對於你的作為，我們還有什麼好談的？
	Sleep(30)

	PlayMotion(actor[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)				-- 摩哥說話
	Say(actor[1], "[SC_Z25Q426102_8]")							-- 摩瑞克：吉兒，聽我說......
	Sleep(20)

	Say(actor[2], "[SC_Z25Q426102_9]")							-- 吉兒：沒什麼好說的！放開我！！
	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_ANGRY)				-- 解開束縛!!!!!
	Sleep(25)
	CancelBuff(actor[2], 624175)								-- 解除buff

	Say(actor[2], "[SC_Z25Q426102_10]")							-- 吉兒：哼，你的小技倆是困不住我的！
	Sleep(25)

	PlayMotion(actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)		 		-- "指"動作
	Say(actor[2], "[SC_Z25Q426102_11]")							-- 吉兒：龍族也是！我將會殺了那隻冰龍，讓所有龍族嚐嚐那種失去的滋味。
	Sleep(35)

	WriteRoleValue(actor[2], EM_RoleValue_IsWalk, 1)
	local _delay = Move(actor[2], GetMoveFlagValue(781272, 7, EM_RoleValue_X), GetMoveFlagValue(781272, 7, EM_RoleValue_Y), GetMoveFlagValue(781272, 7, EM_RoleValue_Z))
	Sleep(_delay)
	DelObj(actor[2])
	sleep(30);

	-- 表演結束記得要喊"咖"!!
	power_director_stop_movie(director)
end

--[[
--對摩瑞克使用
/gm ? runplot %T_ID Lua_122038_clear
--]]
function Lua_122038_clear()--測試用(復原狀態)

	local Morake=OwnerID();
	local player=TargetID();
	local roomid=ReadRoleValue(player, EM_RoleValue_RoomID);
	
	--清除上次結果(玩家)
	CancelBuff_NoEvent(player, 624068);
	SetFlag(player, 547702, 0);
	
	--清除上一次的結果(NPC)
	local IsPlaying=EM_RoleValue_Register1;
	WriteRoleValue(Morake, IsPlaying, 0);
	local TriggerPlayerID=EM_RoleValue_Register2;
	WriteRoleValue(Morake, TriggerPlayerID, 0);
	
	--宣告變數
	local _list={122039, 122041};
	local time=table.getn(_list);
	local total = SetSearchAllNPC(roomid);
	for pos=1, total, 1 do
		local who=GetSearchResult();
		local orgid=ReadRoleValue(who, EM_RoleValue_OrgID);
		for i=1, time, 1 do
			if orgid==_list[i] then
				DelObj(who);
			end
		end
	end
end