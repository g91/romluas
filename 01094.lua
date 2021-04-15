function LuaI_XmasGife1( Option )
	local PlayerID = OwnerID()
	local PackageID = 203516		-- 穢搂舶
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- 穢╀縸
			203521,		-- 穢并み縸
			203522,		-- 穢ォ
			203523,		-- 穢蔼硁縸
			203524	}	-- 穢次次縸
	local probability = {	10,		-- 穢╀縸诀瞯
			30,             	-- 穢并み縸诀瞯
			10,             	-- 穢ォ诀瞯
			30,             	-- 穢蔼硁縸诀瞯
			20	}       	-- 穢次次縸诀瞯
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
	local PackageID = 203516		-- 穢搂舶
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- 穢╀縸
			203521,		-- 穢并み縸
			203522,		-- 穢ォ
			203523,		-- 穢蔼硁縸
			203524	}	-- 穢次次縸
	local probability = {	10,		-- 穢╀縸诀瞯
			30,             	-- 穢并み縸诀瞯
			30,             	-- 穢ォ诀瞯
			10,             	-- 穢蔼硁縸诀瞯
			20	}       	-- 穢次次縸诀瞯
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
	local PackageID = 203516		-- 穢搂舶
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- 穢╀縸
			203521,		-- 穢并み縸
			203522,		-- 穢ォ
			203523,		-- 穢蔼硁縸
			203524	}	-- 穢次次縸
	local probability = {	30,		-- 穢╀縸诀瞯
			10,             	-- 穢并み縸诀瞯
			10,             	-- 穢ォ诀瞯
			30,             	-- 穢蔼硁縸诀瞯
			20	}       	-- 穢次次縸诀瞯
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
	local PackageID = 203516		-- 穢搂舶
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--Say(PlayerID,"PlayerID is "..PlayerID)
	local Item = {	203520,		-- 穢╀縸
			203521,		-- 穢并み縸
			203522,		-- 穢ォ
			203523,		-- 穢蔼硁縸
			203524	}	-- 穢次次縸
	local probability = {	30,		-- 穢╀縸诀瞯
			10,             	-- 穢并み縸诀瞯
			30,             	-- 穢ォ诀瞯
			10,             	-- 穢蔼硁縸诀瞯
			20	}       	-- 穢次次縸诀瞯
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