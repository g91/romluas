--���`_���K_110808_�j�Q
function Lua_110808_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110808_RecipeList_Touch" , 60 );
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
AddRecipe( OwnerID(), 550418 ); --���ڪ��M
AddRecipe( OwnerID(), 550830 ); --���`��
AddRecipe( OwnerID(), 550406 ); --����
AddRecipe( OwnerID(), 550811 ); --�g�A��
AddRecipe( OwnerID(), 550396 ); --�@�Ъ�
AddRecipe( OwnerID(), 550841 ); --��C
AddRecipe( OwnerID(), 550421 ); --�p��C
AddRecipe( OwnerID(), 550899 ); --�ջȾ���
AddRecipe( OwnerID(), 550357 ); --�B���u�C
AddRecipe( OwnerID(), 550365 ); --�Z�M�h��
AddRecipe( OwnerID(), 550374 ); --���K����
AddRecipe( OwnerID(), 550797 ); --����P��
AddRecipe( OwnerID(), 550872 ); --���ʩ�
AddRecipe( OwnerID(), 550883 ); --���a�C
AddRecipe( OwnerID(), 550430 ); --�}��
AddRecipe( OwnerID(), 550388 ); --�ȳ��C
AddRecipe( OwnerID(), 550859 ); --������
AddRecipe( OwnerID(), 550397 ); --�}������
AddRecipe( OwnerID(), 551229 ); --���	
AddRecipe( OwnerID(), 551230 ); --��ߪ�	
AddRecipe( OwnerID(), 551233 ); --�����b��	
AddRecipe( OwnerID(), 551239 ); --�y���P��	
AddRecipe( OwnerID(), 551245 ); --�������C	
AddRecipe( OwnerID(), 551251 ); --���F��	
AddRecipe( OwnerID(), 551254 ); --��y����	
AddRecipe( OwnerID(), 551303 ); --��������	

end

function Lua_110808_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end