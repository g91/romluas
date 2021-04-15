local WY_Global = {};
function WY_Z166_Boss5_Combat_Start()	-- �����w�[�԰��}�l
	local me = OwnerID()
	local x,y,z,direction = DW_Location(me)
	local CombatControl = WY_Create_an_obj(123356,x,y,z,direction)	-- �إߤ�����(123356)
	SetModeEx( CombatControl , EM_SetModeType_Show , false );
	WriteRoleValue(CombatControl,EM_RoleValue_Register1,me)
	CallPlot(CombatControl,"WY_Z166_Boss5_CombatControl")
end

function WY_Z166_Boss5_CombatControl()
	--�إ߱`���ܼ�
	local WY_boss_id = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	Yell( WY_boss_id, "[WY_Z166_B5_START]", 3 );	-- [108441]�G�u�N�̧A�̤]���D�ԧڡH�v
--	Say(WY_boss_id,"[WY_Z166_B5_START]")
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local _zone = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	local level = 0
	local bossxORG = 0	-- �g�㪺�����w�[
	local bossORG = 0	-- �����w�[
	local mineORG = 0	-- ��ſ��ɹp
	local steelORG = 0	-- ��ſ�
	local cubeORG = 0	-- �Ť���
	local frenzy = 625217	-- �d�F����(�g�ɤ�)
	if _zone == 166 then
		level = 3
		bossORG = 108441
		bossxORG = 108571
		mineORG = 108569
		cubeORG = 108568
		steelORG = 108448
	elseif _zone == 167 then
		level = 2
		bossORG = 108579
		bossxORG = 108583
		mineORG = 108582
		cubeORG = 108581
		steelORG = 108580
	elseif _zone == 168 then
		level = 1
		bossORG = 108591
		bossxORG = 108595
		mineORG = 108594
		cubeORG = 108593
		steelORG = 108592
	end
	local time = {}
	time.boss = {}
	time.boss.action = 0
	time.total = 0
	local stage = 1
	local pull = 0
	local x,y,z,direction = 0,0,0,0
	local temp_object = {}
	local skills = {}
	skills.cooldown = {}
	skills.cooldown.mine = 9
	skills.cooldown.mark = 11
	skills.cooldown.ripper = 23
	skills.cooldown.rage = 19
	skills.cooldown.rune = 8
	skills.cooldown.raid = 13
	skills.cooldown.cube = 17
	--  skills.cooldown.armor = 5
	--�إߪk�NID
	local ripper = 851534
	local rage = 851537
	local rune = 851538
	local raid = 851539
	local charge = 0
	local CUBE = 0
	local _obj;
	local steel_a, steel_b = 0 , 0 
	local steel = {}
	steel.a = {}
	steel.b = {}
	--  if _zone == 166 then
		--  chainlighting = 851469
		--  evaporation = 851464
		--  elseif _zone ~= 166 then
		--  chainlighting = 851470
		--  evaporation = 851465
	--  end
	--�إߥ����T
	--  WY_Global = {}
	WY_Global[Room]= {}
	WY_Global[Room].mines = {}
	--�إߤ�������T
	WY_Global[Room].boss = WY_get_objStatus(WY_boss_id)
	--�}�ҵ�ŭ誺���tag
	temp_steel = SearchRangeNPC(OwnerID(), 500)
	for t = 0,#temp_steel - 1 , 1 do
		local n = t;
		if ReadRoleValue(temp_steel[n],EM_RoleValue_OrgID) == 108448 then	-- ��ſ�
			DebugMsg(0,0,"temp_steel[n]="..temp_steel[n]);
			SetModeEx(temp_steel[n], EM_SetModeType_Mark , true )
			SetModeEx(temp_steel[n], EM_SetModeType_Searchenemy, false)
			SetModeEx(temp_steel[n], EM_SetModeType_Move, false)
			SetModeEx(temp_steel[n], EM_SetModeType_Obstruct, true)
			SetModeEx(temp_steel[n], EM_SetModeType_Fight, true)
			SetModeEx(temp_steel[n], EM_SetModeType_Strikback, false)
			x,y,z,direction = DW_Location(temp_steel[n])
			local temp_table = {x,y,z,direction}
			if steel_a == 0 then
				steel_a = temp_steel[n]
				steel.a = temp_table
			else
				steel_b = temp_steel[n]
				steel.b = temp_table
			end
		end
	end

	while true do
		time.total = time.total +1
	--	DebugMsg( 0, 0, "time = "..time.total );
		--�g�ɧP�_
		if Room >166 then
			if time.total >= 360 and not CheckBuff( WY_Global[Room].boss.id, frenzy ) then
				addBuff( WY_Global[Room].boss.id, frenzy, 0, -1 );
				Say( WY_Global[Room].boss.id, "[WY_Z166_B5_0001]" );	-- [108441]�G�u�ܦn�K�K�ǳƨ��ҿE��ڪ��U���a�I�v
			end
		else
			if time.total >= 480 and not CheckBuff( WY_Global[Room].boss.id, frenzy ) then
				addBuff( WY_Global[Room].boss.id, frenzy, 0, -1 );
				Say( WY_Global[Room].boss.id, "[WY_Z166_B5_0001]" );
			end
		end
		--�p�G�Ĥ@���q�h��s�H�U��T
		if stage == 1  then
			WY_Global[Room].boss = WY_get_objStatus(WY_boss_id)
			skills.cooldown.mine = skills.cooldown.mine -1
			skills.cooldown.mark = skills.cooldown.mark -1
			skills.cooldown.ripper = skills.cooldown.ripper -1
			skills.cooldown.rage = skills.cooldown.rage -1
			--      skills.cooldown.armor = skills.cooldown.armor - 1;
			--�p�G�O�ĤG���q�h��s�H�U��T
		elseif stage == 2  then
			WY_Global[Room].boss = WY_get_objStatus(WY_boss_id)
			skills.cooldown.rune = skills.cooldown.rune -1
			skills.cooldown.raid = skills.cooldown.raid -1
			skills.cooldown.cube = skills.cooldown.cube -1
		end
		--�C����򪺺�X����
		if not CheckID(CUBE) then
			CUBE = 0
		elseif WY_Global[Room].boss.hatecount < 1 then
			DelObj(CUBE); CUBE = 0
		end
    		--����BOSS�ʧ@
		for act = 1,1,1 do
			--�Y�ʧ@���N���Ҽ{����
			if time.boss.action > 0 then
        				DebugMsg(0,0,"break due to action = "..time.boss.action)
				time.boss.action = time.boss.action -1
				break
			end
			DebugMsg(0,0,"action = 0")
			local targeted = 0

			--�ˬdBOSS��q�O�_�i�J�ĤG���q(�ܨ�)
			if WY_Global[Room].boss.hp < 50 and stage == 1 and ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_SpellMagicID) ==0 then
				time.boss.action = 2
				stage = 2
				x,y,z,direction = DW_Location(WY_Global[Room].boss.id)
				WY_boss_id = WY_Create_an_obj(bossxORG,x,y,z,direction)
				local temp = ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_AttackTargetID)
				SetAttack(WY_boss_id, temp)
				temp = ReadRoleValue(WY_Global[Room].boss.id, EM_RoleValue_HP)
				if temp <= 0 then
					temp = 1
				end
				WriteRoleValue(WY_boss_id,EM_RoleValue_HP, temp)
				-- temp = ReadRoleValue(WY_boss_id, EM_RoleValue_MaxMP )
				WriteRoleValue( WY_boss_id, EM_RoleValue_MP, 0 )
				DelObj(WY_Global[Room].boss.id)
				WY_Global[Room].boss = WY_get_objStatus(WY_boss_id)
				addBuff( WY_boss_id , 626287 , 0 , -1 );
				local temp_table = SearchRangeNPC(OwnerID(), 700)
				for a = 1, #temp_table do
					local n = a-1
					if ReadRoleValue(temp_table[n],EM_RoleValue_OrgID) == 108448 then
					--	Say(temp_table[n], "boss should be buffed")
						addBuff(WY_Global[Room].boss.id,625323,0,-1)
					end
				end
				CastSpellLV(WY_boss_id, WY_boss_id, 851541, 0)
				Say(WY_Global[Room].boss.id,"[WY_Z166_B5_ANGRY]")	-- [108441]�G�u�����ڮi�{�g�㫬�A���å뤣�h�A���ݹL���K�K���w���b�o�@�W�I�v
				break
			end

			--�Ĥ@���q
			if stage == 1 then
				--�d�F����
				if skills.cooldown.ripper <= 0 then
			  		addBuff(WY_boss_id,625258,0,8)
					local r = RandRange( 1,WY_Global[Room].boss.hatecount ) 
					ripped = WY_Global[Room].boss.hatelist[r]
					if CheckID(ripped) then
						SysCastSpellLV(WY_boss_id, ripped, 851534, 0 )
					end
					CastSpellLV(WY_boss_id, ripped, 851545, 0)
					time.boss.action = 7
					skills.cooldown.ripper = 23
					break
				--��ſ��ɹp
				elseif skills.cooldown.mine <= 0 then
					x,y,z,direction = DW_Location(WY_Global[Room].boss.id)
					CastSpellLV(WY_Global[Room].boss.id,WY_Global[Room].boss.id,851542,0)
					time.boss.action = 2
					skills.cooldown.mine = 9
					for a= 1,3 do

						local angle = Math.random( 1+120*(a-1), a*120 );
					--	local angle = a*120
						local r_dis = Math.random( 50, 125 );
					--	local r_dis = RandRange(50,125)
						local newPos = {};
						newPos.x, newPos.y, newPos.z, newPos.dir = DW_NewLocation(angle,r_dis,x,y,z,direction);
					--	x, y, z, direction = DW_NewLocation(angle,r_dis,x,y,z,direction);
						local tempOBJ = WY_Create_an_obj( mineORG, newPos.x, newPos.y, newPos.z, newPos.dir );
						table.insert( WY_Global[Room].mines, tempOBJ );
						SetModeEx( tempOBJ, EM_SetModeType_DisableRotate, true );
						SetModeEx( tempOBJ, EM_SetModeType_Strikback, false );
						SetModeEx( tempOBJ, EM_SetModeType_Searchenemy, false );
						SetModeEx( tempOBJ, EM_SetModeType_Obstruct, true );
						SetModeEx( tempOBJ, EM_SetModeType_Move, false );
						SetModeEx( tempOBJ, EM_SetModeType_Mark, false );
					end
					break
				--�Щw
				elseif skills.cooldown.mark <= 0 then
					local r = RandRange(1,WY_Global[Room].boss.hatecount)
					if CheckID( WY_Global[Room].boss.hatelist[r] ) then
						addBuff(WY_Global[Room].boss.hatelist[r],625255,0,3);	-- ��żаO(625255)
					end
					time.boss.action = 5
					skills.cooldown.mark = 11 
					break
				--�d�F����
				elseif skills.cooldown.rage <= 0 then
					CastSpellLV(WY_boss_id, WY_boss_id, 851537, 0)
					time.boss.action = 3
					skills.cooldown.rage = 19
					for i,v in pairs(WY_Global[Room].mines) do
						CallPlot(v,"WY_Z166_B5_BLOWUP")
						sleep(2)
					end
					break
				end
			end
			--�ĤG���q
			if stage == 2 then
				DebugMsg(0,0,"checking stage 2")
				DebugMsg(0,0,"_MP="..ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_MP));
				DebugMsg(0,0,"_MaxMP="..ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_MaxMP));
				--�j�ܲŤ大�O
				if skills.cooldown.rune <= 0 then
					CastSpellLV(WY_Global[Room].boss.id, WY_Global[Room].boss.id, rune, 0)
					time.boss.action = 1
					skills.cooldown.rune = 8
					break
				--�j�ܤ@��
				elseif skills.cooldown.raid <= 0 then
					targeted = ReadRoleValue(WY_Global[Room].boss.id, EM_RoleValue_AttackTargetID)
					CastSpellLV(WY_Global[Room].boss.id, targeted, raid, 0)
					time.boss.action = 2
					skills.cooldown.raid = 13
					break
				--�j�ܤ��
				elseif skills.cooldown.cube <= 0 and CUBE == 0 then
					local r_dis = RandRange(30,50)
					local angle = RandRange(1,360)
					x,y,z,direction = DW_Location(WY_Global[Room].boss.id)
					x,y,z,direction = DW_NewLocation(angle, r_dis, x,y,z,direction)
					CUBE = WY_Create_an_obj(cubeORG ,x,y+25,z,direction)
					addBuff(CUBE,625334,0,-1)
					WriteRoleValue(CUBE, EM_RoleValue_LiveTime, 32)
					SetModeEx( CUBE , EM_SetModeType_DisableRotate , true )
					SetModeEx( CUBE , EM_SetModeType_Strikback , false )
					SetModeEx( CUBE , EM_SetModeType_Searchenemy , false )
					SetModeEx( CUBE , EM_SetModeType_Obstruct , true )
					SetModeEx( CUBE , EM_SetModeType_Move , false )
					time.boss.action = 3
					skills.cooldown.cube = 17
					_obj = WY_Create_an_obj(109238 ,x,y+10,z,direction)
					WriteRoleValue(_obj, EM_RoleValue_LiveTime, 32)
					SetModeEx( _obj , EM_SetModeType_DisableRotate , true )
					SetModeEx( _obj , EM_SetModeType_Strikback , false )
					SetModeEx( _obj , EM_SetModeType_Searchenemy , false )
					SetModeEx( _obj , EM_SetModeType_Obstruct , false )
					SetModeEx( _obj , EM_SetModeType_Move , false )
					SetModeEx( _obj , EM_SetModeType_show , false )
					SetModeEx( _obj , EM_SetModeType_mark , false )
					SetModeEx( _obj , EM_SetModeType_fight , false )
					CallPlot( _obj ,"WY_Z166_Boss5_CUBE" , CUBE );
					WriteRoleValue( CUBE , EM_RoleValue_Register + 5 , _obj );
					scriptMessage(WY_Global[Room].boss.id, 0, 2, "[WY_Z166_B5_CUBE]" , 0)	-- [108441]�b�Y�B���E�F�@�ө_�����ߤ���K�K
					break
				--��q���X
				elseif ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_MP) >= ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_MaxMP) then
					temp_object = {}
					local r_dis = 0
					local angle = 0
					x,y,z,direction = DW_Location(WY_Global[Room].boss.id)
					WriteRoleValue(WY_Global[Room].boss.id, EM_RoleValue_MP, 0)
					for t = 1,10,1 do
						r_dis = RandRange(25,150)
						angle = RandRange(1,360)
						x,y,z,direction = DW_NewLocation(angle, r_dis, x,y,z,direction)
						local temp_id = WY_Create_an_obj(122920,x,y,z,direction)
						table.insert(temp_object, temp_id)
						SetModeEx(temp_id, EM_SetModeType_Mark, false)
						addBuff(temp_id,500439,0,3)
						CallPlot(temp_id, "WY_Z166_B5_ENERGYBALL")
						scriptMessage(WY_Global[Room].boss.id, 0, 2, "[WY_Z166_B5_BRUST]",0)	-- [108441]�w�ǳƦn���񺡸�����ů�q�K�K
					end
					break
				end
			end
    		end

		if HateListCount(WY_boss_id) < 1 then

			if not CheckID(CUBE) then 
				CUBE = 0
			elseif WY_Global[Room].boss.hatecount < 1 then 
				DelObj(CUBE); 
				DelObj( _obj );
				CUBE = 0 
			end
		
			local temp_table = SearchRangePlayer(OwnerID(), 500)
			for i,v in pairs(temp_table) do
				cancelBuff(v, 625260)
			end
		
			local local_mines = WY_Global[Room].mines
			for i,v in pairs(local_mines) do
				DelObj(v)
			end
		
			if WY_Global[Room].boss.hp > 0 then--���m
				Say(WY_Global[Room].boss.id,"[WY_Z166_B5_0002]")	-- [108441]�N���a�ݵۧA�̻��D�G�u�o�O�w�Ƥ������G���O�ܡH�v
				Sleep( 30 );
				DelObj(WY_boss_id);
				x,y,z,direction = DW_Location(OwnerID())
				recreate_boss = WY_Create_an_obj(bossORG,x,y,z,direction)
				WY_Global[ Room ] = nil
				--        WY_boss_id = nil
				DelObj(steel_a)
				DelObj(steel_b) 
				--        DebugMsg(0,0,"--steel.a="..steel.a[1]);     
				steel_a = WY_Create_an_obj(steelORG,steel.a[1],steel.a[2],steel.a[3],steel.a[4])
				steel_b = WY_Create_an_obj(steelORG,steel.b[1],steel.b[2],steel.b[3],steel.b[4])
				table.insert(temp_steel, steel_a)
				table.insert(temp_steel, steel_b)
				for a = 1,2 do
					SetModeEx(temp_steel[a], EM_SetModeType_Mark , true )
					SetModeEx(temp_steel[a], EM_SetModeType_Searchenemy, false)
					SetModeEx(temp_steel[a], EM_SetModeType_Move, false)
					SetModeEx(temp_steel[a], EM_SetModeType_Obstruct, true)
					SetModeEx(temp_steel[a], EM_SetModeType_Fight, false)
					SetModeEx(temp_steel[a], EM_SetModeType_Strikback, false)
				end
			else--BOSS���`
				Say(WY_Global[Room].boss.id,"[WY_Z166_B5_0003]")	-- [108441]�@�y���H�m�H�G�u�o���K�K�i��K�K�v
				Sleep( 30 );
				--        DelObj(WY_boss_id);
				--        WY_Global[ Room ] = nil
			end
      			DelObj(OwnerID())
      			break;
    		end
    		sleep(10)
  	end
end

function WY_Z166_B5_MINES()	-- ��ſ��z�p �_�l�@��

	local Owner = OwnerID();
	SysCastSpellLv( Owner, Owner, 852282, 0 );
	CallPlot( Owner, "WY_Z166_B5_MINES_SETUP", Owner );
end

function WY_Z166_B5_MINES_SETUP( Owner )	-- ��ſ��ɹp �˸m�ɶ�

	Sleep(10);	-- ���ͫ�ݭn���Գo�q�ɶ��~�}�l�@�ΡA�����a���������ɶ��C
--	SetPlot( Owner, "range", "WY_Z166_B5_BLOWUP", 25 );	-- �缾�a�ĪG
	BeginPlot( Owner, "WY_Z166_B5_BLOWUP_BOSS", 0 );	-- ��Boss�ĪG
end

function WY_Z166_B5_CHARGE_ME()
	local charge = 0
	if ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) == 166 then
		charge = 851533
	else
		charge = 851532
	end
	CastSpellLV(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id,TargetID(), charge, 0)
end

function WY_Z166_B5_BLOWUP_BOSS()
	local _ownerID = OwnerID();
	local _npcList;
	local _current;
	local boss = WY_Global[ ReadRoleValue( _ownerID, EM_RoleValue_RoomID ) ].boss.id;
	local manakazaID = { 108441, 108579, 108591 };	-- �����w�[�A�U�����x���B���q�B²��Ҧ�

	while true do
		--    DebugMsg(0,0,"-----");
		-- 2015.09.14 ���E:�קKBoss���`�Τ��s�b�B�����԰��ɡA��ſ��z�p�̵M�|�b���W�����D�C
		if not CheckID(boss) or ReadRoleValue( boss, EM_RoleValue_IsDead ) == 1 or ReadRoleValue( boss, EM_RoleValue_IsAttackMode ) == 0 then
			DelObj( _ownerID );
			break;
		end
		--
		local count = SetSearchRangeInfo( _ownerID, 15 );
		if count > 0 then	-- �u��Boss�Ϊ��a���ġA�����d���P��L����
			for i = 1, count, 1 do
				local id = GetSearchResult();

				for j = 1, #manakazaID do				
					if ReadRoleValue( id, EM_RoleValue_OrgID ) == manakazaID[j] then
						AddBuff( id, 502756, 0, -1 );	-- �w�t
						Sleep(10);
						DelObj( _ownerID );
					end
				end

				if ReadRoleValue( id, EM_RoleValue_IsPlayer ) == 1 then
					SysCastSpellLv( _ownerID, _ownerID, 851544, 0)	-- ����z��
					Sleep(10);
					DelObj( _ownerID );
				end
			end
		end

	--	_npcList = SearchRangeNPC( _ownerID , 25 );
	--	for i = 0 ,#_npcList - 1 , 1 do
	--		_current = _npcList[ i ];
	--		if ReadRoleValue( _current , EM_RoleValue_OrgID ) == 108441 then
	--			DebugMsg(0,0,"++_current=".._current);
	--			AddBuff( _current , 502756 , 0 , -1 );
	--			DelObj( _ownerID );
	--			break;
	--		end
	--	end
		Sleep(1);
  	end
end

function WY_Z166_B5_BLOWUP()
	local me = TargetID()
	SysCastSpellLv(me, me, 851544, 0)	-- ����z��
	sleep(10)
	DelObj(me)
end

function WY_Z166_B5_PULL()
	local me = TargetID()
	local x,y,z,direction = DW_Location(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id)
	local dis = WY_Global.distance
	x,y,z,direction = DW_NewLocation( 0, 15 ,x,y,z,direction)
	SetPos(me, x, y, z, direction)
end

function WY_Z166_Boss5_CUBE( CUBE )
	local me = OwnerID()
	local nearest = 0
	local latest = 0
	local change = false
	local temp_dis = 1000
	local _timer = 0;
	while WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )] ~= nil do

		-- 2015.09.14 ���E:�קKBoss���`�Τ��s�b�B�����԰��ɡA�j�ܤ���̵M�|�b���W�缾�a�ˮ`�����D�C
		local boss = WY_Global[ ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) ].boss.id;
		if not CheckID(boss) or ReadRoleValue( boss, EM_RoleValue_IsDead ) == 1 or ReadRoleValue( boss, EM_RoleValue_IsAttackMode ) == 0 then
			DelObj( CUBE );
			DelObj( me );
			break;
		end
		--

		local boss_mp =  ReadRoleValue(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id,EM_RoleValue_MP)
		local boss_maxmp = ReadRoleValue(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id, EM_RoleValue_MaxMP)
		local recharge = boss_maxmp/10 + boss_mp
		latest = nearest
		--      sleep(10)
		for index, player in pairs(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.hatelist) do
			if nearest == 0 then
				nearest = player
			elseif nearest ~= 0 and GetDistance(me, player) < GetDistance(me, nearest) then
				nearest = player
			end
		end
		if nearest ~= latest then
			WriteRoleValue(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id, EM_RoleValue_MP, recharge)
		end
		DebugMsg(0,0,"----------------------------------");
		CastSpellLV(me, nearest , 851546, 0)
		sleep(10)
		_timer = _timer + 1;
		DebugMsg(0,0,"_timer=".._timer);
		if _timer == 30 then
			recharge = boss_maxmp / 2 + ReadRoleValue(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id,EM_RoleValue_MP)
			DebugMsg(0,0,"recharge="..recharge);
			WriteRoleValue(WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )].boss.id, EM_RoleValue_MP, recharge)
			sleep(10);
			DelObj( CUBE );
			DelObj( me );
		end
		--    end
		--    Sleep(10);  
	end
end

function WY_Z166_B5_ENERGYBALL()
	local r_time = RandRange(1,5)
	sleep(30+r_time)
	local me = OwnerID()
	local _boss = WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )];
	if _boss ~= nil then
		SysCastSpellLv( _boss.boss.id , me , 851549 , 0 );
	end
	sleep(10)
	DelObj(me)
end

function Lua_625319_Check()
	DebugMsg(0,0,"Lua_625319_Check");
	local _buffLv = Lua_Hao_Return_Buff_Lv( TargetID() , 625319 );  -- �d��Buff���|������
	DebugMsg(0,0,"_buffLv=".._buffLv);
	if _buffLv == 3 then
		local _boss = WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )];
		if _boss ~= nil then
			SysCastSpellLv( _boss.boss.id , TargetID() , 851536 , 0 );
		end
		cancelBuff( TargetID() , 625319 );
		return false;
	end
end

function Lua_108448_Dead()	-- ��ſ����`�@��
	DebugMsg(0,0,"--Lua_108448_Dead--");
	local _boss = WY_Global[ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )];
	WriteRoleValue( _boss.boss.id ,  EM_RoleValue_Register + 5 , ReadRoleValue( _boss.boss.id , EM_RoleValue_Register + 5 ) + 1 );
	cancelBuff( _boss.boss.id , 625323 );	-- ��ſ��@��
	if ReadRoleValue( _boss.boss.id , EM_RoleValue_Register + 5 ) == 1 then
		addBuff( _boss.boss.id ,625323 , 0 , -1 );
	end
end

function Lua_108568_Dead()	-- �j�ܤ�����`�@��
	DelObj( ReadRoleValue( OwnerID() , EM_RoleValue_Register + 5 ) );
end