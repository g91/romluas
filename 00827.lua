--辛修斯-羅格鎮煉金導師
function Lua_110599_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110599_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550677 ); --基礎療傷藥
AddRecipe( OwnerID(), 550679 ); --基礎靈感藥水
AddRecipe( OwnerID(), 550681 ); --採集藥水一號
AddRecipe( OwnerID(), 550683 ); --採集藥水二號
AddRecipe( OwnerID(), 550685 ); --採集藥水三號
AddRecipe( OwnerID(), 551032 ); --戰意充溢藥劑
AddRecipe( OwnerID(), 551034 ); --精力旺盛藥劑
AddRecipe( OwnerID(), 551036 ); --專注集中藥劑
AddRecipe( OwnerID(), 550693 ); --興奮劑
AddRecipe( OwnerID(), 550695 ); --潛能藥水
AddRecipe( OwnerID(), 551168 ); --光明護身符
	
end

function Lua_110599_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end