function cl_105603_N() -------------�Q�ޱ������K�äh-------------
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
							if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105603 and 
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
--------------------------�]�N�v����------------
function cl_105601_N()
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
						Rand_Num = DW_Rand(six2)
						if six2 >=1 then
							if CheckBuff(  Six2_Table[Rand_Num] , 508771 ) == false then
								Addbuff ( Six2_Table[Rand_Num]  , 508771 , 0 , -1 )
								sleep ( 30 )
								local x = ReadRoleValue (Six2_Table[Rand_Num], EM_RoleValue_X)
								local y = ReadRoleValue (Six2_Table[Rand_Num], EM_RoleValue_Y)
								local z = ReadRoleValue (Six2_Table[Rand_Num], EM_RoleValue_Z)
								local ball = CreateObj ( 105602 , x , y , z , 0 , 1) --�H���r���P��ͩ�
								SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
								SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
								SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
								SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
								SetModeEx( ball , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
								SetModeEx( ball , EM_SetModeType_Fight, true) ---�i���(�O)
								SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
								AddToPartition( ball,RoomID )
								WriteRoleValue ( ball , EM_RoleValue_PID , OwnerID() )
								WriteRoleValue ( ball , EM_RoleValue_Register1 ,Six2_Table[Rand_Num])
								BeginPlot( ball,"cl_105602_N", 0 )
								Six2_Table = {}
								open = 0
								skill2 = 0
							elseif CheckBuff(  Six2_Table[Rand_Num] , 508771 ) == true then
								table.remove ( Six2_Table , Rand_Num )
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
function cl_105602_N() 
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local boss = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	Addbuff ( OwnerID()  , 508514 , 0 ,-1 )
	Addbuff ( player  , 508772 , 0 , -1 )
	SetPlot(  OwnerID(), "dead","cl_105602_dead_N", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		--if HateListCount( boss ) ~= 0 then ---�p�G������������H�N�~��԰�
			if ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then
				delobj( OwnerID() )
				CancelBuff( player, 508771 )
				CancelBuff( player, 508772 )
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
function cl_105602_dead_N()
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CancelBuff( player, 508771 )
	CancelBuff( player, 508772 )
	delobj( OwnerID() )
end
-------------�Q�ޱ����j��--------------
function cl_136_AI_N() ----�j�����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local baer = LuaFunc_CreateObjByObj ( 105605 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
	BeginPlot( baer,"cl_136_105605_N", 0 )  -----------�N����scpipt��i�h�����W,��������
	while 1 do
		sleep (5)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
		elseif star == 3 then
			delobj ( baer )
			sleep ( 30 )
			baer = LuaFunc_CreateObjByObj ( 105605 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------��BOSS���O������AI���ͪ�
			BeginPlot( baer,"cl_136_105605_N", 0 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_136_105605_N() -----------�Q�ޱ����j��------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local CombatBegin = 0
	local skill = 0
	local open = 0
	local xx = 0
	local yy = 0
	local zz = 0
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
	SetModeEx(OwnerID(),EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_)
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
------------�U�ը��ޤp��-----------------
function cl_136_01_01_N() ----------0~1��������--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105598,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark01_N" , 0 )
end
function cl_136_wark01_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_01_01_N" , 0 )
end
function cl_136_03_01_N() -----------------------2~3������1-----------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105596,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105597,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105597,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105601,Matrix,3,0)
	BeginPlot( ObjMatrix[4] , "cl_105601_N" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_01_N" , 0 )
end
function cl_136_wark03_01_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_01_N" , 0 )
end
function cl_136_03_02_N() --PAT�ͧ�
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105599,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105231,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_02_N" , 0 )
end
function cl_136_wark03_02_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_02_N" , 0 )
end
function cl_136_03_04_N() ----------------------------3~4��--------------------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105599,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,-1)	
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105601,Matrix,3,0)
	BeginPlot( ObjMatrix[4] , "cl_105601_N" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_04_2_N" , 0 )
end
function cl_136_wark03_04_2_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_04_N" , 0 )
end
function cl_136_03_042_N() --PAT�ͧ�
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105599,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105601,Matrix,2,1)
	BeginPlot( ObjMatrix[2] , "cl_105601_N" , 0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105601,Matrix,2,-1)
	BeginPlot( ObjMatrix[3] , "cl_105601_N" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_03_2_N" , 0 )
end
function cl_136_wark04_03_2_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_042_N" , 0 )
end