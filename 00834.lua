--�d���}��D�w�i-Z-2�M�~�Ųi���ɮv
function Lua_110411_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110411_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550454 ); --���`�ѥ]
AddRecipe( OwnerID(), 550456 ); --���o���A��
AddRecipe( OwnerID(), 550458  ); --�iۣ��
AddRecipe( OwnerID(), 550460 ); --���汲��
AddRecipe( OwnerID(), 550462 ); --�����}
AddRecipe( OwnerID(), 550464 ); --�h�A����
AddRecipe( OwnerID(), 550466 ); --�_�����G��
AddRecipe( OwnerID(), 550468 ); --�Φ׮��A�F��
AddRecipe( OwnerID(), 550470 ); --�A��n�|
AddRecipe( OwnerID(), 550472 ); --�N�x�T�⭻�z
AddRecipe( OwnerID(), 550474 ); --�����P��
AddRecipe( OwnerID(), 550476 ); --���K�����`��
AddRecipe( OwnerID(), 550478 ); --����i�i�p
AddRecipe( OwnerID(), 550480 ); --�s�b
AddRecipe( OwnerID(), 550482 ); --�Ův��³

end

function Lua_110411_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end