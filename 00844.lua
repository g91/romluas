--���`_�Ҫ�_110390_�e��
function Lua_110390_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110390_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550620 ); --���O�ݥ�
AddRecipe( OwnerID(), 550579 ); --�ֻs�@�L
AddRecipe( OwnerID(), 550581 ); --�֥�
AddRecipe( OwnerID(), 550623 ); --�ʻ��@�L
AddRecipe( OwnerID(), 550582 ); --�����֥�
AddRecipe( OwnerID(), 550625 ); --�ʻ����
AddRecipe( OwnerID(), 550584 ); --���Z�֥�
AddRecipe( OwnerID(), 550628 ); --�����@�L
AddRecipe( OwnerID(), 550585 ); --���Z�@�L
AddRecipe( OwnerID(), 550629 ); --�����
AddRecipe( OwnerID(), 550587 ); --���ڥ֥�
AddRecipe( OwnerID(), 550590 ); --�~�@�L
AddRecipe( OwnerID(), 550630 ); --�����@�L
AddRecipe( OwnerID(), 550591 ); --�~�֥�
AddRecipe( OwnerID(), 550633 ); --�I�����
end

function Lua_110390_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end