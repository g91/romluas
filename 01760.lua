function Germany_1year_FrogPet()
	if CheckFlag( OwnerID()  , 543640 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_GERMANY_1YEAR_05]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_GERMANY_1YEAR_05]", C_SYSTEM )
		return false
	else
		SetFlag( OwnerID()  , 543640 , 1 )
		return true
	end
end

Function LuaI_207010(Option)
	local PlayerID = OwnerID()
	local PackageID = 207010
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
				GiveBodyItem( PlayerID , 725137, 1 )	
			end

end

Function LuaI_206251() --Housing-Survivor-Box

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 206130,1 , 201292 , 1 , 201381 , 1 , 201410 , 1 , 202435 , 5  } 
		        } 

	return BaseTressureProc(   itemset , 5  )
end


-----------波卡寵物----------------------

function luaI_204826check()  --波卡寵物一
	if CheckFlag( OwnerID()  , 543796 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PETSP_TODAY]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PETSP_TODAY]", C_SYSTEM )
		return false
	else
		SetFlag( OwnerID()  , 543796 , 1 )
		return true
	end
end

function luaI_205683check() --波卡寵物二
	if CheckFlag( OwnerID()  , 543797 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PETSP_TODAY]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PETSP_TODAY]", C_SYSTEM )
		return false
	else
		SetFlag( OwnerID()  , 543797 , 1 )
		return true
	end
end

function LuaI_207087( Option ) --波卡寵物箱一
	local PlayerID = OwnerID()
	local PackageID = 207087	
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 204826 , 1 ) --波卡寵物一
	end
end

function LuaI_207088( Option ) --波卡寵物箱二
	local PlayerID = OwnerID()
	local PackageID = 207088	
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 205683 , 1 ) --波卡寵物二
	end
end
