
------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_dreamking_1_1() ---��b�ˬdBuff������@����
	BeginPlot(OwnerID(),"Lua_apon_dreamking_1_2",0)
end

function Lua_apon_dreamking_2_1() ---��b�ˬdBuff������@����
	BeginPlot(OwnerID(),"Lua_apon_dreamking_2_2",0)
end

function Lua_apon_dreamking_1_2() ----�C���ˬd
	local DeBuffID = 504057 --���ߪ�Buff
	local BuffID = 504355 ---����ұa�Ӫ��ˬd��Buff
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local Buff_Num = 0--�p��
	local Buff_Max = 10 ---���a�ݭn�����h�֪����߯�q
	while 1 do 
		sleep(10)
	 	if	Buff_Num>=Buff_Max	then
			return
		end
		if CheckBuff(OwnerID(),BuffID) == true then
			if CheckBuff(OwnerID(),DeBuffID) == true then
				Buff_Num = Buff_Num + 1
				DW_QietKillOne(0,105288)
				sleep(100)
			end
		else
			return
		end
	end
end


function Lua_apon_dreamking_2_2() ----�C���ˬd
	local DeBuffID = 504057 --���ߪ�Buff
	local BuffID = 504355 ---����ұa�Ӫ��ˬd��Buff
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local Buff_Num = 0--�p��
	local Buff_Max = 40 ---���a�ݭn�����h�֪����߯�q
	while 1 do 
		sleep(10)
	 	if	Buff_Num>=Buff_Max	then
			return
		end
		if CheckBuff(OwnerID(),BuffID) == true then
			if CheckBuff(OwnerID(),DeBuffID) == true then
				Buff_Num = Buff_Num + 1
				DW_QietKillOne(0,105288)
				sleep(100)
			end
		else
			return
		end
	end
end






function Lua_apon_dreamking_1_3()---�ˬd�O�_�w�g���ˬd�� Buff�F
	WriteRoleValue(OwnerID(),EM_LuaValueFlag_SkillUse5,  0   )
	if CheckBuff( OwnerID() , 504355) == true then
		return false
	end
end


function Lua_apon_dreamking_checkques()----��m������ˬd��
	
	if CheckCompleteQuest( TargetID(), 422748) == false and CheckCompleteQuest( TargetID(), 422751) == false then 
		SetFlag( TargetID(), 543282 , 1 ) ---�������n���~�A�^���ȱ���
	
	else
		ScriptMessage(TargetID(),TargetID(),2,"[SC_422748_01]",C_Red)---�q�X�w�����ۦP������
	end

end


----------------------------------------------------------------------------------------------------------------------------------------------
-----�H�U���Ǫ��}��

function Lua_apon_dream1_matrix()---�j�p�����

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102584,Matrix,2,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102580,Matrix,4,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102580,Matrix,4,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

function Lua_apon_dream2_matrix()---�j�p�G�a��

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102586,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102580,Matrix,4,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

function Lua_apon_dream3_matrix()---�j�p�G�a��-�|�H��

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102586,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102586,Matrix,4,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream3_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

function Lua_apon_dream4_matrix()---�j�p�G�a��-�|�H��

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102581,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102581,Matrix,4,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream4_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------