--²r¸VÅbÀk7¤ÑÃM­¼Â§¥]()
function LuaI_206330(Option)
	local PlayerID = OwnerID()
	local PackageID = 206330
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206327 , 1 )	
			end

end