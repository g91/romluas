function Lua_apon_102745_timer() ---�p�ɾ��Ǫ��M��
	while 1 do 
		sleep(10)
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NPID����Boss��GIDŪ�X��
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		while 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1
			counter3 = counter3 + 1
			counter4 = counter4 + 1
			--Say(OwnerID() , "Counter_1 ="..counter1)
			--Say(OwnerID() , "Counter_2 ="..counter2)
			--Say(OwnerID() , "Counter_3 ="..counter3)
			if counter1 == 1 then -----�i�J P-1 �Ҧ�
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				--Say(OwnerID() , "P_1 Start !!")
			elseif counter2 == 20 then -----�i�J P-2 �Ҧ�
				WriteRoleValue( Boss , EM_RoleValue_PID , 2 )
				--Say(OwnerID() , "P_2 Start !!")
			elseif counter3 == 45 then -----�i�J P-3 �Ҧ�--�^����q��
				WriteRoleValue( Boss , EM_RoleValue_PID , 3 )
				WriteRoleValue( Boss , EM_RoleValue_Register8 , 1 )---�P�_�ͥ۬W��
				--Say(OwnerID() , "P_3 Start !!")
			elseif counter4 >= 50 then  ----�p�ɾ����m
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				--Say(OwnerID() , "P_P Return !!")
				counter1 = 0
				counter2 = 0
				counter3 = 0
				counter4 = 0
			end
		end
	end
end




function Lua_apon_102740_AI()
	local Check_pet = 0  ---�P�_�d���i�J�԰���
	while 1 do 
		sleep(10)
		local king_rebon = 0
		local Step = 0 ----�P�_�Ҧ�������
		local Step_stone = 0
		local CombatBegin = 0	-------------�԰��}�l�X��
		local Check_HP = 0 --------�P�_��q����
		local Skill = {494412 , 494413 , 494414 , 494419 } ---�ޯ��A���A�١B����١B�H���١B��q
		local SkillLv = {0 , 0 , 0 , 0 ,}  ---�ޯ൥��
		local SkillString = { } ----�r��
		
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
		local PPL = SetSearchAllPlayer(roomid1 )
		local Luck ----�H���X�ۥ�
		local Hate = {} ----�x�sBoss �����
		local Hate_Num ---�p��X��������h�ּƶq
		local Rand_Stone_1
		local Rand_Stone_2
		local Rand_Stone_0
		-----------�X�аϡ�--------------------------------------------
		local Flag_timer = 780292 ----�p�ɾ�
		local Flag_checkpet = 780357 -----���d���D�H
		local Flag_stone_1 = 780362 ---�ߤ@���L�ĬW
		local Flag_stone_2 = 780363 ----�䥦���W�l
		local Flag_King = 780376 ---�������ͺX��
		local Flag_checkhp = 780377 ---�P�_Boss��q�Ϊ��˥ܩ�
		local Flag_mob = 780378 ----�ͥX��^�D�H�ǥ� 
		----------------------------------------------------------------------
		local Mob_checkhp ---�F�Q�w��q�P�_��
		local Check_super = 0 ----�ΨӧP�_�L�ĬW�o�ʥ�
		
		local counter_p1_1 = 0   
		local counter_p1_2 = 0
		local counter_p1_3 = 0
		local counter_p2_1 = 0   
		local counter_p2_2 = 0
		local counter_p2_3 = 0	
		local counter_p2_4 = 0   
		local counter_p2_5 = 0
		local counter_p2_6 = 0
		
		local Stone_1_other = {} ----�L�ĬW�l�A�Ȧstable
		local Stone_2_other = {}  ----�@��W�l�A�Ȧstable
		
		local Stone_A = 102742
		local Stone_B = 102743
		local Stone_C = 102744
		
		while 1 do
			sleep(10)
			------------�W�l�X�l�ϡ�---------------------------------------
			local Stone_0 = {Stone_A,Stone_B,Stone_C} ----�T�ӥ۬W��table
			--local Stone_1 = {1,2,3,4,5,6,7,8,9,10}
			local Stone_2 = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40} ----��l�T�إ۬W���X��
			--local Stone_2 = {1,2,3,4,5,6,7,8,9,10} ---�L�ĥ۬W�Ϊ��X��
			local Stone_1 = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} ---�L�ĥ۬W�Ϊ��X��
			
			local BossMaxHP = ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP)
			local BossNowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
			
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				Step = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ----�P�_�{�b�n�b���ӼҦ�
				--say(OwnerID(),"Step =="..Step)
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , Flag_checkpet , 1 )-----�N�d���D�H�Զi���X��
					Check_pet = 1
				end
				
				if Check_HP == 0 and BossMaxHP*0.3 >= BossNowHP then
					Check_HP = 1
					Yell( OwnerID() , "[SC_102740_3]" , 5)-----[�L�����J�I�̡I�D�H���j�j�C�j���ݲM���a�I�I]
					sleep(10)
				end
				
				if CombatBegin == 0 then ---�԰��Ұʮɵo��
					Yell( OwnerID() , "[SC_102740_4]" , 5)----[��ż���ͪ��I�O�֤��\�A�̶i�Ӫ� �I�I] 
					sleep(10)
					local Mob_timer = CreateObjByFlag( 102745 , Flag_timer , 1 , 1 )----�ͥX�@�ӭp�ɾ�
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1, Mob_timer )
					WriteRoleValue( Mob_timer, EM_RoleValue_PID, OwnerID() )
					SetModeEx( Mob_timer , EM_SetModeType_Show, true) ----�q�X
					SetModeEx( Mob_timer , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Mob_timer , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Mob_timer , EM_SetModeType_Move, false) ---����	
					SetModeEx( Mob_timer , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( Mob_timer , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( Mob_timer , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Mob_timer , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Mob_timer , EM_SetModeType_Searchenemy, false)  ---����
					AddToPartition( Mob_timer,roomid1 )
					Show(Mob_timer,roomid1)
					Mob_checkhp = CreateObjByFlag( 102750 , Flag_checkhp , 1 , 1 )----�ͥX�@�ӧP�_�F�Q�w��q��
					WriteRoleValue( OwnerID() , EM_RoleValue_Register2, Mob_checkhp )
					WriteRoleValue( Mob_checkhp, EM_RoleValue_PID, OwnerID() )
					SetModeEx( Mob_checkhp , EM_SetModeType_Show, true) ----�q�X
					SetModeEx( Mob_checkhp , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Mob_checkhp , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Mob_checkhp , EM_SetModeType_Move, false) ---����	
					SetModeEx( Mob_checkhp , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( Mob_checkhp , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( Mob_checkhp , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Mob_checkhp , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Mob_checkhp , EM_SetModeType_Searchenemy, false)  ---����
					AddToPartition( Mob_checkhp,roomid1 )
					Show(Mob_checkhp,roomid1)
					CombatBegin = 1
					king_rebon = 1
					sleep(20)
				end
				if Step == 1 then ----���q�ۦ��Ҧ�
					counter_p1_1 = counter_p1_1 + 1 ---�X�ۮɶ�
					counter_p1_2 = counter_p1_2 + 1 ----�ݭn�۪k���X��
					counter_p1_3 = counter_p1_3 + 1 ----�Ҧ������A�����
					--Luck = Rand( 100 )--�����X�ۥ�
					if counter_p1_1 >= 7 and counter_p1_3 <= 18 then
						Luck = Rand( 100 )--�����X�ۥ�
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
							--Say(OwnerID() , "Skill__1")
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__2")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(10)
						counter_p1_1 = 0
					elseif counter_p1_2 >= 9 and counter_p1_3 <= 18 then ---�H���A�ݭn�۬����
						Luck = Rand( 100 )--�����X�ۥ�
						if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
							SkillIndex = 3
							BossTarget = OwnerID()
							--Say(OwnerID() , "Skill__3")
						elseif (Luck >= 21 and Luck < 45) or (Luck >= 49 and Luck < 79) then	
							SkillIndex = 4
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__4")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(20)
						counter_p1_2 = 0
					end
					Step_stone = 1
					Check_super = 0
				elseif Step == 2 then
					counter_p2_1 = counter_p2_1 + 1 ----�ۥX�۬W��
					counter_p2_2 = counter_p2_2 + 1 ---���q�ۦ�
					counter_p2_3 = counter_p2_3 + 1 ----�ݭn�۪k�ۦ�
					counter_p2_4 = counter_p2_4 + 1 ----Boss�^���O�q
					counter_p2_5 = counter_p2_5 + 1 ----�Ҧ����������
					--Step_stone = ReadRoleValue( OwnerID() , EM_RoleValue_Register8 ) ----�P�_�{�b�n�b���ӼҦ�
					if Step_stone == 1 then
						Yell( OwnerID() , "[SC_102740_1]" , 5) ----[�M�����I�ǡI�F�Q�w�N��U�A�̪��Y�`�I�a���b�D�W���W�I]
						sleep(10)
						CastSpellLV( OwnerID() , OwnerID() ,494415,1) ---��t�ʧ@
						sleep(20)
						Step_stone = 0
						--WriteRoleValue( OwnerID() , EM_RoleValue_Register8 , 0 )
						--Hate = star_HateListSort() ---�N�����s�JHate �� table ��
						Hate = DW_HateRemain(0) ---�N�����s�JHate �� table ��
						Hate_Num = table.getn (Hate) 
						--say(OwnerID(),"Hate NUM ==="..Hate_Num)
			            -------------------�͵L�ĥ۬W �� -------------------------------------------------------------------------------------------------	
						for i = 1 , 1 ,1 do
							Rand_Stone_1 = DW_Rand( table.getn (Stone_1))---�q�H���X�Ф��ͤ@��
							--say(OwnerID(),"Rand_Stone_1 =="..Rand_Stone_1)
							Stone_1_other[i] = CreateObjByFlag( 102741 , Flag_stone_1 , Rand_Stone_1 , 1 )----�ͥX�@���|�L�Ī��۬W
							
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Show, true) ----�q�X
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Mark, true) ----�аO
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Strikback, false) ---����
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Move, false) ---����	
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Fight, true) ---�i���
							SetModeEx( Stone_1_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
							SetModeEx( Stone_1_other[i] , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
							SetModeEx( Stone_1_other[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Searchenemy, true)  ---����
							Addbuff(Stone_1_other[i],504937,0,-1) ----��W��Buff
							
							AddToPartition( Stone_1_other[i],roomid1 )
							Show(Stone_1_other[i],roomid1)
							WriteRoleValue( Stone_1_other[i] , EM_RoleValue_PID, OwnerID() )----�NBoss��GID�g�J�۬W��PID��
							--Hide(Stone_1_other[i])
						end
			            -----------------------------------�q�T�ӥ۬W���H���D�@�Ӧb�H���@�ӺX���I�إX��-----------------------------------------
						if Hate_Num <= 1 then
							--say(OwnerID(),"test----1")
							for i = 1 , 1 , 1 do
								Rand_Stone_2 = DW_Rand( table.getn (Stone_2))---�q�H���X�Ф��ͤ@��
								--say(OwnerID(),"Rand_Stone_2 Flag =="..Rand_Stone_2)
								Rand_Stone_0 = DW_Rand( table.getn (Stone_0))---�q�T�إ۬W����@��
								Stone_2_other[i] = CreateObjByFlag( Stone_0[Rand_Stone_0] , Flag_stone_2 , Stone_2[Rand_Stone_2] , 1 )--�T��@�B�X�СB�X�Ц�mRand
								
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Show, true) ----�q�X
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Mark, true) ----�аO
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Strikback, false) ---����
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Move, false) ---����	
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Fight, true) ---�i���
								SetModeEx( Stone_2_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Searchenemy, true)  ---����
								
								if ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102742 then
									Addbuff(Stone_2_other[i],504939,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102743 then
									Addbuff(Stone_2_other[i],504933,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102744 then
									Addbuff(Stone_2_other[i],504938,0,-1)
								end
								
								AddToPartition( Stone_2_other[i],roomid1 )
								Show(Stone_2_other[i],roomid1)
								WriteRoleValue( Stone_2_other[i] , EM_RoleValue_PID, OwnerID() )----�NBoss��GID�g�J�۬W��PID��
								--Hide(Stone_2_other[i])
								table.remove ( Stone_2 , Rand_Stone_2) ----�H�U���O���F�����۬W�b�P�@�X�Ц�m�ͥX  
								table.getn ( Stone_2)
							end
							
						elseif Hate_Num >= 40 then ----�p�G���~�L�h���a���o�����A�ҥH�A�۬W�X�{���W���̦h20��
							for i = 1 , 20 , 1 do ---�u�|�ͥX�����@�b���W�l�C�q�X�ХͥX�C
								Rand_Stone_2 = DW_Rand( table.getn (Stone_2))---�q�H���X�Ф��ͤ@��
								Rand_Stone_0 = DW_Rand( table.getn (Stone_0))---�q�T�إ۬W����@��
								Stone_2_other[i] = CreateObjByFlag( Stone_0[Rand_Stone_0] , Flag_stone_2 , Stone_2[Rand_Stone_2] , 1 )--�T��@�B�X�СB�X�Ц�mRand
								
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Show, true) ----�q�X
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Mark, true) ----�аO
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Strikback, false) ---����
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Move, false) ---����	
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Fight, true) ---�i���
								SetModeEx( Stone_2_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Searchenemy, true)  ---����
								
								if ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102742 then
									Addbuff(Stone_2_other[i],504939,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102743 then
									Addbuff(Stone_2_other[i],504933,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102744 then
									Addbuff(Stone_2_other[i],504938,0,-1)
								end
								
								AddToPartition( Stone_2_other[i],roomid1 )
								Show(Stone_2_other[i],roomid1)
								WriteRoleValue( Stone_2_other[i] , EM_RoleValue_PID, OwnerID() )----�NBoss��GID�g�J�۬W��PID��
								--Hide(Stone_2_other[i])
								table.remove ( Stone_2 , Rand_Stone_2) ----�H�U���O���F�����۬W�b�P�@�X�Ц�m�ͥX  
								table.getn ( Stone_2)
							end
							
						elseif Hate_Num >= 2 and  Hate_Num <= 39 then
							for i = 1 , (Hate_Num*0.5) , 1 do ---�u�|�ͥX�����@�b���W�l�C�q�X�ХͥX�C
								Rand_Stone_2 = DW_Rand( table.getn (Stone_2))---�q�H���X�Ф��ͤ@��
								Rand_Stone_0 = DW_Rand( table.getn (Stone_0))---�q�T�إ۬W����@��
								Stone_2_other[i] = CreateObjByFlag( Stone_0[Rand_Stone_0] , Flag_stone_2 , Stone_2[Rand_Stone_2] , 1 )--�T��@�B�X�СB�X�Ц�mRand
								
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Show, true) ----�q�X
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Mark, true) ----�аO
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Strikback, false) ---����
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Move, false) ---����	
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Fight, true) ---�i���
								SetModeEx( Stone_2_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Searchenemy, true)  ---����
								
								if ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102742 then
									Addbuff(Stone_2_other[i],504939,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102743 then
									Addbuff(Stone_2_other[i],504933,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102744 then
									Addbuff(Stone_2_other[i],504938,0,-1)
								end
								
								AddToPartition( Stone_2_other[i],roomid1 )
								Show(Stone_2_other[i],roomid1)
								WriteRoleValue( Stone_2_other[i] , EM_RoleValue_PID, OwnerID() )----�NBoss��GID�g�J�۬W��PID��
								--Hide(Stone_2_other[i])
								table.remove ( Stone_2 , Rand_Stone_2) ----�H�U���O���F�����۬W�b�P�@�X�Ц�m�ͥX  
								table.getn ( Stone_2)
							end
						end
					end
					
					if Check_super == 0 and ReadRoleValue(OwnerID(),EM_RoleValue_Register9) == 1 then
						for i = 1 , table.getn ( Stone_2_other) , 1 do
							AddBuff (Stone_2_other[i] , 504925 , 0 , 20)---��{�b���W�Ҧ����۬W�W�@�ӵL�Ī�Buff<15>��
						end
						Check_super = 1
						WriteRoleValue( OwnerID() , EM_RoleValue_Register9 , 0 )
					end
					
					if counter_p2_2 >= 1 and counter_p2_5 <= 23 then
						Luck = Rand( 100 )--�����X�ۥ�
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
							--Say(OwnerID() , "Skill__1")
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__2")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(10)
						counter_p2_2 = 0
						
					elseif counter_p2_3 >= 7 and counter_p2_5 <= 23 then ---�H���A�ݭn�۬����
						Luck = Rand( 100 )--�����X�ۥ�
						if (Luck >= 0 and Luck < 20) or (Luck >= 70 and Luck < 90) then
							SkillIndex = 3
							BossTarget = OwnerID()
							--Say(OwnerID() , "Skill__3")
						elseif (Luck >= 21 and Luck < 40) or (Luck >= 50 and Luck < 69) then	
							SkillIndex = 4
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__4")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(20)
						counter_p2_3 = 0
						
					elseif counter_p2_5 >= 23 then
						counter_p2_1 = 0
						counter_p2_2 = 0
						counter_p2_3 = 0
						counter_p2_4 = 0
						counter_p2_5 = 0
					end
				
				elseif Step == 3 then ---�^����q���q
					Yell( OwnerID() , "[SC_102740_2]" , 5)----[���⪺�J�I�̡I�A�̪��A��N�M�x�]�����j���I]
					sleep(10)
					CastSpellLV( OwnerID() , OwnerID() ,494415,1) ---��t�ʧ@
					sleep(25)
					
					--say(OwnerID(),"Num 222 =="..table.getn(Stone_1_other))
					--say(OwnerID(),"Power Back")
					for i = 1 , table.getn(Stone_1_other), 1 do
						--say(OwnerID(),"Stone__1")
						if Stone_1_other[i] ~= nil and CheckID(Stone_1_other[i] ) == true then
							AddBuff (Stone_1_other[i] , 504932 , 0 , 15)---��Ҧ����۬W�W�@���ˬd�Ϊ�Buff
						end
					end	
				
					for i = 1 , table.getn (Stone_2_other) , 1 do
						--say(OwnerID(),"Stone__2")
						if Stone_2_other[i] ~= nil and CheckID(Stone_2_other[i] ) == true then
							AddBuff (Stone_2_other[i] , 504932 , 0 , 15)---��Ҧ����۬W�W�@���ˬd�Ϊ�Buff
						end
					end
				end	
			else
				--local Timer_die = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--Delobj(Timer_die)
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
				if king_rebon == 1 then
				----------------�N���W�Ҧ����۬W�M�� �� --------------------------------------------------
					--for i = 1 , table.getn(Stone_1_other), 1 do
						--say(OwnerID(),"Stone_1_1_other will Del")
						--if Stone_1_other[i] ~= nil and CheckID(Stone_1_other[i] ) == true then
							--Delobj(Stone_1_other[i])
						--end
					--end
					
					--for i = 1 , table.getn (Stone_2_other) , 1 do
						--if Stone_2_other[i] ~= nil and CheckID(Stone_2_other[i] ) == true then
							--say(OwnerID(),"Stone_2_2_other will Del")
							--Delobj(Stone_2_other[i])
						--end
					--end
					local checkhp_die = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
					WriteRoleValue( checkhp_die , EM_RoleValue_Register1 , 1 ) ----�N�F�Q�w��q�����Ȧs�����X�P�_
					Stone_1_other = 0
					Stone_2_other = 0
					Stone_1 = 0
					Stone_2 = 0
					sleep(50) ----��Boss�i�H�]�^����A�A���X���m
					break ----���m��
					--Hide(OwnerID()) ---���}�԰���A��ۤv�����C����q�����F�ۤv
					--local King = CreateObjByFlag( 102740 , Flag_King , 1 , 1 )
					--AddToPartition( King,roomid1 )
					--Show(King,roomid1)
					--Delobj(OwnerID())
				end
			end
		end
	end
end


------------�۬W�����`�@�� �� ------------------------------------------------------------------------

function Lua_apon_102741_Die() ----�L�ĥ۬W
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---�ήɶ��ӧR���ۤv
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NBoss��GIDŪ�X��
		SetPlot( OwnerID(),"dead","Lua_apon_102741_Die_1",10 )
		--say(OwnerID(),"Boss_1 =="..Boss)
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---��t�ʧ@
			--say(OwnerID(),"Boss !!!")
			sleep(10)
			AddBuff (Boss , 504929 , 0 , 20)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102741_Die_1()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NBoss��GIDŪ�X��
	WriteRoleValue( Boss , EM_RoleValue_Register9 , 1 )
	Delobj(OwnerID())
end



function Lua_apon_102742_Die() ----������۬W
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---�ήɶ��ӧR���ۤv
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NPID����Boss��GIDŪ�X��
		SetPlot( OwnerID(),"dead","Lua_apon_102742_Die_1",10 )
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---��t�ʧ@
			sleep(10)
			AddBuff (Boss , 504926 , 0 , 600)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102742_Die_1()
	--AddBuff (TargetID() , 504922 , 0 , 300)
	--SysCastSpellLv( OwnerID() ,OwnerID() ,494418,1) ---��ۤv��@�ӥ��魰�k�𪺪k�N
	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102752 , 0 , 0 , 0 ,roomid1,0 )

	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	
	SetFightMode ( Mob_spell,0,0,0,0 )
	Delobj(OwnerID())
end

function Lua_apon_102742_Die_2()
	sleep(5)
	CastSpellLV( OwnerID(),OwnerID() ,494418,1) ---��ۤv��@�ӥ��魰���𪺪k�N
	--say(OwnerID(),"123")
	sleep(10)
	Delobj(OwnerID())
end

function Lua_apon_102743_Die() ----���k��۬W
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---�ήɶ��ӧR���ۤv
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NPID����Boss��GIDŪ�X��
		SetPlot( OwnerID(),"dead","Lua_apon_102743_Die_1",10 )
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---��t�ʧ@
			sleep(10)
			AddBuff (Boss , 504927 , 0 , 600)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102743_Die_1()
	--AddBuff (TargetID() , 504923 , 0 , 300)
	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102773 , 0 , 0 , 0 , roomid1,0 ) 
	
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	
	SetFightMode ( Mob_spell,0,0,0,0 )
	Delobj(OwnerID())
end

function Lua_apon_102743_Die_2()
	sleep(5)
	CastSpellLV( OwnerID(),OwnerID() ,494420,1) ---��ۤv��@�ӥ��魰�k�𪺪k�N
	--say(OwnerID(),"123")
	sleep(10)
	Delobj(OwnerID())
end


function Lua_apon_102744_Die() ----�����v���۬W
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---�ήɶ��ӧR���ۤv
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NPID����Boss��GIDŪ�X��
		SetPlot( OwnerID(),"dead","Lua_apon_102744_Die_1",10 )
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---��t�ʧ@
			sleep(10)
			AddBuff (Boss , 504928 , 0 , 600)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102744_Die_1()
	--AddBuff (TargetID() , 504924 , 0 , 300)
	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102774 , 0 , 0 , 0 , roomid1,0 ) 
	
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	
	SetFightMode ( Mob_spell,0,0,0,0 )
	Delobj(OwnerID())
	
end

function Lua_apon_102744_Die_2()
	sleep(5)
	CastSpellLV( OwnerID(),OwnerID() ,494421,1) ---��ۤv��@�ӥ��魰�k�𪺪k�N
	--say(OwnerID(),"123")
	sleep(10)
	Delobj(OwnerID())
end


------------------------------------------------------------------------------------------------------------------------

function Lua_apon_102745_checkhp() ---�P�_�F�Q�w��q�M�ΡA�C 10 ���@���P�_
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Check_del = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---�P�_�O�_�N�Ҧ��˧L�R��
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Mob_table = {} ---�s��Ҧ��˧L
	local Mob_all = {}
	local Mob_Num
	local Flag_mob = 780378 ----�ͥX�F�Q�w�˽çL�� 
	local Mob_id = 102751 ---�F�Q�w�˽çL��ID
	while 1 do
		sleep(10)
		
		--say(OwnerID(),"Mob_Num =="..Mob_Num)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
		local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
		
		-----------------------�N�w���`���Ǫ��qtable������-----------------------------------
		for i = 1 , table.getn(Mob_all), 1 do
			--say(OwnerID(),"Start Del all Mob !! ")
			--if CheckID(Mob_all[i]) == false then
			if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
			--if Mob_all[i] ~= nil and CheckID(Mob_all[i] ) == true then
				--Delobj(Mob_all[i])
				--say(OwnerID(),"Remove mob from table !! ")
				table.remove ( Mob_all , i)
			end	
		end
		-------------------------------------------------------------------------------------------------------
		
		Mob_Num = table.getn(Mob_all)
		--say(OwnerID(),"table Num == "..Mob_Num)
		
		if  ( AttackTarget ~= 0 ) and ( CheckID(Boss)) == true then
			if BossMaxHP*0.3 >= BossNowHP and Mob_Num <= 10 then -----�p�G��q�C��30%�M���W�˧L�ƶq�p��15�~�|�A�ͥX�˧L 
				for i = 1 , 5 , 1 do
					Mob_table[i] = CreateObjByFlag( Mob_id , Flag_mob , i , 1 )--�˧L�B�X�СB�X�Ц�m
					AddToPartition( Mob_table[i],roomid1 )
					Show(Mob_table[i],roomid1)
					SetAttack( Mob_table[i] , AttackTarget )
					BeginPlot(Mob_table[i],"LuaS_Discowood_CheckPeace",0) ---���}�԰���|�۰ʮ��� 
					table.insert( Mob_all , Mob_table[i] )---�N�ͥX�Ӫ��˧L�A��JMob_all �� table ���C 
					--say(OwnerID()," table.getn(Mob_all) ==".. table.getn(Mob_all))
				end
				sleep(50)
			end
		else
			--if Check_del == 1 then
			for i = 1 , table.getn(Mob_all), 1 do
				--say(OwnerID(),"Start Del all Mob !! ")
				if Mob_all[i] ~= nil and CheckID(Mob_all[i] ) == true then
					Delobj(Mob_all[i])
				end	
			end
			local Timer_die = ReadRoleValue(Boss,EM_RoleValue_Register1)
			sleep(10)
			Delobj(Timer_die)
			WriteRoleValue(Boss,EM_RoleValue_PID , 0 )
			sleep(10)
			--killid(OwnerID(),Boss)
			--sleep(10)
			Delobj(OwnerID()) ----�����M���ʧ@��A�N�ۤv�R��
			
			--end
		end
	end
end





