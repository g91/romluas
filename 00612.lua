-- �w�h�Q�����O�q
function AI_Andoreir_Power()
	SetPlot( OwnerID() , "dead" , "Lua_100166_deadlog_1" , 0 );
	local MonsterID = { 100231 , 100232 , 100641 , 100232 , 100641  }	-- �d�E���� , ���뵲�� , ���ߵ��� , ���뵲�� , ���ߵ���
	local MonsterNumber = 2
	local Monster = {}

	local FTM = "NoCall"	-- �԰����A
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- �@���ˬd�@��

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			--Say( OwnerID(), "Fighting!")

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			if ( HPPercent <= 0.5 ) and ( FTM == "NoCall" ) then
				Say( OwnerID() , GetString("MT_ANDOREIR1") )
				for i = 1, MonsterNumber do	-- ��C��@�b���H���s��ص��������T��
					local RND =  Rand( 5 ) + 1	-- ���� 1~5 ���ü�
					--Say( OwnerID(), "RND = "..RND )

					local X = { 30 , -30 , -30 , 30 , -40  }
					local Z = { -30 , 30 , -30 , 30 , -40  }
					Monster[i] = CreateMonsterByBOSSBatch( MonsterID[RND], OwnerID() , X[RND] , Z[RND] )
					FTM = "Called"			-- �@�O���A���ǥu�X�{�@��
					local MonsterAttack = SetMonsterAttack( Monster , AttackTarget )
				end
			end
		else
			--Say( OwnerID(), "NoFight" )

			FTM = "NoCall"		-- �D�԰��A�k�s�O��

			-- ���}�԰��ɡA�R����C��@�b�ɥs�X�Ӫ�����
			for i = 1, table.getn( Monster ) do
				if ( ( Monster[i] ~= nil ) and ( CheckID( Monster[i] ) == true ) ) then	DelObj( Monster[i] )	end
			end

			if ( Monster ~= nil ) then	Monster = {}	end

		end

	Sleep( CheckTime )
	end
end

-- �w�h�Q�����v�l
function AI_Andoreir_Shadow()
	SetPlot( OwnerID() , "dead" , "Lua_100233_deadlog_1" , 0 );
	local MonsterID = 100618	-- �w�h�Q�����v�l
	local MonsterNumber1 = 1
	local MonsterNumber2 = 1
	local MonsterNumber3 = 2

	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}

	local FTM = "NoCall"	-- �԰����A
	local F2M = "NoCall"	-- �԰����A
	local F4M = "NoCall"	-- �԰����A

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- �@���ˬd�@��

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			if ( FTM == "NoCall" ) then	-- �԰��}�l�s��
				local RND =  Rand( 3 ) + 1	-- ���� 1~3 ���ü�
				--Say( OwnerID(), "RND = "..RND )
				FTM = "Called"
				if ( RND == 3 ) then	FTM, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_ANDOREIR2") )	end
			end
			-- �� 1/2 �s��
			if ( HPPercent <= 0.5 ) and (F2M == "NoCall" ) then	F2M, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_ANDOREIR2") )	end
			-- �� 1/4 �s��
			if ( HPPercent <= 0.25 ) and (F4M == "NoCall" ) then	F4M, Monster3 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber3 , GetString("MT_ANDOREIR2") )	end
		else
			FTM = "NoCall"		-- �D�԰��A�k�s�O��
			F2M = "NoCall"		-- �D�԰��A�k�s�O��
			F4M = "NoCall"		-- �D�԰��A�k�s�O��

			for i = 1, table.getn( Monster1 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��v�l
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��v�l
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end

			for i = 1, table.getn( Monster3 ) do	-- ���}�԰��ɡA�R���i�J�԰��ɥs�X�Ӫ��v�l
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end
		end

	Sleep( CheckTime )
	end
end

