--���f�G/GM ? Zone 147 0 -539.7 1060.1 -478.4
--781125--Flag1�GAnton
--781125--Flag2�G�e��
--781125--Flag3�G���
--781125--Flag4+5�G�X�L�I

--Anton--EM_RoleValue_register1--Count
--Anton--EM_RoleValue_register2--�P�_�Ҧ��ΡG�ᱵ1��2
--Anton--EM_RoleValue_register3--Ant01�G�Q�Y
--Anton--EM_RoleValue_register9--Entrance
--Anton--EM_RoleValue_register10--Exit

--Ant03--EM_RoleValue_register4--Anton
--Ant03--EM_RoleValue_register5--LuckyPlayer[Lucky2]

--count--EM_RoleValue_register3--1--���`

--�� ��� ��--

function sasa_107302_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local Anton = CreateObjByFlag( 107302 , 781125 , 1 , 1 )
	AddToPartition( Anton , Room )
	BeginPlot( Anton , "sasa_107302_AI" , 0 )
	Setplot( Anton , "dead" , "sasa_107302_Dead" , 30 )
	WriteRoleValue( Anton , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106236 , 781125 , 3 , 1 )	--����X�f
	SetModeEx( Exit , EM_SetModeType_Move , false )			--������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--���i��
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--���i�I
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--��show���
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--����
	AddToPartition( Exit , Room )               
	WriteRoleValue( Anton , EM_RoleValue_register10 , Exit )
	
	local EnterFight = 0
	local BerserkCounter = 0	-------�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	local Mode = 0
	local Ant1 = {}				--�Ϳ��ƪ��ܼ�
	local Ant2 = {}				--�Ϳ��ƪ��ܼ�
	local Ant3 = {}				--�h�B��
	local WakeCounter = 0		--10S.Wake
	local TakeCounter = 0		--23S.Take
	local Wake = 496406			--���
	local TakePlayer = {}
	local PlayerInHate = {}
	
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( Anton , EM_RoleValue_AttackTargetID )
		--local MaxHP = ReadRoleValue( Anton , EM_RoleValue_MaxHP )					--�`��q
		--local NowHP = ReadRoleValue( Anton , EM_RoleValue_HP )						--��e��q
		--local HPPercent = ( NowHP / MaxHP )*100										--��q�ʤ���
		if ( BossTarget ~= 0 ) and ( CheckID( Anton ) ) == true then
			BerserkCounter = BerserkCounter + 1
			WakeCounter = WakeCounter + 1
			TakeCounter = TakeCounter + 1
			if EnterFight == 0 then											--�i�J�԰�
				ScriptMessage( Anton , -1 , 2 , "[SC_106382_01]" , 1 )
				--�L���S�L�Ϊ��o���A�����N�O�A�̡H
				Mode = 1
				WriteRoleValue( Anton , EM_RoleValue_register2 , 1 )		--1 = Mode1
				Entrance = CreateObjByFlag( 106236 , 781125 , 2 , 1 )		--�e���J�f
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--���i��
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--���i�I
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--��show���
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--����
				AddToPartition( Entrance , Room )
				WriteRolevalue( Anton , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if EnterFight == 1 then
--�� �g�z ��--
				if BerserkCounter >= 480 then								--8 min.
					ScriptMessage( Anton , -1 , 2 , "[SC_106382_02]" , 1 )
					--�ڭn�D�_�A�̪������A�M�����׹ΡI
					if IsBerserk == 0 then
						AddBuff( Anton , 508349 , 0 , -1 ) 
						--Say(Anton , "Time ="..BerserkCounter)
						IsBerserk = 1
					end	
					BerserkCounter = 0
				end
--�� �飼 ��--
				if TakeCounter >= 23 then
					PlayerInHate = star_HateListSort(Anton)						--���X����������a
					--Say( Anton , "check time =".. TakeCounter )
					for vv = 1 , table.getn(PlayerInHate) do
						local temp = PlayerInHate[vv]
						if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
						 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
							TakePlayer[table.getn(TakePlayer)+1] = temp 			--��쪺���a��iTABLE
						end
					end
					if table.getn(TakePlayer) >= 1 then						--�j��1�H�Nrand 1��
						for xx = 1 , 1 do
							local Lucky = Rand(table.getn(TakePlayer))+1		--RAND�쪺�Ʀr	
							if ( TakePlayer[Lucky] ~= nil ) and ( ReadRoleValue( TakePlayer[Lucky] , EM_RoleValue_IsDead ) == 0 ) then
								local Ant03 = CreateObjByFlag( 107303 , 781125 , 4 , 1 )
								Ant3[table.getn( Ant3 )+1] = Ant03
								SetModeEx( Ant03 , EM_SetModeType_Strikback , false )		--������
								SetModeEx( Ant03 , EM_SetModeType_Searchenemy , false )		--������
								AddToPartition( Ant03 , Room )
								BeginPlot( Ant03 , "sasa_107303_takeaway" , 0 )
								--Setplot( Ant03 , "collision" , "sasa_106383_takeaway" , 20 )
								Setplot( Ant03 , "dead" , "sasa_107303_Dead" , 30 )
								SetAttack( Ant03 , TakePlayer[Lucky] )
								WriteRoleValue( Ant03 , EM_RoleValue_register4 , Anton )
								WriteRoleValue( Ant03 , EM_RoleValue_Register5 ,  TakePlayer[Lucky] )
								Sleep(10)
							end
							table.remove( TakePlayer , Lucky )
							sleep(1)
							--Say( Anton , "u r"..table.getn(TakePlayer) )
						end
					--[[else														--1�H�H�U�N����
						for yy=1 , table.getn(TakePlayer) do
							if ( TakePlayer[yy] ~= nil ) and ( ReadRoleValue( TakePlayer[yy] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( Anton , "I got "..table.getn(TakePlayer) )
								local Ant03 = CreateObjByFlag( 107303 , 781125 , 4 , 1 )
								Ant3[table.getn( Ant3 )+1] = Ant03
								SetModeEx( Ant03 , EM_SetModeType_Strikback , false )		--������
								SetModeEx( Ant03 , EM_SetModeType_Searchenemy , false )		--������
								AddToPartition( Ant03 , Room )
								BeginPlot( Ant03 , "sasa_107303_takeaway" , 0 )
								--Setplot( Ant03 , "collision" , "sasa_106383_takeaway" , 20 )
								Setplot( Ant03 , "dead" , "sasa_107303_Dead" , 30 )
								SetAttack( Ant03 , TakePlayer[yy] )
								WriteRoleValue( Ant03 , EM_RoleValue_register4 , Anton )
								WriteRoleValue( Ant03 , EM_RoleValue_Register5 ,  TakePlayer[yy] )
								Sleep(10)
							end
						end]]--
					end
					TakeCounter = 0
--�� ����p�� ��--
				elseif WakeCounter >= 10 then
					BossTarget = Anton
					CastSpellLv( Anton , BossTarget , Wake , 0 )
					Sleep(10)
					--Say( Anton , table.getn( Ant1 ) )	
					if table.getn( Ant1 ) < 2 then
						for d = 1 , 1 do
							local Ant01 = CreateObjByFlag( 107305 , 781125 , 4 , 1 )
							Ant1[table.getn( Ant1 )+1] = Ant01
							AddToPartition( Ant01 , Room )
							BeginPlot( Ant01 , "sasa_107305_Eaten" , 0 )
							--Setplot( Ant01 , "dead" , "sasa_106387_Dead" , 30 )
							WriteRoleValue( Anton , EM_RoleValue_register3 , Ant01 )
							Sleep(10)
							local Ant02 = CreateObjByFlag( 107304 , 781125 , 5 , 1 )
							Ant1[table.getn( Ant1 )+1] = Ant02
							AddToPartition( Ant02 , Room )
							BeginPlot( Ant02 , "sasa_107304_poison" , 0 )
							Sleep(10)
						end
					elseif table.getn( Ant1 ) >= 2 then								--�W�L4�����ƴN�ˬd���Ʀ��F�S�A�⦺�����qAnt1������
						for z=1 , table.getn( Ant1 ) do
							if Ant1[z] ~= nil then
								if CheckID(Ant1[z]) == false or 
								 ReadRoleValue( Ant1[z] , EM_RoleValue_IsDead ) == 1 then
									table.remove( Ant1 , z )
									--Say( Anton , table.getn( Ant1 ) )
									sleep(1)
								end
							end	
						end	
					end	
					WakeCounter = 0
				end
			end
--�� �Ҧ��@ ��--
			if Mode == 1 then												----�Ҧ�=1

			--elseif Mode == 2 then											----�Ҧ�=2
			end
--�� ���m���` ��--
		else
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				if BossIsDead ~= 1 then
					ScriptMessage( Anton , -1 , 2 , "[SC_106382_03]" , 1 )
					--�u�^�h�άO�K�������K���I�ڧѤF���ۧA�̱N�|�Ͱ��L�s�K
					if CheckID(Anton) == true then
						DelObj(Anton)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					for e = 1 , table.getn(Ant1) do
						if CheckID(Ant1[e]) == true and Ant1[e] ~= nil then
							DelObj( Ant1[e] )
						end
					end
					--for f = 1 , table.getn(Ant2) do
						--if CheckID(Ant2[f]) == true and Ant2[f] ~= nil then
							--DelObj( Ant2[f] )
						--end
					--end
					for jj = 1 , table.getn(Ant3) do
						if CheckID(Ant3[jj]) == true and Ant3[jj] ~= nil then
							DelObj( Ant3[jj] )
						end
					end
					--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--�M��BUFF
					Sleep(20)
					Anton = CreateObjByFlag( 107302 , 781125 , 1 , 1 )
					AddToPartition( Anton , Room )
					BeginPlot( Anton , "sasa_107302_AI" , 0 )
					Setplot( Anton , "dead" , "sasa_107302_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Anton , EM_RoleValue_register1 , Count )
					WriteRoleValue( Anton , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Anton , EM_RoleValue_register10 , Exit )
					Ant1 = {}													--���ƭ��m�k�s
					Ant2 = {}
					Ant3 = {}
					TakePlayer = {}
				elseif BossIsDead == 1 then
				--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--�M��BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				WakeCounter = 0
				TakeCounter = 0
			end
		end
	end
end

--�� �w�F�����F ��--
function sasa_107302_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--���`���X�{�ԼT��
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_04]" , 1 )
	--�k���A��P�ڧ�h���͡K�R�K�I
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--Ū�X���GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--�i�D�p�ɾ�Boss���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--�� �w�F��AI ��--
function sasa_107302_AI()
	--AddBuff( OwnerID() , 509476 , 0 , -1 )		------����Boss���}�԰��^�媺buff
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local TMode = 0						--�P�_�Ҧ�
	local RandCounter = 0				--7S.RAND
	local WindCounter = 0				--16S.Wind
	local Wind = 496405					--�I���a�v
	local Swind = 496409				--�I��
	local BossTarget
	local food = 0						--����
	local back = 506508					--�����^�X

	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			TMode = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
--�� �Ҧ��@ ��--
			if TMode == 1 then
				RandCounter = RandCounter + 1
				WindCounter = WindCounter + 1
--�� �Y�Y���� ��--	
				if ReadRoleValue( OwnerID() , EM_RoleValue_register3 ) > 0 and food == 0 then		
					food = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
					CastSpellLV( OwnerID() , food , Swind , 0 )		--�I��@�ӬI�k�ɶ�1���ľW
					sleep(30)			--�����p�վ�
					DelObj( EM_RoleValue_register3 )				--�Y�F�L
					sleep(30)
					AddBuff( OwnerID() , back , 0 , 10 )
					food = 0
					WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 0 )
--�� AE ��--
				elseif WindCounter >= 16 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_05]" , 1 )
					--�C�C�ӡA�O��I
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , Wind , 11 )		--�I���a�v
					Sleep(10)
					WindCounter = 0
--�� RAND ��--
				elseif RandCounter >= 7 then
					sasa_107302_AntonSkill()
					RandCounter = 0
				end
			end
		end
	end
end

--�� RAND 7S. SKILL ��--
function sasa_107302_AntonSkill()
	local Skill = { 496328 , 496404 }			--�I���ٱ��B�I��G
	local SkillLv = { 12 , 15 }
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
		BossTarget = OwnerID()
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		BossTarget = OwnerID()
		CastSpellLV( OwnerID() , BossTarget , 496519 , 0 )				--�Űʧ@
		for a=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[a]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 3 then						--�j��3�H�Nrand 3��
			for b=1 , 3 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
			end
		else														--3�H�H�U�N����
			for c=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[c] ~= nil ) and ( ReadRoleValue( LuckyPlayer[c] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[c] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end

--�� �r���� ��--
function sasa_107304_poison()
	sleep(10)
	local PoisonCount = 0
	local AntTarget
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			PoisonCount = PoisonCount + 1
			if PoisonCount >= 6 then
				AntTarget = OwnerID()
				if 	( AntTarget ~= nil) 
				 and ( ReadRoleValue( AntTarget , EM_RoleValue_IsDead ) == 0 ) then
					CastSpellLV( OwnerID() , AntTarget , 496407 , 7 )				--�G�k�H�G
					Sleep(10)
				end
				PoisonCount = 0
			end
		end
	end
end

--�� �j�j�u���� ��--
function sasa_107305_Eaten()
	sleep(10)
	local EatenCount = 0
	local AntTarget
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--�����ؼ�
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			EatenCount = EatenCount + 1
			if EatenCount >= 10 then
				AntTarget = OwnerID()
				if 	( AntTarget ~= nil) 
				 and ( ReadRoleValue( AntTarget , EM_RoleValue_IsDead ) == 0 ) then
					AddBuff( AntTarget , 506507 , 0 , -1 )							--��������
					Sleep(10)
				end
				EatenCount = 0
			end
		end
	end
end

--�� �h�a�u���� ��--
function sasa_107303_takeaway()
	sleep(10)
	local Ant = OwnerID()
	local RoomID = ReadRoleValue( Ant , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( Ant , EM_RoleValue_register4 )
	local takeplayer =  ReadRoleValue( Ant , EM_RoleValue_register5 )
	local Flag = 781125
	local LuckyPlayer = {}
	local PlayerInHate = {}
	WriteRoleValue( Ant , EM_RoleValue_Livetime, 18 )			--�s�b���
	while 1 do
		sleep(10)
		--Say( OwnerID() , "3p is = "..table.getn(LuckyPlayer) )
		if GetDistance( Ant , takeplayer ) <= 20 then
			if ( takeplayer ~= nil ) and ( ReadRoleValue( takeplayer , EM_RoleValue_IsDead ) == 0 ) then
				sleep(5)
				Addbuff ( Ant , 622091 , 0 , -1 )					--���Ʒh��
				Addbuff ( takeplayer , 507954 , 14 , 11 )	--�Ѭr
				PlayMotionex ( Ant , ruFUSION_MIME_CARRY_BEGIN , ruFUSION_MIME_CARRY_LOOP )
				sleep(5)
				local Obj = Role:new( takeplayer ) 
				local BaseX = Obj :X()
				local BaseY = Obj :Y()
				local BaseZ = Obj :Z()
				local BaseDir = Obj:Dir()
				--AttachObj( takeplayer , Ant, 1 , "p_hit_point01" , "p_top" ) 
				SetDefIdleMotion( Ant , ruFUSION_MIME_CARRY_LOOP )
				SetPos( takeplayer , BaseX , BaseY +22 , BaseZ , BaseDir )
				PlayMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_BEGIN )
				PlayMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_LOOP )
				--SetDefIdleMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_LOOP )
				--LuaFunc_MoveToFlag( Ant, Flag , 1 , 10 )
				sleep(100)									--��_�Ӫ��ɶ�
				PlayMotion( Ant , ruFUSION_ACTORSTATE_CARRY_END )
				sleep(5)
				CancelBuff( Ant , 622091 )							--���Ʒh��
				sleep(10)
				PlayMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_END )
				--SetDefIdleMotion( takeplayer , ruFUSION_MIME_IDLE_STAND )
				SetPos( takeplayer , BaseX , BaseY , BaseZ , BaseDir )
				CancelBuff( takeplayer , 507954 )			--�Ѭr
				--DetachObj(takeplayer)
				SetDefIdleMotion( Ant , ruFUSION_MIME_IDLE_STAND )
				killID( Ant , takeplayer )
				sleep(1)
				killID( Ant , Ant )
				--SysCastSpellLv( OwnerID() , takeplayer , Skill[SkillIndex] , SkillLv[SkillIndex] )
			end
		end	
		sleep(1)
		--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
	end
end

function sasa_107303_Dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local GoDie = ReadRoleValue( OwnerID() , EM_RoleValue_register5 )	--Ū�X���a
	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	if CheckBuff( GoDie , 507954 ) == true then
		SetPos( GoDie , BaseX , BaseY , BaseZ , BaseDir )
		CancelBuff( GoDie , 507954 )			--�Ѭr
	end
end