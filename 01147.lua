--OB¹¥³À®yÃM¥]()
Function LuaI_203583(Option)
	local PlayerID = OwnerID()
	local PackageID = 203583
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		local tempA= rand (10)
				if tempA==0 then 
					GiveBodyItem( PlayerID , 203553 , 1 ) 
				elseif tempA<=3 then 
					GiveBodyItem( PlayerID , 203555 , 1 ) 
				elseif tempA<=9 then 
					GiveBodyItem( PlayerID , 203554 , 1 ) 
				end


		end	

end
