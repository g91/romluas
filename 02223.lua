--2011.03.02 §�]�ݨD

--30�Ѫ��զ�԰����M§�]() �i���
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


----------------------���K�Ԫ�------------------------
Function LuaI_209492(Option)  --1�Ѩ��K�Ԫ�
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


Function LuaI_209493(Option)  --7�Ѩ��K�Ԫ�
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


Function LuaI_209494(Option)  --30�Ѩ��K�Ԫ�
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


----------------------���p�Ԫ�------------------------
Function LuaI_209495(Option)  --1�ѵ��p�Ԫ�
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


Function LuaI_209496(Option)  --7�ѵ��p�Ԫ�
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


Function LuaI_209497(Option)  --30�ѵ��p�Ԫ�
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