--節慶活動 2009年4月春雨節
--建立時間: 2009/03/20
--修改日期: 2009/04/03
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--繽紛禮盒      204127    帶兔子回家去 活動用
------------------------------------------------------------------------------
function LuaI_204127rabbit( Option )
	local PlayerID = OwnerID()
	local PackageID = 204127		--繽紛禮盒 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724271 , 1 )	
	end
end
-------------------------------------------------------------------------------
--  繽紛禮盒  ran出物品
------------------------------------------------------------------------------
--204092 必爾汀藥水禮盒   
--204128 繽紛煙火禮盒     
--204379 彩蛋禮盒
--       
-------------------------------------------------------------------------------