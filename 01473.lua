function ai_test()
	local skillID = {493619} 	--冰槍
	local SkillLV = {1}			-- 招式LV
	local skillshow = 1			-- 技能編號
	local counter = 0
	
	while true do
		sleep(10) --1秒
		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --取當前目標數值
		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			counter = counter+1
			if counter == 10 then 
				CastSpellLV( OwnerID() , attacktarget, SkillID[SkillShow] , SkillLV[SkillShow] )
				counter = 0
			end
		end
		
	end
end