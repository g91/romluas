--�Z��_���__110391_���
function Lua_110391_RecipeList_Init()
--	SetPlot( OwnerID() , "Touch" , "Lua_110391_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550498 ); --�մֿ�
AddRecipe( OwnerID(), 550499 ); --���R�ܭ�
AddRecipe( OwnerID(), 550502 ); --�մ֦�
AddRecipe( OwnerID(), 550505 ); --������
AddRecipe( OwnerID(), 550551 ); --��P����
AddRecipe( OwnerID(), 550506 ); --������
AddRecipe( OwnerID(), 550553 ); --��P�u�T
AddRecipe( OwnerID(), 550555 ); --�L�Ф���
AddRecipe( OwnerID(), 550508 ); --�ۭ��ܭ�
AddRecipe( OwnerID(), 550556 ); --�L�еu�T
AddRecipe( OwnerID(), 550509 ); --�񸭤���
AddRecipe( OwnerID(), 550558 ); --�M�`����
AddRecipe( OwnerID(), 550510 ); --�񸭿�
AddRecipe( OwnerID(), 550514 ); --���a�ܭ�
AddRecipe( OwnerID(), 550513 ); --�¥��U
AddRecipe( OwnerID(), 550559 ); --����u�T
AddRecipe( OwnerID(), 550516 ); --�Q�ڦ�
AddRecipe( OwnerID(), 550560 ); --�������
AddRecipe( OwnerID(), 550517 ); --�n���U
AddRecipe( OwnerID(), 550563 ); --�����Y�y
AddRecipe( OwnerID(), 550518 ); --�ŵK�ܭ�
AddRecipe( OwnerID(), 550565 ); --�H������
AddRecipe( OwnerID(), 550521 ); --�·t��
AddRecipe( OwnerID(), 550566 ); --�H���u�T
AddRecipe( OwnerID(), 550523 ); --�·t����
AddRecipe( OwnerID(), 550526 ); --�Ф�U
AddRecipe( OwnerID(), 550569 ); --�K���Y�y
AddRecipe( OwnerID(), 550571 ); --�P�i����
AddRecipe( OwnerID(), 550527 ); --���R��
AddRecipe( OwnerID(), 550573 ); --�P�i�u�T
AddRecipe( OwnerID(), 550530 ); --���R����
AddRecipe( OwnerID(), 550576 ); --�]���Y�y
AddRecipe( OwnerID(), 550532 ); --���Щܭ�
AddRecipe( OwnerID(), 550533 ); --�ɰv�k�U
end

function Lua_110391_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end