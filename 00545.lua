function LuaI_FollowBossMonster()
	BossID = 100374	-- ���F
	MonsterID = 100052	-- �����]��

	local Monster = LuaFunc_CreateObjByObj ( MonsterID , OwnerID() )
	SetFollow( Monster , OwnerID() )
end

function AI_Follow()

	local BossID = 100052	-- ���H
	local Range = 1000

	local MFB = MonsterFollowBoss( BossID , Range )

end

function MonsterFollowBoss( BossID , Range )

	local CheckTime = 10	-- �@���ˬd�@��

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  --�ˬd�O�_���}�԰�
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
							break	-- ��p������N���X
						end
					end
				break		-- ���H�p������N���X
				else
					--Say(OwnerID() , "Not Boss, Not Follow!" )
				end
			end
		end
	Sleep( CheckTime )
	end

end
