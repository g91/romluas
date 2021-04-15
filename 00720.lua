function ComboServer_Bag_LV1( Option )

	local PlayerID = OwnerID()
	local PackageID = 202436		-- 心動寵物包
	local NeedSpace = 8
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 201095	-- 祝福武器石
	local Item2 = 201097	-- 祝福裝備石
	local Item3 = 201969	-- 蕈人召喚書
	local Item4 = 201700	-- 一天白馬坐騎
	local Item5 = 221576	-- 初級生命護符
	local Item6 = 201103	-- 座標記憶碎片

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 5 )
		GiveBodyItem( PlayerID , Item2 , 5 )
		GiveBodyItem( PlayerID , Item3 , 1 )
		GiveBodyItem( PlayerID , Item4 , 1 )
		GiveBodyItem( PlayerID , Item5 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
		GiveBodyItem( PlayerID , Item6 , 1 )
	end

end
