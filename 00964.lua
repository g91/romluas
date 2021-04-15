function LuaI_Anne( Option )
	local PlayerID = OwnerID()
	local PackageID = 203141		-- 小安妮的小禮物
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	724058,		-- 補給
			203087,		-- 蘑菇人變身藥水
			203086,		-- 哥不林變身藥水
			203079	}	-- 南瓜派

	local probability = {	65,		-- 補給機率
			15,  	       	-- 蘑菇人變身藥水機率
			15,             	-- 哥不林變身藥水機率
			5	}       	-- 南瓜派機率

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
--		Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
--		Say(PlayerID,"RAND is "..RAND)
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , 1 )					
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )					
		else
			GiveBodyItem( PlayerID , Item[4] , 1 )					
		end
	end
end