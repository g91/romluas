--�N���D�d���S-Z-2��u�ɮv
function Lua_110387_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110387_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550271 ); --�Ӥ�}
AddRecipe( OwnerID(), 550290 ); --����
AddRecipe( OwnerID(), 550302 ); --����
AddRecipe( OwnerID(), 550327 ); --��s�u��
AddRecipe( OwnerID(), 550257 ); --²����
AddRecipe( OwnerID(), 550271 ); --���}
AddRecipe( OwnerID(), 550304 ); --���ߪk��
AddRecipe( OwnerID(), 550329 ); --�]�O�u��
AddRecipe( OwnerID(), 550258 ); --�۩�
AddRecipe( OwnerID(), 550291 ); --�Ż����
AddRecipe( OwnerID(), 550275 ); --�w�u�}
AddRecipe( OwnerID(), 550305 ); --�뤧��
AddRecipe( OwnerID(), 550782 ); --�]�h����
AddRecipe( OwnerID(), 550261 ); --�s��
AddRecipe( OwnerID(), 550308 ); --��}��
AddRecipe( OwnerID(), 550761 ); --���嵧�O
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


	
end

function Lua_110387_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end