function EatFireMonsterTrap()
	local MonsterID = 100159	-- 食火夜妖
	local FlagID = 780065

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )

	local EatFireRND =  Rand( 99 ) + 1	-- 產生 1~100 的亂數

	    if ( EatFireRND >  0 and EatFireRND <=  5 ) then
		-- 超幸運，沒半隻
	elseif ( EatFireRND >  5 and EatFireRND <= 20 ) then
		local TotalMonsterNum = 1
		local EatFire = CreateMonsterByFlagBatch( MonsterID, TotalMonsterNum , FlagID, 0, 1, RoomID )
		local EatFireAttack = SetMonsterAttack( EatFire, Player )
		for i = 1, TotalMonsterNum do
			local EatFireBornYell= EatFireBornYell( EatFire[i] )
			BeginPlot( EatFire[i] , "MonsterLivingTime", 0 )	-- 3000 = 5分鐘
			local EatFireDeadCry = MonsterDeadCrySetPlot( EatFire[i], "EatFireDeadCry" )
			Sleep( 1 )
		end
	elseif ( EatFireRND > 20 and EatFireRND <= 40 ) then
		local TotalMonsterNum = 2
		local EatFire = CreateMonsterByFlagBatch( MonsterID, 2, FlagID, 1, 1, RoomID )
		local EatFireAttack = SetMonsterAttack( EatFire, Player )
		for i = 1, TotalMonsterNum do
			local EatFireBornYell= EatFireBornYell( EatFire[i] )
			BeginPlot( EatFire[i] , "MonsterLivingTime", 0 )	-- 3000 = 5分鐘
			local EatFireDeadCry = MonsterDeadCrySetPlot( EatFire[i], "EatFireDeadCry" )
			Sleep( 1 )
		end
	elseif ( EatFireRND > 40 and EatFireRND <= 90 ) then
		local TotalMonsterNum = 3
		local EatFire = CreateMonsterByFlagBatch( MonsterID, 3, FlagID, 0, 1, RoomID )
		local EatFireAttack = SetMonsterAttack( EatFire, Player )
		for i = 1, TotalMonsterNum do
			local EatFireBornYell= EatFireBornYell( EatFire[i] )
			BeginPlot( EatFire[i] , "MonsterLivingTime", 0 )	-- 3000 = 5分鐘
			local EatFireDeadCry = MonsterDeadCrySetPlot( EatFire[i], "EatFireDeadCry" )
			Sleep( 1 )
		end
	elseif ( EatFireRND > 90 and EatFireRND <= 100 ) then
		local TotalMonsterNum = 6
		local EatFire = CreateMonsterByFlagBatch( MonsterID, 6, FlagID, 0, 1, RoomID )
		local EatFireAttack = SetMonsterAttack( EatFire, Player )
		for i = 1, TotalMonsterNum do
			local EatFireBornYell= EatFireBornYell( EatFire[i] )
			BeginPlot( EatFire[i] , "MonsterLivingTime", 0 )	-- 3000 = 5分鐘
			local EatFireDeadCry = MonsterDeadCrySetPlot( EatFire[i], "EatFireDeadCry" )
			Sleep( 1 )
		end
	end
end

function EatFireBornYell( MonsterID )
	local EatFireBornYell = MonsterTalkRND( MonsterID , GetString("MT_EATFIRE1") )
end

function EatFireDeadCry()
	local EatFireDeadCry= MonsterTalkRND( OwnerID(), GetString("MT_EATFIRE2") )
end
