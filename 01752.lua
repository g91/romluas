--�զⱡ�H�`����§��

function LuaI_206920( Option ) --���H�d��§��
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

function LuaI_206924( Option ) --���H�`�}�G�U
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

function LuaI_206927( Option ) --���H�A��§��
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
			GiveBodyItem( PlayerID , 725131 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 725132 , 1 )	 --�]�k�ͪ�
		end
	end
end

function LuaI_206928( Option ) --���H�t��§��
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

-- �զⱡ�H�`���ʭ��m��
function LuaI_206929( Option ) --�զⱡ�H�`���ʭ��m��
	local PlayerID = OwnerID()
	local PackageID = 206929		--�զⱡ�H�`���ʭ��m��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if CheckFlag(PlayerID, 543608) == false then --�Lkeyitem
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WHITEDAY_TICKET1]" , C_SYSTEM )	--�A�{�b���ݭn���m�����ʡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WHITEDAY_TICKET1]"  , C_SYSTEM )
			return false
		elseif CheckFlag(PlayerID, 543608) == true then --��keyitem
			return true
		end

	elseif ( Option == "USE" ) then		
		SetFlag(PlayerID, 543608, 0) 
		SetFlag(PlayerID, 543609, 0) 
		SetFlag(PlayerID, 543633, 0) 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WHITEDAY_TICKET2]" , C_SYSTEM )	--�A�{�b�i�H���s�i��o�Ӭ��ʤF�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WHITEDAY_TICKET2]"  , C_SYSTEM )
	end
end