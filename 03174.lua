function gmDungeon1974_create()
	local me = this()
	local boss = Christine.Npc:new():create(108965, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1974_createair()
	local me = this()
	local boss = Christine.Npc:new():create(109080, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1974_waterknife()
	local flags = Christine.FlagGroup:new(781422)
	local a, b, npc
	local pairflags = {{0, 1}, {2, 3}, {4, 5}, {6, 7}, {8, 9}, {10, 11}, {12, 13}, {14, 15}}
	for i = 1, 8 do
		local pairflag = pairflags[i]
		if RandRange(1, 2) == 1 then
			a = pairflag[1]
			b = pairflag[2]
		else
			a = pairflag[2]
			b = pairflag[1]
		end
		npc = Christine.Npc:new()
		npc:create(109079, flags[a].x, flags[a].y, flags[a].z, 0)
		npc.fight = true
		npc.strike_back = false
		npc.search_enemy = false
		npc.show_role_head = false
		npc.hide_name = true
		npc.mark = false
		npc:addToPartition(room_id)
		npc:castSpell(flags[b].x, flags[b].y, flags[b].z, 851995)
		npc.live_time = 10
	end
end
function gmDungeon1974_waterknife2()
	local flags = Christine.FlagGroup:new(781422)
	local a, b, npc
	local me = this()
	a = 5
	b = 7
	npc = Christine.Npc:new()
	npc:create(109079, me.x, me.y, me.z, 0)
	npc.fight = false
	npc.strike_back = false
	npc.search_enemy = false
	npc.show_role_head = false
	npc.hide_name = true
	npc.mark = false
	npc:addToPartition(room_id)
	npc:castSpell(flags[b].x, flags[b].y, flags[b].z, 851995)
	npc.live_time = 10
end
function gmDungeon1974_waterknife3()
	local flags = Christine.FlagGroup:new(781422)
	local a, b, npc, target
	if RandRange(1, 2) == 1 then
		a = 5
		b = 7
	else
		a = 7
		b = 5
	end
	npc = Christine.Npc:new()
	npc:create(109079, flags[a].x, flags[a].y, flags[a].z, 0)
	npc.fight = false
	npc.strike_back = false
	npc.search_enemy = false
	npc.show_role_head = false
	npc.hide_name = true
	npc.mark = false
	npc:addToPartition(room_id)
	target = Christine.Npc:new()
	target:create(109079, flags[b].x, flags[b].y, flags[b].z, 0)
	target.fight = false
	target.strike_back = false
	target.search_enemy = false
	target.show_role_head = false
	target.hide_name = true
	target.mark = false
	target:addToPartition(room_id)
	npc:castSpell(target, 851995)
	npc.live_time = 10
	if RandRange(1, 2) == 1 then
		a = 6
		b = 8
	else
		a = 8
		b = 6
	end
	npc = Christine.Npc:new()
	npc:create(109079, flags[a].x, flags[a].y, flags[a].z, 0)
	npc.fight = false
	npc.strike_back = false
	npc.search_enemy = false
	npc.show_role_head = false
	npc.hide_name = true
	npc.mark = false
	npc:addToPartition(room_id)
	npc:castSpell(flags[b].x, flags[b].y, flags[b].z, 851995)
	npc.live_time = 10
end
function gmDungeon1974_waterknife4()
	local flags = Christine.FlagGroup:new(781422)
	dungeon_197_4:debug("water knife")
	local a, b, v, d, uv, cast_p, t
	local pairflags = {
		{0, 1},
		{2, 3},
		{4, 5},
		{6, 7},
		{8, 9},
		{10, 11},
		{12, 13},
		{14, 15}
	}
	local select_pairflags = table.random(pairflags, 4)
	for i = 1, #select_pairflags do
		local pairflag = pairflags[i]
		if RandRange(1, 2) == 1 then
			a = flags[pairflag[1]]
			b = flags[pairflag[2]]
		else
			a = flags[pairflag[2]]
			b = flags[pairflag[1]]
		end
		v = {
			x = b.x - a.x,
			z = b.z - a.z
		}
		d = math.sqrt(v.x ^ 2 + v.z ^ 2)
		uv = {x = v.x / d * 40, z = v.z / d * 40}
		cast_p = {x = a.x, y = a.y, z = a.z}
		t = d / 40
		for times = 1, t do
			dungeon_197_4_waterknife(cast_p.x, cast_p.y, cast_p.z, times * 5)
			cast_p.x = cast_p.x + uv.x
			cast_p.z = cast_p.z + uv.z
			cast_p.y = GetHeight(cast_p.x, cast_p.y, cast_p.z)
		end
	end
end
function gmDungeon1974_waterknife5()
	local d = 10
	local boss = OwnerID()
	local WavePos = 3
	local flag_id = 781422
	local WaveTime = 10
	local Wave = {}
	local WaveLv = 100
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	
	for i = 1 , 4 , 1 do
		Wave[i] = {}
	end

	PlayMotion( boss , ruFUSION_ACTORSTATE_BUFF_SP01 )
	local RandNum1 = DW_Rand(WavePos)
	local RandNum2 = DW_Rand(WavePos) + WavePos
	Wave[1][1] = CreateObjByFlag(109079 , flag_id ,RandNum1, 1 )
	Wave[2][1]= CreateObjByFlag(109079 , flag_id ,RandNum1 + WavePos*2 , 1 )
	Wave[3][1] = CreateObjByFlag(109079 , flag_id ,RandNum2 , 1 )
	Wave[4][1] = CreateObjByFlag(109079 , flag_id ,RandNum2 + WavePos*2 , 1 )
	AdjustFaceDir(Wave[1][1] , Wave[2][1] , 0 ) 
	AdjustFaceDir(Wave[2][1] , Wave[1][1] , 0 ) 
	AdjustFaceDir(Wave[3][1] , Wave[4][1] , 0 ) 
	AdjustFaceDir(Wave[4][1] , Wave[3][1] , 0 ) 
	sleep( 5 )
	for j = 1 , 4 , 1 do
		local Cal
		local obj = Role:new( Wave[j][1] )
		Cal = (math.pi/180)*(obj:Dir()) 
		local Y1 = GetHeight( obj:X() - d* math.sin( Cal ), obj:Y()  , obj:Z() - d * math.cos( Cal ) );
		local Y2 = GetHeight( obj:X() + d* math.sin( Cal ), obj:Y()  , obj:Z() + d * math.cos( Cal )  );
		Wave[j][2] =  CreateObj ( 109079 , obj:X() - d* math.sin( Cal ), Y1, obj:Z() - d * math.cos( Cal ) , obj:Dir() , 1)
		Wave[j][3] =  CreateObj ( 109079 , obj:X() + d* math.sin( Cal ), Y2  , obj:Z() + d * math.cos( Cal ) , obj:Dir() , 1)
	end
	for j = 1 , 4 , 1 do
		for i = 1 , 3 , 1 do
			Lua_ObjDontTouch( Wave[j][i] )
			WriteRoleValue( Wave[j][i]  , EM_RoleValue_LiveTime, WaveTime )
			AddToPartition(  Wave[j][i]  , RoomID )
		end
	end
	sleep( 5 )
	CastSpellLV(  Wave[2][1] ,  Wave[1][1] , 493214 ,WaveLv ) 
	CastSpellLV(  Wave[2][2] ,  Wave[3][1] , 493214 ,WaveLv ) 
	CastSpellLV(  Wave[4][2] ,  Wave[3][3] , 493214 ,WaveLv )
	sleep(3)
	CastSpellLV(  Wave[3][1] ,  Wave[4][1] , 493214 ,WaveLv ) 
	CastSpellLV(  Wave[1][2] ,  Wave[2][3] , 493214 ,WaveLv ) 
	CastSpellLV(  Wave[3][2] ,  Wave[4][3] , 493214 ,WaveLv )
	sleep( 27 )
	CastSpellLV(  Wave[1][1] ,  Wave[2][1] , 493215 ,WaveLv ) 
	CastSpellLV(  Wave[1][3] ,  Wave[2][2] , 493215 ,WaveLv ) 
	CastSpellLV(  Wave[3][3] ,  Wave[4][2] , 493215 ,WaveLv )
	sleep(3)
	CastSpellLV(  Wave[4][1] ,  Wave[3][1] , 493215 ,WaveLv ) 
	CastSpellLV(  Wave[2][3] ,  Wave[1][2] , 493215 ,WaveLv ) 
	CastSpellLV(  Wave[4][3] ,  Wave[3][2] , 493215 ,WaveLv )
	sleep(7)
end
function gmDungeon1974_waterknife6()
	local flags = Christine.FlagGroup:new(781422)
	local a, b, npc
	local pairflags_sample = {{0, 1}, {2, 3}, {4, 5}, {6, 7}, {8, 9}, {10, 11}, {12, 13}, {14, 15}}
	local pairflags = table.random(pairflags_sample, 4)
	for i = 1, 4 do
		local pairflag = pairflags[i]
		if RandRange(1, 2) == 1 then
			a = pairflag[1]
			b = pairflag[2]
		else
			a = pairflag[2]
			b = pairflag[1]
		end
		npc = Christine.Npc:new()
		npc:create(109079, flags[a].x, flags[a].y, flags[a].z, 0)
		npc.fight = false
		npc.strike_back = false
		npc.search_enemy = false
		npc.show_role_head = false
		npc.hide_name = true
		npc.mark = false
		npc:addToPartition(room_id)
		npc:addBuff(626124)
		MoveDirect(npc.guid, flags[b].x, flags[b].y, flags[b].z)
		npc.live_time = 8
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108965()
	local room_id = this().room_id
	dungeonInitialize_197_4(room_id)
	Cl_Resist_HackersBossNum()
end
function npcDead_108965()
	local room_id = this().room_id
	if not dungeon_197_4 or not dungeon_197_4[room_id] then
		debugmsg(0, 0, "not found dungeon_197_4")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108965_04]", 0)
	if dungeon_197_4[room_id].status == "fight" then
		dungeon_197_4[room_id].status = "success"
		Cl_Resist_HackersBossDead()
		sasa_ZoneDungeon_title_01(530984)
	end
end
function npcBeginFight_108965()
	local room_id = this().room_id
	if not dungeon_197_4 or not dungeon_197_4[room_id] then
		debugmsg(0, 0, "not found dungeon_197_4")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108965_01]", 0)
	if dungeon_197_4[room_id].status == "ready" then
		dungeonActive_197_4(room_id)
		Cl_Resist_HackersFightBegin()
	end
end
function npcEndFight_108965()
	local room_id = this().room_id
	if not dungeon_197_4 or not dungeon_197_4[room_id] then
		debugmsg(0, 0, "not found dungeon_197_4")
		return false
	end
	ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108965_03]", 0)
	if dungeon_197_4[room_id].status == "fight" then
		dungeon_197_4[room_id].status = "fail"
		dungeon_197_4[room_id].boss.search_enemy = false
		dungeon_197_4[room_id].boss.strike_back = false
		dungeon_197_4[room_id].boss.fight = false
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
--微量空氣
function npcCreate_109080()
	local obj = this()
	obj:addBuff(625890)
	obj.live_time = 6
end
------------------------------------------------------------------
------------------------------------------------------------------
--微量空氣檢查
function magicObject_625866()
	local player = that()
	player:cancelBuff(625865)
	return true
end
--深海束縛檢查
function magicObject_625865()
	local player = that()
	--如果有微量空氣buff就取消
	if player:checkBuff(625866) then
		return false
	end
	return true
end
--水舞輕揚結束
function magicObject_625888()
	local room_id = this().room_id
	if not dungeon_197_4 or not dungeon_197_4[room_id] then
		debugmsg(0, 0, "not found dungeon_197_4")
		return false
	end
	--BOSS移動到場面任一點
	local target = table.random(dungeon_197_4[room_id].battle_listener.players, 1)[1]
	if target then
		dungeon_197_4[room_id].boss:changePosition(target.x, target.y, target.z, 0)
	end
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_197_4()
	debugmsg(0, 0, "dungeonSetting_197_4")

	dungeon_197_4 = Christine.System:new("dungeon_197_4")
	dungeon_197_4.alpha = false
	dungeon_197_4.beta = false
	dungeon_197_4.delay = 1

	dungeon_197_4.skill = {}

--	深水祕術
	dungeon_197_4.skill.skill1 = Christine.Skill:new()
	dungeon_197_4.skill.skill1.name = "skill1"
	dungeon_197_4.skill.skill1.cd = 7
	function dungeon_197_4.skill.skill1:active(caster, target)
		dungeon_197_4:sleep()
		return caster:castSpell(target, 851993)
	end

--	水箭
	dungeon_197_4.skill.skill2 = Christine.Skill:new()
	dungeon_197_4.skill.skill2.name = "skill2"
	dungeon_197_4.skill.skill2.cd = 7
	function dungeon_197_4.skill.skill2:active(caster)
		dungeon_197_4:sleep()
		return caster:castSpell(caster, 851994)
	end
end

function dungeonInitialize_197_4(room_id)
	debugmsg(0, 0, "dungeonInitialize_197_4")

	if not dungeon_197_4 then
		dungeonSetting_197_4()
	elseif dungeon_197_4.alpha then
		dungeonSetting_197_4()
	end

	dungeon_197_4[room_id] = {}
	dungeon_197_4[room_id].boss = this()
	dungeon_197_4[room_id].boss.search_enemy = true
	dungeon_197_4[room_id].boss.strike_back = true
	dungeon_197_4[room_id].boss.fight = true

	dungeon_197_4[room_id].boss:addSkill("skill1", dungeon_197_4.skill.skill1)
	dungeon_197_4[room_id].boss:addSkill("skill2", dungeon_197_4.skill.skill2)

	dungeon_197_4[room_id].battle_listener = Christine.BattleListener:new()
	dungeon_197_4[room_id].battle_listener:add(dungeon_197_4[room_id].boss)

	dungeon_197_4[room_id].status = "ready"
end

function dungeonActive_197_4(room_id)
	debugmsg(0, 0, "dungeonActive_197_4")

	dungeon_197_4[room_id].status = "fight"
	dungeon_197_4[room_id].boss:callPlot("dungeonMain_197_4", room_id)
	dungeon_197_4[room_id].boss:callPlot("npcAI_108965", room_id)
	dungeon_197_4[room_id].boss:addBuff(625889)
end

function dungeonMain_197_4(room_id)
	debugmsg(0, 0, "dungeonMain_197_4")

	local boss = dungeon_197_4[room_id].boss
	local battle_listener = dungeon_197_4[room_id].battle_listener
	local bbb = true
	local flags = Christine.FlagGroup:new(781422)
	local hp_pointer = 0.91

	while dungeon_197_4[room_id].status == "fight" do
		battle_listener:start()

		if bbb and battle_listener.duration_time > 480 then
			bbb = false
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108965_02]", 0)
			boss:addBuff(625798)
		end

		if boss.hp < boss.max_hp * hp_pointer then
			ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108965_05]", 0)
			boss:addBuff(625868)
			hp_pointer = hp_pointer - 0.1
		end

		-- 產生微量空氣
		if battle_listener.duration_time % 8 == 0 then
			dungeon_197_4:debug("create microair")
			local microair, angle, distance, x, y, z
			local boss_x = boss.x
			local boss_y = boss.y
			local boss_z = boss.z
			for i = 1, 8 do
				angle = RandRange(1, 360) / 180 * math.pi
				distance = RandRange(30, 120)
				x = boss_x + math.cos(angle) * distance
				z = boss_z + math.sin(angle) * distance
				y = GetHeight(x, boss_y, z)
				microair = Christine.Npc:new()
				microair:create(109080, x, y, z, 0)
				microair.fight = false
				microair.strike_back = false
				microair.search_enemy = false
				microair.show_role_head = false
				microair.hide_name = true
				microair.mark = false
				microair:addToPartition(room_id)
			end
		end

		-- 弒魂水刀
		if battle_listener.duration_time > 0 then
			if battle_listener.duration_time % 13 == 0 then
	-----------------------------弒魂水刀 START-----------------------------
				local a, b, npc
				local pairflags_sample = {{0, 1}, {2, 3}, {4, 5}, {6, 7}, {8, 9}, {10, 11}, {12, 13}, {14, 15}, {16, 17}, {18, 19}}
				local pairflags = table.random(pairflags_sample, 6)
				for i = 1, #pairflags do
					local pairflag = pairflags[i]
					if RandRange(1, 2) == 1 then
						a = pairflag[1]
						b = pairflag[2]
					else
						a = pairflag[2]
						b = pairflag[1]
					end
					npc = Christine.Npc:new()
					npc:create(109079, flags[a].x, flags[a].y, flags[a].z, 0)
					npc.fight = false
					npc.strike_back = false
					npc.search_enemy = false
					npc.show_role_head = false
					npc.hide_name = true
					npc.mark = false
					npc:addToPartition(room_id)
					npc:addBuff(626124)
					MoveDirect(npc.guid, flags[b].x, flags[b].y, flags[b].z)
					npc.live_time = 8
				end
	-----------------------------弒魂水刀 END-----------------------------
			end

			-- 深海漩渦
			if battle_listener.duration_time % 19 == 0 then
				local target = table.random(battle_listener.players, 1)[1]
				if target then
					local angle = RandRange(1, 360) / 180 * math.pi
					local x = target.x + math.cos(angle) * 50
					local z = target.z + math.sin(angle) * 50
					local y = GetHeight(x, target.y, z)
					local npc = Christine.Npc:new()
					npc:create(109195, x, y, z, 0)
					npc.fight = false
					npc.strike_back = false
					npc.search_enemy = false
					npc.show_role_head = false
					npc.hide_name = true
					npc.mark = false
					npc:addBuff(624031)
					npc:addToPartition(room_id)
					npc.live_time = 25
					npc:callPlot("npcAI_109079", room_id)
				end
			end
		end

		dungeon_197_4:sleep()
	end

	battle_listener:stop()

	local count = SetSearchAllPlayer(room_id)
	for i = 1, count do
		local player = that(GetSearchResult())
		player:cancelBuff(625865)
	end

	local npc
	for index, npc_guid in pairs(SearchRangeNPC(OwnerID(), 300)) do
		npc = that(npc_guid)
		if npc.ORGID == 109079 or npc.ORGID == 109079 or npc.ORGID == 109080 then
			npc:delete()
		end
	end

	if dungeon_197_4[room_id].status == "success" then
		dungeon_197_4:debug("success")
	elseif dungeon_197_4[room_id].status == "fail" then
		dungeon_197_4:debug("fail")
		boss:hide_from_room():sleep(3)
		boss:show_to_room(room_id)
		dungeonInitialize_197_4(room_id)
	end
end
function dungeon_197_4_waterknife(x, y, z, delay)
	local npc = Christine.Npc:new()
	npc:create(109079, x, y, z, 0)
	npc.fight = false
	npc.strike_back = false
	npc.search_enemy = false
	npc.show_role_head = false
	npc.hide_name = true
	npc.mark = false
	npc:addToPartition(room_id)
	npc:callPlot("dungeon_197_4_waterknifecast", x, y, z, delay)
end
function dungeon_197_4_waterknifecast(x, y, z, delay)
	Sleep(delay)
	local npc = this()
	npc:castSpell(x, y, z, 851995)
	npc.live_time = 1
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcAI_108965(room_id)
	debugmsg(0, 0, "npcAI_108965")

	local boss = dungeon_197_4[room_id].boss
	local battle_listener = dungeon_197_4[room_id].battle_listener

	while dungeon_197_4[room_id].status == "fight" do
		if #boss.hate_list > 0 then
			if boss:useSkill("skill1", that(boss.attack_target_GUID)) then
			elseif boss:useSkill("skill2") then
			end
		end
		dungeon_197_4:sleep()
	end
end
--炫窩AI
function npcAI_109079(room_id)
	debugmsg(0, 0, "npcAI_109079")

	local npc = this()
	local boss = dungeon_197_4[room_id].boss
	local battle_listener = dungeon_197_4[room_id].battle_listener
	local target

	Sleep(20)
	npc:addBuff(625870)

	while dungeon_197_4[room_id].status == "fight" do
		if target then
			if target.is_dead then
				target = nil
			else
				npc:move(target.x, target.y, target.z, true)
			end
		else
			target = table.random(battle_listener.players, 1)[1]
		end
		dungeon_197_4:sleep()
	end
	npc.live_time = 1
end