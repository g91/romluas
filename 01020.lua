--�M��§�]()
Function LuaI_203312(Option)
	local PlayerID = OwnerID()
	local PackageID = 203312
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 202484 , 1 )	
			end

end