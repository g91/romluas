--§¢¦è¡D¥v±K´µ-Z-2¤Jªù¯Å¥´ÅK¾É®v
function Lua_110409_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110409_RecipeList_Touch" , 60 );
	
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
AddRecipe( OwnerID(), 550392 ); --À»Æ`´Î
AddRecipe( OwnerID(), 550821 ); --½Æ¦X¬Þ
AddRecipe( OwnerID(), 550378 ); --³Í´¶¥ß´°
AddRecipe( OwnerID(), 550891 ); --ÂÄ©Ô¥¨Âñ
AddRecipe( OwnerID(), 550803 ); --§ð«°©ò
AddRecipe( OwnerID(), 550413 ); --«Ò°êÃM¤h¼C
AddRecipe( OwnerID(), 550352 ); --Àô¬`¤P­º
AddRecipe( OwnerID(), 550379 ); --ºë·Ç¤Á³Î¸Ë¸m
AddRecipe( OwnerID(), 550402 ); --¨g¾Ô¤h©ò
AddRecipe( OwnerID(), 550370 ); --Às§Î¬Þ
AddRecipe( OwnerID(), 550850 ); --À»¥ÒÂñ
AddRecipe( OwnerID(), 550894 ); --îî´¹Âñ
AddRecipe( OwnerID(), 550362 ); --¨ëÀ»©ò
AddRecipe( OwnerID(), 550382 ); --Åúµ·¼C
AddRecipe( OwnerID(), 550876 ); --­«¬å¥¨¼C
AddRecipe( OwnerID(), 550353 ); --Às¤ö¨ë
AddRecipe( OwnerID(), 550425 ); --¥¨¾Ô·}ÀY
AddRecipe( OwnerID(), 550825 ); --¥Õ»È¬Þ
AddRecipe( OwnerID(), 550404 ); --·a¤ú©ò
AddRecipe( OwnerID(), 550837 ); --¤ôªi¼C
AddRecipe( OwnerID(), 550393 ); --¯}¥ÛÂñ
AddRecipe( OwnerID(), 550363 ); --­ô¼w¾Ô©ò
AddRecipe( OwnerID(), 550853 ); --¦aÆFÂñ
AddRecipe( OwnerID(), 550416 ); --ÃM¤h­«¼C
AddRecipe( OwnerID(), 550384 ); --µK¤b
AddRecipe( OwnerID(), 550356 ); --Ås¹_¤P­º
AddRecipe( OwnerID(), 550405 ); --ªk¦L©ò
AddRecipe( OwnerID(), 550364 ); --Ãì©ò
AddRecipe( OwnerID(), 550371 ); --Ã~¨¤¬Þ
AddRecipe( OwnerID(), 550385 ); --¦Ð¾W¼C
AddRecipe( OwnerID(), 550856 ); --¨g¾Ô¤hÂñ
AddRecipe( OwnerID(), 550879 ); --§ÅÅK¥¨¼C
AddRecipe( OwnerID(), 550427 ); --³¥¦a¾ÔÂñ

	
end

function Lua_110409_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end