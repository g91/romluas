--�s�i�D����-Z-2�J���ŵ��_�ɮv
function Lua_110417_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110417_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550484 ); --�ʥ���
AddRecipe( OwnerID(), 550486 ); --�ʥ���
AddRecipe( OwnerID(), 550536 ); --�k�O����
AddRecipe( OwnerID(), 550538 ); --�u�k�T
AddRecipe( OwnerID(), 550488 ); --�۵��ܭ�
AddRecipe( OwnerID(), 550489 ); --�u´��
AddRecipe( OwnerID(), 550540 ); --�C���k�T
AddRecipe( OwnerID(), 550492 ); --�u´��
AddRecipe( OwnerID(), 550493 ); --�C����
AddRecipe( OwnerID(), 550543 ); --�������
AddRecipe( OwnerID(), 550495 ); --�g���
AddRecipe( OwnerID(), 550544 ); --����u�T
AddRecipe( OwnerID(), 550545 ); --���b�u��
AddRecipe( OwnerID(), 550496 ); --�m���ܭ�
AddRecipe( OwnerID(), 550548 ); --���b���T
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

end

function Lua_110417_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end