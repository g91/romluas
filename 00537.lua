function Cat_CZL( )
	local Name = {"ZONE_WAILING MOUNTAINS" , "ZONE_ROGSHIRE" , "ZONE_VARANAS" , "ZONE_ASLAN" , "ZONE_ARGENFALL" , "ZONE_HYBORA HIGHLANDS" , "" }
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select Zone" );
	
	for i = 1 , table.getn(Name) do
		DialogSelectStr( OwnerID() , GetString( Name[i] ) );
	end
	
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	DialogClose( OwnerID() )
	
	if SelectID == 0  then
				    --ZoneID , �h , X , Y , Z ,Dir
		ChangeZone( OwnerID() , 1 , 0 , -3781 , 216 , -8534 , 0 );--�}���E��
	elseif  SelectID == 1  then
		ChangeZone( OwnerID() , 1 , 0 , -572 , 24 , -5869 , 0 );--ù����
	elseif  SelectID == 2  then
		ChangeZone( OwnerID() , 2 , 0 , 4745 , 116 , -1955 , 0 );--�Z��R����
	elseif  SelectID == 3  then
		ChangeZone( OwnerID() , 4 , 0 , -2765 , -37 , 9253 , 0 );--������ר�
	elseif  SelectID == 4  then
		ChangeZone( OwnerID() , 4 , 0 , -5373 , 578 , 3404 , 0 );--���r��
	elseif  SelectID == 5  then
		ChangeZone( OwnerID() , 5 , 0 , -14062 , 757 , -894 , 0 );--�����ҥ����
	end


end