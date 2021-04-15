--���f�G/GM ? Zone 139 0 479.6 1471.3 -1050.6
--���诸�I�G/GM ? Zone 140 0 354.1 1588.9 -705.2
--780911--Flag1�G�j����
--780911--Flag2�G�e���G/GM ? Zone 139 0 444.4 1472.7 -1048.8
--780911--Flag3�G���
--780911--Flag4~6�G3�ӥX��f(DIR�G90)
--4�G/GM ? zone 139 0 232.2 1471.4 -682.8
--5�G/GM ? zone 139 0 297.2 1471.4 -682.8
--6�G/GM ? zone 139 0 365.2 1471.4 -682.8
--780911--Flag7~9�G3�ӱ���I
--780911--Flag10�G�_�c
--780911--Flag11~13�G�𫰨�
--780911--Flag14~23�G�p��
--780911--Flag24�G����z���y

--���--EM_RoleValue_register1--Boss���`�P�_(1=��)

--Boss--EM_RoleValue_register1--���
--Boss--EM_RoleValue_register5--Mode
--Boss--EM_RoleValue_register6--Car01
--Boss--EM_RoleValue_register7--Car02
--Boss--EM_RoleValue_register8--Car03
--Boss--EM_RoleValue_register9--Entrance
--Boss--EM_RoleValue_register10--Exit

--Bomb--EM_RoleValue_Register1--Player
--Car--EM_RoleValue_Register1--Player
--Car--EM_RoleValue_Register2--Boss

--�� ��� ��--
function sasa_105458_Counter_easy()
	local Entrance = 0
	local EnterFight = 0	
	local Mode = 0												------�P�_�Ҧ���
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 105858 , 780911 , 1 , 1 )
	AddToPartition( Boss , Room )
	BeginPlot( Boss , "sasa_105458_AI_easy" , 0 )
	Setplot( Boss , "dead" , "sasa_105458_Dead_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
	
	local Entrance = CreateObjByFlag( 105459 , 780911 , 2 , 1 )		-----���ת�(�J�f)
	SetModeEx( Entrance , EM_SetModeType_Move , false )			------������
	SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Entrance , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( Entrance , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEx( Entrance , EM_SetModeType_Obstruct , false )		------����(���F���}���A�ҥH����)
	AddToPartition( Entrance , Room )
	SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	--���}���A
	WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
	
	local Exit = CreateObjByFlag( 105459 , 780911 , 3 , 1 )		------���ת�(�X�f)
	SetModeEx( Exit , EM_SetModeType_Move , false )				------������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )		------������
	SetModeEx( Exit , EM_SetModeType_Fight , false )			------���i���
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )		------������
	SetModeEx( Exit , EM_SetModeType_Mark , false )				------���i�I��
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )		------��show���
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )			------����
	AddToPartition( Exit , Room )
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_END )	------�������A
	WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )

	local Car01 = CreateObjByFlag( 105863 , 780911 , 11 , 1 )
	SetModeEx( Car01 , EM_SetModeType_ShowRoleHead, false )			--���q�Y����
	SetModeEx( Car01 , EM_SetModeType_Mark, false )					--�аO
	SetModeEx( Car01 , EM_SetModeType_Move , false )				------������
	SetModeEx( Car01 , EM_SetModeType_Strikback , false )			------������
	SetModeEx( Car01 , EM_SetModeType_Fight , false )				------���i���
	AddToPartition( Car01 , Room )
	AddBuff( Car01 , 509476 , 0 , -1 )								--���l���^��
	Setplot( Car01 , "dead" , "sasa_105665_Broken01_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register6 , Car01 )
	WriteRoleValue( Car01 , EM_RoleValue_register2 , Boss )
	
	local Car02 = CreateObjByFlag( 105863 , 780911 , 12 , 1 )
	SetModeEx( Car02 , EM_SetModeType_ShowRoleHead, false )			--���q�Y����
	SetModeEx( Car02 , EM_SetModeType_Mark, false )					--�аO
	SetModeEx( Car02 , EM_SetModeType_Move , false )				------������
	SetModeEx( Car02 , EM_SetModeType_Strikback , false )			------������
	SetModeEx( Car02 , EM_SetModeType_Fight , false )				------���i���
	AddToPartition( Car02 , Room )
	AddBuff( Car02 , 509476 , 0 , -1 )								--���l���^��
	Setplot( Car02 , "dead" , "sasa_105665_Broken02_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register7 , Car02 )
	WriteRoleValue( Car02 , EM_RoleValue_register2 , Boss )
	
	local Car03 = CreateObjByFlag( 105863 , 780911 , 13 , 1 )
	SetModeEx( Car03 , EM_SetModeType_ShowRoleHead, false )			--���q�Y����
	SetModeEx( Car03 , EM_SetModeType_Mark, false )					--�аO
	SetModeEx( Car03 , EM_SetModeType_Move , false )				------������
	SetModeEx( Car03 , EM_SetModeType_Strikback , false )			------������
	SetModeEx( Car03 , EM_SetModeType_Fight , false )				------���i���
	AddToPartition( Car03 , Room )
	AddBuff( Car03 , 509476 , 0 , -1 )								--���l���^��
	Setplot( Car03 , "dead" , "sasa_105665_Broken03_easy" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register8 , Car03 )
	WriteRoleValue( Car03 , EM_RoleValue_register2 , Boss )

	local GG01 = {}							--�p���ܼ�
	local GG02 = {}							--�p���ܼ�
	local GGCounter = 0						--15S.�X�p��
	--local BerserkCounter = 0									-------�g�ɭp��
	--local IsBerserk = 0											-------�g�ɶ}��
		
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if ( BossTarget ~= 0 ) and ( CheckID( Boss ) ) == true then
			GGCounter = GGCounter + 1
			--BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Boss , -1 , 2 , "[SC_105458_01]" , 1 )
				--�w��A�A�̬O�s�Ӫ��m�߹�H�a�H
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register5 , 1 )				--1=Mode1
				SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_END )	--������
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )			--����(�����F�ҥH�n��)
				SetModeEx( Car01 , EM_SetModeType_Fight , true )				--�i�H�娮�F
				SetModeEx( Car01 , EM_SetModeType_ShowRoleHead, true )			--�q�Y����
				SetModeEx( Car01 , EM_SetModeType_Mark, true )					--�аO
				SetModeEx( Car02 , EM_SetModeType_Fight , true )
				SetModeEx( Car02 , EM_SetModeType_ShowRoleHead, true )
				SetModeEx( Car02 , EM_SetModeType_Mark, true )
				SetModeEx( Car03 , EM_SetModeType_Fight , true )
				SetModeEx( Car03 , EM_SetModeType_ShowRoleHead, true )
				SetModeEx( Car03 , EM_SetModeType_Mark, true )
				local PPL = SetSearchAllPlayer( Room )
				--local Num = 1
				--local Num_OP = 780839			--�쪱�a���I
				for h = 1 , PPL do
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1
					 and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0
					 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
						--SetPosByFlag( ID , Num_OP , Num ) 			--�쪱�a��P�@���I
						--Num = Num + 1
						--if Num > GetMoveFlagCount(Num_OP) -1 then
							--Num = 1
						--end
						sysCastSpelllv ( ID , Boss , 497225 , 0 )		--���a������
					end
				end
				EnterFight = 1
			end
--�� �p�Ǩ��o ��--
			if EnterFight == 1 then
				if GGCounter >= 15 then
					ScriptMessage( Boss , -1 , 2 , "[SC_105458_03]" , 1 )
					--�ں�U���i�h�̡A�ֲo���L�̡I
					for d = 1 , 1 do
						local flagNum1 = Rand(10)+14
						local flagNum2 = Rand(10)+14
						local GGP = CreateObjByFlag( 105861 , 780911 , flagNum1 , 1 )	--���z
						GG01[table.getn( GG01 )+1] = GGP
						AddToPartition( GGP , Room )
						BeginPlot( GGP , "sasa_105462_Run_easy" , 0 )
						--Say( GGP , "Yes,Sir!" )
						Sleep(1)
						local GGM = CreateObjByFlag( 105862 , 780911 , flagNum2 , 1 )	--�k�N
						GG02[table.getn( GG02 )+1] = GGM
						AddToPartition( GGM , Room )
						BeginPlot( GGM , "sasa_105463_Run_easy" , 0 )
						--Say( GGM , "Yes,Boss!" )
					end
					GGCounter = 0
				end
--�� �g�� ��--
				--if BerserkCounter >= 360 then
					--if IsBerserk == 0 then
						--AddBuff( Boss , 620042 , 0 , -1 )
						--Say( Boss , "Time ="..BerserkCounter )
						--ScriptMessage( Boss , -1 , 2 , "[SC_105458_05]" , 1 )
						--�o�Ǯz�̬O���̧�Ӫ��I�H�ڭn����s���m�߹�H�I
						--IsBerserk = 1
					--end	
					--BerserkCounter = 0
				--end
			end
--�� �Ҧ��@ ��--
			if Mode == 1 then												----�Ҧ�=1

			--elseif Mode == 2 then											----�Ҧ�=2
			end
--�� ���m���` ��--
		else
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				if BossIsDead ~= 1 then
					if CheckID(Boss) == true then
						DelObj(Boss)
					end
					if CheckID(Car01) == true then
						DelObj(Car01)
					end
					if CheckID(Car02) == true then
						DelObj(Car02)
					end
					if CheckID(Car03) == true then
						DelObj(Car03)
					end
					for e = 1 , table.getn(GG01) do
						if CheckID(GG01[e]) == true and GG01[e] ~= nil then
							DelObj(GG01[e])
						end
					end
					for f = 1 , table.getn(GG02) do
						if CheckID(GG02[f]) == true and GG02[f] ~= nil then
							DelObj(GG02[f])
						end
					end
					BeginPlot( OwnerID() , "sasa_105458_CancelBuff_easy" , 0 )		--�M��BUFF
					sleep(50)
					SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	--�۳¶}��
					sleep(20)
					SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )	--�����}�����A
					sleep(20)
					SetModeEx( Entrance , EM_SetModeType_Obstruct , false )		------����(���F���}���A�ҥH����)
					Boss = CreateObjByFlag( 105858 , 780911 , 1 , 1 )
					AddToPartition( Boss , Room )
					BeginPlot( Boss , "sasa_105458_AI_easy" , 0 )
					Setplot( Boss , "dead" , "sasa_105458_Dead_easy" , 30 )
					
					Sleep(20)
					
					Car01 = CreateObjByFlag( 105863 , 780911 , 11 , 1 )
					SetModeEx( Car01 , EM_SetModeType_Move , false )			------������
					SetModeEx( Car01 , EM_SetModeType_Strikback , false )		------������
					SetModeEx( Car01 , EM_SetModeType_Fight , false )			------���i���
					SetModeEx( Car01 , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
					SetModeEx( Car01 , EM_SetModeType_Mark, false )				--�аO
					AddToPartition( Car01 , Room )
					AddBuff( Car01 , 509476 , 0 , -1 )							--���l���^��
					Setplot( Car01 , "dead" , "sasa_105665_Broken01_easy" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register6 , Car01 )
					WriteRoleValue( Car01 , EM_RoleValue_register2 , Boss )
					
					Car02 = CreateObjByFlag( 105863 , 780911 , 12 , 1 )
					SetModeEx( Car02 , EM_SetModeType_Move , false )			------������
					SetModeEx( Car02 , EM_SetModeType_Strikback , false )		------������
					SetModeEx( Car02 , EM_SetModeType_Fight , false )			------���i���
					SetModeEx( Car02 , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
					SetModeEx( Car02 , EM_SetModeType_Mark, false )				--�аO
					AddToPartition( Car02 , Room )
					AddBuff( Car02 , 509476 , 0 , -1 )							--���l���^��
					Setplot( Car02 , "dead" , "sasa_105665_Broken02_easy" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register7 , Car02 )
					WriteRoleValue( Car02 , EM_RoleValue_register2 , Boss )
					
					Car03 = CreateObjByFlag( 105863 , 780911 , 13 , 1 )
					SetModeEx( Car03 , EM_SetModeType_Move , false )			------������
					SetModeEx( Car03 , EM_SetModeType_Strikback , false )		------������
					SetModeEx( Car03 , EM_SetModeType_Fight , false )			------���i���
					SetModeEx( Car03 , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
					SetModeEx( Car03 , EM_SetModeType_Mark, false )				--�аO
					AddToPartition( Car03 , Room )
					AddBuff( Car03 , 509476 , 0 , -1 )							--���l���^��
					Setplot( Car03 , "dead" , "sasa_105665_Broken03_easy" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register8 , Car03 )
					WriteRoleValue( Car03 , EM_RoleValue_register2 , Boss )

					WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
					GG01 = {}							--�p���ܼƭ��m�k�s
					GG02 = {}							--�p���ܼƭ��m�k�s
				elseif BossIsDead == 1 then									---Boss���F������
					BeginPlot( OwnerID() , "sasa_105458_CancelBuff_easy" , 0 )	--�M��BUFF
					return
				end
				EnterFight = 0
				--BerserkCounter = 0
				--IsBerserk = 0
				GGCounter = 0
			end
		end
	end
end

--�� �j����AI ��--
function sasa_105458_AI_easy()
	AddBuff( OwnerID() , 509476 , 0 , -1 )		------����Boss���}�԰��^�媺buff
	AddBuff( OwnerID() , 509844 , 89 , -1 )		------���a��BOSS-��
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			-----������
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local mode = 0							--�P�_�Ҧ���
	local BoxCounter = 0					--11S.���ı�
	local BallCounter = 0					--7S.�U���z�u
	local AirCounter = 0					--5S.����
	local Box = 497218						--���ı��t
	local FireBall = 497215					--�U���z�u
	local FireCheck = 497302				--�z�u�P�_
	local AirAct = 497223					--����ʧ@
	local Air = 497301						--����
	local Angry = 497227					--����z��
	local BallA
	local BossTarget
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			mode = ReadRoleValue( OwnerID() , EM_RoleValue_register5 )
--�� �Ҧ��@ ��--
			if mode == 1 then
				BoxCounter = BoxCounter + 1
				BallCounter = BallCounter + 1
				AirCounter = AirCounter + 1
--�� ���ı� ��--
				if BoxCounter >= 11 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_105458_02]" , 1 )
					--�����믫�I�ոլݳo�ӡI
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , Box , 0 )	--���a�X���ı�
					Sleep(5)
					sasa_105458_RunBox_easy()
					BoxCounter = 0
--�� ���z�u ��--
				elseif BallCounter >= 7 then
					local LuckyU = {}
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort(OwnerID())
					for b = 1 , table.getn(PlayerInHate1) do
						local temp01 = PlayerInHate1[b]			 
						if ReadRoleValue( temp01 , EM_RoleValue_Voc ) ~= 0 					--GM�ư�
						 and ReadRoleValue( temp01 , EM_RoleValue_IsDead ) == 0				--���H�ư�
						 and ReadRoleValue( temp01 , EM_RoleValue_OrgID ) ~= 105863 then	--���l�ư�
							if ( CheckBuff( temp01 , 509876 ) == false ) then
								LuckyU[table.getn(LuckyU)+1] = temp01 			--��쪺���a��iTABLE
							end	
						end
					end
					--Say( OwnerID() , "Fire, "..table.getn(LuckyU) )
					for c = 1 , 1 do
						local Luckynum = Rand(table.getn(LuckyU))+1				--RAND�쪺�Ʀr
						if ( LuckyU[Luckynum] ~= nil )
						 and ( ReadRoleValue( LuckyU[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
							BossTarget = LuckyU[Luckynum]
							--Say( OwnerID() , GetName(BossTarget) )
							CastSpellLv( OwnerID() , BossTarget , FireBall , 4 )	--�U���z�u
							Sleep(20)
							SysCastSpellLv( OwnerID() , BossTarget , FireCheck , 0 )	--�z�u�P�_
						end
						table.remove( LuckyU , Luckynum )
						sleep(1)
						--Say( OwnerID() , "OH-NO, "..table.getn(LuckyU) )
					end
					BallCounter = 0
--�� ��a�X���� ��--
				elseif AirCounter >= 5 then
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , AirAct , 0 )
					BallA = CreateObjByFlag( 105389 , 780911 , 24 , 1 )
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
					WriteRoleValue( BallA , EM_RoleValue_Livetime, 3 )			--�s�b���
					CastSpellLv( BallA , BossTarget , Air , 1 )
					AirCounter = 0
--�� ���z�� ��--
				elseif ReadRoleValue( OwnerID() , EM_RoleValue_register6 ) == 4
				 and ReadRoleValue( OwnerID() , EM_RoleValue_register7 ) == 4 
				 and ReadRoleValue( OwnerID() , EM_RoleValue_register8 ) == 4 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_105458_07]" , 1 )
					--�u�O���O�F�ڪ�[105665]�K�ڭn���F�o�Ǥ����n�諸�å�I
					Sleep(30)
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , Angry , 24 )
				end
			end
		end
	end
end

--�� ���z�p��AI ��--
function sasa_105462_Run_easy()
	while 1 do
		Sleep(10)
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local PhyTarget
		while 1 do
		sleep(10)
			local Car = {}
			Car = SearchRangeNPC ( OwnerID() , 100 )
			local CarBox = table.getn(Car)
			for i = 1 , CarBox do
				if ReadRoleValue( Car[i] , EM_RoleValue_OrgID ) == 105863 then
					--Say( OwnerID() , "GO~~~" )
					SetAttack( OwnerID() , Car[i] )
					PhyTarget = Car[i]
					CastSpellLV( OwnerID() , PhyTarget , 497222 , 3 )		--����
				end
			end
			Sleep(50)
		end
	end
end

--�� �k�N�p��AI ��--
function sasa_105463_Run_easy()
	while 1 do
		Sleep(10)
		local MagCounter = 0
		local MagTarget
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
		sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				MagCounter = MagCounter + 1
				if MagCounter >= 2 then
					--Say( OwnerID() , "BON~~~" )
					MagTarget = OwnerID()
					if 	( MagTarget ~= nil) 
					 and ( ReadRoleValue( MagTarget , EM_RoleValue_IsDead ) == 0 ) then
						CastSpellLV( OwnerID() , MagTarget , 497221 , 1 )		--����
						Sleep(10)
					end
					MagCounter = 0
				end
			end
		end
	end
end

--�� ���ı�u�u ��--
function sasa_105458_RunBox_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for a = 1 , 3 do
		local BoxFlag = { 4 , 5 , 6 }
		local FlagNum = Rand(3)+1
		local BoxBoy = CreateObjByFlag( 105860 , 780911 , BoxFlag[FlagNum] , 1 )
		SetModeEx( BoxBoy , EM_SetModeType_Strikback , false )					--������
		SetModeEx( BoxBoy , EM_SetModeType_Move , true )						--����
		AddToPartition( BoxBoy , Room )
		AddBuff( BoxBoy , 509476 , 0 , -1 )		------�������ı�^�媺buff
		BeginPlot( BoxBoy , "sasa_105461_Kill_easy" , 0 )
		SetPlot( BoxBoy , "collision" , "sasa_105461_GO_easy" , 10 )
		Setplot( BoxBoy , "dead" , "sasa_105461_BoxDead_easy" , 30 )
		MoveToFlagEnabled ( BoxBoy ,  false )
		SetModeEx( BoxBoy , EM_SetModeType_Searchenemy , false )				--������
		--Say( OwnerID() , "yes!" )
		Sleep(20)
	end
end

--�� ���ı��� ��--
function sasa_105461_Kill_easy()
	local MoveFlag = Rand(3)+7
	DW_MoveToFlag( OwnerID() , 780911 , MoveFlag , 0 )					--( who , flag , No. , Range )
	--local KillCounter = 0
	--while 1 do
		--Sleep(10)
		--KillCounter = KillCounter + 1
		--if KillCounter == 10 then
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_DEATH_DOWN )
			SysCastSpellLV( OwnerID() , OwnerID() , 497226 , 1 )		--�z�}��
			Sleep(20)
			delobj ( OwnerID() )
		--end
	--end
end

--�� ���ı�I�� ��--
function sasa_105461_GO_easy()
	SysCastSpellLV( TargetID() , OwnerID() , 496259 , 4 )			--�j�O����
	sleep(1)
end

--�� ���ı��������� ��--
function sasa_105461_BoxDead_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Bomb
	Bomb = star_CreateObj_NoAdd( OwnerID() , 118460 , 0 , 0 , 0 , Room , 0) 	--������
	SetModeEx( Bomb , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
	SetModeEx( Bomb , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
	SetModeEx( Bomb , EM_SetModeType_Searchenemy, false )   	--����
	SetModeEx( Bomb , EM_SetModeType_Fight, false ) 			--���
	SetModeEx( Bomb , EM_SetModeType_Move, false )				--����
	SetModeEx( Bomb , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( Bomb , EM_SetModeType_NotShowHPMP , false )		--��show���
	SetModeEx( Bomb , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Bomb , EM_SetModeType_Show, true )				--�q�X
	AddToPartition( Bomb , Room )
	Setplot( Bomb , "touch" , "sasa_118460_AI_easy" , 30 )
	WriteRoleValue( Bomb , EM_RoleValue_Livetime , 10 )			--�s�b���
end

--�� �I���� ��--
function sasa_118460_AI_easy()
	BeginPlot( TargetID() , "sasa_118460_AI2_easy" , 0)
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1 , OwnerID() )
end

--�� �R���� ��--
function sasa_118460_AI2_easy()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local BombBuff = 509271				--�ݾl����
	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 0 then
		AddBuff( Player , BombBuff , 0 , 20 )
	end
	Sleep(20)
	delobj ( OwnerID() )
end

--�� �j���覺�F ��--
function sasa_105458_Dead_easy()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_105458_04]" , 1 )
	--[105515]�O���|�˩���L�A�̪��I
	--�v�ͪL�E�ĺ��h�O���|�˩���L�A�̪��I
	--BeginPlot( OwnerID(), "ic_ha_de_139_01" , 0 )							--���b��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		--Ū�X���GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )					--�i�D�p�ɾ�Boss���F
	local Treasure = CreateObjByFlag( 105859 , 780911 , 10 , 1 )			--�_�c
	SetModeEx( Treasure , EM_SetModeType_Searchenemy, false)   				--����
	SetModeEx( Treasure , EM_SetModeType_Fight, false) 						--���
	SetModeEx( Treasure , EM_SetModeType_Move, false)						--����
	SetModeEx( Treasure , EM_SetModeType_Strikback, false)					--����
	AddToPartition( Treasure , Room )
	BeginPlot( Treasure , "sasa_105460_Treasure_easy", 0 )
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )			--�}��
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )				--�����}�����A
	SetModeEx( Entrance , EM_SetModeType_Obstruct , false )					--���פı�
	SetModeEx( Exit , EM_SetModeType_Obstruct , false )
	DelObj( Entrance )
	DelObj( Exit )
end

--�� �z�� ��--
function sasa_105665_Broken01_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---Ū�XBoss GID
	WriteRoleValue( Boss , EM_RoleValue_register6 , 4 )						---�i�DBoss Car01�z�F
end

function sasa_105665_Broken02_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---Ū�XBoss GID
	WriteRoleValue( Boss , EM_RoleValue_register7 , 4 )						---�i�DBoss Car02�z�F
end

function sasa_105665_Broken03_easy()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---Ū�XBoss GID
	WriteRoleValue( Boss , EM_RoleValue_register8 , 4 )						---�i�DBoss Car03�z�F
end

--�� �_�c ��--
function sasa_105460_Treasure_easy()
	SetPlot( OwnerID() ,"touch", "sasa_Treasure_openeasy" ,40 )
end

function sasa_Treasure_openeasy()
	SetPlot( TargetID() ,"touch", "" ,0 )
	Sleep(20)
	KillID( OwnerID() , TargetID() )
end


--�� �z�u���ݯd ��--
--function sasa_105499_Fire()										--�z�u�P�_
	--local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local xx = ReadRoleValue ( TargetID() , EM_RoleValue_X )
	--local yy = ReadRoleValue ( TargetID() , EM_RoleValue_y )
	--local zz = ReadRoleValue ( TargetID() , EM_RoleValue_z )
	--local Fire = CreateObj ( 105499 , xx , yy , zz , 0 , 1 )
	--SetModeEx( Fire , EM_SetModeType_SearchenemyIgnore , true )	---���󤣷|�Q�j�M
	--SetModeEx( Fire , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	--SetModeEx( Fire , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
	--SetModeEx( Fire , EM_SetModeType_Searchenemy , false )   	--����
	--SetModeEx( Fire , EM_SetModeType_Mark , false )				--�аO
	--SetModeEx( Fire , EM_SetModeType_Fight , false ) 			--���
	--SetModeEx( Fire , EM_SetModeType_Move , false )				--����
	--SetModeEx( Fire , EM_SetModeType_ShowRoleHead , true )
	--SetModeEx( Fire , EM_SetModeType_Strikback , false )		--����
	--SetModeEx( Fire , EM_SetModeType_Show , true )				--�q�X
	--AddToPartition( Fire , Room )
	--WriteRoleValue( Fire , EM_RoleValue_Livetime , 15 )			--�s�b���
	--beginplot( Fire , "sasa_105499_Fire2", 0 )
--end

--function sasa_105499_Fire2()                      				--�z�u�P�_2
	--AddBuff( OwnerID() , 509265 , 0 , -1 )							--�l�K
	--while true do
	--sleep(10)
		--sysCastSpellLv( OwnerID() , OwnerID() , 497216 , 0 )	--�l��
	--end	
--end

--�� �����Q������ ��--�l���B����
function sasa_105863_npccheck()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 105863 then
		return false
	else
		return true
	end
end

--�� ���l ��--
function sasa_105863_Tank01()					--�𫰨��Ҫ����ͼ@��
	AddBuff( OwnerID() , 509268 , 9 , -1 )		--����NPC�¤OUP
	AddBuff( OwnerID() , 509269 , 49 , -1 )		--�QNPC�����¤OUP
end

function sasa_105863_Tank02( Seat , UpDown )	--�𫰨��D�nscript
	local SkillID = { 497228 , 497220 }			--���Ĭ��B�H������
	local SkillLv = { 0 , 0 }
	local Pos									--Ū�����aBUFF��m
	local Time									--�ݾl���ĳѤU���ɶ�
	if UpDown == 1 then							--�W��
		--Say( OwnerID() , "In" )
		SetFlag( OwnerID() , 545041 , 1 )		--�����n���~�X��
		AddBuff( OwnerID() , 509876 , 0 , -1 )	--�W��BOSS����
		Pos = Lua_BuffPosSearch( OwnerID() , 509271 )
		Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
		AddBuff( TargetID() , 509271 , 0 , Time )
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , OwnerID() )
		SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
		SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
	elseif UpDown == 0 then						--�U��
		--Say( OwnerID() , "Out" )
		SetFlag( OwnerID() , 545041 , 0 )		--�������n���~�X��
		CancelBuff( OwnerID() , 509876 )		--�����W��BOSS����
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , 0 )
		DelExSkill( OwnerID() , TargetID() , SkillID[1] )
		DelExSkill( OwnerID() , TargetID() , SkillID[2] )
	end
end

--�� �u���ˬd ��--
function sasa_105863_Buffcheck()
	local First = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if CheckBuff( First , 509271 ) == false then
		ScriptMessage( First , First , 1 , "[SC_105458_06]" , 2 )
		--�ݾl���Ĥ���
		return false
	else
		return true
	end
end

--�� �MBUFF ��--
function sasa_105458_CancelBuff_easy()												--�R��BUFF��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local YesPlayer = SetSearchAllPlayer(RoomID)								--��ϰ�Ҧ����a
	local BuffPlayer = {}
	for g = 1 , YesPlayer do
		BuffPlayer[g] = GetSearchResult() 										--���Ȧs��
		if CheckID( BuffPlayer[g] ) == true	 									--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
		 and ReadRoleValue( BuffPlayer[g] , EM_RoleValue_IsDead ) == 0			--EM_RoleValue_IsDead   =1  =���`
		 and ReadRoleValue( BuffPlayer[g] , EM_RoleValue_IsPlayer ) == 1 then	--EM_RoleValue_IsPlayer =1  =���a
			if CheckBuff( BuffPlayer[g] , 509271 ) == true						--�ݾl����
			 or CheckBuff( BuffPlayer[g] , 509264 ) == true then				--�P�K
				CancelBuff( BuffPlayer[g] , 509271 )								--�n�R����BUFF
				CancelBuff( BuffPlayer[g] , 509264 )
			end
		end
	end
end