Function LuaI_204004(Option)
	local PlayerID = OwnerID()
	local PackageID = 204004
	local NeedSpace = 11
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203216 , 1 )
		GiveBodyItem( PlayerID , 203325 , 1 )
		GiveBodyItem( PlayerID , 201134 , 1 )
		GiveBodyItem( PlayerID , 201610 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		GiveBodyItem( PlayerID , 201095 , 1 )
		GiveBodyItem( PlayerID , 201097 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 202506 , 1 )
	end

end