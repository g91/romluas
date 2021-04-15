function lua_kors_z20mis_hangi_check()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 105766 or ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 105824 then
		return TRUE
	else
		return FALSE
	end
end

function lua_kors_z20mis_hangi()
		if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 105766 or ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 105824 then
			GiveBodyItem(OwnerID(),240321,1)
		end
end

function lua_kors_z20mis_packmov()
	while TRUE do
		for f = 1,10,1 do
			MoveToFlagEnabled( OwnerID(), false )
			WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 2 ) 
			LuaFunc_MoveToFlag( OwnerID(), 780968 , f ,30 )
			Sleep(400) 
		end 	
	Sleep(400)
	end
end

function lua_kors_Z20_mis()
	if CountBodyItem(OwnerID(),240289) ~=0 then
		local c = CountBodyItem(OwnerID(),240289)
		DelBodyItem(OwnerID(),240289,c)
	end
end