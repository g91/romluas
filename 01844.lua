function ic123456()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	---local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	---local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	---local Attackplayer = Lua_AP_HateTargetID( boss )  -----���������H���@�ӤH,�o�̬O�]�n��function ,Attackplayer=�O�ڧ�X�Ӫ����ӤH
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	---SetAttack( ownerid() , Attackplayer)
	---say ( Attackplayer , "==0")
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep (10)
		say ( OwnerID(), "456")
		---local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		---if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
		say ( OwnerID() , "123")
			--if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
			   --CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			--end
			--if CombatBegin == 1 then
				--skill = skill + 1
				--say ( OwnerID() , "skill="..skill)
				--if skill >= 5 then
				--	CastSpelllv ( OwnerID() , AttackTarget , 496542 , 0 )
				--end
				--skill = 0
				--skill1 = skill1 + 1
				--if skill1 >= 7 then
				--	CastSpelllv ( OwnerID() , AttackTarget , 491020 , 0 )
				--end
				--skill1 = 0
			--end
		--elseif HateListCount ( OwnerID() ) == 0 then --�D�԰��� ---�p�G����������S���H�N�n�Ǧ^��������
			--if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				--CombatBegin = 0 ------�ҥH�]������������S���H�N�����}�԰��F~�o�ɭԴN�����N�o�ӭȼg�^�h��Ӫ�0~���M���|�@���O���԰����A
			--end
		--end
	end
end