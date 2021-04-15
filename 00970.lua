function LuaI_AnneBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 203142		--萬聖節驚喜禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	724049,		-- 普通寵物7天
			724050,		-- 普通寵物30天
			724051,		-- 稀有寵物7天
			724052	}	-- 稀有寵物30天

	local probability = {	60,		-- 
			20,  	       	-- 
			19,             	-- 
			1	}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and KEY > 0 then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )

				
		elseif RAND > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
				
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
				
		else
			GiveBodyItem( PlayerID , Item[4] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
							
		end
	end
end