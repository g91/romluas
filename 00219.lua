function SetMaxSkill(RoleID)

	-- local Obj = Role:new( RoleID)
	local MaxSkill
	for i = 0 , 29  , 1 do

		-- MaxSkill = ReadRoleValue( RoleID , EM_RoleValue_SkillMax_Unarmed + i );
		-- WriteRoleValue( RoleID , EM_RoleValue_Skill_Unarmed + i , MaxSkill );
		WriteRoleValue( RoleID , EM_RoleValue_Skill_Unarmed + i , 300 );

	end
--WriteRoleValue( RoleID ,  xx  , 25 );

end