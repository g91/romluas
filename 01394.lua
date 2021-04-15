function LuaI_206588( Option )
	local PlayerID = OwnerID()
	local PackageID = 206588
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 530390 , 1 )	 --
		GiveBodyItem( PlayerID , 201445 , 1 )	 --
	end
end

function Lua_deltitle_530390()
	DelBodyItem(OwnerID(), 530390, 1)
	Say(OwnerID(), "deltitle 530390")
end


--日本需求禮包  207065-207070

Function LuaI_207065() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 205525,1 , 201134 , 1 , } 
		        } 

	return BaseTressureProc(   itemset , 2  )
end
---------------------------------------------------------------

Function LuaI_207066() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 205526,1 , 201610 , 1 , } 
		        } 

	return BaseTressureProc(   itemset , 2  )
end
---------------------------------------------------------------

Function LuaI_207067() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 204971, 1 , 201134 , 2 , 201610 , 2 , 203525, 1 } 
		        } 

	return BaseTressureProc(   itemset , 4  )
end
---------------------------------------------------------------

Function LuaI_207068() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 201134 , 2 , 201610 , 2 } 
		        } 

	return BaseTressureProc(   itemset , 2  )
end
---------------------------------------------------------------

Function LuaI_207069() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 201134 , 1 , 201610 , 1 } 
		        } 

	return BaseTressureProc(   itemset , 5  )
end
---------------------------------------------------------------

Function LuaI_207070() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 201445, 3 , 202435 , 1 } 
		        } 

	return BaseTressureProc(   itemset , 2  )
end
---------------------------------------------------------------
Function LuaI_207078() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 201448, 1 , 201449 , 1,  203041 , 1} 
		        } 

	return BaseTressureProc(   itemset , 3  )
end
---------------------------------------------------------------
Function LuaI_207079() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 201450, 1 , 201457 , 1 , 203042 , 1 } 
		        } 

	return BaseTressureProc(   itemset , 3 )
end
---------------------------------------------------------------
Function LuaI_207107() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, { 202506,1 ,202881,1, 202928,1 ,205525,1 ,205526,1 } 
		        } 
	return BaseTressureProc(   itemset , 5 )
end

---------------------------------------------------------------
Function LuaI_207108() 
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 ,""	, {202903,3 ,202435,3 } 
		        } 
	return BaseTressureProc(   itemset , 2 )
end
---------------------------------------------------------------
Function LuaI_207131() --日本Fami包

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 202881,1 ,202881,1 ,202881,1 ,202929,1} }

	return BaseTressureProc(   itemset , 4  )
end
---------------------------------------------------------------
Function LuaI_207132() --日本Fami包

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 222925,1 ,222926,1} }

	return BaseTressureProc(   itemset , 2  )
end
---------------------------------------------------------------
Function LuaI_207133() --日本Fami包

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 202434,1} }

	return BaseTressureProc(   itemset , 1  )
end
---------------------------------------------------------------
Function LuaI_207134() --旅行組合

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 201608,1 ,201617,1 ,205547,1 ,205548,1 ,206294,1} }

	return BaseTressureProc(   itemset , 5  )
end
---------------------------------------------------------------
--20110304
--Lv50+禮包 
Function LuaI_209525() 

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 206987,1 ,206988,1 ,206989,1} }

	return BaseTressureProc(   itemset , 3  )
end
---------------------------------------------------------------
Function LuaI_207142() --裝備進化套組

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 206963,1 ,206964,1 ,206965,1} }

	return BaseTressureProc(   itemset , 3  )
end