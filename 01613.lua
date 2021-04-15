--²r¸VÅbÀk30¤ÑÃM­¼Â§¥]()
function LuaI_206331(Option)
	local PlayerID = OwnerID()
	local PackageID = 206331
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206328 , 1 )	
			end

end