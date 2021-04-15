--���f�G
--781129--Flag1�GHorson
--781129--Flag2�G�e��
--781129--Flag3�G���
--781129--Flag4~23�G�X�M�I

--Horson--EM_RoleValue_register1--Count
--Horson--EM_RoleValue_register2--�P�_�Ҧ��ΡG�ᱵ1��2
--Horson--EM_RoleValue_register9--Entrance
--Horson--EM_RoleValue_register10--Exit

--count--EM_RoleValue_register3--1--���`
--count--EM_RoleValue_register7--1--BOSS���F�A�w�]��

--�� ��� ��--
function sasa_106853_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Count , EM_RoleValue_ZoneID )
	local Horson
	if ZoneID == 151 then		--���q
		Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
	elseif ZoneID == 152 then	--�x��
		Horson = CreateObjByFlag( 107581 , 781129 , 1 , 1 )
	elseif ZoneID == 153 then	--²��
		Horson = CreateObjByFlag( 107583 , 781129 , 1 , 1 )
	elseif ZoneID == 940 then	--���հ�
		Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
	end
	AddToPartition( Horson , Room )
	BeginPlot( Horson , "sasa_106853_AI" , 0 )
	Setplot( Horson , "dead" , "sasa_106853_Dead" , 30 )
	WriteRoleValue( Horson , EM_RoleValue_register1 , Count )
	local alive
	local EnterFight = 0
	local BerserkCounter = 0			--�g�ɭp��
	local IsBerserk = 0					--�g�ɶ}��
	local Mode = 0
	local BallCounter = 0				--�w�]�p��
	local TheFlag = 781129				--�w�]�X
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781129 , 3 , 1 )	--����X�f
	SetModeEx( Exit , EM_SetModeType_Move , false )			--������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--���i��
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--���i�I
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , true )	--��show���
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--����
	AddToPartition( Exit , Room )               
	WriteRoleValue( Horson , EM_RoleValue_register10 , Exit )

	while 1 do
		Sleep(10)
		alive = ReadRoleValue( Count , EM_RoleValue_register7 )
		BallCounter = BallCounter + 1
--�� �w�]�Ұ� ��--
		local BombIn = { 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 }
		if alive ~= 1 then				--����BOSS���`�����w�]
			if BallCounter >= 15 then
				for zz = 1 , 15 do
					local TheNum = Rand(table.getn(BombIn))+1
					local ball01 = CreateObjByFlag( 106855 , TheFlag , BombIn[TheNum] , 1 )		--�ͩ�
					BeginPlot( ball01 , "sasa_106855_killID" , 0 )
					Setplot( ball01 , "collision" , "sasa_106855_Bomb" , 50 )
					SetModeEx( ball01 , EM_SetModeType_Move , false )			--������
					SetModeEx( ball01 , EM_SetModeType_Strikback , false )		--������
					SetModeEx( ball01 , EM_SetModeType_Fight , false )			--���i��
					SetModeEx( ball01 , EM_SetModeType_Searchenemy , false )	--������
					SetModeEx( ball01 , EM_SetModeType_Mark , false )			--���i�I
					SetModeEx( ball01 , EM_SetModeType_NotShowHPMP , true )		--��show���
					AddToPartition( ball01 , Room )
					table.remove( BombIn , TheNum )
					Sleep(1)		--�קKDELAY
				end
				BallCounter = 0
			end
		end
		local BossTarget = ReadRoleValue( Horson , EM_RoleValue_AttackTargetID )
		local MaxHP = ReadRoleValue( Horson , EM_RoleValue_MaxHP )					--�`��q
		local NowHP = ReadRoleValue( Horson , EM_RoleValue_HP )						--��e��q
		local HPPercent = ( NowHP / MaxHP )*100										--��q�ʤ���	
		if ( BossTarget ~= 0 ) and ( CheckID( Horson ) ) == true then
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Horson , -1 , 2 , "[SC_106853_01]" , 1 )
				--�A�̳o�����ơA�u�^�h�I
				Mode = 1
				WriteRoleValue( Horson , EM_RoleValue_register2 , 1 )		--1 = Mode1
				Entrance = CreateObjByFlag( 106239 , 781129 , 2 , 1 )		--�e���J�f
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--���i��
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--���i�I
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , true )	--��show���
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--����
				AddToPartition( Entrance , Room )
				WriteRolevalue( Horson , EM_RoleValue_register9 , Entrance )
--�� ����ǶǼ� ��--
				local PPL = SetSearchAllPlayer( Room )
				local Num = 6		--��6���X�l
				local Num_flag = 781129
				for j = 1 , PPL do
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1
					 and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0
					 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
						SetPosByFlag( ID , Num_flag , Num )		--�쪱�a��P�@���I
						Num = Num + 1
						if Num > GetMoveFlagCount(Num_flag) -1 then
							Num = 6
						end
						sysCastSpelllv ( ID , Horson , 496773 , 0 )		--���a������
					end
				end
				EnterFight = 1
			end
--�� �g�z ��--
			if BerserkCounter >= 480 then								--8 min.
				if ZoneID == 151 or ZoneID == 152 or ZoneID == 940 then
					ScriptMessage( Horson , -1 , 2 , "[SC_106853_04]" , 1 )
					--�q���K�Pı�ܱo��ժZ���O�K
					if IsBerserk == 0 then
						AddBuff( Horson , 623851 , 0 , -1 ) 
						--Say( Horson , "Time ="..BerserkCounter )
						IsBerserk = 1
					end
				end
				BerserkCounter = 0
			end
--�� �Ҧ��@ ��--
			if Mode == 1 then												----�Ҧ�=1
				if HPPercent <= 60 and ReadRoleValue( Count , EM_RoleValue_register3 ) ~= 1 then
					Mode = 2
					WriteRoleValue( Horson , EM_RoleValue_register2 , 2 )	--2=Mode2
					sleep(10)				
				end
			elseif Mode == 2 then											----�Ҧ�=2
			end
		else
--�� ���m���` ��--
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				local GetBall = {}
				GetBall = SearchRangeNPC ( Count , 1000 )
				Sleep(10)
				if BossIsDead ~= 1 then
					ScriptMessage( Horson , -1 , 2 , "[SC_106853_02]" , 1 )
					--�B�|�K�t���h�F�A�o���S���N�q���԰��K
					if CheckID(Horson) == true then
						DelObj(Horson)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					local BallBox = table.getn(GetBall)
					for i = 0 , BallBox do
						if ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 106855
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 106856
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 106857
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 107582
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 107584 then
							DelObj(GetBall[i])							
						end
					end
					--BeginPlot( Count , "sasa_106853_CancelBuff" , 0 )	--�M��BUFF
					Sleep(20)
					if ZoneID == 151 then		--���q
						Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
					elseif ZoneID == 152 then	--�x��
						Horson = CreateObjByFlag( 107581 , 781129 , 1 , 1 )
					elseif ZoneID == 153 then	--²��
						Horson = CreateObjByFlag( 107583 , 781129 , 1 , 1 )
					elseif ZoneID == 940 then	--���հ�
						Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
					end
					AddToPartition( Horson , Room )
					BeginPlot( Horson , "sasa_106853_AI" , 0 )
					Setplot( Horson , "dead" , "sasa_106853_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Horson , EM_RoleValue_register1 , Count )
					WriteRoleValue( Horson , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Horson , EM_RoleValue_register10 , Exit )
				elseif BossIsDead == 1 then
				--BeginPlot( Count , "sasa_106853_CancelBuff" , 0 )	--�M��BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				BallCounter = 0
			end
		end
	end
end

--�� �w�]�z�F ��--
function sasa_106853_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--���`���X�{�ԼT��
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_106853_03]" , 1 )
	--���K�i��K�����~��K�԰��K
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--Ū781129�GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--�i�D�p�ɾ�Boss���F
	WriteRoleValue( count , EM_RoleValue_register7 , 1 )				--Boss���F�A�w�]�i�H���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--�� �w�]AI ��--
function sasa_106853_AI()
	--AddBuff( OwnerID() , 509476 , 0 , -1 )		------����Boss���}�԰��^�媺buff
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local TMode = 0						--�P�_�Ҧ�
	local RandCounter = 0				--6S.RAND
	local AECounter = 0					--20S.AE
	local BuffCounter = 0				--5S.�N��
	local Buff = 850225					--�N���w�]
	local AE = 850219					--���T�����i
	local BossTarget
	local bombFlag = 781129				--�w�]�ͼv�l�X
	AddBuff( OwnerID() , 620427 , 0 , -1 )	--�w�]�N��1
	AddBuff( OwnerID() , 620426 , 0 , -1 )	--�w�]�N��2
	AddBuff( OwnerID() , 620425 , 0 , -1 )	--�w�]�N��3
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			TMode = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
--�� ���Ҧ� ��--
			RandCounter = RandCounter + 1
			AECounter = AECounter + 1
			BuffCounter = BuffCounter + 1
--�� ���T ��--
			if AECounter >= 19 then
				--ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_05]" , 1 )
				--
				BossTarget = OwnerID()
				if ZoneID == 151 then		--���q
					CastSpellLv( OwnerID() , BossTarget , AE , 19 )--40
				elseif ZoneID == 152 then	--�x��
					CastSpellLv( OwnerID() , BossTarget , AE , 29 )--60
				elseif ZoneID == 153 then	--²��
					CastSpellLv( OwnerID() , BossTarget , AE , 14 )--30
				elseif ZoneID == 940 then	--����
					CastSpellLv( OwnerID() , BossTarget , AE , 0 )
				end
				Sleep(10)
				AECounter = 0
				local allball = {}
				allball = SearchRangeNPC ( OwnerID() , 1000 )
				local ballBox = table.getn(allball)
				for x = 1 , ballBox do
					if ReadRoleValue( allball[x] , EM_RoleValue_OrgID ) == 106855 then
						--Say( OwnerID() , "GO~~~" )
						local Skillball
						Skillball = star_CreateObj_NoAdd( allball[x] , 106388 , 0 , 0 , 0 , Room , 0 ) 	--���w�]�ޯ�
						SetModeEx( Skillball , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
						SetModeEx( Skillball , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
						SetModeEx( Skillball , EM_SetModeType_Searchenemy, false )   	--����
						SetModeEx( Skillball , EM_SetModeType_Fight, false ) 			--���
						SetModeEx( Skillball , EM_SetModeType_Move, false )				--����
						SetModeEx( Skillball , EM_SetModeType_ShowRoleHead, true )
						SetModeEx( Skillball , EM_SetModeType_NotShowHPMP , true )		--��show���
						SetModeEx( Skillball , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
						SetModeEx( Skillball , EM_SetModeType_Strikback, false )		--����
						SetModeEx( Skillball , EM_SetModeType_Show, true )				--�q�X
						AddToPartition( Skillball , Room )
						WriteRoleValue( Skillball , EM_RoleValue_Livetime , 5 )			--�s�b���
						if ZoneID == 151 then		--���q
							CastSpellLV( Skillball , Skillball , 850222 , 7 )--6000			--�w�]����(�p)
						elseif ZoneID == 152 then	--�x��
							CastSpellLV( Skillball , Skillball , 850222 , 14 )--11250
						elseif ZoneID == 153 then	--²��
							CastSpellLV( Skillball , Skillball , 850222 , 4 )--3750
						elseif ZoneID == 940 then	--����
							CastSpellLV( Skillball , Skillball , 850222 , 0 )
						end
						--say( Skillball , "here" )
						sleep(1)
						delobj ( allball[x] )
					elseif ReadRoleValue( allball[x] , EM_RoleValue_OrgID ) == 106856 then
						local Skillball2
						Skillball2 = star_CreateObj_NoAdd( allball[x] , 106389 , 0 , 0 , 0 , Room , 0 ) 	--���w�]�ޯ�
						SetModeEx( Skillball2 , EM_SetModeType_SearchenemyIgnore, true )---���󤣷|�Q�j�M
						SetModeEx( Skillball2 , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
						SetModeEx( Skillball2 , EM_SetModeType_Searchenemy, false )   	--����
						SetModeEx( Skillball2 , EM_SetModeType_Fight, false ) 			--���
						SetModeEx( Skillball2 , EM_SetModeType_Move, false )			--����
						SetModeEx( Skillball2 , EM_SetModeType_ShowRoleHead, true )
						SetModeEx( Skillball2 , EM_SetModeType_NotShowHPMP , true )	--��show���
						SetModeEx( Skillball2 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
						SetModeEx( Skillball2 , EM_SetModeType_Strikback, false )		--����
						SetModeEx( Skillball2 , EM_SetModeType_Show, true )				--�q�X
						AddToPartition( Skillball2 , Room )
						WriteRoleValue( Skillball2 , EM_RoleValue_Livetime , 5 )		--�s�b���
						if ZoneID == 151 then		--���q
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 9 )--7500			--�w�]����(�j)
						elseif ZoneID == 152 then	--�x��
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 19 )--15000
						elseif ZoneID == 153 then	--²��
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 6 )--5250
						elseif ZoneID == 940 then	--����
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 0 )
						end
						sleep(1)
						delobj ( allball[x] )						
					end
				end
--�� �Ҧ��G ��--
				if TMode == 2 then
					Sleep(20)
					local flagIn = { 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 }
					local BombNum = Rand(20)+4
					table.remove( flagIn , BombNum )
					local BombNum1 = Rand(table.getn( flagIn ) ) + 1
					local BombNum2 = Rand(table.getn( flagIn ) ) + 1
					local Big01
					local Big02
					if ZoneID == 151 then		--���q
						Big01 = CreateObjByFlag( 106857 , bombFlag , flagIn[BombNum1] , 1 )		--�ͩ�
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
					elseif ZoneID == 152 then	--�x��
						Big01 = CreateObjByFlag( 107582 , bombFlag , flagIn[BombNum1] , 1 )
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
						Big02 = CreateObjByFlag( 107582 , bombFlag , flagIn[BombNum2] , 1 )
						AddToPartition( Big02 , Room )
						BeginPlot( Big02 , "sasa_106857_AI" , 0 )
					elseif ZoneID == 153 then	--²��
						Big01 = CreateObjByFlag( 107584 , bombFlag , flagIn[BombNum1] , 1 )
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
					elseif ZoneID == 940 then	--����
						Big01 = CreateObjByFlag( 106857 , bombFlag , flagIn[BombNum1] , 1 )
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
						Big02 = CreateObjByFlag( 106857 , bombFlag , flagIn[BombNum2] , 1 )
						AddToPartition( Big02 , Room )
						BeginPlot( Big02 , "sasa_106857_AI" , 0 )
					end
					BossTarget = OwnerID()
					Sleep(20)
					CastSpellLv( OwnerID() , BossTarget , 850224 , 0 )				--�w�G�j��
					Sleep(30)
					CastSpellLv( OwnerID() , BossTarget , 850220 , 0 )				--�j�ƹL��
				end
--�� RAND ��--
			elseif RandCounter >= 6 then
				sasa_106853_HorsonSkill()
				RandCounter = 0
--�� �w�]�N�� ��--
			elseif BuffCounter >= 5 then
				BossTarget = OwnerID()
				CastSpellLv( OwnerID() , BossTarget , Buff , 0 )
				CancelBuff( OwnerID() , 620427 )	--�w�]�N��1
				CancelBuff( OwnerID() , 620426 )	--�w�]�N��2
				CancelBuff( OwnerID() , 620425 )	--�w�]�N��3
				local Bigball
				Bigball = star_CreateObj_NoAdd( OwnerID() , 106856 , 0 , 0 , 0 , Room , 0 ) 	--���w�]�ޯ�
				Setplot( Bigball , "collision" , "sasa_106856_Bomb" , 50 )
				SetModeEx( Bigball , EM_SetModeType_Move , false )			--������
				SetModeEx( Bigball , EM_SetModeType_Strikback , false )		--������
				SetModeEx( Bigball , EM_SetModeType_Fight , false )			--���i��
				SetModeEx( Bigball , EM_SetModeType_Searchenemy , false )	--������
				SetModeEx( Bigball , EM_SetModeType_Mark , false )			--���i�I
				SetModeEx( Bigball , EM_SetModeType_NotShowHPMP , true )	--��show���
				AddToPartition( Bigball , Room )
				Sleep(30)						--�w�]���^�h
				AddBuff( OwnerID() , 620427 , 0 , -1 )	--�w�]�N��1
				AddBuff( OwnerID() , 620426 , 0 , -1 )	--�w�]�N��2
				AddBuff( OwnerID() , 620425 , 0 , -1 )	--�w�]�N��3
				BuffCounter = 0
			end
		end
	end
end

--�� RAND 7S. SKILL ��--
function sasa_106853_HorsonSkill()
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local Skill = { 850216 , 850217 }			--�j�E���B�Q�g�w�G�y
	local SkillLv = {}
	if ZoneID == 151 then		--���q
		SkillLv = { 9 , 9 }--25000,22500
	elseif ZoneID == 152 then	--�x��
		SkillLv = { 39 , 39 }--100000,90000
	elseif ZoneID == 153 then	--²��
		SkillLv = { 4 , 2 }--12500,6750
	elseif ZoneID == 940 then	--����
		SkillLv = { 0 , 0 }
	end
	--local SkillString = "[SC_106572_03]"
	--
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--���X����������a
	local BossTarget 											--�sBOSS�n�����ؼ�
	local SkillIndex 											--��TABLE������m
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		BossTarget = OwnerID()
		CastSpellLV( OwnerID() , BossTarget , 850218 , 0 )				--�Űʧ@
		for a=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[a]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if ZoneID == 151 or ZoneID == 153 or ZoneID == 940 then		--���q+²��+����
			if table.getn(LuckyPlayer) >= 2 then						--�j��2�H�Nrand 2��
				for b=1 , 2 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND�쪺�Ʀr	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--2�H�H�U�N����
				for c=1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[c] ~= nil ) and ( ReadRoleValue( LuckyPlayer[c] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[c] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		elseif ZoneID == 152 then	--�x��
			if table.getn(LuckyPlayer) >= 4 then						--�j��4�H�Nrand 4��
				for b=1 , 4 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND�쪺�Ʀr	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--4�H�H�U�N����
				for c=1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[c] ~= nil ) and ( ReadRoleValue( LuckyPlayer[c] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[c] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end

--�� �w�]15�� ��--
function sasa_106855_killID()
	local counter = 0
	while 1 do
		sleep(10)
		counter = counter + 1
		if counter == 14 then
			--Say( OwnerID() , "kill" )
			delobj ( OwnerID() )
			--killID( OwnerID() , OwnerID() )
		end
	end
end

--�� ���p�s�] ��--
function sasa_106855_Bomb()
	--say( OwnerID() , "YOOO" )
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( TargetID() , EM_RoleValue_ZoneID )
	local Skillball
	Skillball = star_CreateObj_NoAdd( TargetID() , 106388 , 0 , 0 , 0 , Room , 0 ) 	--���w�]�ޯ�
	SetModeEx( Skillball , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
	SetModeEx( Skillball , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
	SetModeEx( Skillball , EM_SetModeType_Searchenemy, false )   	--����
	SetModeEx( Skillball , EM_SetModeType_Fight, false ) 			--���
	SetModeEx( Skillball , EM_SetModeType_Move, false )				--����
	SetModeEx( Skillball , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( Skillball , EM_SetModeType_NotShowHPMP , true )		--��show���
	SetModeEx( Skillball , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Skillball , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Skillball , EM_SetModeType_Show, true )				--�q�X
	AddToPartition( Skillball , Room )
	WriteRoleValue( Skillball , EM_RoleValue_Livetime , 5 )			--�s�b���
	if ZoneID == 151 then		--���q
		CastSpellLV( Skillball , Skillball , 850222 , 14 )			--�w�]����(�p)
	elseif ZoneID == 152 then	--�x��
		CastSpellLV( Skillball , Skillball , 850222 , 39 )--*2300
	elseif ZoneID == 153 then	--²��
		CastSpellLV( Skillball , Skillball , 850222 , 9 )
	elseif ZoneID == 940 then	--����
		CastSpellLV( Skillball , Skillball , 850222 , 0 )
	end
	--say( Skillball , "here" )
	sleep(1)
	delobj ( TargetID() )
end

--�� ���j�s�] ��--
function sasa_106856_Bomb()
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( TargetID() , EM_RoleValue_ZoneID )
	local Skillball
	Skillball = star_CreateObj_NoAdd( TargetID() , 106389 , 0 , 0 , 0 , Room , 0 ) 	--���w�]�ޯ�
	SetModeEx( Skillball , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
	SetModeEx( Skillball , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
	SetModeEx( Skillball , EM_SetModeType_Searchenemy, false )   	--����
	SetModeEx( Skillball , EM_SetModeType_Fight, false ) 			--���
	SetModeEx( Skillball , EM_SetModeType_Move, false )				--����
	SetModeEx( Skillball , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( Skillball , EM_SetModeType_NotShowHPMP , true )		--��show���
	SetModeEx( Skillball , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Skillball , EM_SetModeType_Strikback, false )			--����
	SetModeEx( Skillball , EM_SetModeType_Show, true )				--�q�X
	AddToPartition( Skillball , Room )
	WriteRoleValue( Skillball , EM_RoleValue_Livetime , 5 )			--�s�b���
	if ZoneID == 151 then		--���q
		CastSpellLV( Skillball , Skillball , 850223 , 17 )			--�w�]����(�j)
	elseif ZoneID == 152 then	--�x��
		CastSpellLV( Skillball , Skillball , 850223 , 49 )--*2300
	elseif ZoneID == 153 then	--²��
		CastSpellLV( Skillball , Skillball , 850223 , 11 )
	elseif ZoneID == 940 then	--����
		CastSpellLV( Skillball , Skillball , 850223 , 0 )
	end
	--say( Skillball , "here" )
	sleep(1)
	delobj ( TargetID() )
end

--�� ���vAI ��--
function sasa_106857_AI()
	local NSCounter = 0				--3S.�G�k��
	local NS = 850221				--�G�k��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			NSCounter = NSCounter + 1
			if NSCounter >= 3 then
				local Lucky02 = {}
				local PlayerInHate2 = {}
				PlayerInHate2 = star_HateListSort(OwnerID())						----���X����������a
				for ll=1 , table.getn(PlayerInHate2) do
					local temp02 = PlayerInHate2[ll]			 
					if ReadRoleValue(temp02 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
					 and ReadRoleValue(temp02 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
						Lucky02[table.getn(Lucky02)+1] = temp02 			--��쪺���a��iTABLE
					end
				end
				--Say( OwnerID() , "run baby, "..table.getn(Lucky02) )
				if table.getn(Lucky02) >= 3 then							------�j��3�H�Nrand 3��
					for mm=1 , 3 do						
						local Luckynum02 = Rand(table.getn(Lucky02))+1						--RAND�쪺�Ʀr	
						if ( Lucky02[Luckynum02] ~= nil ) and ( ReadRoleValue( Lucky02[Luckynum02] , EM_RoleValue_IsDead ) == 0 ) then
							if ZoneID == 151 then		--���q
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 9 )--20
							elseif ZoneID == 152 then	--�x��
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 14 )--30
							elseif ZoneID == 153 then	--²��
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 9 )--20
							elseif ZoneID == 940 then	--����
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 0 )
							end
						end
						table.remove( Lucky02 , Luckynum02 )
						sleep(1)
						--Say( OwnerID() , "run, "..table.getn(Lucky02) )
					end
				else													-------3�H�H�U�N����
					for nn=1 , table.getn(Lucky02) do
						if ( Lucky02[nn] ~= nil ) and ( ReadRoleValue( Lucky02[nn] , EM_RoleValue_IsDead ) == 0 ) then
							--Say( OwnerID() , "run, "..table.getn(Lucky02) )
							if ZoneID == 151 then		--���q
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 9 )
							elseif ZoneID == 152 then	--�x��
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 14 )
							elseif ZoneID == 153 then	--²��
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 9 )
							elseif ZoneID == 940 then	--����
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 0 )
							end
						end
						sleep(1)
					end
					NSCounter = 0
				end			
			end
		end
	end
end