--���`_�Ҫ�_110809_�e��
function Lua_110809_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110809_RecipeList_Touch" , 60 );
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
AddRecipe( OwnerID(), 550723 ); --�j��������
AddRecipe( OwnerID(), 550725 ); --�j���F�P�Ĥ�
AddRecipe( OwnerID(), 550727 ); --��E����
AddRecipe( OwnerID(), 550729 ); --�t�O�Ĥ�
AddRecipe( OwnerID(), 550730 ); --�������˩M�Ĥ�
AddRecipe( OwnerID(), 551168 ); --�����@����
AddRecipe( OwnerID(), 550696); --�������˩M�Ĥ�
AddRecipe( OwnerID(), 550697); --�������˩M�Ĥ�
AddRecipe( OwnerID(), 550698); --�a�����˩M�Ĥ�
AddRecipe( OwnerID(), 551321); --�O�q�Ĥ�
AddRecipe( OwnerID(), 551323); --���z�Ĥ�
AddRecipe( OwnerID(), 551325); --�믫�Ĥ�
AddRecipe( OwnerID(), 551327); --�ӱ��Ĥ�
AddRecipe( OwnerID(), 551329); --����Ĥ�

end

function Lua_110809_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end