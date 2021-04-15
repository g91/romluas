--2011.03.02 禮包需求

--30天的白色戰馬坐騎禮包() 可交易
Function LuaI_209491(Option)
	local PlayerID = OwnerID()
	local PackageID = 209491
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,202453, 1 )	
	end
end


----------------------赤焰戰虎------------------------
Function LuaI_209492(Option)  --1天赤焰戰虎
	local PlayerID = OwnerID()
	local PackageID = 209492
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,209499, 1 )	
	end
end


Function LuaI_209493(Option)  --7天赤焰戰虎
	local PlayerID = OwnerID()
	local PackageID = 209493
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,202458, 1 )	
	end
end


Function LuaI_209494(Option)  --30天赤焰戰虎
	local PlayerID = OwnerID()
	local PackageID = 209494
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,202461, 1 )	
	end
end


----------------------紫雷戰虎------------------------
Function LuaI_209495(Option)  --1天紫雷戰虎
	local PlayerID = OwnerID()
	local PackageID = 209495
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,209498, 1 )	
	end
end


Function LuaI_209496(Option)  --7天紫雷戰虎
	local PlayerID = OwnerID()
	local PackageID = 209496
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,202459, 1 )	
	end
end


Function LuaI_209497(Option)  --30天紫雷戰虎
	local PlayerID = OwnerID()
	local PackageID = 209497
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID ,202462, 1 )	
	end
end