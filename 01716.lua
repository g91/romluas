--�w�R�`

--§��
function LuaI_206840( Option ) --�R�|�M���ܨ��Ĥ�§��
	local PlayerID = OwnerID()
	local PackageID = 206840		
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
			GiveBodyItem( PlayerID , 725108 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 725109 , 1 )	 --�]�k�ͪ�
		end
	end
end

function LuaI_206841( Option ) --�w�R����§��
	local PlayerID = OwnerID()
	local PackageID = 206841		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 725110 , 1 )	
	end
end