function ai_test()
	local skillID = {493619} 	--�B�j
	local SkillLV = {1}			-- �ۦ�LV
	local skillshow = 1			-- �ޯ�s��
	local counter = 0
	
	while true do
		sleep(10) --1��
		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --����e�ؼмƭ�
		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			counter = counter+1
			if counter == 10 then 
				CastSpellLV( OwnerID() , attacktarget, SkillID[SkillShow] , SkillLV[SkillShow] )
				counter = 0
			end
		end
		
	end
end