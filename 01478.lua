function AI_test()
		local skillID = {492682} 	--恐懼
		local SkillLV = {1}			-- 招式LV
		local skillshow = 1			-- 技能編號
		local counter = 0
	while 1 do
		sleep(10) --1秒		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --取當前目標數值		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			counter = counter+1			--累積10次
			if counter == 10 then 		--施放法術
				CastSpellLV( OwnerID() , attacktarget, SkillID[SkillShow] , SkillLV[SkillShow] )
				counter = 0				
			end
			else counter =0   --離開戰鬥歸0
		end
		break		--離開戰鬥重置變數
	end
end