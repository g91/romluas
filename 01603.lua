-----------------------------------------------------------------------------------------------
Function LuaI_206300(Option) --30�ѻ��R����999���M�]
	local PlayerID = OwnerID()
	local PackageID = 206300
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206279, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206295(Option) --30�ѷo�J3000���M�]
	local PlayerID = OwnerID()
	local PackageID = 206295
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206291, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206302(Option) --30����v���I���M�]
	local PlayerID = OwnerID()
	local PackageID = 206302
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206286, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206293(Option) --30�ѳ��I���M�]
	local PlayerID = OwnerID()
	local PackageID = 206293
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206277, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206297(Option) --30�Ѷ¤Ѱ����M�]
	local PlayerID = OwnerID()
	local PackageID = 206297
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206287, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206304(Option) --30�ѤѰ����M�]
	local PlayerID = OwnerID()
	local PackageID = 206304
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206281, 1 )	
			end

end