--︹竧较搂
Function LuaI_203483(Option)
	local PlayerID = OwnerID()
	local PackageID = 203483
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local randA= rand(20)
			GiveBodyItem( PlayerID ,222868, 1 )		--竧较碪
			if randA<= 9 then
				GiveBodyItem( PlayerID , 203281 , 40 )		--203281 ォ縸	40
			elseif randA<= 19 then
				GiveBodyItem( PlayerID , 203282 , 40 )		--203282 次次縸	40
			
			end
	end

end