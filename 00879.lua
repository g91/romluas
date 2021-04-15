function AI_TreatureGuard()

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local LightSpell1 = {[0] = 490611 , [1] = 490611 }
	local LightSpell2 = {[0] = 490614 , [1] = 490613 , [2] = 490614 , [3] = 490615 , [4] = 490613 , [5] = 490614 , [6] = 490515}
	local RandNum
	local CheckTime = 10	-- 一秒檢查一次
	local Count = 0
	local Alive = 0

	local Player = SearchRangePlayer (OwnerID() , 250 )
	for i = 0 , table.getn(Player) , 1 do --有玩家在範圍內活著就OK
		if Player[i] == -1 then
			break
		end

		if ReadRoleValue( Player[i] , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Player[i], EM_RoleValue_IsPlayer ) == 1 then
			SetAttack( OwnerID() , Player[i] )
			break
		end
	end

	while true do
		if Alive == 20 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			break
		end

		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			Alive = 0
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			local Player = LuaFunc_PartyData(AttackTarget ) 

			if CheckBuff( AttackTarget , 501076 ) ~= true then
				RandNum = Rand(5)
				if RandNum < 2 then
					CastSpellLV( OwnerID(),AttackTarget , LightSpell1[RandNum] , 20 )
				elseif RandNum == 2 and CheckBuff( AttackTarget , 501073 ) ~= true and CheckBuff( AttackTarget , 501074 ) ~= true and CheckBuff( AttackTarget , 501075 ) ~= true then
					for i = 1 , Player[0] , 1 do --對範圍120內最遠的目標進行衝鋒
						
						if 120 > GetDistance( OwnerID(), Player[i]) and GetDistance( OwnerID(), Player[i]) > GetDistance( OwnerID(), AttackTarget) then
							AttackTarget = Player[i]
							WriteRoleValue( OwnerID() , EM_RoleValue_AttackTargetID,AttackTarget  )
						end
					end
					CastSpellLV( OwnerID(),AttackTarget , 490618 , 30 )
				end
			else
				RandNum = Rand(7)
				CastSpellLV( OwnerID(),AttackTarget , LightSpell2[RandNum] , 20 )				
			end

			if HPPercent < 0.25 then
				if CastSpell( OwnerID() , OwnerID() , 490617 )	then
					sleep(15)
				end
				if Count == 0 then
					CastSpell( OwnerID() , OwnerID() , 490616 )
					Count = 15
				end
			end

			if Count > 0 then
				Count = Count - 1
			else
				Count = 0
			end
		else
			Count = 0
			Alive = Alive + 1
		end

		Sleep( CheckTime )
	end
	DelObj( OwnerID() )
end