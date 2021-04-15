function Hsiang_PlotDialog_SetKillRate( )
	local Obj = Role:new( OwnerID()  )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "選則打怪速度，掉寶與武器損耗也會因此變化" );

	for i = 1 , 10 , 1 do
		DialogSelectStr( OwnerID() , "殺 1隻等於殺".. (i*2).."隻"  );
	end

	if( DialogSendOpen( OwnerID() ) == false ) then 
		Obj:Say( "資料送出有問題");	
		--資料送出有問題
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if( SelectID < 0 ) then 
		Obj:Say( "取消不改變");	
	else
		Obj:Say( "殺怪速度改為 原本的速度" .. (SelectID +1)*2 .. "倍"  );	
		WriteRoleValue( OwnerID() , EM_RoleValue_KillRate , (SelectID+1)*2  )
	end

	DialogClose( OwnerID() )

end

