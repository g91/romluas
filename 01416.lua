Function LuaI_204810(Option)
	local PlayerID = OwnerID()
	local PackageID = 204810
	local NeedSpace = 14
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 221789 , 1 )
		GiveBodyItem( PlayerID , 221790 , 1 )
		GiveBodyItem( PlayerID , 221791 , 1 )
		GiveBodyItem( PlayerID , 221792 , 1 )
		GiveBodyItem( PlayerID , 221793 , 1 )
		GiveBodyItem( PlayerID , 221794 , 1 )
		GiveBodyItem( PlayerID , 221795 , 1 )
		GiveBodyItem( PlayerID , 204073 , 7 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		GiveBodyItem( PlayerID , 201381 , 1 )
	end

end
Function LuaI_204811(Option)
	local PlayerID = OwnerID()
	local PackageID = 204811
	local NeedSpace = 11
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 222737 , 1 )
		GiveBodyItem( PlayerID , 222738 , 1 )
		GiveBodyItem( PlayerID , 222739 , 1 )
		GiveBodyItem( PlayerID , 222740 , 1 )
		GiveBodyItem( PlayerID , 222741 , 1 )

		GiveBodyItem( PlayerID , 204073 , 5 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		GiveBodyItem( PlayerID , 201381 , 1 )
	end

end
Function LuaI_204812(Option)
	local PlayerID = OwnerID()
	local PackageID = 204812
	local NeedSpace = 11
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 221892 , 1 )
		GiveBodyItem( PlayerID , 221893 , 1 )
		GiveBodyItem( PlayerID , 221894 , 1 )
		GiveBodyItem( PlayerID , 221895 , 1 )
		GiveBodyItem( PlayerID , 221896 , 1 )

		GiveBodyItem( PlayerID , 204073 , 5 )
		GiveBodyItem( PlayerID , 202506 , 1 )
		GiveBodyItem( PlayerID , 201237 , 1 )
		GiveBodyItem( PlayerID , 201087 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		GiveBodyItem( PlayerID , 201381 , 1 )
	end

end

Function LuaI_205674(Option)
	local PlayerID = OwnerID()
	local PackageID = 205674
	local NeedSpace = 6
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201338 , 1 ) --Elegant Engraved Chair
		GiveBodyItem( PlayerID , 201418 , 1 ) --Safety Fireplace
		GiveBodyItem( PlayerID , 201317 , 1 ) --Bear Head Trophy
		GiveBodyItem( PlayerID , 201363 , 1 ) --Square Red Carpet
		GiveBodyItem( PlayerID , 201134 , 1 ) --1x Experience Potion
		GiveBodyItem( PlayerID , 201610 , 1 ) --1x Skill Potion 
	end

end

Function LuaI_205726(Option)
	local PlayerID = OwnerID()
	local PackageID = 205726
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202506 , 1 ) --Golden Repair Hammer
		GiveBodyItem( PlayerID , 201134 , 2 ) --Experience Potion
		GiveBodyItem( PlayerID , 201610 , 2 ) --Skill Potion
		GiveBodyItem( PlayerID , 205547 , 1 ) --(7days)
		GiveBodyItem( PlayerID , 201476 , 1 ) --Elegant Wooden Cabinet
		
	end

end

function LuaI_206630(Option)
	local PlayerID = OwnerID()
	local PackageID = 206630
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202095 , 1 ) --7天白色駿馬坐騎
		GiveBodyItem( PlayerID , 203591 , 1 ) --7天小型駕馭藥劑
		GiveBodyItem( PlayerID , 205547 , 1 ) --7天背包空間卷 - III
	end
end