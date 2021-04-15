--¶ÂÂ`_¤ì¤u_110811_¥v´£¤Ò
function Lua_110811_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110811_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550277 ); --¾Ô¤}
AddRecipe( OwnerID(), 550262 ); --¦y§À©¸
AddRecipe( OwnerID(), 550333 ); --°ª¯ÅÅv§ú
AddRecipe( OwnerID(), 550311 ); --§Å³Nªk§ú
AddRecipe( OwnerID(), 550294 ); --Å]¤k¤§¾v
AddRecipe( OwnerID(), 550278 ); --ºñ¸G¤H¨¤¤}
AddRecipe( OwnerID(), 550313 ); --¦Ð¤§§ú
AddRecipe( OwnerID(), 550335 ); --¥e¤RÅv§ú
AddRecipe( OwnerID(), 550264 ); --±m½º¤§©¸
AddRecipe( OwnerID(), 550764 ); --¬r³DÃÃ
AddRecipe( OwnerID(), 550314 ); --¸t¨Nªk§ú
AddRecipe( OwnerID(), 550281 ); --«l¦Ð¤}
AddRecipe( OwnerID(), 550266 ); --¿û¤ú©¸
AddRecipe( OwnerID(), 550336 ); --Å]°©Åv§ú
AddRecipe( OwnerID(), 550315 ); --´cÆF¤§¤Ä
AddRecipe( OwnerID(), 550297 ); --·àølÃ~ªº¯Í»H
AddRecipe( OwnerID(), 550283 ); --ºë·Ç¤§¤}
AddRecipe( OwnerID(), 550318 ); --¥ú³±¤§§ú
AddRecipe( OwnerID(), 550337 ); --¯«³¾Åv§ú
AddRecipe( OwnerID(), 550267 ); --Ál©¸
AddRecipe( OwnerID(), 550767 ); --§ÅÂå»íÀw
AddRecipe( OwnerID(), 550320 ); --©_ÂÝªk§ú
AddRecipe( OwnerID(), 550286 ); --©]¾y¤}
AddRecipe( OwnerID(), 550268 ); --Às¨¤©¸
AddRecipe( OwnerID(), 550340 ); --¤ÛÆFµu§ú
AddRecipe( OwnerID(), 550323 ); --³¾ÆFªk§ú
AddRecipe( OwnerID(), 550300 ); --¦º¤`¸Ö½g
AddRecipe( OwnerID(), 550287 ); --ÆF¤ì¤}
AddRecipe( OwnerID(), 550325 ); --½Ï¥Í¤§§ú
AddRecipe( OwnerID(), 550343 ); --ÂÅ¿¹Åv§ú
AddRecipe( OwnerID(), 550270 ); --©]¼v¤§©¸
AddRecipe( OwnerID(), 550770 ); --´cÆF¦¬¶°¾¹
AddRecipe( OwnerID(), 550326 ); --¦N¨½¨I«ä§ú
AddRecipe( OwnerID(), 551231 ); --¨¸Å]Åv§ú	
AddRecipe( OwnerID(), 551232 ); --¨³¼v¤}	
AddRecipe( OwnerID(), 551236 ); --¤õµK¤§©¸	
AddRecipe( OwnerID(), 551248 ); --Æv¶§¤§§ú	
AddRecipe( OwnerID(), 551270 ); --¸t¯«ªº¥k¤â	

end

function Lua_110811_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end