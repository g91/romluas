----------------------------------------------------  �m���ާL -1�n�ֳt�᳽�s ���㶤   -----------------------------------------------

function Lua_cang_seapat_1_matrix()

	local dis = 16
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102034,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102034,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102034,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_seapat_1_matrix_Reset" , 0 )
end

function Lua_cang_seapat_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_seapat_1_matrix" , 0 )
end

----------------------------------------------------  �m���ާL -2�n2�y ���㶤  -----------------------------------------------

function Lua_cang_seapat_2_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102025,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102025,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_seapat_2_matrix_Reset" , 0 )
end

function Lua_cang_seapat_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_seapat_2_matrix" , 0 )
end

----------------------------------------------------  �m���ާL -3�n2�D�H ���㶤  -----------------------------------------------

function Lua_cang_seapat_3_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102036,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102037,Matrix,2,-1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_seapat_3_matrix_Reset" , 0 )
end

function Lua_cang_seapat_3_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_seapat_3_matrix" , 0 )
end
