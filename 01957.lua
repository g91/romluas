--���f�G/GM ? zone 133 0 -571 343 1709
--����G/GM ? zone 133 0 -181.8 414.4 2060.7
--��W�G-422.1 , 640.5 , 2233.4 , 106.2
--����+��c�z���y�G1
--�p�ǡG2~21
--�e���G22
--����G23�G-343.1 371.9 2409.8-106.7
--Boss , EM_RoleValue_register1	---���q
--Boss , EM_RoleValue_register2	---�O�_�٦��H�i�H��
--Boss , EM_RoleValue_register7 ---�e��
--Boss , EM_RoleValue_register8 ---���
--Boss , EM_RoleValue_register9	---counter
--Boss , EM_RoleValue_register10 ---Boss�O�_�i�J�L�԰�

function lua_sasa_104168_Counter()			--�Ҧ��p�ɾ�
	local counter1 = 0			-------���q1�p��
	local counter2 = 0
	local BerserkCounter = 0	----�g�ɭp��
	local IsBerserk = 0			-------�g�ɶ}��
	local Mode = 0				-------�P�_�Ҧ���
	local ModeTime1 = 56		-------�Ҧ�1�ɶ����j
	local Mode2Buff = 507358	-------�Ҧ�2��BUFF	
	local skill2 = 495985		-------�o���U�l
	local skill3 = 495986		-------��c�u�@(�¯S��)
	local skill5 = 495992		-------���a�ЮJ(��U�Ӫ��S��)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local SearchPlayer = {}
	local SearchCounter = 0
	local AnotherTarget = 0
	local Boss = 0
	local SecondBoss = 0
	local Entrance = 0
	
	local Flower = CreateObj ( 104173 , -422.1 , 640.5 , 2233.4 , 106.2 , 1)		---Y�b�հ��סADIR=���V
	--local Flower = CreateObj ( 104173 , -1205.5 , -50.5 , -1225.4 , 342.5 , 1)		--���հ�
	SetModeEx( Flower , EM_SetModeType_Move , false )			------������
	SetModeEx( Flower , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Flower , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Flower , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( Flower , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( Flower , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEx( Flower , EM_SetModeType_Gravity , false )		------�S�����O
	AddToPartition( Flower , Room )
	
	local FlowerBall = CreateObjByFlag( 104175 , 780702 , 1 , 1 ) 	---�᪺�z���y
	SetModeEx( FlowerBall , EM_SetModeType_Move , false )			------������
	SetModeEx( FlowerBall , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( FlowerBall , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( FlowerBall , EM_SetModeType_NotShowHPMP , false )	------��show���
	AddToPartition( FlowerBall , Room )
	
	local Exit = CreateObjByFlag( 104172 , 780702 , 23 , 1 )	-----���ת�(�X�f)
	SetModeEx( Exit , EM_SetModeType_Move , false )			------������
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Exit , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( Exit , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEX( Exit , EM_SetModeType_Obstruct , true )		------����
	AddToPartition( Exit , Room )
	
	while 1 do
		sleep(10)
		local FlowerTarget = ReadRoleValue( FlowerBall , EM_RoleValue_AttackTargetID )	----Ū��z���y�����ؼ� 
		--Say(FlowerBall , FlowerTarget)
		if ( FlowerTarget ~= 0 ) and ( CheckID( FlowerBall ) == true) then
			ScriptMessage( Flower , -1 , 2 , "[SC_104143_01]" , 1 )				---�L§���J�I�̡I�O�֤��\�A�̶i�J�o���t�����H
			DelObj(Flower)
			Sleep(20)
			CastSpellLv( FlowerBall , FlowerBall , skill5 , 0 )
			Boss = CreateObjByFlag( 104143 , 780702 , 1 , 1 )				----�b�X�Хͪ���
			AddToPartition( Boss , Room )										----�⪫��[��Y�h
			sleep(20)									-----���F�����z���y�b�٨S��X�S�Īk�N�e�N�Q�R���F
			DelObj(FlowerBall)
			BeginPlot( Boss , "lua_sasa_104143_Boss" , 0 )						----�s�������"���e",�l�ʬ��
			Setplot( Boss , "dead" , "lua_sasa_104143_Bossdead" , 30)
			WriteRoleValue( Boss , EM_RoleValue_register9 , OwnerID() )
			--Yell(Boss , "9 is"..ReadRoleValue( Boss , EM_RoleValue_register9) , 5 )
			WriteRoleValue( Boss , EM_RoleValue_register8 , Exit )
			local EnterFight = 0												----�i�J�԰��}��
			
			while 1 do
				sleep(10)				
				local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	----Ū�����ؼ�
				if SearchCounter >= 10 or SearchCounter == 0 then	
					SearchPlayer = {}
					local countplayer = SetSearchAllPlayer(Room)
					for k=1 , countplayer do
						local tempplayer = GetSearchResult()
						if ReadRoleValue(tempplayer , EM_RoleValue_Voc) ~= 0 then				--GM�ư�
						 --and ReadRoleValue(tempplayer , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
							SearchPlayer[table.getn(SearchPlayer)+1] = tempplayer
						end
					end
					SearchCounter = 0	
				end		
				SearchCounter = SearchCounter + 1
				AnotherTarget = 0
				for	l=1 , table.getn(SearchPlayer) do					
					if GetDistance( Boss , SearchPlayer[l] ) <= 300 				-----�Z��Boss 300�H�� 
					 and CheckRelation( Boss, SearchPlayer[l] , EM_CheckRelationType_Attackable ) == true then		-----�åB�O�i�������A
						AnotherTarget = AnotherTarget + 1
						--Say(Boss , "Player ="..GetName(SearchPlayer[l]))
						WriteRoleValue( Boss , EM_RoleValue_register2 , 1 )	-----���F��������DBoss�٦���L�H�i�H��
						break	
					end	
				end	
				if AnotherTarget == 0 then
					WriteRoleValue( Boss , EM_RoleValue_register2 , 0 )
				end
				if BossTarget ~= 0 or AnotherTarget ~= 0 then											-----���٦��S����L�i�H�����ؼ�
					counter1 = counter1 + 1											----�C��+1
					BerserkCounter = BerserkCounter + 1
					--counter2 = counter2 + 1
					if EnterFight == 0 then											----0=�},1=��
						Mode = 1
						WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )	----�Ȧs��(�q����������ӼҦ�,�Ʀr�O�Ҧ�)
						
						Entrance = CreateObjByFlag( 104171 , 780702 , 22 , 1 )	-----���ת�(�J�f)
						SetModeEx( Entrance , EM_SetModeType_Move , false )			------������
						SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------������
						SetModeEx( Entrance , EM_SetModeType_Fight , false )		------���i���
						SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------������
						SetModeEx( Entrance , EM_SetModeType_Mark , false )			------���i�I��
						SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------��show���
						SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------����
						AddToPartition( Entrance , Room )
						WriteRoleValue( Boss , EM_RoleValue_register7 , Entrance ) 
						EnterFight = 1
					end	
					if Mode == 1 then												----���]�Ҧ�=1
						if BerserkCounter >= 480 then									--�g��
							ScriptMessage( Boss , -1 , 2 , "[SC_104143_05]" , 1 )				----����O�L���H�̡A�O�ɭ����A�̪��D�S��ڪ��U���F�I
							if IsBerserk == 0 then
								AddBuff( Boss , 507364 , 0 , -1 ) 
								--Say(Boss , "Time ="..BerserkCounter)
								IsBerserk = 1
							end	
							BerserkCounter = 0
						end
						if counter1 >= ModeTime1 then								----�p�ɪ��ܼƤj��]�w�����
							--WriteRoleValue( Boss , EM_RoleValue_AttackDelay , 100 )			------���𴶧�10��
							while ReadRoleValue(Boss , EM_RoleValue_SpellMagicID ) ~= 0 do
								sleep(5)
							end	
							CastSpellLv(Boss , Boss , skill2 , 0 )
							--sleep(40)
							while ReadRoleValue(Boss , EM_RoleValue_SpellMagicID ) ~= 0 do
								sleep(10)
							end
							ScriptMessage( Boss , -1 , 2 , "[SC_104143_03]" , 1 )				----�u�O�W�o�r�A�o���S�����֨Ӧ����ڪ��i���O�K
							SetModeEx( Boss , EM_SetModeType_Move, false)				--����		
							AddBuff( Boss, Mode2Buff, 69 , -1 )						-----�WBoss��
							--sleep(50)	
							CastSpellLv(Boss, Boss , skill3 , 0 )																
							Mode = 2
							WriteRoleValue( Boss , EM_RoleValue_register1 , 2 )
							counter1 = 0											----�n�k0,���M�|�W��
							sleep(10)		
						end							
					elseif Mode == 2 then											----�}�ަ^�Ĥ@���q
						if CheckBuff( Boss , Mode2Buff ) == false then
							Mode = 1
							if ReadRoleValue(Boss , EM_RoleValue_SpellMagicID ) == 495986 then		------Boss�٦b�I���c�u�@
								SecondBoss = star_CreateObj_NoAdd( Boss , 104143 , 0 , 0 , 0 , Room , 0) 
								SetModeEx( SecondBoss , EM_SetModeType_Move, false)		-----���i����
								AddToPartition( SecondBoss , Room )
								WriteRoleValue( SecondBoss , EM_RoleValue_register1 , 1 )
								WriteRoleValue( SecondBoss , EM_RoleValue_register7 , ReadRoleValue( Boss , EM_RoleValue_register7 ) )
								WriteRoleValue( SecondBoss , EM_RoleValue_register8 , ReadRoleValue( Boss , EM_RoleValue_register8 ) )
								WriteRoleValue( SecondBoss , EM_RoleValue_register9 , ReadRoleValue( Boss , EM_RoleValue_register9 ) )
								WriteRoleValue( SecondBoss , EM_RoleValue_register10 , ReadRoleValue( Boss , EM_RoleValue_register10 ) )
								local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	
								WriteRoleValue( SecondBoss , EM_RoleValue_HP ,  NowHP)
								DelObj(Boss)																									
								BeginPlot( SecondBoss , "lua_sasa_104143_Boss" , 0 )
								Setplot( SecondBoss , "dead" , "lua_sasa_104143_Bossdead" , 30)
								--Say(SecondBoss , "Boss ="..Boss)
								sleep(10)
								SetModeEx( SecondBoss , EM_SetModeType_Move, true)
								Boss = SecondBoss																	
								--Say(SecondBoss , "AfterBoss ="..Boss)
								--Say(SecondBoss , "SecondBoss ="..SecondBoss)
							else
								SetModeEx( Boss , EM_SetModeType_Move, true)				--Boss�i����
								WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
							end	
							counter1 = 0	
						end
					end					
				else																----���m
					if EnterFight == 1 then
						local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
						--Say(Boss , BossIsDead )
						if BossIsDead ~= 1 then											---Boss�S���~����
							if CheckID(Boss) == true then
								DelObj(Boss)
							end
							if CheckID(Entrance) == true then
								DelObj( Entrance )
							end	
							for n=1 , table.getn(SearchPlayer) do
								Setplot( SearchPlayer[n] , "dead" , "" , 30)		--���`�@���M��
								sleep(1)
							end
							sleep(50)
							Boss = CreateObjByFlag( 104143 , 780702 , 1 , 1 )
							AddToPartition( Boss , Room )
							BeginPlot( Boss , "lua_sasa_104143_Boss" , 0 )
							Setplot( Boss , "dead" , "lua_sasa_104143_Bossdead" , 30)
							WriteRoleValue( Boss , EM_RoleValue_register9 , OwnerID() )
							WriteRoleValue( Boss , EM_RoleValue_register8 , Exit )
						elseif BossIsDead == 1 then										---Boss���F������		
							return	
							--break
						end
						EnterFight = 0													----�A�}�@��
						counter1 = 0													----�k0
						--counter2 = 0
						Mode = 1
						BerserkCounter = 0	----�g�ɭp��
						IsBerserk = 0
					end		
				end
			end		
		end	
	end	
end

function lua_sasa_104143_Skill_1()		-----Boss�ޯ�I��
	local Skill = { 495982 , 495983 }		-----��� 	--�a����ŧ
	local SkillLv = { 0 , 3 }
	--local SkillString = { "[]" , "[]" }
	local Luck = Rand(100)													----���üƩ�ޯ�
	local PlayerInHate = star_HateListSort(OwnerID())						----���X����������a
	local BossTarget 														----�sBOSS�n�����ؼ�
	local SkillIndex 														----��TABLE������m

	if (Luck >= 0 and Luck < 50) then										----�q0~ ���@�Ӽ�
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1				---�H���줳��������a
		BossTarget = PlayerInHate[RandTarget1]
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		local RandTarget2 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget2]								---�ۨ��d��,PlayerInHate[1]=�Ĥ@��
	end
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )		--�۸�(����,-1=���Ϫ��a,2=����ĵ�i(���|�Q�~��)
	--Yell( OwnerID() , SkillString[SkillIndex] , 5),�t�@�س۸�,�i�H�]�d��
	if 	( BossTarget ~= nil) 
	 and ( ReadRoleValue(BossTarget , EM_RoleValue_IsDead ) == 0 ) then
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	--�ޯ൥��(SysCastSpellLV=�t�Ω�)
		Sleep(10)
	end
end

function lua_sasa_104143_Boss()			------Boss����
	while 1 do
		AddBuff(OwnerID() , 505653 , 0 , -1)	------����Boss���}�԰��^�媺buff
		Sleep(10)
		local Counter1 = 0						-------�p�ǭp��
		local Counter2 = 0						-------�ޯ�p��
		local Counter3 = 0
		local SearchCounter = 0
		local KillCounter = 0
		local Mode2Buff = 507358				-------�Ҧ�2��BUFF
		local mode = 0							-------�P�_�Ҧ���
		local mob1 = {}							-------�ͤp�Ǫ��ܼ�
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		
		local skill1 = 495984					-------���¤��L
		local skill4 = 495987					-------�l����
		local KillSkill = 495993						-------���H�k�N
		local EnterMode2 = 0
		local LuckyPlayer = {}			------�s��Q�l���øj�����a
		--local SearchPlayer = {}
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			--Ū�������ؼ�
			if AttackTarget ~= 0 then						--���O�_�٦��ؼ�			
				mode = ReadRoleValue( OwnerID() , EM_RoleValue_register1)							--Ū���e�g�J���Ҧ�
				WriteRoleValue( OwnerID() , EM_RoleValue_register10 , 10 )							--�i�D�p�ɾ��w�i�J�԰�
				if ReadRoleValue( OwnerID() , EM_RoleValue_register2 )	== 0 then 					-----�O�_�٦��H�i�H��
					SetModeEx( OwnerID() , EM_SetModeType_Move, true)		-----�i����	
				end
				if mode == 1 then
					EnterMode2 = 0
					KillCounter = 0
					SearchCounter = 0
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					counter3 = counter3 + 1
					
					if counter1 >= 15 then
						for i = 1 , 2 do
							local flagNum = Rand(20)+2
							local mobtemp = CreateObjByFlag( 104169 , 780702 , flagNum , 1 )
							mob1[table.getn(mob1)+1] = mobtemp
							SetModeEx( mobtemp , EM_SetModeType_Move, false)				--����
							AddToPartition( mob1[table.getn(mob1)] , Room )	
							WriteRoleValue( mobtemp , EM_RoleValue_Livetime , 10 )				--�s�b���
							WriteRoleValue( mobtemp , EM_RoleValue_register1 , OwnerID() )	-----�NBoss GID�g�i�p��
							Setplot( mobtemp , "dead" , "lua_sasa_104169_dead" , 30)								
						end	
						counter1 = 0
					elseif counter3 >=10 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104143_02]" , 1 )			----�P���ۤv�n�z�L�઺�Ҽ˧a�I
						CastSpellLv(OwnerID(), OwnerID() , skill1 , 0 )
						sleep(10)
						--Say( OwnerID() , "On" )
						counter3 = 0
					elseif counter2 >= 6 then
						lua_sasa_104143_Skill_1()					
						counter2 = 0
					end
				elseif mode == 2 then					
					if EnterMode2 == 0 then	
						LuckyPlayer = {}			------�s��Q�l���øj�����a
						Counter1 = 0						
						Counter2 = 0						
						Counter3 = 0
						local Player = {}						-------�H�����a
						local countplayer = SetSearchAllPlayer(Room)						---��o�h�����a
						for j=1 , countplayer do
							local temp = GetSearchResult()
							if ReadRoleValue(temp , EM_RoleValue_Voc) ~= 0 				--GM�ư�
							 and ReadRoleValue(temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
								Player[table.getn(Player)+1] = temp 				--��쪺���a��iTABLE
							end	
						end
						--Say(OwnerID() , "Before ="..table.getn(Player))
						if table.getn(Player) >= 3 then							------�j��3�H�Nrand 3��
							for k=1 , 3 do						
								local lucky = Rand(table.getn(Player))+1						--RAND�쪺�Ʀr	
								LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[lucky]	
								SysCastSpellLv(OwnerID(), Player[lucky] , skill4 , 2 )
								Setplot( Player[lucky] , "dead" , "lua_sasa_104143_Playerdead" , 30)		--���`�@���}�]
								sleep(1)
								for l=1 , table.getn(Player) do									--�}�l���RAND�쪺�Ʀr
									if Player[l] == Player[lucky] then							--��襤
										table.remove(Player , l)
									end
								end
								--Say(OwnerID() , "After ="..table.getn(Player))
							end	
						else													-------3�H�H�U�N����
							for m=1 , table.getn(Player) do
								LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[m]
								SysCastSpellLv(OwnerID(), Player[m] , skill4 , 2 )
								Setplot( Player[m] , "dead" , "lua_sasa_104143_Playerdead" , 30)		--���`�@���}�]
								sleep(1)
							end
						end	
						EnterMode2 = 1
					end	
					KillCounter = KillCounter + 1
					--Say(OwnerID() , "KillCounter ="..KillCounter )
					if KillCounter >= 17 then								-----��c�ɶ���
						if CheckBuff( OwnerID() , Mode2Buff ) == true then	-----�ިS�}
							--Say(OwnerID() , "Yes" )
							for n=1 , table.getn(LuckyPlayer) do
								--Say(OwnerID() , "Player ="..LuckyPlayer[n]  )	
								if CheckBuff(LuckyPlayer[n] , 507359) == true then
									SysCastSpellLv(OwnerID(), LuckyPlayer[n] , KillSkill , 0 )			-----���F�Q�j�����a
									sleep(1)
								else
									--say ( LuckyPlayer[n] , "Buff Over")
									Setplot( LuckyPlayer[n] , "dead" , "" , 30 )		--���`�@���M��
								end	
								--KillID( OwnerID() , LuckyPlayer[n] )
							end
						end
						KillCounter = 0
					else
						if CheckBuff( OwnerID() , Mode2Buff ) == false then
							KillCounter = 0
						end
					end	
				end			
			end
		end
	end
end


function lua_sasa_104169_dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----Ū�b���@�h
	--local ball = LuaFunc_CreateObjByObj ( 104170, 104169 )				----�p�Ǧ����Ͳy
	local ball = star_CreateObj_NoAdd( OwnerID() , 104170 , 0 , 0 , 0 , Room , 0) 			----�p�Ǧ����Ͳy
	local CureSpell = 495989												------�Ѭr�k�N
	--Say( ball , "Someone_kill_me" )
	SetModeEx( ball , EM_SetModeType_SearchenemyIgnore, true)	---���󤣷|�Q�j�M
	SetModeEx( ball , EM_SetModeType_HideName, true)  			---�����Y�W�O�_��ܦW��
	SetModeEx( ball , EM_SetModeType_HideMinimap, true)			---����O�_�b�p�a�ϤW���
	SetModeEx( ball , EM_SetModeType_Searchenemy, false)   		--����
	SetModeEx( ball , EM_SetModeType_Mark, false)				--�аO
	SetModeEx( ball , EM_SetModeType_Fight, false) 				--���
	SetModeEx( ball , EM_SetModeType_Move, false)				--����
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( ball , EM_SetModeType_Strikback, false)			--����
	SetModeEx( ball , EM_SetModeType_Show, true)				--�q�X
	
	AddToPartition( ball , Room )
	WriteRoleValue( ball, EM_RoleValue_Livetime,3 )				--�s�b���
	CastSpellLv( ball , ball , CureSpell , 0 )
	--BeginPlot( OwnerID() , "lua_sasa_104169_ball" , 0 )
end

--function lua_sasa_104169_ball()
	--local CureSpell = 495989			------�Ѭr�k�N
	--CastSpellLv( OwnerID(), OwnerID() , CureSpell , 0 )
--end

function lua_sasa_104143_Playerdead()
	local HealBoss = 495988			-----�v��boss
	local BloodBuff = 507359		-----�l����
	local pos = Lua_BuffPosSearch( OwnerID() , BloodBuff )	
	local Boss = BuffInfo( OwnerID() , pos , EM_BuffInfoType_OwnerID )
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )      --Ū���ثe��q
	local HPPercent = NowHP / MaxHP	                                --��q�ʤ���
	local PlayerName = GetName( OwnerID() )	
	local MessageString = "[SC_104143_04][$SETVAR1="..PlayerName.."]" 		----�bstring���i�H�q�X���a���W�r
	ScriptMessage( Boss , -1 , 2 , MessageString , 1 )				----[$VAR1]�A�A��ڷQ�����٨ӱo���i�r�A�����K
	if 	( CheckID( Boss ) == true) 
	 and ( ReadRoleValue(Boss , EM_RoleValue_IsDead ) == 0 ) then
		CastSpellLv( Boss, Boss , HealBoss , 0 )
		if HPPercent >= 90 then
			WriteRoleValue( Boss , EM_RoleValue_HP , MaxHP)			--90%�H�W�ɺ�
		else	
			AddRoleValue( Boss , EM_RoleValue_HP , MaxHP*0.1 )		--90%�H�U��10%
		end
	end	
	--Say(OwnerID() , "Wrong")
end

function lua_sasa_104143_Bossdead()				-----Boss���`
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104143_06]" , 1 )				----���K�ڤ����\�K�ڥi�O���¡K�R�����O�L�����ڡK
	--ScriptMessage( OwnerID() , -1 , 2 , "Test" , 1 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local countplayer = SetSearchAllPlayer(Room)						---��o�h�����a	
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )	---Ū�X�p�ɾ�GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )				---�i�D�p�ɾ�Boss���F
	--Yell(OwnerID() , "Counter is "..counter , 5)
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register7)
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register8)	
	DelObj( Entrance )
	DelObj( Exit )
	for j=1 , countplayer do
		local tempplayer = GetSearchResult()
		if ReadRoleValue(tempplayer , EM_RoleValue_Voc) ~= 0 				--GM�ư�
		 or ReadRoleValue(tempplayer , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
			Setplot( tempplayer , "dead" , "" , 30)		--���`�@���M��						
		end	
	end		
end

--�l���õ���--(�@��)

function lua_sasa_507359_buffover()								--�l���õ���Ĳ�o
	BeginPlot( OwnerID(), "lua_sasa_507359_buffover_2", 15 )										
end

function lua_sasa_507359_buffover_2()
	--say (OwnerID() , "Good")
	Setplot( OwnerID() , "dead" , "" , 30 )		--���`�@���M��
end

--���f���ܱM��--(�@��)

function lua_sasa_104317_NearBoss()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Setplot( OwnerID() , "range" , "lua_sasa_104317_cue_1" , 50 )
end

function lua_sasa_104317_cue_1()
	BeginPlot( TargetID() , "lua_sasa_104317_cue_2", 0 )
end

function lua_sasa_104317_cue_2()
	Setplot( OwnerID() , "range" , "" , 50 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104143_07]" , 1 )				---�Aı�o���誺�۾��W�A���G���ƻ��k���ۡK
end