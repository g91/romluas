

function Lua_thirtydayRabbitpet(Option )
	local PlayerID = OwnerID()
	local PackageID = 204112		--30¤Ñ©Ô¤ñÃdª«¨ß½c
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 724265 , 1 )	

	end
end

