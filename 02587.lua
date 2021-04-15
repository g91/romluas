--���f�G
--781069--Flag1�GGula
--781069--Flag2�G�e��
--781069--Flag3�G���
--Gula--EM_RoleValue_register1--���
--Gula--EM_RoleValue_register2--�Y�H
--Gula--EM_RoleValue_register9--Entrance
--Gula--EM_RoleValue_register10--Exit

--count--EM_RoleValue_register3--1--�j�Ԧ��`

--�� ��� ��--

function sasa_106572_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local Gula = CreateObjByFlag( 106572 , 781069 , 1 , 1 )
	AddToPartition( Gula , Room )
	BeginPlot( Gula , "sasa_106572_AI" , 0 )
	Setplot( Gula , "dead" , "sasa_106572_Dead" , 30 )
	WriteRoleValue( Gula , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781069 , 3 , 1 )	--����X�f
	SetModeEx( Exit , EM_SetModeType_Move , false )			--������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--���i��
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--���i�I
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--��show���
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--����
	AddToPartition( Exit , Room )               
	WriteRoleValue( Gula , EM_RoleValue_register10 , Exit )
	
	local EnterFight = 0
	local HPTemp = 0    --�O��������
	local GuOne = 0
	local GuTwo = 0
	local BerserkCounter = 0	-------�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( Gula , EM_RoleValue_AttackTargetID )
		local MaxHP = ReadRoleValue( Gula , EM_RoleValue_MaxHP )					--�`��q
		local NowHP = ReadRoleValue( Gula , EM_RoleValue_HP )						--��e��q
		local HPPercent = ( NowHP / MaxHP )*100										--��q�ʤ���
		
		if ( BossTarget ~= 0 ) and ( CheckID( Gula ) ) == true then
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				Cl_ACWB_BossIsDeadFlag(1)	--�i�J�԰�
				ScriptMessage( Gula , -1 , 2 , "[SC_106572_01]" , 1 )
				--�B�P�K���D�ӨӪ��K���ڹ����A�̪����D�p��K�H
				Entrance = CreateObjByFlag( 106239 , 781069 , 2 , 1 )		--�e���J�f
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--���i��
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--���i�I
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--��show���
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--����
				AddToPartition( Entrance , Room )
				WriteRolevalue( Gula , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
--�� �n�� ��--
			if BerserkCounter >= 480 then								--�g��
				ScriptMessage( Boss , -1 , 2 , "[SC_106572_06]" , 1 )
				--�@�K�ɶ��֤����աK�ݭn��h���\�I�K
				if IsBerserk == 0 then
					AddBuff( Boss , 622092 , 0 , -1 ) 
					--Say(Boss , "Time ="..BerserkCounter)
					IsBerserk = 1
				end	
				BerserkCounter = 0
			end
--�� �v���� ��--
			if EnterFight == 1 then
				if ReadRoleValue( Count , EM_RoleValue_register3 ) ~= 1 then
					if HPPercent < 80 - (20 * HPTemp) and HPTemp < 5 then
						HPTemp = HPTemp + 1
						AddBuff( Gula , 508243 , 0 , -1 )
						ScriptMessage( Gula , -1 , 2 , "[SC_106572_03]" , 1 )
						--��h�A�N��~����h�K
						Sleep(30)
						GuOne = star_CreateObj_NoAdd( Gula , 106711 , 0 , 0 , 0 , Room , 0 )
						AddToPartition( GuOne , Room )
						--BeginPlot( GuOne , "sasa_106710_GuOne" , 0 )
						--Setplot( GuOne , "dead" , "sasa_106710_GuOneDead" , 30 )
						GuTwo = star_CreateObj_NoAdd( Gula , 106710 , 0 , 0 , 0 , Room , 0 )
						AddToPartition( GuTwo , Room )
						--BeginPlot( GuTwo , "sasa_106711_GuTwo" , 0 )
						--Setplot( GuTwo , "dead" , "sasa_106711_GuTwoDead" , 30 )
					end
				end
			end
		else
--�� ���m���` ��--
			if EnterFight == 1 then
				local GulaIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				local GetBall = {}
				GetBall = SearchRangeNPC ( Count , 1000 )
				if GulaIsDead ~= 1 then
					ScriptMessage( Gula , -1 , 2 , "[SC_106572_04]" , 1 )
					--�ڡK�i�H�F�K�C�C���ɥΧa�K�O�K�K�K�K				
					Cl_ACWB_BossIsDeadFlag(2)	--�԰����m
					if CheckID(Gula) == true then
						DelObj(Gula)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end	
					local BallBox = table.getn(GetBall)
					for g = 0 , BallBox do
						if ReadRoleValue( GetBall[g] , EM_RoleValue_OrgID ) == 103436
						 or ReadRoleValue( GetBall[g] , EM_RoleValue_OrgID ) == 106711
						 or ReadRoleValue( GetBall[g] , EM_RoleValue_OrgID ) == 106710 then
							DelObj(GetBall[g])							
						end
					end
					Sleep(30)
					Gula = CreateObjByFlag( 106572 , 781069 , 1 , 1 )
					AddToPartition( Gula , Room )
					BeginPlot( Gula , "sasa_106572_AI" , 0 )
					Setplot( Gula , "dead" , "sasa_106572_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Gula , EM_RoleValue_register1 , Count )
					WriteRoleValue( Gula , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Gula , EM_RoleValue_register10 , Exit )
				elseif GulaIsDead == 1 then									---Boss���F������
					Cl_ACWB_BossIsDeadFlag(3)	--BOSS���`
					break
				end
				EnterFight = 0
				HPTemp = 0
				BerserkCounter = 0
				IsBerserk = 0
			end
		end
	end
end

--�� �j�Ԧ��F ��--
function sasa_106572_Dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_106572_05]" , 1 )
	--�áK���|�K�����K�n�j�K�n�j�ڡС�
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--Ū�X���GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--�i�D�p�ɾ�Boss���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--�� �j��AI ��--
function sasa_106572_AI()
	--AddBuff( OwnerID() , 509476 , 0 , -1 )		------����Boss���}�԰��^�媺buff
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local BlackCounter = 0					--26S.�¬}
	local BallCounter = 0					--19S.�G���H�G�y
	local RandCounter = 0					--7S.RAND
	local Ball = 498956						--�G���H�G�y
	local nothing = 498961					--�Űʧ@
	local Black = 498960					--�¬}
	local BossTarget
	local food = 0
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			BallCounter = BallCounter + 1
			RandCounter = RandCounter + 1
			BlackCounter = BlackCounter + 1
			
--�� �Y�H ��--	
			if ReadRoleValue( OwnerID() , EM_RoleValue_register2 ) > 0 and food == 0 then		
				food = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
				CastSpellLV( OwnerID() , food , 498962 , 0 )		--�I��@�ӬI�k�ɶ�1���ľW
				sleep(30)			--�����p�վ�
				CastSpellLV( OwnerID() , food , 498957 , 0 )		--�Y�F�L
				sleep(30)
				food = 0
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 0 )
--�� �¬} ��--
			elseif BlackCounter >= 26 then
				BossTarget = OwnerID()
				sleep(1)
				CastSpellLV( OwnerID() , BossTarget , Black , 4 )
				BlackCounter = 0
--�� ���y ��--
			elseif BallCounter >= 19 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_106572_02]" , 1 )
				--�N�O�A�̦n�F�I�����S�i�f���ҼˡI
				BossTarget = OwnerID()
				CastSpellLv( OwnerID() , BossTarget , nothing , 0 )					--�Űʧ@
				local Lucky01 = {}
				local PlayerInHate1 = {}
				PlayerInHate1 = star_HateListSort(OwnerID())						----���X����������a
				for ii=1 , table.getn(PlayerInHate1) do
					local temp01 = PlayerInHate1[ii]			 
					if ReadRoleValue(temp01 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
					 and ReadRoleValue(temp01 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
						Lucky01[table.getn(Lucky01)+1] = temp01 			--��쪺���a��iTABLE
					end
				end
				--Say( OwnerID() , "ball man = "..table.getn(Lucky01) )
				if table.getn(Lucky01) >= 4 then							------�j��4�H�Nrand 4��
					for jj=1 , 4 do						
						local Luckynum = Rand(table.getn(Lucky01))+1						--RAND�쪺�Ʀr	
						if ( Lucky01[Luckynum] ~= nil ) and ( ReadRoleValue( Lucky01[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
							SysCastSpellLv( OwnerID() , Lucky01[Luckynum] , Ball , 11 )
							local randtemp = rand(8)+8
							--Say( OwnerID() , "randtemp ="..randtemp )
							AddBuff( Lucky01[Luckynum] , 621790 , 0 , randtemp )
							if CheckBuff( Lucky01[Luckynum] , 621789 ) == false then
								AddBuff( Lucky01[Luckynum] , 621789, 0 , -1 )
								local crystalball = star_CreateObj_NoAdd( Lucky01[Luckynum] , 103436 , 0 , 0 , 0 , Room , 0 )
								SetModeEx( crystalball , EM_SetModeType_Move , false )			--������
								SetModeEx( crystalball , EM_SetModeType_Strikback , false )		--������
								SetModeEx( crystalball , EM_SetModeType_Searchenemy , false )	--������
								AddToPartition( crystalball , Room )
								AddBuff( crystalball , 508241 , 0 , -1 )						--�H�G,�k�N
								BeginPlot( crystalball , "sasa_106572_eatme" , 0 )
								Setplot( crystalball , "dead" , "sasa_106572_CancelBuff" , 30 )
								WriteRoleValue( crystalball , EM_RoleValue_register1 , Lucky01[Luckynum] )
								WriteRoleValue( crystalball , EM_RoleValue_register2 , OwnerID() )
							end
						end
						table.remove( Lucky01 , Luckynum )
						sleep(1)
						--Say( OwnerID() , "just, "..table.getn(Lucky01) )
					end
				else													-------4�H�H�U�N����
					for kk=1 , table.getn(Lucky01) do
						if ( Lucky01[kk] ~= nil ) and ( ReadRoleValue( Lucky01[kk] , EM_RoleValue_IsDead ) == 0 ) then
							--Say( OwnerID() , "just, "..table.getn(Lucky01) )
							SysCastSpellLv( OwnerID() , Lucky01[kk] , Ball , 11 )
							local randtemp = rand(8)+8
							AddBuff( Lucky01[kk] , 621790 , 0 , randtemp )
							if CheckBuff( Lucky01[kk] , 621789 ) == false then
								AddBuff( Lucky01[kk] , 621789 , 0 , -1 )
								local crystalball = star_CreateObj_NoAdd( Lucky01[kk] , 103436 , 0 , 0 , 0 , Room , 0 )
								SetModeEx( crystalball , EM_SetModeType_Move , false )			--������
								SetModeEx( crystalball , EM_SetModeType_Strikback , false )		--������
								SetModeEx( crystalball , EM_SetModeType_Searchenemy , false )	--������
								AddToPartition( crystalball , Room )
								AddBuff( crystalball , 508241 , 0 , -1 )						--�H�G,�k�N
								BeginPlot( crystalball , "sasa_106572_eatme" , 0 )
								Setplot( crystalball , "dead" , "sasa_106572_CancelBuff" , 30 )
								WriteRoleValue( crystalball , EM_RoleValue_register1 , Lucky01[kk] )
								WriteRoleValue( crystalball , EM_RoleValue_register2 , OwnerID() )
							end
						end
						sleep(1)
					end
				end
				BallCounter = 0
--�� RAND�o ��--
			elseif RandCounter >= 7 then
				sasa_106572_GulaSkill()
				RandCounter = 0
			end
		end
	end
end

--�� RAND 7S. SKILL ��--
function sasa_106572_GulaSkill()
	local Skill = { 498954 , 498955 }			--�c��B�@�P�c��
	local SkillLv = { 17 , 14 }
	--local SkillString = "[SC_106572_03]"
	--��h�A�N��~����h�K
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--���X����������a
	local BossTarget 											--�sBOSS�n�����ؼ�
	local SkillIndex 											--��TABLE������m
		
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		BossTarget = OwnerID()
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		CastSpellLV( OwnerID() , OwnerID() , 496190 , 0 )				--�Űʧ@
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 6 then						--�j��6�H�Nrand 6��
			for j=1 , 6 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
			end
		else														--6�H�H�U�N����
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end

--�� ���� ��--

--�� �Y�� ��--
function sasa_106572_eatme()
	local playerID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local bossID = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	while true do  
		sleep(10)
		SysCastSpellLv( OwnerID() , OwnerID() , 498958 , 14 )			----�H�G�g�V
		if CheckBuff( playerID , 621791 ) == true then
			SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------���i���						
			SetModeEx( OwnerID() , EM_SetModeType_Mark , false )		------���i�I��
			SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	--��show���
			WriteRoleValue( bossID , EM_RoleValue_register2 , playerID )
		elseif ReadRoleValue( playerID , EM_RoleValue_IsDead ) == 1 then
			delobj( OwnerID() )
		end
	end
end

--�� �MBUFF ��--
function sasa_106572_CancelBuff()												--�R��BUFF��
	local playerID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	CancelBuff( playerID , 621789 )
	CancelBuff( playerID , 621790 )
end

--[[function lua_sasa_AC_gift01()
	GiveBodyItem( OwnerID() , 726036 , 1 )
end]]--