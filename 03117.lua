------------------------------------------------------
--	Zone 30 Dungeon
------------------------------------------------------

------------------------------------------------------
--	Npc 108440 奇奇尼亞 BOSS
------------------------------------------------------
local g_ActObjs = {};	-- 用以建立火、風、地、水能量柱特效
--
local _numList = { };
local _randLiet = { };
function npc_108440_create()	-- 奇奇尼亞　掛載於物件產生劇情
	Cl_Resist_HackersBossNum();
	local room_id = this().room_id
	_numList[ room_id ] = { };
	_randLiet[ room_id ] = { 1 , 2 , 3 , 4 };
	zone30dungeon_jiji_initialize(room_id)
	local jiji = zone30dungeon_jiji[room_id].jiji	-- 奇奇尼亞將自己定義為 jiji
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener

	jiji:property {
		fight = true,
		strike_back = true,
		search_enemy = true,
		movable = true,
		hp = jiji.max_hp
	} 
	jiji:addSkill(zone30dungeon_jiji.skill.boss_skill_1.name, zone30dungeon_jiji.skill.boss_skill_1)	-- 能量噴發
	jiji:addSkill(zone30dungeon_jiji.skill.boss_skill_2.name, zone30dungeon_jiji.skill.boss_skill_2)	-- 震盪衝擊
	battle_listener:add(jiji)
	for buff_id, buff in pairs(jiji.buff) do	-- 移除奇奇所有Buff
		buff:remove()
	end
	AddBuff( OwnerID() , 625607 , 0 , -1 );	-- 無敵
--	Cl_Resist_HackersBossNum();
end
function npc_108440_begin_fight()	-- 掛載於 Npc 中的「戰鬥開始」
	local room_id = this().room_id
	zone30dungeon_jiji:debug("begin fight")
	if zone30dungeon_jiji[room_id].status ~= "fight" then
		zone30dungeon_jiji[this().room_id].controller:beginPlot("zone30dungeon_jiji_active")	-- 在該 Room 產生 4 根柱子
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_2_1]", 0)	-- [108440]反應激動：「你們，你們竟然敢闖入我的地盤撒野！」
	end
	Cl_Resist_HackersFightBegin();
end
function npc_108440_end_fight()	-- 掛載於 Npc 中的「戰鬥結束」
	if not this().is_dead then
		zone30dungeon_jiji:debug("end fight")
		zone30dungeon_jiji[this().room_id].status = "fail"
	end
end
function npc_108440_dead()	-- 掛載於 Npc 中的「死亡事件」
	zone30dungeon_jiji:debug("boss dead")
	zone30dungeon_jiji[this().room_id].status = "success"
	Cl_Resist_HackersBossDead();
end

------------------------------------------------------
--	Npc 108447 能量柱 
------------------------------------------------------
function npc_108447_dead()	-- 能量柱低於滿血狀態下被攻擊時執行此函式
---	zone30dungeon_jiji:debug("hit pillar")
	local pillar = this()
	local room_id = pillar.room_id
	local jiji = zone30dungeon_jiji[room_id].jiji

	if pillar.buff[625301] then	-- 增幅能量，柱子啟動時會有10層增幅能量 ，被攻擊會減少，減少至0層時，會停止20秒，並且出現能量增幅中的狀態。
		local power = pillar.buff[625301].power - 1
	---	zone30dungeon_jiji:debug("power = " ..power );
		pillar:cancelBuff(625301)
		if power >= 0 then
		---	zone30dungeon_jiji:debug("pillar power down : " .. power)
			pillar:addBuff(625301, power)
			if not jiji.buff[625607] then
				zone30_4_addBuff(68);	-- 給予奇奇尼亞無敵
			end
		else
		---	zone30dungeon_jiji:debug("pillar power broken")
			pillar:addBuff(625306)	-- 能量增幅中，代表能量增幅裝置已經消耗所有能量，正在重新充能中
--			zone30_4_reomveBuff();
		end
	end
end

function  zone30dungeon_jiji_setting()	-- 奇奇尼亞，物件產生時，定義全域變數與柱子使用的法術
	local zone_id = this().zone_id

	zone30dungeon_jiji = Christine.System:new("30D JIJI")
	zone30dungeon_jiji.alpha = true
	zone30dungeon_jiji.beta = true
	zone30dungeon_jiji.delay = 0.5

	if zone_id == 168 then
		--easy
	elseif zone_id == 167 then
		--normal
	elseif zone_id == 166 then
		--hard
	end

	zone30dungeon_jiji.skill = {}

--	火雨
	zone30dungeon_jiji.skill.pillar_skill_a1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_a1.name = "pillar_skill_a1"
	zone30dungeon_jiji.skill.pillar_skill_a1.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_a1:active(caster, targets)
--		caster:say(self.name)
		if #targets <= 0 then return false end
		local target = table.random(targets, 1)[1]
		caster:castSpell( target , 851518):sleep(1.5)
		return true
	end
	
--	火竄
	zone30dungeon_jiji.skill.pillar_skill_a2 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_a2.name = "pillar_skill_a2"
	zone30dungeon_jiji.skill.pillar_skill_a2.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_a2:active(caster, targets)
		if #targets <= 0 then return false end
--		caster:say(self.name)
		local target = table.random(targets, 1)[1]
		caster:castSpell(target, 851522):sleep(1.5)
		return true
	end

--	龍捲風壓
	zone30dungeon_jiji.skill.pillar_skill_b1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_b1.name = "pillar_skill_b1"
	zone30dungeon_jiji.skill.pillar_skill_b1.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_b1:active(caster)
--		caster:say(self.name)
		local _npc = Christine.Npc:new()
		_npc:create(108556, caster.x, caster.y, caster.z):property {
			fight = false,
			search_enemy = false,
			strike_back = false,
			mark = false,
			hide_hp_mp = true,
			hide_name = true
		} :addBuff(625311):addToPartition(caster.room_id):beginPlot("zone30dungeon_jiji_tornado_ai")
		caster:sleep(1.5)
		return true
	end

--	風之切割
	zone30dungeon_jiji.skill.pillar_skill_b2 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_b2.name = "pillar_skill_b2"
	zone30dungeon_jiji.skill.pillar_skill_b2.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_b2:active(caster, targets)
		if #targets <= 0 then return false end
--		caster:say(self.name)
		local target = table.random(targets, 1)[1]
		caster:castSpell(target, 851523):sleep(1.5)
		return true
	end

--	巨石定身
	zone30dungeon_jiji.skill.pillar_skill_c1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_c1.name = "pillar_skill_c1"
	zone30dungeon_jiji.skill.pillar_skill_c1.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_c1:active(caster)
--		caster:say(self.name)
		caster:castSpell(851520):sleep(1.5)
		return true
	end

--	地藤岩襲
	zone30dungeon_jiji.skill.pillar_skill_c2 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_c2.name = "pillar_skill_c2"
	zone30dungeon_jiji.skill.pillar_skill_c2.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_c2:active(caster, targets)
		if #targets <= 0 then return false end
--		caster:say(self.name)
		local target = table.random(targets, 1)[1]
		caster:castSpell(target, 851524):sleep(1.5)
		return true
	end

--	水潮流體
	zone30dungeon_jiji.skill.pillar_skill_d1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_d1.name = "pillar_skill_d1"
	zone30dungeon_jiji.skill.pillar_skill_d1.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_d1:active(caster)
--		caster:say(self.name)
		caster:castSpell(851521):sleep(1.5)
		return true
	end

--	破水
	zone30dungeon_jiji.skill.pillar_skill_d2 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_d2.name = "pillar_skill_d2"
	zone30dungeon_jiji.skill.pillar_skill_d2.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_d2:active(caster, targets)
		if #targets <= 0 then return false end
--		caster:say(self.name)
		local target = table.random(targets, 1)[1]
		caster:castSpell(target, 851525):sleep(1.5)
		return true
	end

--	能量噴發
	zone30dungeon_jiji.skill.boss_skill_1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.boss_skill_1.name = "boss_skill_1"
	zone30dungeon_jiji.skill.boss_skill_1.cd = 7
	function zone30dungeon_jiji.skill.boss_skill_1:active(caster)
--		caster:say(self.name)
		caster:castSpell(851526):sleep(1.5)
		return true
	end

--	震盪衝擊
	zone30dungeon_jiji.skill.boss_skill_2 = Christine.Skill:new()
	zone30dungeon_jiji.skill.boss_skill_2.name = "boss_skill_2"
	zone30dungeon_jiji.skill.boss_skill_2.cd = 11
	function zone30dungeon_jiji.skill.boss_skill_2:active(caster)
--		caster:say(self.name)
		caster:castSpell(851527):sleep(1.5)
		return true
	end

	zone30dungeon_jiji:debug("setting done")
end

function  zone30dungeon_jiji_initialize(room_id)	-- 奇奇尼亞

	if not zone30dungeon_jiji or zone30dungeon_jiji.alpha then
		zone30dungeon_jiji_setting()	-- 物件產生時，定義全域變數與柱子使用的法術
	end

	if zone30dungeon_jiji[room_id] and
	   zone30dungeon_jiji[room_id].controller and
	   zone30dungeon_jiji[room_id].controller.is_legal then
		zone30dungeon_jiji[room_id].controller:delete()
	end

	g_ActObjs[room_id] = {};	-- 記錄能量柱特效

	zone30dungeon_jiji[room_id] = {}

	zone30dungeon_jiji[room_id].status = "ready"

	zone30dungeon_jiji[room_id].battle_listener = Christine.BattleListener:new()

	zone30dungeon_jiji[room_id].jiji = this()

	zone30dungeon_jiji[room_id].controller = Christine.Npc:new()
	zone30dungeon_jiji[room_id].controller:create(
		108440,
		zone30dungeon_jiji[room_id].jiji.x,
		zone30dungeon_jiji[room_id].jiji.y,
		zone30dungeon_jiji[room_id].jiji.z,
		180)

	zone30dungeon_jiji[room_id].pillars = {}

	zone30dungeon_jiji[room_id].front_door = Christine.Npc:new()
	zone30dungeon_jiji[room_id].front_door:create(108510, 155, 3159, -15, 90):property {
		gravity = false,
		search_enemy = false,
		strike_back = false,
		fight = false,
		movable = false,
		obstruct = true
	}

	zone30dungeon_jiji:debug("initialize done")
end

function zone30dungeon_jiji_active()	-- 產生柱子及呼叫戰鬥開始劇情
	local room_id = this().room_id
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener
	local jiji = zone30dungeon_jiji[room_id].jiji
	local pillars = zone30dungeon_jiji[room_id].pillars
	-- 20150910 阿浩 : 於可以攻擊的能量柱上，新增以物件套用屬性特效的提示，讓玩家更清楚知道哪些能量柱可被攻擊。
	local actObjsID = { 106969, 106971, 106968, 106970 };	-- 火、風、地、水能量柱特效，用以提示玩家能量柱可被攻擊，因能量柱無參考點，故以物件套特效方式取代
	--
	zone30dungeon_jiji[room_id].front_door:addToPartition(room_id)

	local _posList = { { 60 , 60 } , { 60 , -60 } , { -60 , 60 } , { -60 , -60 } };  --jiji.x + 60 - RandRange(1, 120) ,  jiji.z + 60 - RandRange(1, 120)

	local _pillar

	for index = 1, 4 do	-- 建立能量柱與設定能量柱法術
		_pillar = Christine.Npc:new()
		_pillar:create(
			108447,
			jiji.x + _posList[ index ][ 1 ],
			jiji.y,
			jiji.z + _posList[ index ][ 2 ]
		):property {
			fight = false,
			mark = false,
			strike_back = false,
			search_enemy = false,
			movable = false
		} :addToPartition(room_id):addBuff(625311 + index) -- 625290, 625291, 625292, 625293      625306 , 625301
		:lockhp(_pillar.max_hp, "npc_108447_dead")

		-- 20150910 阿浩 : 於可以攻擊的能量柱上，新增以物件套用屬性特效的提示，讓玩家更清楚知道哪些能量柱可被攻擊。
		local elementAct = CreateObj( actObjsID[index], jiji.x+_posList[ index ][ 1 ], jiji.y+60, jiji.z+_posList[ index ][ 2 ], 0, 1 ); 	-- 能量柱特效
		SetModeEx( elementAct, EM_SetModeType_Fight, false );	-- 砍殺
		SetModeEx( elementAct, EM_SetModeType_Show, false );	-- 顯示
		SetModeEx( elementAct, EM_SetModeType_Mark, false );	-- 標記
		SetModeEx( elementAct, EM_SetModeType_Strikback, false );	-- 反擊
		SetModeEx( elementAct, EM_SetModeType_Searchenemy, false );	-- 索敵
		SetModeEx( elementAct, EM_SetModeType_Move, false );	-- 關閉移動
		SetModeEx( elementAct, EM_SetModeType_Gravity, false );	-- 取消重力
		AddToPartition( elementAct, room_id );
		table.insert( g_ActObjs[room_id], elementAct );
--		  :beginPlot("zone30dungeon_jiji_pillar_ai")
--		  :lockhp(_pillar.max_hp, "npc_108447_dead")
		if index == 1 then	-- 火
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_a1.name, zone30dungeon_jiji.skill.pillar_skill_a1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_a2.name, zone30dungeon_jiji.skill.pillar_skill_a2)
		elseif index == 2 then	-- 風
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_b1.name, zone30dungeon_jiji.skill.pillar_skill_b1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_b2.name, zone30dungeon_jiji.skill.pillar_skill_b2)
		elseif index == 3 then	-- 地
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_c1.name, zone30dungeon_jiji.skill.pillar_skill_c1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_c2.name, zone30dungeon_jiji.skill.pillar_skill_c2)
		elseif index == 4 then	-- 水
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_d1.name, zone30dungeon_jiji.skill.pillar_skill_d1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_d2.name, zone30dungeon_jiji.skill.pillar_skill_d2)
		end
		battle_listener:add(_pillar)
		table.insert(pillars, _pillar)
	end
	zone30dungeon_jiji[room_id].status = "fight"

	jiji:beginPlot("zone30dungeon_jiji_ai")	-- 奇奇尼亞　戰鬥開始

	while zone30dungeon_jiji[room_id].status == "fight" do
		battle_listener:start()

		zone30dungeon_jiji:sleep()

		for index, pillar in pairs(pillars) do
			if pillar.buff[625306] then	-- 能量增幅中，代表能量增幅裝置已經消耗所有能量，正在重新充能中

				if pillar.buff[625312] and GetModeEx( g_ActObjs[room_id][1], EM_SetModeType_Show ) then	-- 火炎能量裝置
					SetModeEx( g_ActObjs[room_id][1], EM_SetModeType_Show, false );	-- 關閉特效顯示，代表此能量柱無法攻擊 
				end
				if pillar.buff[625313] and GetModeEx( g_ActObjs[room_id][2], EM_SetModeType_Show ) then
					SetModeEx( g_ActObjs[room_id][2], EM_SetModeType_Show, false );
				end
				if pillar.buff[625314] and GetModeEx( g_ActObjs[room_id][3], EM_SetModeType_Show ) then
					SetModeEx( g_ActObjs[room_id][3], EM_SetModeType_Show, false );
				end
				if pillar.buff[625315] and GetModeEx( g_ActObjs[room_id][4], EM_SetModeType_Show ) then
					SetModeEx( g_ActObjs[room_id][4], EM_SetModeType_Show, false );
				end

				if pillar.buff[625312] and jiji.buff[625290] then	-- 火炎能量裝置、火炎護甲
					jiji:cancelBuff(625290)	-- 火炎護甲
				end
				if pillar.buff[625313] and jiji.buff[625291] then
					jiji:cancelBuff(625291)	-- 風傷護甲
				end
				if pillar.buff[625314] and jiji.buff[625292] then
					jiji:cancelBuff(625292)	-- 地烈護甲
				end
				if pillar.buff[625315] and jiji.buff[625293] then
					jiji:cancelBuff(625293)	-- 水痕護甲
				end
			elseif pillar.buff[625301] then	-- 增幅能量
				if pillar.buff[625312] and not jiji.buff[625290] then	-- 火焰能量裝置、火炎護甲
					jiji:addBuff(625290)
				end
				if pillar.buff[625313] and not jiji.buff[625291] then
					jiji:addBuff(625291)
				end
				if pillar.buff[625314] and not jiji.buff[625292] then
					jiji:addBuff(625292)
				end
				if pillar.buff[625315] and not jiji.buff[625293] then
					jiji:addBuff(625293)
				end
			else
				pillar:addBuff(625301, 9):beginPlot("zone30dungeon_jiji_pillar_ai")	-- 給予當前柱子 10 層增幅能量，並執行柱子戰鬥劇情
				if not jiji.buff[625607] then
					zone30_4_addBuff(342);	-- 給予奇奇尼亞無敵
				end
			end
		end

--		zone30dungeon_jiji:debug("players : " .. #battle_listener.players)

	end
	battle_listener:stop()

	for index, pillar in pairs(pillars) do	-- 戰鬥結束時，刪除所有柱子
		pillar:delete()
	end

	for index, Obj in pairs(g_ActObjs[room_id]) do
		DelObj(Obj);
	end

	zone30dungeon_jiji[room_id].front_door:delete()	-- 刪除前門

	if zone30dungeon_jiji[room_id].status == "success" then
		zone30dungeon_jiji:debug("success")
		ScriptMessage(jiji.guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_2_4]", 0)	-- [108440]：「不……咳……還沒完全得到符文能量前，我不能死……嗚……」
	elseif zone30dungeon_jiji[room_id].status == "fail" then
		zone30dungeon_jiji:debug("fail")
		ScriptMessage(jiji.guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_2_3]", 0)	-- [108440]：「嘿，繼續我的偉大研究吧，話說，你們到底是誰啊…？」
		for buff_id, buff in pairs(jiji.buff) do
			buff:remove()
		end
		jiji:delFromPartition():sleep(3):addToPartition(room_id)
	end

	zone30dungeon_jiji:debug("boss end")
end

function zone30dungeon_jiji_ai()	-- 奇奇尼亞　戰鬥開始
	local room_id = this().room_id
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener
	local jiji = zone30dungeon_jiji[room_id].jiji
	local _nowHP;
	local _number = 0;
	local _current;
	local _num = 0;

	while zone30dungeon_jiji[room_id].status == "fight" do	-- 戰鬥劇情
		if #jiji.hate_list > 0 then	-- 仇恨表內有目標時
			jiji:useSkill(zone30dungeon_jiji.skill.boss_skill_1.name)
			jiji:useSkill(zone30dungeon_jiji.skill.boss_skill_2.name)
		elseif #battle_listener.players > 0 then	-- 取監聽中的目標
			jiji:hate(table.random(battle_listener.players, 1)[1])
		end

--		_number = #_numList[ room_id ]
--		DebugMsg(0,0,"_number=".._number);
		_nowHP = jiji.hp / jiji.max_hp;
---		DebugMsg(0,0,"_nowHP=".._nowHP);
		if _nowHP == 1 and _number == 0 then
			zone30_4_numList( RandRange( 1 , 4 ) );
			_number = 1;
		elseif _nowHP <= 0.7 and _number == 1 then
			zone30_4_numList( RandRange( 1 , 3 ) );
			_number = 2;
		elseif _nowHP <= 0.5 and _number == 2 then
			zone30_4_numList( RandRange( 1 , 2 ) );
			_number = 3;
		elseif _nowHP <= 0.3 and _number == 3 then
			zone30_4_numList( 1 );
			_number = 4;
		end

		_num = 0
		for i = 1 , 4 , 1 do
			_current = zone30dungeon_jiji[room_id].pillars[ i ].guid	-- 監控所有的柱子
--			DebugMsg(0,0,"_guid="..zone30dungeon_jiji[room_id].pillars[ i ].guid);
			if CheckBuff( _current , 625306 ) then	-- 當柱子正在能量增幅中時
				_num = _num + 1;
			end
		end
	---	DebugMsg(0,0,"num=".._num.." / "..#_numList[ room_id ] );	-- 未在能量增幅中的柱子 / 已執行戰鬥劇情的柱子
		if _num == #_numList[ room_id ] then
			if jiji.buff[625607] then
				zone30_4_reomveBuff(415);	-- 刪除無敵
			end
		end

		Sleep(10);
--		zone30dungeon_jiji:sleep()
	end
	
	zone30dungeon_jiji:debug("jiji ai shutdown")
end

function zone30dungeon_jiji_pillar_ai()	-- 由柱子執行

	local room_id = this().room_id
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener
	local jiji = zone30dungeon_jiji[room_id].jiji
	local pillars = zone30dungeon_jiji[room_id].pillars
	local pillar
	local pillar_index

	for _index, _pillar in pairs(pillars) do
		if _pillar.GUID == this().GUID then
			pillar = _pillar
			pillar_index = _index
		end
	end

	if not pillar then
		return
	end

	local _list; 
	local _len;
	local _bool = false;

	while zone30dungeon_jiji[room_id].status == "fight" and not pillar.buff[625306] do	-- 當柱子不在能量增幅中時

		if not _bool then
			_list = _numList[ room_id ];
			_len = #_list;
			for i = 1 , _len , 1 do
				if  pillar_index == _list[ i ] then
					_bool = true;
					SetModeEx( OwnerID() , EM_SetModeType_Fight , true );
					SetModeEx( OwnerID() , EM_SetModeType_Mark , true );
					SetModeEx( g_ActObjs[room_id][pillar_index], EM_SetModeType_Show, true );	-- 開啟特效顯示，代表此能量柱可被攻擊 
					if not jiji.buff[625607] then	-- 無敵
						zone30_4_addBuff(457);
					end
				end
			end
		end

		if #battle_listener.players > 0 and _bool then
		---	DebugMsg(0,0,"-----pillar_index="..pillar_index);
			if pillar_index == 1 then
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_a1.name, battle_listener.players)
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_a2.name, battle_listener.players)
			elseif pillar_index == 2 then
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_b1.name)
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_b2.name, battle_listener.players)
			elseif pillar_index == 3 then
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_c1.name)
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_c2.name, battle_listener.players)
			elseif pillar_index == 4 then
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_d1.name)
				pillar:useSkill(zone30dungeon_jiji.skill.pillar_skill_d2.name, battle_listener.players)
			end
			if pillar.move_target then
				pillar:move(pillar.move_target.x, pillar.move_target.y, pillar.move_target.z)
				if pillar:distanceTo(pillar.move_target) < 20 then
					pillar.move_target = nil
				end
			else
				pillar.move_target = table.random(battle_listener.players, 1)[1]
			end
	--		zone30dungeon_jiji:sleep()
		end
	--	zone30dungeon_jiji:sleep()
		Sleep(10);
	end

	SetModeEx( OwnerID() , EM_SetModeType_Fight , false );
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false );
	zone30dungeon_jiji:debug("pillar ai shutdown")
end

function zone30dungeon_jiji_tornado_ai()
	local room_id = this().room_id
	local tornado = this()
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener
	local target
	while zone30dungeon_jiji[room_id].status == "fight" do
		if target then
			tornado:move(target.x, target.y, target.z)
			if tornado:distanceTo(target) < 20 then
				tornado:delete()
			end
		else
			target = table.random(battle_listener.players, 1)[1]
		end
		zone30dungeon_jiji:sleep()
	end
	tornado:delete()
end

function zone30_4_numList( _ctrlNum )
	DebugMsg(0,0,"-----zone30_4_numList=".._ctrlNum);
	local _room = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID );
	local _list = _numList[ _room ];
	local _len = #_list;
	local _randLiet = _randLiet[ _room ];
	local _num = _randLiet[ _ctrlNum ];
	table.remove( _randLiet , _ctrlNum );
	DebugMsg(0,0,"_num=".._num);
	table.insert( _list , _num );
end

function zone30_4_addBuff(Line)
--	DebugMsg(0,0,"--zone30_4_addBuff--"..", Line = "..Line );
	local room_id = this().room_id
	local jiji = zone30dungeon_jiji[room_id].jiji	
	jiji:addBuff(625607)
end

function zone30_4_reomveBuff(Line)
--	DebugMsg(0,0,"--zone30_4_reomveBuff--"..", Line = "..Line );
	local room_id = this().room_id
	local jiji = zone30dungeon_jiji[room_id].jiji	
	jiji:cancelBuff(625607)	
end