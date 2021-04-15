function LuaI_MonsterFightCallMonster()
	local MonsterID = 100159	-- 食火夜妖
	local n = 0
	local FightStatus = "NoCall"

	while true do
		sleep( 1 )
		n = n + 1
		if n > 100 then	-- 100*60 = 6000 = 十分鐘脫出
			Say( OwnerID() , "Stop & Exit!!" )
			break
		else
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  --檢查是否離開戰鬥
				Sleep( 60 )	-- 六秒檢查一次
				Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )
				if (FightStatus == "NoCall" ) then
					FightStatus = "CallMonster"
					Say( OwnerID(), "CallMonster!!" )
					local Monster = {}
					Monster[1] = LuaFunc_CreateObjByObj ( MonsterID , OwnerID() )
					local MonsterAttack = SetMonsterAttack( Monster, AttackTarget )
				end
				n = n - 1
			else
				Sleep( 60 )	-- 六秒檢查一次
				Say( OwnerID(), "NoFight n = "..n )
				FightStatus = "NoCall"
			end
		end
	end
end

function LuaI_MonsterCallRecoverMonster()
	local MonsterID = 100374	-- 食火夜妖
	local n = 0
	local FightStatus = "NoCall"
	local Monster = {}

	while true do
		sleep( 1 )
		n = n + 1
		if n > 100 then	-- 100*60 = 6000 = 十分鐘脫出
			Say( OwnerID() , "Stop & Exit!!" )
			break
		else
			local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			local HPPercent = NowHP / MaxHP
			Say( OwnerID(), "HP = "..(HPPercent*100).."%" )
			if (  HPPercent  <= 0.5 ) then  --檢查是否離開戰鬥
				Sleep( 60 )	-- 六秒檢查一次
				Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )
				if (FightStatus == "NoCall" ) then
					FightStatus = "CallMonster"
					Say( OwnerID(), "CallHPMonster!!" )
					Monster[1] = LuaFunc_CreateObjByObj ( MonsterID , OwnerID() )
				end
				CastSpell( Monster[1] , OwnerID() , 490261 )	-- 治癒禱言
				n = n - 1
			else
				Sleep( 60 )	-- 六秒檢查一次
				Say( OwnerID(), "NoFight n = "..n )
				FightStatus = "NoCall"
			end
		end
	end
end