--ÃM­¼Â§¥]()--ÃM­¼¥]-´Ä°¨
Function LuaI_203319(Option)
	local PlayerID = OwnerID()
	local PackageID = 203319
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 202246 , 1 )	
			end

end

Function LuaI_204150(Option)	--«C¥Ò©Þ©¿¥®¸V§¤ÃM
	local PlayerID = OwnerID()
	local PackageID = 204150
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 204142 , 1 )	
			end

end

Function LuaI_204151(Option)	--¨ª¥Ò©Þ©¿¥®¸V§¤ÃM
	local PlayerID = OwnerID()
	local PackageID = 204151
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 204143, 1 )	
			end

end

--ÃM­¼Â§¥]() --7¤Ñ³·®ü¥®Ã~§¤ÃM¥]
Function LuaI_204072(Option)
	local PlayerID = OwnerID()
	local PackageID = 204072
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 204083 , 1 )	
			end

end

--ÃM­¼Â§¥]() --3¤Ñ´Ä¦âÂ@°¨§¤ÃM¥]
Function LuaI_206325(Option)
	local PlayerID = OwnerID()
	local PackageID = 206325
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206326 , 1 )	
			end

end