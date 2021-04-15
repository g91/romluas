function LuaI_208340() --ρ侣才ゅ砋
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 70 , ""	, { 725502 , 1 }
					, 97 , ""	, { 725503 , 1 }
					, 99 , ""	, { 725497 , 1 }
					, 100, ""	, { 725501 , 1 } }
	
	return BaseTressureProc(   itemset , 2  )
end

function LuaI_208341() --いρ侣才ゅ砋
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 70 , ""	, { 725502 , 2 }
					, 93 , ""	, { 725503 , 1 }
					, 98 , ""	, { 725497 , 1 }
					, 100, ""	, { 725501 , 1 } }
	
	return BaseTressureProc(   itemset , 2  )
end

function LuaI_208342() --蔼ρ侣才ゅ砋
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 5000 , ""	, { 725502 , 2 }
					, 9000 , ""	, { 725503 , 2 }
					, 9700 , ""	, { 725497 , 1 }
					, 9999 , ""	, { 725501 , 1 }
					, 10000, ""	, { 725500 , 1 } }
	
	return BaseTressureProc4(   itemset , 2  )
end

function LuaI_208343( Option ) --才ゅ砋
	local PlayerID = OwnerID()
	local PackageID = 208343
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 1  )
	
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
		
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 721948 , 1 ) --倒ぉ才ゅ砋奔腳
	end
end

function LuaI_208344( Option ) --い才ゅ砋
	local PlayerID = OwnerID()
	local PackageID = 208344
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 1  )
	
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
		
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 721949 , 1 ) --倒ぉい才ゅ砋奔腳
	end
end

function LuaI_208345( Option ) --蔼才ゅ砋
	local PlayerID = OwnerID()
	local PackageID = 208345
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 1  )
	
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
		
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 721950 , 1 ) --倒ぉ蔼才ゅ砋奔腳
	end
end