function FastShadowHPBomb()	-- 疾影生命爆彈
	local MagicID = 491198
	local BOMB = "NO"

	local CheckTime = 10	-- 一秒檢查一次

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

function FastShadowMPBomb()	-- 疾影魔力爆彈
	local MagicID = 491199
	local BOMB = "NO"

	local CheckTime = 10	-- 一秒檢查一次

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
	if (PartyPerson == 0 ) then	-- 沒隊伍
		return Player
	else
		local RND =  Rand( PartyPerson ) + 1	-- 產生 1~隊伍人數 的亂數
		return GetPartyID( Player , RND )
	end
end
