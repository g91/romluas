--節慶活動 2009年4月春雨節
--建立時間: 2009/04/03
--修改日期: 2009/04/03
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- 204371~204378 兔子變身藥水袋系列

-- 各分為15分 1小時 2小時 24小時

--紳士藍帶變身藥水  1個
--紳士藍帶變身藥水  3個
--紳士藍帶變身藥水  5個

--淑女兔裙變身藥水  1個
--淑女兔裙變身藥水  3個
--淑女兔裙變身藥水  5個
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--紳士藍帶變身藥水袋      204371   
--15分鐘版
-------------------------------------------------------------------------------
function LuaI_204371box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204371		--紳士藍帶變身藥水袋 (15分)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724446 , 1 )	 --15分 紳士藍帶變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--紳士藍帶變身藥水袋      204372   
--1小時版
------------------------------------------------------------------------------
function LuaI_204372box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204372		--紳士藍帶變身藥水袋  (1小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724447 , 1 )	 --1小時 紳士藍帶變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--紳士藍帶變身藥水袋      204373  
--2小時版
------------------------------------------------------------------------------
function LuaI_204373box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204373		--紳士藍帶變身藥水袋 (2小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724448 , 1 )	 --2小時 紳士藍帶變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--紳士藍帶變身藥水袋      204374
--24小時版
------------------------------------------------------------------------------
function LuaI_204374box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204374		--紳士藍帶變身藥水袋 (24小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724449 , 1 )	 --24小時 紳士藍帶變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
--淑女兔裙變身藥水袋      204375   
--15分鐘版
-------------------------------------------------------------------------------
function LuaI_204375box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204375		--淑女兔裙變身藥水袋 (15分)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724450 , 1 )	 --15分 淑女兔裙變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--淑女兔裙變身藥水袋      204376   
--1小時版
------------------------------------------------------------------------------
function LuaI_204376box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204376		--淑女兔裙變身藥水袋 (1小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724451 , 1 )	 --1小時 淑女兔裙變身藥水袋 掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--淑女兔裙變身藥水袋      204377 
--2小時版
------------------------------------------------------------------------------
function LuaI_204377box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204377		--淑女兔裙變身藥水袋(2小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724452 , 1 )	 --2小時 淑女兔裙變身藥水袋 掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--淑女兔裙變身藥水袋      204378
--24小時版
------------------------------------------------------------------------------
function LuaI_204378box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204378		--淑女兔裙變身藥水袋(24小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724453 , 1 )	 --24小時 淑女兔裙變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------