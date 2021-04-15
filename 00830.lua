--¦N®¦¡D¥d¥»¯S-Z-2¤ì¤u¾É®v
function Lua_110387_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110387_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550271 ); --²Ó¤ì¤}
AddRecipe( OwnerID(), 550290 ); --Ãè²ïªá
AddRecipe( OwnerID(), 550302 ); --ªø§ú
AddRecipe( OwnerID(), 550327 ); --¤ì»sµu§ú
AddRecipe( OwnerID(), 550257 ); --Â²©ö©¸
AddRecipe( OwnerID(), 550271 ); --°í¤ì¤}
AddRecipe( OwnerID(), 550304 ); --¨£²ßªk§ú
AddRecipe( OwnerID(), 550329 ); --Å]¤Oµu§ú
AddRecipe( OwnerID(), 550258 ); --¥Û©¸
AddRecipe( OwnerID(), 550291 ); --§Å»î¹ÏÄË
AddRecipe( OwnerID(), 550275 ); --µwµu¤}
AddRecipe( OwnerID(), 550305 ); --¤ë¤§§ú
AddRecipe( OwnerID(), 550782 ); --Å]¬h¿ü§ú
AddRecipe( OwnerID(), 550261 ); --³s©¸
AddRecipe( OwnerID(), 550308 ); --²ï­}´µ
AddRecipe( OwnerID(), 550761 ); --§ÅÂåµ§°O
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


	
end

function Lua_110387_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end