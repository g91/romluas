
--���f--/GM ? zone 157 0 -1305.7 929.1 546.5
--Flag--781342
--Count--108143
--�X��--Flag1--Nabu
--�X��--Flag2--�e��
--�X��--Flag3--���
--�X��--Flag4~27--�p�ǥͩ��I

--Nabu--EM_RoleValue_register1--Count
--Nabu--EM_RoleValue_register2--
--Nabu--EM_RoleValue_register9--Entrance
--Nabu--EM_RoleValue_register10--Exit

--Blackone--EM_RoleValue_register1--Nabu
--Whiteone--EM_RoleValue_register1--Nabu

--count--EM_RoleValue_register3--1--���`

--for�j��ϥΦ�--g

--�� ��� ��--
function sasa_108143_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Count , EM_RoleValue_ZoneID )
	local NabuNum = { 108144 , 108157 , 108160 }
	local class
	if ZoneID == 157 or ZoneID == 940 then		--�x��--���հ�
		class = 1
	elseif ZoneID == 158 then	--���q
		class = 2
	elseif ZoneID == 159 then	--²��
		class = 3
	end
	local Nabu = CreateObjByFlag( NabuNum[class] , 781342 , 1 , 1 )
	AddToPartition( Nabu , Room )
	BeginPlot( Nabu , "sasa_108144_AI" , 0 )
	Setplot( Nabu , "dead" , "sasa_108144_Dead" , 30 )
	WriteRoleValue( Nabu , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781342 , 3 , 1 )	--����X�f
	SetModeEx( Exit , EM_SetModeType_Move , false )			--������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--���i��
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--���i�I
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--��show���
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--����
	AddToPartition( Exit , Room )               
	WriteRoleValue( Nabu , EM_RoleValue_register10 , Exit )
	
	local EnterFight = 0
	local Jellyfish01 = {}		--�¤����ܼ�
	local Jellyfish02 = {}		--�դ����ܼ�
	local JellyfishB = { 108156 , 108159 , 108162 }
	local JellyfishW = { 108155 , 108158 , 108161 }
	local MCounter = 0			--�p�ǭp��
	local flagNum1=DW_CircleRand(24)	--�ݬ����X�ƶq����
	local BerserkCounter = 0	-------�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	
	while 1 do
		Sleep(10)
		local NabuTarget = ReadRoleValue( Nabu , EM_RoleValue_AttackTargetID )
		--local MaxHP = ReadRoleValue( Nabu , EM_RoleValue_MaxHP )					--�`��q
		--local NowHP = ReadRoleValue( Nabu , EM_RoleValue_HP )						--��e��q
		--local HPPercent = ( NowHP / MaxHP )*100									--��q�ʤ���
		if ( NabuTarget ~= 0 ) and ( CheckID( Nabu ) ) == true then
			MCounter = MCounter + 1
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Nabu , -1 , 2 , "[SC_108144_01]" , 1 )
				--�[�H���ȤH�ӳX�A[108144]���G�ä��P��N�~�C
				Entrance = CreateObjByFlag( 106239 , 781342 , 2 , 1 )		--�e���J�f
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--���i��
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--���i�I
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--��show���
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--����
				AddToPartition( Entrance , Room )
				WriteRolevalue( Nabu , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if EnterFight == 1 then
--�� �p�� ��--
				if MCounter >= 15 then
					for a = 1 , 4 do
						local Blackone = CreateObjByFlag( JellyfishB[class] , 781342 , flagNum1()+3 , 1 )--�qflag4�}�l�ت���A����RAND���]�tflag0�A�ҥH+3 �O�n���Lflag1~3
						Jellyfish01[table.getn(Jellyfish01)+1] = Blackone
						SetModeEx( Blackone , EM_SetModeType_Move , false )			--������
						AddToPartition( Blackone , Room )
						Setplot( Blackone , "dead" , "sasa_108156_Jelly" , 30 )
						WriteRolevalue( Blackone , EM_RoleValue_register1 , Nabu )
						WriteRoleValue( Blackone , EM_RoleValue_Livetime, 15 )		--�s�b���
						Sleep(1)
						local Whiteone = CreateObjByFlag( JellyfishW[class] , 781342 , flagNum1()+3 , 1 )
						Jellyfish02[table.getn(Jellyfish02)+1] = Whiteone
						SetModeEx( Whiteone , EM_SetModeType_Move , false )			--������
						AddToPartition( Whiteone , Room )
						Setplot( Whiteone , "dead" , "sasa_108156_Jelly" , 30 )
						WriteRolevalue( Whiteone , EM_RoleValue_register1 , Nabu )
						WriteRoleValue( Whiteone , EM_RoleValue_Livetime, 15 )		--�s�b���
					end
					MCounter = 0
				end
--�� �g�z ��--
				if ( BerserkCounter >= 480 and class == 1 ) 
				 or ( BerserkCounter >= 360 and class == 2 ) then		--8 min. and 6 min.
					ScriptMessage( Nabu , -1 , 2 , "[SC_108144_02]" , 1 )
					--[108144]�������M�����ܤơA�]�����Өϱo�L�ܱj�j�F�I
					if IsBerserk == 0 then
						AddBuff( Nabu , 624632 , 0 , -1 )
						--Say( Nabu , "Time ="..BerserkCounter )
						IsBerserk = 1
					end
					BerserkCounter = 0
				end
			end
		else
--�� ���m���` ��--
			if EnterFight == 1 then
				local NabuIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				if NabuIsDead ~= 1 then
					ScriptMessage( Nabu , -1 , 2 , "[SC_108144_03]" , 1 )
					--[108144]�P�줣�h�A�L�{���A�o�����԰��S�p�L����a�L��K
					if CheckID(Nabu) == true then
						DelObj(Nabu)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					for b = 1 , table.getn(Jellyfish01) do
						if CheckID(Jellyfish01[b]) == true and Jellyfish01[b] ~= nil then
							DelObj(Jellyfish01[b])
						end
					end
					for c = 1 , table.getn(Jellyfish02) do
						if CheckID(Jellyfish02[c]) == true and Jellyfish02[c] ~= nil then
							DelObj(Jellyfish02[c])
						end
					end
					--BeginPlot( Count , "sasa_108144_CancelBuff" , 0 )	--�M��BUFF
					Sleep(20)
					Nabu = CreateObjByFlag( NabuNum[class] , 781342 , 1 , 1 )
					AddToPartition( Nabu , Room )
					BeginPlot( Nabu , "sasa_108144_AI" , 0 )
					Setplot( Nabu , "dead" , "sasa_108144_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Nabu , EM_RoleValue_register1 , Count )
					WriteRoleValue( Nabu , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Nabu , EM_RoleValue_register10 , Exit )
					Jellyfish01 = {}							--�p���ܼƭ��m�k�s
					Jellyfish02 = {}							--�p���ܼƭ��m�k�s
				elseif NabuIsDead == 1 then
				--BeginPlot( Count , "sasa_108144_CancelBuff" , 0 )	--�M��BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				MCounter = 0
			end
		end
	end
end

--�� ���F ��--
function sasa_108144_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--���`���X�{�ԼT��
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_108144_04]" , 1 )
	--�̫᪺�h���ϱo[108144]�A�]�L�O�۬[�A���~�a�b���W��[209464]�]�]�����F�X�ӡK
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--Ū�X���GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--�i�D�p�ɾ�Nabu���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
	sasa_ZoneDungeon_title_01(530971)--�s���Y�칡
end

--�� �p�Ǧ��� ��--
function sasa_108156_Jelly()
	local GID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )		--�ˬd�I�k�ؼЪ�ID
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local range = 400
	local Player = SearchRangePlayer( OwnerID() , range )		--�j�M�P�򪱮a
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--Ū�X���GID
	local Buff = { 624835 , 624836 }		--�¥�--�ձm
	local element = { 624744 , 624745 }		--�O�s����--���V����
	
	if CheckBuff( Boss , Buff[1] ) == true and CheckBuff( Boss , Buff[2] ) == false
	 and ( GID == 108155 or GID == 108158 or GID == 108161 ) then	--�¥��դ���
		AddBuff( Boss , element[1] , 0 , -1 )
		for g = 0 , table.getn(Player)-1 do
			AddBuff( Player[g] , element[2] , 0 , -1 )
		end
	elseif CheckBuff( Boss , Buff[1] )	== false and CheckBuff( Boss , Buff[2] ) == true
	 and ( GID == 108156 or GID == 108159 or GID == 108162 ) then	--�ձm�¤���
		AddBuff( Boss , element[1] , 0 , -1 )
		for g = 0 , table.getn(Player)-1 do
			AddBuff( Player[g] , element[2] , 0 , -1 )
		end	
	end
end

--�� �s�� AI ��--
function sasa_108144_AI()
	local Owner = OwnerID()
	--AddBuff( Owner , 509476 , 0 , -1 )		------����Boss���}�԰��^�媺buff
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = ReadRoleValue( Owner , EM_RoleValue_register1 )
	local IconCounter = 0		--�¥��Υձm���A
	local RandCounter = 0		--5S.RAND
	local SnowCounter = 0		--�����v��
	local WaterCounter = 0		--�����V
	local Luck
	local Buff = { 624835 , 624836 }		--�¥�--�ձm
	local SW = { 851150 , 851151 }			--�����v��--�����V
	local BossTarget
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( Owner , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( Owner ) ) == true then
--�� ���Ҧ� ��--
			IconCounter = IconCounter + 1
			RandCounter = RandCounter + 1
			SnowCounter = SnowCounter + 1
			WaterCounter = WaterCounter + 1
--�� �C17�� ��--
			if WaterCounter >= 17 then
				BossTarget = Owner
				CastSpellLv( Owner , BossTarget , SW[2] , 0 )
				Sleep(5)
				WaterCounter = 0
--�� �C11�� ��--
			elseif SnowCounter >= 11 then
				BossTarget = Owner
				CastSpellLv( Owner , BossTarget , SW[1] , 0 )
				Sleep(5)
				SnowCounter = 0
--�� �C10�����A ��--
			elseif IconCounter >= 10 then
				Luck = Rand(100)
				if ( Luck >= 0 and Luck < 50 ) then
					AddBuff( Owner , Buff[1] , 0 , -1 )
				elseif ( Luck >= 50 and Luck < 100 ) then
					AddBuff( Owner , Buff[2] , 0 , -1 )
				end
				IconCounter = 0
--�� RAND ��--
			elseif RandCounter >= 5 then
				sasa_108144_Skill()
				RandCounter = 0
			end
		end
	end
end

--�� RAND SKILL ��--
function sasa_108144_Skill()
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local class
	if ZoneID == 157 or ZoneID == 940 then		--�x��--���հ�
		class = 1
	elseif ZoneID == 158 then	--���q
		class = 2
	elseif ZoneID == 159 then	--²��
		class = 3
	end
	local Skill = { 851020 , 851034 }			--���ѡB����Q�R
	local SkillLv = { 0 , 0 }
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
		CastSpellLV( OwnerID() , BossTarget , 851154 , 0 )				--�Űʧ@
		for d = 1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[d]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if class == 2 or class == 3 then		--���q+²��
			if table.getn(LuckyPlayer) >= 4 then						--�j��4�H�Nrand 4��
				for e = 1 , 4 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND�쪺�Ʀr	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--4�H�H�U�N����
				for f = 1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[f] ~= nil ) and ( ReadRoleValue( LuckyPlayer[f] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[f] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		elseif class == 1 then	--�x��+����
			if table.getn(LuckyPlayer) >= 6 then						--�j��6�H�Nrand 6��
				for e = 1 , 6 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND�쪺�Ʀr	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--6�H�H�U�N����
				for f = 1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[f] ~= nil ) and ( ReadRoleValue( LuckyPlayer[f] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[f] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end