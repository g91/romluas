function AI_test()
		local skillID = {492682} 	--����
		local SkillLV = {1}			-- �ۦ�LV
		local skillshow = 1			-- �ޯ�s��
		local counter = 0
	while 1 do
		sleep(10) --1��		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --����e�ؼмƭ�		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			counter = counter+1			--�ֿn10��
			if counter == 10 then 		--�I��k�N
				CastSpellLV( OwnerID() , attacktarget, SkillID[SkillShow] , SkillLV[SkillShow] )
				counter = 0				
			end
			else counter =0   --���}�԰��k0
		end
		break		--���}�԰����m�ܼ�
	end
end