function LuaDan_GuildFarmdropitemLv2( Option )
	local PlayerID = OwnerID()
	local PackageID = 204827		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	720470,	-- 
			720472}	-- 

	local probability = {	60,		-- 
				40}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		if RAND > (100 - probability[1]) then

			GiveBodyItem( PlayerID , Item[1] , 1 )	
		else
			GiveBodyItem( PlayerID , Item[2] , 1 )
		end		
	end
end

function LuaDan_GuildFarmdropitemLv3( Option )
	local PlayerID = OwnerID()
	local PackageID = 204828		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	720470,	-- 
			720472,
			720473}	-- 

	local probability = {	50,		-- 
				40,
				10}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end

	elseif ( Option == "USE" ) then

		if RAND > (100 - probability[1]) then

			GiveBodyItem( PlayerID , Item[1] , 1 )
	
		elseif RAND > (100 - probability[1] - probability[2] ) then

			GiveBodyItem( PlayerID , Item[2] , 1 )	
		else 
			GiveBodyItem( PlayerID , Item[3] , 1 )	
		end
	end
end

function LuaDan_GuildFactorydropitemLv2( Option )
	local PlayerID = OwnerID()
	local PackageID = 204829		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	720471,	-- 
			720474}	-- 

	local probability = {	60,		-- 
				40}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		if RAND > (100 - probability[1]) then

			GiveBodyItem( PlayerID , Item[1] , 1 )	
		else
			GiveBodyItem( PlayerID , Item[2] , 1 )
		end		
	end
end

function LuaDan_GuildFactorydropitemLv3( Option )
	local PlayerID = OwnerID()
	local PackageID = 204830		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	720471,	-- 
			720474,
			720475}	-- 

	local probability = {	50,		-- 
				40,
				10}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end

	elseif ( Option == "USE" ) then

		if RAND > (100 - probability[1]) then

			GiveBodyItem( PlayerID , Item[1] , 1 )
	
		elseif RAND > (100 - probability[1] - probability[2] ) then

			GiveBodyItem( PlayerID , Item[2] , 1 )	
		else 
			GiveBodyItem( PlayerID , Item[3] , 1 )	
		end
	end
end