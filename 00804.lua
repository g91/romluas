--�ڸ��S-Z-2���q�ɮv
function Lua_110017_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110017_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550001 ); --�t��-���ɬ�
AddRecipe( OwnerID(), 550002 ); --�t��-����
AddRecipe( OwnerID(), 550003 ); --�t��-���K��
AddRecipe( OwnerID(), 550004 ); --�t��-���ɬ�
AddRecipe( OwnerID(), 550005 ); --�t��-���
AddRecipe( OwnerID(), 550006 ); --�t��-�ջȬ�
AddRecipe( OwnerID(), 550007 ); --�t��-���K��
AddRecipe( OwnerID(), 550008 ); --�t��-���Ȭ�
AddRecipe( OwnerID(), 550009 ); --�t��-�`�W���Ȭ�
--AddRecipe( OwnerID(), 550010 ); --�t��-�Ť���`��
AddRecipe( OwnerID(), 550011 ); --�t��-���ɶ�
AddRecipe( OwnerID(), 550012 ); --�t��-����
AddRecipe( OwnerID(), 550013 ); --�t��-���K��
AddRecipe( OwnerID(), 550014 ); --�t��-���ɶ�
AddRecipe( OwnerID(), 550015 ); --�t��-���
AddRecipe( OwnerID(), 550016 ); --�t��-�ջȶ�
AddRecipe( OwnerID(), 550017 ); --�t��-���K��
AddRecipe( OwnerID(), 550018 ); --�t��-���ȶ�
AddRecipe( OwnerID(), 550019 ); --�t��-�`�W���ȶ�
--AddRecipe( OwnerID(), 550020 ); --�t��-�Ť���`��
AddRecipe( OwnerID(), 550151 ); --�t��-���K�Ь�
AddRecipe( OwnerID(), 550152 ); --�t��-�ŦB�۬�
AddRecipe( OwnerID(), 550153 ); --�t��-�j������
AddRecipe( OwnerID(), 550154 ); --�t��-���Q������
AddRecipe( OwnerID(), 550155 ); --�t��-�̴����|��
AddRecipe( OwnerID(), 550156 ); --�t��-�H��������
--AddRecipe( OwnerID(), 550157 ); --�t��-����������
AddRecipe( OwnerID(), 550158 ); --�t��-���K�ж�
AddRecipe( OwnerID(), 550159 ); --�t��-�ŦB�۶�
AddRecipe( OwnerID(), 550160 ); --�t��-�j������
AddRecipe( OwnerID(), 550161 ); --�t��-���Q������
AddRecipe( OwnerID(), 550162 ); --�t��-�̴����|��
AddRecipe( OwnerID(), 550163 ); --�t��-�H��������
--AddRecipe( OwnerID(), 550164 ); --�t��-����������

--2013/03/26 ���Ƿs�W�t�� ��51��

AddRecipe( OwnerID(), 552295  ); --	�t��-���ɶ�	1
AddRecipe( OwnerID(), 552296  ); --	�t��-���ɿ�	1
AddRecipe( OwnerID(), 552323  ); --	�t��-���K�ж�	1
AddRecipe( OwnerID(), 552324  ); --	�t��-���K�п�	1
AddRecipe( OwnerID(), 552297  ); --	�t��-����	8
AddRecipe( OwnerID(), 552298  ); --	�t��-����	8
AddRecipe( OwnerID(), 552321  ); --	�t��-�ŦB�۶�	11
AddRecipe( OwnerID(), 552322  ); --	�t��-�ŦB�ۿ�	11
AddRecipe( OwnerID(), 552299  ); --	�t��-���K��	14
AddRecipe( OwnerID(), 552300  ); --	�t��-���K��	14
AddRecipe( OwnerID(), 552301  ); --	�t��-���ɶ�	20
AddRecipe( OwnerID(), 552302  ); --	�t��-���ɿ�	20
AddRecipe( OwnerID(), 552311  ); --	�t��-�j������	21
AddRecipe( OwnerID(), 552312  ); --	�t��-�j������	21
AddRecipe( OwnerID(), 552303  ); --	�t��-���	26
AddRecipe( OwnerID(), 552304  ); --	�t��-���	26
AddRecipe( OwnerID(), 552319  ); --	�t��-���Q������	31
AddRecipe( OwnerID(), 552320  ); --	�t��-���Q������	31
AddRecipe( OwnerID(), 552305  ); --	�t��-�ջȶ�	32
AddRecipe( OwnerID(), 552306  ); --	�t��-�ջȿ�	32
AddRecipe( OwnerID(), 552307  ); --	�t��-���K��	38
AddRecipe( OwnerID(), 552308  ); --	�t��-���K��	38
AddRecipe( OwnerID(), 552315  ); --	�t��-�̴����|��	41
AddRecipe( OwnerID(), 552316  ); --	�t��-�̴����|��	41
AddRecipe( OwnerID(), 552309  ); --	�t��-���ȶ�	44
AddRecipe( OwnerID(), 552310  ); --	�t��-���ȿ�	44
AddRecipe( OwnerID(), 552313  ); --	�t��-�`�W���ȶ�	51
AddRecipe( OwnerID(), 552314  ); --	�t��-�`�W���ȿ�	51
AddRecipe( OwnerID(), 552325  ); --	�t��-�H��������	51
AddRecipe( OwnerID(), 552326  ); --	�t��-�H��������	51
	
end

function Lua_110017_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end