--/GM ? Zone 136 0 762.6 1000.7 1756.1

--780856--Flag1�Glia(�H��)
--780856--Flag2�GAna(�])
--780856--Flag3�GDOOR�G/GM ? zone 136 0 761 1009.3 1806.5 270.6
--780856--Flag4�G�z���yA+��+������--�]�k��(���K)�¦�
--780856--Flag5�G�z���yB+��+�Ԫk�w--���z��(�]�K)����
--780856--Flag6�G�z���yB+��D�Ѫ�
--780856--Flag7-26�G�H���k�}
--780856--Flag27-29�G���� x 3
--780856--Flag30�G������I
--780858--FF1~7�G�H�θ��|

--EM_RoleValue_register1--���
--EM_RoleValue_register1--����Ĥ@=howfar
--EM_RoleValue_register2--lia(�H��)
--EM_RoleValue_register2--Ana(�])�ĤG=����1
--EM_RoleValue_register3--Ana(�])
--EM_RoleValue_register3--Ana(�])�ĤT=����2
--EM_RoleValue_register4--Herf
--EM_RoleValue_register5--Rafad
--EM_RoleValue_register6--��D�Ѫ�
--EM_RoleValue_register7--Ana��
--EM_RoleValue_register7--Ana(�])�ĤC=����3
--EM_RoleValue_register8 , 1--Herf��
--EM_RoleValue_register8 , 2--Rafad��
--EM_RoleValue_register8 , 3--�Ⱖ����
--EM_RoleValue_register8--�ۼv�ĤK=BOSS
--EM_RoleValue_register9--Entrance
--EM_RoleValue_register10--�Ҧ�

--�� ��� ��--
function lua_sasa_104582_3_Counter()
	local Mode = 0												-----�P�_�Ҧ���
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local BerserkCounter = 0									-------�g�ɭp��
	local IsBerserk = 0											-------�g�ɶ}��
	local BearCounter = 0										-------�p���p��
	local BigCounter = 0										-------�j���p��
	local Ana = 0
	local Herf = 0
	local Rafad = 0
	local Father = 0
	local Entrance = 0
	local BallH = 0
	local howfar
	local EnterFight = 0
	local Mode2Buff = 507752									--���`�ާ@�A��P�ˮ`����,�w�]5000�U
	local lia = CreateObjByFlag( 104583 , 780856 , 1 , 1 )		-----�H��
	SetModeEx( lia , EM_SetModeType_Strikback , false )			-----������
	SetModeEx( lia , EM_SetModeType_Fight , false )				-----���i���
	SetModeEx( lia , EM_SetModeType_Move , true )				-----����
	SetModeEx( lia , EM_SetModeType_Mark , false )				-----���i�I��
	SetModeEx( lia , EM_SetModeType_NotShowHPMP , false )		-----��show���
	AddToPartition( lia , Room )
	SetIdleMotion( lia , ruFUSION_MIME_WALK_FORWARD )
	BeginPlot( lia , "sasa_104583_walk" , 0 )
	--Say( lia , "1" )
	WriteRoleValue( OwnerID() , EM_RoleValue_register2 , lia )	
	WriteRoleValue( lia , EM_RoleValue_register1 , OwnerID() )
	local BearHere = 0											--�����}��
	local FatherHere = 0										--�Ѫ��}��
	local FatherDie = 0											--�Ѫ����F�}��
	local Baby1 = {}														--�ͤp�����ܼ�
	local Baby2 = {}														--�ͤp�����ܼ�
	local BigBear1 = 0												--����1
	local BigBear2 = 0												--����2
	local BigBear3 = 0												--����3
	while 1 do
		sleep(10)
		Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
		howfar = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
		BallH = ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
		if Ana ~= 0 then
			local AnaTarget = ReadRoleValue( Ana , EM_RoleValue_AttackTargetID )
			local MaxHP = ReadRoleValue( Ana , EM_RoleValue_MaxHP )					--�`��q
			local NowHP = ReadRoleValue( Ana , EM_RoleValue_HP )					--��e��q
			local HPPercent = ( NowHP / MaxHP )*100									--��q�ʤ���
			if  ( AnaTarget ~= 0 ) and ( CheckID( Ana ) ) == true and howfar < 450 then
				BerserkCounter = BerserkCounter + 1
				BearCounter = BearCounter + 1
				if EnterFight == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104582_01]" , "0xff6fb7ff" )
					--�����ڥH�]�ƪ�����Ӫﱵ�K�A�̸Ӭ����P��a���I
					sleep(10)
					Mode = 1
					WriteRoleValue( Ana , EM_RoleValue_register10 , 1 )			--1=Mode1
--�� ���P���� ��--
					Entrance = CreateObjByFlag( 104538 , 780856 , 3 , 1 )		-----���ת�(�J�f)
					SetModeEx( Entrance , EM_SetModeType_Move , false )			------������
					SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------������
					SetModeEx( Entrance , EM_SetModeType_Fight , false )		------���i���
					SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------������
					SetModeEx( Entrance , EM_SetModeType_Mark , false )			------���i�I��
					SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------��show���
					SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------����
					AddToPartition( Entrance , Room )
					WriteRoleValue( Ana , EM_RoleValue_register9 , Entrance )
					
					BigBear1 = CreateObjByFlag( 105497 , 780856 , 29 , 1 )
					AddToPartition( BigBear1 , Room )
					WriteRoleValue( Ana , EM_RoleValue_register2 , BigBear1 )
					
					BigBear2 = CreateObjByFlag( 105498 , 780856 , 28 , 1 )
					AddToPartition( BigBear2 , Room )
					WriteRoleValue( Ana , EM_RoleValue_register3 , BigBear2 )
					
					BigBear3 = CreateObjByFlag( 105498 , 780856 , 27 , 1 )
					AddToPartition( BigBear3 , Room )
					WriteRoleValue( Ana , EM_RoleValue_register7 , BigBear3 )
--�� ����ǶǼ� ��--
					local PPL = SetSearchAllPlayer( Room )
					local Num = 30
					local Num_flag = 780856			--�쪱�a���I
					for h = 1 , PPL do
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1
						 and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0
						 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
							SetPosByFlag( ID , Num_flag , Num ) 		--�쪱�a��P�@���I
							Num = Num + 1
							if Num > GetMoveFlagCount(Num_flag) -1 then
								Num = 30
							end
							sysCastSpelllv ( ID , Ana , 496773 , 0 )		--���a������
						end
					end
					EnterFight = 1
				end
--�� �p�� ��--
				if EnterFight == 1 then
					if BearCounter >= 15 then
						for m = 1 , 2 do
							local flagNum1 = Rand(20)+7
							local flagNum2 = Rand(20)+7
							local BallD = CreateObjByFlag( 105346 , 780856 , flagNum1 , 1 )
							SetModeEx( BallD , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
							SetModeEx( BallD , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
							SetModeEx( BallD , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
							SetModeEx( BallD , EM_SetModeType_Searchenemy , false )   	--����
							SetModeEx( BallD , EM_SetModeType_Mark , false )			--�аO
							SetModeEx( BallD , EM_SetModeType_Fight , false ) 			--���
							SetModeEx( BallD , EM_SetModeType_Move , false )			--����
							SetModeEx( BallD , EM_SetModeType_ShowRoleHead , true )
							SetModeEx( BallD , EM_SetModeType_Strikback , false )		--����
							SetModeEx( BallD , EM_SetModeType_Show , true )				--�q�X
							AddToPartition( BallD , Room )
							WriteRoleValue( BallD , EM_RoleValue_Livetime, 5 )			--�s�b���
							AddBuff( BallD , 507751 , 0 , -1 )							--�k�},�k�N
							
							local BabyBear = CreateObjByFlag( 104585 , 780856 , flagNum1 , 1 )
							Baby1[table.getn( Baby1 )+1] = BabyBear
							AddToPartition( BabyBear , Room )
							BeginPlot( BabyBear , "sasa_104585_killID" , 0 )
							Setplot( BabyBear , "dead" , "sasa_104585_BombBear1" , 30 )
							--AddBuff( BabyBear , 509043 , 0 , 6 )						--�˼ƭp��
							AddBuff( BabyBear , 505653 , 0 , -1 )						--���^��

							local BallE = CreateObjByFlag( 105346 , 780856 , flagNum2 , 1 )
							SetModeEx( BallE , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
							SetModeEx( BallE , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
							SetModeEx( BallE , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
							SetModeEx( BallE , EM_SetModeType_Searchenemy , false )   	--����
							SetModeEx( BallE , EM_SetModeType_Mark , false )			--�аO
							SetModeEx( BallE , EM_SetModeType_Fight , false ) 			--���
							SetModeEx( BallE , EM_SetModeType_Move , false )			--����
							SetModeEx( BallE , EM_SetModeType_ShowRoleHead , true )
							SetModeEx( BallE , EM_SetModeType_Strikback , false )		--����
							SetModeEx( BallE , EM_SetModeType_Show , true )				--�q�X
							AddToPartition( BallE , Room )
							WriteRoleValue( BallE , EM_RoleValue_Livetime, 5 )			--�s�b���
							AddBuff( BallE , 507750 , 0 , -1 )							--�k�},�k�N
							
							local BabyBear2 = CreateObjByFlag( 104586 , 780856 , flagNum2 , 1 )
							Baby2[table.getn( Baby2 )+1] = BabyBear2
							AddToPartition( BabyBear2 , Room )
							BeginPlot( BabyBear2 , "sasa_104585_killID" , 0 )
							Setplot( BabyBear2 , "dead" , "sasa_104586_BombBear2" , 30 )
							--AddBuff( BabyBear2 , 509145 , 0 , 6 )						--�˼ƭp��
							AddBuff( BabyBear2 , 505653 , 0 , -1 )						--���^��
						end
						BearCounter = 0
					end
--�� �g�� ��--
					if BerserkCounter >= 1200 then
						if IsBerserk == 0 then
							AddBuff( Ana , 507744 , 0 , -1 ) 			--���w�ߨ�
							--Say(Ana , "Time ="..BerserkCounter)
							ScriptMessage( Ana , -1 , 2 , "[SC_104582_02]" , "0xff6fb7ff" )
							--�u�L��K�o���x�@�ӵ����F�I�A�̹�b�z���O�ڥ���I
							IsBerserk = 1
						end	
						BerserkCounter = 0
					end
				end
--�� �Ҧ��@ ��--
				if Mode == 1 then
					if HPPercent <= 90 and ReadRoleValue( OwnerID() , EM_RoleValue_register7 ) ~= 1 then
						SetModeEx( Ana , EM_SetModeType_Move, false )				--������
						SetModeEx( Ana , EM_SetModeType_Fight , false ) 			--�����
						SetModeEx( Ana , EM_SetModeType_Strikback , false )			--����
						AdjustFaceDir( Ana , AnaTarget , 0 )				--( who , ���V�� , ���� )
						Sleep(20)
						AddBuff( Ana, Mode2Buff , 0 , -1 )					--���`�ާ@�A��P�ˮ`����,�w�]5000�U
						CastSpellLv( Ana , Ana , 497214 , 0 )				--���`�ާ@�A�w�]1800��
						Sleep(30)
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_03]" , "0xff6fb7ff" )
						--�O��K�����o��ӫĤl���A�̪����a�K
						Mode = 2
						WriteRoleValue( Ana , EM_RoleValue_register10 , 2 )	--2=Mode2
						sleep(10)
					end
--�� �Ҧ��G ��--
				elseif Mode == 2 then
					local Mode2Counter = 0
					if BearHere == 0 then
--�� �ͺ��e���y ��--	
						local BallA = CreateObjByFlag( 105346 , 780856 , 4 , 1 )
						SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
						SetModeEx( BallA , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
						SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
						SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--����
						SetModeEx( BallA , EM_SetModeType_Mark , false )			--�аO
						SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--���
						SetModeEx( BallA , EM_SetModeType_Move , false )			--����
						SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( BallA , EM_SetModeType_Strikback , false )		--����
						SetModeEx( BallA , EM_SetModeType_Show , true )				--�q�X
						AddToPartition( BallA , Room )
						WriteRoleValue( BallA , EM_RoleValue_Livetime, 5 )			--�s�b���
						AddBuff( BallA , 507750 , 0 , -1 )							--�k�},�k�N
						
						local BallB = CreateObjByFlag( 105346 , 780856 , 5 , 1 )
						SetModeEx( BallB , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
						SetModeEx( BallB , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
						SetModeEx( BallB , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
						SetModeEx( BallB , EM_SetModeType_Searchenemy , false )   	--����
						SetModeEx( BallB , EM_SetModeType_Mark , false )			--�аO
						SetModeEx( BallB , EM_SetModeType_Fight , false ) 			--���
						SetModeEx( BallB , EM_SetModeType_Move , false )			--����
						SetModeEx( BallB , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( BallB , EM_SetModeType_Strikback , false )		--����
						SetModeEx( BallB , EM_SetModeType_Show , true )				--�q�X
						AddToPartition( BallB , Room )
						WriteRoleValue( BallB , EM_RoleValue_Livetime, 5 )			--�s�b���
						AddBuff( BallB , 507751 , 0 , -1 )							--�k�},���z
--�� ���X�S�`�N ��--
						Herf = CreateObjByFlag( 104587 , 780856 , 4 , 1 )
						SetModeEx( Herf , EM_SetModeType_Move , false )					--������
						AddToPartition( Herf , Room )
						SetDefIdleMotion( Herf , ruFUSION_ACTORSTATE_KNOCKDOWN_END )	--����
						AddBuff( Herf , 507755 , 0 , -1 )								--�j�ƤO�q����
						BeginPlot( Herf , "sasa_104587_Herf" , 0 )
						Setplot( Herf , "dead" , "sasa_104587_HerfDead" , 30 )
						WriteRoleValue( Herf , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( Herf , EM_RoleValue_register3 , Ana )
						Rafad = CreateObjByFlag( 104588 , 780856 , 5 , 1 )
						SetModeEx( Rafad , EM_SetModeType_Move , false )				--������						
						AddToPartition( Rafad , Room )
						SetDefIdleMotion( Rafad , ruFUSION_ACTORSTATE_KNOCKDOWN_END )	--����
						AddBuff( Rafad , 507756 , 0 , -1 )								--�j�Ư�q����
						BeginPlot( Rafad , "sasa_104588_Rafad" , 0 )
						Setplot( Rafad , "dead" , "sasa_104588_RafadDead" , 30 )
						WriteRoleValue( Rafad , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( Rafad , EM_RoleValue_register3 , Ana )
						SetDefIdleMotion( Herf , ruFUSION_MIME_IDLE_STAND )
						SetDefIdleMotion( Rafad , ruFUSION_MIME_IDLE_STAND )
						SetModeEx( Herf , EM_SetModeType_Move , true )
						SetModeEx( Rafad , EM_SetModeType_Move , true )
						BearHere = 1
					end
					
--�� �@�����ɤ� ��--
					if ReadRoleValue( Ana , EM_RoleValue_register8 ) == 1
					 or ReadRoleValue( Ana , EM_RoleValue_register8 ) == 2 then
						BigCounter = BigCounter + 1
					end
					if BigCounter >= 5 and ReadRoleValue( Ana , EM_RoleValue_register8 ) == 1 then
						BigCounter = 0
						Herf = ReadRoleValue( Ana , EM_RoleValue_register4 )
						local HerfBear = star_CreateObj( Herf , 104587 , 0 , 0 , 0 , Room , 0)
						DelObj(Herf)
						Herf = HerfBear
						AddBuff( Herf , 507755 , 0 , -1 )							--�j�ƤO�q����
						BeginPlot( Herf , "sasa_104587_Herf" , 0 )
						Setplot( Herf , "dead" , "sasa_104587_HerfDead" , 30 )
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )
						WriteRoleValue( Herf , EM_RoleValue_register3 , Ana )
					elseif BigCounter >= 5 and ReadRoleValue( Ana , EM_RoleValue_register8 ) == 2 then
						BigCounter = 0
						Rafad = ReadRoleValue( Ana , EM_RoleValue_register5 )
						local RafadBear = star_CreateObj( Rafad , 104588 , 0 , 0 , 0 , Room , 0)
						DelObj(Rafad)
						Rafad = RafadBear
						AddBuff( Rafad , 507756 , 0 , -1 )							--�j�Ư�q����
						BeginPlot( Rafad , "sasa_104588_Rafad" , 0 )
						Setplot( Rafad , "dead" , "sasa_104588_RafadDead" , 30 )
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )
						WriteRoleValue( Rafad , EM_RoleValue_register3 , Ana )
--�� �Ⱖ���ɤ� ��--
					elseif ReadRoleValue( Ana , EM_RoleValue_register8 ) == 3
					 and ( CheckID( Ana ) == true) and ( ReadRoleValue( Ana , EM_RoleValue_IsDead ) == 0 )then
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_04]" , "0xff6fb7ff" )
						--���i��I�L�̥i�O�ں�߻s�����׭^�ڡI
						Sleep(30)
						Herf = ReadRoleValue( Ana , EM_RoleValue_register4 )
						Rafad = ReadRoleValue( Ana , EM_RoleValue_register5 )
						sleep(20)
						DelObj(Herf)
						DelObj(Rafad)
						sleep(20)
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_05]" , "0xff6fb7ff" )
						--��K�ڡK�ڪ��O�q�K�I��K�O�ӦۥH���O�F�I
						Sleep(20)
						AddRoleValue( Ana , EM_RoleValue_HP , -MaxHP*0.3 )		--��30%
						Sleep(10)
						CancelBuff( Ana , Mode2Buff )
						MagicInterrupt( Ana )
						SetModeEx( Ana , EM_SetModeType_Move, true )			--��_����
						SetModeEx( Ana , EM_SetModeType_Fight , true ) 			--��_���
						SetModeEx( Ana , EM_SetModeType_Strikback , true )		--��_����
						Mode = 3
						WriteRoleValue( Ana , EM_RoleValue_register10 , 3 )		--3=Mode3
						sleep(10)	
					end
--�� �Ҧ��T ��--
				elseif Mode == 3 then
					if FatherHere == 0 then
--�� �Ѫ��X���y ��--	
						ScriptMessage( Ana , -1 , 2 , "[SC_104582_06]" , "0xff6fb7ff" )
						--�J�M�o�ˡA���N�A��u�L�v�h���¤@�U�a�I
						local BallC = CreateObjByFlag( 105346 , 780856 , 6 , 1 )
						SetModeEx( BallC , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
						SetModeEx( BallC , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
						SetModeEx( BallC , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
						SetModeEx( BallC , EM_SetModeType_Searchenemy , false )   	--����
						SetModeEx( BallC , EM_SetModeType_Mark , false )			--�аO
						SetModeEx( BallC , EM_SetModeType_Fight , false ) 			--���
						SetModeEx( BallC , EM_SetModeType_Move , false )			--����
						SetModeEx( BallC , EM_SetModeType_ShowRoleHead , true )
						SetModeEx( BallC , EM_SetModeType_Strikback , false )		--����
						SetModeEx( BallC , EM_SetModeType_Show , true )				--�q�X
						AddToPartition( BallC , Room )
						WriteRoleValue( BallC , EM_RoleValue_Livetime, 5 )			--�s�b���
						AddBuff( BallC , 509042 , 0 , -1 )							--�k�},�k�N
--�� �Ѫ��ӧU�} ��--
						Father = CreateObjByFlag( 104670 , 780856 , 6 , 1 )
						AddToPartition( Father , Room )
						Sleep(10)
						CastSpellLv( Father , Ana , 497188 , 0 )					--���R����
						Sleep(20)
						BeginPlot( Father , "sasa_104670_Father" , 0 )
						Setplot( Father , "dead" , "sasa_104670_FatherDead" , 30 )
						WriteRoleValue( Father , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( Father , EM_RoleValue_register3 , Ana )
						WriteRoleValue( Ana , EM_RoleValue_register6 , Father )
						FatherHere = 1
					end
--�� �Ѫ��ɤ� ��--
					if ReadRoleValue( Ana , EM_RoleValue_register6 ) == 4
					 and ( CheckID( Ana ) == true) and ( ReadRoleValue( Ana , EM_RoleValue_IsDead ) == 0 ) then
						if FatherDie == 0 then
							ScriptMessage( Ana , -1 , 2 , "[SC_104582_07]" , "0xff6fb7ff" )
							--�A�̦��G�d���M���S��F�֡K�K���a�F�ڪ�����O�n�I�X�N�����I
							Sleep(20)
							CancelBuff( Ana , 509036 )					--���R����
							FatherDie = 1
						end
					end
				end
			else
				if EnterFight == 1 then
					local AnaIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
					if AnaIsDead ~= 1 then
						if Ana ~= nil then
							DelObj(Ana)
							DelObj(BallH)
						end
						if Entrance ~= nil then
							DelObj(Entrance)
						end
						if BigBear1 ~= nil then
							DelObj(BigBear1)
						end
						if BigBear2 ~= nil then
							DelObj(BigBear2)
						end
						if BigBear3 ~= nil then
							DelObj(BigBear3)
						end
						if Herf ~= nil then
							DelObj(Herf)
						end
						if Rafad ~= nil then
							DelObj(Rafad)
						end
						if Father ~= nil then
							DelObj(Father)
						end
						for p = 1 , table.getn(Baby1) do
							if CheckID(Baby1[p]) == true and Baby1[p] ~= nil then
								DelObj( Baby1[p] )
							end
						end
						for q = 1 , table.getn(Baby2) do
							if CheckID(Baby2[q]) == true and Baby2[q] ~= nil then
								DelObj( Baby2[q] )
							end
						end
						BeginPlot( OwnerID() , "sasa_104582_CancelBuff" , 0 )		--�M��BUFF
						sleep(50)
						Ana = CreateObjByFlag( 104582 , 780856 , 2 , 1 )
						BallH = CreateObjByFlag( 105346 , 780856 , 2 , 1 )
						SetModeEx( BallH , EM_SetModeType_HideName, true )			--�W��
						SetModeEx( BallH , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
						SetModeEx( BallH , EM_SetModeType_Mark, false )				--�аO
						SetModeEx( BallH , EM_SetModeType_Move , false )				--������
						SetModeEx( BallH , EM_SetModeType_Searchenemy , false )		--������
						SetModeEx( BallH , EM_SetModeType_Fight , false )			--�i�������
						SetModeEx( BallH , EM_SetModeType_Strikback, false )			--����
						SetModeEx( BallH , EM_SetModeType_NotShowHPMP , false )		--��show���
						AddToPartition( Ana , Room )
						AddToPartition( BallH , Room )
						BeginPlot( Ana , "sasa_104582_AI" , 0 )
						Setplot( Ana , "dead" , "sasa_104582_Dead" , 30 )
						BeginPlot( BallH , "sasa_104582_check" , 0 )
						WriteRoleValue( Ana , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_register3 , Ana )
						WriteRoleValue( BallH , EM_RoleValue_register1 , OwnerID() )
						WriteRoleValue( BallH , EM_RoleValue_register3 , Ana )
						WriteRoleValue( OwnerID() , EM_RoleValue_register4 , BallH )
						BearHere = 0
						FatherHere = 0
						FatherDie = 0
						Baby1 = {}													--�p�����m�k�s
						Baby2 = {}
						WriteRoleValue( Ana , EM_RoleValue_register8 , 0 )			--�j�����q���m�k�s
					elseif AnaIsDead == 1 then										---Boss���F������
						DelObj(BallH)
						BeginPlot( OwnerID() , "sasa_104582_CancelBuff" , 0 )		--�M��BUFF
						Sleep(50)
						return
					end
					EnterFight = 0
					BerserkCounter = 0
					IsBerserk = 0
					BearCounter = 0
				end
			end		
		end
	end
end

--�� �H��AI ��--
function sasa_104583_walk()
	while 1 do
		sleep(10)
		local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
		local MoveFlag = { 1 , 2 , 3 , 4 , 5 , 6 , 1 , 7 }
		for i=1 , 8 do
			local liaTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( liaTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				--Say( OwnerID() , "2" )
				if ReadRoleValue( liaTarget , EM_RoleValue_VOC ) ~= 0  
				 and CheckRelation( OwnerID() , liaTarget , EM_CheckRelationType_Attackable ) == true then
					--Say( OwnerID() , "3" )
					--StopMove( OwnerID() , false )
					SetFlag( OwnerID() , 544800 , 1 )
					--if CheckFlag( OwnerID() , 544800) == true then
						--Say(OwnerID() , "OK")
					--else
						--Say(OwnerID() , "No")
					--end
					SetModeEx( OwnerID() , EM_SetModeType_Move , false )		--������
					AdjustFaceDir( OwnerID() , liaTarget , 0 )		--( who , ���V�� , ���� )
					--Say( OwnerID() , "speak" )
					Sleep(5)
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104583_01]" , 1 )
					--�ڥ��Ӭ��A�̨Ө�o�̪��i�𹪴x�A����ܫݷ|�A�̪���{���|���ڥ���C
					Sleep(40)
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104583_02]" , 1 )
					--�i���A���_�F�ڪ���ҥi�O�j�ҩO�K�K
					Sleep(30)
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104583_03]" , 1 )
					--�`�ȶܡH�H�H�K�O��ߡA������ڷ|�n�n���s�A�̪��I
					Sleep(40)
					CastSpellLv( OwnerID() , OwnerID() , 496254 , 0 )				--�E��
					--Say( OwnerID() , "4" )
					Sleep(40)
					Ana = star_CreateObj_NoAdd( OwnerID() , 104582 , 0 , 0 , 0 , Room , 0)
					BallH = CreateObjByFlag( 105346 , 780856 , 2 , 1 )			--���Z��
					SetModeEx( BallH , EM_SetModeType_HideName, true )			--�W��
					SetModeEx( BallH , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
					SetModeEx( BallH , EM_SetModeType_Mark, false )				--�аO
					SetModeEx( BallH , EM_SetModeType_Move , false )				--������
					SetModeEx( BallH , EM_SetModeType_Searchenemy , false )		--������
					SetModeEx( BallH , EM_SetModeType_Fight , false )			--�i�������
					SetModeEx( BallH , EM_SetModeType_Strikback, false )			--����
					SetModeEx( BallH , EM_SetModeType_NotShowHPMP , false )		--��show���
					AddToPartition( Ana , Room )
					AddToPartition( BallH , Room )
					BeginPlot( Ana , "sasa_104582_AI" , 0 )
					Setplot( Ana , "dead" , "sasa_104582_Dead" , 30 )
					BeginPlot( BallH , "sasa_104582_check" , 0 )
					WriteRoleValue( Counter , EM_RoleValue_register3 , Ana )
					WriteRoleValue( Ana , EM_RoleValue_register1 , Counter )
					WriteRoleValue( BallH , EM_RoleValue_register1 , Counter )
					WriteRoleValue( BallH , EM_RoleValue_register3 , Ana )
					WriteRoleValue( Counter , EM_RoleValue_register4 , BallH )
					--Say( OwnerID() , "5" )
					DelObj(OwnerID())
					Sleep(30)
					return
				else
					ScriptMessage( OwnerID() , -1 , 1 , "Hi GM, plz back!" , 1 )
				end
			else				
				--Say( OwnerID() , "walk" )
				MoveToFlagEnabled ( OwnerID() ,  false )
				--LuaFunc_MoveToFlag( OwnerID() , 780858 , MoveFlag[i] , 10 )			--( who , flag , No. , Range )
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		--������
				DW_MoveToFlag( OwnerID() , 780858 , MoveFlag[i] , 10 )			--( who , flag , No. , Range )
				Sleep(20)
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )		--����
				sleep(10)
			end
		end	
	end
end

--�� �]��AI ��--
function sasa_104582_AI()
	AddBuff( OwnerID() , 505653 , 0 , -1 )	------����Boss���}�԰��^�媺buff
	sleep(10)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local mode = 0							-------�P�_�Ҧ���
	local RandCounter = 0					--7S.RAND 3 ��
	local Rand2Counter = 0					--7S.RAND 2 ��
	local AECounter = 0						--���F
	local SkullCounter = 0					--�z������
	local FearCounter = 0					--����
	local AE = 496258						--���F
	local Skull = 497213					--�z������
	local Fear = 496262						--����
	local BossTarget

	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			mode = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
--�� �Ҧ��@ ��--
			if mode == 1 then
				RandCounter = RandCounter + 1
				if RandCounter >= 7 then
					sasa_104582_AnaSkill()
					RandCounter = 0
				end
--�� �Ҧ��G ��--
			elseif mode == 2 then
				AECounter = AECounter + 1
				if AECounter >= 10 then
					BossTarget = OwnerID()
					SysCastSpellLv( OwnerID() , BossTarget , AE , 19 )
					AECounter = 0
				end
--�� �Ҧ��T ��--
			elseif mode == 3 then
				Rand2Counter = Rand2Counter + 1
				FearCounter = FearCounter + 1
				SkullCounter = SkullCounter + 1
				if FearCounter >= 20 then
					local LuckyBear = {}
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort(OwnerID())
					for z=1 , table.getn(PlayerInHate1) do
						local temp01 = PlayerInHate1[z]			 
						if ReadRoleValue( temp01 , EM_RoleValue_Voc ) ~= 0 				--GM�ư�
						 and ReadRoleValue( temp01 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
							if ( temp01 ~= PlayerInHate1[1] )  
							 and ( CheckBuff( temp01 , 509007 ) == false ) 
							 and ( CheckBuff( temp01 , 509003 ) == false ) 
							 and ( CheckBuff( temp01 , 509475 ) == false ) then
								LuckyBear[table.getn(LuckyBear)+1] = temp01 			--��쪺���a��iTABLE
							end	
						end
					end
					--Say( OwnerID() , "Got Bear, "..table.getn(LuckyBear) )
					--if table.getn(LuckyBear) >= 2 then							------�j��2�H�Nrand 2��
						for y=1 , 1 do
							local Luckynum = Rand(table.getn(LuckyBear))+1		--RAND�쪺�Ʀr	
							if ( LuckyBear[Luckynum] ~= nil ) and ( ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
								BossTarget = LuckyBear[Luckynum]
								SysCastSpellLv( OwnerID() , BossTarget , Fear , 0 )
								if ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 1
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 2
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 3
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 6 then
									local Phy = star_CreateObj_NoAdd( LuckyBear[Luckynum] , 104589 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Phy , Room )
									BeginPlot( Phy , "sasa_104589_Phy" , 0 )
									Setplot( Phy , "dead" , "sasa_104589_PhyDead" , 30 )
									WriteRoleValue( Phy , EM_RoleValue_register7 , LuckyBear[Luckynum] )
									WriteRoleValue( Phy , EM_RoleValue_register8 , OwnerID() )		--�OBOSS ID
								elseif ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 4
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 5
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 7
								 or ReadRoleValue( LuckyBear[Luckynum] , EM_RoleValue_VOC ) == 8 then
									local Mag = star_CreateObj_NoAdd( LuckyBear[Luckynum] , 104584 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Mag , Room )
									BeginPlot( Mag , "sasa_104584_Mag" , 0 )
									Setplot( Mag , "dead" , "sasa_104584_MagDead" , 30 )
									WriteRoleValue( Mag , EM_RoleValue_register7 , LuckyBear[Luckynum] )
									WriteRoleValue( Mag , EM_RoleValue_register8 , OwnerID() )		--�OBOSS ID
								end
							end
							table.remove( LuckyBear , Luckynum )
							sleep(1)
							--Say( OwnerID() , "okok, "..table.getn(LuckyBear) )
						end
					--[[else													-------2�H�H�U�N����
						for x=1 , table.getn(LuckyBear) do
							if ( LuckyBear[x] ~= nil )
							 and ( ReadRoleValue( LuckyBear[x] , EM_RoleValue_IsDead ) == 0 ) then
								Say( OwnerID() , "ok, "..table.getn(LuckyBear) )
								BossTarget = LuckyBear[x]
								SysCastSpellLv( OwnerID() , LuckyBear[x] , Fear , 0 )
								if ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 1
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 2
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 3
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 6 then
									local Phy = star_CreateObj_NoAdd( LuckyBear[x] , 104589 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Phy , Room )
									BeginPlot( Phy , "sasa_104589_Phy" , 0 )
									Setplot( Phy , "dead" , "sasa_104589_PhyDead" , 30 )
									WriteRoleValue( Phy , EM_RoleValue_register7 , LuckyBear[x] )
									WriteRoleValue( Phy , EM_RoleValue_register8 , OwnerID() )		--�OBOSS ID
								elseif ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 4
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 5
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 7
								 or ReadRoleValue( LuckyBear[x] , EM_RoleValue_VOC ) == 8 then
									local Mag = star_CreateObj_NoAdd( LuckyBear[x] , 104584 , 0 , 0 , 0 , Room , 0 )
									AddToPartition( Mag , Room )
									BeginPlot( Mag , "sasa_104584_Mag" , 0 )
									Setplot( Mag , "dead" , "sasa_104584_MagDead" , 30 )
									WriteRoleValue( Mag , EM_RoleValue_register7 , LuckyBear[x] )
									WriteRoleValue( Mag , EM_RoleValue_register8 , OwnerID() )		--�OBOSS ID
								end
							end
							sleep(1)
						end
					--end]]
					FearCounter = 0
				end
--�� �Ѫ����h�@�� ��--
				if SkullCounter >= 10 then
					if ReadRoleValue( OwnerID() , EM_RoleValue_register6 ) == 4
					 and ( CheckID( OwnerID() ) == true) and ( ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 ) then
						local LuckySkull = {}
						local PlayerInHate5 = {}
						PlayerInHate5 = star_HateListSort(OwnerID())
						for r=1 , table.getn(PlayerInHate5) do
							local temp05 = PlayerInHate5[r]			 
							if ReadRoleValue( temp05 , EM_RoleValue_Voc ) ~= 0 				--GM�ư�
							 and ReadRoleValue( temp05 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
								LuckySkull[table.getn(LuckySkull)+1] = temp05 			--��쪺���a��iTABLE
							end
						end
						--Say( OwnerID() , "Skull, "..table.getn(LuckySkull) )
						if table.getn(LuckySkull) >= 1 then
							for s=1 , 1 do
								local Luckynum = Rand(table.getn(LuckySkull))+1		--RAND�쪺�Ʀr	
								if ( LuckySkull[Luckynum] ~= nil )
								 and ( ReadRoleValue( LuckySkull[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
									BossTarget = LuckySkull[Luckynum]
									CastSpellLv( OwnerID() , BossTarget , Skull , 0 )
									sleep(25)
								end
								sleep(1)
								--Say( OwnerID() , "only, "..table.getn(LuckySkull) )
							end
						end
					end
					SkullCounter = 0
				end
				if Rand2Counter >= 7 then
					sasa_104582_AnaSkill_2()
					Rand2Counter = 0
				end
			end			
		end
	end
end

--�� �¦�-������AI ��--
function sasa_104587_Herf()
	while 1 do
		sleep(10)
		local HerfCounter = 0
		local HerfSkill = { 497186 , 497187 }							--���c�^�k�B���P
		local HerfSkillLv = { 49 , 29 }
		local HerfTarget 												--�sBOSS�n�����ؼ�
		local SkillIndex 												--��TABLE������m
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				HerfCounter = HerfCounter + 1
				if HerfCounter >= 8 then
					local Luck = Rand(100)
					if (Luck >= 0 and Luck < 50) then										--�q0~ ���@�Ӽ�
						SkillIndex = 1
						HerfTarget = OwnerID()
					elseif (Luck >= 50 and Luck < 100) then
						SkillIndex = 2
						HerfTarget = OwnerID()
					end
					if 	( HerfTarget ~= nil) 
					 and ( ReadRoleValue( HerfTarget , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLV( OwnerID() , HerfTarget , HerfSkill[SkillIndex] , HerfSkillLv[SkillIndex] )
						Sleep(10)
					end
					HerfCounter = 0
				end
			end
		end
	end
end

--�� ����-�Ԫk�wAI ��--
function sasa_104588_Rafad()
	while 1 do
		sleep(10)
		local RafadCounter = 0
		local RafadSkill = { 497184 , 497185 }							--���c����B�ֶ�
		local RafadSkillLv = { 0 , 34 }
		local RafadTarget 												--�sBOSS�n�����ؼ�
		local SkillIndex 												--��TABLE������m
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				RafadCounter = RafadCounter + 1
				if RafadCounter >= 8 then
					local Luck = Rand(100)
					if (Luck >= 0 and Luck < 50) then										--�q0~ ���@�Ӽ�
						SkillIndex = 1
						RafadTarget = OwnerID()
					elseif (Luck >= 50 and Luck < 100) then
						SkillIndex = 2
						RafadTarget = OwnerID()
					end
					if 	( RafadTarget ~= nil) 
					 and ( ReadRoleValue( RafadTarget , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLV( OwnerID() , RafadTarget , RafadSkill[SkillIndex] , RafadSkillLv[SkillIndex] )
						Sleep(10)
					end
					RafadCounter = 0
				end
			end
		end
	end
end

--�� ��DAI ��--
function sasa_104670_Father()
	while 1 do
		sleep(10)
		local FireCounter = 0
		local SafeCounter = 0
		local FireSkill = { 497211 , 497212 }		--���K�Q�g , ����������
		local FireLv = { 31 , 1 }
		local Save = 496337							--�鸨�]������ , ATK-10%�^
		local DadTarget
		local SkillIndex
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				FireCounter = FireCounter + 1
				SafeCounter = SafeCounter + 1
				if SafeCounter>= 16 then
					DadTarget = OwnerID()
					CastSpellLV( OwnerID() , DadTarget , Save , 0 )
					sleep(10)
					SafeCounter = 0
				elseif FireCounter >= 7 then
					local LuckyBall = Rand(100)
					if (LuckyBall >= 0 and LuckyBall < 50) then
						--Say( OwnerID() , "ya~~" )
						SkillIndex = 1
						DadTarget = OwnerID()
						if ( DadTarget ~= nil ) and ( ReadRoleValue( DadTarget , EM_RoleValue_IsDead ) == 0 ) then
							CastSpellLv( OwnerID() , DadTarget , FireSkill[SkillIndex] , FireLv[SkillIndex] )
							Sleep(10)
						end
					elseif (LuckyBall >= 50 and LuckyBall < 100) then
						local PlayerInHate2 = {}
						PlayerInHate2 = star_HateListSort(OwnerID())
						local BallPlayer = {}
						--Say( OwnerID() , "yoyo~~" )
						SkillIndex = 2
						CastSpellLv( OwnerID() , OwnerID() , 496191 , 0 )					--��y�Űʧ@
						for w=1 , table.getn(PlayerInHate2) do
							local temp03 = PlayerInHate2[w]			 
							if ReadRoleValue(temp03 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
							 and ReadRoleValue(temp03 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
								BallPlayer[table.getn(BallPlayer)+1] = temp03 				--��쪺���a��iTABLE
							end
						end
						--Say( OwnerID() , "Before ="..table.getn(BallPlayer) )
						if table.getn(BallPlayer) >= 6 then							------�j��6�H�Nrand 6��
							for v=1 , 6 do
								local Lucky3 = Rand(table.getn(BallPlayer))+1						--RAND�쪺�Ʀr	
								if ( BallPlayer[Lucky3] ~= nil ) and ( ReadRoleValue( BallPlayer[Lucky3] , EM_RoleValue_IsDead ) == 0 ) then
									SysCastSpellLv( OwnerID() , BallPlayer[Lucky3] , FireSkill[SkillIndex] , FireLv[SkillIndex] )
								end
								table.remove( BallPlayer , Lucky3 )
								sleep(1)
								--Say( OwnerID() , "After ="..table.getn(BallPlayer) )
							end
						else													-------6�H�H�U�N����
							for u=1 , table.getn(BallPlayer) do
								if ( BallPlayer[u] ~= nil ) and ( ReadRoleValue( BallPlayer[u] , EM_RoleValue_IsDead ) == 0 ) then
									--Say( OwnerID() , "all ="..table.getn(BallPlayer) )
									SysCastSpellLv( OwnerID() , BallPlayer[u] , FireSkill[SkillIndex] , FireLv[SkillIndex] )
								end
								sleep(1)
							end
						end
					end
					FireCounter = 0
				end
			end
		end
	end
end

--�� ���z�� ��--
function sasa_104589_Phy()
	while 1 do
		sleep(10)
		local PhyCounter = 0
		local BuffCounter = 0
		local PhyTarget 												--�sBOSS�n�����ؼ�
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
		while 1 do
			sleep(10)
			if CheckID(Boss) == true then
				BuffCounter = BuffCounter + 1 
				if BuffCounter >= 5 then
					AddBuff( OwnerID() , 509008 , 0 , -1 )		--�¯�l��
					BuffCounter = 0
				end		
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
				if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
					PhyCounter = PhyCounter + 1								
					if PhyCounter >= 6 then
						PhyTarget = OwnerID()
						if 	( PhyTarget ~= nil) 
						 and ( ReadRoleValue( PhyTarget , EM_RoleValue_IsDead ) == 0 ) then
							CastSpellLV( OwnerID() , PhyTarget , 497185 , 34 )				--�ֶ�
							Sleep(10)
						end
						PhyCounter = 0
					end
				end
			else
				KillID( OwnerID() , OwnerID() )
			end	
		end
	end
end

--�� �k�N�� ��--
function sasa_104584_Mag()
	while 1 do
		sleep(10)
		local MagCounter = 0
		local BuffCounter = 0
		local MagTarget 												--�sBOSS�n�����ؼ�
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
		while 1 do
			sleep(10)
			if CheckID(Boss) == true then
				BuffCounter = BuffCounter + 1 
				if BuffCounter >= 5 then
					AddBuff( OwnerID() , 509008 , 0 , -1 )		--�¯�l��
					BuffCounter = 0
				end		
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
				if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
					MagCounter = MagCounter + 1
					if MagCounter >= 6 then
						MagTarget = OwnerID()
						if 	( MagTarget ~= nil) 
						 and ( ReadRoleValue( MagTarget , EM_RoleValue_IsDead ) == 0 ) then
							CastSpellLV( OwnerID() , MagTarget , 497187 , 29 )				--���P
							Sleep(10)
						end
						MagCounter = 0
					end
				end
			else
				KillID( OwnerID() , OwnerID() )
			end	
		end
	end
end