function LuaS_202816( Option )	-- �]�ۤj§�]

	local PlayerID = OwnerID()
	local PackageID = 202816		-- �]�ۤj§�]
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 202675	-- 40�ťP��
	local Item2 = 202227	-- 30�ѩީ�

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( Item1 ~= nil  ) then		GiveBodyItem( PlayerID , Item1 , 1 )			end
		if ( Item2 ~= nil  ) then		GiveBodyItem( PlayerID , Item2 , 1 )			end
		AddRoleValue( PlayerID , EM_RoleValue_Money , 500000 )
	end


end

