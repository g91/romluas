Function LuaI_206480(Option) --神願之蛋
	local PlayerID = OwnerID()
	local PackageID = 206480
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {		15,		-- 
				15,  	       	-- 
				20,
			              	20,
			              	2,
			              	3,
			              	5,
			              	20}       		-- 
	local RAND = rand(100)+1

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then

		GiveBodyItem( PlayerID , 202928 , 4 )
		GiveBodyItem( PlayerID , 206340 , 5 )
		
		elseif RAND > (100 - probability[1] - probability[2]) then

		GiveBodyItem( PlayerID , 203525 , 4 )
		GiveBodyItem( PlayerID , 206340 , 5 )
		
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then

		GiveBodyItem( PlayerID , 202434 , 2 )
		GiveBodyItem( PlayerID , 206340 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then

		GiveBodyItem( PlayerID , 202520 , 1 )
		GiveBodyItem( PlayerID , 206340 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then

		GiveBodyItem( PlayerID , 201928 , 1 )
		GiveBodyItem( PlayerID , 206340 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then

		GiveBodyItem( PlayerID , 201927 , 1 )
		GiveBodyItem( PlayerID , 206340 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then

		GiveBodyItem( PlayerID , 202506 , 10 )
		GiveBodyItem( PlayerID , 206340 , 5 )

		else

		GiveBodyItem( PlayerID , 203054 , 2 )
		GiveBodyItem( PlayerID , 206340 , 5 )


		end
	end

end

Function LuaI_206481(Option) --祝福之蛋
	local PlayerID = OwnerID()
	local PackageID = 206481
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {		15,		-- 
				15,  	       	-- 
				20,
			              	20,
			              	2,
			              	3,
			              	5,
			              	20}       		-- 
	local RAND = rand(100)+1

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then

		GiveBodyItem( PlayerID , 202928 , 4 )
		GiveBodyItem( PlayerID , 206338 , 5 )
		
		elseif RAND > (100 - probability[1] - probability[2]) then

		GiveBodyItem( PlayerID , 203525 , 4 )
		GiveBodyItem( PlayerID , 206338 , 5 )
		
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then

		GiveBodyItem( PlayerID , 202434 , 2 )
		GiveBodyItem( PlayerID , 206338 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then

		GiveBodyItem( PlayerID , 202520 , 1 )
		GiveBodyItem( PlayerID , 206338 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then

		GiveBodyItem( PlayerID , 201928 , 1 )
		GiveBodyItem( PlayerID , 206338 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then

		GiveBodyItem( PlayerID , 201927 , 1 )
		GiveBodyItem( PlayerID , 206338 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then

		GiveBodyItem( PlayerID , 202506 , 10 )
		GiveBodyItem( PlayerID , 206338 , 5 )

		else

		GiveBodyItem( PlayerID , 201088 , 2 )
		GiveBodyItem( PlayerID , 206338 , 5 )


		end
	end

end

Function LuaI_206482(Option) --聖靈之蛋
	local PlayerID = OwnerID()
	local PackageID = 206482
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {		15,		-- 
					15,  	       	-- 
					20,
			              	20,
			              	2,
			              	3,
			              	5,
			              	20}       		-- 
	local RAND = rand(100)+1

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then

		GiveBodyItem( PlayerID , 202928 , 4 )
		GiveBodyItem( PlayerID , 206339 , 5 )
		
		elseif RAND > (100 - probability[1] - probability[2]) then

		GiveBodyItem( PlayerID , 203525 , 4 )
		GiveBodyItem( PlayerID , 206339 , 5 )
		
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then

		GiveBodyItem( PlayerID , 202434 , 2 )
		GiveBodyItem( PlayerID , 206339 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then

		GiveBodyItem( PlayerID , 202520 , 1 )
		GiveBodyItem( PlayerID , 206339 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then

		GiveBodyItem( PlayerID , 201928 , 1 )
		GiveBodyItem( PlayerID , 206339 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then

		GiveBodyItem( PlayerID , 201927 , 1 )
		GiveBodyItem( PlayerID , 206339 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then

		GiveBodyItem( PlayerID , 202506 , 10 )
		GiveBodyItem( PlayerID , 206339 , 5 )

		else

		GiveBodyItem( PlayerID , 201238 , 2 )
		GiveBodyItem( PlayerID , 206339 , 5 )


		end
	end

end

Function LuaI_206751(Option) --完成神聖的諾言
	local PlayerID = OwnerID()
	local PackageID = 206751
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		
		GiveBodyItem( PlayerID , 530128 , 1 ) --完成神聖的諾言
	end
end