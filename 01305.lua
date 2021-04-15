--節慶活動 2009年4月春雨節
--建立時間: 2009/04/06
--修改日期: 2009/04/06
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--花語竹籃      204390   春言采語 活動用
------------------------------------------------------------------------------
function LuaI_204389box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204389		--花語竹籃 道具編號未設定
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724464 , 1 )	-- 花語竹籃 掉寶 未設定
	end
end
-------------------------------------------------------------------------------
--  花語竹籃  ran出物品
------------------------------------------------------------------------------
-- 拉比兔耳帽    6%
-- 繽紛煙火禮盒 94%
-------------------------------------------------------------------------------
------------------------------------------------------------------------------
--拉比兔耳帽禮盒      204390   春言采語 活動用
------------------------------------------------------------------------------
function LuaI_204390box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204390		--拉比兔耳帽禮盒 
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
			GiveBodyItem( PlayerID , 724462 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724463 , 1 )	 --跑女生的
		end
	end
end
-------------------------------------------------------------------------------
--  拉比兔耳帽禮盒   
------------------------------------------------------------------------------
-- 男生 724462
--拉比兔耳帽 223413

-- 女生 724463
--拉比兔耳帽 223415
-------------------------------------------------------------------------------