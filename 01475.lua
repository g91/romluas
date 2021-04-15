function lua_kenny_SpiritCurse_Master()	
	local MaxMP = ReadRoleValue( TargetID() , EM_RoleValue_MaxMP )
	local MaxSP = ReadRoleValue( TargetID() , EM_RoleValue_MaxSP )		
	local MaxSP_Sub = ReadRoleValue( TargetID() , EM_RoleValue_MaxSP_Sub )
	local MP = 0
	local SP = 0
	local SP_Sub = 0
		
	if MaxMP ~= 0  then
		MP = ReadRoleValue( TargetID() , EM_RoleValue_MP )
		WriteRoleValue( TargetID() , EM_RoleValue_MP , MP-MaxMP*0.03 )		--¦©3%Å]¤O
	end
	if MaxSP ~= 0  then
		SP = ReadRoleValue( TargetID() , EM_RoleValue_SP )
		WriteRoleValue( TargetID() , EM_RoleValue_SP , SP-MaxSP*0.25 )	--¦©40sp
	end
	if MaxSP_Sub ~= 0 then
		SP_Sub = ReadRoleValue( TargetID() , EM_RoleValue_SP_Sub )
		WriteRoleValue( TargetID() , EM_RoleValue_SP_Sub , SP_Sub-MaxSP_Sub*0.25 ) 	--¦©40sp
	end	
end 