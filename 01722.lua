function Apon_102475_timer_Easy() ---�p�ɾ��Ǫ��M��
	while 1 do 
		sleep(10)
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--�NPID����Boss��GIDŪ�X��
		local counter1 = 0
		local counter2 = 0
		local Check_Boss = 0 ---�g�ɾ������
		while 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1
			if counter1 == 1 then
				AddBuff(Boss,504215,0,-1) ---Mod_1
				--say (OwnerID(),"Mod_1")
			elseif counter1 == 40 then
				AddBuff(Boss,504216,0,-1) ---Mod_2
				--say (OwnerID(),"Mod_2")
			elseif counter1 == 70 then  --���m
				counter1 = 0
			end
		end
	end
end


function Apon_102475_Die_Easy()---Boss���`�@��
	local Clear_7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
	local Boss_Door_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	PlayMotionEX( Boss_Door_2 ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( Boss_Door_2 , EM_SetModeType_Obstruct , false )
	Hide( Boss_Door_2 )
	Show( Boss_Door_2 , RoomID )
	Delobj(Clear_7)
end



function Apon_102475_AI_Easy()---Boss����AI
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_Door_2 = CreateObjByFlag( 103801 , 780389 , 4 , 1 )
	SetModeEx( Boss_Door_2   , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Boss_Door_2   , EM_SetModeType_Obstruct, true )--����
	SetModeEx( Boss_Door_2   , EM_SetModeType_Mark, false )--�аO
	Hide(Boss_Door_2)
	Show(Boss_Door_2,roomid1)
	AddToPartition( Boss_Door_2,roomid1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register8   , Boss_Door_2 )
	local Check_pet = 0  ---�P�_�d���i�J�԰���
	while 1 do 
		sleep(10)
		local Mode1 = 504215
		local Mode2 = 504216
		--local Mode3 = 504260 ---²���ƥ����ݭn�g�ɾ���
		local jail_flag = 780418 ----�c�Ф��X��
		local king_flag = 780387 ----�������ͺX�СA�ĤG��
		local CombatBegin = 0	-------------�԰��}�l�X��
		local Skill = { 493715, 493714 , 493718 , 493717 , 493716 , 493861 , 493860}--Boss�ޯ��A1. �q�ϱ١B2. �����H�����ˡB3. �����H��AE�w�B4. �Z���X��SP�B5. ��t�쪱�a�J�c�СB6. Boss �g�ɧޡB7.���
		local SkillLv = {0 , 2 , 0 , 0 , 0 , 0 , 0}  ---�ޯ൥��
		local SkillString = { "[SC_102475_01]" , "[SC_102475_02]" , "[SC_102475_03]" , "[SC_102475_04]" , "[SC_102475_05]" , "[SC_102475_06]" , "[SC_102475_07]" }  ----�X��string
----------------1. ���z�������I���t����k�������֡I  2. �z�p���رڡI���ƬO�A�s���W�r�I 3. ����̪��P���M�o�X�j�j����q 
------------------4. ���L�a���ܡH ����q�N�F�����ƭ̪��@��I  5.�b���a�I����a�I ���ơI 6. �L���������I�A�w�L���󪺾��|�F�I�A�h���b���]�L�k����o�@�����o�͡I   7. ���ơI�ίܮz���������|�u���������a�I�I
		local jail_Rand = {} 
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
		local PPL = SetSearchAllPlayer(roomid1 )
		local counter_p1_1 = 0   
		local counter_p1_2 = 0   
		local counter_p1_3 = 0     
		local counter_p1_4 = 0 
		local counter_p1_5 = 0
		local counter_p1_6 = 0
		local counter_p2_1 = 0
		local counter_p2_2 = 0
		local counter_p2_3 = 0
		local counter_p2_4 = 0
		local counter_p2_5 = 0
		local counter_p2_6 = 0
		local counter_p3_1 = 0 
		local counter_p3_2 = 0 
		local HateTable_Now = {}
		local jail_buff = {504265,504266,504267}
		local RD_time = 0
		local SW_Mob = 0 ---����l�H�p��
		local SW_Axe = 1 ----������
		local SW_Mod_2_1 = 0 ---��p��
		local SW_Mod_2_2 = 1 ----���p��
		local Luck ----�H���X�ۥ�
		local king_rebon = 0
		
		while 1 do	
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , 780444, 1 )
					Check_pet = 1
				end
					
				local Luck = Rand( 100 )		--------- �X�۶ü�
				local BossTarget = AttackTarget
				local SkillIndex = 1
				if CombatBegin == 0 then ---�԰��Ұʮɵo��
					king_rebon = 1
					SetPlot( OwnerID(),"dead","Apon_102475_Die_Easy",50 )  --���`�@���A�}����
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_08]" , 1 )---�o���t������A�u�����~���J�I
					--Yell( OwnerID() , "[SC_102475_08]" , 5)
					sleep(10)
					
					local Boss_Door_1 = CreateObjByFlag( 103248 , 780389 , 3 , 1 )---�ʦ�J�f��
					SetModeEx( Boss_Door_1   , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( Boss_Door_1   , EM_SetModeType_Obstruct, true )--����
					SetModeEx( Boss_Door_1   , EM_SetModeType_Mark, false )--�аO
					Hide(Boss_Door_1)
					Show(Boss_Door_1,roomid1)
					AddToPartition( Boss_Door_1,roomid1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register7   , Boss_Door_1 )
					
					CastSpellLV( OwnerID() , BossTarget , 493715 , 0 ) --�}���p��
					sleep(10)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_09]" , 1 )---���⪺�����I���t�I
					--Yell( OwnerID() , "[SC_102475_09]" , 5)
					sleep(15)
					CastSpellLV( OwnerID() , BossTarget , 493714 , 2 ) --�}���p��
					sleep(10)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_14]" , 1 )---�N�b�����v�a�I
					--Yell( OwnerID() , "[SC_102475_14]" , 5)
					sleep(20)
					
					local Timer = CreateObjByFlag( 103240 , 780385 , 1 , 1 )---�إX�ɶ��O�ƾ�
					WriteRoleValue( Timer , EM_RoleValue_PID , OwnerID() ) ---�NBoss��GID�g�J�p�ƾ���PID��
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1   , Timer ) ---�N�p�ɾ�GID�g�JBoss�� Register1 ��   
					SetModeEx( Timer   , EM_SetModeType_Show, true )
					SetModeEx( Timer  , EM_SetModeType_Mark, false )
					AddToPartition( Timer,roomid1 )
					Show(Timer,roomid1)
					local Mob_killer = CreateObjByFlag( 103245 , 780387 , 1 , 1 )----�ͥX�@�ӱ��p�����H�Ϊ��Ǫ� Vistoar
					WriteRoleValue( OwnerID() , EM_RoleValue_Register3   , Mob_killer )
					AddToPartition( Mob_killer,roomid1 )
					Show(Mob_killer,roomid1)
					CombatBegin = 1
					sleep(20)
				end
				
				if CheckBuff(OwnerID() , Mode1) == true then ---�X��&����Y�����Ǫ����q
					counter_p1_1 = counter_p1_1 + 1 ---�X�Ǯɶ�
					counter_p1_2 = counter_p1_2 + 1 ----����Y�ɶ�
					counter_p1_3 = counter_p1_3 + 1 ----���q�ۦ�
					counter_p1_4 = counter_p1_4 + 1 ----���q�ۦ��ɶ������
					counter_p1_5 = counter_p1_5 + 1 
					counter_p1_6 = counter_p1_6 + 1 ----Mod_1 �Ҧ�counter �k�s��
					
					Luck = Rand( 100 )--�����X�ۥ�
					
					if counter_p1_1 >= 1 then ---�T���ǲM�����q
						SW_Mod_2_1 = 0
						SW_Mod_2_2 = 0
						local Mob_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
						local Mob_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
						local Mob_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
						local OP_1 = ReadRoleValue(Mob_1,EM_RoleValue_PID) 
						local OP_2 = ReadRoleValue(Mob_2,EM_RoleValue_PID) 
						local OP_3 = ReadRoleValue(Mob_3,EM_RoleValue_PID) 
						sleep(10)
						Delobj(Mob_1)
						Delobj(Mob_2)
						Delobj(Mob_3)
						CancelBuff(OP_1,504265)
						CancelBuff(OP_2,504266)
						CancelBuff(OP_3,504267)
					end
					
					if counter_p1_6 >= 36 then
						counter_p1_1 = 0
						counter_p1_2 = 0
						counter_p1_3 = 0
						counter_p1_4 = 0
						counter_p1_5 = 0
						counter_p1_6 = 0
						SW_Mob = 0 ---����l�H�p��--�N�o��ӭ��m
						SW_Axe = 1 ----������
					end	
					
					if counter_p1_1 >= 2 and SW_Mob == 0 then ---�X�l�H�p�ǡA�u�X�@��
						SW_Axe = 0
						SW_Mob = 1
						local Mob_killer = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)---�N�������H���p�Ǫ�GidŪ�X��
						local MobTarget = 0
						CastSpellLV( OwnerID() , OwnerID() , 493866 , 0 )---�s�p�ǥX���ɥ�
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_10]" , 1 )---���B�o�X�F���T�A���@�ѯ�q���b����
						Yell( OwnerID() , "[SC_102475_10]" , 5)
						
						sleep(20)---���k�N�n��2��
						for i = 1 , 100 , 1 do
							MobTarget = HateTargetID()
							if ReadRoleValue( MobTarget , EM_RoleValue_IsDead ) ~= 1 then  ----�N�H�����@�H�]�w���ؼ�
								local Mob_X = ReadRoleValue (MobTarget , EM_RoleValue_X) --Ū�X�Ӯy��	
								local Mob_Y = ReadRoleValue (MobTarget , EM_RoleValue_Y) --Ū�X�Ӯy��	
								local Mob_Z = ReadRoleValue (MobTarget , EM_RoleValue_Z) --Ū�X�Ӯy��	
								local Mob_Dir = ReadRoleValue (MobTarget , EM_RoleValue_Dir) --Ū�X�Ӯy��	
								local Mob = CreateObj( 103243 , Mob_X+80 , Mob_Y , Mob_Z ,Mob_Dir , 1 ) 
								AddToPartition( Mob,roomid1 )
								sysCastSpellLV( Mob , Mob  , 493900 , 1 )---�����H�X�ӫe���S��
								WriteRoleValue( Mob , EM_RoleValue_PID , MobTarget )----�N���a��GID�s�J��l�H�Ǫ�PID��
								Hide(Mob)
								Show(Mob,roomid1)
								WriteRoleValue( Mob , EM_RoleValue_PID , Mob_killer )
								SetAttack( Mob ,MobTarget  ) ----�H����@�ӥؼ�
								sysCastSpellLV( MobTarget , Mob  , 493865 , 999 )---�t�������a�X�ۡy���a��Ǫ��D�]�z
								
								BeginPlot(Mob,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
								counter_p1_1 = 0
								break ---�p�G����F���h���X�o��for�j��
							end
						end
					
					RD_time = Rand(5)
					
					elseif counter_p1_2 >=(9+RD_time) and SW_Axe == 0 then
						local Mobtarget_1 = 0
						SkillIndex = 7 
						for i = 1 , PPL , 1 do 
							Mobtarget_1 = HateTargetID()
							if ReadRoleValue( Mobtarget_1 , EM_RoleValue_IsDead ) ~= 1 then  ----�N�H�����@�H�]�w���ؼ�
								local MessageString
								local PlayerName = GetName( Mobtarget_1 )
								MessageString = "[SC_102475_07][$SETVAR1="..PlayerName.."]" ----�bstring���i�H�q�X���a���W�r
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								Yell( OwnerID() , MessageString , 5)
								
								sleep(20)
								CastSpellLV( OwnerID(), Mobtarget_1, 493860 , 1) ---�惡�ؼа��X��򪺰ʧ@
								sleep(30)
								local Axe_X = ReadRoleValue (Mobtarget_1 , EM_RoleValue_X) --Ū�X�Ӯy��	
								local Axe_Y = ReadRoleValue (Mobtarget_1 , EM_RoleValue_Y) --Ū�X�Ӯy��	
								local Axe_Z = ReadRoleValue (Mobtarget_1 , EM_RoleValue_Z) --Ū�X�Ӯy��	
								local Axe_Dir = ReadRoleValue (Mobtarget_1 , EM_RoleValue_Dir) --Ū�X�Ӯy��	
								local Axe = CreateObj( 103244 , Axe_X , Axe_Y , Axe_Z ,Axe_Dir , 1 ) ---�N���Y�ͦb�ӥؼЪ��I�W
								WriteRoleValue( Axe , EM_RoleValue_PID , OwnerID() )
								WriteRoleValue( OwnerID() , EM_RoleValue_Register2   , Axe )----�N���Y��GID�s�JBoss���G
								--SetModeEx( Axe   , EM_SetModeType_Move, false )--����
								SetModeEx( Axe   , EM_SetModeType_ShowRoleHead, false )--�Y����
								SetFightMode ( Axe,0,0,0,0)---�����Ҧ��\��
								AddToPartition( Axe,roomid1 )
								Hide(Axe)
								Show(Axe,roomid1)
								SetAttack( Axe ,Mobtarget_1  ) ----��@�ӥؼ�
								CastSpellLV( Axe , Axe , 493862 , 0 )---���Y���U���ˮ`
								sysCastSpellLV( Axe , Axe  , 493863 , 1) --- ���Y�o�X���p�ǥ�
								sleep(20)
								Delobj(Axe)---���Y���U��h����
								SW_Axe = 1
								SW_Mob = 0
								counter_p1_2 = 0
								break
							end
						end
					
					elseif counter_p1_3 >= 6 and counter_p1_4 <= 28 then ---�@�몺�ޯ�
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
								SkillIndex = 2
								BossTarget = HateTargetID()									
						end		
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							--Yell( OwnerID() , SkillString[SkillIndex] , 5)
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
							sleep(10)
							counter_p1_3 = 0
					
					elseif counter_p1_5 >= 10 and counter_p1_4 <= 22 then ---�H���AAE�w
						if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 100) then
							SkillIndex = 3
							BossTarget = OwnerID()
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							--Yell( OwnerID() , SkillString[SkillIndex] , 5)
							sleep(10)
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						end
						counter_p1_5 = 0
					end
					
				elseif CheckBuff(OwnerID() , Mode2) == true then ---�T�Ӿ|�p�ǰl�T�H���q
					
					Luck = Rand( 100 )--�H���X�ۥ�
					jail_Rand = {}
					HateTable_Now = {}---�ݭn�A�NHateTable_Now���M��
					counter_p2_1 = counter_p2_1 + 1 ----��T�ӤH���q
					counter_p2_2 = counter_p2_2 + 1  -----�T���ǲM�����q
					counter_p2_3 = counter_p2_3 + 1   ----���q�ۦ����q
					counter_p2_4 = counter_p2_4 + 1    ----����ɶ���
					counter_p2_5 = counter_p2_5 + 1     ----�H���ۦ���
					counter_p2_6 = counter_p2_6 + 1      ----Mod_2 �Ҧ�counter �k�s��
					
					if counter_p2_6 >= 28 then
						counter_p2_1 = 0
						counter_p2_2 = 0
						counter_p2_3 = 0
						counter_p2_4 = 0
						counter_p2_5 = 0
						counter_p2_6 = 0
					end
					
					if counter_p2_1 >= 2 and SW_Mod_2_1 == 0 and counter_p2_4 <= 27 then ---��T�ӤH���q
					
						counter_p2_1 = 0
						SW_Mod_2_1 = 1
						SW_Mod_2_2 = 1
						local Rand_Chose = 0
						SkillIndex = 5
						ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , OwnerID()  , Skill[SkillIndex] , SkillLv[SkillIndex] ) 
						sleep(10)
						jail_Rand = DW_HateRemain(1) ---�o��table���S������̰���
						
						for i = 1, table.getn(jail_Rand) do
							if ReadRoleValue( jail_Rand[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( jail_Rand[i] , EM_RoleValue_VOC ) ~= 0 then  
								table.insert( HateTable_Now , jail_Rand[i] ) ---�N���T���ȡA��JHateTable��
							end
						end
						
						for i = 1 , 3 , 1 do ---���T�Ӫ��a
							Rand_Chose = DW_Rand( table.getn (HateTable_Now))
							
							if HateTable_Now[Rand_Chose] ~= nil then 
							
								if i == 1 then ---103250---���b�T�w�I�ͥX�A�H�b�ؼЪ��a����ͥX
									local Mob_X_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_X) --Ū�X�Ӯy��	
									local Mob_Y_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Y) --Ū�X�Ӯy��	
									local Mob_Z_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Z) --Ū�X�Ӯy��	
									local Mob_Dir_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Dir) --Ū�X�Ӯy��	
									local Mob_1 = CreateObj( 103250 , Mob_X_1+80 , Mob_Y_1 , Mob_Z_1 ,Mob_Dir_1 , 1 ) 
									--SetModeEx( Mob_1   , EM_SetModeType_ShowRoleHead, false )--�Y����
									--SetModeEx( Mob_1   , EM_SetModeType_Fight, false )--���i���
									WriteRoleValue( OwnerID() , EM_RoleValue_Register4   , Mob_1 )
									WriteRoleValue( Mob_1 , EM_RoleValue_PID , HateTable_Now[Rand_Chose] )---�N�Q�D�������a�s�J�Ǫ���PID��
									AddToPartition( Mob_1,roomid1 )
									Hide(Mob_1)
									Show(Mob_1,roomid1)
									SetAttack( Mob_1 ,HateTable_Now[Rand_Chose]) ----�H����@�ӥؼ�
									AddBuff(HateTable_Now[Rand_Chose],504265,0,-1)---�Ǫ�1��Buff
									sysCastSpellLV( HateTable_Now[Rand_Chose] , Mob_1  , 493865 , 999 )---�t�������a�X�ۡy���a��Ǫ��D�]�z
									BeginPlot(Mob_1,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
									
								elseif i == 2 then ---103242
									local Mob_X_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_X) --Ū�X�Ӯy��	
									local Mob_Y_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Y) --Ū�X�Ӯy��	
									local Mob_Z_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Z) --Ū�X�Ӯy��	
									local Mob_Dir_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Dir) --Ū�X�Ӯy��	
									local Mob_2 = CreateObj( 103242 , Mob_X_2+80 , Mob_Y_2 , Mob_Z_2 ,Mob_Dir_2 , 1 ) 
									--SetModeEx( Mob_2   , EM_SetModeType_ShowRoleHead, false )--�Y����
									--SetModeEx( Mob_2   , EM_SetModeType_Fight, false )--���i���
									WriteRoleValue( OwnerID() , EM_RoleValue_Register5   , Mob_2 )
									WriteRoleValue( Mob_2, EM_RoleValue_PID , HateTable_Now[Rand_Chose] )---�N�Q�D�������a�s�J�Ǫ���PID��
									AddToPartition( Mob_2,roomid1 )
									Hide(Mob_2)
									Show(Mob_2,roomid1)
									SetAttack( Mob_2 ,HateTable_Now[Rand_Chose]  ) ----�H����@�ӥؼ�
									AddBuff(HateTable_Now[Rand_Chose],504266,0,-1)---�Ǫ�2��Buff
									BeginPlot(Mob_2,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
									sysCastSpellLV( HateTable_Now[Rand_Chose] , Mob_2  , 493865 , 1 )---�t�������a�X�ۡy���a��Ǫ��D�]�z
									
								elseif i == 3 then  ----103247
									local Mob_X_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_X) --Ū�X�Ӯy��	
									local Mob_Y_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Y) --Ū�X�Ӯy��	
									local Mob_Z_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Z) --Ū�X�Ӯy��	
									local Mob_Dir_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Dir) --Ū�X�Ӯy��	
									local Mob_3 = CreateObj( 103247 , Mob_X_3+80 , Mob_Y_3 , Mob_Z_3 ,Mob_Dir_3 , 1 ) 
									--SetModeEx( Mob_3   , EM_SetModeType_ShowRoleHead, false )--�Y����
									--SetModeEx( Mob_3   , EM_SetModeType_Fight, false )--���i���
									WriteRoleValue( OwnerID() , EM_RoleValue_Register6   , Mob_3 )
									WriteRoleValue( Mob_3 , EM_RoleValue_PID , HateTable_Now[Rand_Chose] )---�N�Q�D�������a�s�J�Ǫ���PID��
									AddToPartition( Mob_3,roomid1 )
									Hide(Mob_3)
									Show(Mob_3,roomid1)
									SetAttack( Mob_3 ,HateTable_Now[Rand_Chose]  ) ----�H����@�ӥؼ�
									AddBuff(HateTable_Now[Rand_Chose],504267,0,-1)---�Ǫ�3��Buff
									BeginPlot(Mob_3,"LuaS_Discowood_CheckPeace",0)  --�Y�O8.5�����i�J�԰����A�N�|����
									sysCastSpellLV( HateTable_Now[Rand_Chose] , Mob_3  , 493865 , 1 )---�t�������a�X�ۡy���a��Ǫ��D�]�z
								end
							else
								break
							end
							table.remove ( HateTable_Now , Rand_Chose) ---�N���H�qtable������
						end
					
					elseif counter_p2_3 >= 5 and counter_p2_4 <= 27 then ---�@�몺�ޯ�
						
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
								SkillIndex = 2
								BossTarget = HateTargetID()									
						end		
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
							sleep(10)
							counter_p2_3 = 0
					
					elseif counter_p2_5 >= 10 and counter_p2_4 <= 22 then ---�H���ASP��
						if (Luck >= 0 and Luck < 30) or (Luck >= 70 and Luck < 100) then
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_13]" , 1 )
							Yell( OwnerID() , "[SC_102475_13]" , 5)
							sleep(10)
							CastSpellLV( OwnerID(), OwnerID(), 493868 , 0) ---Boss�e�誺���ζˮ`
							sleep(30)
						end
						sleep(10)
						counter_p2_5 = 0
					end
				end
			else
				SetPosByFlag( OwnerID(), king_flag , 2 )
				local Clear_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				local Clear_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				local Clear_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
				local Clear_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
				local Clear_5 = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
				local Clear_6 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
				local Clear_7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
				Delobj(Clear_1)
				Delobj(Clear_2)
				Delobj(Clear_3)
				Delobj(Clear_4)
				Delobj(Clear_5)
				Delobj(Clear_6)
				Delobj(Clear_7)
				if king_rebon == 1 then
					local Clear_8 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
					Delobj(Clear_8)
					local king = Lua_DW_CreateObj( "flag" ,103241, king_flag , 2,1,1)---�NBoss�ͤ@���s��
					Delobj(OwnerID())
				end
			end
		end
	end
end

				

function Apon_103241_mob_dead_Easy() ---Mod_1 �����H�M��
	local OP = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while 1 do 
		sleep(10)
		if CheckBuff( OwnerID() , 504219) == true then ---�p�G�Q���Y����
			AddBuff(OwnerID(),504262,1,-1) --�u����Buff
			--Say(OwnerID() , "Error")---�����H��t�X�u��	
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--����
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--���i�������
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )--����
			Say( OwnerID() , "[SC_102475_11]")---�M�I��M�I�I�ثe���駹�������I
			sleep(10)
			Say( OwnerID() , "[SC_102475_12]")---�Ұʦۧڷ����˸m�I
			sleep(10)
			CastSpellLV( OwnerID(), OwnerID(), 493867 , 50)---�d��AE�A�w��3000
			SetFightMode ( OwnerID(),0, 0, 0,0 )
			Delobj (OwnerID())
		end
	end
end				
						
					

				
					