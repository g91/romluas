--================================================================--
--			�@��ө�
--================================================================--

--��ܼ@���Τ@�� LuaS_ComShop
--��l�@�����H�U

function Zone22_items()		--���f
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600368, "Test_Shop_Close" );
end

function Zone22_HeaveArmor_01()	--����_�Z��
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600369, "Test_Shop_Close" );
end

function Zone22_HeaveArmor_02()	--����_���
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600370, "Test_Shop_Close" );
end

function Zone22_LightArmor()		--����_�֥�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600371, "Test_Shop_Close" );
end

function Zone22_Cloth()		--�A��
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600372, "Test_Shop_Close" );
end

function Zone22_AllWeapon()		--��X�Z��
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600373, "Test_Shop_Close" );
end


--================================================================--
--			�t��ө�
--================================================================--
--�Ѧ�ZONE 21�A��l�@�����H�U

--Lua_119286_RecipeList_Init --�s��
--Lua_119201_RecipeList_Init --���_
--Lua_119200_RecipeList_Init --�K��
--Lua_119082_RecipeList_Init --��u

--�W��4��   PID�ȶ�1���ոˡB��2����ˡB��3���Ÿ�

--Lua_119286_01_RecipeList_Init --�s�ҥո�
--Lua_119201_01_RecipeList_Init --���_�ո�
--Lua_119200_01_RecipeList_Init --�K��ո�
--Lua_119082_01_RecipeList_Init --��u�ո�

--Lua_119286_02_RecipeList_Init --�s�Һ��
--Lua_119201_02_RecipeList_Init --���_���
--Lua_119200_02_RecipeList_Init --�K����
--Lua_119082_02_RecipeList_Init --��u���

--Lua_119286_03_RecipeList_Init --�s���Ÿ�
--Lua_119201_03_RecipeList_Init --���_�Ÿ�
--Lua_119200_03_RecipeList_Init --�K���Ÿ�
--Lua_119082_03_RecipeList_Init --��u�Ÿ�

--Lua_119288_RecipeList_Init --�į�
--Lua_119289_RecipeList_Init --���q
--Lua_119290_1_RecipeList_Init--���
--Lua_119087_RecipeList_Init --�Ҫ�
--Lua_119088_RecipeList_Init --�i��

--================================================================--
function Zone22_HighReFineStone() --������ҥ�
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600388,"Test_Shop_Close")
end

function Lua_119290_1_RecipeList_Init()	--z22���t��ӤH
	local Recipe = {
			551767	,--�t��-�մ��̤��	66
			551768	,--�t��-�մ��̤��	66
			551769	,--�t��-�մ��̤�O	66
			--551770	,--�t��-��s�մ��̤�O	66
			--551771	,--�t��-���ſմ��̤�O	66
			551887	,--�t��-���h�ȧ����	75
			551888	,--�t��-���h�ȧ����	75
			551889	,--�t��-���h�ȧ���O	75
			--551890	,--�t��-��s���h�ȧ���O	75
			--551891	,--�t��-���Ŧ��h�ȧ���O	75
			551902	,--�t��-�۪Q���	71
			551903	,--�t��-�۪Q���	71
			551904	,--�t��-�۪Q��O	71
			--551905	,--�t��-��s�۪Q��O	71
			--551906	--�t��-���ť۪Q��O	71

			--2013/03/26 ���Ƿs�W�t�� 66�ū�
			552373 , --	�t��-�մ��̤��	66
			552374 , --	�t��-�մ��̤�O	66
			552375 , --	�t��-�۪Q���	71
			552376 , --	�t��-�۪Q��O	71
			552377 , --	�t��-���h�ȧ����	75
			552378  --	�t��-���h�ȧ���O	75
			}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119288_1_RecipeList_Init()	--z22.23�į�t��ӤH
	local Recipe = {
		551757	,--�t��-�]�OŢ���	66
		551758	,--�t��-�]�OŢ���	66
		551759	,--�t��-�]�OŢ��Ѩ��G	66
	--	551760	,--�t��-�]�OŢ��¤ƲG	66
	--	551761	,--�t��-�]�OŢ���زG	66
		551882	,--�t��-�p�ḭ���	75
		551883	,--�t��-�p�ḭ���	75
		551884	,--�t��-�p�ḭ��Ѩ��G	75
	--	551885	,--�t��-�p�ḭ��¤ƲG	75
	--	551886	,--�t��-�p�ḭ���زG	75
		551897	,--�t��-�������	71
		551898	,--�t��-�������	71
		551899	,--�t��-������Ѩ��G	71
	--	551900	,--�t��-������¤ƲG	71
	--	551901	--�t��-�������زG	71

		--2013/03/26 ���Ƿs�W�t�� 66�ū�
		552415   ,--	�t��-�]�OŢ���	66
		552416   ,--	�t��-�]�OŢ��Ѩ��G	66
		552417   ,--	�t��-�������	71
		552418   ,--	�t��-������Ѩ��G	71
		552419   ,--	�t��-�p�ḭ���	75
		552420   --	�t��-�p�ḭ��Ѩ��G	75
			}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119289_1_RecipeList_Init()	--z22.23���q�t��ӤH
	local Recipe = {
		551762,--	�t��-���������	66
		551763,--	�t��-���������	66
		551764,--	�t��-���������	66
		--551765,--	�t��-�f�嵵�������	66
		--551766,--	�t��-�Ť嵵�������	66
		551892,--	�t��-�X�ǩ��۬�	75
		551893,--	�t��-�X�ǩ��۶�	75
		551894,--	�t��-�X�ǩ��ۿ�	75
		--551895,--	�t��-�f��X�ǩ��ۿ�	75
		--551896,--	�t��-�Ť�X�ǩ��ۿ�	75
		551907,--	�t��-���ǵ�����	71
		551908,--	�t��-���ǵ�����	71
		551909,--	�t��-���ǵ�����	71
		--551910,--	�t��-�f�嵲�ǵ�����	71
		--551911,--	�t��-�Ť嵲�ǵ�����	71

		--2013/03/26 ���Ƿs�W�t�� 66�ū�
		552331  , --	�t��-���������	66
		552332  , --	�t��-���������	66
		552335  , --	�t��-���ǵ�����	71
		552336  , --	�t��-���ǵ�����	71
		552333  , --	�t��-�X�ǩ��۶�	75
		552334   --	�t��-�X�ǩ��ۿ�	75
			}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119087_1_RecipeList_Init()	--�Ĥ��t��
	local Recipe = {
			551737,--	�t��-�t�Īv���Ĥ�	70
			551738,--	�t��-�t���]�O�Ĥ�	70
			552031,--	�t��-���F�v���u��	75
			552032, --	�t��-ë���]�O�u��	75
			552293 ,--	�t��-�����ľ�	�Ҫ�	78
			552294 ,--	�t��-���t�ľ�	�Ҫ�	78
			552280 ,--	�t��-���֪v���Ĥ�	�Ҫ�	80
			552281 --	�t��-�����]�O�Ĥ�	�Ҫ�	80
				}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119088_1_RecipeList_Init()	--�i���t��
	local Recipe = {
			551739,	--70	�t��-��N�A��
			551740,	--70	�t��-�P�n���ѥ]
			551741,	--70	�t��-��N�ر�
			551742,	--70	�t��-�γJ�T���v
			551743,	--70	�t��-���o�J�|
			551744,	--70	�t��-�������J�O
			552033,	--75	�t��-���p�{�N�ѥ]
			552034,	--75	�t��-�d�h�T���v
			552035,	--75	�t��-���t����
			552036,	--75	�t��-���t�ر�
			552037,	--75	�t��-�Q�ڥ��J�O
			552038,	--75	�t��-���e�J�|
			552282,--	�t��-���ߥ��J�O	�i��	80
			552283,--	�t��-�ߪG�J�|	�i��	80
			552284,--	�t��-�[���ѥ]	�i��	80
			552285,--	�t��-�ߪG�T���v	�i��	80
			552286,--	�t��-�p���M��	�i��	80
			552287--	�t��-���Φر�	�i��	80
				}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end

end