------------------------------------------------------
--	Zone 30 Dungeon
------------------------------------------------------

------------------------------------------------------
--	Npc 108440 �_�_���� BOSS
------------------------------------------------------
local g_ActObjs = {};	-- �ΥH�إߤ��B���B�a�B����q�W�S��
--
local _numList = { };
local _randLiet = { };
function npc_108440_create()	-- �_�_���ȡ@�����󪫥󲣥ͼ@��
	Cl_Resist_HackersBossNum();
	local room_id = this().room_id
	_numList[ room_id ] = { };
	_randLiet[ room_id ] = { 1 , 2 , 3 , 4 };
	zone30dungeon_jiji_initialize(room_id)
	local jiji = zone30dungeon_jiji[room_id].jiji	-- �_�_���ȱN�ۤv�w�q�� jiji
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener

	jiji:property {
		fight = true,
		strike_back = true,
		search_enemy = true,
		movable = true,
		hp = jiji.max_hp
	} 
	jiji:addSkill(zone30dungeon_jiji.skill.boss_skill_1.name, zone30dungeon_jiji.skill.boss_skill_1)	-- ��q�Q�o
	jiji:addSkill(zone30dungeon_jiji.skill.boss_skill_2.name, zone30dungeon_jiji.skill.boss_skill_2)	-- �_������
	battle_listener:add(jiji)
	for buff_id, buff in pairs(jiji.buff) do	-- �����_�_�Ҧ�Buff
		buff:remove()
	end
	AddBuff( OwnerID() , 625607 , 0 , -1 );	-- �L��
--	Cl_Resist_HackersBossNum();
end
function npc_108440_begin_fight()	-- ������ Npc �����u�԰��}�l�v
	local room_id = this().room_id
	zone30dungeon_jiji:debug("begin fight")
	if zone30dungeon_jiji[room_id].status ~= "fight" then
		zone30dungeon_jiji[this().room_id].controller:beginPlot("zone30dungeon_jiji_active")	-- �b�� Room ���� 4 �ڬW�l
		ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_2_1]", 0)	-- [108440]�����E�ʡG�u�A�̡A�A�̳��M�����J�ڪ��a�L�����I�v
	end
	Cl_Resist_HackersFightBegin();
end
function npc_108440_end_fight()	-- ������ Npc �����u�԰������v
	if not this().is_dead then
		zone30dungeon_jiji:debug("end fight")
		zone30dungeon_jiji[this().room_id].status = "fail"
	end
end
function npc_108440_dead()	-- ������ Npc �����u���`�ƥ�v
	zone30dungeon_jiji:debug("boss dead")
	zone30dungeon_jiji[this().room_id].status = "success"
	Cl_Resist_HackersBossDead();
end

------------------------------------------------------
--	Npc 108447 ��q�W 
------------------------------------------------------
function npc_108447_dead()	-- ��q�W�C�󺡦媬�A�U�Q�����ɰ��榹�禡
---	zone30dungeon_jiji:debug("hit pillar")
	local pillar = this()
	local room_id = pillar.room_id
	local jiji = zone30dungeon_jiji[room_id].jiji

	if pillar.buff[625301] then	-- �W�T��q�A�W�l�Ұʮɷ|��10�h�W�T��q �A�Q�����|��֡A��֦�0�h�ɡA�|����20��A�åB�X�{��q�W�T�������A�C
		local power = pillar.buff[625301].power - 1
	---	zone30dungeon_jiji:debug("power = " ..power );
		pillar:cancelBuff(625301)
		if power >= 0 then
		---	zone30dungeon_jiji:debug("pillar power down : " .. power)
			pillar:addBuff(625301, power)
			if not jiji.buff[625607] then
				zone30_4_addBuff(68);	-- �����_�_���ȵL��
			end
		else
		---	zone30dungeon_jiji:debug("pillar power broken")
			pillar:addBuff(625306)	-- ��q�W�T���A�N���q�W�T�˸m�w�g���өҦ���q�A���b���s�R�त
--			zone30_4_reomveBuff();
		end
	end
end

function  zone30dungeon_jiji_setting()	-- �_�_���ȡA���󲣥ͮɡA�w�q�����ܼƻP�W�l�ϥΪ��k�N
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

--	���B
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
	
--	��«
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

--	�s������
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

--	��������
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

--	���۩w��
	zone30dungeon_jiji.skill.pillar_skill_c1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_c1.name = "pillar_skill_c1"
	zone30dungeon_jiji.skill.pillar_skill_c1.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_c1:active(caster)
--		caster:say(self.name)
		caster:castSpell(851520):sleep(1.5)
		return true
	end

--	�a�é�ŧ
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

--	����y��
	zone30dungeon_jiji.skill.pillar_skill_d1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.pillar_skill_d1.name = "pillar_skill_d1"
	zone30dungeon_jiji.skill.pillar_skill_d1.cd = 9
	function zone30dungeon_jiji.skill.pillar_skill_d1:active(caster)
--		caster:say(self.name)
		caster:castSpell(851521):sleep(1.5)
		return true
	end

--	�}��
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

--	��q�Q�o
	zone30dungeon_jiji.skill.boss_skill_1 = Christine.Skill:new()
	zone30dungeon_jiji.skill.boss_skill_1.name = "boss_skill_1"
	zone30dungeon_jiji.skill.boss_skill_1.cd = 7
	function zone30dungeon_jiji.skill.boss_skill_1:active(caster)
--		caster:say(self.name)
		caster:castSpell(851526):sleep(1.5)
		return true
	end

--	�_������
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

function  zone30dungeon_jiji_initialize(room_id)	-- �_�_����

	if not zone30dungeon_jiji or zone30dungeon_jiji.alpha then
		zone30dungeon_jiji_setting()	-- ���󲣥ͮɡA�w�q�����ܼƻP�W�l�ϥΪ��k�N
	end

	if zone30dungeon_jiji[room_id] and
	   zone30dungeon_jiji[room_id].controller and
	   zone30dungeon_jiji[room_id].controller.is_legal then
		zone30dungeon_jiji[room_id].controller:delete()
	end

	g_ActObjs[room_id] = {};	-- �O����q�W�S��

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

function zone30dungeon_jiji_active()	-- ���ͬW�l�ΩI�s�԰��}�l�@��
	local room_id = this().room_id
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener
	local jiji = zone30dungeon_jiji[room_id].jiji
	local pillars = zone30dungeon_jiji[room_id].pillars
	-- 20150910 ���E : ��i�H��������q�W�W�A�s�W�H����M���ݩʯS�Ī����ܡA�����a��M�����D���ǯ�q�W�i�Q�����C
	local actObjsID = { 106969, 106971, 106968, 106970 };	-- ���B���B�a�B����q�W�S�ġA�ΥH���ܪ��a��q�W�i�Q�����A�]��q�W�L�Ѧ��I�A�G�H����M�S�Ĥ覡���N
	--
	zone30dungeon_jiji[room_id].front_door:addToPartition(room_id)

	local _posList = { { 60 , 60 } , { 60 , -60 } , { -60 , 60 } , { -60 , -60 } };  --jiji.x + 60 - RandRange(1, 120) ,  jiji.z + 60 - RandRange(1, 120)

	local _pillar

	for index = 1, 4 do	-- �إ߯�q�W�P�]�w��q�W�k�N
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

		-- 20150910 ���E : ��i�H��������q�W�W�A�s�W�H����M���ݩʯS�Ī����ܡA�����a��M�����D���ǯ�q�W�i�Q�����C
		local elementAct = CreateObj( actObjsID[index], jiji.x+_posList[ index ][ 1 ], jiji.y+60, jiji.z+_posList[ index ][ 2 ], 0, 1 ); 	-- ��q�W�S��
		SetModeEx( elementAct, EM_SetModeType_Fight, false );	-- ���
		SetModeEx( elementAct, EM_SetModeType_Show, false );	-- ���
		SetModeEx( elementAct, EM_SetModeType_Mark, false );	-- �аO
		SetModeEx( elementAct, EM_SetModeType_Strikback, false );	-- ����
		SetModeEx( elementAct, EM_SetModeType_Searchenemy, false );	-- ����
		SetModeEx( elementAct, EM_SetModeType_Move, false );	-- ��������
		SetModeEx( elementAct, EM_SetModeType_Gravity, false );	-- �������O
		AddToPartition( elementAct, room_id );
		table.insert( g_ActObjs[room_id], elementAct );
--		  :beginPlot("zone30dungeon_jiji_pillar_ai")
--		  :lockhp(_pillar.max_hp, "npc_108447_dead")
		if index == 1 then	-- ��
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_a1.name, zone30dungeon_jiji.skill.pillar_skill_a1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_a2.name, zone30dungeon_jiji.skill.pillar_skill_a2)
		elseif index == 2 then	-- ��
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_b1.name, zone30dungeon_jiji.skill.pillar_skill_b1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_b2.name, zone30dungeon_jiji.skill.pillar_skill_b2)
		elseif index == 3 then	-- �a
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_c1.name, zone30dungeon_jiji.skill.pillar_skill_c1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_c2.name, zone30dungeon_jiji.skill.pillar_skill_c2)
		elseif index == 4 then	-- ��
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_d1.name, zone30dungeon_jiji.skill.pillar_skill_d1)
			_pillar:addSkill(zone30dungeon_jiji.skill.pillar_skill_d2.name, zone30dungeon_jiji.skill.pillar_skill_d2)
		end
		battle_listener:add(_pillar)
		table.insert(pillars, _pillar)
	end
	zone30dungeon_jiji[room_id].status = "fight"

	jiji:beginPlot("zone30dungeon_jiji_ai")	-- �_�_���ȡ@�԰��}�l

	while zone30dungeon_jiji[room_id].status == "fight" do
		battle_listener:start()

		zone30dungeon_jiji:sleep()

		for index, pillar in pairs(pillars) do
			if pillar.buff[625306] then	-- ��q�W�T���A�N���q�W�T�˸m�w�g���өҦ���q�A���b���s�R�त

				if pillar.buff[625312] and GetModeEx( g_ActObjs[room_id][1], EM_SetModeType_Show ) then	-- ������q�˸m
					SetModeEx( g_ActObjs[room_id][1], EM_SetModeType_Show, false );	-- �����S����ܡA�N����q�W�L�k���� 
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

				if pillar.buff[625312] and jiji.buff[625290] then	-- ������q�˸m�B�����@��
					jiji:cancelBuff(625290)	-- �����@��
				end
				if pillar.buff[625313] and jiji.buff[625291] then
					jiji:cancelBuff(625291)	-- �����@��
				end
				if pillar.buff[625314] and jiji.buff[625292] then
					jiji:cancelBuff(625292)	-- �a�P�@��
				end
				if pillar.buff[625315] and jiji.buff[625293] then
					jiji:cancelBuff(625293)	-- �����@��
				end
			elseif pillar.buff[625301] then	-- �W�T��q
				if pillar.buff[625312] and not jiji.buff[625290] then	-- ���K��q�˸m�B�����@��
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
				pillar:addBuff(625301, 9):beginPlot("zone30dungeon_jiji_pillar_ai")	-- ������e�W�l 10 �h�W�T��q�A�ð���W�l�԰��@��
				if not jiji.buff[625607] then
					zone30_4_addBuff(342);	-- �����_�_���ȵL��
				end
			end
		end

--		zone30dungeon_jiji:debug("players : " .. #battle_listener.players)

	end
	battle_listener:stop()

	for index, pillar in pairs(pillars) do	-- �԰������ɡA�R���Ҧ��W�l
		pillar:delete()
	end

	for index, Obj in pairs(g_ActObjs[room_id]) do
		DelObj(Obj);
	end

	zone30dungeon_jiji[room_id].front_door:delete()	-- �R���e��

	if zone30dungeon_jiji[room_id].status == "success" then
		zone30dungeon_jiji:debug("success")
		ScriptMessage(jiji.guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_2_4]", 0)	-- [108440]�G�u���K�K�y�K�K�٨S�����o��Ť��q�e�A�ڤ��঺�K�K��K�K�v
	elseif zone30dungeon_jiji[room_id].status == "fail" then
		zone30dungeon_jiji:debug("fail")
		ScriptMessage(jiji.guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_2_3]", 0)	-- [108440]�G�u�K�A�~��ڪ����j��s�a�A�ܻ��A�A�̨쩳�O�ְڡK�H�v
		for buff_id, buff in pairs(jiji.buff) do
			buff:remove()
		end
		jiji:delFromPartition():sleep(3):addToPartition(room_id)
	end

	zone30dungeon_jiji:debug("boss end")
end

function zone30dungeon_jiji_ai()	-- �_�_���ȡ@�԰��}�l
	local room_id = this().room_id
	local battle_listener = zone30dungeon_jiji[room_id].battle_listener
	local jiji = zone30dungeon_jiji[room_id].jiji
	local _nowHP;
	local _number = 0;
	local _current;
	local _num = 0;

	while zone30dungeon_jiji[room_id].status == "fight" do	-- �԰��@��
		if #jiji.hate_list > 0 then	-- ��������ؼЮ�
			jiji:useSkill(zone30dungeon_jiji.skill.boss_skill_1.name)
			jiji:useSkill(zone30dungeon_jiji.skill.boss_skill_2.name)
		elseif #battle_listener.players > 0 then	-- ����ť�����ؼ�
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
			_current = zone30dungeon_jiji[room_id].pillars[ i ].guid	-- �ʱ��Ҧ����W�l
--			DebugMsg(0,0,"_guid="..zone30dungeon_jiji[room_id].pillars[ i ].guid);
			if CheckBuff( _current , 625306 ) then	-- ��W�l���b��q�W�T����
				_num = _num + 1;
			end
		end
	---	DebugMsg(0,0,"num=".._num.." / "..#_numList[ room_id ] );	-- ���b��q�W�T�����W�l / �w����԰��@�����W�l
		if _num == #_numList[ room_id ] then
			if jiji.buff[625607] then
				zone30_4_reomveBuff(415);	-- �R���L��
			end
		end

		Sleep(10);
--		zone30dungeon_jiji:sleep()
	end
	
	zone30dungeon_jiji:debug("jiji ai shutdown")
end

function zone30dungeon_jiji_pillar_ai()	-- �ѬW�l����

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

	while zone30dungeon_jiji[room_id].status == "fight" and not pillar.buff[625306] do	-- ��W�l���b��q�W�T����

		if not _bool then
			_list = _numList[ room_id ];
			_len = #_list;
			for i = 1 , _len , 1 do
				if  pillar_index == _list[ i ] then
					_bool = true;
					SetModeEx( OwnerID() , EM_SetModeType_Fight , true );
					SetModeEx( OwnerID() , EM_SetModeType_Mark , true );
					SetModeEx( g_ActObjs[room_id][pillar_index], EM_SetModeType_Show, true );	-- �}�үS����ܡA�N����q�W�i�Q���� 
					if not jiji.buff[625607] then	-- �L��
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