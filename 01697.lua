
function Lua_cang_122_PAT1()

	local dis = 15
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102699,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102698,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102698,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_122_PAT2" , 0 )
end

function Lua_cang_122_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_122_PAT1" , 0 )
end



function Lua_cang_122_PAT3()

	local dis = 15
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102699,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102699,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_122_PAT4" , 0 )
end

function Lua_cang_122_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_122_PAT3" , 0 )
end




function Lua_cang_122_monster()
	local monster
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	
	
	monster = LuaFunc_CreateObjByObj ( 102698, OwnerID() )
	AddToPartition( monster , RoomID )	--�[�i�R�x
	WriteRoleValue( monster , EM_RoleValue_Livetime, 180)		
end