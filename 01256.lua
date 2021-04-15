function Lua_Springraingift (Option )
	local PlayerID = OwnerID()
	local PackageID = 204094		--¹Å´µ¥ÅÂ§²°
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Random = rand(100)+1

	if ( Option == "CHECK" ) then
		

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1  )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 724262, 1 )	
		if Random > 80 then
			GiveBodyItem( PlayerID , 725449 , 1 )
		end
	end
end