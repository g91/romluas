function Sys_ItemTransportPos()
	if CheckItemTransportPos( ) == false then 
		return false
	end

	if DelBodyItem( OwnerID() , 201102 , 1 ) == false then 
		ScriptMessage ( OwnerID() , OwnerID() , 0 , GetString("ITEM_TRANSFER_2") , 0 );	-- 缺少消耗品
		return false;
	end
	return  ItemTransportPos()

end

function Sys_CheckItemTransportPos()
	if CheckItemTransportPos( ) == false then 
		return false
	end

	if CountBodyItem( OwnerID() , 201102  ) == 0 then 
		ScriptMessage ( OwnerID() , OwnerID() , 0 , GetString("ITEM_TRANSFER_2") , 0 );	-- 缺少消耗品
		return false;
	end
	return true;

end

function Sys_ItemTransportPos_Core()
	if CheckItemTransportPos( ) == false then 
		return false
	end

	return  ItemTransportPos()

end

function Sys_CheckItemTransportPos_Core()
	if CheckItemTransportPos( ) == false then 
		return false
	end

	return true;

end