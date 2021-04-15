function AI_KaMoKu()	-- �d���w(KaMoKu)
	local MonsterID = 100148	-- ����e�v
	local MonsterNumber1 = 2
	local MonsterNumber2 = 4
	local MonsterNumber3 = 6

	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}

	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local HelpAttack = "false"
	local HelpMonsterID = 100261	-- �P�h�p��(HerDoLeN)
	local HelpRange = 500

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- �@���ˬd�@��
	SetPlot( OwnerID() , "dead" , "LuaI_dead_100262" ,40 )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- �� 3/4 �s��
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
				--Say( OwnerID() , "NowHP = 75%")
				HP75, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_KAMOKU1") )
				for i = 1, table.getn( Monster1 ) do
					Say( Monster1[i]  , GetString("MT_FS_BOMB1") )
				end
			end
			-- �� 2/4 �s��
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
				--Say( OwnerID() , "NowHP = 50%")
				HP50, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_KAMOKU1") )
				for i = 1, table.getn( Monster2 ) do
					Say( Monster2[i] , GetString("MT_FS_BOMB1") )
				end
			end
			-- �� 1/4 �s��
			if ( HPPercent <= 0.25 ) and ( HP25 == "false" ) then
				--Say( OwnerID() , "NowHP = 25%")
				local RouletteTarget = PartyRoulette( AttackTarget )
				HP25, Monster3 = CallMonsterAtFightStart( OwnerID() , RouletteTarget , MonsterID , MonsterNumber3 , GetString("MT_KAMOKU1") )
				for i = 1, table.getn( Monster3 ) do
					BeginPlot( Monster3[i] , "FastShadowHPBomb", 0 )
				end
			end
			if ( HPPercent <= 0.10 ) and ( HelpAttack == "false" ) then
				--Say( OwnerID() , "NowHP = 10%")
				local RND =  Rand( 100 ) + 1
				if ( RND <= 20 ) then
					--local HelpAttack , HelpMonster ,Pos= H_K_CallHelpMonster( OwnerID() , HelpMonsterID , HelpRange , GetString("MT_KAMOKU2") )
					--SetAttack( HelpMonster , AttackTarget )
					--Move( HelpMonster , Pos["X"] , Pos["Y"] , Pos["Z"] )
				end
			end
			if ( HPPercent <= 0.05 ) and ( HelpAttack == "false" ) then
				--Say( OwnerID() , "NowHP = 5%")
				local RND =  Rand( 100 ) + 1
				if ( RND <= 40 ) then
					--local HelpAttack , HelpMonster,Pos = H_K_CallHelpMonster( OwnerID() , HelpMonsterID , HelpRange , GetString("MT_KAMOKU2") )
					--SetAttack( HelpMonster , AttackTarget )
					--Move( HelpMonster , Pos["X"] , Pos["Y"] , Pos["Z"] )
				end
			end

		else
			HP75 = "false"		-- �D�԰��A�k�s�O��
			HP50 = "false"	
			HP25 = "false"

			for i = 1, table.getn( Monster1 ) do	-- ���}�԰��e�v
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- ���}�԰��e�v
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- ���}�԰��e�v
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end
		end

	Sleep( CheckTime )
	end
end

function AI_HerDoLeN()	-- �P�h�p��(HerDoLeN)
	local MonsterID = 100144	-- �Ŧ�e�v
	local MonsterNumber1 = 2
	local MonsterNumber2 = 4
	local MonsterNumber3 = 6

	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}

	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local HelpAttack = "false"
	local HelpMonsterID = 100262	-- �d���w(KaMoKu)
	local HelpRange = 1500

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- �@���ˬd�@��
	SetPlot( OwnerID() , "dead" , "LuaI_dead_100261" ,40 )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- �� 3/4 �s��
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
				--Say( OwnerID() , "NowHP = 75%")
				HP75, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_HERDOLEN1") )
				for i = 1, table.getn( Monster1 ) do
					Say( Monster1[i] , GetString("MT_FS_BOMB1") )
				end
			end
			-- �� 2/4 �s��
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
				--Say( OwnerID() , "NowHP = 50%")
				HP50, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_HERDOLEN1") )
				for i = 1, table.getn( Monster2 ) do
					Say( Monster2[i] , GetString("MT_FS_BOMB1") )
				end
			end
			-- �� 1/4 �s��
			if ( HPPercent <= 0.25 ) and ( HP25 == "false" ) then
				--Say( OwnerID() , "NowHP = 25%")
				local RouletteTarget = PartyRoulette( AttackTarget )
				HP25, Monster3 = CallMonsterAtFightStart( OwnerID() , RouletteTarget , MonsterID , MonsterNumber3 , GetString("MT_HERDOLEN1") )
				for i = 1, table.getn( Monster3 ) do
					BeginPlot( Monster3[i] , "FastShadowMPBomb", 0 )
				end
			end
			if ( HPPercent <= 0.10 ) and ( HelpAttack == "false" ) then
				--Say( OwnerID() , "NowHP = 10%")
				local RND =  Rand( 100 ) + 1
				if ( RND <= 20 ) then
					--local HelpAttack , HelpMonster , Pos = H_K_CallHelpMonster( OwnerID() , HelpMonsterID , HelpRange , GetString("MT_HERDOLEN2") )
					--SetAttack( HelpMonster , AttackTarget )
					--Move( HelpMonster , Pos["X"] , Pos["Y"] , Pos["Z"] )
				end
			end
			if ( HPPercent <= 0.05 ) and ( HelpAttack == "false" ) then
				--Say( OwnerID() , "NowHP = 5%")
				local RND =  Rand( 100 ) + 1
				if ( RND <= 40 ) then
					--local HelpAttack , HelpMonster , Pos  = H_K_CallHelpMonster( OwnerID() , HelpMonsterID , HelpRange , GetString("MT_HERDOLEN2") )
					--SetAttack( HelpMonster , AttackTarget )
					--Move( HelpMonster , Pos["X"] , Pos["Y"] , Pos["Z"] )
				end
			end
		else
			HP75 = "false"		-- �D�԰��A�k�s�O��
			HP50 = "false"	
			HP25 = "false"	

			for i = 1, table.getn( Monster1 ) do	-- ���}�԰��R���e�v
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- ���}�԰��R���e�v
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- ���}�԰��R���e�v
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end
		end

	Sleep( CheckTime )
	end
end

function H_K_CallHelpMonster( Player , HelpMonsterID , HelpRange , SayString )
	local Pos = {}
	Pos["X"] = ReadRoleValue(  Player , EM_RoleValue_X - 75 )
	Pos["Y"] = ReadRoleValue(  Player , EM_RoleValue_Y )
	Pos["Z"] = ReadRoleValue(  Player , EM_RoleValue_Z - 75 )
	local HelpAttack = "false"

	local HelpMonster = LuaFunc_SearchNPCbyOrgID( Player , HelpMonsterID , HelpRange )
	if CheckID( HelpMonster ) == true then
		HelpAttack = "true"
		Say( Player , SayString )
	end

	return HelpAttack , HelpMonster, Pos

end

