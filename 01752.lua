--白色情人節相關禮盒

function LuaI_206920( Option ) --情人卡片禮盒
	local PlayerID = OwnerID()
	local PackageID = 206920		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725129 , 1 )	
	end
end

function LuaI_206924( Option ) --情人節糖果袋
	local PlayerID = OwnerID()
	local PackageID = 206924		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725130 , 1 )	
	end
end

function LuaI_206927( Option ) --情人服裝禮盒
	local PlayerID = OwnerID()
	local PackageID = 206927		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 725131 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 725132 , 1 )	 --跑女生的
		end
	end
end

function LuaI_206928( Option ) --情人配件禮盒
	local PlayerID = OwnerID()
	local PackageID = 206928		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725133 , 1 )	
	end
end

-- 白色情人節活動重置券
function LuaI_206929( Option ) --白色情人節活動重置券
	local PlayerID = OwnerID()
	local PackageID = 206929		--白色情人節活動重置券
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if CheckFlag(PlayerID, 543608) == false then --無keyitem
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WHITEDAY_TICKET1]" , C_SYSTEM )	--你現在不需要重置此活動。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WHITEDAY_TICKET1]"  , C_SYSTEM )
			return false
		elseif CheckFlag(PlayerID, 543608) == true then --有keyitem
			return true
		end

	elseif ( Option == "USE" ) then		
		SetFlag(PlayerID, 543608, 0) 
		SetFlag(PlayerID, 543609, 0) 
		SetFlag(PlayerID, 543633, 0) 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WHITEDAY_TICKET2]" , C_SYSTEM )	--你現在可以重新進行這個活動了！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WHITEDAY_TICKET2]"  , C_SYSTEM )
	end
end