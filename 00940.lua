
--���V�]�v
function LuaS_101048_0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101218, TargetID() )	
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	SetAttack(SpellCaster,TargetID())
	BeginPlot(SpellCaster,"LuaS_101048_1",0)
end

function LuaS_101048_1()
	sleep(120)
	DelObj(OwnerID())
end

--�¨��I�I��

function LuaS_101053_0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101438, TargetID() )
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
	SetAttack(SpellCaster,TargetID())
	BeginPlot(SpellCaster,"LuaS_101053_1",0)
	return true
end

function LuaS_101053_1()
	sleep(100)
	Delobj(OwnerID())
end

