--���״�-ù����Ҫ��ɮv
function Lua_110599_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110599_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550677 ); --��¦������
AddRecipe( OwnerID(), 550679 ); --��¦�F�P�Ĥ�
AddRecipe( OwnerID(), 550681 ); --�Ķ��Ĥ��@��
AddRecipe( OwnerID(), 550683 ); --�Ķ��Ĥ��G��
AddRecipe( OwnerID(), 550685 ); --�Ķ��Ĥ��T��
AddRecipe( OwnerID(), 551032 ); --�ԷN�R���ľ�
AddRecipe( OwnerID(), 551034 ); --��O�����ľ�
AddRecipe( OwnerID(), 551036 ); --�M�`�����ľ�
AddRecipe( OwnerID(), 550693 ); --���ľ�
AddRecipe( OwnerID(), 550695 ); --����Ĥ�
AddRecipe( OwnerID(), 551168 ); --�����@����
	
end

function Lua_110599_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end