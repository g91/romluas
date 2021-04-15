--�p�ǲ��ʱ���
function Cl_Monster_WarkInFlag( Flag)
	local MonsterAI = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( MonsterAI , EM_RoleValue_RoomID ) 	----����Ū���쪺�h��
	local ctarlAI = ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) 	----R1��ctarlAI
	local flag_Num = ReadRoleValue( MonsterAI , EM_RoleValue_Register6 ) --boss���F�X��
	local flagID = {}
		flagID[0] = 30
		flagID[1] = 20
		flagID[2] = 10
		flagID[3] = 0
	local flag_Tabld = {}
		flag_Tabld[1] = 781071
		flag_Tabld[2] = 781072
	CallPlot( MonsterAI, "CL_Monster_FightOut", RoomID )
	--�C��P�w�ۤv������F
	while 1 do
		sleep ( 10 )
		if ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) == 0 then 
			if flagID[flag_Num] <= 39 then
				flagID[flag_Num] = flagID[flag_Num] + 1
				MoveToFlagEnabled(MonsterAI, false) 
				WriteRoleValue(  MonsterAI,EM_RoleValue_IsWalk,0)
				Hide(MonsterAI)
				Show( MonsterAI,RoomID )
				LuaFunc_MoveToFlag ( MonsterAI , flag_Tabld[Flag] , flagID[flag_Num] , 0 )
			elseif flagID[flag_Num] >= 40 then
				delobj ( MonsterAI )
			end
		elseif ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) == 1 then
			StopMove( MonsterAI , false )
		end
	end
end
function CL_Monster_FightOut( RoomID )
	local MonsterAI = OwnerID()
	local ctarlAI = ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) ----����Ū���쪺�h��
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 20 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
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
	local Npc_Table = {}
		Npc_Table[1] = 106592
		Npc_Table[2] = 106593
		Npc_Table[3] = 106594
		Npc_Table[4] = 106642
		Npc_Table[5] = 106643
		Npc_Table[6] = 106644
		Npc_Table[7] = 106645
	local ObjMatrix ={}
	local Npc_Num = DW_Rand(7)
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Npc_Table[Npc_Num] , Matrix , 1 , 0 )
	Cl_Monster_MoveFlag ( ObjMatrix[1] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,2,-1)
	Cl_Monster_MoveFlag ( ObjMatrix[2] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,2,1)
	Cl_Monster_MoveFlag ( ObjMatrix[3] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,3,1)
	Cl_Monster_MoveFlag ( ObjMatrix[4] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,3,0)
	Cl_Monster_MoveFlag ( ObjMatrix[5] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,3,-1)
	Cl_Monster_MoveFlag ( ObjMatrix[6] , RoomID , MonsterAI , ctarlAI )
	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "CL_Monster_CallFun" , 0 )
end
function CL_Monster_CallFun()
	sleep( 10 )
	BeginPlot( OwnerID() , "CL_Monster_FightOut" , 0 )
end
function CL_Monster_FightIn()
	local Monster = OwnerID() ----�ڥs��AI
	local MoveAI = ReadRoleValue ( Monster , EM_RoleValue_Register1 )
	local ctarlAI = ReadRoleValue ( Monster , EM_RoleValue_Register2 )
	SetPlot( Monster, "dead", "CL_Monster_IsDead" , 0 )
	while 1 do
		sleep ( 10 )
		if HateListCount( Monster ) ~= 0 then ---�p�G��������H�N�~��԰�
			WriteRoleValue ( MoveAI , EM_RoleValue_Register1 , 1 ) ---
			SetModeEx( Monster , EM_SetModeType_Move , true ) ---����	(�_)
		elseif HateListCount( Monster ) == 0 then ---�p�G��������H�N�~��԰�
			if CheckID( MoveAI )  ~= true then
				local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
				WriteRoleValue(  ctarlAI , EM_RoleValue_Register5 , Monster_Num-1 )		
				delobj ( Monster )
			end
			WriteRoleValue ( MoveAI , EM_RoleValue_Register1 , 0 ) ---
		end
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			SetModeEx( Monster , EM_SetModeType_Move , false ) ---����	(�_)
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 0 then
			SetModeEx( Monster , EM_SetModeType_Move , true ) ---����	(�_)
		end
	end
end
function Cl_Monster_MoveFlag( ObjID, RoomID , MoveAI , ctarlAI )
	WriteRoleValue(  ObjID , EM_RoleValue_IsWalk , 0 )
	Hide(ObjID)
	Show(ObjID,RoomID)
	MoveToFlagEnabled( ObjID, false) ---�t�Τ��ت����|����
	WriteRoleValue ( ObjID , EM_RoleValue_Register1 , MoveAI ) ---
	WriteRoleValue(  ObjID , EM_RoleValue_Register2 , ctarlAI )
	local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 ) 
	WriteRoleValue(  ctarlAI , EM_RoleValue_Register5 , Monster_Num+1 )
	CallPlot( ObjID , "CL_Monster_FightIn", 0 )
end
function CL_Monster_IsDead()
	local Monster = OwnerID() ----�ڥs��AI
	local MoveAI = ReadRoleValue ( Monster , EM_RoleValue_Register1 )
	local ctarlAI = ReadRoleValue ( Monster , EM_RoleValue_Register2 )
	local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
	WriteRoleValue(  ctarlAI , EM_RoleValue_Register5 , Monster_Num-1 )
end
function Cl_ACWB_MonsterAI_Dead()
	local MonsterAI = OwnerID()
	local RoomID = ReadRoleValue( MonsterAI , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ( MonsterAI )
	local HideBall = Cl_CreateObj_ForHideBall( 106647 , Npc_X , Npc_Y , Npc_Z , RoomID ) ----���ͳz���y�M��
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 3 )  --�s���ɶ�
	CastSpelllv ( HideBall , HideBall , 499024 , 7 ) 
end
function Cl_Z194_MonsterAI()
	local MonsterAI = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( MonsterAI , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local ctarlAI = ReadRoleValue( MonsterAI , EM_RoleValue_PID ) ----����Ū���쪺�h��
	local AttackTarget = 0
	local Pose_Flag = 0
	local CombatBegin = 0
	local Old_X = ReadRoleValue ( MonsterAI , EM_RoleValue_X)
	local Old_Y = ReadRoleValue ( MonsterAI , EM_RoleValue_Y)
	local Old_Z = ReadRoleValue ( MonsterAI , EM_RoleValue_Z)
	Cl_Z22_PlayMotion()
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( MonsterAI , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( MonsterAI ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				Cl_Z22_OpenFlag(1)
				if ReadRoleValue ( MonsterAI , EM_RoleValue_Register1 ) == 1 then
					PlayMotion ( MonsterAI , ruFUSION_ACTORSTATE_SLEEP_END )
					sleep ( 10 )
					SetIdleMotion( MonsterAI , ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@ 
					WriteRoleValue( MonsterAI , EM_RoleValue_Register1 , 0 )  --�s���ɶ�d
				end
				CombatBegin = 1
			end
		elseif HateListCount( MonsterAI ) == 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 0
			end
		end
	end
end