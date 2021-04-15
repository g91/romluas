--騎乘禮包()
Function LuaI_206303(Option) --7天天馬坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206303
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206282, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206298(Option) --7天黑天馬坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206298
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206288, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206294(Option) --7天雪貂坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206294
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206276, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206301(Option) --7天闇影雪貂坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206301
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206285, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206296(Option) --7天搗蛋3000坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206296
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206292, 1 )	
			end

end
-----------------------------------------------------------------------------------------------
Function LuaI_206299(Option) --7天輕舞飛揚999坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206299
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 206280, 1 )	
			end

end