function Hsiang_PlotDialog_YesNoTest( )

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , "Yes or No???" );
	DialogSelectStr( OwnerID() , "(1)Yes" );
	DialogSelectStr( OwnerID() , "(2)NO" );

	local Obj = Role:new( OwnerID()  )
	if( DialogSendOpen( OwnerID() ) == false ) then 
		Obj:Say( "Send Data Error");	
		--��ưe�X�����D
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );


	if SelectID == 0  then
		Obj:Say( "Yes!!!!!!!!!!!");	
	elseif SelectID == 1  then
		Obj:Say( "NO!!!!!!!!!!!");	
	else 
		Obj:Say( "Cancel!!!!!!!!!!!");	
		-- �S��
	end

	DialogClose( GItemID )

end

