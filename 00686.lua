--公會英雄包
Function LuaI_202098(Option)
	local PlayerID = OwnerID()
	local PackageID = 202098
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 200159 , 10 )
		GiveBodyItem( PlayerID , 200160 , 10 )
		GiveBodyItem( PlayerID , 200161 , 5 )
		GiveBodyItem( PlayerID , 202099 , 1 )
		GiveBodyItem( PlayerID , 202151 , 1 )
		GiveBodyItem( PlayerID , 202151, 1 )
		GiveBodyItem( PlayerID , 202151 , 1 )
		GiveBodyItem( PlayerID ,221660, 1 )
	end

end