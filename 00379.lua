function Hsiang_PlotDialog_SetKillRate( )
	local Obj = Role:new( OwnerID()  )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "��h���ǳt�סA���_�P�Z���l�Ӥ]�|�]���ܤ�" );

	for i = 1 , 10 , 1 do
		DialogSelectStr( OwnerID() , "�� 1�������".. (i*2).."��"  );
	end

	if( DialogSendOpen( OwnerID() ) == false ) then 
		Obj:Say( "��ưe�X�����D");	
		--��ưe�X�����D
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if( SelectID < 0 ) then 
		Obj:Say( "����������");	
	else
		Obj:Say( "���ǳt�קאּ �쥻���t��" .. (SelectID +1)*2 .. "��"  );	
		WriteRoleValue( OwnerID() , EM_RoleValue_KillRate , (SelectID+1)*2  )
	end

	DialogClose( OwnerID() )

end

