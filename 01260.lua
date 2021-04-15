
function Lua_RabbitHealing(Option )
	local PlayerID = OwnerID()
	local PackageID = 204092		--必爾汀系列藥水包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 724266 , 1 )	

	end
end


