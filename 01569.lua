
----------------------------------------------------  �m���ާL -1�n -----------------------------------------------

function Lua_cang_Z9_PAT1()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102727,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102731,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102731,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT2" , 0 )
end

function Lua_cang_Z9_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT1" , 0 )
end

----------------------------------------------------  �m���ާL -2�n -----------------------------------------------

function Lua_cang_Z9_PAT3()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102733,Matrix,3,1)
	
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102732,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102732,Matrix,2,0)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102732,Matrix,3,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102732,Matrix,3,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102732,Matrix,4,-1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102732,Matrix,4,0)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT4" , 0 )
end

function Lua_cang_Z9_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT3" , 0 )
end

--�X�m�۴�

function Lua_cang_Z9_flag1()

	Yell( OwnerID() , "[SC_102730_1]" ,5)	--�J�I��

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102753, TargetID() )
	--SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	--SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	--SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	--SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	--SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	BeginPlot(SpellCaster,"Lua_cang_Z9_flag2",0)
end


function Lua_cang_Z9_flag2()

	sleep(10)
	local NPC = SearchRangeNPC ( OwnerID() , 200 )
	local Player = SearchRangePlayer ( OwnerID() , 200 )

	for i=0,table.getn(NPC)-1 do
		if CheckID( Player[0] ) == true and ReadRoleValue( Player[0] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Player[0] , EM_RoleValue_IsPlayer ) == 1 then	--�ˬd���a�O���O�٦b�F�ˬd�O�_���`�F�ˬd�O���O���a
			SetAttack( NPC[i] , Player[0] ) --�n�D�Ǫ��������a
		end	
	end	
	sleep(100)
	Delobj(OwnerID())
end

function Lua_cang_Fight_1()
--�p���԰����Z��
	local Tar
	local Search = SearchRangeNPC ( OwnerID() , 40 )
	for i = 0 , table.getn(Search)+1 do
		if Search[i] ~= OwnerID() then
			if Search[i] == -1 then
--				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
				return
			end
			Tar = Search[i]
			break
		end
	end
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(10)
	for i=1 , 4 do
		if LuaS_Discowood_TrueFight_2(Tar) == false then
			return
		else
			if i ~= 4 then
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
				sleep(30)
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
			end
		end
	end
end