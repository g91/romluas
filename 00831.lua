--°¨ªL¡D®w¥i-Z-2²i¶¹¾É®v
function Lua_110388_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110388_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550432 ); --¯N³½
AddRecipe( OwnerID(), 550434 ); --»Ä¹TªG
AddRecipe( OwnerID(), 550436 ); --¯N¦×
AddRecipe( OwnerID(), 550438 ); --­»¯óªG¤l
AddRecipe( OwnerID(), 550440 ); --¾M³½
AddRecipe( OwnerID(), 550442 ); --¬µ²¢ÄÑ°é
AddRecipe( OwnerID(), 550444 ); --Ât¦×
AddRecipe( OwnerID(), 550446 ); --ªGÂæÄÑ¥]
AddRecipe( OwnerID(), 550448 ); --»e¥Ä¿N³¾
AddRecipe( OwnerID(), 550450 ); --¤j»[ÄÑ¥]
AddRecipe( OwnerID(), 550452 ); --³½§Z¤T©úªv
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


	
end

function Lua_110388_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end