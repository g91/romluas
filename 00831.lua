--���L�D�w�i-Z-2�i���ɮv
function Lua_110388_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110388_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550432 ); --�N��
AddRecipe( OwnerID(), 550434 ); --�ĹT�G
AddRecipe( OwnerID(), 550436 ); --�N��
AddRecipe( OwnerID(), 550438 ); --����G�l
AddRecipe( OwnerID(), 550440 ); --�M��
AddRecipe( OwnerID(), 550442 ); --�����Ѱ�
AddRecipe( OwnerID(), 550444 ); --�t��
AddRecipe( OwnerID(), 550446 ); --�G���ѥ]
AddRecipe( OwnerID(), 550448 ); --�e�ĿN��
AddRecipe( OwnerID(), 550450 ); --�j�[�ѥ]
AddRecipe( OwnerID(), 550452 ); --���Z�T���v
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


	
end

function Lua_110388_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end