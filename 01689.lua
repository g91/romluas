Function LuaI_206621(Option)
	local PlayerID = OwnerID()
	local PackageID = 206621
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201523 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		GiveBodyItem( PlayerID , 201619 , 1 )
	end

end

Function LuaI_206622(Option)
	local PlayerID = OwnerID()
	local PackageID = 206622
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203335 , 1 )
		GiveBodyItem( PlayerID , 201141 , 1 )
		
	end

end


--日本20100113Patch用禮包

function LuaI_206349( Option ) --綁定贖罪包
	local PlayerID = OwnerID()
	local PackageID = 206349		--綁定贖罪包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 2 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 202520 , 1 )	 
		GiveBodyItem( PlayerID , 203525 , 1 )	 
	end
end

function LuaI_206350( Option ) --年賀卡稱號包
	local PlayerID = OwnerID()
	local PackageID = 206350		--年賀卡稱號包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 530394 , 1 )	 --稱號
	end
end
--------------------------------------------------------------------------------------------
--2013 10日本週年慶活動稱號需求( BY 狗狗 )
function LuaI_209976( Option )	--週年慶感謝禮包
	local PlayerID = OwnerID()
	local PackageID = 209976	--年賀卡稱號包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 530069 , 1 )	 --稱號
	end
end

-----------------------------------------------------------------------------------------------
--2014.09.02 日本禮包需求，只做6.1.1和5.0.6兩個版本(奈)
Function LuaI_205024(Option)
	local Owner = OwnerID()
	local PackageID = 205024
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )
	local Sex = ReadRoleValue(Owner , EM_RoleValue_SEX)
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( Owner, PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if Sex == 0 then     
			GiveBodyItem(Owner, 226094 , 1 )
			GiveBodyItem(Owner, 226097 , 1 )
			GiveBodyItem(Owner, 226098 , 1 )
			GiveBodyItem(Owner, 226099 , 1 )
		else                 
			GiveBodyItem(Owner, 224336 , 1 )
			GiveBodyItem(Owner, 224339 , 1 )
			GiveBodyItem(Owner, 224340 , 1 )
			GiveBodyItem(Owner, 223449 , 1 )
		end
	end
end