Function LuaI_204088(Option)
	--判斷語系
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = "cn"
	--
	local PlayerID = OwnerID()
	local PackageID = 204088
	--
	local NeedSpace
	if Language == Country then
		NeedSpace = 7
	else
		NeedSpace = 4
	end
	--
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if Language == Country then	--CN新需求
			GiveBodyItem( PlayerID , 520083 , 5 )
			GiveBodyItem( PlayerID , 520143 , 5 )
			GiveBodyItem( PlayerID , 520123 , 5 )
			GiveBodyItem( PlayerID , 520043 , 5 )
		else
			GiveBodyItem( PlayerID , 202881 , 1 )	--無瑕
		end
		GiveBodyItem( PlayerID , 202506 , 2 )
		GiveBodyItem( PlayerID , 201088 , 1 )
		GiveBodyItem( PlayerID , 204089 , 1 )

	end

end

Function LuaI_204089(Option)
	local PlayerID = OwnerID()
	local PackageID = 204089
	--判斷語系
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = "cn"
	--
	local NeedSpace
	if Language == Country then
		NeedSpace = 4
	else
		NeedSpace = 5
	end
	--
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if Language ~= Country then	--CN不要給這個
			GiveBodyItem( PlayerID , 202881 , 1 )	--無瑕
		end
		GiveBodyItem( PlayerID , 202506 , 2 )
		GiveBodyItem( PlayerID , 201238 , 1 )
		GiveBodyItem( PlayerID , 202230 , 1 )
		GiveBodyItem( PlayerID , 204090 , 1 )

	end

end

Function LuaI_204090(Option)
	local PlayerID = OwnerID()
	local PackageID = 204090
	--判斷語系
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = "cn"
	--
	local NeedSpace
	if Language == Country then
		NeedSpace = 3
	else
		NeedSpace = 4
	end
	--
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if Language ~= Country then	--CN不要給這個
			GiveBodyItem( PlayerID , 202881 , 1 )	--無瑕
		end
		GiveBodyItem( PlayerID , 202506 , 2 )
		GiveBodyItem( PlayerID , 201088 , 1 )
		GiveBodyItem( PlayerID , 204091 , 1 )

	end

end

Function LuaI_204091(Option)
	local PlayerID = OwnerID()
	local PackageID = 204091
	--判斷語系
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = "cn"
	--
	local NeedSpace
	if Language == Country then
		NeedSpace = 3
	else
		NeedSpace = 4
	end
	--
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	--
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if Language ~= Country then	--CN不要給這個
			GiveBodyItem( PlayerID , 202881 , 1 )	--無瑕
		end
		GiveBodyItem( PlayerID , 202506 , 2 )
		GiveBodyItem( PlayerID , 201238 , 1 )
		GiveBodyItem( PlayerID , 202459 , 1 )

	end

end