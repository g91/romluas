--¥dº¸­}¦è¡D®w¥i-Z-2±M·~¯Å²i¶¹¾É®v
function Lua_110411_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110411_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550454 ); --¦×À`ÄÑ¥]
AddRecipe( OwnerID(), 550456 ); --¥¤ªo®üÂA¬£
AddRecipe( OwnerID(), 550458  ); --¿iÛ£¬£
AddRecipe( OwnerID(), 550460 ); --¦×Âæ±²»æ
AddRecipe( OwnerID(), 550462 ); --¤ô´¹¿}
AddRecipe( OwnerID(), 550464 ); --ªh¿AÂøÀí
AddRecipe( OwnerID(), 550466 ); --©_²§¤ôªG¬£
AddRecipe( OwnerID(), 550468 ); --ÂÎ¦×®üÂA¨F©Ô
AddRecipe( OwnerID(), 550470 ); --»Aºñ³n¿|
AddRecipe( OwnerID(), 550472 ); --±N­x¤T¦â­»¸z
AddRecipe( OwnerID(), 550474 ); --¯ù­»ÃP»æ
AddRecipe( OwnerID(), 550476 ); --¥¤ÖK³½¦×À`»æ
AddRecipe( OwnerID(), 550478 ); --­»¯ó¥i¥i¶p
AddRecipe( OwnerID(), 550480 ); --Às®b
AddRecipe( OwnerID(), 550482 ); --§Å®v°®Â³

end

function Lua_110411_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end