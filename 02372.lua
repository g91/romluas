function cl_139_105663() ----���a�k��
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
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 26 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --�ˬd�k�k��
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 20 ) ---
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --�ˬd�k�k��
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 20 ) ---
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
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
function cl_139_105679() ----���a�k��
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
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 26 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
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
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105659 and 
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
function cl_139_105652() ----�ǹФk��
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
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 26 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 10 )
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --�ˬd�p�G���OGM�~����H�U
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 20 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
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
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105659 and 
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
function cl_139_497669()--------�����H�q�����N
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi??�a?~�O��?�b?�쪺�a?
	local X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------?���O���XAttackplayer��������?�H���y?
	local ball = CreateObj( 105744 , X1+20, Y1 , Z1+20 , 0 , 1 )  ------------
	AddToPartition ( ball,RoomID ) ----����[�J?��,�Ҧ椽��
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
	SetAttack( ball , AttackTarget)
end
function cl_139_105660()
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
function cl_139_105657()
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
function cl_139_00_01_P1() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105659,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105658,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105658,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_00_01_P1wark01" , 0 )
end
function cl_139_00_01_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_00_01_P1" , 0 )
end
function cl_139_01_02_P1() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105659,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105656,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105656,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105656,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_01_02_P1wark01" , 0 )
end
function cl_139_01_02_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_01_02_P1" , 0 )
end
function cl_139_03_04_P1() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105660,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_03_04_P1wark01" , 0 )
end
function cl_139_03_04_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_03_04_P1" , 0 )
end
function cl_139_04_05_P1() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105662,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_04_05_P1wark01" , 0 )
end
function cl_139_04_05_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_04_05_P1" , 0 )
end
-------------------�Ť�˸m������-----------------------
function cl_Rune_equipment_AI()
	local AI = OwnerID() -- �ŧi����������W��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---Ū��ZONEID
	local number_flag = 0
	local rand_number = 0
	local rand_Rune = 0
	local Rune_table = {105653,105654,105655}
	for i = 1 , 5 , 1 do
		rand_number = DW_Rand(5)
		rand_Rune = DW_Rand(3)
		local Rune_equipment = CreateObjByFlag( Rune_table[rand_Rune] , 780966 , rand_number+number_flag , 1 ) ------------�֬Oboss�n�b���̲���		
		SetModeEx( Rune_equipment , EM_SetModeType_Show, false) ---�q�X	(�_)
		SetModeEx( Rune_equipment , EM_SetModeType_Move, false) ---����	(�_)
		AddToPartition ( Rune_equipment , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( Rune_equipment , EM_RoleValue_Register1 , rand_Rune )
		BeginPlot( Rune_equipment,"cl_Rune_equipment", 0 ) -----��t�T�w�ʧ@�μ@��
		number_flag = number_flag + 5
	end
end
function cl_Rune_equipment() ---�{�q
	local Rune_equipment = OwnerID()
	local RoomID = ReadRoleValue( Rune_equipment , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local skill_number = ReadRoleValue ( Rune_equipment , EM_RoleValue_Register1 )
	local skill_time = 0
	local CombatBegin = 0
	local skill_table = {497858,497859,497857}
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( Rune_equipment , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( Rune_equipment ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				SetModeEx( Rune_equipment , EM_SetModeType_Show, true) ---�q�X	(�_)
				Addbuff ( Rune_equipment , 509873 , 0 , -1 )
				CastSpelllv ( Rune_equipment , Rune_equipment , skill_table[skill_number] , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
				CombatBegin = 1
			end
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				skill_time = skill_time + 1
				if skill_time >= 3 then
					CastSpelllv ( Rune_equipment , Rune_equipment , 497856 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
					ScriptMessage( Rune_equipment , -1 , 2 ,"[SC_139_118583_2]" , 2 )----
					--say ( Rune_equipment , "BBB")
					skill_time = 0
				end
			end
		elseif HateListCount ( Rune_equipment ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				skill_time = 0
				CombatBegin = 0
			end
		end
	end
end
function cl_Rune_SearchRangeNPC() ---�{�q
	local Rune_equipment = OwnerID()
	local RoomID = ReadRoleValue( Rune_equipment , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local skill_number = ReadRoleValue ( Rune_equipment , EM_RoleValue_Register1 )
	local AttackTarget = ReadRoleValue( Rune_equipment , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
	local skill_table = {}
	local most = {}
	local mostbon = {}
	most = SearchRangeNPC ( Rune_equipment , 180 )
	local mostno = table.getn(most)
	for i=1 , mostno , 1 do
		if ReadRoleValue ( most[i] , EM_RoleValue_IsDead ) == 0 then
			if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105652 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105656 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105657 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105658 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105659 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105660 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105661 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105662 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105663 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105679 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105680 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105726 then
				SetAttack( most[i] , AttackTarget)
				say ( most[i] , "[SC_139_RUNE_1]")
			end
		end
	end
end