function Lua_Zone22_105976_SkillInfo( level  ,  mode )
	level = level or 0;
	mode = mode or 1;
	local SkillInfo = {};
	local BuffLv = 0;
	local BossID = 0;
	local MonsterIDs = {};
	
--			{ ID , Lv }
	if level==0 then--���q
		SkillInfo[1] = { ID=497383 , Lv=10 };--�]�k�y
		SkillInfo[2] = { ID=497384 , Lv=10 };--����
		SkillInfo[3] = { ID=497385 , Lv=8 };--�AE
		SkillInfo[4] = { ID=497386 , Lv=10 };--���z
		SkillInfo[5] = { ID=497387 , Lv=0 };--�]�k�R��
		SkillInfo[6] = { ID=497389 , Lv=10 };--��������AE
		SkillInfo[7] = { ID=498057 , Lv=0 };--�B�ߨ���
		BossID = 105976;		--���q��Boss OrgID
		BuffLv = 14;			--�k��N��Buff�h��
		MonsterIDs[1] = 105978;		--�]�k�ů���
		MonsterIDs[2] = 105979;		--��
		MonsterIDs[3] = 105980;		--��
	elseif level==1 then--²��
		SkillInfo[1] = { ID=497383 , Lv=0 };--�]�k�y
		SkillInfo[2] = { ID=497384 , Lv=0 };--����
		SkillInfo[3] = { ID=497385 , Lv=4 };--�AE
		SkillInfo[4] = { ID=497386 , Lv=0 };--���z
		SkillInfo[5] = { ID=497387 , Lv=0 };--�]�k�R��
		SkillInfo[6] = { ID=497389 , Lv=0 };--��������AE
		SkillInfo[7] = { ID=498057 , Lv=0 };--�B�ߨ���
		BossID = 106735;		--²����Boss OrgID
		BuffLv = 9;			--�k��N��Buff�h��
		MonsterIDs[1] = 106736;		--�]�k�ů���
		MonsterIDs[2] = 106737;		--��
		MonsterIDs[3] = 106738;		--��
	end
	
	local Ouput = { SkillInfo , BuffLv , BossID , MonsterIDs };
	return Ouput[mode];
	
--	���ߦ��_�����Gcrafting_start
--	�Ť������R���y�ʧ@�Gcrafting_idle
--	�����Gcrafting_end
end

function Lua_Zone22_105976_FunctionsInit( override )
	if Lua_Zone22_105976_DeadEvent==nil or override==1 then
		Lua_Zone22_105976_DeadEvent = function()
			local Boss = OwnerID();
			ScriptMessage( Boss , -1 , 2 , "[SC_105976_BOSSDEAD]" , C_SYSTEM );
			CallPlot( Lua_Zone22_EternalTowerWS_Boss5[ReadRoleValue(Boss,EM_RoleValue_RoomID)].Ctrl ,"Lua_Zone22_105976_DelObj",2 );
			return true
		end
	end
	if Lua_Zone22_105976_BossCreate==nil or override==1 then
		Lua_Zone22_105976_BossCreate = function()
			local Ctrl = OwnerID();
			local RoomID = ReadRoleValue(Ctrl , EM_RoleValue_RoomID);
			local level = ReadRoleValue( Ctrl , EM_RoleValue_PID );
			local BossID = Lua_Zone22_105976_SkillInfo(level , 3);
			local Boss = kg_GetPosRX( {780986,0},BossID );
			Lua_Zone22_EternalTowerWS_Boss5[RoomID].Boss=Boss;
			MoveToFlagEnabled( Boss,false );
			SetModeEx( Boss , EM_SetModeType_Revive, false );	--�i����
			WriteRoleValue( Boss , EM_RoleValue_PID , level );	--�s������
			AddToPartition( Boss , RoomID );
			SetPlot( Boss, "dead" , "Lua_Zone22_105976_DeadEvent" ,30 );
			AddBuff(Boss , 508887 , 0 , -1 );--���^��
		end
	end
	if Lua_Zone22_105976_DelObj==nil or override==1 then
		Lua_Zone22_105976_DelObj= function( Reset )--1:���m 2:Boss���`
			local Oid = OwnerID();
			local RoomID = ReadRoleValue(Oid ,EM_RoleValue_RoomID);
			DelObj(Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor);
			if Reset~=2 then
				DelObj(Lua_Zone22_EternalTowerWS_Boss5[RoomID].Boss);
			end
			
			local NpcCount = SetSearchAllNPC(RoomID);
			local NpcGid , NpcOrgid = 0,0;
			local BossIDs = {};
			BossIDs[1] = Lua_Zone22_105976_SkillInfo(0,3);
			BossIDs[2] = Lua_Zone22_105976_SkillInfo(1,3);
			for i = 1 , NpcCount do
				NpcGid = GetSearchResult();
				NpcOrgid = ReadRoleValue( NpcGid ,EM_RoleValue_OrgID );
				if NpcOrgid==105718 or NpcOrgid==106734  then--����
					DelObj( NpcGid );
				end
				--�R��Boss
				if Reset~=2 then
					if NpcOrgid==BossIDs[1] or NpcOrgid==BossIDs[2] then
						DelObj( NpcGid );
					end
				end
				--�R����L����
				if NpcOrgid>105976 and NpcOrgid<=105980 then
					DelObj( NpcGid );
				end
				if NpcOrgid>106735 and NpcOrgid<=106738 then
					DelObj( NpcGid );
				end
			end
			if Reset == 1 then
				Sleep(50);
				Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor=0;
				Lua_Zone22_EternalTowerWS_Boss5[RoomID].Boss=nil;
				Lua_Zone22_105976_BossCreate();
			else
				Sleep(20);
				Lua_Zone22_EternalTowerWS_Boss5[RoomID]=nil;
			end
		end
	end
	if Lua_Zone22_105976_BossCrazy==nil or override==1 then	--�g��function
		Lua_Zone22_105976_BossCrazy = function()
			local Boss= OwnerID();
			local timer = 0;
			local level = ReadRoleValue( Boss , EM_RoleValue_PID );
			local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
			while 1 do
				if KS_InCombat(Boss)~=true then
					--Say(Boss , "z144_boss5 leave battle!!!!!!");
					DebugMsg(0,RoomID,"z144_boss5 leave battle!!!!!!");
					ScriptMessage( Boss , -1 , 2 , "[SC_105976_RESET]" , C_SYSTEM );
					CallPlot( Lua_Zone22_EternalTowerWS_Boss5[RoomID].Ctrl , "Lua_Zone22_105976_DelObj" , 1 );
					return
				end
				if kg_GetDis( Boss , 780986 , 0 )>350  and ReadRoleValue(Boss, EM_RoleValue_Register2)==0 then--�b�a�W�Ҧ��W�X�Z��
					--Say(Boss,"z144_boss5 out of range");
					DebugMsg(0,RoomID,"z144_boss5 out of range");
					CallPlot( Lua_Zone22_EternalTowerWS_Boss5[RoomID].Ctrl , "Lua_Zone22_105976_DelObj" , 1 );
					return
				end
				if timer==360 and level==0  then
					ScriptMessage( Boss , -1 , 2 , "[SC_105976_BOSSCRAZY]" , C_SYSTEM )--Boss�g��
					AddBuff(Boss,620561 ,0,-1);
				end
				sleep(20)
				timer=timer+2;
			end
		end
	end
	if Lua_Zone22_105976_LockHpEvent==nil or override==1 then
		Lua_Zone22_105976_LockHpEvent = function()
			local Boss = OwnerID();
			if ReadRoleValue(Boss , EM_RoleValue_Register2)==0 then
				WriteRoleValue(Boss ,EM_RoleValue_Register2,1);
			end
		end
	end
	if Lua_Zone22_105976_MonsterAI==nil or override==1 then
		Lua_Zone22_105976_MonsterAI = function( MonsterSwitch )
			local Monster = OwnerID();
			if MonsterSwitch ==1 then	--�]�k�ů���
				local TargetFlagID = 0; local FlagID = 780986;
				local x,y,z;
				TargetFlagID = kg_Rand( 4,GetMoveFlagCount(780986)-1);
				if TargetFlagID==ReadRoleValue(Monster, EM_RoleValue_Register1 ) then
					TargetFlagID = TargetFlagID+1;
				end
				if TargetFlagID>( GetMoveFlagCount(FlagID)-1 ) then TargetFlagID=3 end
				x,y,z,_=kg_GetPosRX( {FlagID,TargetFlagID} , nil , Rand( 50 ) , 0 ,Rand(360) );
				MoveDirect( Monster , x,y,z );
				Sleep(30);
				local SkillInfo = Lua_Zone22_105976_SkillInfo( ReadRoleValue(Monster , EM_RoleValue_PID) , 1 );--PID���s������
				local Skill = SkillInfo[4];--���z
				CastSpellLv( Monster , Monster , Skill.ID , Skill.Lv  ); Sleep(5); DelObj(Monster);
			elseif MonsterSwitch==2 then	--��
				local TargetFlagID = 0; local FlagID = 780986;
				local x,y,z;
				local CurrentFlag = ReadRoleValue(Monster, EM_RoleValue_Register1 );
				while 1 do
					TargetFlagID = kg_Rand( 4,GetMoveFlagCount(780986)-1);
					if TargetFlagID==CurrentFlag then
						TargetFlagID = TargetFlagID+1;
					end
					if TargetFlagID>( GetMoveFlagCount(FlagID)-1 ) then TargetFlagID=3 end
					x,y,z,_=kg_GetPosRX( {FlagID,TargetFlagID} , nil , Rand( 50 ) , 0 ,Rand(360) );
					LuaFunc_WaitMoveTo( Monster, x,y,z );
					CurrentFlag = TargetFlagID;
					Sleep(10);
				end
			elseif MonsterSwitch==3 then	--��
				local Skillinfo = Lua_Zone22_105976_SkillInfo( ReadRoleValue(Monster , EM_RoleValue_PID) , 1 );
				local Skill = SkillInfo[7]; Skillinfo = nil;
				local atkTarget=0;
				local TmpHateList  , PlayersInHate= {} , {};
				local SkillTimer = 0;
				local Boss = Lua_Zone22_EternalTowerWS_Boss5[ ReadRoleValue(Monster,EM_RoleValue_RoomID) ].Boss;
				Sleep(20);
				AddBuff( Monster , 620670 , 0,-1 );--�H�B�����F��
				while 1 do
					SkillTimer = SkillTimer+1;
					PlayersInHate = KS_GetHateList( Boss , 4 );
					atkTarget = ReadRoleValue( Monster , EM_RoleValue_AttackTargetID );
					if CheckBuff( atkTarget , 620660 )==true then
						TmpHateList={};
						for i in pairs(  PlayersInHate) do
							if CheckBuff( PlayersInHate[i] , 620660 )~=true then
								table.insert( TmpHateList , PlayersInHate[i] );
							end
						end
						if #TmpHateList>0 then
							atkTarget = PlayersInHate[math.random(#TmpHateList)];
							SetAttack( Monster , atkTarget );
						end
					end
					if SkillTimer==4 then
						if #PlayersInHate>0  then
							atkTarget = PlayersInHate[math.random(#PlayersInHate)];
							CastSpellLv( Monster , atkTarget , Skill.ID , Skill.Lv );
						end
						SkillTimer=0;
					end
					Sleep(10);
				end
			end
		end
	end
	if Lua_Zone22_105976_TouchFeather==nil or override==1 then
		Lua_Zone22_105976_TouchFeather = function()
			local Oid= OwnerID();--���a
			local Tid=TargetID();--�Ф�
			if ReadRoleValue( Oid ,EM_RoleValue_IsPlayer )==1  then
				if ReadRoleValue( Tid , EM_RoleValue_Register1 )==0  and  CheckBuff( Oid , 620660 )~=true then --�Q�H�B���ê��H�L�k�Ũ��Ф�
					WriteRoleValue( Tid ,EM_RoleValue_Register1 ,1);
					SetPlot( Tid , "touch","" , 30 );--����Ĳ�I�@��
					SysCastSpellLv( Tid , Oid , 497388 , 0 );--���Я�q
					BeginPlot( Tid , "Lua_Zone22_105976_TouchFeather" ,0 );
					SetModeEx( Tid , EM_SetModeType_Mark, false);
					SetModeEx( Tid , EM_SetModeType_Show, false);
				end
			else
				Sleep(20);
				DelObj( Oid );
			end
		end
	end
end

function Lua_Zone22_105976_BossInit()
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl , EM_RoleValue_RoomID);
	--�����ܼ�
	if type(Lua_Zone22_EternalTowerWS_Boss5)~="table" then
		Lua_Zone22_EternalTowerWS_Boss5 = {};
	end
	if type(Lua_Zone22_EternalTowerWS_Boss5[RoomID])~="table" then
		Lua_Zone22_EternalTowerWS_Boss5[RoomID] = {};
	end
	--function�ŧi
	Lua_Zone22_105976_FunctionsInit();
	--��l��
	Lua_Zone22_EternalTowerWS_Boss5[RoomID].Ctrl = Ctrl;
	Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor=0;
	Lua_Zone22_105976_BossCreate();
end

function Lua_Zone22_105976_BossAI()--Boss�i�J�԰���Ұ�
	local Boss = OwnerID();
	if ReadRoleValue(Boss,EM_RoleValue_Register1)==0 then--�N�ҪO���i�J�԰�pcall�ഫ
		WriteRoleValue( Boss , EM_RoleValue_Register1,1 );
		BeginPlot( Boss, "Lua_Zone22_105976_BossAI" , 0 );
		return
	end
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local EnterDoor = CreateObjByFlag( 103126, 780986 , 1 , 1 )--�J�f���ת�
	Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor = EnterDoor;
	kg_DoorInit( EnterDoor );
	AddToPartition( EnterDoor , RoomID );
	
	BeginPlot( Boss , "Lua_Zone22_105976_BossCrazy" , 0 );
	local CurrentLockHP=0.9; local BossMaxHP = ReadRoleValue(Boss,EM_RoleValue_MaxHP);
	LockHP( Boss , BossMaxHP*CurrentLockHP , "Lua_Zone22_105976_LockHpEvent" );
	local level = ReadRoleValue( Boss , EM_RoleValue_PID );
	local SkillInfo = Lua_Zone22_105976_SkillInfo( level , 1 );
	local BuffLv = Lua_Zone22_105976_SkillInfo( level , 2 );
	local MonsterIDs = Lua_Zone22_105976_SkillInfo( level , 4 );
	local CurrentSkill ,atkTarget , PlayersInHate = 0,0,{};
	local Timer,ChangeFormTimer = 1,1;
	local FlyUp=0;
	local RandNum=0;
	local FireMonsterArray={};
	local TempBoss,TempVar , TempArray= 0,0,{};
	local SampleFlagID = {};
	for i = 4 , GetMoveFlagCount( 780986 )-1 do
		table.insert( SampleFlagID , i );
	end
	if level ==0 then
		TempBoss = kg_GetPosRX( Boss , 105718 );--�t�d�b�Ť���������(���`)
	elseif level ==1 then
		TempBoss = kg_GetPosRX( Boss , 106734  );--�t�d�b�Ť���������(²��)
	end
	
	MoveToFlagEnabled( TempBoss , false );
	--SetModeEx( TempBoss , EM_SetModeType_Strikback, false); ---����(�_)
	SetModeEx( TempBoss , EM_SetModeType_Fight, false); ---�i���(�_)
	--SetModeEx( TempBoss , EM_SetModeType_Searchenemy, false);--������
	SetModeEx( TempBoss , EM_SetModeType_Move, false); ---����	(�_)
	SetModeEx( TempBoss , EM_SetModeType_Gravity, false);--���O
	SetDefIdleMotion( TempBoss , ruFUSION_MIME_CRAFTING_LOOP );
	AddBuff(TempBoss ,507899,0,-1);--���i����BUFF
	ScriptMessage( Boss , -1 , 2 , "[SC_105976_FIGHT]" , C_SYSTEM )--�i�J�԰��x��
	math.randomseed(math.random(1, 99999));
	Sleep(10);
	while 1 do
		if KS_InCombat(Boss)==true then
			
			if ChangeFormTimer>=23 then	--���ѭp�ɾ�
				ChangeFormTimer=1;
				if ReadRoleValue( Boss, EM_RoleValue_Register2 )==0 then
					WriteRoleValue( Boss , EM_RoleValue_Register2  , 1);
				end
			end
			if ReadRoleValue( Boss, EM_RoleValue_Register2 )==0 then--�a�W�Ҧ�
				ChangeFormTimer = ChangeFormTimer+1; --DebugMsg(0,0,"ChangeFormTimer="..ChangeFormTimer);
				if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0 then
					if  timer%7==0 then
						RandNum = math.random( 100 );
						if RandNum>50 then
							CurrentSkill=1;--�]�k�y
							TempArray = {};
							PlayersInHate = KS_GetHateList( Boss , 4 );
							for i,v in ipairs(PlayersInHate) do
								TempVar = GetDistance( Boss , v );
								if TempVar>=150 and TempVar<=1000 then
									table.insert( TempArray , v );
								end
							end
							if #TempArray>0 then
								atkTarget = TempArray[math.random(#TempArray)];
							else
								atkTarget = PlayersInHate[math.random(#PlayersInHate)]; DebugMsg(0,0,"NoFarPlayer");
							end
							CastSpellLv( Boss , atkTarget , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
						else
							CurrentSkill=2;--����
							--atkTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID);
							CastSpellLv( Boss , Boss , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
						end
					elseif timer%13==0 then
						CurrentSkill = 3;--�AE
						CastSpellLv( Boss , Boss , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
					elseif timer%15==0 then
						--�s�p����
						ScriptMessage( Boss , -1 , 2 , "[SC_105976_CREATEMAGIC]" , C_SYSTEM );
						TempArray={};
						TempArray  = KS_RegroupArray( SampleFlagID , 2 );
						for i = 1,2 do
							TempVar = kg_GetPosRX( { 780986,TempArray[i] } ,MonsterIDs[1] );
							MoveToFlagEnabled( TempVar, false );
							WriteRoleValue(TempVar , EM_RoleValue_PID , level);
							WriteRoleValue( TempVar , EM_RoleValue_Register1 , TempArray[i] );--�X���I�X��
							SetModeEx( TempVar , EM_SetModeType_Revive, false );
							SetModeEx( TempVar , EM_SetModeType_Searchenemy, false)---����(�_)
							SetModeEx( TempVar , EM_SetModeType_Strikback, false) ---����(�_)
							AddToPartition( TempVar,RoomID );
							CallPlot( TempVar ,"Lua_Zone22_105976_MonsterAI",1 );
						end
					end
					timer = timer+1; --DebugMsg(0,0,"timer="..timer);
				end
			elseif ReadRoleValue( Boss, EM_RoleValue_Register2 )==1  and ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0  then--�W�żҦ�
				if FlyUp==0 then--������
					--LockHP( Boss , BossMaxHP*CurrentLockHP , "" );
					CurrentLockHP = CurrentLockHP-0.1;
					if CurrentLockHP>0 then
						LockHP( Boss, BossMaxHP*CurrentLockHP , "Lua_Zone22_105976_LockHpEvent" );
					end
					CurrentSkill=5;--�]�k�R��
					FlyUp=1; timer=1;
					ScriptMessage( Boss , -1 , 2 , "[SC_105976_FLY]" , C_SYSTEM );
					SetModeEx( Boss , EM_SetModeType_Mark, false);
					SetModeEx( Boss , EM_SetModeType_Move, false); ---����	(�_)
					--SetModeEx( Boss , EM_SetModeType_Strikback, false); ---����(�_)
					SetModeEx( Boss , EM_SetModeType_Fight, false); ---�i���(�_)
					--SetModeEx( Boss , EM_SetModeType_Searchenemy, false);--������
					SetModeEx( Boss , EM_SetModeType_Gravity, false);--���O
					PlayMotion( Boss, ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
					SetDefIdleMotion( Boss , ruFUSION_MIME_CRAFTING_LOOP );
					Sleep(20);--���쭸�W��
					WriteRoleValue( TempBoss , EM_RoleValue_X , ReadRoleValue(Boss,EM_RoleValue_X) );
					WriteRoleValue( TempBoss , EM_RoleValue_Y , ReadRoleValue(Boss,EM_RoleValue_Y) );
					WriteRoleValue( TempBoss , EM_RoleValue_Z , ReadRoleValue(Boss,EM_RoleValue_Z) );
					WriteRoleValue( TempBoss , EM_RoleValue_Dir , ReadRoleValue(Boss,EM_RoleValue_Dir) );
					WriteRoleValue( TempBoss , EM_RoleValue_HP , ReadRoleValue(Boss ,EM_RoleValue_HP) );
					--Hide(Boss);
					SetModeEx( Boss , EM_SetModeType_Show ,false);
					--Show(Boss ,RoomID);
					AddToPartition( TempBoss , RoomID );
					CancelBuff( TempBoss , 620652 );--�קK�W�����Ѫ�buff�ݯd
					PlayersInHate = KS_GetHateList( Boss ,4 );
					if #PlayersInHate>0 then
						for i in pairs( PlayersInHate ) do
							SysCastSpellLv( PlayersInHate[i],TempBoss,497448,0 )--�j���1
						end
					end
					Sleep(10);
					SetPos( Boss , kg_GetPosRX( {780986,3},nil,120,5,180 ) );--�N���L�ǰe�쯫������
					AddBuff(TempBoss , 508887 , 0 , -1 );--���^��
					AddBuff( TempBoss ,620652 , BuffLv ,-1 );--20�h�k��N��
					WriteRoleValue( TempBoss , EM_RoleValue_Register3,1 );
					--���ͤ����
					if #PlayersInHate>0 then
						FireMonsterArray ={};
						local FireCount = 3;--�p�����ƶq
						if level==1 then
							FireCount = 1;
						end
						for i =1,FireCount do
							RandNum = math.random(4,GetMoveFlagCount(780986)-1);
							TempVar = kg_GetPosRX( {780986,RandNum} , MonsterIDs[2] , Rand(30) , 0 , Rand(360) );
							table.insert( FireMonsterArray , TempVar );
							MoveToFlagEnabled( TempVar, false );
							WriteRoleValue(TempVar , EM_RoleValue_PID , level);
							WriteRoleValue( TempVar , EM_RoleValue_Register1 , RandNum );--�X���I�X��
							SetModeEx( TempVar , EM_SetModeType_Revive, false );
							SetModeEx( TempVar , EM_SetModeType_Mark, false)	----�i�I��(�_)
							SetModeEx( TempVar , EM_SetModeType_Strikback, false) ---����(�_)
							SetModeEx( TempVar , EM_SetModeType_Fight, false) ---�i���(�_)
							SetModeEx( TempVar , EM_SetModeType_Searchenemy, false)	---����(�_)
							AddToPartition( TempVar , RoomID );
							if level == 0 then
								AddBuff( TempVar , 620673 , 0,-1 );--�ۿU�{�H�F��
							elseif level==1 then
								AddBuff( TempVar , 622283 , 0,-1 );--�ۿU�{�H�F��
							end
							CallPlot( TempVar , "Lua_Zone22_105976_MonsterAI" , 2 );
						end
						RandNum = math.random(4,GetMoveFlagCount(780986)-1);
						TempVar = kg_GetPosRX( {780986,RandNum} , MonsterIDs[3] , Rand(100) , 0 , Rand(360) );
						MoveToFlagEnabled( TempVar, false );
						WriteRoleValue(TempVar , EM_RoleValue_PID , level);
						SetModeEx( TempVar , EM_SetModeType_Revive, false );
						AddToPartition( TempVar , RoomID );
						CallPlot( TempVar , "Lua_Zone22_105976_MonsterAI" , 3 );
					end
					
				end
				if timer>=30 or CheckBuff( TempBoss , 620652 )~=true then	--�i�J�U���Ҧ�
					FlyUp=0; timer=1; ChangeFormTimer=1;
					WriteRoleValue( TempBoss , EM_RoleValue_Register3,0 );--����A�ΦФ����
					if CheckBuff( TempBoss , 620652 )==true then
						ScriptMessage( Boss , -1 , 2 , "[SC_105976_FLOOR]" , C_SYSTEM );
						AddBuff( Boss , 620652 , KS_CheckBuffLV(TempBoss,620652) -1 , -1 );
					else
						ScriptMessage( Boss , -1 , 2 , "[SC_105976_FLOORNOBUFF]" , C_SYSTEM );
					end
					SetPos( Boss , kg_GetPos(TempBoss) ); SetDir( Boss , ReadRoleValue(TempBoss,EM_RoleValue_Dir) );
					DelFromPartition( TempBoss );
					SetModeEx( Boss , EM_SetModeType_Gravity, true);--���O
					SetModeEx( Boss , EM_SetModeType_Show ,true);
					SetModeEx( Boss , EM_SetModeType_Mark, true);
					Sleep(10);
					PlayMotion( Boss, ruFUSION_ACTORSTATE_CRAFTING_END );
					SetDefIdleMotion( Boss , ruFUSION_MIME_IDLE_STAND );
					Sleep(20);
					for i in pairs( FireMonsterArray ) do
						DelObj( FireMonsterArray[i] );
					end
					FireMonsterArray = {};
					CurrentSkill=6;	--��������AE
					CastSpellLv( Boss , Boss , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
--					if math.abs(ReadRoleValue( Boss ,EM_RoleValue_HP )-BossMaxHP*CurrentLockHP)<=BossMaxHP*0.01 then
--						CurrentLockHP = CurrentLockHP-0.1;
--					end
--					if CurrentLockHP>0 then
--						LockHP( Boss, BossMaxHP*CurrentLockHP , "Lua_Zone22_105976_LockHpEvent" );
--					end
					SetModeEx( Boss , EM_SetModeType_Move, true); ---����	(�_)
					--SetModeEx( Boss , EM_SetModeType_Strikback, true); ---����(�_)
					SetModeEx( Boss , EM_SetModeType_Fight, true); ---�i���(�_)
					--SetModeEx( Boss , EM_SetModeType_Searchenemy, true);--������
					Sleep(20);
					CancelBuff( Boss , 620652 );--�����k��N��
					WriteRoleValue( Boss , EM_RoleValue_Register2,0 );--�i�J�a�����A
				elseif timer%2==0 then--�Ť��ɼu�Ҧ�
					PlayersInHate = KS_GetHateList( Boss , 4 );
					if #PlayersInHate>0 then
						atkTarget=PlayersInHate[ math.random(#PlayersInHate) ];
						SetDir(TempBoss, CalDir( ReadRoleValue(atkTarget,EM_RoleValue_X)-ReadRoleValue(TempBoss,EM_RoleValue_X),ReadRoleValue(atkTarget,EM_RoleValue_Z)-ReadRoleValue(TempBoss,EM_RoleValue_Z) ) );
						SysCastSpellLv( TempBoss , atkTarget , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
						--���ͦФ�
						TempArray={};
						if #SampleFlagID>6 then
							TempArray=KS_RegroupArray( SampleFlagID , 6 );
						else
							TempArray = KS_RegroupArray( SampleFlagID  );
						end
						for i =1,#TempArray do
							TempVar = kg_GetPosRX( {780986 , TempArray[i] } , 105977,Rand(60),0,Rand(360) );
							WriteRoleValue( TempVar , EM_RoleValue_LiveTime ,8);
							MoveToFlagEnabled( TempVar, false );
							SetModeEx( TempVar , EM_SetModeType_Move, false) ---����	(�_)
							SetModeEx( TempVar , EM_SetModeType_Mark, true)	----�i�I��(�_)
							SetModeEx( TempVar , EM_SetModeType_ShowRoleHead, false) 	---�Y����(�_)
							SetModeEx( TempVar , EM_SetModeType_Strikback, false) ---����(�_)
							SetModeEx( TempVar , EM_SetModeType_Fight, false) ---�i���(�_)
							SetModeEx( TempVar , EM_SetModeType_Searchenemy, false)	---����(�_)
							AddToPartition( TempVar , RoomID );
							SetCursorType( TempVar , eCursor_Interact ); --����ܦ� ����
							SetPlot( TempVar , "touch","Lua_Zone22_105976_TouchFeather" , 30 );
						end
					end
				end
				timer = timer+1; --DebugMsg(0,0,"Flying Timer="..timer );
			end
		else
			--�����԰�
			break
		end
		Sleep(10);
	end
end

function Lua_Zone22_105976_FeatherSkill()
	local Oid =OwnerID();--���a
	local Boss = TargetID();
	local BuffLv=0;
	if CheckBuff( Boss ,620652)==true then
		--CancelBuff( Oid , 620661 );--�ݾl��q
		BuffLv = KS_CheckBuffLV( Boss , 620652 );--���oBOSS���W��Buff����
		--DebugMsg(0,0,"Boss BuffLv="..BuffLv);
		BuffLv = BuffLv-2;
		CancelBuff( Boss, 620652 );
		if BuffLv>=0 then
			AddBuff( Boss , 620652 , BuffLv , -1 );
		end
	end
end

function Lua_Zone22_105976_CheckBoss()
	local Oid = OwnerID();
	local Boss = TargetID();
	local OrgID = ReadRoleValue( Boss , EM_RoleValue_OrgID );
	if (OrgID==105718 or OrgID==106734 ) and CheckBuff( Boss ,620652)==true and ReadRoleValue(Boss,EM_RoleValue_Register3)==1 then
		CancelBuff( Oid , 620661 );--�ݾl��q
		return true
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end