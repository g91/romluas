----與人交談

function LuaS_Discowood_ModTalkToOther()
	local Self_Dir = ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	while true do
		sleep(70)
		if Self_Dir  == ReadRoleValue(OwnerID(),EM_RoleValue_Dir) then
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) ~= 1 then
				PlayMotion( OwnerID(), 112) --談話
			end
		else
			if ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)  ~= 1 then
				SetDir( OwnerID(), Self_Dir)
				PlayMotion( OwnerID(), 112) --談話
			end
		end
	end	
end


function LuaS_Discowood_ActionTest()
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
end