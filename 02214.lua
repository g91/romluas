function cl_136_01_01() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105232,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark01" , 0 )
end
function cl_136_wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_01_01" , 0 )
end
function cl_136_105262() ----�j�����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local baer = LuaFunc_CreateObjByObj ( 105237 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
	BeginPlot( baer,"cl_136_105237", 0 )  -----------�N����scpipt��i�h�����W,��������
	while 1 do
		sleep (5)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
		elseif star == 3 then
			delobj ( baer )
			sleep ( 30 )
			baer = LuaFunc_CreateObjByObj ( 105237 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
			BeginPlot( baer,"cl_136_105237", 0 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_136_105237() -----------�Q�ޱ����j��------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local CombatBegin = 0
	local skill = 0
	local open = 0
	local xx = 0
	local yy = 0
	local zz = 0
	---SetPlot( OwnerID(), "dead","cl_136_105237_dead", 0 )
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx(OwnerID(),EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_END)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
	SetDefIdleMotion( OwnerID(), ruFUSION_ACTORSTATE_KNOCKDOWN_END )  
	while 1 do
		sleep ( 5 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				WriteRoleValue ( AI , EM_RoleValue_Register1, 1 ) --------��BOSS���O������AI���ͪ�
				open = 1
			end
			if CombatBegin == 1 then
				SetModeEx( OwnerID() , EM_SetModeType_Mark, true )			---�i�I��(�O)
				SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true ) 		---�Y����(�O)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true ) ---�i���(�O)
				SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
				SetModeEx( OwnerID() , EM_SetModeType_HideName , false )
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	(�_)
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1, 3 ) --------��BOSS���O������AI���ͪ�
			end
		end
	end
end
function cl_136_105262_1() ----�ɫ�j�����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local baer = LuaFunc_CreateObjByObj ( 105236 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
	BeginPlot( baer,"cl_136_105236", 0 )  -----------�N����scpipt��i�h�����W,��������
	while 1 do
		sleep (10)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
		elseif star == 3 then
			delobj ( baer )
			sleep ( 10 )
			baer = LuaFunc_CreateObjByObj ( 105236 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
			BeginPlot( baer,"cl_136_105237", 0 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_136_105236() -----------�Q�ޱ����j��------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local CombatBegin = 0
	local skill = 0
	local open = 0
	local xx = 0
	local yy = 0
	local zz = 0
	local go = 0
	---SetPlot( OwnerID(), "dead","cl_136_105237_dead", 0 )
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx(OwnerID(),EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_END)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
	SetDefIdleMotion( OwnerID(), ruFUSION_ACTORSTATE_KNOCKDOWN_END )  
	while 1 do
		sleep ( 5 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			open = DW_Rand(15)  ----->��100�Ӷüƥh�H���@�ӭȥX��
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				sleep ( open )
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				WriteRoleValue ( AI , EM_RoleValue_Register1, 1 ) --------��BOSS���O������AI���ͪ�
				open = 1
			end
			if CombatBegin == 1 then
				SetModeEx( OwnerID() , EM_SetModeType_Mark, true )			---�i�I��(�O)
				SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true ) 		---�Y����(�O)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true ) ---�i���(�O)
				SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
				SetModeEx( OwnerID() , EM_SetModeType_HideName , false )
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	(�_)
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1, 3 ) --------��BOSS���O������AI���ͪ�
			end
		end
	end
end
function cl_136_02_01() -------1~2�����D������
	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105232,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark02" , 0 )
end
function cl_136_wark02()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_02_01" , 0 )
end
function cl_136_105231() -------�˳D�H------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local CombatBegin = 0
	local open = 0
	local x1 = 0
	local y1 = 0
	local z1 = 0
	local skill = 0
	local snake = 0
	local skill_10 = 0
	local skill_16 = 0
	local open2 = 0
	local pot = 0
	local rand_Table = {}
	local rand_number = 0
	local flag_number = 0
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , 0 )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����(�_)--
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�O)
	addbuff ( OwnerID() , 508726 , 0 , -1 ) ----�����ܨ�
	while 1 do
		sleep ( 5 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
					sleep(10)
				end
				CastSpelllv ( OwnerID() , OwnerID() , 497019 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
				pot = Lua_CreateObjByDir( OwnerID() , 105256 , 20 , 0 ) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
				SetModeEx ( pot , EM_SetModeType_Obstruct, false) 		---����(�O)
				SetModeEx( pot , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( pot , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( pot , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( pot , EM_SetModeType_Mark, false)			---�i�I��(�O)
				SetModeEx( pot , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( pot , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( pot , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition ( pot , RoomID ) ----����[�J����,�Ҧ椽��
				sleep ( 50 )
				x1 = ReadRoleValue ( pot, EM_RoleValue_X)
				y1 = ReadRoleValue ( pot, EM_RoleValue_Y)
				z1 = ReadRoleValue ( pot, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
				snake = CreateObj( 105257 , x1, y1 , z1 , 0 , 1 )  ------------�ͥX�]�N�U
				AddToPartition ( snake , RoomID ) ----����[�J����,�Ҧ椽��
				WriteRoleValue ( snake , EM_RoleValue_PID ,OwnerID() ) 
				SetPlot( snake, "dead","cl_105257_dead", 0 )
				SetAttack( snake , AttackTarget )
				delobj ( pot )
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	(�_
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, true) ---����(�_)--
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���(�O)
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill_10 = skill_10 + 1
				skill_16 = skill_16 + 1
				local snake_key = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
				if skill_10 >= 10 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( OwnerID() , AttackTarget , 496649 , 3 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 20 )
					skill_10 = 0
				end
				if skill_16 >= 16 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					rand_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					flag_number = table.getn(rand_Table)
					rand_number = DW_Rand(flag_number)
					CastSpelllv ( OwnerID() ,rand_Table[flag_number] , 497035 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 20 )
					skill_16 = 0
				end
				if snake_key == 1 then
					skill = skill + 1
					if skill >= 15 then 
						if CheckBuff( OwnerID() , 508726 ) == false then
							addbuff ( OwnerID() , 508726 , 0 , -1 ) ----�����ܨ�
						end
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(10)
						end
						SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_
						SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����(�_)--
						CastSpelllv ( OwnerID() , OwnerID() , 497019 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
						pot = Lua_CreateObjByDir( OwnerID() , 105256 , 20 , 0 ) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
						SetModeEx ( pot , EM_SetModeType_Obstruct, false) 		---����(�O)
						SetModeEx( pot , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( pot , EM_SetModeType_Move, false) ---����	(�_)
						SetModeEx( pot , EM_SetModeType_Searchenemy, false)--����(�_)
						SetModeEx( pot , EM_SetModeType_Mark, false)			---�i�I��(�O)
						SetModeEx( pot , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
						SetModeEx( pot , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( pot , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
						AddToPartition ( pot , RoomID ) ----����[�J����,�Ҧ椽��
						sleep ( 50 )
						x1 = ReadRoleValue ( pot, EM_RoleValue_X)
						y1 = ReadRoleValue ( pot, EM_RoleValue_Y)
						z1 = ReadRoleValue ( pot, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
						snake = CreateObj( 105257 , x1, y1 , z1 , 0 , 1 )  ------------�ͥX�]�N�U
						AddToPartition ( snake , RoomID ) ----����[�J����,�Ҧ椽��
						WriteRoleValue ( snake , EM_RoleValue_PID ,OwnerID() ) 
						SetPlot( snake, "dead","cl_105257_dead", 0 )
						SetAttack( snake , AttackTarget )
						delobj ( pot )
						SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	(�_
						SetModeEx( OwnerID() , EM_SetModeType_Strikback, true) ---����(�_)--
						SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���(�O)
						WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , 0 )
						skill = 0
					end
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				open = 0
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�O)
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , 0 )
				addbuff ( OwnerID() , 508726 , 0 , -1 ) ----�����ܨ�
				skill_10 = 0
				skill_16 = 0
				skill = 0
				delobj ( snake )
			end
		end
	end
end
function cl_105257_dead()
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local oo = GetDistance( OwnerID(), boss );
	if oo <= 50 then
		CancelBuff( boss, 508726 )
	end
	WriteRoleValue ( boss , EM_RoleValue_Register1 , 1 )
	sleep ( 20 )
	DelObj ( OwnerID() )
end
function cl_105258_1() --------------���W�ߤl��t��-----------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	SetPlot( OwnerID(), "range","cl_105258_range1", 50 )
end
function cl_105258_range1()
	BeginPlot( TargetID() , "cl_rabbit1" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local rabbit = CreateObj( 117377 , 378 , 1247 , -1250 , 245 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
	Move( rabbit, 289 , 1247 , -1034 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_2() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	SetPlot( OwnerID(), "range","cl_105258_range2", 50 )
end
function cl_105258_range2()
	BeginPlot( TargetID() , "cl_rabbit2" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local rabbit = CreateObj( 117377 , -596 , 1270 , -1358 , 197 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
	Move( rabbit, -783 , -1254 , -1327 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_3() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	SetPlot( OwnerID(), "range","cl_105258_range3", 50 )
end
function cl_105258_range3()
	BeginPlot( TargetID() , "cl_rabbit3" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit3()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local rabbit = CreateObj( 117377 , -1589 , 1084 , -520 , 192 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
	Move( rabbit, -1717 , -1084 , -483 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_4() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	SetPlot( OwnerID(), "range","cl_105258_range4", 50 )
end
function cl_105258_range4()
	BeginPlot( TargetID() , "cl_rabbit4" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit4()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local rabbit = CreateObj( 117377 , -2224 , 1095 , 499 , 40 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
	Move( rabbit, -2012 , 1095 , 362 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_5() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	SetPlot( OwnerID(), "range","cl_105258_range5", 50 )
end
function cl_105258_range5()
	BeginPlot( TargetID() , "cl_rabbit5" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit5()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local rabbit = CreateObj( 117377 , -1963 , 1031 , 820 , 200 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
	Move( rabbit, -2106 , 987 , 871 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105235() -----------------�]�N�v���Ǯ{
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local skill = 0
	local skill2 = 0
	local CombatBegin = 0
	local Six_Table = {}
	local six = 0
	local Six2_Table = {}
	local six2 = 0
	local go = 0
	local open = 0
	local Rand_Num = 0
	local Rand_Num2 = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
			skill = skill + 1
			skill2 = skill2 + 1
				if skill >= 9 then
					Six_Table = DW_HateRemain(0)
					six = table.getn(Six_Table)
					Rand_Num = DW_Rand(six)
					if six >= 1 then
						CastSpelllv ( OwnerID() , Six_Table[Rand_Num] , 497027 , 40 )
						sleep ( 10 )
					end
					Six_Table = {}
					skill = 0
				end
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--Ū��BOSS�`��q
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--Ū��BOSS��e��q
				local HPPercent = ( NowHP / MaxHP )*100	
				if HPPercent <= 50 and go == 0 then   -----��HP�C��60%�H��go=0���ɭ�~�n�}�l�ͦ�y������ 
					sysCastSpelllv ( OwnerID() , OwnerID() , 497032 , 0 )
					sleep ( 10 )
					go = 1
				end
				if skill2 >= 15 then
					open = 1
					if open == 1 then
						Six2_Table = DW_HateRemain(0)
						six2 = table.getn(Six2_Table)
						Rand_Num2 = DW_Rand(six2)
						if six2 >=1 then
							if CheckBuff(  Six2_Table[Rand_Num2] , 508771 ) == false then
								Addbuff ( Six2_Table[Rand_Num2]  , 508771 , 0 , -1 )
								sleep ( 30 )
								local x = ReadRoleValue (Six2_Table[Rand_Num2], EM_RoleValue_X)
								local y = ReadRoleValue (Six2_Table[Rand_Num2], EM_RoleValue_Y)
								local z = ReadRoleValue (Six2_Table[Rand_Num2], EM_RoleValue_Z)
								local ball = CreateObj ( 105259 , x , y , z , 0 , 1) --�H���r���P��ͩ�
								SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( ball , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( ball , EM_SetModeType_Fight, true) ---�i���(�O)
								SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
								AddToPartition( ball,RoomID )
								WriteRoleValue ( ball , EM_RoleValue_PID , OwnerID() )
								WriteRoleValue ( ball , EM_RoleValue_Register1 ,Six2_Table[Rand_Num2])
								BeginPlot( ball,"cl_105259", 0 )
								Six2_Table = {}
								open = 0
								skill2 = 0
							elseif CheckBuff(  Six2_Table[Rand_Num2] , 508771 ) == true then
								table.remove ( Six2_Table , Rand_Num2 )
								six2 = table.getn(Six2_Table)
							end
						end
					end
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				go = 0
				skill = 0
				skill2 = 0
				open = 0
			end
		end
	end
end
function cl_105259() 
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local boss = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	Addbuff ( OwnerID()  , 508514 , 0 ,-1 )
	Addbuff ( player  , 508772 , 0 , -1 )
	SetPlot(  OwnerID(), "dead","cl_105259_dead", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		--if HateListCount( boss ) ~= 0 then ---�p�G������������H�N�~��԰�
			if ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then
				CancelBuff( player, 508771 )
				CancelBuff( player, 508772 )
				delobj( OwnerID() )
			end
			if ReadRoleValue( boss , EM_RoleValue_IsDead ) == 1 then
				sysCastSpelllv ( OwnerID() , OwnerID() , 496928 , 3 )
				sleep ( 10 )
				CancelBuff( player, 508771 )
				CancelBuff( player, 508772 )
				delobj( OwnerID() )
			end
		--elseif HateListCount ( boss ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			--CancelBuff( player, 508771 )
			--CancelBuff( player, 508772 )
			--delobj( OwnerID() )
		--end
	end
end
function cl_105259_dead()
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CancelBuff( player, 508771 )
	CancelBuff( player, 508772 )
	delobj( OwnerID() )
end
function cl_105232_1() -------------�Q�ޱ������K�äh-------------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local time1 = 0
	local time2 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			end
			if CombatBegin == 1 then
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--�`��q
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--��e��q
				local HPPercent = ( NowHP / MaxHP )*100
				if HPPercent <= 50 then
					if time1 == 0 then
						time1 = 1
					end
				elseif HPPercent >= 50 then
					if time1 == 1 then
						time1 = 0
						time2 = 0
					end
				end
				if HPPercent <= 50 and time1 == 1  and time2 == 0 then   -----��HP�C��80%���ɭ�~�n�}�l�ͦ�y������
					say(OwnerID(),"[SC_19104733]")
					time2 = 1
					local Search = SearchRangeNPC ( OwnerID() , 150 )
					for i = 0 , table.getn(Search) do
						if Search[i] ~= OwnerID() then
							if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105260 and 
								ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS�O�_�s�b -12�H��
								SetAttack( Search[i] , AttackTarget)
								say ( Search[i] , "[SC_19104733_2]")
							end
						end
					end
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
		end
	end
end
function cl_136_03_01() -----------------------2~3������1-----------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105229,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105230,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105230,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105229,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	BeginPlot( ObjMatrix[5] , "cl_105235" , 0 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)
	BeginPlot( ObjMatrix[6] , "cl_105235" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_01" , 0 )
end
function cl_136_wark03_01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_01" , 0 )
end
function cl_136_03_02() --PAT�ͧ�
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105231,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_02" , 0 )
end
function cl_136_wark03_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_02" , 0 )
end
function cl_136_03_04() ----------------------------3~4��--------------------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,1)
	BeginPlot( ObjMatrix[2] , "cl_105235" , 0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,-1)
	BeginPlot( ObjMatrix[3] , "cl_105235" , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105229,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105232,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105232,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_04_2" , 0 )
end
function cl_136_wark03_04_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_04" , 0 )
end
function cl_136_03_042() --PAT�ͧ�
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,1)
	BeginPlot( ObjMatrix[2] , "cl_105235" , 0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,-1)
	BeginPlot( ObjMatrix[3] , "cl_105235" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_03_2" , 0 )
end
function cl_136_wark04_03_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_042" , 0 )
end
function cl_105238AI()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local baer = LuaFunc_CreateObjByObj ( 105238 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
	SetModeEx( baer , EM_SetModeType_Move, false) ---����	(�_)
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
	BeginPlot( baer,"cl_105238", 0 )  -----------�N����scpipt��i�h�����W,��������
	while 1 do
		sleep (5)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
			delobj ( OwnerID() )
		elseif star == 3 then
			delobj ( baer )
			sleep ( 10 )
			baer = LuaFunc_CreateObjByObj ( 105238 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
			SetModeEx( baer , EM_SetModeType_Move, false) ---����	(�_)
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
			BeginPlot( baer,"cl_105238", 0 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_105238() ----------------�j��---------------------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue ( OwnerID() ,  EM_RoleValue_PID )
	local skill = 2
	local x = 0
	local y = 0
	local z = 0
	local CombatBegin = 0
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_)
	SetPlot( OwnerID(), "dead","cl_136_105238_dead", 0 ) --boss���榺�`�@��,�N���Ǧ^���������P�_���q
	--SetStopAttack(OwnerID())   --������� 
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		local mots = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				WriteRoleValue ( AI , EM_RoleValue_Register1, 1 ) --------��BOSS���O������AI���ͪ�
			end
			if CombatBegin == 1 then
				local oo = GetDistance( OwnerID() , AttackTarget );
				if oo <= 300 then
					skill = skill + 1
					if skill >= 3 then
						if mots <= 18 then
							CastSpelllv ( OwnerID() , AttackTarget , 497039 , 0 )
							sleep ( 5 )
							x = ReadRoleValue ( AttackTarget, EM_RoleValue_X)
							y = ReadRoleValue ( AttackTarget, EM_RoleValue_Y)
							z = ReadRoleValue ( AttackTarget, EM_RoleValue_Z)
							local ball = CreateObj ( 105261 , x , y , z , 0 , 1) --�H���r���P��ͩ�
							AddToPartition( ball,RoomID )
							WriteRoleValue ( ball , EM_RoleValue_PID , OwnerID() )
							mots = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
							WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , mots+1 )
							--sysCastSpelllv ( ball , ball , 496414 , 0 )
							BeginPlot( ball , "cl_105229" , 0 )
							skill = 0
						end
					end
				else
					mots = 0
					skill = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1, 3 ) --------��BOSS���O������AI���ͪ�
				mots = 0
				skill = 0
			end
		end
	end
end
function cl_136_105238_dead()
	local AI = ReadRoleValue ( OwnerID() ,  EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register1, 2 ) --------��BOSS���O������AI���ͪ�
	delobj ( OwnerID() )
end
function cl_105229()  ----�p���䤣��H���N����
	SetPlot( OwnerID(), "dead","cl_105229_dead", 0 ) --boss���榺�`�@��,�N���Ǧ^���������P�_���q
	local deltime = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
			deltime = deltime + 1
			if deltime >= 30 then
				delobj ( OwnerID() )
			end
		end
	end
end
function cl_105229_dead()
	local bogbom = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local mots = ReadRoleValue ( bogbom , EM_RoleValue_Register1 )
	WriteRoleValue ( bogbom , EM_RoleValue_Register1 , mots-1 )
	delobj ( OwnerID() )
end
function cl_136_04_05() --4~5����������
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_05" , 0 )
end
function cl_136_wark04_05()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_04_05" , 0 )
end
function cl_136_04_052() --6~7����������
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105237,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105236,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105236,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105237,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105236,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105236,Matrix,3,1)


	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_052" , 0 )
end
function cl_136_wark04_052()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_04_052" , 0 )
end