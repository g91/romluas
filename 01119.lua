function LuaI_HappyXmasBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 202918		--Åw¼Ö·x¥VÂ§¥]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720300 , 1 )	

	end
end