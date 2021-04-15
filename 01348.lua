-------------------------------------------------------------------------------------���z�h�Lfollow���a
function Lua_apon_101920()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101920, TargetID() )	
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, true )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
 	SetModeEx( SpellCaster   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, true )--����
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	SetFollow( SpellCaster , TargetID() )
	BeginPlot(SpellCaster,"Lua_apon_101920_1",0)
end
function Lua_apon_101920_1()
	sleep(40)
	CastSpell(OwnerID(),OwnerID(),492973)
	sleep(10)
	--DelObj(OwnerID())

end

--------------------------------------------------------------------------------�B�G�}�C-1-�|���˽ö�

function Lua_apon_ice_50_1_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_ice_50_1_matrix_Reset" , 0 )
end

function Lua_apon_ice_50_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_apon_ice_50_1_matrix" , 0 )
end

--------------------------------------------------------------------------------�B�G�}�C-2-�|���˽ö�+�@���ۤh�L

function Lua_apon_ice_50_2_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101895,Matrix,5,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_ice_50_2_matrix_Reset" , 0 )
end

function Lua_apon_ice_50_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_apon_ice_50_2_matrix" , 0 )
end

