--����D�ڧJ�K���S-Z-2�Ҫ��ɮv
function Lua_110386_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110386_RecipeList_Touch" , 60 );
	
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
AddRecipe( OwnerID(), 550703 ); --������
AddRecipe( OwnerID(), 550705 ); --�F�P�Ĥ�
AddRecipe( OwnerID(), 550707 ); --�w������
AddRecipe( OwnerID(), 550709 ); --����
AddRecipe( OwnerID(), 550691 ); --�[�t�Ĥ�
AddRecipe( OwnerID(), 550713 ); --�ͩR���u
AddRecipe( OwnerID(), 550715 ); --�]�O���u
AddRecipe( OwnerID(), 550717 ); --�S�űĶ��Ĥ��@��
AddRecipe( OwnerID(), 550719 ); --�S�űĶ��Ĥ��G��
AddRecipe( OwnerID(), 550721 ); --�S�űĶ��Ĥ��T��
AddRecipe( OwnerID(), 551168 ); --�����@����	
end

function Lua_110386_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end