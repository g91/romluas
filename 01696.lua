
----------------------------------------------------  �m���ާL -1�n -----------------------------------------------

function Lua_cang_EMI_PAT1_e()

	local dis = 25
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103186,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103187,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103188,Matrix,2,1)	
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103189,Matrix,3,-2)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(103183,Matrix,3,2)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT2_e" , 0 )
end

function Lua_cang_EMI_PAT2_e()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT1_e" , 0 )
end


	
----------------------------------------------------  �m���ާL -2�n -----------------------------------------------

function Lua_cang_EMI_PAT3_e()

	local dis = 25
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103187,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103188,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103180,Matrix,3,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103186,Matrix,3,0)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103181,Matrix,3,1)
	
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(103189,Matrix,4,0)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT4_e" , 0 )
end

function Lua_cang_EMI_PAT4_e()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT3_e" , 0 )
end
	

----------------------------------------------------  �m���ާL -3�n -----------------------------------------------

function Lua_cang_EMI_PAT5_e()

	local dis = 25
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103187,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103188,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103182,Matrix,3,-2)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103186,Matrix,3,0)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103183,Matrix,3,2)	
	
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(103189,Matrix,3,0)
	--ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(103190,Matrix,4,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT6_e" , 0 )
end

function Lua_cang_EMI_PAT6_e()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT5_e" , 0 )
end
	
	

----------------------------------------------------  �m���ާL -4�n -----------------------------------------------

function Lua_cang_EMI_PAT7_e()

	local dis = 25
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103184,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(103185,Matrix,4,-2)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(103185,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix_2(ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT8_e" , 0 )
end

function Lua_cang_EMI_PAT8_e()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT7_e" , 0 )
end	
	

----------------------------------------------------  �m���ާL -5�n -----------------------------------------------

function Lua_cang_EMI_PAT9_e()

	local dis = 25
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103184,Matrix,2,2)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103184,Matrix,2,-2)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(103185,Matrix,4,-2)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(103185,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT10_e" , 0 )
end

function Lua_cang_EMI_PAT10_e()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT9_e" , 0 )
end		
		


----------------------------------------------------  �m���ާL -6�n -----------------------------------------------

function Lua_cang_EMI_PAT11_e()

	local dis = 25
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103176,Matrix,2,2)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103176,Matrix,2,-2)
	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT12_e" , 0 )
end

function Lua_cang_EMI_PAT12_e()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT11_e" , 0 )
end


------------------