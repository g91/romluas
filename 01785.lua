function LuaI_206593(Option)
	local PlayerID = OwnerID()
	local PackageID = 206593
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725149 , 1 ) 
	end
end

-----------------------------------------------------------
function luaI_242522(Option)
	local PlayerID = OwnerID()
	local PackageID = 242522
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local PlayerLV = ReadRoleValue(PlayerID, EM_RoleValue_LV )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if PlayerLV >= 91 then
			GiveBodyItem( PlayerID , 727009 , 1 )
		elseif PlayerLV >= 81 and PlayerLV <= 90 then
			GiveBodyItem( PlayerID , 727007 , 1 )
		elseif PlayerLV >= 71 and PlayerLV <= 80 then
			GiveBodyItem( PlayerID , 727045 , 1 )
		elseif PlayerLV >= 61 and PlayerLV <= 70 then
			GiveBodyItem( PlayerID , 727044 , 1 )
		elseif PlayerLV >= 41 and PlayerLV <= 60 then
			GiveBodyItem( PlayerID , 727043 , 1 )
		elseif PlayerLV >= 31 and PlayerLV <= 40 then
			GiveBodyItem( PlayerID , 727042 , 1 )
		elseif PlayerLV <= 30 then
			GiveBodyItem( PlayerID , 727041 , 1 )
		end
	end
end

-- 星屑裝備鍛造包 
function LuaI_242521(Option)
	local PlayerID = OwnerID()
	local PackageID = 242522
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Language = GetServerDataLanguage()           --抓取目前server的語系

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
	--	if Language == "eneu" or Language == "enus" or Language == "fr" or Language == "pl" or Language == "de" or Language ==  "es" or Language ==  "rw" then
		--	say(PlayerID, "DE")
	--		GiveBodyItem( PlayerID , 727001 , 1 )
	--	else
		--	say(PlayerID, "Other")
			GiveBodyItem( PlayerID , 727000 , 1 )
	--	end
	end
end