function Hsiang_PlotDialogChangeHair( )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "�v��" );
	for i = 2008 , 2021 do
		DialogSelectStr( OwnerID() , "�v�����X" .. i );
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--��ưe�X�����D
		return;
	end
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID >= 0 then
		SetLook( OwnerID() , 0 , SelectID +2008 , 0 , 0 );
	end

	DialogClose( OwnerID() )

end

function Hsiang_RandHair2008_2021( )

	SetLook( OwnerID() , 0 , 2008 + Rand( 2021 - 2008 + 1 ) , 0 , 0 );
--			�y��,�v��,		�@�@�v��,����
	DialogClose( OwnerID() )

end