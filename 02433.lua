function cl_139_105663EZ() ----���a�k��
	local skill_497615 = 0
	local skill_497617 = 0
	local skill_497618 = 0
	local CombatBegin = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP3 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE ) 
				addbuff ( OwnerID() , 509729 , 0 , -1 ) ----��BOSS�@�Ӱ�����tBUFF(���n)
			end
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				skill_497615 = skill_497615 + 1
				skill_497617 = skill_497617 + 1
				skill_497618 = skill_497618 + 1
				if skill_497617 >= 4 then
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 15 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --�ˬd�k�k��
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 5 ) ---
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --�ˬd�k�k��
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 5 ) ---
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep( 30 )
					skill_497618 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				sleep ( 30 )
				CancelBuff_NoEvent( OwnerID() , 509729 ) ----�M�����y��BUFF
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP3 )
			end
		end
	end
end
function cl_139_105679EZ() ----���a�k��
	local skill_497615 = 0
	local skill_497617 = 0
	local skill_497618 = 0
	local CombatBegin = 0
	local open = 0
	local open_time = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP1 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE )
			end
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				skill_497615 = skill_497615 + 1
				skill_497617 = skill_497617 + 1
				skill_497618 = skill_497618 + 1
				if skill_497617 >= 4 then
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 15 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 30 )
					skill_497618 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP1 )
			end
			--[[if open == 0 then
				local Search = SearchRangeNPC ( OwnerID() , 50 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105870 and 
							ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS�O�_�s�b -12�H��
							local dir = ReadRoleValue ( OwnerID() ,  EM_RoleValue_Dir )
							AdjustFaceDir( OwnerID(), Search[i], 0 ) --�Ϧۤv���V�ؼ�
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_CUTE2 )
							sleep ( 20 )
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP1 )
							SetDir ( OwnerID() , dir )
							open = 1	
							break							
						end
					end
				end
			elseif open == 1 then
				open_time = open_time + 1
				if open_time >= 20 then
					open = 0
					open_time = 0
				end
			end]]--
		end
	end
end
function cl_139_105652EZ() ----�ǹФk��
	local skill_497615 = 0
	local skill_497617 = 0
	local skill_497618 = 0
	local CombatBegin = 0
	local open = 0
	local open_time = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP2 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE )
			end
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				skill_497615 = skill_497615 + 1
				skill_497617 = skill_497617 + 1
				skill_497618 = skill_497618 + 1
				if skill_497617 >= 4 then
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 15 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 10 )
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 30 )
					skill_497618 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP2 )
			end
			--[[if open == 0 then
				local Search = SearchRangeNPC ( OwnerID() , 50 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105870 and 
							ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS�O�_�s�b -12�H��
							local dir = ReadRoleValue ( OwnerID() ,  EM_RoleValue_Dir )
							AdjustFaceDir( OwnerID(), Search[i], 0 ) --�Ϧۤv���V�ؼ�
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_CUTE2 )
							sleep ( 20 )
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP2 )
							SetDir ( OwnerID() , dir )
							open = 1	
							break							
						end
					end
				end
			elseif open == 1 then
				open_time = open_time + 1
				if open_time >= 20 then
					open = 0
					open_time = 0
				end
			end]]--
		end
	end
end
function cl_139_497669EZ()--------�����H�q�����N
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi??�a?~�O��?�b?�쪺�a?
	local X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------?���O���XAttackplayer��������?�H���y?
	local ball = CreateObj( 105876 , X1+20, Y1 , Z1+20 , 0 , 1 )  ------------
	AddToPartition ( ball,RoomID ) ----����[�J?��,�Ҧ椽��
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
	SetAttack( ball , AttackTarget)
end
function cl_139_105660EZ()
	local CombatBegin = 0
	local rand_Motion = 0
	local ch_Motion = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
			if ReadRoleValue ( OwnerID() , EM_RoleValue_NpcOnMove ) == 0 then
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_GATHER_LOOP )
			end
		end
	end
end
function cl_139_105657EZ()
	local skill = 0
	local skill_1 = 0
	local CombatBegin = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
			end	
			skill = skill + 1
			skill_1 = skill_1 + 1
			if skill >= 2 then
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_ATTACK_1H )
				sleep ( 10 )
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
				skill = 0
			end
			if skill_1 >= 4 then
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_ATTACK_2H )
				sleep ( 10 )
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
				skill_1 = 0
			end
		end
	end
end
--------------------���ީǱM��------------------------
function cl_139_00_01_P1EZ() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105870,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105869,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105869,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_00_01_P1wark01EZ" , 0 )
end
function cl_139_00_01_P1wark01EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_00_01_P1EZ" , 0 )
end
function cl_139_01_02_P1EZ() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105870,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105867,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105867,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105867,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_01_02_P1wark01EZ" , 0 )
end
function cl_139_01_02_P1wark01EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_01_02_P1EZ" , 0 )
end
function cl_139_03_04_P1EZ() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105871,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105872,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105872,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105872,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_03_04_P1wark01EZ" , 0 )
end
function cl_139_03_04_P1wark01EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_03_04_P1EZ" , 0 )
end
function cl_139_04_05_P1EZ() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105872,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105872,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_04_05_P1wark01EZ" , 0 )
end
function cl_139_04_05_P1wark01EZ()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_04_05_P1EZ" , 0 )
end