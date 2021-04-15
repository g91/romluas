--Ã¹®R-Ã¹®æÂíÅK¦K¾É®v
function Lua_110597_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110597_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550389 ); --Æ^°v¤ì´Ò
AddRecipe( OwnerID(), 550346 ); --µu¼C
AddRecipe( OwnerID(), 550376 ); --»´¤b¼C
AddRecipe( OwnerID(), 550367 ); --¶ê¤ì¬Þ
AddRecipe( OwnerID(), 550408 ); --¶Ä§Lªø¤M
AddRecipe( OwnerID(), 550390 ); --¤jÂñ
AddRecipe( OwnerID(), 550816 ); --µw¤ì¬Þ
AddRecipe( OwnerID(), 550400 ); --Âù¤ë©ò
AddRecipe( OwnerID(), 550348 ); --¨ëÃÃ¤P­º
AddRecipe( OwnerID(), 550800 ); --¥ÕÅK©ò
AddRecipe( OwnerID(), 550422 ); --«C»É¥¨Âñ
AddRecipe( OwnerID(), 550377 ); --Åï¥ú¼C
AddRecipe( OwnerID(), 550846 ); --¿ûÂñ
AddRecipe( OwnerID(), 550410 ); --Âù¤b¼C
AddRecipe( OwnerID(), 550368 ); --µw¥Ö¬Þ
AddRecipe( OwnerID(), 550401 ); --¥ï¤ì¤uÀY©ò
AddRecipe( OwnerID(), 550360 ); --§Q¤b©ò
AddRecipe( OwnerID(), 550888 ); --¬h¤ìÂñ
AddRecipe( OwnerID(), 550351 ); --³S¤¤¨ë

	
end

function Lua_110597_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end