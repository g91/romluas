--�d�����D���X-Z-2�M�~�Żs�Ҿɮv
function Lua_110407_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110407_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550635 ); --�����@�L
AddRecipe( OwnerID(), 550592 ); --�D�Y�@�L
AddRecipe( OwnerID(), 550638 ); --�������
AddRecipe( OwnerID(), 550595 ); --�l�ߥ֥�
AddRecipe( OwnerID(), 550597 ); --�е��@�L
AddRecipe( OwnerID(), 550665 ); --�����H��
AddRecipe( OwnerID(), 550639 ); --�L���@�L
AddRecipe( OwnerID(), 550600 ); --�е��֥�
AddRecipe( OwnerID(), 550667 ); --���줧�Z
AddRecipe( OwnerID(), 550641 ); --�L�����
AddRecipe( OwnerID(), 550642 ); --�B���@�L
AddRecipe( OwnerID(), 550601 ); --�p����ִU
AddRecipe( OwnerID(), 550643 ); --�B�����
AddRecipe( OwnerID(), 550941 ); --��H��
AddRecipe( OwnerID(), 550670 ); --���K�Y��
AddRecipe( OwnerID(), 550603 ); --��J�@�L
AddRecipe( OwnerID(), 550646 ); --�����Y��
AddRecipe( OwnerID(), 550604 ); --����֥�
AddRecipe( OwnerID(), 550944 ); --�ջȪO���Z
AddRecipe( OwnerID(), 550647 ); --�֦a�@�L
AddRecipe( OwnerID(), 550605 ); --�����@�L
AddRecipe( OwnerID(), 550608 ); --�_�j�ִU
AddRecipe( OwnerID(), 550649 ); --�������
AddRecipe( OwnerID(), 550671 ); --����H��
AddRecipe( OwnerID(), 550609 ); --�v���@�L
AddRecipe( OwnerID(), 550931 ); --���@�L
AddRecipe( OwnerID(), 550672 ); --������Z
AddRecipe( OwnerID(), 550611 ); --�v���֥�
AddRecipe( OwnerID(), 550651 ); --�ѭ��@�L
AddRecipe( OwnerID(), 550675 ); --�����Y��
AddRecipe( OwnerID(), 550652 ); --�ɭ��Z��
AddRecipe( OwnerID(), 550731 ); --�շt�H��
AddRecipe( OwnerID(), 550654 ); --�ѭ����
AddRecipe( OwnerID(), 550660 ); --�ɭ��H��
AddRecipe( OwnerID(), 550659 ); --�ɯP�Y��
AddRecipe( OwnerID(), 550613 ); --�g���@�L
AddRecipe( OwnerID(), 550734 ); --�շt���Z
AddRecipe( OwnerID(), 550661 ); --����@�L
AddRecipe( OwnerID(), 550615 ); --�g���֥�
AddRecipe( OwnerID(), 550618 ); --�N�ХִU
AddRecipe( OwnerID(), 550663 ); --������
AddRecipe( OwnerID(), 550737 ); --���z�Y��
AddRecipe( OwnerID(), 550619 ); --�l���@�L
	
end

function Lua_110407_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
end