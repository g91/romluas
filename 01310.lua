function LuaS_101768_0()

	local count = 7 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 9 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = -1 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 250 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local dis = 20 --���Z

	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101768,Matrix,1, -2 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101735,Matrix,2,  0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101735,Matrix,3, -4)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101735,Matrix,4,  -1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101753,Matrix,4,   2 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101753,Matrix,5,  -3)

	--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

	--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

	--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaS_101768_1" , 0 )
end

function LuaS_101768_1()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaS_101768_0" , 0 )
end


function LuaS_101858_0()--����}��
	LuaDavis_custom_matrix(10,9,101858,0,0,0,0,0,101858,0,0)
end

function LuaS_101755_0()--���]�y��
	LuaDavis_custom_matrix(10,9,101755,0,0,0,0,0,101754,0,0)
end

function LuaS_101756_0()--���]�Ԥh&�ĺ�
	LuaDavis_custom_matrix(10,9,101756,0,0,0,0,0,101757,0,0)
end

function LuaS_101759_0()--����y��&��T
	LuaDavis_custom_matrix(10,9,101759,0,0,0,0,0,101760,0,0)
end

function LuaS_101760_0()--����Ԥh&����Ԥh
	LuaDavis_custom_matrix(10,9,101761,0,0,0,0,0,101761,0,0)
end

function LuaS_101769_0()
	LuaDavis_custom_matrix(12,9,101769,0,0,0,0,0,101770,0,0)
end
