function Lua_apon_102683_Boss_dead() -----Boss���`�@��
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	WriteRoleValue( Boss_AI, EM_RoleValue_Register3, 1)
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ball = star_CreateObj( OwnerID() , 102924 , 0 , 400 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Ball , EM_SetModeType_Move, false) ----����
	WriteRoleValue(Ball, EM_RoleValue_Livetime,3)	
	BeginPlot(Ball,"Lua_apon_102683_Boss_dead_1",0)
end

function Lua_apon_102683_Boss_dead_1()
	sleep(10)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_10]" , 1 )---�S�Q��A�ڸ�y�̧���z�~�M�O�@�˪��U���I�I
end

function Lua_apon_102683_timer() ---�p�ɾ��Ǫ��M��
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
			--counter3 = counter3 + 1
			counter4 = counter4 + 1
			--Say(OwnerID() , "Time_1 Boss_other ="..counter1)
			--Say(OwnerID() , "Time_2 Debuff ="..counter2)
			--Say(OwnerID() , "Time_4 Return ="..counter4)
			if counter1 == 1 then -----�i�J P-2 �Ҧ�
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				sleep(10)
				--Say(OwnerID() , "Time_1 Boss_other ")
			elseif counter2 == 35 then -----�i�J P-3 �Ҧ�
				WriteRoleValue( Boss , EM_RoleValue_PID , 2 )
				sleep(10)
				--Say(OwnerID() , "Time_2 Debuff ")
			--elseif counter3 == 420 then -----���Ѯɶ��ӱ���g�ɾ���
				--WriteRoleValue( Boss , EM_RoleValue_PID , 3 )
			elseif counter4 >= 70 then  ----�p�ɾ����m
				counter1 = 0
				counter2 = 0
				counter4 = 0
			end
		end
	end
end


function Lua_apon_102683_fight()
	local Skill = {494594, 494596,494597 } ---�ޯ��A����ˮ`�B����AE�B�Ť����y�N
	local SkillLv = {0 , 0 , 0 , 0 ,}  ---�ޯ൥��
	local Luck = 0
	local SkillIndex = 0
	local Skill_lv_Index = 0
	local BossTarget
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	SetPlot( OwnerID(),"dead","Lua_apon_102683_Boss_dead",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local DK_chose = 0
	local JK_chose = 0
	local JA = 0
	local RD_boss = 0
	local PPLX = 0
	local counter_p2_2 = 0
	local counter_p2_3 = 0	
	local counter_p2_4 = 0
	local counter_p2_5 = 0
	local counter_p3_1 = 0   
	local counter_p3_2 = 0
	local counter_p3_3 = 0	
	local counter_p3_4 = 0 
	
	while 1 do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			Step = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ----�P�_�{�b�n�b���ӼҦ�
			Check_life = 1	
			AddBuff(Boss_AI,505228,0,600) ----�D�n�O�n��AI���騺��A�i�J�@�Ӱj�餤�ϥ�
			if Step == 1 then ----������ܥX�Ӫ��Ҧ�
				--counter_p2_1 = counter_p2_1 + 1 ----�N�����۳�X��
				counter_p2_2 = counter_p2_2 + 1 ---���q�ۦ�_1 and 2
				counter_p2_3 = counter_p2_3 + 1 ----���q�ۦ�_3 and 4
				counter_p2_4 = counter_p2_4 + 1 ----����q��
				if SP_1 == 0 then
					AddBuff(Boss_AI,504826,0,90)
					SP_1 = 1
				end
				-------------------���㪺Boss �򥻩ۦ���------------------------------------------------------------------------------					
				if counter_p2_2 >= 7 and counter_p2_4 <= 37 then
					Luck = Rand( 100 )--�����X�ۥ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---����ˮ`
						SkillIndex = 1
						Skill_lv_Index = 1
						BossTarget = AttackTarget
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE �ˮ`	
						SkillIndex = 2
						Skill_lv_Index = 1
						BossTarget = OwnerID()	
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p2_2 = 0
						
				elseif counter_p2_3 >= 9 and counter_p2_4 <= 37 then 
					Luck = Rand( 100 )--�����X�ۥ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
						BossTarget = HateTargetID()
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					
					local Ball = star_CreateObj( BossTarget , 102924 , 0 , 150 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy
					-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
					SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
					SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
					SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
					SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
					SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
					SetModeEx( Ball , EM_SetModeType_Move, false) ----����
					WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
					WriteRoleValue(Ball, EM_RoleValue_Livetime,5)	
					------------------------------------------------------------------------------------------------------------------------------------------------
					CastSpellLV( Ball , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p2_3 = 0
				---------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
				
				elseif counter_p2_4 >= 38 then
					counter_p2_1 = 0   
					counter_p2_2 = 0
					counter_p2_3 = 0	
					counter_p2_4 = 0   
				end
			
			elseif Step == 2 then ----�D�k������Debuff ���ɨ�
				SP_1 = 0 ----�ҰʤU�@��������
				counter_p3_1 = counter_p3_1 + 1 ----���� Debuff ���q
				counter_p3_2 = counter_p3_2 + 1 ---���q�ۦ�_1 and 2
				counter_p3_3 = counter_p3_3 + 1 ----���q�ۦ�_3 and 4
				counter_p3_4 = counter_p3_4 + 1 ----����q��
			
				if counter_p3_1 == 1 or counter_p3_1 == 12 or counter_p3_1 == 25 or counter_p3_1 == 36 then
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_9]" , 1 )---�i�����U���ͪ��I�N�������A�Ӽ��ǧA���ݯ}�����ߧa�I
					
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 494556 , 1 )					
					sleep(10)
				end
				
				-------------------���㪺Boss �򥻩ۦ���-----------------------------------------------------------------------------------------------------------------------					
				if counter_p3_2 >= 7 and counter_p3_4 <= 37 then
					Luck = Rand( 100 )--�����X�ۥ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---����ˮ`
						SkillIndex = 1
						Skill_lv_Index = 1
						BossTarget = AttackTarget
						--Say(OwnerID() , "Skill__1")
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE �ˮ`	
						SkillIndex = 2
						Skill_lv_Index = 1
						BossTarget = OwnerID()	
						--Say(OwnerID() , "Skill__2")
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p3_2 = 0
						
				elseif counter_p3_3 >= 9 and counter_p3_4 <= 37 then 
					Luck = Rand( 100 )--�����X�ۥ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
						SkillIndex = 3
						Skill_lv_Index = 1
						BossTarget = HateTargetID()
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					
					local Ball = star_CreateObj( BossTarget , 102924 , 0 , 150 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy
					-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
					SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
					SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
					SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
					SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
					SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
					SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
					SetModeEx( Ball , EM_SetModeType_Move, false) ----����
					WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
					WriteRoleValue(Ball, EM_RoleValue_Livetime,5)	
					------------------------------------------------------------------------------------------------------------------------------------------------
					CastSpellLV( Ball , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p3_3 = 0
					---------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
				
				elseif counter_p3_4 >= 38 then
					counter_p3_1 = 0   
					counter_p3_2 = 0
					counter_p3_3 = 0	
					counter_p3_4 = 0
					
				end
			end
			
		elseif HateListCount( OwnerID() ) == 0 then
			Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
			--WriteRoleValue( Boss_AI, EM_RoleValue_PID, 1)
			roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0	
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				if PPL==0 then-----------------------------�ˬd�̭��O�_ ���S���H
					WriteRoleValue( Boss_AI, EM_RoleValue_PID, 1)
					sleep(30)
				
				elseif PPL ~= 0 then  -----------------------------���H���O�i�঳gm�Ϊ̦��H
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------�h�ˬd�̭����H�O�_�O���H�Ϊ�gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then 
							PPLX=PPLX+1
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
					end
					
					if PPL<=PPLX then ---------���۵�  ����̭����O���H�Ϊ�gm  �ҥH���m
						WriteRoleValue( Boss_AI, EM_RoleValue_PID, 1) ----�n�O�۵����ܦ^���D��A�i�歫�m
						sleep(30)
						break
					elseif PPL > PPLX then ----�N����W�٦����H�A�~��԰�
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
							SetAttack( OwnerID() , ID_2[i] )
							PPLX = 0
							PPL = 0
						end
					end
				end
			end	
		end
	end
end
