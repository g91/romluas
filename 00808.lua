--����-Z-2���ɮv
function Lua_110163_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110163_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550051 ); --�t��-�����
AddRecipe( OwnerID(), 550052 ); --�t��-�h���
AddRecipe( OwnerID(), 550053 ); --�t��-�����
AddRecipe( OwnerID(), 550054 ); --�t��-����
AddRecipe( OwnerID(), 550055 ); --�t��-�C���Q��
AddRecipe( OwnerID(), 550056 ); --�t��-�V�C���
AddRecipe( OwnerID(), 550057 ); --�t��-�������
AddRecipe( OwnerID(), 550058 ); --�t��-�𴵪L�]���
AddRecipe( OwnerID(), 550059 ); --�t��-�s�_�����
--AddRecipe( OwnerID(), 550060 ); --�t��-�j�F����
AddRecipe( OwnerID(), 550061 ); --�t��-�����
AddRecipe( OwnerID(), 550062 ); --�t��-�h���
AddRecipe( OwnerID(), 550063 ); --�t��-�����
AddRecipe( OwnerID(), 550064 ); --�t��-����
AddRecipe( OwnerID(), 550065 ); --�t��-�C���Q��
AddRecipe( OwnerID(), 550066 ); --�t��-�V�C���
AddRecipe( OwnerID(), 550067 ); --�t��-�������
AddRecipe( OwnerID(), 550068 ); --�t��-�𴵪L�]���
AddRecipe( OwnerID(), 550069 ); --�t��-�s�_�����
--AddRecipe( OwnerID(), 550070 ); --�t��-�j�F����
AddRecipe( OwnerID(), 550186 ); --�t��-���a����
AddRecipe( OwnerID(), 550187 ); --�t��-�a�îڤ��
AddRecipe( OwnerID(), 550188 ); --�t��-�d�~����
AddRecipe( OwnerID(), 550189 ); --�t��-�sŽ�ڤ��
AddRecipe( OwnerID(), 550190 ); --�t��-�t����
AddRecipe( OwnerID(), 550191 ); --�t��-������
--AddRecipe( OwnerID(), 550192 ); --�t��-���j���
AddRecipe( OwnerID(), 550193 ); --�t��-���a����
AddRecipe( OwnerID(), 550194 ); --�t��-�a�îڤ��
AddRecipe( OwnerID(), 550195 ); --�t��-�d�~����
AddRecipe( OwnerID(), 550196 ); --�t��-�sŽ�ڤ��
AddRecipe( OwnerID(), 550197 ); --�t��-�t����
AddRecipe( OwnerID(), 550198 ); --�t��-������
--AddRecipe( OwnerID(), 550199 ); --�t��-���j���
AddRecipe( OwnerID(), 550200 ); --�t��-���a���O
AddRecipe( OwnerID(), 550201 ); --�t��-�a�îڤ�O
AddRecipe( OwnerID(), 550202 ); --�t��-�d�~���O
AddRecipe( OwnerID(), 550203 ); --�t��-�sŽ�ڤ�O
AddRecipe( OwnerID(), 550204 ); --�t��-�t���O
AddRecipe( OwnerID(), 550205 ); --�t��-�����O
--AddRecipe( OwnerID(), 550206 ); --�t��-���j��O

--2013/03/26 ���Ƿs�W�t�� ��51��
	
AddRecipe( OwnerID(), 552337   ); --	�t��-�����	1
AddRecipe( OwnerID(), 552338   ); --	�t��-����O	1
AddRecipe( OwnerID(), 552339   ); --	�t��-���a����	1
AddRecipe( OwnerID(), 552340   ); --	�t��-���a���O	1
AddRecipe( OwnerID(), 552341   ); --	�t��-�h���	8
AddRecipe( OwnerID(), 552342   ); --	�t��-�h��O	8
AddRecipe( OwnerID(), 552343   ); --	�t��-�a�îڤ��	11
AddRecipe( OwnerID(), 552344   ); --	�t��-�a�îڤ�O	11
AddRecipe( OwnerID(), 552345   ); --	�t��-�����	14
AddRecipe( OwnerID(), 552346   ); --	�t��-����O	14
AddRecipe( OwnerID(), 552347   ); --	�t��-����	20
AddRecipe( OwnerID(), 552348   ); --	�t��-���O	20
AddRecipe( OwnerID(), 552349   ); --	�t��-�d�~����	21
AddRecipe( OwnerID(), 552350   ); --	�t��-�d�~���O	21
AddRecipe( OwnerID(), 552351   ); --	�t��-�C���Q��	26
AddRecipe( OwnerID(), 552352   ); --	�t��-�C���Q�O	26
AddRecipe( OwnerID(), 552353   ); --	�t��-�sŽ�ڤ��	31
AddRecipe( OwnerID(), 552354   ); --	�t��-�sŽ�ڤ�O	31
AddRecipe( OwnerID(), 552355   ); --	�t��-�V�C���	32
AddRecipe( OwnerID(), 552356   ); --	�t��-�V�C��O	32
AddRecipe( OwnerID(), 552357   ); --	�t��-�������	38
AddRecipe( OwnerID(), 552358   ); --	�t��-������O	38
AddRecipe( OwnerID(), 552359   ); --	�t��-�t����	41
AddRecipe( OwnerID(), 552360   ); --	�t��-�t���O	41
AddRecipe( OwnerID(), 552361   ); --	�t��-�𴵪L�]���	44
AddRecipe( OwnerID(), 552362   ); --	�t��-�𴵪L�]��O	44
AddRecipe( OwnerID(), 552363   ); --	�t��-�s�_�����	51
AddRecipe( OwnerID(), 552364   ); --	�t��-�s�_����O	51
AddRecipe( OwnerID(), 552365   ); --	�t��-������	51
AddRecipe( OwnerID(), 552366   ); --	�t��-�����O	51

end

function Lua_110163_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end