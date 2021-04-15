--�\�䤧�O

function Lua_cang_Ti01_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102174, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	AddBuff( SpellCaster ,503699,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Ti02_matrix",0)
	return true
end


function Lua_cang_Ti02_matrix()
	sleep(150)
	Delobj(OwnerID())
end

--


--�G�Ѥ��O

function Lua_cang_Ti03_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102165, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
--	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
--	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
--	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
--------------------
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( SpellCaster , ThesePlayer[i] ) -- �����e�i����
	end
--------------------
	AddBuff( SpellCaster ,503704,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Ti04_matrix",0)
	return true
end


function Lua_cang_Ti04_matrix()
	sleep(120)
	Delobj(OwnerID())
end

--


--�B�@�ûR

function Lua_cang_Ti05_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102166, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	AddBuff( SpellCaster ,503726,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Ti06_matrix",0)
	return true
end


function Lua_cang_Ti06_matrix()
	sleep(120)
	Delobj(OwnerID())
end

--
----------------------------------------------------  �m���ާL -1�n�����F �㶤   -----------------------------------------------

function Lua_cang_Taichu_1_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102186,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102186,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102186,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_Taichu_1_matrix_Reset" , 0 )
end

function Lua_cang_Taichu_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Taichu_1_matrix" , 0 )
end

----------------------------------------------------  �m���ާL -1�n�ۺ��F ���㶤   -----------------------------------------------

function Lua_cang_Taichu_2_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102278,Matrix,2,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102278,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102278,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_Taichu_2_matrix_Reset" , 0 )
end

function Lua_cang_Taichu_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Taichu_2_matrix" , 0 )
end





--�۴��θs
function Lua_cang_Ti07_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local m = OwnerID()
	SetPlot( m , "range" , "Lua_cang_Ti08_matrix" , 50 )
end

function Lua_cang_Ti08_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102301, TargetID() )	--�b�ά}���W���ͪ���	
	SetPlot( TargetID(), "touch" ,"" ,0)
	
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(TargetID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( SpellCaster , ThesePlayer[i] ) --�e�X�����ؼ�
	end	
	sleep(10)
	
	if ReadRoleValue(TargetID(),EM_RoleValue_IsDead)~=0 then--�ˬdTemp1�O�_���`
		for i = 1 ,	100 , 1 do
			DelFromPartition( SpellCaster )
			AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
			BeginPlot(SpellCaster,"Lua_cang_Ti09_matrix",0)
			sleep(50)
		end	
	end	
end
	
function Lua_cang_Ti09_matrix()

	if (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�		
		Delobj(OwnerID())
	end	
end
