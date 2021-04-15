function LuaI_Hao_Onepiece00( Option )

	local PlayerID = OwnerID()
--	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 1  )

	local M1 =  CountBodyItem( OwnerID() , 204813 ) -- 藏寶地圖上卷
	local M2 =  CountBodyItem( OwnerID() , 204814 ) -- 藏寶地圖中卷
	local M3 =  CountBodyItem( OwnerID() , 204815 ) -- 藏寶地圖下卷
	local M4 =  CountBodyItem( OwnerID() , 204816 ) -- 藏寶地圖全

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) or M1== 0 or M2 ==0 or M3== 0 then
			return false
                else 
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 204816 , 1 )	-- 藏寶地圖全
			
		DelBodyItem( OwnerID() , 204813 , 1 )
		DelBodyItem( OwnerID() , 204814 , 1 )
		DelBodyItem( OwnerID() , 204815 , 1 )


	end


end

function Lua_Hao_Test0()
	SetFlag( OwnerID() , 543556 , 1)
end

function Lua_Hao_surfboard() -- 坐騎 符能輪盤
	CancelBuff( OwnerID() , 506184 )
end
