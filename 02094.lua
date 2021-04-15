--/GM ? zone 190 0 -7249.6 104.4 -4661.1
--����I�G/GM ? zone 190 0 -7640.6 100 -3519.4
--EM_RoleValue_register1 = �p�ɾ�
--EM_RoleValue_register2 = BOSS (ball)
--EM_RoleValue_register3 = �Գ�������
--EM_RoleValue_register6 = EnterFight
--EM_RoleValue_register7 = Boss (Counter)

function lua_sasa_WorldBoss_Counter()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 104666 , 780012 , 1 , 1 )
	local ball = CreateObjByFlag( 105051 , 780012 , 1 , 1 )
	local over = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local howfar
	
	SetModeEx( ball , EM_SetModeType_HideName, true )			--�W��
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
	SetModeEx( ball , EM_SetModeType_Mark, false )				--�аO
	SetModeEx( ball , EM_SetModeType_Move , false )				--������
	SetModeEx( ball , EM_SetModeType_Searchenemy , false )		--������
	SetModeEx( ball , EM_SetModeType_Fight , false )			--�i�������
	SetModeEx( ball , EM_SetModeType_Strikback, false )			--����
	SetModeEx( ball , EM_SetModeType_NotShowHPMP , false )		--��show���

	WriteRoleValue( ball , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue( ball , EM_RoleValue_register2 , Boss )
	BeginPlot( ball , "sasa_105051_check" , 0 )
	AddToPartition( Boss , Room )
	AddToPartition( ball , Room )
	BeginPlot( Boss , "lua_sasa_WorldBoss_AI" , 0 )
	Setplot( Boss , "dead" , "lua_sasa_WorldBoss_Dead" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_register7 , Boss )
	
	local EnterFight = 0

	while 1 do
		over = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
		howfar = ReadRoleValue( OwnerID() , EM_RoleValue_register5 )
		if over == 1 then
		
		elseif over == 2 then
			DelObj( Boss )
			DelObj( ball )
		end
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if ( BossTarget ~=  0 ) and ( CheckID( Boss ) == true ) and howfar < 500 then			
			EnterFight = 1
			WriteRoleValue( OwnerID() , EM_RoleValue_register6 , 1 )
		else
			local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
			if EnterFight == 1 and BossIsDead ~= 1 then
				--local BossEnterFight = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )				
				if Boss ~= nil then
					DelObj( Boss )
					DelObj( ball )
				end			
				sleep(50)
				Boss = CreateObjByFlag( 104666 , 780012 , 1 , 1 )
				ball = CreateObjByFlag( 105051 , 780012 , 1 , 1 )
				
				SetModeEx( ball , EM_SetModeType_HideName, true )			--�W��
				SetModeEx( ball , EM_SetModeType_ShowRoleHead, false )		--���q�Y����
				SetModeEx( ball , EM_SetModeType_Mark, false )				--�аO
				SetModeEx( ball , EM_SetModeType_Move , false )				--������
				SetModeEx( ball , EM_SetModeType_Searchenemy , false )		--������
				SetModeEx( ball , EM_SetModeType_Fight , false )			--�i�������
				SetModeEx( ball , EM_SetModeType_Strikback, false )			--����
				SetModeEx( ball , EM_SetModeType_NotShowHPMP , false )		--��show���
				
				AddToPartition( Boss , Room )
				AddToPartition( ball , Room )
				WriteRoleValue( ball , EM_RoleValue_PID , OwnerID() )
				WriteRoleValue( ball , EM_RoleValue_register2 , Boss )
				BeginPlot( Boss , "lua_sasa_WorldBoss_AI" , 0 )
				BeginPlot( ball , "sasa_105051_check" , 0 )
				Setplot( Boss , "dead" , "lua_sasa_WorldBoss_dead" , 30 )
				WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
				WriteRoleValue( OwnerID() , EM_RoleValue_register7 , Boss )
				
			elseif BossIsDead == 1 then	
				WriteRoleValue( OwnerID() , EM_RoleValue_register6 , 3 )
				DelObj( ball )
				return
			end
			EnterFight = 0
			WriteRoleValue( OwnerID() , EM_RoleValue_register6 , 0 )
		end
	end
end

function lua_sasa_WorldBoss_AI()
	while 1 do
		sleep(10)
		local RandCounter = 0					--�k�O+�g�ᤧ��(�ߦ�����)
		local FinalCounter = 0					--�������r
		local ShareCounter = 0					--��K�ۮi
		local ALLCounter = 0					--���F����
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		local LuckyFarmer = {}					--���عA��X5
		local PlayerInHate1 = {}		--���aGID
		local PlayerInHate2 = {}		--���aGID
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				--local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--�`��q
				--local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--��e��q
				--local HPPercent = ( NowHP / MaxHP )*100											--��q�ʤ���
				if EnterFight == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_01]" , 1 )
					--���I�H�A�̳o���୮�S���H���ݧL����Ө�o�̡H
					EnterFight = 1
				end
				
				ShareCounter = ShareCounter + 1
				FinalCounter = FinalCounter + 1
				RandCounter = RandCounter + 1
				ALLCounter = ALLCounter + 1
				if ALLCounter >= 37 then							--���F����
					local ALL = 496336
					SysCastSpellLv( OwnerID(), OwnerID() , ALL , 2 )--(10%/100%)=30%
					ALLCounter = 0
				elseif ShareCounter >= 30 then
					local Share = 496335							--��K�ۮi
					PlayerInHate2 = {}
					PlayerInHate2 = star_HateListSort( OwnerID() )
					local RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
					while 1 do
						sleep(1)
						if ReadRoleValue( RandTarget1 , EM_RoleValue_Voc ) == 0 then
							for ii=1 , table.getn(PlayerInHate2) do
								if RandTarget1 == PlayerInHate2[ii] then
									table.remove( PlayerInHate2 , ii )	
									break	
								end	
							end
							sleep(5)	
							RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
							--Say(OwnerID() , "HateCount ="..table.getn(PlayerInHate2) )	
						else
							break
						end	
					end	
					local PlayerName = GetName( RandTarget1 )
					local MessageString = "[SC_104666_02][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
					ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
					--[$VAR1]�A���ڸոէA���h�֯�@�I
					sleep(30)
					local SharedPlayer = {}
					local TempShare = {}
					SharedPlayer = SearchRangePlayer( RandTarget1 , 80 )
					for m=0 , table.getn(SharedPlayer)-1 do							
						if ReadRoleValue( SharedPlayer[m] , EM_RoleValue_Voc ) ~= 0 				--GM�ư�
						 and GetDistance( SharedPlayer[m] , OwnerID() ) <= 600
						 and SharedPlayer[m] ~= nil												
						 and ReadRoleValue( SharedPlayer[m] , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
							TempShare[table.getn(TempShare)+1] = SharedPlayer[m]
							--table.remove( SharedPlayer , m )
						end
					end	
					local TotalDamage = 50000						--����Ʀr
					local PLV = math.floor( TotalDamage/(table.getn(TempShare)*100) )					
					CastSpellLv( OwnerID() , RandTarget1 , Share , PLV )
					for ii=1 , table.getn(TempShare) do
						--Say( OwnerID() , GetName(TempShare[ii]) )
					end
					sleep(40)
					ShareCounter = 0
				elseif FinalCounter >= 18 then
					local Final = 496332							--�ƭ�(�Űʧ@)
					PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort( OwnerID() )
					--sleep(10)
					--Say(OwnerID() , "FinalCounter ="..FinalCounter)
					LuckyFarmer = {}				--���عA��X5					
					--local Farmer = {}				--�A�ҭ�
					for i=1 , table.getn(PlayerInHate1) do
						local temp2 = PlayerInHate1[i]			 
						if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
						 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0       	--���H�ư�
						 and GetDistance( temp2 , OwnerID() ) <= 600 then				--�Z��600�H��
							LuckyFarmer[table.getn(LuckyFarmer)+1] = temp2 				--��쪺���a��iTABLE
						end	
					end
					--Say(OwnerID() , "FarmerCounter ="..table.getn(LuckyFarmer))
					if table.getn(LuckyFarmer) >= 5 then							------�j��5�H�Nrand 5��
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--�N�O�A�F�A�˷R���A��[104666]�n�n�a���o�y�O�E���a�I
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--�ƭ�(�Űʧ@)
						sleep(15)
						for j=1 , 5 do						
							local Lucky2 = Rand(table.getn(LuckyFarmer))+1						--RAND�쪺�Ʀr	
							if ( LuckyFarmer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyFarmer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "LuckyFarmer ="..LuckyFarmer[Lucky2] )
								AddBuff( LuckyFarmer[Lucky2] , 507834 , 0 , 5 )	--�������r
								AddBuff( LuckyFarmer[Lucky2] , 507835 , 0 , 7 )	--�ˬd�˼�								
							end
							table.remove(LuckyFarmer , Lucky2)
							sleep(1)														
						end	
					else													-------5�H�H�U�N����
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--�N�O�A�F�A�˷R���A��[104666]�n�n�a���o�y�O�E���a�I
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--�ƭ�(�Űʧ@)
						sleep(15)
						for l=1 , table.getn(LuckyFarmer) do	
							--Say(OwnerID() , "LuckyFarmer = "..GetName(LuckyFarmer[l]))
							if ( LuckyFarmer[l] ~= nil ) and ( ReadRoleValue( LuckyFarmer[l] , EM_RoleValue_IsDead ) == 0 ) then
								AddBuff( LuckyFarmer[l] , 507834 , 0 , 5 )	--�������r
								AddBuff( LuckyFarmer[l] , 507835 , 0 , 7 )	--�ˬd�˼�									
							end
							sleep(1)
						end
					end
					FinalCounter = 0
				elseif RandCounter >= 7 then								--�k�O+�g�ᤧ��(�ߦ�����)
					Lua_sasa_WorldSkill()
					RandCounter = 0
				end
			end
		end
	end
end


function Lua_sasa_WorldSkill()		---RAND
	local Skill = { 496330 , 496331 }		---�k�O�A�g�ᤧ��(�ߦ�����)
	local SkillLv = { 4 , 12 }				---(500+500*4)*0.78=1950 , (500/40%)=2900 , DOT(100/80%)=1060
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())
	local BossTarget
	local SkillIndex
	---local TargetTable = {}
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1	--�H���줳��������a
		BossTarget = PlayerInHate[RandTarget1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2		
		for m=1 , table.getn(PlayerInHate) do
			local temp2 = PlayerInHate[m]			 
			if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM�ư�
			 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp2 				--��쪺���a��iTABLE
			end	
		end
		--Say(OwnerID() , "Before ="..table.getn(LuckyPlayer))
		if table.getn(LuckyPlayer) >= 5 then							------�j��5�H�Nrand 5��
			for n=1 , 5 do						
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1						--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say(OwnerID() , "After ="..table.getn(LuckyPlayer))
			end	
		else													-------5�H�H�U�N����
			for p=1 , table.getn(LuckyPlayer) do				
				if ( LuckyPlayer[p] ~= nil ) and ( ReadRoleValue( LuckyPlayer[p] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[p] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end
	--Say( OwnerID() , "Nice Good job!!" )	
end

function sasa_FinalCounter()								--------�������r�ˬd�˼�
	local Pos = Lua_BuffPosSearch( OwnerID() , 507835 )		--�ˬd
	local Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
	
	if CheckBuff( OwnerID() , 507834 ) == false and Time > 2 then			--�s�򲣥�
		CancelBuff( OwnerID() , 507835 )
	elseif CheckBuff( OwnerID() , 507834 ) == false and Time <= 2 then		
		SysCastSpellLv( OwnerID() , OwnerID() , 496334 , 10 )	--�˼ƽT�{�A�I���ƭ�(10%/20%)=30% , DOT(100/50%)=600
		CancelBuff( OwnerID() , 507835 )
	end	
end

function lua_sasa_WorldBoss_dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_04]" , 1 )
	--���R���K�ᦷ�K�A�ױN�K��K�¡K
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		---Ū�X�p�ɾ�GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )				---�i�D�p�ɾ�Boss���F
	WriteRoleValue( counter , EM_RoleValue_register3 , 1 )
end

function sasa_105051_check()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local howfar = GetDistance( OwnerID(), boss )
	while 1 do
		howfar = GetDistance( OwnerID(), boss )
		sleep (10)
		--Yell( OwnerID() , "howfar="..howfar , 7 )		
		WriteRoleValue ( Counter , EM_RoleValue_Register5 , howfar )		
	end
end