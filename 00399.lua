function Hsiang_PlotDialogChangeHair( )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "髮型" );
	for i = 2008 , 2021 do
		DialogSelectStr( OwnerID() , "髮型號碼" .. i );
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
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
--			臉型,髮型,		　　髮色,膚色
	DialogClose( OwnerID() )

end