function LuaI_205942( Option )
	local PlayerID = OwnerID()
	local PackageID = 205942		-- 禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724748 	-- 掉落表

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
function LuaI_205940( Option ) --精緻酒瓶家具禮盒
	local PlayerID = OwnerID()
	local PackageID = 205940		-- 禮包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Item1 = 724749 	-- 掉落表

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
function LuaI_205900( Option )  --啤酒節酷裝禮盒
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
			GiveBodyItem( PlayerID , 724875 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724878 , 1 )	 --跑女生的
		end
	end
end
-----------------------------------------------------
function LuaI_206018( Option ) --30天坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206018		-- 禮包
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
function LuaI_206019( Option ) --7天坐騎包
	local PlayerID = OwnerID()
	local PackageID = 206019		-- 禮包
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
	SetFlag( OwnerID() , 544057, 0)  --2010 品嚐新酒
	SetFlag( OwnerID() , 542190, 0)  --2010 運酒快手
	SetFlag( OwnerID() ,545751, 0 ) --2012啤酒慶典
	SetFlag( OwnerID() ,544059, 0 ) --2012啤酒慶典
	SetFlag( OwnerID() ,544060, 0 ) --2012啤酒慶典
	SetFlag(OwnerID() ,541866, 0 ) -- 2012瘋狂酒保
	SetFlag(OwnerID() ,546266, 0 ) -- 2012瘋狂酒保(報名)
	SetFlag(OwnerID() ,546925, 0 ) -- 2012捕捉庫柏	
	SetFlag(OwnerID() ,547001, 0 ) -- 2012捕捉庫柏(完成活動)

	SetFlag(OwnerID(), 545746, 1)	--2011 啤酒節慶典
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
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_BEERDAY_MAGIC04]" , C_SYSTEM )  --你現在可以重新進行所有啤酒節活動囉！
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_BEERDAY_MAGIC04]" , C_SYSTEM )  --你現在可以重新進行所有啤酒節活動囉！
end