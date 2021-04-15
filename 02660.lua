function Lua_2012spring_pet7(Option )	--241222  7¤Ñ¬K«BÃdª«½c
	local PlayerID = OwnerID()
	local PackageID = 241222
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725760 , 1 )	

	end
end



function Lua_2012spring_pet30(Option )	--241223  30¤Ñ¬K«BÃdª«½c
	local PlayerID = OwnerID()
	local PackageID = 241223	
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725954 , 1 )	

	end
end



function Lua_2012spring_pet4ever(Option) -- 241224 ¥Ã¤[¬K«BÃdª«½c
	local PlayerID = OwnerID()
	local PackageID = 241224
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725955 , 1 )	

	end
end