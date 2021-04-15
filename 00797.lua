function Lua_110748_RecipeList_Init()

	SetPlot( OwnerID() , "Touch" , "Lua_110748_RecipeList_Touch" , 60 );
	
	AddRecipe( OwnerID(), 550001 );	-- 黃銅沙
	
end

function Lua_110748_RecipeList_Touch()

	--GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	--GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );

	DialogCreate( OwnerID() , EM_LuaDialogType_Input  , GetString("SAY_MOUTH_SHOP_A")); --/*租借棕馬需要 9 銀，確定租借嗎？
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return;
	end
	local A = 1
	while A>101 do
		Say( OwnerID(), "test" );
		Sleep(10)
		A = A+1
	end

	local SelectID = -2;
	local inputstring = nil;
	for i = 0 , 6000 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) then
			inputstring = DialogGetInputResult( OwnerID() );
			break;
		end
	end

	Say( OwnerID(), "It's" .. SelectID .. "/" .. inputstring );

	if( SelectID == 0 ) then
		SetCustomTitleString( OwnerID(), inputstring );
	end


	DialogClose( OwnerID() );	

end