--艾莉．歐克密斯特-Z-2煉金導師
function Lua_110386_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110386_RecipeList_Touch" , 60 );
	
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
AddRecipe( OwnerID(), 550703 ); --療傷藥
AddRecipe( OwnerID(), 550705 ); --靈感藥水
AddRecipe( OwnerID(), 550707 ); --安撫香粉
AddRecipe( OwnerID(), 550709 ); --巫藥
AddRecipe( OwnerID(), 550691 ); --加速藥水
AddRecipe( OwnerID(), 550713 ); --生命之泉
AddRecipe( OwnerID(), 550715 ); --魔力之泉
AddRecipe( OwnerID(), 550717 ); --特級採集藥水一號
AddRecipe( OwnerID(), 550719 ); --特級採集藥水二號
AddRecipe( OwnerID(), 550721 ); --特級採集藥水三號
AddRecipe( OwnerID(), 551168 ); --光明護身符	
end

function Lua_110386_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end