----------------------------------------------------���_���] ������-----------------------------------------------
function LuaSpell_FireOil()
	EnableNpcAI( OwnerID() , false );
	local MagicStr = "SpellMagic"
	local MagicLVStr = "SpellMagicLv"
	local Canon = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101879 , 50 , 0)   --�ŧiCanon������NPC�A�åB�I�k�ɷ|�h�j�M�onpc�A�A�R�O�onpc�ӬI�o�Ӫk�N
	local LV
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 1 , 8 , 1 do
		local Magic = MagicStr..i
		local MagicLV = MagicLVStr..i
		if GameObjInfo_Int(OrgID,Magic ) == 492874 then
			LV = GameObjInfo_Int(OrgID,MagicLV )
			break
		end
	end

	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ghost = CreateObjByObj( 112047 , TargetID() )
	AddToPartition( Ghost , RoomID )
	SetModeEx( Ghost , EM_SetModeType_Mark, false) 
	SetModeEx( Ghost , EM_SetModeType_HideName, false) 
	SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Ghost , EM_SetModeType_Strikback , false )
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 15 )
	CastSpellLV( Canon , Ghost , 492875 ,LV )
	--AddBuff(Canon ,503210 ,0 ,5 )
	EnableNpcAI( OwnerID() , true );
end

----------------------------------------------------  �m���ާL -1�n  1�} + 2�� + 3����   �A�㶤�ɶ��ݭn 6��-----------------------------------------------

function Luaapon_add_1_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	--���
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,0)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,-1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_1_matrix_Reset" , 0 )
end

function Luaapon_add_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

----------------------------------------------------  �m���ާL -2�n  1�� + 2�r + 3�����A�㶤�ɶ��ݭn 6��-----------------------------------------------

function Luaapon_add_2_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���} �C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|����  OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101257,Matrix,2,0)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101261,Matrix,3,-1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101261,Matrix,3,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101261,Matrix,3,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_2_matrix_Reset" , 0 )
end

function Luaapon_add_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_2_matrix" , 0 )
end
----------------------------------------------------  �m���ާL -3�n  1�� + 2�} + 2�� �A�㶤�ɶ��ݭn 6��-----------------------------------------------

function Luaapon_add_3_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���} �C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|����  OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,-1)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)


	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_3_matrix_Reset" , 0 )
end

function Luaapon_add_3_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_3_matrix" , 0 )
end

----------------------------------------------------  �m���ާL -�k 1�n 1�� + 2�� + 2�� �A�㶤�ɶ��ݭn 6��-----------------------------------------------

function Luaapon_add_4_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���} �C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|����  OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,-1)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101258,Matrix,3,0)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,-1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101258,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,1)


	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_4_matrix_Reset" , 0 )
end

function Luaapon_add_4_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_4_matrix" , 0 )
end

----------------------------------------------------  �m���ާL -5�n 2�� + 2�� �A�㶤�ɶ��ݭn 6��-----------------------------------------------

function Luaapon_add_5_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���} �C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|����  OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101256,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101256,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_5_matrix_Reset" , 0 )
end

function Luaapon_add_5_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_5_matrix" , 0 )
end


----------------------------------------------------  �m�_ŧ�n 1�� + 2�� + 2�� -----------------------------------------------

function Luaapon_add_6_matrix()

	local dis = 12
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}  �C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|����   OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,3,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)


	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_6_matrix_Reset" , 0 )
end

function Luaapon_add_6_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_6_matrix" , 0 )
end




----------------------------------------------------------�d��@�� ---------------------------------------------------
function Luaapon_108_call()
--	local Boss = CreateObjByFlag( 101685 , 780357 , 0 , 1 )
	SetPlot(OwnerID() , "range" ,"LuaS_101880" , 200)
end


function LuaS_101880()
	SetPlot(TargetID(), "range" ,"" , 0)          --�M���o�@�q���d��@���A�]�N�O�d��@�����|�]�ĤG���H�W
	ScriptMessage( TargetID(), -1 , 2 , "[SC_101880]" , 1 )     --�o�O��������r���T���A�r�ꪺ�Ϊk�n�令�o��

end

----------------------------------------------------�A�G��� �����ܳ��� -1  ------------------------------------------------


function Lua_apon_108_taco_1()

	--SetPlot(OwnerID() , "dead" ,"Luaapon_108_taco_2" , 50)
	--SetPlot(OwnerID() , "touch" ,"Lua_apon_108_taco_2" , 50)
	SetPlot(OwnerID() , "range" ,"Lua_apon_108_taco_2" , 50)
end

function Lua_apon_108_taco_2()

	BeginPlot( TargetID() ,"Lua_apon_108_taco_3",0)
end

function Lua_apon_108_taco_3()
	SetPlot(OwnerID() , "range" ,"" , 0)
	AddBuff(OwnerID() ,503208 ,0 ,5 )
	--sleep(10)
	Hide(OwnerID())
	local taco = LuaFunc_CreateObjByObj ( 101263 , OwnerID() )
end

----------------------------------------------------�A�G��� �����ܳ��� -2  ------------------------------------------------


function Lua_apon_108_taco_1_1()

	--SetPlot(OwnerID() , "dead" ,"Luaapon_108_taco_2" , 1)
	--SetPlot(OwnerID() , "touch" ,"Lua_apon_108_taco_2_1" , 50)
	SetPlot(OwnerID() , "range" ,"Lua_apon_108_taco_2_1" , 50)
end

function Lua_apon_108_taco_2_1()

	BeginPlot( TargetID() ,"Lua_apon_108_taco_3_1",0)
end

function Lua_apon_108_taco_3_1()
	SetPlot(OwnerID() , "range" ,"" , 0)
	AddBuff(OwnerID() ,503208 ,0 ,5 )
	--sleep(10)
	Hide(OwnerID())
	local taco = LuaFunc_CreateObjByObj ( 101264 , OwnerID() )
end



-----------------------------�\���j��e----------------------------------------------------------------------
function lua_apon_bone_1()
	SetPlot(OwnerID() , "touch" ,"lua_apon_bone_2" , 20)

end


function lua_apon_bone_2()
	
	SetPlot(TargetID(), "touch" ,"" , 0) 
	--SetPlot(OwnerID() , "touch" ," " , 20)
	Hide(TargetID())
	local random_reward = rand(99)
	
	if random_reward >= 80 and random_reward <= 99 then
		GiveBodyItem( OwnerID() , 204455, 1 )  --�t��
	end
	
	if random_reward >= 60 and random_reward <= 79 then
		GiveBodyItem( OwnerID() , 201061, 5 )  --�^MP���Ĥ�
	end
	
	if random_reward >= 40 and random_reward <= 59 then
		GiveBodyItem( OwnerID() , 204455, 1 )  --�t��
	end
	
	if random_reward >= 20 and random_reward <= 39 then
		GiveBodyItem( OwnerID() , 200820, 5 )  --�^HP���Ĥ�
	end
	
	if random_reward >= 1 and random_reward <= 19 then
		GiveBodyItem( OwnerID() , 204455, 1 )  --�t��
	end
end






function lua_apon_bone_cancel()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 101543 then
		
		if CheckBuff( TargetID() , 503122) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_204455_2]" , 1 )    --�t����r���̬\���o�X�Fģ�������~
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_204455_3]" , 1 )     --�r���̬\�����d����¶�w�Q�Ѱ��A�A���ݭn�ϥθt��
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_204455_1]" , 1 )  --�t���u���r���̬\���ϥ�
		return false
	end
end


function lua_apon_bone_cancel_1()
	
	CancelBuff( TargetID(), 503122 )
	
end

------------------------------------------------------ ����q ��ĥ�����ק� -----------------------------------------------

function Lua_apon_BossFire()
	EnableNpcAI( OwnerID() , false );
	local MagicStr = "SpellMagic"
	local MagicLVStr = "SpellMagicLv"
	local LV
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 1 , 8 , 1 do
		local Magic = MagicStr..i
		local MagicLV = MagicLVStr..i
		if GameObjInfo_Int(OrgID,Magic ) == 492967 then
			LV = GameObjInfo_Int(OrgID,MagicLV )
			break
		end
	end

	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ghost = CreateObjByObj( 112047 , TargetID() )
	AddToPartition( Ghost , RoomID )
	SetModeEx( Ghost , EM_SetModeType_Mark, false) 
	SetModeEx( Ghost , EM_SetModeType_HideName, false) 
	SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Ghost , EM_SetModeType_Strikback , false )
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 30 )
	CastSpellLV( OwnerID() , Ghost , 492427 ,LV )
	EnableNpcAI( OwnerID() , true );
end



