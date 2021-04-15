--節慶活動 2009年4月春雨節
--建立時間: 2009/03/24
--修改日期: 2009/04/05
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--拉比兔禮盒     204380   
--需要 古老的鑰匙 203178 才可開啟
------------------------------------------------------------------------------
function LuaI_204380box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204380 	--拉比兔禮盒 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
		if ( NeedSpaceStatus  == false ) then
                                               ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_22]",0)
                                               ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_22]",0)
			return false
		elseif  CountBodyItem( PlayerID , PackageID ) >= 1  and KEY > 0  then
			return true
		else 
               		  	ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_DAN_111700_30]",0)
                                                ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_DAN_111700_30]",0)

			return false
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724410 , 1 )	 -- 拉比兔禮盒的掉寶
		DelBodyItem( OwnerID() , 203178 , 1 ) --刪 古老的鑰匙
	end
end
-------------------------------------------------------------------------------
--  拉比兔禮盒  ran出物品    
------------------------------------------------------------------------------
--  兔子變身藥水禮盒
--  拉比兔裝禮盒
-------------------------------------------------------------------------------