--�� �k�����_�Ӷ��ᡰ--

function sasa_Ghost_Sitting()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local EnterFight
	SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_DOWN )
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then			--Ū������ƶq(���H)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
			if EnterFight == 0 then
				EnterFight = 1
				SetDefIdleMotion( OwnerID() , ruFUSION_MIME_ATTACK_1H )
			end
		elseif HateListCount( OwnerID() ) == 0 then		--Ū������ƶq(�S�H)
			sleep(30)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_DOWN )
			if EnterFight == 1 then
				EnterFight = 0
			end
		end
	end
end

function sasa_stonestop_01()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
end

--�� �����u�M�� ��--

--�ڬO�a����Ĩۣ�H--106445--

--�� �۹���3�H�� ��--
-- *
--* *
function sasa_144_walkP1()
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 2 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_144_walk01" , 0 )
end
function sasa_144_walk01()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_144_walkP1" , 0 )
end

--�� �۹���5�H�� ��--
-- *
--* *
--* *
function sasa_144_walkP2()
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 2 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106428 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_144_walk02" , 0 )
end
function sasa_144_walk02()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_144_walkP2" , 0 )
end

--�� �B��6�H�� ��--
--* *
--* *
--* *
function sasa_144_walkP3()
	local dis = 12
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106429 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106430 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106435 , Matrix , 2 , 1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106436 , Matrix , 2 , -1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106435 , Matrix , 3 , 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106436 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_144_walk03" , 0 )
end
function sasa_144_walk03()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_144_walkP3" , 0 )
end

--�� �B��4�H�� ��--
--* *
--* *
function sasa_144_walkP4()
	local dis = 12
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106429 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106430 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106435 , Matrix , 2 , 1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106436 , Matrix , 2 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_144_walk04" , 0 )
end
function sasa_144_walk04()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_144_walkP4" , 0 )
end