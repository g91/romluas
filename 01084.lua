function LuaS_101387_0()
	local Fight = false
	local Target, Dis , Count
	Local Pos_x = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Local Pos_z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	while true do

		if HateListCount( OwnerID()) > 0 then--仇恨列表中有目標
			if Fight == false then
				--剛進入戰鬥時通知其他人
				local NPC = SearchRangeNPC ( OwnerID() , 100 )
				for i=0 , table.getn(NPC)-1 do
					if 	NPC[i] ~= OwnerID() then
						SetAttack(NPC[i] , ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) )
					end
				end
				Fight  = true
				AddBuff( OwnerID() ,502383,1 ,1)

			end

			sleep(10)
		else
			--非戰鬥中
			Fight = false
			if 	math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_X  ) ) - math.abs( Pos_X) <6 	and
				math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_Z  ) ) - math.abs( Pos_Z) <6	then
				Count = 0
				local NPC = SearchRangeNPC ( OwnerID() , 300 )
				for i=0 , table.getn(NPC)-1 do
					if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 101441 then
						Count = Count + 1
						if Dis ~= nil then
							if  GetDistance( OwnerID(), NPC[i] )<Dis then
								Dis = GetDistance( OwnerID(), NPC[i] )
								Target = i				
							end
						else
							Dis = GetDistance( OwnerID(), NPC[i] )
							Target = i
						end
					end
					if i == table.getn(NPC) -1 then
						if Count == 0 then
							Target = nil
						end
					end
				end
				if Target~= nil then
					if ReadRoleValue( NPC[Target] , EM_RoleValue_OrgID ) == 101441 then
						CastSpell(OwnerID() , NPC[Target] , 492184 )
					end
				end

			end
			sleep(10)
		end
	end

end

function LuaS_101387()
	local Tar
	local Dis = 400
	local Ball = SearchRangeNPC ( OwnerID() , 300 )
	for i = 0 , table.getn(Ball) do
		if ReadRoleValue(Ball[i],EM_RoleValue_OrgID) == 101441 then
			if GetDistance( OwnerID(), Ball[i] ) < Dis then
				Dis = GetDistance( OwnerID(), Ball[i] )
				Tar = i
			end
		end
	end
	if Tar ~= nil then
		CastSpell(OwnerID() , Ball[Tar] , 492184 )
	end
	for i = 1 , 60 do
		sleep(10)
		if HateListCount( OwnerID()) > 0 then--仇恨列表中有目標
			--剛進入戰鬥時通知其他人
			local NPC = SearchRangeNPC ( OwnerID() , 100 )
			for i=0 , table.getn(NPC)-1 do
				if 	NPC[i] ~= OwnerID() then
					SetAttack(NPC[i] , ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) )
				end
			end
			--中斷施法
			AddBuff( OwnerID() ,502383,1 ,1 )
			return
		end
	end
end