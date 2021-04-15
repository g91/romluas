--/GM ? zone 191 0 1590 1 -1219
--EM_RoleValue_register1--���
--EM_RoleValue_register2--BOSS
--EM_RoleValue_register3--BOSSII
--EM_RoleValue_register4--BOSSIII
--EM_RoleValue_register5--�Ҧ�
--EM_RoleValue_register9--Entrance
--EM_RoleValue_register10--Exit
--flag01�GBOSS
--flag02�GBOSSII
--flag03�GBOSSIII
--flag04�GExit
--flag05�GEntrance
--SC_104667_

function lua_sasa_WorldBossII_Counter()
	local Mode = 0				-------�P�_�Ҧ���
	local Mode1Buff = 508112	-------�Ҧ�1-����BUFF
	local BerserkCounter = 0	-------�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 104667 , 780829 , 1 , 1 )
	AddToPartition( Boss , Room )
	BeginPlot( Boss , "lua_sasa_WorldBossII_AI" , 0 )
	Setplot( Boss , "dead" , "lua_sasa_WorldBossII_Dead" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
	
	local BossII = CreateObjByFlag( 104669 , 780829 , 2 , 1 )
	AddToPartition( BossII , Room )
	BeginPlot( BossII , "lua_sasa_WorldBossII_AI02" , 0 )
	Setplot( BossII , "dead" , "lua_sasa_WorldBossII_dead02" , 30 )
	WriteRoleValue( BossII , EM_RoleValue_register1 , OwnerID() )
	WriteRoleValue( BossII , EM_RoleValue_register2 , Boss )
	
	local BossIII = CreateObjByFlag( 104669 , 780829 , 3 , 1 )
	AddToPartition( BossIII , Room )
	BeginPlot( BossIII , "lua_sasa_WorldBossII_AI03" , 0 )
	Setplot( BossIII , "dead" , "lua_sasa_WorldBossII_dead03" , 30 )
	WriteRoleValue( BossIII , EM_RoleValue_register1 , OwnerID() )
	WriteRoleValue( BossIII , EM_RoleValue_register2 , Boss )

	local Exit = CreateObjByFlag( 104671 , 780829 , 4 , 1 )		-----���ת�(�X�f)
	SetModeEx( Exit , EM_SetModeType_Move , false )				------������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )		------������
	SetModeEx( Exit , EM_SetModeType_Fight , false )			------���i���
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )		------������
	SetModeEx( Exit , EM_SetModeType_Mark , false )				------���i�I��
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )		------��show���
	SetModeEX( Exit , EM_SetModeType_Obstruct , true )			------����
	AddToPartition( Exit , Room )
	WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
	
	WriteRoleValue( Boss , EM_RoleValue_register3 , BossII )
	WriteRoleValue( Boss , EM_RoleValue_register4 , BossIII )
	
	local Broken01
	local Broken02
	
	local Entrance = 0
	local EnterFight = 0
	local BossIIDead = 0
	local BossIIIDead = 0
	
	while 1 do
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if  ( BossTarget ~= 0 ) and ( CheckID( Boss ) ) == true then
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Boss , -1 , 2 , "[SC_104667_01]" , 1 )
				--�զ����J���g�k���{�A���`���n�O�A�̪��X�f�I
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register5 , 1 )			--1=Mode1
				
				Entrance = CreateObjByFlag( 104671 , 780829 , 5 , 1 )		-----���ת�(�J�f)
				SetModeEx( Entrance , EM_SetModeType_Move , false )			------������
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------������
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			------���i�I��
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------��show���
				SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------����
				AddToPartition( Entrance , Room )
				WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if BerserkCounter >= 480 then								--�g��
				ScriptMessage( Boss , -1 , 2 , "[SC_104667_07]" , 1 )
				--�ڡI�q�q�������a�I�A�̮��O�ڤӦh�ɶ��F�I
				if IsBerserk == 0 then
					AddBuff( Boss , 508659 , 0 , -1 ) 
					--Say(Boss , "Time ="..BerserkCounter)
					IsBerserk = 1
				end	
				BerserkCounter = 0
			end
			if Mode == 1 then												----�Ҧ�=1
				AddBuff( Boss , Mode1Buff , 0 , -1 )
				if ReadRoleValue( Boss , EM_RoleValue_register3 ) == 4
				 and BossIIDead == 0 then
					Broken01 = star_CreateObj_NoAdd( BossII , 117231 , 0 , 0 , 0 , Room , 0) 	----�����ʹ���
					SetModeEx( Broken01 , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
					SetModeEx( Broken01 , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
					SetModeEx( Broken01 , EM_SetModeType_Searchenemy, false )   	--����
					SetModeEx( Broken01 , EM_SetModeType_Fight, false ) 			--���
					SetModeEx( Broken01 , EM_SetModeType_Move, false )				--����
					SetModeEx( Broken01 , EM_SetModeType_ShowRoleHead, true )
					SetModeEx( Broken01 , EM_SetModeType_NotShowHPMP , false )		--��show���
					SetModeEx( Broken01 , EM_SetModeType_Strikback, false )			--����
					SetModeEx( Broken01 , EM_SetModeType_Show, true )				--�q�X
					AddToPartition( Broken01 , Room )
					BeginPlot( Broken01 , "lua_sasa_117231_AI" , 0 )
					--Say ( Broken01 , "start stone AI" )
					BossIIDead = 1
				end
				if ReadRoleValue( Boss , EM_RoleValue_register4 ) == 4 
				 and BossIIIDead == 0 then
					Broken02 = star_CreateObj_NoAdd( BossIII , 117231 , 0 , 0 , 0 , Room , 0) 	----�����ʹ���
					SetModeEx( Broken02 , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
					SetModeEx( Broken02 , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
					SetModeEx( Broken02 , EM_SetModeType_Searchenemy, false )   	--����
					SetModeEx( Broken02 , EM_SetModeType_Fight, false ) 			--���
					SetModeEx( Broken02 , EM_SetModeType_Move, false )				--����
					SetModeEx( Broken02 , EM_SetModeType_ShowRoleHead, true )
					SetModeEx( Broken02 , EM_SetModeType_NotShowHPMP , false )		--��show���
					SetModeEx( Broken02 , EM_SetModeType_Strikback, false )			--����
					SetModeEx( Broken02 , EM_SetModeType_Show, true )				--�q�X
					AddToPartition( Broken02 , Room )
					BeginPlot( Broken02 , "lua_sasa_117231_AI" , 0 )
					--Say ( Broken02 , "start stone AI" )
					BossIIIDead = 1
				end
				if ReadRoleValue( Boss , EM_RoleValue_register3 ) == 4
				 and ReadRoleValue( Boss , EM_RoleValue_register4 ) == 4 then
					ScriptMessage( Boss , -1 , 2 , "[SC_104667_02]" , 1 )
					--���۶q�O�I�ڭn�A�̳q�q�I�X�N���I�I
					CancelBuff( Boss , Mode1Buff )
					Mode = 2
				end
			--elseif Mode == 2 then											----�Ҧ�=2	
			end
		else
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				if BossIsDead ~= 1 then
					if CheckID(Boss) == true then
						DelObj(Boss)
					end
					if Broken01 ~= nil then
						DelObj(Broken01)
					end
					if Broken02 ~= nil then
						DelObj(Broken02)
					end
					if CheckID(BossII) == true then
						DelObj(BossII)
					end
					if CheckID(BossIII) == true then
						DelObj(BossIII)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end	
					sleep(50)
					Boss = CreateObjByFlag( 104667 , 780829 , 1 , 1 )
					AddToPartition( Boss , Room )
					BeginPlot( Boss , "lua_sasa_WorldBossII_AI" , 0 )
					Setplot( Boss , "dead" , "lua_sasa_WorldBossII_Dead" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
					
					BossII = CreateObjByFlag( 104669 , 780829 , 2 , 1 )
					AddToPartition( BossII , Room )
					BeginPlot( BossII , "lua_sasa_WorldBossII_AI02" , 0 )
					Setplot( BossII , "dead" , "lua_sasa_WorldBossII_dead02" , 30 )
					WriteRoleValue( BOSSII , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( BossII , EM_RoleValue_register2 , Boss )
					
					BossIII = CreateObjByFlag( 104669 , 780829 , 3 , 1 )
					AddToPartition( BossIII , Room )
					BeginPlot( BossIII , "lua_sasa_WorldBossII_AI03" , 0 )
					Setplot( BossIII , "dead" , "lua_sasa_WorldBossII_dead03" , 30 )
					WriteRoleValue( BossIII , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( BossIII , EM_RoleValue_register2 , Boss )
					
					WriteRoleValue( Boss , EM_RoleValue_register3 , BossII )
					WriteRoleValue( Boss , EM_RoleValue_register4 , BossIII )
					BossIIDead = 0
					BossIIIDead = 0
				elseif BossIsDead == 1 then										---Boss���F������
					if Broken01 ~= nil then
						DelObj(Broken01)
					end
					if Broken02 ~= nil then
						DelObj(Broken02)
					end
					return
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
			end
		end
	end
end

function lua_sasa_WorldBossII_dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104667_03]" , 1 )
	--���K�S�Ϊ��K�Y�ϱ��F�ڡK�A�̡K�]�K�L�kĹ�L�K�K�o�K
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		---Ū�X���GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )					---�i�D�p�ɾ�Boss���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )	
	DelObj( Entrance )
	DelObj( Exit )
end

function lua_sasa_WorldBossII_dead02()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---Ū�XBoss GID
	WriteRoleValue( Boss , EM_RoleValue_register3 , 4 )						---�i�DBoss BossII���F
end

function lua_sasa_WorldBossII_dead03()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---Ū�XBoss GID
	WriteRoleValue( Boss , EM_RoleValue_register4 , 4 )						---�i�DBoss BossIII���F
end

function lua_sasa_WorldBossII_AI()
	while 1 do
		sleep(10)
		local RandCounter = 0					--7S.RAND 2 ��
		local ClawCounter = 0					--16S.�R�b��
		local WindCounter = 0					--26S.���b�fŧ
		local Skill = { 496524 , 496525 }		--�R�b�� , ���b�fŧ
		local SkillLv = { 24 , 11 }
		local SkillString = { "[SC_104667_04]" , "[SC_104667_05]" }
		--�L�઺�z�̡A�A�̤]���L�p���Ӥw�I
		--���ڡK���o�ǷM�����D�A�ϧܧڷ|������˪��U���I
		local SkillIndex 						--��TABLE������m
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				
				WindCounter = WindCounter + 1
				ClawCounter = ClawCounter + 1
				RandCounter = RandCounter + 1
				
				if WindCounter >= 26 then
					SkillIndex = 2
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					sleep(1)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					sleep(40)
					WindCounter = 0
				elseif ClawCounter >= 16 then
					SkillIndex = 1
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					sleep(10)
					ClawCounter = 0
				elseif RandCounter >= 7 then
					Lua_sasa_WorldIISkill()
					RandCounter = 0
				end
			end
		end
	end
end

function lua_sasa_WorldBossII_AI02()
	while 1 do
		sleep(10)
		local Cross01Counter = 0				--�Q�r�_�C+�ڰj
		local Cross01 = 496844					--9S.�Q�r�_�C+�ڰj
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				Cross01Counter = Cross01Counter + 1
				
				if Cross01Counter >= 9 then
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
					--Say( OwnerID() , "I got u, "..table.getn(Lucky01) )
					if table.getn(Lucky01) >= 4 then							------�j��4�H�Nrand 4��
						for jj=1 , 4 do						
							local Luckynum = Rand(table.getn(Lucky01))+1						--RAND�쪺�Ʀr	
							if ( Lucky01[Luckynum] ~= nil ) and ( ReadRoleValue( Lucky01[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
								SysCastSpellLv( OwnerID() , Lucky01[Luckynum] , Cross01 , 9 )
							end
							table.remove( Lucky01 , Luckynum )
							sleep(1)
							--Say( OwnerID() , "just, "..table.getn(Lucky01) )
						end
					else													-------4�H�H�U�N����
						for kk=1 , table.getn(Lucky01) do
							if ( Lucky01[kk] ~= nil ) and ( ReadRoleValue( Lucky01[kk] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "just, "..table.getn(Lucky01) )
								SysCastSpellLv( OwnerID() , Lucky01[kk] , Cross01 , 9 )
							end
							sleep(1)
						end
					end
					Cross01Counter = 0
				end
			end
		end
	end
end

function lua_sasa_WorldBossII_AI03()
	while 1 do
		sleep(10)
		local Cross02Counter = 0				--�Q�r�_��+�z��
		local Cross02 = 496676					--13S.�Q�r�_��+�z��
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--�����ؼ�
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				Cross02Counter = Cross02Counter + 1
				
				if Cross02Counter >= 13 then
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
					if table.getn(Lucky02) >= 4 then							------�j��4�H�Nrand 4��
						for mm=1 , 4 do						
							local Luckynum02 = Rand(table.getn(Lucky02))+1						--RAND�쪺�Ʀr	
							if ( Lucky02[Luckynum02] ~= nil ) and ( ReadRoleValue( Lucky02[Luckynum02] , EM_RoleValue_IsDead ) == 0 ) then
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , Cross02 , 19 )
							end
							table.remove( Lucky02 , Luckynum02 )
							sleep(1)
							--Say( OwnerID() , "run, "..table.getn(Lucky02) )
						end
					else													-------4�H�H�U�N����
						for nn=1 , table.getn(Lucky02) do
							if ( Lucky02[nn] ~= nil ) and ( ReadRoleValue( Lucky02[nn] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "run, "..table.getn(Lucky02) )
								SysCastSpellLv( OwnerID() , Lucky02[nn] , Cross02 , 19 )
							end
							sleep(1)
						end
					end
					Cross02Counter = 0
				end
			end
		end
	end
end

function lua_sasa_117231_AI()
	local LightCounter = 0				--����
	local Light = 508524				--����
	local StoneSkill = 496675			--�ݯd���l��
	while 1 do
		sleep(10)		
		LightCounter = LightCounter +1
		--Say ( OwnerID() , "outside touch AI" )
		if LightCounter == 10 then
			AddBuff( OwnerID() , Light , 0 , -1 )
			Setplot( OwnerID() , "touch" , "sasa_touch_Broken01" , 30 )
			--Say ( OwnerID() , "Set touch AI" )
		elseif LightCounter >= 15 then
			if CheckBuff( OwnerID() , 508487 ) == false then
				CancelBuff( OwnerID() , Light )
				SysCastSpellLv( OwnerID() , OwnerID() , StoneSkill , 9 )
			end
			LightCounter = 0
			Setplot( OwnerID() , "touch" , "" , 30 )
		end
	end
end

function Lua_sasa_WorldIISkill()		-----Boss RAND 
	local Skill = { 496522 , 496523 }		-----�Q�r�_�C(�Ĥ@����) 	--�ձ٭�
	local SkillLv = { 49 , 16 }
	--local SkillString = { "[]" , "[]" }
	local Luck = Rand(100)													----���üƩ�ޯ�
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())						----���X����������a
	local BossTarget 														----�sBOSS�n�����ؼ�
	local SkillIndex 														----��TABLE������m

	if (Luck >= 0 and Luck < 50) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]			 
			if ReadRoleValue(temp , EM_RoleValue_Voc) ~= 0 				--GM�ư�
			 and ReadRoleValue(temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "Before ="..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 4 then							------�j��4�H�Nrand 4��
			for j=1 , 4 do						
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1						--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "After ="..table.getn(LuckyPlayer) )
			end
		else													-------4�H�H�U�N����
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "all ="..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )		--�۸�(����,-1=���Ϫ��a,2=����ĵ�i(���|�Q�~��)
	--Yell( OwnerID() , SkillString[SkillIndex] , 5 ),�t�@�س۸�,�i�H�]�d��
end

function sasa_touch_Broken01()
	local StoneBuff = 508113		--����ûR
	local Check = 508487
	local Light = 508524			--����
	
	if CheckBuff( OwnerID() , StoneBuff ) == false then
		BeginPlot( TargetID() , "sasa_touch_Broken02" , 0 )
		AddBuff( TargetID() , Check , 0 , 6 )
		AddBuff( OwnerID() , StoneBuff , 0 , 40 )
		CancelBuff( TargetID() , Light )
		--Say ( OwnerID() , "touch ok" )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_104667_06]" , "0xFFF00000" )
		--��q�z�Z�L�ġI
	end	
end

function sasa_touch_Broken02()
	Setplot( OwnerID() , "touch" , "" , 0 )	
end

--function sasa_Broken03()
	--local Stone2Buff = 505797
	--local Check2 = 
	--BeginPlot( TargetID() , "sasa_Broken04" , 0 )
	--AddBuff( TargetID() , Check2 , 0 , 5 )
	--AddBuff( OwnerID() , Stone2Buff , 0 , -1 )
--end

--function sasa_Broken04()
	--Setplot( OwnerID() , "touch" , "" , 0 )	
--end