function cl_Z21_05_06_NO2_EZ() --5~6.7����������
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106353,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106353,Matrix,1,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106088,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106086,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106087,Matrix,3,1)
	--ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,-1)
	--ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,1)
	--ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark05_06_NO2_EZ" , 0 )
end
function cl_z21_wark05_06_NO2_EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_05_06_NO2_EZ" , 0 )
end
function cl_Z21_04_05_NO2_EZ() --5~6.7����������
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106350,Matrix,1,-1)
	BeginPlot( ObjMatrix[1] , "LuaS_Discowood_NowToHide" , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106350,Matrix,1,1)
	BeginPlot( ObjMatrix[2] , "LuaS_Discowood_NowToHide" , 0 )
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark04_05_NO2_EZ" , 0 )
end
function cl_z21_wark04_05_NO2_EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_04_05_NO2_EZ" , 0 )
end
function cl_21_106086Archer_EZ() ---�����L�h���}�b��AI
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->�����b
	local skill_time2 = 0 ---->�ؼ���w+����
	--local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( me ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
			--	skill_time3 = skill_time3 + 1
				if skill_time1 >= 1 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497591 , 70 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep(10)
					skill_time1 = 0
				end
				if skill_time2 >= 5 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					if hate >= 1 then
						local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
						if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_IsDead ) ~= 1 then
							CastSpelllv ( me , hate_Table[Rand_Num] , 497589 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
							sleep ( 10 )
							skill_time2 = 0
						end
					end
				end
				--[[if skill_time3 >= 9 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					local hate_Table_2 = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate_2=table.getn(hate_Table_2) ----���X��������ƶq
					if hate_2 >= 1 then
						local Rand_Num_2 = DW_Rand(hate_2)  ----�H����@�ӭȥN��TABLE�̪���m
						if ReadRoleValue( hate_Table_2[Rand_Num_2] , EM_RoleValue_IsDead ) ~= 1 then
							WriteRoleValue (  me , EM_RoleValue_Register2 , hate_Table_2[Rand_Num_2] )
							addbuff ( hate_Table_2[Rand_Num_2] , 620810 , 0 , 60 )
							CastSpelllv ( me , me , 498480 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
							sleep ( 50 )
							skill_time3 = 0
						end
					end
				end]]--
			end
		elseif HateListCount ( me ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				--skill_time3 = 0
			end
		end
	end
end
function cl_21_106089Fatal_EZ() ---�����w�溸�P�R��
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->�����b
	local skill_time2 = 0 ---->�ؼ���w+����
	local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( me ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
				--skill_time3 = skill_time3 + 1
				if CheckBuff( me , 502717 ) == true then
					CastSpelllv ( me , me , 498260 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep (15)
					CastSpelllv ( me , me , 498259 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 30 )
				end
				if skill_time2 >= 3 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497405 , 100 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep(30)
					skill_time2 = 0
				end
				if skill_time1 >= 13 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( me , me , 498259 , 100 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep(30)
					skill_time1 = 0
				end
			end
		elseif HateListCount ( me ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				skill_time3 = 0
			end
		end
	end
end