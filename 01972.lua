----------------------------------------------------------------------------------------------------------------
                                                --1���ePAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_PAT1() --4�H�p��

	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104208,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104209,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104211,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104210,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT2" , 0 )
end

function Lua_zone17_133_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT1" , 0 )
end

function Lua_zone17_133_PAT3() --3�H�p��

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104209,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104210,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104213,Matrix,2,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT4" , 0 )
end

function Lua_zone17_133_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT3" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                              --2���ePAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_PAT1_2() --4�H�p��

	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104220,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104221,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104223,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104222,Matrix,3,0)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT2_2" , 0 )
end

function Lua_zone17_133_PAT2_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT1_2" , 0 )
end

function Lua_zone17_133_PAT3_2() --5�H�p��

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104220,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104221,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104222,Matrix,5,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104230,Matrix,3,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104230,Matrix,3,-1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT4_2" , 0 )
end

function Lua_zone17_133_PAT4_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT3_2" , 0 )
end

----------------------------------------------------------------------------------------------------------------
                                              --3���ePAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_PAT1_3() --3�H�p��

	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104241,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104243,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104234,Matrix,2,-1)
	BeginPlot( ObjMatrix[3], "Lua_Az133_Monkey_2", 10 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT2_3" , 0 )
end

function Lua_zone17_133_PAT2_3()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT1_3" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                              --4���ePAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_PAT1_4() --5�H�p��

	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104245,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104244,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104248,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104247,Matrix,4,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104246,Matrix,4,-1)
	BeginPlot(ObjMatrix[3],"Lua_Az133_FrenzyMonkey",0) 
	

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT2_4" , 0 )
end

function Lua_zone17_133_PAT2_4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT1_4" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                              --5���ePAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_PAT1_5() --5�H�p��

	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104252,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104256,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104253,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104254,Matrix,4,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104255,Matrix,4,-1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT2_5" , 0 )
end

function Lua_zone17_133_PAT2_5()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT1_5" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                              --6���ePAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_PAT1_6() --5�H�p��

	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104261,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104261,Matrix,1,0)


	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT2_6" , 0 )
end

function Lua_zone17_133_PAT2_6()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_133_PAT1_6" , 0 )
end

-------------------------------------------------------------------------------------------------------------
function Lua_zone17_133_monster()                   --����
	CastSpellLv(OwnerID(),OwnerID(),490590,0)
end
function Lua_zone17_133_monstertotan()              --�۴�����
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local totan
	local ttime = 0 
	while true do
	sleep(10)
		if HateListCount(OwnerID()) ~=0 then
			ttime = ttime +1 
			if ttime == 1 then
				totan=LuaFunc_CreateObjByObj ( 104320, OwnerID() )
				SetModeEx(totan, EM_SetModeType_Move, false)
				AddToPartition(totan, RoomID)
				addbuff(totan,507528,0,-1)
			end
		elseif  HateListCount(OwnerID()) == 0 and GameStart == 1 then  --���a���Χ���k�s���k0
			if ReadRoleValue( OwnerID(), EM_RoleValue_IsDead)==0 then

			end
		end		
	end
end     
function Lua_zone17_133_polic()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--local obj1 = LuaFunc_CreateObjByObj ( 104321 , OwnerID() )
	local obj1 = star_CreateObj( OwnerID() , 104321 , 0 , 0 , 0 , RoomID , 90) --�̾�OwnerID��m�гyXXX����XYZ�y��,zoomID,���V
		SetModeEx(obj1,EM_SetModeType_Move,false)
		SetModeEx(obj1,EM_SetModeType_Fight,false)
		SetModeEx(obj1,EM_SetModeType_Searchenemy,false)
		SetModeEx(obj1,EM_SetModeType_Strikback,false)
		SetModeEx(obj1,EM_SetModeType_Mark ,false)
		WriteRoleValue(obj1,EM_RoleValue_Livetime,1)
		SetModeEx(obj1,EM_SetModeType_ShowRoleHead,false)
		AddToPartition(obj1,RoomID)
		CastSpellLv(obj1,obj1,496065,0)
end
function Lua_zone17_eat()
	if	CheckBuff(TargetID(),507450) then
		CancelBuff(TargetID(),507450)
		ScriptMessage( OwnerID(), 0 , 2 ,"[SC_104140_09]" , 2 )
		--say(OwnerID(),"bad")
	else
		ScriptMessage( OwnerID(), 0 , 2 ,"[SC_104140_08]" , 2 )
		--say(OwnerID(),"good")
	end
end

--/gm ? savenpcmove %T_ID 780716 0 1 1 0 1  --��NPC�X�и��|
--/gm ? createflag xxxxxx                   --�гy�X��
--/gm ? delflaglist xxxxxx                  --�R���X��