------�ƺ��������l�H��
----------�@�}�l�԰��A�h�|��ؼа۪k�T���A�|�{�쪱�a����A�s���F��
--------------�C�j 7 ��A�|���_���s��q�¤T�W���a
function Lua_apon_Zone120_102689()
	while 1 do 
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local BossTarget 
		local SP = 1 
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				R_game = 1
				if SP == 1 then
					SP = 0 
					CastSpellLV( OwnerID() , AttackTarget , 494717 , 1000 )--���B�N
					sleep(75)
				end
				
				if counter1 >= 7 then
					for i = 1 , 3 ,1 do
						BossTarget = HateTargetID()
						CastSpellLV( OwnerID() , BossTarget , 494720 , 2000 ) --�q���N
					end
					counter1 = 0
					
				elseif counter2 >= 12 then
					BossTarget = HateTargetID()
					CastSpellLV( OwnerID() , BossTarget , 494717 , 1000 )--���B�N
					sleep(75)
					counter2 = 0
				end
			else 
				break
			end
		end	
	end
end
----------���p���y�]�~�����
-------------1. �o�@�ӭ���k�N�A�åB�y�� 3000 �I�ˮ`�C�����ؼЫ� 2 ��A���ͤ@���]�~�A�b�ؼЪ��e���A�åB�|�����ؼСC
function Lua_apon_Zone120_102684()
	while 1 do 
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local BossTarget 
		local SP = 1
		local Mob_all = {}
		local Mob
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local R_game = 0
		local All_mob = 0
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				R_game = 1
				
				for i = 1 , table.getn(Mob_all), 1 do
					if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
						table.remove ( Mob_all , i)
					end	
				end
				
				All_mob = table.getn(Mob_all)
				if SP == 1 and counter1 >= 5 and All_mob <= 2 then -----494716�A�a��۳�N
					BossTarget = HateTargetID()
					CastSpellLV( OwnerID() , BossTarget , 494716 , 1 ) --�a��۳�N
					sleep(20)
					local Ball_2 = star_CreateObj( BossTarget , 102702 , 20 , 0 , 0 , roomid1 , 0) ---�ͥX���ƪ��X�d��
					SetFightMode ( Ball_2,0,0,0,0 )
					sleep(20)
					SetFightMode ( Ball_2,1,1,1,1 )
					SetAttack( Ball_2 , BossTarget )
					BeginPlot(Ball_2,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					table.insert( Mob_all , Ball_2 )
					SP = 0
					counter1 = 0
				
				elseif counter2 >= 7 then
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , 494702 , 10 )--�r��
					sleep(10)
					counter2 = 0
				
				elseif counter3 >= 15 then
					SP = 1 ---�i�H�A�ۤ@���]�~
					CastSpellLV( OwnerID() , OwnerID() , 494721 , 1 )---�]�~�g�z�N
					sleep(30)
					if Checkbuff(OwnerID(),505381) == true then
						CancelBuff( OwnerID(), 505381 )
						for i = 1 , table.getn(Mob_all), 1 do
							if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
								table.remove ( Mob_all , i)
							end	
						end
						
						for i = 1 , table.getn(Mob_all), 1 do
							Addbuff(Mob_all[i],505366,0,30)
							--CastSpellLV( OwnerID() , Mob_all[i] , 494721 , 1 )---�]�~�g�z�N
						end
					end
					counter3 = 0
				end	
			else 
				break
			end
		end
	end
end

----------�D���@�íx
-----------------1. ��ӧޯ�A�@�ӧ�ؼСA�@�ӧ��H��
function Lua_apon_Zone120_102947()
	while 1 do
		sleep(10)
		local Skill = {494707, 494708} ---�ޯ��A���D�z���B��z����
		local SkillLv = {0 , 0 }  ---�ޯ൥��
		local Luck = 0
		local SkillIndex = 0
		local Skill_lv_Index = 0
		local BossTarget
		local counter1 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				R_game = 1
				if counter1 >= 7 then
					Luck = Rand( 100 )--�����X�ۥ�
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---����ˮ`
						SkillIndex = 1
						Skill_lv_Index = 1
						BossTarget = HateTargetID()
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE �ˮ`	
						SkillIndex = 2
						Skill_lv_Index = 1
						BossTarget = AttackTarget	
					end		
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter1 = 0	
				end	
			else
				break
			end
		end
	end
end
----------���p���y��s��-----�i�h��
-----------------1. ���ͥX�@���i�h�bŢ�l�̡A�i�J�԰���A�h�|�ۥX�]�ƪ��i�h
function Lua_apon_Zone120_102928_1()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 1 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_2()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_1_id = 102692 ----�೽�H
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local Mob_1_id_2 = 102694 ---�]�Ʒ೽�H 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 2 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_3()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 3 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_4()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_1_id = 102692 ----�೽�H
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local Mob_1_id_2 = 102694 ---�]�Ʒ೽�H 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 4 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_5()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 5 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_6()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 6 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_7()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_1_id = 102692 ----�೽�H
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local Mob_1_id_2 = 102694 ---�]�Ʒ೽�H 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 7 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_8()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_1_id = 102692 ----�೽�H
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local Mob_1_id_2 = 102694 ---�]�Ʒ೽�H 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 8 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_9()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 9 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_10()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---�i�h
		local Mob_1_id = 102692 ----�೽�H
		local Mob_id_2 = 102693 ----�]�ƪi�h
		local Mob_1_id_2 = 102694 ---�]�Ʒ೽�H 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 10 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----�q�X
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----�аO
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---����	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---����
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----�]���۳�
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--����
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--����
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----�i�������
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   �]�ʪ`�J
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --���K����
					sleep(30)
					counter2 = 0	
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end







