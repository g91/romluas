--ù�R-ù�����K�K�ɮv
function Lua_110597_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110597_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550389 ); --�^�v���
AddRecipe( OwnerID(), 550346 ); --�u�C
AddRecipe( OwnerID(), 550376 ); --���b�C
AddRecipe( OwnerID(), 550367 ); --����
AddRecipe( OwnerID(), 550408 ); --�ħL���M
AddRecipe( OwnerID(), 550390 ); --�j��
AddRecipe( OwnerID(), 550816 ); --�w���
AddRecipe( OwnerID(), 550400 ); --�����
AddRecipe( OwnerID(), 550348 ); --���äP��
AddRecipe( OwnerID(), 550800 ); --���K��
AddRecipe( OwnerID(), 550422 ); --�C�ɥ���
AddRecipe( OwnerID(), 550377 ); --����C
AddRecipe( OwnerID(), 550846 ); --����
AddRecipe( OwnerID(), 550410 ); --���b�C
AddRecipe( OwnerID(), 550368 ); --�w�֬�
AddRecipe( OwnerID(), 550401 ); --���u�Y��
AddRecipe( OwnerID(), 550360 ); --�Q�b��
AddRecipe( OwnerID(), 550888 ); --�h����
AddRecipe( OwnerID(), 550351 ); --�S����

	
end

function Lua_110597_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end