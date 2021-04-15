--¶ÂÂ`_·Òª÷_110390_»eº¸
function Lua_110390_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110390_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550620 ); --Á¡ªO¯Ý¥Ò
AddRecipe( OwnerID(), 550579 ); --¥Ö»sÅ@»L
AddRecipe( OwnerID(), 550581 ); --¥Ö¥Ò
AddRecipe( OwnerID(), 550623 ); --²Ê»ÉÅ@»L
AddRecipe( OwnerID(), 550582 ); --¯¾¹¢¥Ö¥Ò
AddRecipe( OwnerID(), 550625 ); --²Ê»ÉÃì¥Ò
AddRecipe( OwnerID(), 550584 ); --³¥ÆZ¥Ö¥Ò
AddRecipe( OwnerID(), 550628 ); --ª½ÃìÅ@»L
AddRecipe( OwnerID(), 550585 ); --³¥ÆZÅ@»L
AddRecipe( OwnerID(), 550629 ); --ª½Ãì¥Ò
AddRecipe( OwnerID(), 550587 ); --»¨ÁÚ¥Ö¥Ò
AddRecipe( OwnerID(), 550590 ); --Ã~Å@»L
AddRecipe( OwnerID(), 550630 ); --©¾¸ÛÅ@»L
AddRecipe( OwnerID(), 550591 ); --Ã~¥Ö¥Ò
AddRecipe( OwnerID(), 550633 ); --¨I­«Ãì¥Ò
end

function Lua_110390_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end