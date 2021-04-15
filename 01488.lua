function Lua_Goblinkinggift_Lv29Below(Option )
	local PlayerID = OwnerID()
	local PackageID = 205074		--
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	
	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1  )  then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , 720489, 1 )	 --29以下
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Goblinkinggift_Lv39Below(Option )
	local PlayerID = OwnerID()
	local PackageID = 205075		--
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1  )  then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , 720527, 1 )	 --29以下
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Goblinkinggift_Lv49Below(Option )
	local PlayerID = OwnerID()
	local PackageID = 205076		--
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1  )  then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , 720528, 1 )	 --29以下		
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Goblinkinggift_Lv100Below(Option )
	local PlayerID = OwnerID()
	local PackageID = 205077		--
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1  )  then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , 724723, 1 )	 --29以下		
	end
end