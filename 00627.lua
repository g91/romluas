function FastShadowHPBomb()	-- �e�v�ͩR�z�u
	local MagicID = 491198
	local BOMB = "NO"

	local CheckTime = 10	-- �@���ˬd�@��

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if ( BOMB == "NO" ) then
			if CastSpell( OwnerID() , AttackTarget , MagicID ) then
				BOMB = "YES"
				Say( OwnerID() , GetString("MT_FS_BOMB2") )
				WriteRoleValue ( OwnerID() , EM_RoleValue_HP , 10 )
			end
		end

	Sleep( CheckTime )
	end
end

function FastShadowMPBomb()	-- �e�v�]�O�z�u
	local MagicID = 491199
	local BOMB = "NO"

	local CheckTime = 10	-- �@���ˬd�@��

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if ( BOMB == "NO" ) then
			if CastSpell( OwnerID() , AttackTarget , MagicID ) then
				BOMB = "YES"
				Say( OwnerID() , GetString("MT_FS_BOMB2") )
				WriteRoleValue ( OwnerID() , EM_RoleValue_HP , 10 )
			end
		end

	Sleep( CheckTime )
	end
end


function PartyRoulette( Player )
	local PartyPerson = GetPartyID( Player , -1 )
	if (PartyPerson == 0 ) then	-- �S����
		return Player
	else
		local RND =  Rand( PartyPerson ) + 1	-- ���� 1~����H�� ���ü�
		return GetPartyID( Player , RND )
	end
end
