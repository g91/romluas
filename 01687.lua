------------------------------------------------------------------------------
--2009/12/15
--1個戰馬坐騎
--2010/01/08
--幻影雪貂、晨光雪貂、龍魂戰駒、銀河天馬
--2010/02/06
--遠征毛驢
--2010/02/11
--風暴鷹馬獸、鷹眼葛列佛、符能輪盤、遠古猛瑪
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--坐騎  206597   7天鋼焰戰馬坐騎包
------------------------------------------------------------------------------
function LuaI_206597( Option )
	local PlayerID = OwnerID()
	local PackageID = 206597		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206594 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206598   30天鋼焰戰馬坐騎包
------------------------------------------------------------------------------
function LuaI_206598( Option )
	local PlayerID = OwnerID()
	local PackageID = 206598		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206595 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206721   7天 幻影雪貂坐騎包
------------------------------------------------------------------------------
function LuaI_206721( Option )
	local PlayerID = OwnerID()
	local PackageID = 206721		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206715 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206722   30天幻影雪貂坐騎包
------------------------------------------------------------------------------
function LuaI_206722( Option )
	local PlayerID = OwnerID()
	local PackageID = 206722		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206716 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206723   7天 晨光雪貂坐騎包
------------------------------------------------------------------------------
function LuaI_206723( Option )
	local PlayerID = OwnerID()
	local PackageID = 206723		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206718 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206724   30天晨光雪貂坐騎包
------------------------------------------------------------------------------
function LuaI_206724( Option )
	local PlayerID = OwnerID()
	local PackageID = 206724		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206719 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206711   7天 龍魂戰駒坐騎包
------------------------------------------------------------------------------
function LuaI_206711( Option )
	local PlayerID = OwnerID()
	local PackageID = 206711		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206705 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206712   30天龍魂戰駒坐騎包
------------------------------------------------------------------------------
function LuaI_206712( Option )
	local PlayerID = OwnerID()
	local PackageID = 206712		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206706 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206713   7天 銀河天馬坐騎包
------------------------------------------------------------------------------
function LuaI_206713( Option )
	local PlayerID = OwnerID()
	local PackageID = 206713		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206708 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206714   30天銀河天馬坐騎包
------------------------------------------------------------------------------
function LuaI_206714( Option )
	local PlayerID = OwnerID()
	local PackageID = 206714		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206709 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206907   7天 遠征毛驢坐騎包
------------------------------------------------------------------------------
function LuaI_206907( Option )
	local PlayerID = OwnerID()
	local PackageID = 206907		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206904 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206908   30天遠征毛驢坐騎包
------------------------------------------------------------------------------
function LuaI_206908( Option )
	local PlayerID = OwnerID()
	local PackageID = 206908		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206905 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206937   7天 暴風鷹馬獸坐騎包
------------------------------------------------------------------------------
function LuaI_206937( Option )
	local PlayerID = OwnerID()
	local PackageID = 206937		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206934 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206938   30天暴風鷹馬獸坐騎包
------------------------------------------------------------------------------
function LuaI_206938( Option )
	local PlayerID = OwnerID()
	local PackageID = 206938		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206935 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206942   7天 鷹眼葛列佛坐騎包
------------------------------------------------------------------------------
function LuaI_206942( Option )
	local PlayerID = OwnerID()
	local PackageID = 206942		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206939 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206943   30天鷹眼葛列佛坐騎包
------------------------------------------------------------------------------
function LuaI_206943( Option )
	local PlayerID = OwnerID()
	local PackageID = 206943		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206940 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206947   7天符能轉盤坐騎包
------------------------------------------------------------------------------
function LuaI_206947( Option )
	local PlayerID = OwnerID()
	local PackageID = 206947		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206944 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206948   30天符能轉盤坐騎包
------------------------------------------------------------------------------
function LuaI_206948( Option )
	local PlayerID = OwnerID()
	local PackageID = 206948		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206945 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206952   7天遠古猛瑪坐騎包
------------------------------------------------------------------------------
function LuaI_206952( Option )
	local PlayerID = OwnerID()
	local PackageID = 206952		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206949 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  206953   30天遠古猛瑪坐騎包
------------------------------------------------------------------------------
function LuaI_206953( Option )
	local PlayerID = OwnerID()
	local PackageID = 206953		--包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 206950 , 1 )	
	end
end