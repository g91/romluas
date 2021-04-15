function LuaI_FollowBossMonster()
	BossID = 100374	-- 水靈
	MonsterID = 100052	-- 食火夜妖

	local Monster = LuaFunc_CreateObjByObj ( MonsterID , OwnerID() )
	SetFollow( Monster , OwnerID() )
end

function AI_Follow()

	local BossID = 100052	-- 蕈人
	local Range = 1000

	local MFB = MonsterFollowBoss( BossID , Range )

end

function MonsterFollowBoss( BossID , Range )

	local CheckTime = 10	-- 一秒檢查一次

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  --檢查是否離開戰鬥
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )
		else
			--Say( OwnerID(), "NoFight n = "..n )
			local Count = SetSearchRangeInfo( OwnerID() , Range )
			--Say( OwnerID(), "Count = "..Count )
			for i = 1, Count do
				local ID = GetSearchResult()
				OrgID = ReadRoleValue( ID , EM_RoleValue_OrgID )
				--Say( OwnerID(), "OrgID"..i.." = "..OrgID )
				if ( OrgID == BossID) then
					SetFollow( OwnerID() , ID )
					--Say( OwnerID() , "Boss, I'm Coming!" )
					while true do
						Sleep( CheckTime )
						--Say( OwnerID() , "Keep Follow~" )
						local Dis =  GetDistance( OwnerID() , ID )
						if ( Dis < 50 ) then
							SetFollow( OwnerID() , OwnerID() )
							--Say( OwnerID() , "Stop Follow~" )
							break	-- 到小王身邊就跳出
						end
					end
				break		-- 跟隨小王之後就跳出
				else
					--Say(OwnerID() , "Not Boss, Not Follow!" )
				end
			end
		end
	Sleep( CheckTime )
	end

end