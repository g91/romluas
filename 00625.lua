function AI_KaMoKu()	-- 卡莫庫(KaMoKu)
	local MonsterID = 100148	-- 紅色疾影
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
	local HelpMonsterID = 100261	-- 賀多雷恩(HerDoLeN)
	local HelpRange = 500

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次
	SetPlot( OwnerID() , "dead" , "LuaI_dead_100262" ,40 )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- 血 3/4 叫怪
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
				--Say( OwnerID() , "NowHP = 75%")
				HP75, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_KAMOKU1") )
				for i = 1, table.getn( Monster1 ) do
					Say( Monster1[i]  , GetString("MT_FS_BOMB1") )
				end
			end
			-- 血 2/4 叫怪
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
				--Say( OwnerID() , "NowHP = 50%")
				HP50, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_KAMOKU1") )
				for i = 1, table.getn( Monster2 ) do
					Say( Monster2[i] , GetString("MT_FS_BOMB1") )
				end
			end
			-- 血 1/4 叫怪
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
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"

			for i = 1, table.getn( Monster1 ) do	-- 離開戰鬥疾影
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- 離開戰鬥疾影
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- 離開戰鬥疾影
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end
		end

	Sleep( CheckTime )
	end
end

function AI_HerDoLeN()	-- 賀多雷恩(HerDoLeN)
	local MonsterID = 100144	-- 藍色疾影
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
	local HelpMonsterID = 100262	-- 卡莫庫(KaMoKu)
	local HelpRange = 1500

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次
	SetPlot( OwnerID() , "dead" , "LuaI_dead_100261" ,40 )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- 血 3/4 叫怪
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
				--Say( OwnerID() , "NowHP = 75%")
				HP75, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_HERDOLEN1") )
				for i = 1, table.getn( Monster1 ) do
					Say( Monster1[i] , GetString("MT_FS_BOMB1") )
				end
			end
			-- 血 2/4 叫怪
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
				--Say( OwnerID() , "NowHP = 50%")
				HP50, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_HERDOLEN1") )
				for i = 1, table.getn( Monster2 ) do
					Say( Monster2[i] , GetString("MT_FS_BOMB1") )
				end
			end
			-- 血 1/4 叫怪
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
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"	

			for i = 1, table.getn( Monster1 ) do	-- 離開戰鬥刪除疾影
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- 離開戰鬥刪除疾影
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- 離開戰鬥刪除疾影
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

