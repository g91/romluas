function LuaI_XmasBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 203468		--�p����§��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --�j�Ѫ��_��
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and KEY > 0 then
			return true
		else
			ScriptMessage( PlayerID, PlayerID, 0, GetString("SC_TREASURE_NOKEY"), 0 )		--�A�S���j�Ѫ��_��
			return false
		end
	elseif ( Option == "USE" ) then

			GiveBodyItem( PlayerID , 720292 , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )

	end
end