
--���f�G/GM ? zone 134 0 60 685 -715
--����G/GM ? zone 134 0
--���G1�G/GM ? zone 134 0 -147.6 687.6 -720.9 Dir 180.8
--BOSS�G2�G/GM ? zone 134 0 -859.8 698.9 -507.0 Dir 21.8
--�p�ǡG3~12(10�Ӵä�)
--�_�c�G13~15(3���_�c)

--EM_RoleValue_register1�G��

function lua_sasa_104228_Boss()
	while 1 do 
		sleep(10)
		local counter1 = 0												----------07--�����y�� 
		local counter2 = 0												----------13--���Ψ�ŧ
		local counter3 = 0												----------18--�t���P
		local counter4 = 0												----------33--�ͬr
		local counter5 = 0												----------45--�٤Ѿ_�a
		local BerserkCounter = 0										----�g�ɭp��
		local IsBerserk = 0												-------�g�ɶ}��
		
		--local NextMode = ��											-------------�i�J�U�@�Ҧ�

		local Skill = { 496031 , 496030 , 496028 , 496027 }	---------------�����y�� , �t���P , �ͬr , �٤Ѿ_�a
		local SkillLv = { 0 , 6 , 0 , 0 }
		local SkillString = { "[SC_104228_01]" , "[SC_104228_02]" , "[SC_104228_03]" , "[SC_104228_04]" }
		--�U�Q���y��A�@���d���a�§Aŧ�ӡC
		--���j���u�����A�N���۱q��ӥ͡I
		--�����X���ͬr���O�M�I���H�x�C
		--����٦a�A�����s�Ӫ̪��A�A���Τ��Ө�²���ݮz�����C
		local LittleWorm1 = 103951			----------���z�p��
		local LittleWorm2 = 103952			----------��i�p��
		local LittleWorm1 = {}				----------���z�p��GID�s���
		local LittleWorm2 = {}				----------��i�p��GID�s���
		local WormSkill = 496036			----------�ηI
		local EnterFight = 0
		local Entrance = 0
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		Setplot( OwnerID() , "dead" , "lua_sasa_104228_BossDead" , 30 )
		while 1 do	
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then				
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )      --Ū���ثe��q
				local HPPercent = (NowHP / MaxHP)*100     				--��q�ʤ���
				if EnterFight == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104228_07]" , 1 )			----------�A�������B�w�S��F�ӥ��Τ���[104228]�C
					Entrance = CreateObjByFlag( 104455 , 780747 , 1 , 1 )		------���ת�
					SetModeEx( Entrance , EM_SetModeType_Move , false )			------������
					SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------������
					SetModeEx( Entrance , EM_SetModeType_Fight , false )		------���i���
					SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------������
					SetModeEx( Entrance , EM_SetModeType_Mark , false )			------���i�I��
					SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------��show���
					SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------����
					AddToPartition( Entrance , Room )
					WriteRoleValue( OwnerID() , EM_RoleValue_register1 , Entrance )
					EnterFight = 1
				end	
				counter1 = counter1 + 1												----------07--�����y��
				counter2 = counter2 + 1												----------13--���Ψ�ŧ
				counter3 = counter3 + 1												----------18--�t���P
				counter4 = counter4 + 1												----------33--�ͬr
				counter5 = counter5 + 1												----------45--�٤Ѿ_�a
				BerserkCounter = BerserkCounter + 1									---------�g�ɭp��
				local Luck = Rand( 100 )											---------�X�۶ü�
				local SkillIndex 													---------��TABLE������m
				local BossTarget = AttackTarget 									---------�sBOSS�n�����ؼ�
				if BerserkCounter >= 360 then										---------�g��
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104228_05]" , 1 )		---------�ӥ��Τ����@�ʤw�Q�i�ɡA�·t���O���{�I
					if IsBerserk == 0 then
						AddBuff( OwnerID() , 507663 , 0 , -1 ) 
						--Say( OwnerID() , "U guys r going to die!!")
						IsBerserk = 1
					end	
					BerserkCounter = 0
				elseif counter5 >= 45 then
					SkillIndex = 4
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--Say( OwnerID() , "45 got it" )
					sleep(30)
					counter5 = 0	
				elseif counter4 >= 33 then
					SkillIndex = 3
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--Say( OwnerID() , "33 ok" )
					sleep(20)
					counter4 = 0
				elseif counter3 >= 18 then
					SkillIndex = 2
					--Bosstarget = AttackTarget
					local LuckyPlayer = {}											------�s��Q�襤�����a
					local Player = {}												-------�H�����a
					local countplayer = SetSearchAllPlayer(Room)						---��o�h�����a
					for i=1 , countplayer do
						local temp = GetSearchResult()
						if ReadRoleValue(temp , EM_RoleValue_Voc) ~= 0 				--GM�ư�
						 and ReadRoleValue(temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
							Player[table.getn(Player)+1] = temp 					--��쪺���a��iTABLE
						end
					end
					--Say(OwnerID() , "Before ="..table.getn(Player))
					if table.getn(Player) >= 2 then									------�j��2�H�Nrand 2��
						CastSpellLV( OwnerID(), OwnerID() , 496034 , 0 )
						for j=1 , 2 do						
							local lucky = Rand(table.getn(Player))+1				--RAND�쪺�Ʀr	
							LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[lucky]
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							SysCastSpellLV( OwnerID(), Player[lucky] , Skill[SkillIndex] , SkillLv[SkillIndex] )
							sleep(1)
							for k=1 , table.getn(Player) do									--�}�l���RAND�쪺�Ʀr
								if Player[k] == Player[lucky] then							--��襤
									table.remove(Player , k)
								end
							end
							--Say(OwnerID() , "After ="..table.getn(Player))
						end
					else																-------2�H�H�U�N����
						--Say( OwnerID() , "Only One" )
						for l=1 , table.getn(Player) do
							LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[l]
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							SysCastSpellLv( OwnerID(), Player[l] , Skill[SkillIndex] , SkillLv[SkillIndex] )
							sleep(1)
						end
					end
					counter3 = 0
				elseif counter2 >= 13 then												--------���ΦM���o��
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104228_06]" , 1 )			--------[104228]�o�X�y�U��ժ��I�s�A�P����G���ƻ򥿦b«�ʵۡK
					for m = 1 , 2 do
						local PlayerInHate = {}
						PlayerInHate = star_HateListSort(OwnerID())
						local LuckyGuyNumber = Rand(table.getn(PlayerInHate))+1
						local flagNum1 = Rand(10)+3
						local flagNum2 = Rand(10)+3
						local BugNumber = 1
						if HPPercent <= 50 then
							BugNumber = 2
							--Say( OwnerID() , "HP ="..HPPercent )
						end
						for n = 1 , BugNumber do							
							local LittleWormTemp1 = CreateObjByFlag( 103951 , 780747 , flagNum1 , 1 )
							local LittleWormTemp2 = CreateObjByFlag( 103952 , 780747 , flagNum2 , 1 )
							if ReadRoleValue( PlayerInHate[LuckyGuyNumber] , EM_RoleValue_IsDead ) == 0 then
								LittleWorm1[table.getn( LittleWorm1 )+1] = LittleWormTemp1			--------�NGID�s�Jtable
								AddToPartition( LittleWorm1[table.getn(LittleWorm1)] , Room )
								WriteRoleValue( LittleWormTemp1 , EM_RoleValue_Livetime , 20 )
								Setplot( LittleWormTemp1 , "range" , "lua_sasa_103951_Bomb_1" , 50 )
								Setplot( LittleWormTemp1 , "dead" , "lua_sasa_103951_dead" , 30 )	
								SetAttack( LittleWormTemp1 , PlayerInHate[LuckyGuyNumber] )
								--Say( OwnerID() , "Here they're coming" )

								LittleWorm2[table.getn( LittleWorm2 )+1] = LittleWormTemp2
								AddToPartition( LittleWorm2[table.getn(littleWorm2)] , Room )
								WriteRoleValue( LittleWormTemp2 , EM_RoleValue_Livetime , 40 )
								Setplot( LittleWormTemp2 , "dead" , "lua_sasa_103952_dead" , 30 )
								CastSpellLV( LittleWormTemp2 , OwnerID() , WormSkill , 0 )
							end	
							sleep(1)
						end		
					end	
					sleep(10)
					counter2 = 0
				elseif counter1 >= 7 then
					SkillIndex = 1
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--Say( OwnerID() , "777777777" )
					sleep(10)
					counter1 = 0
				end
			else	
				if EnterFight == 1 then
					DelObj( Entrance )
					for o = 1 , table.getn(LittleWorm1) do
						if CheckID(LittleWorm1[o]) == true and LittleWorm1[o] ~= nil then
							DelObj( LittleWorm1[o] )
						end
					end
					for p = 1 , table.getn(LittleWorm2) do
						if CheckID(LittleWorm2[p]) == true and LittleWorm2[p] ~= nil then
							DelObj( LittleWorm2[p] )
						end
					end
					
					--BerserkCounter = 0
					--IsBerserk = 0
					BeginPlot(OwnerID() , "ic_nohi_18_134_03" , 0)	
					EnterFight=0
					break		------------------------���}�԰����X��e�j��A���m�Ҧ��ܼ�			
				end			
			end	
		end		
	end
end

function lua_sasa_103951_Bomb_1()				-------���z��
	BeginPlot( TargetID(), "lua_sasa_103951_Bomb_2", 1 )
	--Say( OwnerID() , "Bomb1" )
end

function lua_sasa_103951_Bomb_2()				-------���z��
	Setplot( OwnerID() , "range" , "" , 0)		-------�קK����Ĳ�o
	local Bomb = 496035							-------�������
	local Bomb2 =496164 						-------���鷴��
	CastSpellLv( OwnerID() , OwnerID() , Bomb , 0 )
	sleep(10)
	SysCastSpellLv( OwnerID() , OwnerID() , Bomb2 , 0 )
	--Say( OwnerID() , "Bomb2" )
end

function lua_sasa_103951_dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----Ū�b���@�h
	local poisonball = star_CreateObj_NoAdd( OwnerID() , 104573 , 0 , 0 , 0 , Room , 0 ) 			----�p�Ǧ����Ͳy
	local poison = 496029					----�t�F��©
	--Say( poisonball , "poison!!!" )
	SetModeEx( poisonball , EM_SetModeType_SearchenemyIgnore, true)		---���󤣷|�Q�j�M
	SetModeEx( poisonball , EM_SetModeType_HideName, true)  			---�����Y�W�O�_��ܦW��
	SetModeEx( poisonball , EM_SetModeType_HideMinimap, true)			---����O�_�b�p�a�ϤW���
	SetModeEx( poisonball , EM_SetModeType_Searchenemy, false)   		--����
	SetModeEx( poisonball , EM_SetModeType_Mark, false)					--�аO
	SetModeEx( poisonball , EM_SetModeType_Fight, false) 				--���
	SetModeEx( poisonball , EM_SetModeType_Move, false)					--����
	SetModeEx( poisonball , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( poisonball , EM_SetModeType_Strikback, false)			--����
	SetModeEx( poisonball , EM_SetModeType_Show, true)					--�q�X
	
	AddToPartition( poisonball , Room )
	WriteRoleValue( poisonball, EM_RoleValue_Livetime, 10 )				--�s�b���
	CastSpellLv( poisonball , poisonball , poison , 5 )
end

function lua_sasa_103952_dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----Ū�b���@�h
	local poisonball2 = star_CreateObj_NoAdd( OwnerID() , 104537 , 0 , 0 , 0 , Room , 0 ) 			----�p�Ǧ����Ͳy
	local poison2 = 496029					----�t�F��©
	--Say( poisonball2 , "poison!!!" )
	SetModeEx( poisonball2 , EM_SetModeType_SearchenemyIgnore, true)		---���󤣷|�Q�j�M
	SetModeEx( poisonball2 , EM_SetModeType_HideName, true)  			---�����Y�W�O�_��ܦW��
	SetModeEx( poisonball2 , EM_SetModeType_HideMinimap, true)			---����O�_�b�p�a�ϤW���
	SetModeEx( poisonball2 , EM_SetModeType_Searchenemy, false)   		--����
	SetModeEx( poisonball2 , EM_SetModeType_Mark, false)					--�аO
	SetModeEx( poisonball2 , EM_SetModeType_Fight, false) 				--���
	SetModeEx( poisonball2 , EM_SetModeType_Move, false)					--����
	SetModeEx( poisonball2 , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( poisonball2 , EM_SetModeType_Strikback, false)			--����
	SetModeEx( poisonball2 , EM_SetModeType_Show, true)					--�q�X
	
	AddToPartition( poisonball2 , Room )
	WriteRoleValue( poisonball2 , EM_RoleValue_Livetime, 10 )				--�s�b���
	CastSpellLv( poisonball2 , poisonball2 , poison2 , 5 )
end

function lua_sasa_104228_BossDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local LuckyFlag = {13 , 14 , 15}
	local LuckyNumber1 = Rand(3)+1
	--Say(TargetID() , "LuckyNumber1 ="..LuckyNumber1)
	local treasure1 = CreateObjByFlag( 104534 , 780747 , LuckyFlag[LuckyNumber1] , 1 )			----�D�����A�j�ӯ����_�c
	SetModeEx( treasure1 , EM_SetModeType_Searchenemy, false)   		--����
	SetModeEx( treasure1 , EM_SetModeType_Fight, false) 				--���
	SetModeEx( treasure1 , EM_SetModeType_Move, false)					--����
	SetModeEx( treasure1 , EM_SetModeType_Strikback, false)				--����
	AddToPartition(treasure1 , Room)
	BeginPlot( treasure1 , "lua_sasa_104534_treasure1", 0 )
	table.remove(LuckyFlag , LuckyNumber1)
	local treasure2 = CreateObjByFlag( 104535 , 780747 , LuckyFlag[1] , 1 )			----�����ΡA�j�Ӧu�@�_�c
	SetModeEx( treasure2 , EM_SetModeType_Searchenemy, false)   		--����
	SetModeEx( treasure2 , EM_SetModeType_Fight, false) 				--���
	SetModeEx( treasure2 , EM_SetModeType_Move, false)					--����
	SetModeEx( treasure2 , EM_SetModeType_Strikback, false)				--����
	AddToPartition(treasure2 , Room)
	BeginPlot( treasure2 , "lua_sasa_104534_treasure2", 0 )
	local treasure3 = CreateObjByFlag( 104536 , 780747 , LuckyFlag[2] , 1 )			----��ż�ΡA�j�Ӧu�@�_�c
	SetModeEx( treasure3 , EM_SetModeType_Searchenemy, false)   		--����
	SetModeEx( treasure3 , EM_SetModeType_Fight, false) 				--���
	SetModeEx( treasure3 , EM_SetModeType_Move, false)					--����
	SetModeEx( treasure3 , EM_SetModeType_Strikback, false)				--����
	AddToPartition(treasure3 , Room)
	BeginPlot( treasure3 , "lua_sasa_104534_treasure3", 0 )

	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	DelObj( Entrance )
end

function lua_sasa_104534_treasure1()		-----�D�_�c
	SetPlot( OwnerID() ,"touch", "sasa_104534_treasure1_open" ,40 )
end

function sasa_104534_treasure1_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
end

function lua_sasa_104534_treasure2()		-----�����_�c
	SetPlot( OwnerID() ,"touch", "sasa_104534_treasure2_open" ,40 )
end

function sasa_104534_treasure2_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local FakeBoss = star_CreateObj( OwnerID() , 104456 , 0 , 0 , 0 , Room , 0 )
end

function lua_sasa_104534_treasure3()		-----��ż�_�c
	SetPlot( OwnerID() ,"touch", "sasa_104534_treasure3_open" ,40 )
end

function sasa_104534_treasure3_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
end