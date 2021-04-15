--¤Z«°_¥´ÅK_110389_¥¬©Ô®æ
function Lua_110389_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110389_RecipeList_Touch" , 60 );
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
AddRecipe( OwnerID(), 550418 ); --²§±Úªø¤M
AddRecipe( OwnerID(), 550830 ); --¶ÂÂ`¬Þ
AddRecipe( OwnerID(), 550406 ); --½º©ò
AddRecipe( OwnerID(), 550811 ); --¨g¼A©ò
AddRecipe( OwnerID(), 550396 ); --Å@±ÐªÌ
AddRecipe( OwnerID(), 550841 ); --Áï¼C
AddRecipe( OwnerID(), 550421 ); --¹p»ï¼C
AddRecipe( OwnerID(), 550899 ); --¥Õ»È¾ÔÂñ
AddRecipe( OwnerID(), 550357 ); --«B¸¨µu¼C
AddRecipe( OwnerID(), 550365 ); --¼ZÃM¤h©ò
AddRecipe( OwnerID(), 550374 ); --¤õµK¤§¬Þ
AddRecipe( OwnerID(), 550797 ); --ª÷­è¤P­º
AddRecipe( OwnerID(), 550872 ); --ºû¨Ê©ò
AddRecipe( OwnerID(), 550883 ); --µõ¦a¼C
AddRecipe( OwnerID(), 550430 ); --¯}»î
AddRecipe( OwnerID(), 550388 ); --»È³·¼C
AddRecipe( OwnerID(), 550859 ); --¤û°©´Î
AddRecipe( OwnerID(), 550397 ); --¯}¯«´ÃÂñ


end

function Lua_110389_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end