function AI_ANKARIA()
	SetPlot( OwnerID() , "dead" , "Lua_100074_deadlog_1" , 0 )			--�����w�d���ȳQ��
	local MonsterID = 100072	-- �ͧ�
	local MonsterNumber1 = 2
	local MonsterNumber2 = 2
	local MonsterNumber3 = 2
	local HPMonsterNumber = 2
	local HPMonsterID = 100070	-- ���w�k�v
	local FirstMagicID = 490636	-- �s��ɧ�
	local BuffID = 501014 	-- �s��ɧ�Buff
	local SecondMagicID = 490471	-- ���y�N
	local SecondMagicLV = 120
	local thirdMagicID = 490489		-- �j�z��
	local thirdMagicLV = 50

	local HPMagicID = 491078	-- �p���M��30%��_�N�]���50%, 25%�ɨϥΡ^
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- �@���ˬd�@��
	local FTM = "NoCall"	-- �԰����A
	local F2M = "NoCall"	-- �԰����A
	local F4M = "NoCall"	-- �԰����A
	local HPM2 = "NoCall"	-- �^�媬�A
	local HPM4 = "NoCall"	-- �^�媬�A
	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}


	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )

			if ( CheckBuff( AttackTarget , BuffID ) == true ) then
				CastSpellLV( OwnerID(), AttackTarget, SecondMagicID , SecondMagicLV ) 
			else
				local RND =  Rand( 99 ) + 1	-- ���� 1~100 ���ü�
				    if ( RND >  0 and RND <= 20 ) then
					CastSpell( OwnerID(), AttackTarget, FirstMagicID )
				elseif ( RND > 20 and RND <= 30 ) then
					if ( CastSpellLV( OwnerID(), AttackTarget, thirdMagicID , thirdMagicLV ) ) then
					--Say( OwnerID(), GetString("MT_ANKARIA4") )
						Say( OwnerID(), GetString("MT_ANKARIA5") )
						Sleep( 100 )
					end
				end
			end

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- �԰��}�l�s��
			if (FTM == "NoCall" ) then	FTM, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_ANKARIA1") )	end
			-- �� 1/2 �s��
			if ( HPPercent <= 0.5 ) and (F2M == "NoCall" ) then	F2M, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_ANKARIA1") )	end
			-- �� 1/4 �s��
			if ( HPPercent <= 0.25 ) and (F4M == "NoCall" ) then	F4M, Monster3 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber3 , GetString("MT_ANKARIA1") )	end

			-- �� 1/2 �s�Ǹɦ�
			if (HPM2 == "NoCall" ) then	HPM2 = CallMonsterForRecovery( OwnerID() , 0.5 , 100070, 491078 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3") )	end
			-- �� 1/4 �s�Ǹɦ�
			if (HPM4 == "NoCall" ) then	HPM4 = CallMonsterForRecovery( OwnerID() , 0.25 , 100070, 491078 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3")  )	end

		else
			--Say( OwnerID(), "NoFight n = "..n )

			FTM = "NoCall"		-- �D�԰��A�k�s�O��
			F2M = "NoCall"		-- �D�԰��A�k�s�O��
			F4M = "NoCall"		-- �D�԰��A�k�s�O��
			HPM2 = "NoCall"		-- �D�԰��A�k�s�O��
			HPM4 = "NoCall"		-- �D�԰��A�k�s�O��


			for i = 1, table.getn( Monster1 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��ͧ�
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��ͧ�
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��ͧ�
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end

		end

	Sleep( CheckTime )
	end
end