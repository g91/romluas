--���`_��u_110811_�v����
function Lua_110811_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110811_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550277 ); --�Ԥ}
AddRecipe( OwnerID(), 550262 ); --�y����
AddRecipe( OwnerID(), 550333 ); --�����v��
AddRecipe( OwnerID(), 550311 ); --�ųN�k��
AddRecipe( OwnerID(), 550294 ); --�]�k���v
AddRecipe( OwnerID(), 550278 ); --��G�H���}
AddRecipe( OwnerID(), 550313 ); --�Ф���
AddRecipe( OwnerID(), 550335 ); --�e�R�v��
AddRecipe( OwnerID(), 550264 ); --�m������
AddRecipe( OwnerID(), 550764 ); --�r�D��
AddRecipe( OwnerID(), 550314 ); --�t�N�k��
AddRecipe( OwnerID(), 550281 ); --�l�Ф}
AddRecipe( OwnerID(), 550266 ); --������
AddRecipe( OwnerID(), 550336 ); --�]���v��
AddRecipe( OwnerID(), 550315 ); --�c�F����
AddRecipe( OwnerID(), 550297 ); --���l�~���ͻH
AddRecipe( OwnerID(), 550283 ); --��Ǥ��}
AddRecipe( OwnerID(), 550318 ); --��������
AddRecipe( OwnerID(), 550337 ); --�����v��
AddRecipe( OwnerID(), 550267 ); --�l��
AddRecipe( OwnerID(), 550767 ); --������w
AddRecipe( OwnerID(), 550320 ); --�_�ݪk��
AddRecipe( OwnerID(), 550286 ); --�]�y�}
AddRecipe( OwnerID(), 550268 ); --�s����
AddRecipe( OwnerID(), 550340 ); --���F�u��
AddRecipe( OwnerID(), 550323 ); --���F�k��
AddRecipe( OwnerID(), 550300 ); --���`�ֽg
AddRecipe( OwnerID(), 550287 ); --�F��}
AddRecipe( OwnerID(), 550325 ); --�ϥͤ���
AddRecipe( OwnerID(), 550343 ); --�ſ��v��
AddRecipe( OwnerID(), 550270 ); --�]�v����
AddRecipe( OwnerID(), 550770 ); --�c�F������
AddRecipe( OwnerID(), 550326 ); --�N���I���
AddRecipe( OwnerID(), 551231 ); --���]�v��	
AddRecipe( OwnerID(), 551232 ); --���v�}	
AddRecipe( OwnerID(), 551236 ); --���K����	
AddRecipe( OwnerID(), 551248 ); --�v������	
AddRecipe( OwnerID(), 551270 ); --�t�����k��	

end

function Lua_110811_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end