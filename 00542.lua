function WaterElfMonsterTrap()
	local MonsterID = 100374	-- §Ù∆F
	local FlagID = 780066

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )

	local TotalMonsterNum = 8
	local WaterElf= CreateMonsterByFlagBatch( MonsterID, TotalMonsterNum , FlagID, 0, 1, RoomID )
	local WaterElfAttack = SetMonsterAttack( WaterElf, Player )

	for i = 1, TotalMonsterNum do
		local WaterElfBornYell= WaterElfBornYell( WaterElf[i] )
		BeginPlot( WaterElf[i] , "MonsterLivingTime", 0 )	-- 3000 = 5§¿ƒ¡
		local WaterElfDeadCry = MonsterDeadCrySetPlot( WaterElf[i], "WaterElfDeadCry" )
		Sleep( 1 )
	end
end

function WaterElfBornYell( MonsterID )
	local WaterElfBornYell = MonsterTalkRND( MonsterID , GetString("MT_WATERELF1") )
end

function WaterElfDeadCry()
	local WaterElfDeadCry= MonsterTalkRND( OwnerID(), GetString("MT_WATERELF2") )
end
