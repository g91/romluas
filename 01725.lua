----------------------------------------------------  �m���ާL -1�n�ֳt�᳽�s ���㶤   -----------------------------------------------

function Lua_cang_126_pat_1()

	local dis = 16
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103458,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103458,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103458,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_126_pat_2" , 0 )
end

function Lua_cang_126_pat_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_126_pat_1" , 0 )
end

----------------------------------------------------  �m���ާL -2�n2�y ���㶤  -----------------------------------------------

function Lua_cang_126_pat_3()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103449,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103449,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_126_pat_4" , 0 )
end

function Lua_cang_126_pat_4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_126_pat_3" , 0 )
end

----------------------------------------------------  �m���ާL -3�n2�D�H ���㶤  -----------------------------------------------

function Lua_cang_126_pat_5()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103460,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103461,Matrix,2,-1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_126_pat_6" , 0 )
end

function Lua_cang_126_pat_6()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_126_pat_5" , 0 )
end