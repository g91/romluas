function lua_star_pastrolmatrix()
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local dis = 10 --�}�C�����Z
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 60 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = -1 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100999,Matrix,1,-1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100999,Matrix,1, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100999,Matrix,1, 0 )
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "LuaSuez_star_matrix_Reset" , 0 )
end

function LuaSuez_star_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "lua_star_pastrolmatrix" , 0 )
end