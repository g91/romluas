function Lua_cang_120_PAT1()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102685,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102945,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102945,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_120_PAT2" , 0 )
end

function Lua_cang_120_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_120_PAT1" , 0 )
end

----------------------------------------------------------------------------------------------------

function Lua_cang_120_poison()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102951, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	Hide(SpellCaster)
	Show(SpellCaster,RoomID)
	AddBuff( SpellCaster ,505349,1 ,-1 )
	WriteRoleValue(SpellCaster, EM_RoleValue_Livetime,10)
end

function Lua_cang_120_deadloop()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_DEAD)
end



function Lua_cang_120_SkillA()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102702, OwnerID() )
	AddToPartition( SpellCaster ,   RoomID )	--�[�i�R�x
	BeginPlot(SpellCaster , "Lua_cang_120_SkillA_01" , 0 )
end

function Lua_cang_120_SkillA_01()
	local count = 0
	while true do
		sleep(10)	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			if count == 0 then	
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				local ThesePlayer = {}
				local sway = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
						sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
					end					
				end	
				if table.getn(sway) ~= 0 then
					anyone = Rand(table.getn(sway))+1
					SetAttack(OwnerID(), sway[anyone] )
				elseif table.getn(sway) == 0 then
					DelObj(OwnerID())
				end
				count = 1
			end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then		
			sleep(30)
			DelObj(OwnerID())
		end	
	end	
end


function Lua_cang_120_fireshot()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102951, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	CastSpellLV(OwnerID(), OwnerID(), 494715, 1)
	WriteRoleValue(SpellCaster, EM_RoleValue_Livetime,10)
end














