function Red_CheckItem( ItemID , ItemNum )
	if ( CountBodyItem( OwnerID() , ItemID ) >= ItemNum ) then
		return true
	else
		return false
	end
end

function Red_DeleteItem( ItemID , ItemNum )
	if ( DelBodyItem ( OwnerID() , ItemID , ItemNum ) ) then				
		return true
	else
		return false
	end
end