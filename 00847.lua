--¤Z«°_µôÁ__110391_·ç¬î
function Lua_110391_RecipeList_Init()
--	SetPlot( OwnerID() , "Touch" , "Lua_110391_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550498 ); --¥Õ´Ö¿Ç
AddRecipe( OwnerID(), 550499 ); --¹çÀR©Ü­·
AddRecipe( OwnerID(), 550502 ); --¥Õ´Ö¦ç
AddRecipe( OwnerID(), 550505 ); --¬õ½¬¿Ç
AddRecipe( OwnerID(), 550551 ); --«í¬P¤§¿Ç
AddRecipe( OwnerID(), 550506 ); --¬õ½¬¦ç
AddRecipe( OwnerID(), 550553 ); --«í¬Pµu³T
AddRecipe( OwnerID(), 550555 ); --·L¹Ð¤§¿Ç
AddRecipe( OwnerID(), 550508 ); --¤Û­µ©Ü­·
AddRecipe( OwnerID(), 550556 ); --·L¹Ðµu³T
AddRecipe( OwnerID(), 550509 ); --ºñ¸­¤§¦ç
AddRecipe( OwnerID(), 550558 ); --±Mª`¤§¿Ç
AddRecipe( OwnerID(), 550510 ); --ºñ¸­¿Ç
AddRecipe( OwnerID(), 550514 ); --¥úºa©Ü­·
AddRecipe( OwnerID(), 550513 ); --³Â¥¬´U
AddRecipe( OwnerID(), 550559 ); --±á¥úµu³T
AddRecipe( OwnerID(), 550516 ); --¶Q±Ú¦ç
AddRecipe( OwnerID(), 550560 ); --±á¥ú¤§¿Ç
AddRecipe( OwnerID(), 550517 ); --³nµ³´U
AddRecipe( OwnerID(), 550563 ); --µ³¥¬ÀY¤y
AddRecipe( OwnerID(), 550518 ); --ÂÅµK©Ü­·
AddRecipe( OwnerID(), 550565 ); --«H©À¤§¿Ç
AddRecipe( OwnerID(), 550521 ); --¶Â·t¿Ç
AddRecipe( OwnerID(), 550566 ); --«H©Àµu³T
AddRecipe( OwnerID(), 550523 ); --¶Â·t¤§¦ç
AddRecipe( OwnerID(), 550526 ); --¦Ð¤ò´U
AddRecipe( OwnerID(), 550569 ); --±KªùÀY¤y
AddRecipe( OwnerID(), 550571 ); --¬P­i¤§¿Ç
AddRecipe( OwnerID(), 550527 ); --µØÄR¿Ç
AddRecipe( OwnerID(), 550573 ); --¬P­iµu³T
AddRecipe( OwnerID(), 550530 ); --µØÄR¤§¦ç
AddRecipe( OwnerID(), 550576 ); --©]ÁøÀY¤y
AddRecipe( OwnerID(), 550532 ); --¨ª¦Ð©Ü­·
AddRecipe( OwnerID(), 550533 ); --»É°vªk´U
end

function Lua_110391_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end