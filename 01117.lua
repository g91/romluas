function LuaI_HPMPBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 203473		--暖冬禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	720293,		-- 節慶特殊水
			720269,		-- 藍水
			720286	}	-- 紅水

	local probability = {	40,		-- 
			30,  	       	-- 
			30	}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	

		elseif RAND > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , 1 )	
				
		else 
			GiveBodyItem( PlayerID , Item[3] , 1 )	
		end
	end
end