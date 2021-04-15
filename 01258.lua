function Lua_SevendayRabbitpet(Option )
	local PlayerID = OwnerID()
	local PackageID = 204110		--7¤Ñ©Ô¤ñÃdª«¨ß½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 724264 , 1 )	

	end
end
