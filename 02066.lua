
--���f--/GM ? zone 163 0 2306.4 774.3 -130.7
--Flag--781380
--Count--108278
--�ѪŤ���--123481
--�j�a�ٰʳz���y--108344
--�X��--Flag1--BOSS
--�X��--Flag2--�e��
--�X��--Flag3--���
--�X��--Flag4~23--�p�ǥͩ��I

--BOSS--EM_RoleValue_register1--Count
--BOSS--EM_RoleValue_register2--Mode
--BOSS--EM_RoleValue_register9--Entrance
--BOSS--EM_RoleValue_register10--Exit
--feather--EM_RoleValue_register1--BOSS
--feather--EM_RoleValue_register2--player
--count--EM_RoleValue_register3--1--���`

--for�j��ϥΦ�--a

--�� ��� ��--
function sasa_108481_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Count , EM_RoleValue_ZoneID )
	local BossNum = { 108481 , 108482 , 108483 }
	local Buff = { 625098 , 625425 }			--�L���R , �t��
	local class
	if ZoneID == 163 or ZoneID == 940 then		--�x��--���հ�
		class = 1
	elseif ZoneID == 164 then	--���q
		class = 2
	elseif ZoneID == 165 then	--²��
		class = 3
	end
	local BOSS = CreateObjByFlag( BossNum[class] , 781380 , 1 , 1 )
	AddToPartition( BOSS , Room )
	BeginPlot( BOSS , "sasa_108481_AI" , 0 )
	Setplot( BOSS , "dead" , "sasa_108481_Dead" , 30 )
	WriteRoleValue( BOSS , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781380 , 3 , 1 )	--����X�f
	SetModeEx( Exit , EM_SetModeType_Move , false )			--������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--���i��
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--���i�I
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--��show���
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--����
	AddToPartition( Exit , Room )               
	WriteRoleValue( BOSS , EM_RoleValue_register10 , Exit )
	
	local Mode = 0
	local EnterFight = 0
	local Earth = DW_CircleRand(20)	--�ݬ����X�ƶq����
	local WindCounter = 0		--�_��
	local ECounter = 0			--�j�a�p��
	local BerserkCounter = 0	-------�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID )
		local MaxHP = ReadRoleValue( BOSS , EM_RoleValue_MaxHP )					--�`��q
		local NowHP = ReadRoleValue( BOSS , EM_RoleValue_HP )						--��e��q
		local HPPercent = ( NowHP / MaxHP )*100										--��q�ʤ���
		if ( BossTarget ~= 0 ) and ( CheckID( BOSS ) ) == true then
			WindCounter = WindCounter + 1
			ECounter = ECounter + 1
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				AddBuff( BOSS , Buff[1] , 0 , -1 )	--�L���R
				ScriptMessage( BOSS , -1 , 2 , "[SC_108481_01]" , 1 )
				--����~�Ӫ̪����Z�A[108481]���ʮ�]��ۦV�W�k��
				Mode = 1
				WriteRoleValue( BOSS , EM_RoleValue_register2 , 1 )
				Entrance = CreateObjByFlag( 106239 , 781380 , 2 , 1 )		--�e���J�f
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--���i��
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--���i�I
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--��show���
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--����
				AddToPartition( Entrance , Room )
				WriteRolevalue( BOSS , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if Mode == 1 then
				if HPPercent <= 60 and ReadRoleValue( BOSS , EM_RoleValue_register3 ) ~= 1 then
					AddBuff( BOSS , Buff[2] , 0 , -1 )	--�t��
					CancelBuff_NoEvent( BOSS , Buff[1] )--�����L���R
					Mode = 2
					WriteRoleValue( BOSS , EM_RoleValue_register2 , 2 )
					Sleep(10)
				end
			end
			if EnterFight == 1 then
--�� �C23��_�� ��--
				if WindCounter >= 23 then
					for b = 1 , 5 do
						local feather = CreateObjByFlag( 123481 , 781380 , Earth()+3 , 1 )--�qflag4�}�l�ت���A����RAND���]�tflag0�A�ҥH+3 �O�n���Lflag1~3
						SetModeEx( feather , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
						SetModeEx( feather , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
						SetModeEx( feather , EM_SetModeType_Searchenemy, false )   	--����
						SetModeEx( feather , EM_SetModeType_Fight, false ) 			--���
						SetModeEx( feather , EM_SetModeType_Move, false )				--����
						SetModeEx( feather , EM_SetModeType_ShowRoleHead, true )
						SetModeEx( feather , EM_SetModeType_NotShowHPMP , true )		--��show���
						SetModeEx( feather , EM_SetModeType_Strikback, false )			--����
						SetModeEx( feather , EM_SetModeType_Show, true )				--�q�X
						AddToPartition( feather , Room )
						BeginPlot( feather , "sasa_123481_Feather" , 0 )
						Setplot( feather , "touch" , "sasa_123481_AI" , 30 )
						WriteRoleValue( feather , EM_RoleValue_register1 , BOSS )	--����BOSS
						--WriteRoleValue( feather , EM_RoleValue_Livetime , 8 )		--�s�b���
					end
					WindCounter = 0
--�� �j�a�ٰʲ����I ��--
				elseif ECounter >= 5 then
					for a = 1 , 5 do
						local Eball = CreateObjByFlag( 108344 , 781380 , Earth()+3 , 1 )--�qflag4�}�l�ت���A����RAND���]�tflag0�A�ҥH+3 �O�n���Lflag1~3
						SetModeEx( Eball , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
						SetModeEx( Eball , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
						SetModeEx( Eball , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
						SetModeEx( Eball , EM_SetModeType_Searchenemy , false )   	--����
						SetModeEx( Eball , EM_SetModeType_Mark , false )			--�аO
						SetModeEx( Eball , EM_SetModeType_Fight , false ) 			--���
						SetModeEx( Eball , EM_SetModeType_Move , false )			--����
						SetModeEx( Eball , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( Eball , EM_SetModeType_Strikback , false )		--����
						SetModeEx( Eball , EM_SetModeType_Show , true )				--�q�X
						AddToPartition( Eball , Room )
						WriteRoleValue( Eball , EM_RoleValue_Livetime, 6 )			--�s�b���
						AddBuff( Eball , 625435 , 0 , -1 )							--�k�},�k�N
						SetPlot( Eball , "collision" , "sasa_108344_fight" , 75 )	--�I���@��
					end
					ECounter = 0
				end
--�� �g�z ��--
				if ( BerserkCounter >= 480 and class == 1 ) 
				 or ( BerserkCounter >= 360 and class == 2 ) then		--8 min. and 6 min.
					ScriptMessage( BOSS , -1 , 2 , "[SC_108481_04]" , 1 )
					--���[���Ԫ�[108481]�V�ӶV���@�СA�L�n�ǳƤF���o���԰��F�I
					if IsBerserk == 0 then
						AddBuff( BOSS , 625099 , 0 , -1 )
						--Say( BOSS , "Time ="..BerserkCounter )
						IsBerserk = 1
					end
					BerserkCounter = 0
				end
			end
		else
--�� ���m���` ��--
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				if BossIsDead ~= 1 then
					ScriptMessage( BOSS , -1 , 2 , "[SC_108481_02]" , 1 )
					--[108481]���r�a�O�A�L�k�۬[�K
					if CheckID(BOSS) == true then
						DelObj(BOSS)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--�M��BUFF
					Sleep(20)
					BOSS = CreateObjByFlag( BossNum[class] , 781380 , 1 , 1 )
					AddToPartition( BOSS , Room )
					BeginPlot( BOSS , "sasa_108481_AI" , 0 )
					Setplot( BOSS , "dead" , "sasa_108481_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( BOSS , EM_RoleValue_register1 , Count )
					WriteRoleValue( BOSS , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( BOSS , EM_RoleValue_register10 , Exit )
				elseif BossIsDead == 1 then
				--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--�M��BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				WindCounter = 0
				ECounter = 0
			end
		end
	end
end

--�� �j�a�ٰʶˮ` ��--
function sasa_108344_fight()
	SysCastSpellLV( TargetID() , TargetID() , 851632 , 0 )
	sleep(5)
end

--�� �I�ѪŤ��� ��--
function sasa_123481_AI()
	--WriteRoleValue ( TargetID() , EM_RoleValue_Register2 , OwnerID() )
	--BeginPlot( TargetID() , "sasa_123481_AI2" , 0)
	CallPlot( TargetID() , "sasa_123481_AI2" , OwnerID() );
end

--�� �R�ѪŤ��� ��--
function sasa_123481_AI2( GetPlayer )
	Setplot( OwnerID() , "touch" , "" , 0 )
	GetPlayer = GetPlayer ;--or ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local Buff = 625430			--�r�ʸ���
	local _toxicKill = CheckBuff( GetPlayer , 625432 );
	DebugMsg( 0 , 0 , " _toxicKill : "..tostring( _toxicKill ) );
	if _toxicKill == true then		--�ƨg���
		SysCastSpellLv( OwnerID(), GetPlayer , 852152 , 0 )		-----���F���ƨg��Ъ����a
		KillID( OwnerID(), GetPlayer );
		sleep(5)
		delobj ( OwnerID() )
	else
		if ReadRoleValue( GetPlayer , EM_RoleValue_IsDead ) == 0 then
			AddBuff( GetPlayer , Buff , 0 , 10 )	--10 SEC.
		end
		Sleep(5)
		delobj ( OwnerID() )
	end
end

--�� �ѪŤ���AI ��--
function sasa_123481_Feather()
	local Musho = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local BBuff = 625429		--���ĦФJ
	local BuffCounter = 0
	while 1 do
		Sleep(10)
		BuffCounter = BuffCounter + 1
		if BuffCounter >= 7 then
			if ReadRoleValue( Musho , EM_RoleValue_IsDead ) == 0  then		--�ƨg���
				AddBuff( Musho , BBuff , 0 , -1 )
			end
			BuffCounter = 0
			delobj ( OwnerID() )
		end
		sleep(5)
	end
end

--�� ���F ��--
function sasa_108481_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--���`���X�{�ԼT��
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_108481_03]" , 1 )
	--�@�}�q�s�С�[108481]�ﰪ���ߩ��@�ǭˤU�K
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--Ū�X���GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--�i�D�p�ɾ�Boss���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--�� AI ��--
function sasa_108481_AI()
	local Owner = OwnerID()
	--AddBuff( Owner , 509476 , 0 , -1 )		------����Boss���}�԰��^�媺buff
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = ReadRoleValue( Owner , EM_RoleValue_register1 )
	--local ModeMode = 0		--�P�_�Ҧ�
	local RandCounter = 0		--Rand 2 Skills
	local Luck
	local BossTarget
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( Owner , EM_RoleValue_AttackTargetID )	--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( Owner ) ) == true then
			RandCounter = RandCounter + 1
			if RandCounter >= 7 then
				sasa_108481_Skill()
				RandCounter = 0
			end
		end
	end
end

--�� Rand Skill ��--

function sasa_108481_Skill()
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local class
	if ZoneID == 163 or ZoneID == 940 then		--�x��--���հ�
		class = 1
	elseif ZoneID == 164 then	--���q
		class = 2
	elseif ZoneID == 165 then	--²��
		class = 3
	end
	local Skill = { 851356 , 851357 }		--�w�ߤb�B�U�E���r
	local SkillLv = { 0 , 0 }
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--���X����������a
	local BossTarget 											--�sBOSS�n�����ؼ�
	local SkillIndex 											--��TABLE������m
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		BossTarget = OwnerID()
		CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end