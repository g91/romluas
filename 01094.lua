function LuaI_XmasGife1( Option )
	local PlayerID = OwnerID()
	local PackageID = 203516		-- �x�V§����
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- �x�V����}
			203521,		-- �x�V���߿}
			203522,		-- �x�V���J�O
			203523,		-- �x�V���ųn�}
			203524	}	-- �x�V�δο}
	local probability = {	10,		-- �x�V����}���v
			30,             	-- �x�V���߿}���v
			10,             	-- �x�V���J�O���v
			30,             	-- �x�V���ųn�}���v
			20	}       	-- �x�V�δο}���v
	local RANDOWN = rand(100)

	if ( Option == "CHECK" ) then
		--Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--Say(PlayerID,"RANDOWN is "..RANDOWN)
		if RANDOWN > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , rand(3)+1 )					
		else
			GiveBodyItem( PlayerID , Item[5] , rand(3)+1 )					
		end
	end
end

function LuaI_XmasGife2( Option )
	local PlayerID = OwnerID()
	local PackageID = 203516		-- �x�V§����
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- �x�V����}
			203521,		-- �x�V���߿}
			203522,		-- �x�V���J�O
			203523,		-- �x�V���ųn�}
			203524	}	-- �x�V�δο}
	local probability = {	10,		-- �x�V����}���v
			30,             	-- �x�V���߿}���v
			30,             	-- �x�V���J�O���v
			10,             	-- �x�V���ųn�}���v
			20	}       	-- �x�V�δο}���v
	local RANDOWN = rand(100)

	if ( Option == "CHECK" ) then
		--Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--Say(PlayerID,"RANDOWN is "..RANDOWN)
		if RANDOWN > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , rand(3)+1 )					
		else
			GiveBodyItem( PlayerID , Item[5] , rand(3)+1 )					
		end
	end
end
function LuaI_XmasGife3( Option )
	local PlayerID = OwnerID()
	local PackageID = 203516		-- �x�V§����
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- �x�V����}
			203521,		-- �x�V���߿}
			203522,		-- �x�V���J�O
			203523,		-- �x�V���ųn�}
			203524	}	-- �x�V�δο}
	local probability = {	30,		-- �x�V����}���v
			10,             	-- �x�V���߿}���v
			10,             	-- �x�V���J�O���v
			30,             	-- �x�V���ųn�}���v
			20	}       	-- �x�V�δο}���v
	local RANDOWN = rand(100)

	if ( Option == "CHECK" ) then
		--Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--Say(PlayerID,"RANDOWN is "..RANDOWN)
		if RANDOWN > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , rand(3)+1 )					
		else
			GiveBodyItem( PlayerID , Item[5] , rand(3)+1 )					
		end
	end
end
function LuaI_XmasGife4( Option )
	local PlayerID = OwnerID()
	local PackageID = 203516		-- �x�V§����
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- �x�V����}
			203521,		-- �x�V���߿}
			203522,		-- �x�V���J�O
			203523,		-- �x�V���ųn�}
			203524	}	-- �x�V�δο}
	local probability = {	30,		-- �x�V����}���v
			10,             	-- �x�V���߿}���v
			30,             	-- �x�V���J�O���v
			10,             	-- �x�V���ųn�}���v
			20	}       	-- �x�V�δο}���v
	local RANDOWN = rand(100)

	if ( Option == "CHECK" ) then
		--Say(PlayerID,"PlayerID is "..PlayerID)
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--Say(PlayerID,"RANDOWN is "..RANDOWN)
		if RANDOWN > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , rand(3)+1 )					
		elseif RANDOWN > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
			GiveBodyItem( PlayerID , Item[4] , rand(3)+1 )					
		else
			GiveBodyItem( PlayerID , Item[5] , rand(3)+1 )					
		end
	end
end