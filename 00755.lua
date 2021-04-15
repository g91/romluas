function moliyo_test_item()
	BeginPlot( OwnerID() , "moliyo_test_P", 0 )
end

function moliyo_test_P()
	Say ( OwnerID() , "MM ! I need your help !!" )

	local FirstCount = true
	local Speak = false
	local FightTime = 0

	local P_MaxHP = 0
	local P_HP = 0
	local P_MaxMP = 0
	local P_MP = 0
	local M_MaxHP = 0
	local M_HP = 0
	local AttackTarget = 0
	local M_ID = 0

	local TalkGroup = MonsterTalkFormat( GetString("ST_FIGHT_TEST") )


	while true do
		local AttackStatue = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )
		AttackTarget = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID )
		local IsDead = ReadRoleValue ( AttackTarget , EM_RoleValue_IsDead )
		if AttackStatue == 1 then
			if FirstCount  then
				FirstCount = false

				tell(TargetID(),OwnerID(), "Round One Fight ! V.S "..AttackTarget)

				M_ID = AttackTarget
				BeginPlot( AttackTarget , "moliyo_test_M", 0 )
				P_MaxHP = ReadRoleValue ( OwnerID() , EM_RoleValue_MaxHP )
				P_MaxMP = ReadRoleValue ( OwnerID() , EM_RoleValue_MaxMP )
				M_MaxHP = ReadRoleValue ( AttackTarget , EM_RoleValue_MaxHP )
			end
			AttackTarget = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID )

			FightTime = FightTime + 1
		else
			IsDead = ReadRoleValue ( AttackTarget , EM_RoleValue_IsDead )
			if IsDead ==1 then
				Speak = true
				P_HP = ReadRoleValue ( OwnerID() , EM_RoleValue_HP )
				P_MP = ReadRoleValue ( OwnerID() , EM_RoleValue_MP )
				M_HP = ReadRoleValue ( AttackTarget , EM_RoleValue_HP )
			end

			if Speak then
				--talk
				tell(TargetID(),OwnerID(),TalkGroup[2]..FightTime/10 )
				tell(TargetID(),OwnerID(),TalkGroup[4]..P_MaxHP-P_HP)
--				tell(TargetID(),OwnerID(),TalkGroup[5]..M_MaxHP-M_HP)
				tell(TargetID(),OwnerID(),TalkGroup[6]..P_MaxMP-P_MP)
				if M_ID ~= 0 then
					tell(TargetID(),OwnerID(),"Your Target Is"..GetName(M_ID))	
				end
				tell(TargetID(),OwnerID(),"==============")	
--				tell(TargetID(),OwnerID(),"M_ID"..M_ID )	
				-- exp to 0
				WriteRoleValue(OwnerID() , EM_RoleValue_EXP , 0)
				WriteRoleValue(OwnerID() , EM_RoleValue_HP , ReadRoleValue ( OwnerID() , EM_RoleValue_MaxHP ) )
				WriteRoleValue(OwnerID() , EM_RoleValue_MP , ReadRoleValue ( OwnerID() , EM_RoleValue_MaxMP ) )


				Sleep(19)
			end
			FirstCount = true
			Speak = false
			FightTime = 0
		end
		sleep(1)
	end
end


function moliyo_test_M()
	local FirstCount = true
	local Speak = false
	local FightTime = 0

	local P_MaxHP = 0
	local P_HP = 0
	local P_MaxMP = 0
	local P_MP = 0
	local M_MaxHP = 0
	local M_HP = 0

	local AttackTarget = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID )

	local TalkGroup = MonsterTalkFormat( GetString("ST_FIGHT_TEST") )

	while true do

		local IsDead = ReadRoleValue ( AttackTarget , EM_RoleValue_IsDead )

		if FirstCount  then
			FirstCount = false
			P_MaxHP = ReadRoleValue ( AttackTarget , EM_RoleValue_HP )
			P_MaxMP = ReadRoleValue ( AttackTarget , EM_RoleValue_MP )
			M_MaxHP = ReadRoleValue ( OwnerID() , EM_RoleValue_HP )
			AttackTarget = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID )
		end

		if IsDead == 1 then

			Speak = true
			P_HP = ReadRoleValue ( AttackTarget , EM_RoleValue_HP )
			P_MP = ReadRoleValue ( AttackTarget , EM_RoleValue_MP )
			M_HP = ReadRoleValue ( OwnerID() , EM_RoleValue_HP )
		end
		FightTime = FightTime + 1
		if Speak then
			--talk
			tell(TargetID(),OwnerID(),TalkGroup[2]..FightTime/10 )
			tell(TargetID(),OwnerID(),TalkGroup[4]..P_MaxHP-P_HP)
			tell(TargetID(),OwnerID(),TalkGroup[5]..M_MaxHP-M_HP)
			tell(TargetID(),OwnerID(),TalkGroup[6]..P_MaxMP-P_MP)				

			break
		end

		sleep(1)
	end
end