--�}�����ͽd��
function LuaYuyu_gobolin2_matrix()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- 	[1][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[2][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[3][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--                                :
--  [Count][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]

	local count = 13 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local dis = 15 --�}�C�����Z
	local checktime = 60 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100634,Matrix,2, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100634,Matrix,3, -2 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100634,Matrix,3, 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100997,Matrix,4, 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100997,Matrix,4,-1 )


--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaYuyu_gobolin2_matrix_Reset" , 0 )
end

function LuaYuyu_gobolin2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaYuyu_gobolin2_matrix" , 0 )
end