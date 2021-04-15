--¤s©i¡D®õ°Ç-Z-2¤Jªù¯ÅµôÁ_¾É®v
function Lua_110417_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110417_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550484 ); --²Ê¥¬¿Ç
AddRecipe( OwnerID(), 550486 ); --²Ê¥¬¦ç
AddRecipe( OwnerID(), 550536 ); --ªk¤O¤§¿Ç
AddRecipe( OwnerID(), 550538 ); --µuªk³T
AddRecipe( OwnerID(), 550488 ); --¤Ûµµ©Ü­·
AddRecipe( OwnerID(), 550489 ); --½uÂ´¿Ç
AddRecipe( OwnerID(), 550540 ); --«C½¬ªk³T
AddRecipe( OwnerID(), 550492 ); --½uÂ´¦ç
AddRecipe( OwnerID(), 550493 ); --«C½¬¿Ç
AddRecipe( OwnerID(), 550543 ); --¼é¦Á¤§¿Ç
AddRecipe( OwnerID(), 550495 ); --°g»î¦ç
AddRecipe( OwnerID(), 550544 ); --¼é¦Áµu³T
AddRecipe( OwnerID(), 550545 ); --»¤´bµu¿Ç
AddRecipe( OwnerID(), 550496 ); --±m¥ú©Ü­·
AddRecipe( OwnerID(), 550548 ); --»¤´b¤§³T
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

end

function Lua_110417_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end