function LuaI_205942( Option )
	local PlayerID = OwnerID()
	local PackageID = 205942		-- §�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724748 	-- ������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end
end
-----------------------------------------------------
function LuaI_205940( Option ) --��o�s�~�a��§��
	local PlayerID = OwnerID()
	local PackageID = 205940		-- §�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724749 	-- ������

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end
end
-----------------------------------------------------
function LuaI_205900( Option )  --��s�`�Ÿ�§��
	local PlayerID = OwnerID()
	local PackageID = 205900	
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
			GiveBodyItem( PlayerID , 724875 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724878 , 1 )	 --�]�k�ͪ�
		end
	end
end
-----------------------------------------------------
function LuaI_206018( Option ) --30�ѧ��M�]
	local PlayerID = OwnerID()
	local PackageID = 206018		-- §�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 206016 	

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end
end
-----------------------------------------------------
function LuaI_206019( Option ) --7�ѧ��M�]
	local PlayerID = OwnerID()
	local PackageID = 206019		-- §�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 206017 	

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1 , 1 )
	end
end
-----------------------------------------------------
function Lua_resetbeeract()

	SetFlag( OwnerID() , 543321, 0)
	SetFlag( OwnerID() , 543322, 0)
	SetFlag( OwnerID() , 543323, 0)
	SetFlag( OwnerID() , 543324, 0)
	SetFlag( OwnerID() , 544057, 0)  --2010 �~�|�s�s
	SetFlag( OwnerID() , 542190, 0)  --2010 �B�s�֤�
	SetFlag( OwnerID() ,545751, 0 ) --2012��s�y��
	SetFlag( OwnerID() ,544059, 0 ) --2012��s�y��
	SetFlag( OwnerID() ,544060, 0 ) --2012��s�y��
	SetFlag(OwnerID() ,541866, 0 ) -- 2012�ƨg�s�O
	SetFlag(OwnerID() ,546266, 0 ) -- 2012�ƨg�s�O(���W)
	SetFlag(OwnerID() ,546925, 0 ) -- 2012�����w�f	
	SetFlag(OwnerID() ,547001, 0 ) -- 2012�����w�f(��������)

	SetFlag(OwnerID(), 545746, 1)	--2011 ��s�`�y��
	SetFlag(OwnerID(), 545747, 1)
	SetFlag(OwnerID(), 545748, 1)
	SetFlag(OwnerID(), 545749, 1)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, 0 )   
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+6, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+7, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0 )
	BeginPlot(OwnerID(),"lua_beerfes_kors_re",0)
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_MAGIC04]" , C_SYSTEM )  --�A�{�b�i�H���s�i��Ҧ���s�`�����o�I
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_MAGIC04]" , C_SYSTEM )  --�A�{�b�i�H���s�i��Ҧ���s�`�����o�I
end