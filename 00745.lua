--�T���}������
function LuaDavis_triangle_matrix(dis,nm1,nm2,nm3,nm4,nm5,nm6,nm7,nm8,nm9)		--/*dis  --�}�C�����Z

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- 	[1][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[2][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[3][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--                                :
--  [Count][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]

	local count = 7 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 60 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 3000 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 0 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(nm1,Matrix,1, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(nm2,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(nm3,Matrix,2, -1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(nm4,Matrix,2, 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(nm5,Matrix,3, 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(nm6,Matrix,3, -1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(nm7,Matrix,3, 0 )
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(nm8,Matrix,3, 2 )
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(nm9,Matrix,3, -2)
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaDavis_triangle_matrix_Reset" , 0 )
end

function LuaDavis_triangle_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaDavis_triangle_matrix" , 0 )
end

--�Ȼs�}������
function LuaDavis_custom_matrix(dis,checktime,nm1,nm2,nm3,nm4,nm5,nm6,nm7,nm8,nm9)
--/*dis  --�}�C�����Z		
--/*checktime �P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- 	[1][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[2][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[3][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--                                :
--  [Count][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]

	
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local ReviveTime = 0 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 0 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	local CC = 1
	if nm1 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm1,Matrix,1, -1 )
		CC = CC+1
	end
	if nm2 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm2,Matrix,2, -1 )
		CC = CC+1
	end
	if nm3 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm3,Matrix,3, -1)
		CC = CC+1
	end
	if nm4 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm4,Matrix,1, 0 )
		CC = CC+1
	end
	if nm5 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm5,Matrix,2, 0 )
		CC = CC+1
	end
	if nm6 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm6,Matrix,3, 0 )
		CC = CC+1
	end
	if nm7 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm7,Matrix,1, 1 )
		CC = CC+1
	end
	if nm8 > 0 then
		ObjMatrix[CC]= LuaFunc_CreateNPCByMatrix(nm8,Matrix,2, 1 )
		CC = CC+1
	end
	if nm9 > 0 then
		ObjMatrix[CC] = LuaFunc_CreateNPCByMatrix(nm9,Matrix,3, 1 )
		CC = CC+1
	end
--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaS_421219_3" , 0 )
end