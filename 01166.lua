---------------------------------------------------------------------------------------------------Boss¦º¤`­p¦¸	
function lua_star_BossKilledCount(BossID)	
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	local PlayerJob = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local Name = GetName( TargetID() )
	DesignLog( OwnerID() , BossID , " Killer is "..PlayerLV.." and SubLv is "..PlayerSUBLV.." and Job is"..PlayerJob )
	--Say(TargetID() , BossID)
	return true
end