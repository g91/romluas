--妮可-羅格鎮木工導師
function Lua_110598_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110598_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550271 ); --細木弓
AddRecipe( OwnerID(), 550290 ); --鏡莎花
AddRecipe( OwnerID(), 550302 ); --長杖
AddRecipe( OwnerID(), 550327 ); --木製短杖
AddRecipe( OwnerID(), 550257 ); --簡易弩
AddRecipe( OwnerID(), 550271 ); --堅木弓
AddRecipe( OwnerID(), 550304 ); --見習法杖
AddRecipe( OwnerID(), 550329 ); --魔力短杖
AddRecipe( OwnerID(), 550258 ); --石弩
AddRecipe( OwnerID(), 550291 ); --巫魂圖騰
AddRecipe( OwnerID(), 550275 ); --硬短弓
AddRecipe( OwnerID(), 550305 ); --月之杖
AddRecipe( OwnerID(), 550782 ); --魔柳錫杖
AddRecipe( OwnerID(), 550261 ); --連弩
AddRecipe( OwnerID(), 550308 ); --莎迪斯
AddRecipe( OwnerID(), 550761 ); --巫醫筆記

	
end

function Lua_110598_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end