--ItemID �n�������~
--Num �@���n�������~�ƶq
--Option �ﶵ�ACHECK �Φb�ˬd�AUSE �Φb�ϥΫ�Ĳ�o
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
