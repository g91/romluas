--�H�U�O�n�浹�����禡

--�榸�e�U���ȧ����ϤZ��R�������n��W�[

function LuaS_FA_FamousUp()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous,10 )
end

--�榸�e�U���ȧ����϶��`�ۭn�몺�n��W�[

function LuaS_BL_FamousUp()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous+1,10 )
end

--�榸���y���ȧ����ϤZ��R�������n��U��

function LuaS_FA_FamousDown()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous,10 )
end

--�榸���y���ȧ����϶��`�ۭn�몺�n��U��

function LuaS_BL_FamousDown()
	AddRoleValue ( TargetID() , EM_RoleValue_Famous+1,10 )
end


--����n��

function Lua_FamousSHOW()
	SAY(OwnerID(),"FA_famous is "..ReadRoleValue(OwnerID(),EM_RoleValue_Famous)..".")
	SAY(OwnerID(),"BL_famous is "..ReadRoleValue(OwnerID(),EM_RoleValue_Famous+1)..".")
end