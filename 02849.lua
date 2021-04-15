function Lua_call_heavenroad()
	local player = OwnerID()
	local npc = TargetID()
	CallPlot(npc, "Lua_heavenroad", player)
end

function Lua_heavenroad(_player)						-- 殘酷天堂路函式
	local handler = OwnerID()

	local heavenroad = {							-- public
		handler = handler,
		player = _player,
		flag = 781264,
		pillars = {},
		deadball_active = false,
		deadballs = {},
		openfire_active = false,
		is_exit = false,
		jolin = {}							-- BOSS的狀態和數值
	}

	Lua_heavenroad_set_pillar(heavenroad)				-- 設置堅挺大石柱
	Lua_heavenroad_set_boss(heavenroad)				-- 設置殘酷天后

	while heavenroad.is_exit == false do					-- 離開遊戲前持續loop
		Lua_heavenroad_watcher(heavenroad)				-- 監控玩家和遊戲物件狀況

		if heavenroad.deadball_active then				-- 啟動要你命球
			Lua_heavenroad_deadball(heavenroad)
		end

		if heavenroad.openfire_active then				-- 啟動發情地獄火
			Lua_heavenroad_openfire(heavenroad)
		end

		if heavenroad.jolin.is_fightint then
			Lua_heavenroad_boss_ai(heavenroad)			-- 進入戰鬥的話執行ai
		end
		
		Sleep(10)
	end
end

function Lua_heavenroad_watcher(heavenroad)				-- 監控遊戲狀況

	local jolin = heavenroad.jolin

	local player_z = ReadRoleValue(heavenroad.player, EM_RoleValue_Z)	-- 玩家位置
	if player_z <= GetMoveFlagValue(heavenroad.flag, 0, EM_RoleValue_Z) + 150 and player_z > GetMoveFlagValue(heavenroad.flag, 2, EM_RoleValue_Z) - 80 then	-- 如果玩家在第一排第二排旗標之間
		if heavenroad.deadball_active == false then
			ScriptMessage(heavenroad.handler, heavenroad.player, 2, "[SC_ADDY_HEAVENROAD_01]", C_SYSTEM)						-- 歡迎光臨，要你命飛球關卡~
		end
		heavenroad.deadball_active = true
	else																					-- 離開要你命飛球範圍重置要你命飛球
		if heavenroad.deadball_active then 
			heavenroad.deadball_active = false
			Lua_heavenroad_deadball_initialize(heavenroad)
		end
	end

	if player_z <= GetMoveFlagValue(heavenroad.flag, 4, EM_RoleValue_Z) + 150 and player_z > GetMoveFlagValue(heavenroad.flag, 6, EM_RoleValue_Z) - 80 then	-- 如果玩家在第三排第四排旗標之間
		if heavenroad.openfire_active == false then
			ScriptMessage(heavenroad.handler, heavenroad.player, 2, "[SC_ADDY_HEAVENROAD_02]", C_SYSTEM)						-- 歡迎光臨，發情地獄火關卡~
		end
		heavenroad.openfire_active = true
	else
		if heavenroad.openfire_active then 
			heavenroad.openfire_active = false
		end
	end

	if HateListCount(jolin.guid) ~= 0 then										-- 是否戰鬥中
		if jolin.is_fightint == false then jolin.start_time = GetSystime(0) end					-- 剛進入戰鬥重置開始時間

		jolin.is_fightint = true
		jolin.now_time = GetSystime(0)									-- 刷新當前時間
		jolin.hp = ReadRoleValue(jolin.guid, EM_RoleValue_HP)							-- 刷新血量

		if ReadRoleValue(jolin.guid, EM_RoleValue_SpellMagicID) ~= 0 then					-- 是否施法中
			jolin.is_casting = true
		else
			jolin.is_casting = false
		end
	else
		jolin.is_fightint = false
	end

	if ReadRoleValue(jolin.guid, EM_RoleValue_IsDead) == 1 then							-- 是否死亡
		jolin.is_alive = false
	else
		jolin.is_alive = true
	end

	if jolin.is_alive == false then											-- Jolin死亡我們就離開~
		Say(heavenroad.player, "exit")
		heavenroad.is_exit = true
	end

end

function Lua_heavenroad_deadball(heavenroad)									-- 飛球要你命函式
	local deadball = 121999
	local amount = {2, 3}
	local pid = {0, 1, 2, 3}
	local casting_height = 10

	for index = 1, amount[RandRange(1, #amount)] do								-- 隨機選擇產量
		local _pid = pid[RandRange(1, #pid)]									-- 產生pid
		local _target_pid											-- 飛行目的pid
		while _target_pid  == nil or _target_pid == _pid do							-- 不與產生pid重複
			_target_pid = pid[RandRange(1, #pid)]
		end

		local _deadball = create_object(									-- 製造一個球
			deadball,
			GetMoveFlagValue(heavenroad.flag, _pid, EM_RoleValue_X),
			GetMoveFlagValue(heavenroad.flag, _pid, EM_RoleValue_Y) + casting_height,
			GetMoveFlagValue(heavenroad.flag, _pid, EM_RoleValue_Z),
			GetMoveFlagValue(heavenroad.flag, _pid, EM_RoleValue_Dir),
			{EM_SetModeType_Gravity, false}
		)
		Move(													-- 飛向目的
			_deadball,
			GetMoveFlagValue(heavenroad.flag, _target_pid, EM_RoleValue_X),
			GetMoveFlagValue(heavenroad.flag, _target_pid, EM_RoleValue_Y) + casting_height,
			GetMoveFlagValue(heavenroad.flag, _target_pid, EM_RoleValue_Z)
		)
		WriteRoleValue(_deadball, EM_RoleValue_Register1, GetMoveFlagValue(heavenroad.flag, _target_pid, EM_RoleValue_X))
		MoveToFlagEnabled(_deadball, false)
		AddBuff(_deadball, 504491, 0, 3600)									-- 加速buff

		table.insert(heavenroad.deadballs, _deadball)								-- 插入列表，提供重置使用
	end

--	Sleep(delay[RandRange(1, #delay)])
end

function Lua_heavenroad_deadball_initialize(heavenroad)								-- 重置要你命飛球關卡
	DebugMsg(0, 0, "function >> Lua_heavenroad_deadball_initialize(heavenroad) ... ")
	for index, deadball in pairs(heavenroad.deadballs) do								-- 清除所有要你命飛球
		DelObj(deadball)
	end
	heavenroad.deadballs = {}
end

function Lua_heavenroad_openfire(heavenroad)									-- 地獄火發情函式
	local magic = 850707
	local delay = {2, 7, 12}
	local pillar = {													-- 要發情的柱子
		heavenroad.pillars[5],
		heavenroad.pillars[6],
		heavenroad.pillars[7],
		heavenroad.pillars[8]
	}

	local _pillar = pillar[RandRange(1, #pillar)]									-- 
	if _pillar == pillar[1] then
		CastSpell(_pillar, pillar[2], magic)
	elseif _pillar == pillar[2] then
		CastSpell(_pillar, pillar[1], magic)
	elseif _pillar == pillar[3] then
		CastSpell(_pillar, pillar[4], magic)
	elseif _pillar == pillar[4] then
		CastSpell(_pillar, pillar[3], magic)
	end

	Sleep(delay[RandRange(1, #delay)])
end

function Lua_heavenroad_ball_casing()											-- 要你命球產生後觸發，持續施法
	local deadball = OwnerID()
	while true do
		SysCastSpellLv(deadball, deadball, 850705, 0)
		if ReadRoleValue(deadball, EM_RoleValue_X) == ReadRoleValue(deadball, EM_RoleValue_Register1) then
			DelObj(deadball)
		end
		Sleep(10)
	end
end

function Lua_heavenroad_ball_result()											-- 要你命飛球成功擊中後結果
	local deadball = OwnerID()
	local player = TargetID()
	local debuff = 624139

	AddBuff(player, debuff, 0, 60)

	DebugMsg(0, 0, BuffInfo(player, Lua_BuffPosSearch(player, debuff), EM_BuffInfoType_Power))
	if BuffInfo(player, Lua_BuffPosSearch(player, debuff), EM_BuffInfoType_Power) >= 2 then			-- 不懂為甚麼都比遊戲內看到的少1
		set_position_to_flag(player, 781264, 9)
		CancelBuff(player, debuff)
	end

	DelObj(deadball)
end

function Lua_heavenroad_fire()												-- 被發情地獄火打到觸發生怪
	local deadball = OwnerID()
	local player = TargetID()
	local monster = 107684

	Lua_CreateObjToRandownPos(player, monster, 1, 5, true)
end

function Lua_heavenroad_set_wall()											-- 設置石牆函式，手動啟動
	local flag = 781264
	local wall = 119990
	local wall_width = 180

	local left_x = -460
	local right_x = -700
	local start_z = -600
	local end_z = 660

	local amount_z = math.ceil(math.abs(start_z - end_z) / wall_width)

	for index = 0, amount_z - 1, 1 do
		local z = start_z + wall_width * index
		create_object(
			wall,
			left_x,
			GetHeight(left_x, 0, z),
			z,
			0,
			{EM_SetModeType_Obstruct, true}
		)
		create_object(
			wall,
			right_x,
			GetHeight(left_x, 0, z),
			z,
			0,
			{EM_SetModeType_Obstruct, true}
		)
	end
end

function Lua_heavenroad_set_pillar(heavenroad)									-- 設置石柱

	local pillar = 122051
	local pillar_pid = {0, 1, 2, 3, 4, 5, 6, 7}
	local boss_pid = 8

	for index, pid in pairs(pillar_pid) do
		heavenroad.pillars[index] = create_object(
			pillar,
			GetMoveFlagValue(heavenroad.flag, pid, EM_RoleValue_X),
			GetMoveFlagValue(heavenroad.flag, pid, EM_RoleValue_Y),
			GetMoveFlagValue(heavenroad.flag, pid, EM_RoleValue_Z),
			GetMoveFlagValue(heavenroad.flag, pid, EM_RoleValue_Dir),
			{EM_SetModeType_Obstruct, true}
		)
	end

end

function Lua_heavenroad_set_boss(heavenroad)									-- 設置BOSS

	local jolin = {
		guid,
		id = 107685,
		born_pid = 8,
		start_time = 0,
		now_time = 0,
		is_alive = true,
		is_fightint = false,
		has_shouted = false,
		is_casting = false,
		casting_list = {},
		max_hp,
		hp
	}

	jolin.guid = create_object(
		jolin.id,
		GetMoveFlagValue(heavenroad.flag, jolin.born_pid, EM_RoleValue_X),
		GetMoveFlagValue(heavenroad.flag, jolin.born_pid, EM_RoleValue_Y),
		GetMoveFlagValue(heavenroad.flag, jolin.born_pid, EM_RoleValue_Z),
		GetMoveFlagValue(heavenroad.flag, jolin.born_pid, EM_RoleValue_Dir),
		{EM_SetModeType_Searchenemy, false,
		 EM_SetModeType_Fight, false}
	)

	jolin.max_hp = ReadRoleValue(jolin.guid, EM_RoleValue_MaxHP)
	jolin.hp = ReadRoleValue(jolin.guid, EM_RoleValue_HP)

	heavenroad.jolin = jolin

	SetPlot(jolin.guid, "touch", "Lua_heavenroad_boss_shout", 50)

end

function Lua_heavenroad_boss_shout()										-- 戰鬥前讓jolin跳個舞
	local jolin = TargetID()
	AddBuff(jolin, 622310, 1, 86400)

	local motion = {
		ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE, "chin bai yao yao~~", 10,
		ruFUSION_ACTORSTATE_EMOTE_TAPDANCE, "follow my step!!!!!!!!!!!!!!!!!!!", 20
	}

	for index = 1, #motion, 3 do
		PlayMotion(jolin, motion[index])
		Say(jolin, motion[index + 1])
		Sleep(motion[index + 2])
	end

	SetModeEx(jolin, EM_SetModeType_Fight, true)
	SetModeEx(jolin, EM_SetModeType_Searchenemy, true)
	CancelBuff(jolin, 622310)

	SetPlot(jolin, "touch", "", 0)
end

function Lua_heavenroad_boss_ai(heavenroad)									-- Jolin AI
	local jolin = heavenroad.jolin
	local target = ReadRoleValue(jolin.guid, EM_RoleValue_AttackTargetID)
	local consuming_time = jolin.now_time - jolin.start_time + 1							-- 避開0秒
	local bomb_id = 113229

	if consuming_time / 5 == Lua_get_integer(consuming_time / 5) then						-- 5秒生炸彈
		local bombs = Lua_CreateObjToRandownPos(jolin.guid, bomb_id, 2, 100, true)
		for i, v in pairs(bombs) do										-- 產生後3秒後爆炸
			BeginPlot(v, "Lua_heavenroad_bomb_explode", 30)
		end
	end

	if consuming_time / 7 == Lua_get_integer(consuming_time / 7) then						-- 7秒施法
		table.insert(jolin.casting_list, 493232)
	end

	if consuming_time / 9 == Lua_get_integer(consuming_time / 9) then						-- 9秒施法
		table.insert(jolin.casting_list, 850702)
	end

	if #jolin.casting_list > 0 and jolin.is_casting == false then							-- 施法列表有法術又沒再施法的話就施法
		local _magic = table.remove(jolin.casting_list, 1)
		CastSpell(jolin.guid, target, _magic)
		if _magic == 493232 then Say(jolin.guid, "[ZONE955_JOLIN_S2]") end
		if _magic == 850702 then Say(jolin.guid, "[ZONE955_JOLIN_S3]") end
	end
end

function Lua_heavenroad_bomb_explode()										-- 炸彈爆炸
	local bomb = OwnerID()
	SysCastSpellLv(bomb, bomb, 850713, 0)
	Sleep(10)
	DelObj(bomb)
end

function Lua_explode_check()
	return true
end

function Lua_explode_result()
end