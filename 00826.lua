--�g�i-ù�����u�ɮv
function Lua_110598_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110598_RecipeList_Touch" , 60 );
	
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

	
end

function Lua_110598_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end