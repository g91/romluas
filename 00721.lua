function PK_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 202437		-- 最後精裝禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721220	-- 最後掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV2( Option )

	local PlayerID = OwnerID()
	local PackageID = 202438		-- 追隨者精裝禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721854	-- 追隨者掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV3( Option )

	local PlayerID = OwnerID()
	local PackageID = 202439		-- 信差精裝禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721855	-- 信差掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV4( Option )

	local PlayerID = OwnerID()
	local PackageID = 202440		-- 凡瑞娜絲精裝禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721857	-- 凡瑞娜絲掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV5( Option )

	local PlayerID = OwnerID()
	local PackageID = 202441		-- 賢者之眼精裝禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721858	-- 賢者之眼掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV6( Option )

	local PlayerID = OwnerID()
	local PackageID = 202442		-- 風野精裝禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721859	-- 風野掉落表

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PK_Bag_LV7( Option )

	local PlayerID = OwnerID()
	local PackageID = 202443		-- 凡瑞娜絲套裝禮包
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721951	-- 凡瑞娜絲掉落表
	local Item2 = 721952
	local Item3 = 721953
	local Item4 = 721954
	local Item5 = 721955
	local Item6 = 721956
	local Item7 = 721957

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , Item2 , 1 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item7 , 1 )
	end

end

function PK_Bag_LV8( Option )

	local PlayerID = OwnerID()
	local PackageID = 202444		-- 賢者之眼套裝禮包
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721958	-- 賢者之眼掉落表
	local Item2 = 721959
	local Item3 = 721960
	local Item4 = 721961
	local Item5 = 721962
	local Item6 = 721963
	local Item7 = 721964

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , Item2 , 1 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item7 , 1 )
	end

end

function PK_Bag_LV9( Option )

	local PlayerID = OwnerID()
	local PackageID = 202445		-- 風野套裝禮包
	local NeedSpace = 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 721865	-- 風野掉落表
	local Item2 = 721866
	local Item3 = 721867
	local Item4 = 721868
	local Item5 = 721869
	local Item6 = 721870
	local Item7 = 721871

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
		GiveBodyItem( PlayerID , Item2 , 1 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item7 , 1 )
	end

end

function PKTitle_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 202446		-- 魔幻精英禮包

	local Item1 = 530071	-- 魔幻精英

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PKTitle_Bag_LV2( Option )

	local PlayerID = OwnerID()
	local PackageID = 202447		-- 王者公會禮包

	local Item1 = 530072	-- 王者公會

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end

function PKTitle_Bag_LV3( Option )

	local PlayerID = OwnerID()
	local PackageID = 202448		-- 競技之王禮包

	local Item1 = 530353	-- 競技之王

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end

end
