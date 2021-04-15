function LuaM_drdog_matrix()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 10
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105764,Matrix,2, 0 )
--	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
--	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaM_drdog_matrix" , 0 )
end

function LuaM_drdog_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_drdog_matrix" , 0 )
end


----------------------------------------------

function LuaM_drmilitary_matrix()			--�h�L

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 25
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(118762,Matrix,2, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(118762,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(118762,Matrix,2, -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(118762,Matrix,1, 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(118762,Matrix,1, 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(118762,Matrix,1, -1 )
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaM_drmilitary_matrix" , 0 )
end

function LuaM_drmilitary_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_drmilitary_matrix" , 0 )
end

---------------------------------------------------------

function LuaQ_drKalorn_1()										--�ج������u�ý�H��
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetPlot(O_ID,"range","LuaQ_drKalorn_2",80)
end

function LuaQ_drKalorn_2()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if CheckBuff(O_ID,620129)==true or CheckCompleteQuest(O_ID,424305)==true then
	return
	else
	say(T_ID,"[SC_KALORN_1]")								--�D�ج����H���o�i���I
	PlayMotion(T_ID,32)
	SetPos(O_ID,-12339,424,37725,0)
	end
end


----------------------------------------------------
function LuaQ_dr118475_1()										--�ݦu�̽�H��
	local own=OwnerID()
	local tar=TargetID()
	local RoomID=ReadRoleValue(Own,EM_RoleValue_RoomID)
	local Amonster = CreateObj(118475,-8533.2,486.6,36539.6,216,1)
	SetModeEx(Amonster,EM_SetModeType_Mark,false)
	SetModeEx(Amonster,EM_SetModeType_HideName,false)
	SetModeEx(Amonster,EM_SetModeType_Show,false)
	AddToPartition(Amonster,RoomID)   
	WriteRoleValue(Amonster,EM_RoleValue_register1,own)
	WriteRoleValue(own,EM_RoleValue_register1,Amonster)
	CallPlot(Amonster,"LuaQ_dr118475_2",Amonster)
	SetPlot(Amonster,"range","LuaQ_drKalorn_4",80)
end

function LuaQ_dr118475_2(Amonster)
	local boss = ReadRoleValue(Amonster,EM_RoleValue_Register1)
	while 1 do
		sleep(20)
		if CheckBuff(boss,620026)==true then
		CallPlot(Amonster,"LuaQ_dr118475_3",Amonster)
		Hide(Amonster)
		end
	end
end

function LuaQ_dr118475_3(Amonster)
	sleep(300)
	Show(Amonster,0)
end

function LuaQ_drKalorn_4()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	local boss = ReadRoleValue(T_ID,EM_RoleValue_Register1)
	if CheckBuff(O_ID,620027)==true  then
	return
	else
	say(boss,"[ST_100459_0]")
	PlayMotion(boss,109)
	ScriptMessage(O_ID,O_ID,1,"[SC_118475_01]",0)					
	SetPos(O_ID,-8687,469,36678,44)
	end
end
---------------------------------------------------------
Function LuaP_Dr_Mining()
	AttachCastMotionTool( OwnerID(), 212753 )
	MoveToFlagEnabled( OwnerID(), false );
	sleep( 30 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END)
	sleep(30)
	MoveToFlagEnabled( OwnerID(), true );
end
