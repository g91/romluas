function Hsiang_ChangeParalledID( )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Change Paralled ID!!" );

	local ParalledID 		= 0
	local BaseZoneID      	= 1
	while( 1 ) do
		if( CheckZone( ParalledID * 1000 + BaseZoneID) == false ) then
			break;
		end

		DialogSelectStr( OwnerID() , "Paralled" .. ParalledID  );
		ParalledID = ParalledID + 1;
	end	
	
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
	
	if SelectID >= 0  and SelectID <= ParalledID then
		SetParalledID( OwnerID() , SelectID )
	end

	DialogClose( OwnerID() )

end