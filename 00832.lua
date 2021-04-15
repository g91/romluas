--¥d´£®¦¡Dªü»X-Z-2±M·~¯Å»s¥Ò¾É®v
function Lua_110407_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110407_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550635 ); --»ÈÂêÅ@»L
AddRecipe( OwnerID(), 550592 ); --«DµYÅ@»L
AddRecipe( OwnerID(), 550638 ); --»ÈÂêÃì¥Ò
AddRecipe( OwnerID(), 550595 ); --«l¯ß¥Ö¥Ò
AddRecipe( OwnerID(), 550597 ); --¦Ðµ³Å@»L
AddRecipe( OwnerID(), 550665 ); --³½Åì×H¥Ò
AddRecipe( OwnerID(), 550639 ); --·L´¹Å@»L
AddRecipe( OwnerID(), 550600 ); --¦Ðµ³¥Ö¥Ò
AddRecipe( OwnerID(), 550667 ); --³½Åì¤§ñZ
AddRecipe( OwnerID(), 550641 ); --·L´¹Ãì¥Ò
AddRecipe( OwnerID(), 550642 ); --¦B³·Å@»L
AddRecipe( OwnerID(), 550601 ); --¤p²îªø¥Ö´U
AddRecipe( OwnerID(), 550643 ); --¦B³·Ãì¥Ò
AddRecipe( OwnerID(), 550941 ); --îî´¹×H¥Ò
AddRecipe( OwnerID(), 550670 ); --¥ÕÅKÀY²¯
AddRecipe( OwnerID(), 550603 ); --ªê§JÅ@»L
AddRecipe( OwnerID(), 550646 ); --ÁëÁåÀY¥Ò
AddRecipe( OwnerID(), 550604 ); --µ¾¤ë¥Ö¥Ò
AddRecipe( OwnerID(), 550944 ); --¥Õ»ÈªOª÷ñZ
AddRecipe( OwnerID(), 550647 ); --³Ö¦aÅ@»L
AddRecipe( OwnerID(), 550605 ); --µ¾¤ëÅ@»L
AddRecipe( OwnerID(), 550608 ); --´_¥j¥Ö´U
AddRecipe( OwnerID(), 550649 ); --º§º¬Ãì¥Ò
AddRecipe( OwnerID(), 550671 ); --¤é½ü×H¥Ò
AddRecipe( OwnerID(), 550609 ); --³v­·Å@»L
AddRecipe( OwnerID(), 550931 ); --»ÈÅ@»L
AddRecipe( OwnerID(), 550672 ); --¤é½ü¤§ñZ
AddRecipe( OwnerID(), 550611 ); --³v­·¥Ö¥Ò
AddRecipe( OwnerID(), 550651 ); --¤Ñ­µÅ@»L
AddRecipe( OwnerID(), 550675 ); --®£©ÆÀY²¯
AddRecipe( OwnerID(), 550652 ); --¼É­·ñZ¥Ò
AddRecipe( OwnerID(), 550731 ); --«Õ·t×H¥Ò
AddRecipe( OwnerID(), 550654 ); --¤Ñ­µÃì¥Ò
AddRecipe( OwnerID(), 550660 ); --¼É­·×H¥Ò
AddRecipe( OwnerID(), 550659 ); --¼É¯PÀY¥Ò
AddRecipe( OwnerID(), 550613 ); --¨g®öÅ@»L
AddRecipe( OwnerID(), 550734 ); --«Õ·t¤§ñZ
AddRecipe( OwnerID(), 550661 ); --ªñ½ÃÅ@»L
AddRecipe( OwnerID(), 550615 ); --¨g®ö¥Ö¥Ò
AddRecipe( OwnerID(), 550618 ); --¨N¹Ð¥Ö´U
AddRecipe( OwnerID(), 550663 ); --ªñ½ÃÃì¥Ò
AddRecipe( OwnerID(), 550737 ); --¯«©zÀY²¯
AddRecipe( OwnerID(), 550619 ); --«l¦ÐÅ@»L
	
end

function Lua_110407_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
end