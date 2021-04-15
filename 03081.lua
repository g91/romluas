local WY_boss_id = {}
local WY_beast_id = {}
local WY_Global = {}
local _Z30_Boss_3;

-- 2015.08.17 ���E:Boss ���󲣥ͼ@���A�� Boss �����ͦ��ո�����~�A�קK�]�ɶ��t�A�Ӥް_���@�� Bug ...
local g_BossPos = { X = -1689, Y = 3098, Z = -1036, Dir = 357 }	-- Boss �A���ͦ��ɪ��_�l��m�A�קK����������A�ɭP Boss �ͦ���m�@�ְ��쪺���D

-- �ո�����~ID
local g_beastID = {
			[166] = 108439,	-- Zone 166
			[167] = 108573,	-- Zone 167
			[168] = 108585	-- Zone 168
					 }

function Hao_Z166_Boss3_InitLua()

	Cl_Resist_HackersBossNum();	-- ���b�Ⱦ���A�קK���a������

	local Owner = OwnerID();
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Distance = 30;	-- �ո�����~�P Boss �����Z��
	local VecDir = Vector_DirToVector( Dir + 180 );	-- �b Boss ���k���䲣��
	local OwnerPos = Vector_GetRolePos( Owner );
	local TargetPos = OwnerPos + VecDir * Distance;

	local Beast = CreateObj( g_beastID[Zone], TargetPos.X, TargetPos.Y, TargetPos.Z, Dir, 1 );	-- �ո�����~
	WriteRoleValue( Owner, EM_RoleValue_Register1 , Beast );	-- �N�ո�����~�g�J���˧J�� Reg1 ��
	WriteRoleValue( Beast, EM_RoleValue_Register1 , Owner );	-- �N���˧J�g�J�ո�����~�� Reg1 ��
	AddToPartition( Beast, Room );
end
--
function WY_Z166_Boss3_Combat_Start()	-- Boss �԰��}�l�ɬI��

	local me = OwnerID()
	local getReadyFight = ReadRoleValue( me, EM_RoleValue_Register2 )	-- 2015.08.18 ���E�A�קK Boss ���ƶi�J�԰��}�l�@���A�ɭP�@�����ê����D�C(Ĵ�p�v��̨ϥθ���)

	if getReadyFight == 1 then
		return
	end
	WriteRoleValue( me, EM_RoleValue_Register2, 1 );

	Cl_Resist_HackersFightBegin(me)	-- ���b�Ⱦ���
	local x,y,z,direction = DW_Location(me)
	local CombatControl = WY_Create_an_obj(123305,x,y,z,direction)
	local _beastID = ReadRoleValue( me, EM_RoleValue_Register1 )	-- �ո�����~

	local AttackTarget = ReadRoleValue( me, EM_RoleValue_AttackTargetID );
	SetAttack( _beastID, AttackTarget );

	SetModeEx( CombatControl , EM_SetModeType_Show , false );
	WriteRoleValue(CombatControl,EM_RoleValue_Register1,me);
	WriteRoleValue(CombatControl,EM_RoleValue_Register2,_beastID);
	Say(me, "[WY_Z166_B3_START]")	-- [108438]�G�u�@�K�A�̨Ӫ����n�A�ӬO�ɭ��˵��ڪ���s���G�F�K�v
	LockHP(me, that(me).max_hp * 0.45, "WY_Z166_lockhp")
end

function WY_Z166_Boss3_Control()	-- �������@��

	local Owner = OwnerID();

	SetModeEx( Owner, EM_SetModeType_Mark , false );
	local Room = ReadRoleValue(Owner, EM_RoleValue_RoomID );
	local _zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
	WY_boss_id[Room] = ReadRoleValue( Owner, EM_RoleValue_Register1 );
	WY_beast_id[Room] = ReadRoleValue( Owner, EM_RoleValue_Register2 );

	--  WY_boss_id[Room] = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	--say(OwnerID(),"boss id is "..WY_boss_id)
	--  WY_beast_id = 0
	local rage = 625217
	local time = {}
	time.boss = {}
	time.boss.action = 0
	time.total = 0
	local stage = 1
	local star = 0
	local action = 0
	local action_b = 0
	local skills = {}
	local star_timer = 0
	local x,y,z,direction = 0,0,0,0
	local bossORG = 0
	local beastORG = 0
	local karsarORG = 0
	local starORG = 0
	--  local stage2ORG = 0
	--  local casterORG = 0
	local s_casterORG = 0
	if _zone == 166 then
		bossORG = 108438
		beastORG = 108439
		-- karsarORG = 108523
		starORG = 108479
		-- stage2ORG = 108516
		-- casterORG = 108529
		-- s_casterORG = 108561
	elseif _zone == 167 then
		bossORG = 108572
		beastORG = 108573
		--    karsarORG = 108576
		starORG = 108574
		--    stage2ORG = 108575
		--    casterORG = 108577
		--    s_casterORG = 108578    
	elseif _zone == 168 then
		bossORG = 108584
		beastORG = 108585
		--    karsarORG = 108588
		starORG = 108586
		--    stage2ORG = 108587
		--    casterORG = 108589
		--    s_casterORG = 108590
	end

	skills.cooldown = {}
	skills.cooldown.energycannon = 7
	skills.cooldown.infestation = 18
	skills.cooldown.energized = 19
	skills.cooldown.evaporation = 11
	skills.cooldown.lightingcannon = 7
	skills.cooldown.archinglighting = 13
	skills.cooldown.chainlighting = 13
	skills.cooldown.tornado = 18

	--�إߪk�NID
	local energycannon = 851462
	local energypulse = 851486
	local energized = 851463
	local lightingcannon = 851466
	local archinglighting = 851467
	local infestation = 851484
	local chainlighting = 0
	local evaporation = 851465
	local door = WY_Create_an_obj(106239,-1289,GetHeight(-1289, 3150, -1049),-1049,3)
	that(door):property{
				gravity = false,
				search_enemy = false,
				strike_back = false,
				fight = false,
				movable = false,
				obstruct = true,
				show_name = false,
				mark = false,
				hide_from_mini_map = true
								}

	if _zone == 166 then
		chainlighting = 851469
		evaporation = 851464
	elseif _zone ~= 166 then
		chainlighting = 851470
		evaporation = 851465
	end

	local cannoned = 0

	--�إߥ����T
	WY_Global[Room]= {}

	--�إߤT������T
	local _bossID = WY_boss_id[Room];
	_Z30_Boss_3 = _bossID;
	WY_Global[Room].boss = WY_get_objStatus(_bossID)

	--�إߺ��~����T
	local _beastID = WY_beast_id[Room];
	SetModeEx( _beastID , EM_SetModeType_Mark , false );
	WY_Global[Room].beast = WY_get_objStatus(_beastID);
	WY_Global[Room].x = ReadRoleValue( _beastID , EM_RoleValue_X );
	WY_Global[Room].z = ReadRoleValue( _beastID , EM_RoleValue_Z );
	WY_Global[Room].dir = ReadRoleValue( _beastID ,  EM_RoleValue_Dir );
	WriteRoleValue( _beastID, EM_RoleValue_IsAttackMode, 1 )

--	DebugMsg(0,0,"--_bossID="..ReadRoleValue( _bossID, EM_RoleValue_OrgID ) ) ;
--	DebugMsg(0,0,"--_beastID="..ReadRoleValue( _beastID, EM_RoleValue_OrgID ) );

	while true do
		--DebugMsg(0,0,"boss stage = "..stage)
		time.total = time.total +1
		--2015.08.18 ���E�G�g�ɮɶ��A���s�s�覹����
		if _zone >166 and time.total >= 360 then
			if CheckID( _bossID ) and not CheckBuff( _bossID, rage ) then
				AddBuff( _bossID, rage,0,-1 );
				Say( _bossID,"[WY_Z166_B3_RAGE]" );	-- [108438]���N�a�ݵۧA�̡G�u�o�@���ױN�����A�z�p���ͪ��̡K�v
			end
			if CheckID( _beastID ) and not CheckBuff( _beastID, rage ) then
				AddBuff( _beastID, rage, 0, -1 );
			end
		elseif _zone == 166 and time.total >= 480 then
			if CheckID( _bossID ) and not CheckBuff( _bossID, rage ) then
				AddBuff( _bossID, rage,0,-1 );
				Say( _bossID,"[WY_Z166_B3_RAGE]" );
			end
			if CheckID( _beastID ) and not CheckBuff( _beastID, rage ) then
				AddBuff( _beastID, rage, 0, -1 );
			end
		end
		--
		--�p�G�Ĥ@���q�h��s�H�U��T
		if stage == 1  then
			WY_Global[Room].boss = WY_get_objStatus(_bossID)
			WY_Global[Room].beast = WY_get_objStatus(_beastID)
			skills.cooldown.energycannon = skills.cooldown.energycannon -1
			skills.cooldown.infestation = skills.cooldown.infestation -1
			skills.cooldown.energized = skills.cooldown.energized -1
			skills.cooldown.lightingcannon = skills.cooldown.lightingcannon -1
			skills.cooldown.archinglighting = skills.cooldown.archinglighting -1
			WriteRoleValue(_beastID, EM_RoleValue_HP, ReadRoleValue(_bossID, EM_RoleValue_HP))
			--�p�G�O�ĤG���q�h��s�H�U��T
		elseif stage == 2  then
			--      WY_Global[Room].beast = WY_get_objStatus(_beastID)
			_beastID = WY_Global[Room].beast.id
			skills.cooldown.evaporation = skills.cooldown.evaporation -1
			skills.cooldown.chainlighting = skills.cooldown.chainlighting -1
			skills.cooldown.tornado = skills.cooldown.tornado -1
		end

		--�C����򪺺�X����
		--�ˬd�O�_�����q�G�A�ä��Ҧ��H��q�A�Y����h������q����
		if stage == 2 then
			for i , v in pairs(WY_Global[Room].beast.hatelist) do
				if ReadRoleValue(v, EM_RoleValue_MaxHP) == ReadRoleValue(v , EM_RoleValue_HP)  and CheckBuff(v, 625210) then
					cancelBuff(v, 625210)
				--say(v, "i am fully healed")
				end
			end
		end

		--�ˬd��q���P��q�A�C���C10%��q�h���C10%���ʳt��
		if star ~= 0 then
			if star_timer > 4 then
				if WY_Global[Room].boss.hatecount ~= 0 then
					local r = RandRange(1,WY_Global[Room].boss.hatecount)
					SetAttack(star, WY_Global[Room].boss.hatelist[r])
					scriptMessage(WY_Global[Room].boss.id, WY_Global[Room].boss.hatelist[r], 2, "[WY_Z166_B3_STAR_ATTACK]" , 0)
				end
			elseif star_timer <= 4 then
				star_timer = star_timer+1
			end
      
			local star_maxhp = ReadRoleValue( star, EM_RoleValue_MaxHP )
			local star_hp =  ReadRoleValue( star, EM_RoleValue_HP )
			local star_slowed = 0

			if star_maxhp > star_hp*10 then star_slowed = 9
			elseif star_maxhp > star_hp*9 then star_slowed = 8
			elseif star_maxhp > star_hp*8 then star_slowed = 7
			elseif star_maxhp > star_hp*7 then star_slowed = 6
			elseif star_maxhp > star_hp*6 then star_slowed = 5
			elseif star_maxhp > star_hp*5 then star_slowed = 4
			elseif star_maxhp > star_hp*4 then star_slowed = 3
			elseif star_maxhp > star_hp*3 then star_slowed = 2
			elseif star_maxhp > star_hp*2 then star_slowed = 1
			elseif star_maxhp > star_hp*1 then star_slowed = 0
			end

			cancelBuff(star, 624709)
			addBuff(star ,624709, star_slowed, -1)
		end

		--����BOSS�ʧ@
		for act = 1,1,1 do
			--DebugMsg(0,0," the mighty for loop")
			--�Y�ʧ@���N���Ҽ{����
			if action > 0 then
			--DebugMsg(0,0,"action = "..action)
				action = action -1
				break
			end
			local targeted = 0
			--�ˬdBOSS��q�O�_�i�J�ĤG���q
			if WY_Global[Room].boss.hp < 50 and stage == 1 then -- and ReadRoleValue(WY_Global[Room].boss.id,EM_RoleValue_SpellMagicID) ==0 then
				DebugMsg(0,0,"low health")
				MagicInterrupt( _bossID )	-- �j�����_��e���I�k
				if not CastSpell(_bossID, _beastID, 851505) then	-- ����
					if not SysCastSpellLv( _bossID, _beastID, 851505, 0 ) then
						WY_Z166_Boss3_ChangeStage()
					end
				end
				action = 1
				stage = 2
				break
			end
			--�ˬdBOSS��q�O�_�۳��q���P
			if WY_Global[Room].boss.hp < 90 and star == 0 then
				--say(WY_boss_id, "CreateStar")
				x,y,z,direction = DW_Location(_bossID)
				x,y,z,direction = DW_NewLocation(0 , 45, x, y, z, direction)
				star = WY_Create_an_obj(starORG,x,y,z,direction)        
				AddBuff(star,625215,0,-1)
				LockHP(star , 1 , "WY_Z166_B3_STAR" )
				Say(WY_Global[Room].boss.id, "[WY_Z166_B3_STAR]")
			end

			--�Ĥ@���q
			if stage == 1 then
			--        DebugMsg(0,0," 111 ")
				--�H�ͥd�F
				if skills.cooldown.infestation <= 0 then
					--say(WY_boss_id,"Infestation")
					CastSpellLV(_bossID, _bossID, infestation, 0)
					action = 2
					skills.cooldown.infestation = 18
					break
				--��q�ɥR
				elseif skills.cooldown.energized <= 0 and star ~= 0 then
					--say(WY_boss_id,"Energized")
					CastSpellLV(_bossID, star, energized, 0)
					action = 1
					skills.cooldown.energized = 19
					break
				--��q����
				elseif skills.cooldown.energycannon <= 0 then
					--say(WY_boss_id,"EnergyCannon")
					local r = RandRange(1,WY_Global[Room].boss.hatecount) 
					targeted = WY_Global[Room].boss.hatelist[r]
					if targeted then
						CastSpellLV(_bossID, targeted, energycannon, 1)
					end
					action = 2
					skills.cooldown.energycannon = 7
					cannoned = WY_Global[Room].boss.hatelist[r]
					--say(cannoned, "i am cannoned")
					break
				--��q�߽�
				elseif skills.cooldown.energycannon <= 4 and cannoned ~= 0 then
				--say(WY_boss_id,"EnergyPulse")
					if cannoned then
						CastSpellLV(_bossID, cannoned, energypulse, 0)
					end
					action = 1
					cannoned = 0
					break
				end
			end

			--�ĤG���q
			if stage == 2 then
			--        DebugMsg(0,0," 222 ")
				--��q����
				if skills.cooldown.evaporation <= 0 then
					CastSpellLV(_beastID, _beastID, evaporation, 0)
					action = 2
					skills.cooldown.evaporation = 11
					break
					--�s��{�q
				elseif skills.cooldown.chainlighting <= 0 then
					local r = RandRange(1,WY_Global[Room].boss.hatecount) 
					targeted = WY_Global[Room].beast.hatelist[r]
					if targeted then
						CastSpellLV(_beastID, targeted, chainlighting, 0)
					end
					action = 2
					skills.cooldown.chainlighting = 13
					break
					--�p���s��
				elseif skills.cooldown.tornado <= 0 then
					CastSpellLV(_beastID, _beastID, 851471, 0)
					action = 2
					skills.cooldown.tornado = 18
					CallPlot(_beastID,"WY_Z166_Boss3_Tornado")
					break
				end
        
			--        if ReadRoleValue( _beastID , EM_RoleValue_IsDead ) == 1 then
				--          DebugMsg(0,0,"--End--");
				--          SetModeEx( _bossID , EM_SetModeType_Show, true )
				--          KillID(_bossID, _bossID);
			--        end
			end 
    		end

		-- 2015.08.17 ���E
		local fightStatus = {};
		fightStatus.boss = false;
		fightStatus.beast = false;

		local bossHateListCount = HateListCount( _bossID );
		local beastHateListCount = HateListCount( _beastID );

		for i = 0, bossHateListCount-1, 1 do --�ˬd boss �����
			local guid = HateListInfo( _bossID, i, EM_HateListInfoType_GItemID );
			if ReadRoleValue( guid, EM_RoleValue_IsAttackMode ) == 1 then
				fightStatus.boss = true;
				break;
			end
		end

		for i = 0, beastHateListCount-1, 1 do --�ˬd boss �ո�����~
			local guid = HateListInfo( _beastID, i, EM_HateListInfoType_GItemID );
			if ReadRoleValue( guid, EM_RoleValue_IsAttackMode ) == 1 then
				fightStatus.beast = true;
				break;
			end
		end
		--
		
		DebugMsg( 0, 0, "time = "..time.total..", bossAttackMode = "..tostring(ReadRoleValue( _bossID, EM_RoleValue_IsAttackMode ))..", boss = "..tostring(fightStatus.boss)..", beast = "..tostring(fightStatus.beast) );

		if not fightStatus.boss then	-- �� Boss ������C��w�Q�M�Ů�
		--	Say(WY_Global[Room].boss.id, "[WY_Z166_B3_RESET]")
			Say( _bossID, "[WY_Z166_B3_RESET]")	-- [108438]�G�u�ɡK�u���o�I�{�װڡK�ݨӳo�Ǽ˥����G�L�k�ҩ��ڪ���s�K�v

	--	if ReadRoleValue( _bossID, EM_RoleValue_IsAttackMode ) == 0 and not fightStatus.boss and not fightStatus.beast then	-- �� Boss ���}�԰��A�B Boss �P�ո�����~������C��w�Q�M�Ů�
	--	if HateListCount(_bossID) < 1 and HateListCount( WY_Global[Room].beast.id ) < 1 then
			DebugMsg(0,0,"--FightEnd--");
			DelObj(star)
			DelObj(door)
			sleep(10)
			--      DebugMsg(0,0,"_beast="..WY_Global[Room].beast.id);
			SetStopAttack( _bossID );	-- Boss ��������B���}�԰��B�M�Ť���
			SetStopAttack( _beastID );	-- �ո�����~ ��������B���}�԰��B�M�Ť���
			--      if WY_Global[Room].beast.hp > 0 then
			if ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 0 and CheckID( _bossID ) then
				DebugMsg(0,0,"--Reset--");
				DelObj(_bossID)
				DelObj(_beastID)
			--	DelObj(WY_Global[Room].beast.id)
			--	x,y,z,direction = DW_Location(OwnerID())	-- �ѦҦ��y�ЮɡA�����v�b�������������쪺���p�U�ͦ�����
				Sleep(50)
				local boss = WY_Create_an_obj( bossORG, g_BossPos.X, g_BossPos.Y, g_BossPos.Z, g_BossPos.Dir );
			--	local boss = WY_Create_an_obj(bossORG,x,y,z,direction)
		--	else
			--        Say(WY_Global[Room].boss.id, "[WY_Z166_B3_DEAD]")
			end
		--	WY_Global[Room] = nil
		--	WY_boss_id[Room] = nil
		--	WY_beast_id[Room] = nil
			DelObj(OwnerID())
			break
		end
		--    DebugMsg(0,0,"--");
		sleep(10)
	end
end

function WY_Z166_Boss3_CreateInfestation()	-- �H�͸`�I
	--say(TargetID(),"I am player")
	local r1 = RandRange(15,45)
	local r2 = RandRange(15,45)
	local player =TargetID()
	local x,y,z,direction = DW_Location(player)
	local _zone = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	if _zone == 166 then
		karsarORG = 108523
	elseif _zone == 167 then
		karsarORG = 108576
	elseif _zone == 168 then
		karsarORG = 108588
	end

	local karsar = WY_Create_an_obj( karsarORG , x+r1 , y , z+r2 ,direction )
	SetModeEx( karsar , EM_SetModeType_DisableRotate , true )
	SetModeEx( karsar , EM_SetModeType_Strikback , false )
	SetModeEx( karsar , EM_SetModeType_Searchenemy , false )
	SetModeEx( karsar , EM_SetModeType_Obstruct , true )
	SetModeEx( karsar , EM_SetModeType_Move , false )
	--  SetModeEx( karsar , EM_SetModeType_NotShowHPMP , false );
	CallPlot(karsar,"WY_Z166_B3_InfestationNod" )
end

function WY_Z166_Boss3_EnergyPulse()	-- ���˧J(�I�k�����Ϊ���)
	local pulse = 0
	local boss = OwnerID()
	local destination = GetDistance(OwnerID(),TargetID())
	--DebugMsg(0,0,"Destination displace = "..destination)
	--  DebugMsg(0,0," =========== ")
	local dis = 30
	local x,y,z,direction = DW_Location(boss)
	x,y,z,direction = DW_NewLocation(0,30 ,x,y,z,direction)
	local _room = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local _zone = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	if _zone == 166 then
		casterORG = 108529
	elseif _zone == 167 then
		casterORG = 108577
	elseif _zone == 168 then
		casterORG = 108589
	end

	--  local temp_object = WY_Create_an_obj(casterORG,x,y,z,direction)
	local temp_object = CreateObj( casterORG , x , y , z , direction , 1 )
	--say(temp_object,"i am here")
	Addbuff(temp_object,625252,0,2)
	SetModeEx( temp_object , EM_SetModeType_Mark , false );
	SetModeEx( temp_object , EM_SetModeType_Show , false );
	WriteRoleValue(temp_object, EM_RoleValue_LiveTime, 2)
	addToPartition(temp_object,_room)
	while destination > dis and pulse < 10 do
		dis = dis+30
		WY_JSUT_WAIT(2)
		DelObj(temp_object)
		x,y,z,direction = DW_Location(temp_object)
		x,y,z,direction = DW_NewLocation(0,30 ,x,y,z,direction)
		--    temp_object = WY_Create_an_obj(casterORG,x,y,z,direction)
		temp_object = CreateObj( casterORG , x , y , z , direction , 1 )
		SetModeEx( temp_object , EM_SetModeType_Mark , false );
		SetModeEx( temp_object , EM_SetModeType_Show , false );
		Addbuff(temp_object,625252,0,2)
		addToPartition(temp_object,_room)
		pulse = pulse + 1
	end
	SysCastSpellLv(OwnerID(), TargetID(), 851487, 0)
	DelObj(temp_object)
end

function WY_Z166_Beast_CombatStart()	-- �ո�����~ �԰��}�l�@��

	DebugMsg( 0, 0, "Beast Fight Start" )

	local me = OwnerID()
	local getReadyFight = ReadRoleValue( me, EM_RoleValue_Register2 )	-- 2015.08.18 ���E�A�קK�ո�����~���ƶi�J�԰��}�l�@���A�ɭP�@�����ê����D�C(Ĵ�p�v��̨ϥθ���)

	if getReadyFight == 1 then
		return
	end
	WriteRoleValue( me, EM_RoleValue_Register2, 1 );

	local _bossID = ReadRoleValue( me, EM_RoleValue_Register1 )	-- Boss
	local AttackTarget = ReadRoleValue( me, EM_RoleValue_AttackTargetID );
	SetAttack( _bossID, AttackTarget );

	--�L��
	addBuff(me,502921,0,-1)
	--���n����
	addBuff(me,625148,0,-1)
	--���n���z
	addBuff(me,507899,0,-1)
	--����
	SetModeEx( me , EM_SetModeType_Move , false );

	local x,y,z,direction = DW_Location(me)
	--  local box = WY_Create_an_obj(111190,x,y,z,direction)
	local box = CreateObj( 111190 , x , y , z , direction , 1 )	-- �إ����Ϊ���
	SetModeEx( box , EM_SetModeType_Obstruct , false ); 
	SetModeEx( box , EM_SetModeType_Mark , false );
	SetModeEx( box , EM_SetModeType_Gravity , false );
	SetModeEx( box , EM_SetModeType_Show , false ); 
	SetModeEx( box , EM_SetModeType_Move , false );
	addToPartition(box,ReadRoleValue(me,EM_RoleValue_RoomID))

	SetPos(box,x,y+50 ,z,direction )
	SetPos(me,x,y+65,z,direction )
	SetDefIdleMotion(me, ruFUSION_MIME_FLY_LOOP)
	DelObj(box)
	DebugMsg( 0, 0, "Beast Fight GetReady" )
end

function WY_Z166_Boss3_ChangeStage()	-- ��������@��

	--  DebugMsg(0,0,"OwnerID="..OwnerID());	-- ���˧J
	--  DebugMsg(0,0,"TargetID="..TargetID());	-- �ո�����~

	local x,y,z,direction = DW_Location(OwnerID())
	local t = 0
	local targeted = ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
	local temp_n = BuffCount(OwnerID())
	local buff_power = 0
	local powered = false
	for n = 1,temp_n do
		if BuffInfo(OwnerID(),n-1,EM_BuffInfoType_BuffID)== 625211 then	-- �����q�A���� ATK %
			buff_power = BuffInfo(OwnerID(), n-1, EM_BuffInfoType_Power)
			powered = true
		end
	end
	x,t,z,direction = DW_Location(TargetID())
	local _beastID = WY_beast_id[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)];
	local _zone = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	local stage2ORG;
	if _zone == 166 then
		stage2ORG = 108516
	elseif _zone == 167 then
		stage2ORG = 108575
	elseif _zone == 168 then
		stage2ORG = 108587
	end

	_beastID = WY_Create_an_obj(stage2ORG,x,y,z,direction)

	Cl_Resist_HackersBossNum(OwnerID());	-- �N Boss ���U�i���b�ȼ@���A���Q�������ո�����~�]�ˬd�@��

	--�ƻsBOSS����q
	WriteRoleValue(_beastID, EM_RoleValue_HP, ReadRoleValue(OwnerID(), EM_RoleValue_HP))
	if powered then
		addBuff(_beastID, 625211, buff_power, -1)
		SysCastSpellLv( _beastID ,  _beastID , 852279 , 0 );
	end

	SetAttack(_beastID, targeted)
	WY_Global[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)].beast = WY_get_objStatus(_beastID);
	DebugMsg(0,0,"_beast="..WY_Global[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)].beast.id);
	DelObj(TargetID())
	--  DelObj(OwnerID())
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false )
	SetModeEx( OwnerID() , EM_SetModeType_Show, false )
	--  SetModeEx(OwnerID(), EM_SetModeType_Searchenemy, false)
	SetModeEx(OwnerID(), EM_SetModeType_Move, false)
	SetModeEx(OwnerID(), EM_SetModeType_Strikback, false)
end

function WY_Z166_Boss3_Tornado()

	sleep(30)
	--�إߤT���s����
	local t = {}
	local _beastID = WY_beast_id[ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)]
	local x,y,z,direction = DW_Location(_beastID);
	local des = {}
	des[1] = {}
	des[2] = {}
	des[3] = {}
	des[1].x, des[1].y, des[1].z, des[1].direction = DW_NewLocation(340,30,x,y,z,direction)
	des[2].x, des[2].y, des[2].z, des[2].direction = DW_NewLocation(0,30,x,y,z,direction)
	des[3].x, des[3].y, des[3].z, des[3].direction = DW_NewLocation(20,30,x,y,z,direction)

	local s_casterORG;
	local _zone = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	if _zone == 166 then
		s_casterORG = 108561
	elseif _zone == 167 then
		s_casterORG = 108578
	elseif _zone == 168 then
		s_casterORG = 108590
	end

	for n = 1,3 do
		t[n] = WY_Create_an_obj( s_casterORG,des[n].x , des[n].y , des[n].z , des[n].direction );
		WriteRoleValue(t[n], EM_RoleValue_LiveTime, 2)
		SetModeEx( t[n] , EM_SetModeType_Mark , false )
		SetModeEx(t[n], EM_SetModeType_Fight, false )
		SetModeEx(t[n], EM_SetModeType_Searchenemy, false)
		--SetModeEx(t[n], EM_SetModeType_Move, false)
		SetModeEx(t[n], EM_SetModeType_Strikback, false)
		AddBuff(t[n] , 625253, 0, -1)
	end

	--�إߤT���s�������ت��a��T
	des[1].x, des[1].y, des[1].z, des[1].direction = DW_NewLocation(340,150,x,y,z,direction)
	des[2].x, des[2].y, des[2].z, des[2].direction = DW_NewLocation(0,150,x,y,z,direction)
	des[3].x, des[3].y, des[3].z, des[3].direction = DW_NewLocation(20,150,x,y,z,direction)
  
	--�ϤT���s�������i�Q��ܡB��������B�é��ت��a����
	for a = 1,3 do
		MoveDirect(t[a] , des[a].x, des[a].y, des[a].z)
	end
end

function WY_Z166_B3_InfestationNod()

	local Room = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local timer = 0
	while timer <= 8 do
		timer = timer +1
		sleep(10)
	end
	if WY_Global[Room] ~= nil then
		DebugMsg(0,0,"-----");
		AddBuff(WY_Global[Room].boss.id,625211,0 ,-1)
		SysCastSpellLv( WY_Global[Room].boss.id, WY_Global[Room].boss.id, 852279 , 0 );
	end
	DelObj(OwnerID())
end

function WY_JSUT_WAIT(num)
	sleep(num)
end

function WY_Z166_B3_End()
	DebugMsg(0,0,"--End--");
	local _room = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local _boss = WY_Global[_room].boss.id;
	DebugMsg(0,0,"--End--, _boss = ".._boss);
	CallPlot( _boss, 'WY_Z166_B3_End2' )
end

function WY_Z166_B3_End2()
	local _boss = OwnerID()
	DebugMsg(0,0,"--End2--, _boss = ".._boss);
	SetModeEx( _boss , EM_SetModeType_Mark , true );
	SetModeEx( _boss , EM_SetModeType_Show , true );
	SetModeEx( _boss , EM_SetModeType_Fight , true );
	Say(_boss, "[WY_Z166_B3_DEAD]");
	LockHP( _boss, -1, '')
	KillID( _boss , _boss );
	Cl_Resist_HackersBossDead( _Z30_Boss_3 );
end

function WY_Z166_B3_STAR()
end

function WY_Z166_lockhp()
end