--節慶活動 2009年4月春雨節
--建立時間: 2009/04/03
--修改日期: 2009/04/03
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- 204381~204388 彩蛋變身藥水袋系列

-- 各分為15分 1小時 2小時 24小時

--鷹羽彩蛋變身藥水  1個
--鷹羽彩蛋變身藥水  3個
--鷹羽彩蛋變身藥水  5個

--蕾絲彩蛋變身藥水  1個
--蕾絲彩蛋變身藥水  3個
--蕾絲彩蛋變身藥水  5個
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--鷹羽彩蛋變身藥水袋      204381   
--15分鐘版
-------------------------------------------------------------------------------
function LuaI_204381box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204381		--鷹羽彩蛋變身藥水袋 (15分)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724454 , 1 )	 --15分 鷹羽彩蛋變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--鷹羽彩蛋變身藥水袋      204382   
--1小時版
------------------------------------------------------------------------------
function LuaI_204382box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204382		--鷹羽彩蛋變身藥水袋  (1小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724455 , 1 )	 --1小時 鷹羽彩蛋變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--鷹羽彩蛋變身藥水袋      204383  
--2小時版
------------------------------------------------------------------------------
function LuaI_204383box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204383		--鷹羽彩蛋變身藥水袋 (2小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724456 , 1 )	 --2小時 鷹羽彩蛋變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--鷹羽彩蛋變身藥水袋      204384
--24小時版
------------------------------------------------------------------------------
function LuaI_204384box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204384		--鷹羽彩蛋變身藥水袋 (24小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724457 , 1 )	 --24小時 鷹羽彩蛋變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
--蕾絲彩蛋變身藥水袋      204385   
--15分鐘版
-------------------------------------------------------------------------------
function LuaI_204385box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204385		--蕾絲彩蛋變身藥水袋 (15分)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724458 , 1 )	 --15分 蕾絲彩蛋變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--蕾絲彩蛋變身藥水袋      204386   
--1小時版
------------------------------------------------------------------------------
function LuaI_204386box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204386		--蕾絲彩蛋變身藥水袋 (1小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724459 , 1 )	 --1小時 蕾絲彩蛋變身藥水袋 掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--蕾絲彩蛋變身藥水袋      204387 
--2小時版
------------------------------------------------------------------------------
function LuaI_204387box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204387		--蕾絲彩蛋變身藥水袋(2小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724460 , 1 )	 --2小時 蕾絲彩蛋變身藥水袋 掉寶
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--蕾絲彩蛋變身藥水袋      204388
--24小時版
------------------------------------------------------------------------------
function LuaI_204388box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204388		--蕾絲彩蛋變身藥水袋(24小時)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724461 , 1 )	 --24小時 蕾絲彩蛋變身藥水袋  掉寶
	end
end
-------------------------------------------------------------------------------