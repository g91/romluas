--����D�v�K��-Z-2�J���ť��K�ɮv
function Lua_110409_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110409_RecipeList_Touch" , 60 );
	
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
AddRecipe( OwnerID(), 550392 ); --���`��
AddRecipe( OwnerID(), 550821 ); --�ƦX��
AddRecipe( OwnerID(), 550378 ); --�ʹ��ߴ�
AddRecipe( OwnerID(), 550891 ); --�ĩԥ���
AddRecipe( OwnerID(), 550803 ); --�𫰩�
AddRecipe( OwnerID(), 550413 ); --�Ұ��M�h�C
AddRecipe( OwnerID(), 550352 ); --���`�P��
AddRecipe( OwnerID(), 550379 ); --��Ǥ��θ˸m
AddRecipe( OwnerID(), 550402 ); --�g�Ԥh��
AddRecipe( OwnerID(), 550370 ); --�s�ά�
AddRecipe( OwnerID(), 550850 ); --������
AddRecipe( OwnerID(), 550894 ); --���
AddRecipe( OwnerID(), 550362 ); --������
AddRecipe( OwnerID(), 550382 ); --�����C
AddRecipe( OwnerID(), 550876 ); --���奨�C
AddRecipe( OwnerID(), 550353 ); --�s����
AddRecipe( OwnerID(), 550425 ); --���Է}�Y
AddRecipe( OwnerID(), 550825 ); --�ջȬ�
AddRecipe( OwnerID(), 550404 ); --�a����
AddRecipe( OwnerID(), 550837 ); --���i�C
AddRecipe( OwnerID(), 550393 ); --�}����
AddRecipe( OwnerID(), 550363 ); --���w�ԩ�
AddRecipe( OwnerID(), 550853 ); --�a�F��
AddRecipe( OwnerID(), 550416 ); --�M�h���C
AddRecipe( OwnerID(), 550384 ); --�K�b
AddRecipe( OwnerID(), 550356 ); --�s�_�P��
AddRecipe( OwnerID(), 550405 ); --�k�L��
AddRecipe( OwnerID(), 550364 ); --���
AddRecipe( OwnerID(), 550371 ); --�~����
AddRecipe( OwnerID(), 550385 ); --�оW�C
AddRecipe( OwnerID(), 550856 ); --�g�Ԥh��
AddRecipe( OwnerID(), 550879 ); --���K���C
AddRecipe( OwnerID(), 550427 ); --���a����

	
end

function Lua_110409_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end