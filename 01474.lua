function ai_blood()
	local SkillID = {}
	local SkillLV = {}
	local counter = 0
	while 1 do
		sleep(10)	--��1��
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --����e�ؼмƭ�		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			--local	playername = SearchRangeNPC ( OwnerID , 500 )	--�j�M�P�򪱮a
			local g1 = GetPartyID( TargteID(), 1 )
			sleep(20)	--��2��
			Say (OwnerID(), g1)
		end			
	end		
end