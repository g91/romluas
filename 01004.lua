--�M��§�]() --�M���]-�İ�
Function LuaI_203296(Option)
	local PlayerID = OwnerID()
	local PackageID = 203296
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 201698 , 1 )	
			end

end

--�M��§�]() --�C�ҩީ����V���M�]
Function LuaI_204148(Option)
	local PlayerID = OwnerID()
	local PackageID = 204148
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 204144 , 1 )	
			end

end

--�M��§�]() --���ҩީ����V���M�]
Function LuaI_204149(Option)
	local PlayerID = OwnerID()
	local PackageID = 204149
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 204145 , 1 )	
			end

end



--�M��§�]() --30�ѳ������~���M�]
Function LuaI_202821(Option)
	local PlayerID = OwnerID()
	local PackageID = 202821
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 204084 , 1 )	
			end

end














