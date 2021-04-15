function Cl_Z22_MonsterAI_106446()
	local OwnerID = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local ctarlAI = ReadRoleValue( OwnerID , EM_RoleValue_PID ) ----����Ū���쪺�h��
	local AttackTarget = 0
	local Pose_Flag = 0
	local CombatBegin = 0
	local Old_X = ReadRoleValue ( OwnerID , EM_RoleValue_X)
	local Old_Y = ReadRoleValue ( OwnerID , EM_RoleValue_Y)
	local Old_Z = ReadRoleValue ( OwnerID , EM_RoleValue_Z)
	Cl_Z22_PlayMotion()
	if ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) == 106446 or
		ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) == 106757 then
		local Rand_Pose = DW_Rand(100)
		if ( Rand_Pose >= 1 and Rand_Pose <= 10) or( Rand_Pose >=21 and Rand_Pose <= 30 ) or
		   ( Rand_Pose >= 41 and Rand_Pose <= 50 ) or ( Rand_Pose >= 61 and Rand_Pose <= 70 ) or
		   ( Rand_Pose >= 81 and Rand_Pose <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
		   SetModeEx( OwnerID , EM_SetModeType_Searchenemy , false )--����(�_)
		end
	end
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				Cl_Z22_OpenFlag(1)
				if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 1 then
					PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_END )
					sleep ( 10 )
					SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@ 
					WriteRoleValue( OwnerID , EM_RoleValue_Register1 , 0 )  --�s���ɶ�d
				end
				CombatBegin = 1
			end
		elseif HateListCount( OwnerID ) == 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
		end
	end
end
function Cl_CheckBuff621362()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( TargetID , 621362 ) == true and
		ReadRoleValue ( TargetID , EM_RoleValue_VOC ) ~= 0 then
		return true
	elseif CheckBuff( TargetID , 621362 ) == false or
		ReadRoleValue ( TargetID , EM_RoleValue_VOC ) == 0 then
		return false
	end
end
function Cl_MonsterSkill_498847()
	local OwnerID = OwnerID()
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Npc_Table = {}
	if ZoneID == 144 then
		Npc_Table[106431] = 106622
		Npc_Table[106432] = 106623
	elseif ZoneID == 145 then
		Npc_Table[106751] = 106760
		Npc_Table[106752] = 106761
	end
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(OwnerID)
	local HideBall = Cl_CreateObj_ForHideBall( Npc_Table[OrgID] , Npc_X , Npc_Y , Npc_Z , RoomID ) ----���ͳz���y�M��
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 3 )  --�s���ɶ�
	CastSpelllv ( HideBall , HideBall , 498847 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
end
function Cl_MonsterSkill_498841()
	local OwnerID = OwnerID()
	local Rand_Skill = DW_Rand(100)
	if Rand_Skill < 50 then
		addbuff ( OwnerID , 621366 , 0 , 2 )
	end
end
function Cl_MonsterSkill_498850()
	local OwnerID = OwnerID()
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Npc_Table = {}
	if ZoneID == 144 then
		Npc_Table[106433] = 106624
	elseif ZoneID == 145 then
		Npc_Table[106753] = 106762
	end
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local Npc_X , Npc_Y , Npc_Z = Cl_Rand_HateList( 1 , 0 )
	local HideBall = Cl_CreateObj_ForHideBall( Npc_Table[OrgID] , Npc_X , Npc_Y , Npc_Z , RoomID ) ----���ͳz���y�M��
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 6 )  --�s���ɶ�
	CastSpelllv ( HideBall , HideBall , 498859 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
end
function Cl_MonsterSkill_498851()
	local OwnerID = OwnerID()
	local BuffID = Lua_BuffPosSearch( OwnerID, 621375 )  ---Ū��BOSS�ۤv���W���X�hbuff
	local BuffLv = BuffInfo( OwnerID, BuffID , EM_BuffInfoType_Power )---Ū���ޯ൥��
	if BuffLv >= 3 then
		CancelBuff( OwnerID, 621375 )
		addbuff ( OwnerID , 621377 , 0 , 15 )
	end
end
function Cl_MonsterAI_105810()
	local OwnerID = OwnerID() ----�ڥs��AI
	addbuff ( OwnerID , 621105 , 0 , -1 )
end
function Cl_Z22_OpenFlag(Flag)
	local OwnerID = OwnerID() ----�ڥs��AI
	if Flag == 0 then
		SetModeEx( OwnerID , EM_SetModeType_Mark, false)			---�i�I��(�O)
		SetModeEx( OwnerID , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
		SetModeEx( OwnerID , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( OwnerID , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		SetModeEx( OwnerID , EM_SetModeType_HideName, true )
		SetModeEx ( OwnerID , EM_SetModeType_Obstruct, true) 		---����(�O)
		SetModeEx( OwnerID , EM_SetModeType_Move, false) ---����	(�_)
	elseif Flag == 1 then
		SetModeEx ( OwnerID , EM_SetModeType_Obstruct, false) 		---����(�O)
		SetIdleMotion( OwnerID ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
		SetModeEx( OwnerID , EM_SetModeType_Mark, true )			---�i�I��(�O)
		SetModeEx( OwnerID , EM_SetModeType_ShowRoleHead, true ) 		---�Y����(�O)
		SetModeEx( OwnerID , EM_SetModeType_Fight, true ) ---�i���(�O)
		SetModeEx( OwnerID , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
		SetModeEx(OwnerID , EM_SetModeType_HideName, false )
		SetModeEx( OwnerID , EM_SetModeType_Move, true) ---����	(�_)
	end
end
function Cl_Z22_ctarlAI_IceAndHot() ---�B�P����s��
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
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
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106429,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106430,Matrix,2,1)
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106749,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106750,Matrix,2,1)
	end
	WriteRoleValue( ObjMatrix[1] , EM_RoleValue_Register1, ObjMatrix[2] )  --�s���ɶ�
	WriteRoleValue( ObjMatrix[2] , EM_RoleValue_Register1, ObjMatrix[1] )  --�s���ɶ�
		
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun" , 0 )
end
function CL_Z22_ctarlAI_CallFun()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_IceAndHot" , 0 )
end
function Cl_Z22_MonsterAI_Dead()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local Monster = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(OwnerID)
	local OrgID_Table = {}
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		OrgID_Table[106429] = { 499061 , 0 }
		OrgID_Table[106430] = { 499062 , 0 }
	elseif ZoneID == 145 then
		OrgID_Table[106749] = { 499061 , 0 }
		OrgID_Table[106750] = { 499062 , 0 }
	end
	local HideBall = Cl_CreateObj_ForHideBall( 106630 , Npc_X , Npc_Y , Npc_Z , RoomID ) ----���ͳz���y�M��
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 3 )  --�s���ɶ�
	if CheckID( Monster )  == true and  ---�ˬdGID
		ReadRoleValue( Monster , EM_RoleValue_IsDead ) ==  0 then
		CastSpelllv ( HideBall , Monster , OrgID_Table[OrgID][1] , OrgID_Table[OrgID][2] ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
	end
end
function Cl_Z22_ctarlAI_ToMove_1_3() ---�B�P����s��
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
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
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106446,Matrix,1,0)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106446,Matrix,2,1)	
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106446,Matrix,2,-1)		
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106757,Matrix,2,1)	
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106757,Matrix,2,-1)		
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle )
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun_1_3" , 0 )
end
function CL_Z22_ctarlAI_CallFun_1_3()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_ToMove_1_3" , 0 )
end
function Cl_Z22_PlayMotion()
	local OwnerID = OwnerID()
	Cl_Z22_OpenFlag(0)
	if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 0 then	
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_BEGIN )
		sleep ( 10 )
		SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_SLEEP_LOOP )
		sleep ( 40 )
		WriteRoleValue( OwnerID , EM_RoleValue_Register1, 1 )  --�s���ɶ�
	end
end
function Cl_Z22_Fight_FlagOpen()
	local OwnerID = OwnerID() ----�ڥs��AI
	local AttackTarget = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				Cl_Z22_OpenFlag(1)
				--[[if ReadRoleValue( OwnerID , EM_RoleValue_Register1 ) ~= 1 then
					PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_END )
					sleep ( 10 )
					SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@ 
				end]]--
				CombatBegin = 1
			end
		elseif HateListCount( OwnerID ) == 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
		end
	end
end
function Cl_Z22_Stop_PlayMotion()
	local OwnerID = OwnerID()
	if HateListCount( OwnerID ) == 0 then ---�p�G������������H�N�~��԰�
		--WriteRoleValue( OwnerID , EM_RoleValue_Register1, 1 )
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_BEGIN )
		Cl_Z22_OpenFlag(0)
		MoveToFlagEnabled( OwnerID, false) ---�t�Τ��ت����|����
		sleep ( 10 )
		SetIdleMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_LOOP )
		sleep ( 30 )
		Cl_Z22_OpenFlag(1)
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_END )
		sleep ( 10 )
		SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@ ruFUSION_ACTORSTATE_NORMAL
		--WriteRoleValue( OwnerID , EM_RoleValue_Register1, 0 )
		MoveToFlagEnabled( OwnerID, true) ---�t�Τ��ت����|����
	elseif HateListCount( OwnerID ) ~= 0 then ---�p�G������������H�N�~��԰�
		return
	end
end
function Cl_Z22_MonsterAI_106447()
	local OwnerID = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local ctarlAI = ReadRoleValue( OwnerID , EM_RoleValue_PID ) ----����Ū���쪺�h��
	local AttackTarget = 0
	local Pose_Flag = 0
	local CombatBegin = 0
	local Old_X = ReadRoleValue ( OwnerID , EM_RoleValue_X)
	local Old_Y = ReadRoleValue ( OwnerID , EM_RoleValue_Y)
	local Old_Z = ReadRoleValue ( OwnerID , EM_RoleValue_Z)
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				Cl_Z22_OpenFlag(1)
				if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 1 then
					SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@ 
					WriteRoleValue( OwnerID , EM_RoleValue_Register1 , 0 )  --�s���ɶ�d
				end
				CombatBegin = 1
			end
		elseif HateListCount( OwnerID ) == 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
		end
	end
end
function Cl_Z22_PlayMotion_Dead()
	local OwnerID = OwnerID()
	Cl_Z22_OpenFlag(0)
	if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 0 then
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
		sleep ( 20 )
		SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		sleep ( 30 )
		WriteRoleValue( OwnerID , EM_RoleValue_Register1, 1 )  --�s���ɶ�
	end
end
function Cl_Z22_ctarlAI_IceAndHot_2() ---�B�P����s��
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
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
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106429,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106430,Matrix,1,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106435,Matrix,2,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106436,Matrix,2,1)
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106755,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106756,Matrix,1,1)
	end
	WriteRoleValue( ObjMatrix[1] , EM_RoleValue_Register1, ObjMatrix[2] )  --�s���ɶ�
	WriteRoleValue( ObjMatrix[2] , EM_RoleValue_Register1, ObjMatrix[1] )  --�s���ɶ�
		
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun_2" , 0 )
end
function CL_Z22_ctarlAI_CallFun_2()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_IceAndHot_2" , 0 )
end
function Cl_Z22_ctarlAI_IceAndHot_3() ---�B�P����s��
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
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
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106435,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106436,Matrix,1,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106435,Matrix,2,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106436,Matrix,2,1)
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106755,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106756,Matrix,1,1)
	end
	WriteRoleValue( ObjMatrix[1] , EM_RoleValue_Register1, ObjMatrix[2] )  --�s���ɶ�
	WriteRoleValue( ObjMatrix[2] , EM_RoleValue_Register1, ObjMatrix[1] )  --�s���ɶ�
	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun_3" , 0 )
end
function CL_Z22_ctarlAI_CallFun_3()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_IceAndHot_3" , 0 )
end
function Cl_Z22_MonsterAI_106106()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local ZoneID = ReadRoleValue( OwnerID , EM_RoleValue_ZoneID )-----------------
	local Ball_Tame = 0
	local BallID = 0
	local NpcID = {}
	NpcID[144] = 106106
	NpcID[145] = 106746
	NpcID[937] = 106106
	while 1 do
		sleep ( 10 )
		Ball_Tame = Ball_Tame + 1
		if Ball_Tame >= 15 then
			BallID = CreateObjByFlag( NpcID[ZoneID] , 781085 , 0 , 1 ) ------------���Ͱƥ��J�f��
			SetModeEx( BallID , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( BallID , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( BallID , EM_SetModeType_Mark, false)			---�i�I��(�O)
			SetModeEx( BallID , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( BallID , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( BallID , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
			AddToPartition( BallID , RoomID )
			addbuff ( BallID , 621381 , 0 , -1 )
			CallPlot( BallID , "Cl_Z22_106106_MoveToFlag" , 0 )
			Ball_Tame = 0
		end
	end
end
function Cl_Z22_106106_MoveToFlag()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	for i = 1 , 3 , 1 do
		MoveToFlagEnabled( OwnerID , false ) ---�t�Τ��ت����|����
		WriteRoleValue(  OwnerID , EM_RoleValue_IsWalk , 0 )
		Hide( OwnerID )
		Show( OwnerID , RoomID )
		LuaFunc_MoveToFlag( OwnerID , 781085 , i , 0 )
	end
	delobj ( OwnerID )
end
function Cl_Z22_ChackIsMonster()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106753 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106754 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106747 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106748 or
		
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106433 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106434 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106427 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106428 then
		return true
	else
		return false
	end
end
function Cl_Z22_ChackIsPlay()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsDead ) ==  0 and 
		ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==  1 and
		ReadRoleValue ( Target , EM_RoleValue_VOC ) ~= 0 then
		return true
	else
		return false
	end
end
function Cl_Z22TurnMonsteSetPlot()
	local OwnerID = OwnerID()
	
end
function Cl_Z22TurnMonstecollision()
	local OwnerID = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	if ReadRoleValue ( OwnerID , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( OwnerID, -1 , 2 ,"[SC_Z22_MONSTE_01]" , 2 )
		local Hideball = Cl_CreateObj_ForFlag( 106630 , 781110 , 25 , RoomID ) ----���ͳz���y�M��
		WriteRoleValue( Hideball , EM_RoleValue_PID , 1 )
		CallPlot( Hideball , "Cl_Z22_TurnMonsterAI" , 0 )
		delobj ( Target )
	end
	
end
function Cl_Z22_ForTurnAI()
	SetPlot( OwnerID() , "collision","Cl_Z22TurnMonstecollision", 20 ) ---��JBOSS���԰����L
end
function Cl_Z22_TurnMonsterAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local flag_table = {}
	local Rand_flag = DW_Rand(128)
	while ReadRoleValue( OwnerID , EM_RoleValue_PID )== 1 do
		sleep ( 20 )
		---say( OwnerID , "OwnerID="..ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) )
		---DebugMsg( 0 , 0 , "Dug="..ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) )
		for i = 1 , 20 , 1 do
			Rand_flag = DW_Rand(128)
			flag_table[i] = Rand_flag
		end
		for i = 1 , 20 , 1 do
			Hideball = Cl_CreateObj_ForFlag( 106748 , 781110 , flag_table[i] , RoomID ) ----���ͳz���y�M��
			WriteRoleValue( Hideball , EM_RoleValue_Livetime , 3 )
			CallPlot( Hideball , "Cl_Z22_TurnMonster" , 0 )
		end
	end
end
function Cl_Z22_TurnMonster()
	local OwnerID = OwnerID()
	CastSpelllv ( OwnerID , OwnerID , 499066 , 0 )----�C13��I��@�ӥ����k�NAE
end
--25 29  95  91
function Cl_Z22_ForTurnMonster()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local FlagNum = {25,29,95,91}
	local Npc_Table = {}	
	Npc_Table = {106702,106703,106704,106705}	
	local NpcID = {}
	local BuffNpc = {}
	local NpcNum = 0
	local ObjNum = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	WriteRoleValue( OwnerID , EM_RoleValue_Register1 , 0 )
	if ZoneID == 144 then
		for i = 1 , 4 , 1 do
			NpcID[i] = CreateObjByFlag( Npc_Table[i] , 781110 , FlagNum[i] , 1 )  ------------�ͥX�]�N�U
			SetModeEx( NpcID[i] , EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( NpcID[i] , EM_SetModeType_Searchenemy, false)--����(�_)
			WriteRoleValue ( NpcID[i] , EM_RoleValue_PID , OwnerID )
			AddToPartition( NpcID[i] , RoomID )
			ObjNum = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
			WriteRoleValue( OwnerID , EM_RoleValue_Register1 , ObjNum+1 )
			Addbuff (  NpcID[i] , 505653 , 0 , -1 ) ---�ߤl�ܤj
		end
	end
	while 1 do
		ObjNum = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
		if ObjNum ~= 0 then
			NpcNum = table.getn(NpcID)
			for i = 1 , NpcNum , 1 do
				if CheckID( NpcID[i] )  == true then--NpcID[i] == nil then--	
					table.insert( BuffNpc , NpcID[i] )  ---�N����쪺���a��J�@�ӷs��TABLE
					--table.remove ( NpcID , i )  ---���Ჾ�������Ӫ�
				end
			end
			NpcID = {}
			NpcID = BuffNpc
			BuffNpc = {}
			NpcNum = table.getn(NpcID)
			Buff_rand = DW_Rand(NpcNum)
			for i = 1 , NpcNum , 1 do
				if i ~= Buff_rand then
					Addbuff ( NpcID[i] , 622151 , 0 , 7 ) ---�ߤl�ܤj
				end
			end
		elseif ObjNum == 0 then
			ScriptMessage( OwnerID, -1 , 2 ,"[SC_Z22_MONSTE_02]" , 2 )
			sleep ( 10 )
			delobj ( OwnerID )
		end
		sleep ( 70 )
	end
end
function Cl_Z22_DeadForTurnMonste()
	local OwnerID = OwnerID()
	local AI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local ObjNum = ReadRoleValue ( AI , EM_RoleValue_Register1 )
	WriteRoleValue( AI , EM_RoleValue_Register1 , ObjNum-1 )
	delobj ( OwnerID )
end