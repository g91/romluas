--�� �����u�M�� ��--

--�a����Ĩۣ�H--106113--

--�� �L�h��7�H�� ��--

function sasa_141_walkP1()
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 2 , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 2 , -1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 0 )
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk01" , 0 )
end
function sasa_141_walk01()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP1" , 0 )
end

--�� ���7�H�� ��--

function sasa_141_walkP2()
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106085 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106084 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106084 , Matrix , 2 , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106084 , Matrix , 2 , -1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , 0 )
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk02" , 0 )
end
function sasa_141_walk02()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP2" , 0 )
end

--�� �L�h��8�H�� ��--

function sasa_141_walkP3()
	local dis = 10
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 3 , 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , -2 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 5 , 2 )
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 5 , 0 )
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 5 , -2 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk03" , 0 )
end
function sasa_141_walk03()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP3" , 0 )
end

--�� �L�h��5�H�� ��--

function sasa_141_walkP4()
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 2 , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk04" , 0 )
end
function sasa_141_walk04()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP4" , 0 )
end

--�� MIX 5�H�� ��--

function sasa_141_walkP5()
	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106085 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 3 , 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , -2 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk05" , 0 )
end
function sasa_141_walk05()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP5" , 0 )
end

--�� �߫}4�H�� ��--

function sasa_141_walkP6()
	local dis = 18
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106089 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106090 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106090 , Matrix , 2 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106089 , Matrix , 3 , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk06" , 0 )
end
function sasa_141_walk06()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP6" , 0 )
end

--�� �R��3�H�� ��--

function sasa_141_walkP7()
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106082 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106081 , Matrix , 3 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106080 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk07" , 0 )
end
function sasa_141_walk07()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP7" , 0 )
end

--�� �v�L2�H�� ��--

function sasa_141_walkP8()
	local dis = 18
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,-1)
	BeginPlot( ObjMatrix[1] , "LuaS_Discowood_NowToHide" , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,1)
	BeginPlot( ObjMatrix[2] , "LuaS_Discowood_NowToHide" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "sasa_141_walk08" , 0 )
end
function sasa_141_walk08()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP8" , 0 )
end

--�� 22��2�H�� ��--

function sasa_141_walkP9()
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106095 , Matrix , 1 , -1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106095 , Matrix , 1 , 1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "sasa_141_walk09" , 0 )
end
function sasa_141_walk09()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP9" , 0 )
end

--�� MIX 5�H�� ��--(�H���g)

function sasa_141_walkP10()
	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106085 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106089 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106081 , Matrix , 3 , 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 3 , -2 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk010" , 0 )
end
function sasa_141_walk010()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP10" , 0 )
end

--�� ���}�߰� ��--

function sasa_106089_CatDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Light = {}
	Light = SearchRangeNPC ( OwnerID() , 50 )
	local LightBox = table.getn(Light)
	for a = 1 , LightBox do
		if ReadRoleValue( Light[a] , EM_RoleValue_OrgID ) == 105785 then
			DelObj( Light[a] )		
		end
	end
end

function sasa_106089_CatAI01()		--�I��
	local AI = OwnerID()
	SetPlot( AI , "collision" , "sasa_106089_CatAI02" , 50 )
end

function sasa_106089_CatAI02()		--�I�����󲣥ͦr��
	local AI = TargetID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( AI , -1 , 2 , "[SC_106089_01]" , 2 )
		--�A�o�{[106089]���W���ۮ������}���}���C
		sleep ( 10 )
		DelObj ( AI )
	end
end

--�� ���Ȥl�_�Ӷ��� ��--

function sasa_SittingChair_01()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local EnterFight
	--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP )
	SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then			--Ū������ƶq(���H)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
			if EnterFight == 0 then
				EnterFight = 1
				--Sleep(10)
				SetDefIdleMotion( OwnerID() , ruFUSION_MIME_ATTACK_1H )
				--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SIT_CHAIR_END )
			end
		elseif HateListCount( OwnerID() ) == 0 then		--Ū������ƶq(�S�H)
			Sleep(30)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
			if EnterFight == 1 then
				EnterFight = 0
				--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP )	
				--SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
			end
		end
	end
end

--�� �۳¶}�� ��--
--// �@�Ӫ�+3�ӧ��(���e)+1�ӧ��(����) �ݭn5�ӺX��

function sasa_119467_OpenDoor01()						--��b���1���W
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)   --�ت���ɶ�J����
	if PID > 0 then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local FlagArg = (PID-1)*5
		local Door = CreateObjByFlag( 106197 , 781017 , FlagArg+1 , 1 )
		local ScriptSet = { "sasa_119467_AI" , "sasa_119467_luck2" , "sasa_119467_luck3" }
		SetModeEx( Door , EM_SetModeType_Move , false )			------������
		SetModeEx( Door , EM_SetModeType_Strikback , false )	------������
		SetModeEx( Door , EM_SetModeType_Fight , false )		------���i���
		SetModeEx( Door , EM_SetModeType_Searchenemy , false )	------������
		SetModeEx( Door , EM_SetModeType_Mark , false )			------���i�I��
		SetModeEx( Door , EM_SetModeType_NotShowHPMP , false )	------��show���
		SetModeEx( Door , EM_SetModeType_Obstruct , true )		------����
		AddToPartition( Door , Room ) 	
		WriteRoleValue( OwnerID() , EM_RoleValue_register1 , Door )	--��
		
		local hand1 = CreateObjByFlag( 119467 , 781017 , FlagArg+2 , 1 )
		AddToPartition( hand1 , Room )
		WriteRoleValue( hand1 , EM_RoleValue_register1 , OwnerID() )	--�N�Ĥ@���������_��
		local hand2 = CreateObjByFlag( 119467 , 781017 , FlagArg+3 , 1 )
		AddToPartition( hand2 , Room )
		WriteRoleValue( hand2 , EM_RoleValue_register1 , OwnerID() )	--�N�Ĥ@���������_��
		local hand3 = CreateObjByFlag( 119467 , 781017 , FlagArg+4 , 1 )
		AddToPartition( hand3 , Room )
		WriteRoleValue( hand3 , EM_RoleValue_register1 , OwnerID() )	--�N�Ĥ@���������_��
		local HandSet = { hand1 , hand2 , hand3 }
		for i=1 , 3 do
			local num = rand( table.getn(ScriptSet) ) + 1
			Setplot( HandSet[i] , "touch" , ScriptSet[num] , 30 )
			--Say( OwnerID() , ScriptSet[num] )
			table.remove( ScriptSet , num )
			sleep(1)
		end	
	end	
end

function sasa_119467_AI()			--�Ĥ@��⪺Ĳ�I
	BeginPlot( TargetID() , "sasa_119467_AI2" , 0)
	SetIdleMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )			--���ʧ@
end

function sasa_119467_AI2()
	Setplot( OwnerID() , "touch" , "" , 0 )
	sleep(1)
	
	local control = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )   --Ū�X����id
	local PID = ReadRoleValue( control , EM_RoleValue_PID)   --�ت���ɶ�J����
	local FlagArg = (PID-1)*5
	local DoorCounter = 0
	local Door = ReadRoleValue( control , EM_RoleValue_register1 )
	local Room = ReadRoleValue( control , EM_RoleValue_RoomID )
	local IsOpened = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local IsTwoHand = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	
	if IsTwoHand == 0 then		--�S���}���᪺���
		local hand4 = CreateObjByFlag( 119467 , 781017 , FlagArg+5 , 1 )	--�ͥX�ĤG�K���
		AddToPartition( hand4 , Room )
		WriteRoleValue ( hand4 , EM_RoleValue_Register10 , OwnerID() ) --�����Ĥ@���
		WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 1 )  --�q���w�g���Ⱖ���
		Setplot( hand4 , "touch" , "sasa_119467_hand4" , 30 )
		--Say ( OwnerID() , "Two Here!" )
	end
	if IsOpened == 0 then		--���S�����}�~��
		WriteRoleValue(  OwnerID() , EM_RoleValue_register2 , 1 )		--�q�����w�g���}
		SetIdleMotion( Door , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )		--�����}
		SetModeEx( Door , EM_SetModeType_Obstruct , false )				--����(�}�����A����)
		--Say ( OwnerID() , getname(Door) )
		for i=1 , 7 do
			Sleep(10)
			DoorCounter = DoorCounter + 1
			--Say ( OwnerID() , "start" )
			
			if DoorCounter == 6 then
				SetIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )	--����
				SetModeEx( Door , EM_SetModeType_Obstruct , true )		------����
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 0 )		----�q�����w�g��
				--Say ( OwnerID() , "close" )
				DoorCounter = 0
				Setplot( OwnerID() , "touch" , "sasa_119467_AI" , 30 )
				SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--���^���l�ʧ@
				--SetIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
				break
			end
		end
	elseif IsOpened == 1 then	--���w�g���}�~��
		Setplot( OwnerID() , "touch" , "sasa_119467_AI" , 30 )	
		SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--���^���l�ʧ@
	end	
end

function sasa_119467_hand4()			--�ĤG��⪺Ĳ�I
	local hand1 = ReadRoleValue( TargetID() , EM_RoleValue_register10 )	--Ū�X�Ĥ@��⪺id
	local IsOpened = ReadRoleValue( hand1 , EM_RoleValue_register2 )
	BeginPlot( TargetID() , "sasa_119467_hand4_1" , 0)
	SetIdleMotion(TargetID() , ruFUSION_MIME_ACTIVATE_END )			--���ʧ@
end

function sasa_119467_hand4_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local open = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )	--Ū�X�}����⪺id
	local control = ReadRoleValue( open , EM_RoleValue_register1 )		--Ū�X����id
	local DoorCounter = 0
	local Door = ReadRoleValue( control , EM_RoleValue_register1 )
	local IsOpened = ReadRoleValue( open , EM_RoleValue_register2 )
	
	if IsOpened == 0 then		--���S�����}�~��
		WriteRoleValue( open , EM_RoleValue_register2 , 1 )				--�q�����w�g���}	
		SetIdleMotion( Door , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )		--�����}
		SetModeEx( Door , EM_SetModeType_Obstruct , false )				--����(�}�����A����)
		for i=1 , 7 do
			Sleep(10)
			DoorCounter = DoorCounter + 1
			--Say ( OwnerID() , "start" )
			
			if DoorCounter == 6 then
				SetIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )	--����
				SetModeEx( Door , EM_SetModeType_Obstruct , true )		------����
				--Say ( OwnerID() , "close" )
				WriteRoleValue( open , EM_RoleValue_register2 , 0 )		----�q�����w�g��
				DoorCounter = 0
				Setplot( OwnerID() , "touch" , "sasa_119467_hand4" , 30 )
				SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--���^���l�ʧ@
				--SetIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
				break
			end
		end
	elseif IsOpened == 1 then	--���w�g���}�~��
		Setplot( OwnerID() , "touch" , "sasa_119467_hand4" , 30 )
		SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--���^���l�ʧ@
	end	
end

function sasa_119467_luck2()
	BeginPlot( TargetID() , "sasa_119467_luck2_1" , 0)
	SetIdleMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )			--���ʧ@
	WriteRoleValue ( TargetID() , EM_RoleValue_Register10 , OwnerID() ) --���a
end

function sasa_119467_luck2_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local toucher = ReadRoleValue ( OwnerID() , EM_RoleValue_Register10 )
	local FearSpell = 498378   --�����A�G
	--local String = "Fear!"
	local String = "[SC_119467_FEAR]"
	ScriptMessage( OwnerID() , -1 , 2 , String , 1 )
	sleep(10)
	CastSpellLv( toucher , toucher , FearSpell , 0 )
end

function sasa_119467_luck3()
	BeginPlot( TargetID() , "sasa_119467_luck3_1" , 0)
	SetIdleMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )			--���ʧ@
end

function sasa_119467_luck3_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local String = "Worm!"
	local String = "[SC_119467_WORM]"
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	local Worm = {}
	local WormID = 106196		--������
	--local WormID = 102351		--�ȥN
	ScriptMessage( OwnerID() , -1 , 2 , String , 1 )
	sleep(10)
	for i=1 , table.getn(Player) do
		Worm[i] = star_CreateObj( Player[i-1] , WormID , 0 , 100 , 0 , Room , 0 )
		BeginPlot( Worm[i] , "sasa_106196_killID" , 0 )
		Setplot( Worm[i] , "dead" , "sasa_106196_BombWorm" , 30 )
		--SetAttack( Worm[i] , Player[i-1] )
		--Say( OwnerID() , getname(Player[i-1]) )
	end
end

--�� �p�Φ��z ��--

function sasa_106196_killID()
	local counter = 0
	while 1 do
		sleep(10)
		counter = counter + 1
		if counter == 4 then
			--Say( OwnerID() , "kill" )
			killID( OwnerID() , OwnerID() )
		end	
	end	
end

--�� �p���z�� ��--

function sasa_106196_BombWorm()
	local BallF = star_CreateObj_NoAdd( OwnerID() , 106312 , 0 , 0 , 0 , Room , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( BallF , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( BallF , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( BallF , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
	SetModeEx( BallF , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( BallF , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( BallF , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( BallF , EM_SetModeType_Move , false )			--����
	SetModeEx( BallF , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallF , EM_SetModeType_Strikback , false )		--����
	SetModeEx( BallF , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( BallF , Room )
	WriteRoleValue( BallF , EM_RoleValue_Livetime, 10 )			--�s�b���
	CastSpellLv( BallF , BallF , 498453 , 0 )					--����
	--Say( BallF , "Bomb 1" )
end

--�� �����J ��--

function sasa_106091_patrol()
	local MoveFlag = 781025
	local SummonSpell = 498380		--30��@��
	local DemonDoor = 103052		-----���ɤ���DBID
	local DemonDoorBuff = 505649	-----show�X���ɤ������S��
	local NoReHPBuff = 505653			----���^��
	local SpeedBuff = 620500			----���^��
	
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Door
	local Target 
	local EnterFight = 0
	local counter = 0
	local mobcount = 0
	local mob = {}
	local FlagArg = (PID-1)*2
	local DemonID1 = 106211			-----������22��
	local String = "[SC_119467_INTRUDERS]" 
	while true do
		sleep(10)
		Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		--Say(OwnerID() , counter)
		if  ( Target ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			--Say(OwnerID() , "test!")	
			if EnterFight == 0 then
				ScriptMessage( OwnerID() , -1 , 2 , String , 1 )
				AddBuff( OwnerID() , NoReHPBuff , 0 , -1 )
				AddBuff( OwnerID() , SpeedBuff , 0 , 5 )
				SetStopAttack( OwnerID() )
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------������
				if PID > 0 then
					MoveToFlagEnabled ( OwnerID() ,  false )
					DW_MoveToFlag( OwnerID() , MoveFlag , FlagArg+1 , 0 )	--( who , flag , No. , Range )
					--Say( OwnerID() , "move" )	
				end
				sleep(20)
				CastSpellLv( OwnerID() , OwnerID() , SummonSpell , 0 )	--��t�l��k�N
				sleep(20)
				--Door = star_CreateObj_NoAdd( OwnerID() , DemonDoor , 30 , 0 , 0 , Room , 720) 				
				Door = CreateObjByFlag( 103052 , MoveFlag , FlagArg+2 , 1 )
				SetModeEx( Door , EM_SetModeType_Move , false )			------������
				SetModeEx( Door , EM_SetModeType_Strikback , false )	------������
				SetModeEx( Door , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( Door , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( Door , EM_SetModeType_Mark , false )			------���i�I��
				SetModeEx( Door , EM_SetModeType_NotShowHPMP , false )	------��show���
				AddToPartition( Door , Room )	
				AddBuff(Door , DemonDoorBuff , 0 , -1)
				EnterFight = 1
			end	
		elseif ( Target == 0 ) and ( CheckID( OwnerID() ) ) == true and EnterFight == 1 then
			counter = counter + 1
			if mobcount == 5 then
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )		--����
				SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )	------����
				MoveToFlagEnabled ( OwnerID() ,  true )
				if Door ~= nil and ( CheckID( Door ) ) == true then
					Delobj(Door)
				end
			elseif counter == 6 then
				if mobcount < 6 then
					mob[table.getn(mob)+1] = star_CreateObj( Door , DemonID1 , 0 , 0 , 0 , Room , 0)		-----�l��c�]
					counter = 0
					mobcount = mobcount + 1					
				end	
			end	
			if counter > 30 then
				for i=1 , table.getn(mob) do
					if CheckID( mob[i] ) == true and mob[i] ~=nil then
						Delobj(mob[i])
					end
				end
				EnterFight = 0
				mobcount = 0
				counter = 0
				mob = {}
			end
		end
	end
end