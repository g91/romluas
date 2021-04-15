function Lua_PhiriusPotion(Option )
	local PlayerID = OwnerID()
	local PackageID = 205685		--必爾汀系列藥水包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203489 , 1 )
		GiveBodyItem( PlayerID , 203490 , 1 )
		GiveBodyItem( PlayerID , 203491 , 1 )	
		GiveBodyItem( PlayerID , 203492 , 1 )			
		GiveBodyItem( PlayerID , 203493 , 1 )	
		GiveBodyItem( PlayerID , 203494 , 1 )
		GiveBodyItem( PlayerID , 203495 , 1 )	
		GiveBodyItem( PlayerID , 203496 , 1 )	
		GiveBodyItem( PlayerID , 203497 , 1 )
		GiveBodyItem( PlayerID , 203498 , 1 )
		GiveBodyItem( PlayerID , 203499 , 1 )
		GiveBodyItem( PlayerID , 203500 , 1 )
		GiveBodyItem( PlayerID , 203501 , 1 )
		GiveBodyItem( PlayerID , 203502 , 1 )
		GiveBodyItem( PlayerID , 203503 , 1 )
	end
end


Function Lua_Hao_Gobolinclear()
	
	TempObj = { 102057,102058,102059,102060 ,102077,102078,102079,102080,102088,102089,102090,102091,102098,102099,102100,102101,102062,102081,102061,102102,102051,102052,102053,102054,102055,102056,102071,102072,102073,102074,102075,102076,102082,102083,102084,102085,102086,102087,102092,102093,102094,102095,102096,102097 }
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --取得所在room
	local T1Obj
	local T1Count = SetSearchRangeInfo( OwnerID() , 5000 )
	for i = 1 , T1Count , 1 do
		local T1ID = GetSearchResult()
		T1Obj = Role:New( T1ID )	
		if T1Obj:RoomID() == RoomID and T1ID ~= OwnerID() then
			local FlagOrgID = T1Obj:OrgID()
			for i = 1 , table.getn(TempObj) do
				if (FlagOrgID == TempObj[i]) then
					DelObj(T1ID)
				end
			end
		end
	end
end

--哥不林寵物箱 7天
function LuaI_Goblinegg_7days( Option )
	local PlayerID = OwnerID()
	local PackageID = 205081		
	local Item = 205080                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

function LuaI_Goblinegg_30days( Option )
	local PlayerID = OwnerID()
	local PackageID = 205686		
	local Item = 205079                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end