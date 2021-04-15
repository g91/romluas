function LuaI_ROM_NEWPLAYERBOX01( Option )
	local PlayerID = OwnerID()
	local PackageID = 204796		--¥¬¦ç1
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 221448 , 1 )	
		GiveBodyItem( PlayerID , 221528 , 1 )	
		GiveBodyItem( PlayerID , 222013 , 1 )	
		GiveBodyItem( PlayerID , 221576 , 1 )	
		GiveBodyItem( PlayerID , 221577 , 1 )	

	end
end

function LuaI_ROM_NEWPLAYERBOX02( Option )
	local PlayerID = OwnerID()
	local PackageID = 204797		--¥Ö¥Ò1
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 221449 , 1 )	
		GiveBodyItem( PlayerID , 221529 , 1 )	
		GiveBodyItem( PlayerID , 222014 , 1 )	
		GiveBodyItem( PlayerID , 221576 , 1 )	
		GiveBodyItem( PlayerID , 221577 , 1 )	

	end
end

function LuaI_ROM_NEWPLAYERBOX03( Option )
	local PlayerID = OwnerID()
	local PackageID = 204798		--Âê¥Ò1
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 221450 , 1 )	
		GiveBodyItem( PlayerID , 221530 , 1 )	
		GiveBodyItem( PlayerID , 222015 , 1 )	
		GiveBodyItem( PlayerID , 221576 , 1 )	
		GiveBodyItem( PlayerID , 221577 , 1 )	

	end
end

function LuaI_ROM_NEWPLAYERBOX04( Option )
	local PlayerID = OwnerID()
	local PackageID = 204799		--¥¬¦ç2
	local NeedSpace = 6
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 221454 , 1 )	
		GiveBodyItem( PlayerID , 221457 , 1 )	
		GiveBodyItem( PlayerID , 221460 , 1 )	
		GiveBodyItem( PlayerID , 221463 , 1 )	
		GiveBodyItem( PlayerID , 221576 , 1 )	
		GiveBodyItem( PlayerID , 221577 , 1 )	

	end
end

function LuaI_ROM_NEWPLAYERBOX05( Option )
	local PlayerID = OwnerID()
	local PackageID = 204800                       	--»´¥Ò2
	local NeedSpace = 6
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 221455 , 1 )	
		GiveBodyItem( PlayerID , 221458 , 1 )	
		GiveBodyItem( PlayerID , 221461 , 1 )	
		GiveBodyItem( PlayerID , 221464 , 1 )	
		GiveBodyItem( PlayerID , 221576 , 1 )	
		GiveBodyItem( PlayerID , 221577 , 1 )	

	end
end

function LuaI_ROM_NEWPLAYERBOX06( Option )
	local PlayerID = OwnerID()
	local PackageID = 204801                       	--Âê¥Ò2
	local NeedSpace = 6
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 221456 , 1 )	
		GiveBodyItem( PlayerID , 221459 , 1 )	
		GiveBodyItem( PlayerID , 221462 , 1 )	
		GiveBodyItem( PlayerID , 221465 , 1 )	
		GiveBodyItem( PlayerID , 221576 , 1 )	
		GiveBodyItem( PlayerID , 221577 , 1 )	

	end
end