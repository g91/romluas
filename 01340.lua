--節慶活動 2009年5月愛樂節 
--建立時間: 2009/05/06
--修改日期: 2009/05/06
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--坐騎  204280     7天黑色刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204280( Option )
	local PlayerID = OwnerID()
	local PackageID = 204280		--7天黑色刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724471 , 1 )	
	end
end
------------------------------------------------------------------------------
--坐騎  204281     30天黑色刺角犀牛坐騎包
------------------------------------------------------------------------------
function LuaI_204281( Option )
	local PlayerID = OwnerID()
	local PackageID = 204281		--30天黑色刺角犀牛坐騎包
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724472 , 1 )	
	end
end