--節慶活動 2009年4月春雨節
--建立時間: 2009/03/20
--修改日期: 2009/03/20
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--繽紛煙火禮盒      204128    帶兔子回家去 活動用
--繽紛煙火禮盒由拉比禮盒開出
------------------------------------------------------------------------------
function LuaI_204128hanabi( Option )
	local PlayerID = OwnerID()
	local PackageID = 204128		--繽紛煙火禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 720289 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  繽紛煙火禮盒  ran出物品
------------------------------------------------------------------------------
--203291 心心相印  x5  20%
--230292 璀璨星空  x5  20%
--203293 熱情仲夏  x5  20%
--203294 金碧輝煌  x5  20%
--203295 星雲瀰漫  x5  20%
-------------------------------------------------------------------------------