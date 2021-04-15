--ItemID 要給的物品
--Num 一次要給的物品數量
--Option 選項，CHECK 用在檢查，USE 用在使用後觸發
Function LuaI_ItemInBag(  ItemID , Num ,Option )
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == true ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , ItemID , Num )
	end
end
