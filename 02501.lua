--================================================================--
--			�@��ө�
--================================================================--

--��ܼ@���Τ@�� LuaS_ComShop
--��l�@�����H�U

function Zone21_Arrow()	--���Y
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600361, "Test_Shop_Close" );
end

function Zone21_items()	--���f
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600362, "Test_Shop_Close" );
end



--================================================================--
--			�t��ө�
--================================================================--

function LuaS_ZONE21_Formula()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--�ڷQ�ݬݧA�檺�t��C
end

--Lua_119286_RecipeList_Init --�s��
--Lua_119201_RecipeList_Init --���_
--Lua_119200_RecipeList_Init --�K��
--Lua_119082_RecipeList_Init --��u

--�W��4��   PID�ȶ�1���ոˡB��2����ˡB��3���Ÿ�



--Lua_119288_RecipeList_Init --�į�
--Lua_119289_RecipeList_Init --���q
--Lua_119290_RecipeList_Init --���
--Lua_119087_RecipeList_Init --�Ҫ�
--Lua_119088_RecipeList_Init --�i��



--================================================================--
function Lua_119286_RecipeList_Init()--�s��
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119286_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119286_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119286_03_RecipeList_Init",0) 
	end
end

function Lua_119201_RecipeList_Init() --���_
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119201_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119201_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119201_03_RecipeList_Init",0) 
	end
end

function Lua_119200_RecipeList_Init()--�K��
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119200_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119200_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119200_03_RecipeList_Init",0) 
	end
end

function Lua_119082_RecipeList_Init() --��u
	local XPID = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if XPID == 1 or  XPID == 0 then
		beginplot(OwnerID(),"Lua_119082_01_RecipeList_Init",0) 
	elseif XPID == 2 then
		beginplot(OwnerID(),"Lua_119082_02_RecipeList_Init",0) 
	elseif XPID == 3 then
		beginplot(OwnerID(),"Lua_119082_03_RecipeList_Init",0) 
	end
end
--================================================================--

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
--Lua_119290_RecipeList_Init --���
--Lua_119087_RecipeList_Init --�Ҫ�
--Lua_119088_RecipeList_Init --�i��

--================================================================--
function Lua_119286_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551754 ); --²�������M�a�s�ҽc,
	AddRecipe( OwnerID(), 551755 ); --��Χ����M�a�s�ҽc,
	AddRecipe( OwnerID(), 551756 ); --��o�����M�a�s�ҽc
	AddRecipe( OwnerID(), 551773 ); --�C���Z��
	AddRecipe( OwnerID(), 551774 ); --�C���Z��
	AddRecipe( OwnerID(), 551775 ); --�C���@�L
	AddRecipe( OwnerID(), 551776 ); --�ج����Y��
	AddRecipe( OwnerID(), 551777 ); --�ج��ھԥ�
	AddRecipe( OwnerID(), 551778 ); --�ج��ڿǤl
	AddRecipe( OwnerID(), 551779 ); --�q�|�ִU
	AddRecipe( OwnerID(), 551780 ); --�q�|�֦�
	AddRecipe( OwnerID(), 551781 ); --�q�|�ֿ�
end

function Lua_119286_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551799 ); --�j�ƥC���Z��
	AddRecipe( OwnerID(), 551800 ); --�j�ƥC���Z��
	AddRecipe( OwnerID(), 551801 ); --�j�ƥC���@�L
	AddRecipe( OwnerID(), 551802 ); --�j�Ƴج����Y��
	AddRecipe( OwnerID(), 551803 ); --�j�Ƴج��ھԥ�
	AddRecipe( OwnerID(), 551804 ); --�j�Ƴج��ڿǤl
	AddRecipe( OwnerID(), 551805 ); --�j���q�|�ִU
	AddRecipe( OwnerID(), 551806 ); --�j���q�|�֦�
	AddRecipe( OwnerID(), 551807 ); --�j���q�|�ֿ�
end

function Lua_119286_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551754 ); --²�������M�a�s�ҽc,
	AddRecipe( OwnerID(), 551755 ); --��Χ����M�a�s�ҽc,
	AddRecipe( OwnerID(), 551756 ); --��o�����M�a�s�ҽc
	AddRecipe( OwnerID(), 551773 ); --�C���Z��
	AddRecipe( OwnerID(), 551774 ); --�C���Z��
	AddRecipe( OwnerID(), 551775 ); --�C���@�L
	AddRecipe( OwnerID(), 551776 ); --�ج����Y��
	AddRecipe( OwnerID(), 551777 ); --�ج��ھԥ�
	AddRecipe( OwnerID(), 551778 ); --�ج��ڿǤl
	AddRecipe( OwnerID(), 551779 ); --�q�|�ִU
	AddRecipe( OwnerID(), 551780 ); --�q�|�֦�
	AddRecipe( OwnerID(), 551781 ); --�q�|�ֿ�
	AddRecipe( OwnerID(), 551799 ); --�j�ƥC���Z��
	AddRecipe( OwnerID(), 551800 ); --�j�ƥC���Z��
	AddRecipe( OwnerID(), 551801 ); --�j�ƥC���@�L
	AddRecipe( OwnerID(), 551802 ); --�j�Ƴج����Y��
	AddRecipe( OwnerID(), 551803 ); --�j�Ƴج��ھԥ�
	AddRecipe( OwnerID(), 551804 ); --�j�Ƴج��ڿǤl
	AddRecipe( OwnerID(), 551805 ); --�j���q�|�ִU
	AddRecipe( OwnerID(), 551806 ); --�j���q�|�֦�
	AddRecipe( OwnerID(), 551807 ); --�j���q�|�ֿ�
	AddRecipe( OwnerID(), 551825 );--�}���C���Z��
	AddRecipe( OwnerID(), 551826 );--�}���C���Z��
	AddRecipe( OwnerID(), 551827 );--�}���C���@�L
	AddRecipe( OwnerID(), 551828 );--�}���ج����Y��
	AddRecipe( OwnerID(), 551829 );--�}���ج��ھԥ�
	AddRecipe( OwnerID(), 551830 );--�}���ج��ڿǤl
	AddRecipe( OwnerID(), 551831 );--�}���q�|�ִU
	AddRecipe( OwnerID(), 551832 );--�}���q�|�֦�
	AddRecipe( OwnerID(), 551833 );--�}���q�|�ֿ�

end

function Lua_119201_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551751 ); --²�������M�a���_�c,
	AddRecipe( OwnerID(), 551752 ); --��Χ����M�a���_�c
	AddRecipe( OwnerID(), 551753 ); --��o�����M�a���_�c
	AddRecipe( OwnerID(), 551782 ); --�}���Y��
	AddRecipe( OwnerID(), 551783 ); --�}�ުk�T
	AddRecipe( OwnerID(), 551784 ); --�}���@�L
	AddRecipe( OwnerID(), 551785 ); --�ج��کܭ�
end

function Lua_119201_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551808 );--�j�Ƭ}���Y��
	AddRecipe( OwnerID(), 551809 );--�j�Ƭ}�ުk�T
	AddRecipe( OwnerID(), 551810 );--�j�Ƭ}���@�L
	AddRecipe( OwnerID(), 551811 );--�j�Ƴج��کܭ�
end

function Lua_119201_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551834 );--�}���}���Y��
	AddRecipe( OwnerID(), 551835 );--�}���}�ުk�T
	AddRecipe( OwnerID(), 551836 );--�}���}���@�L
	AddRecipe( OwnerID(), 551837 );--�}���ج��کܭ�
end

function Lua_119200_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551748 ); --²�������M�a�K��c,
	AddRecipe( OwnerID(), 551749 ); --��Χ����M�a�K��c
	AddRecipe( OwnerID(), 551750 ); --��o�����M�a�K��c
	AddRecipe( OwnerID(), 551786 ); --�ج��ڤ���
	AddRecipe( OwnerID(), 551787 ); --�����j�C
	AddRecipe( OwnerID(), 551788 ); --�Ǹo���C
	AddRecipe( OwnerID(), 551789 ); --�Ǹo����
	AddRecipe( OwnerID(), 551790 ); --�������
	AddRecipe( OwnerID(), 551791 ); --�ϫq����
	AddRecipe( OwnerID(), 551792 ); --�^�k����
	AddRecipe( OwnerID(), 551793 ); --���c�P��
end

function Lua_119200_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551812 );--�j�Ƴج��ڤ���
	AddRecipe( OwnerID(), 551813 );--�j�ƪ����j�C
	AddRecipe( OwnerID(), 551814 );--�j�ƥǸo���C
	AddRecipe( OwnerID(), 551815 );--�j�ƥǸo����
	AddRecipe( OwnerID(), 551816 );--�j�ƪ������
	AddRecipe( OwnerID(), 551817 );--�j�Ƥϫq����
	AddRecipe( OwnerID(), 551818 );--�j�Ʀ^�k����
	AddRecipe( OwnerID(), 551819 );--�j�ƥ��c�P��
end

function Lua_119200_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551748 ); --²�������M�a�K��c,
	AddRecipe( OwnerID(), 551749 ); --��Χ����M�a�K��c
	AddRecipe( OwnerID(), 551750 ); --��o�����M�a�K��c
	for i=0,7 do
		AddRecipe( OwnerID(), 551786+i )
	end
--	AddRecipe( OwnerID(), 551786 ); --�ج��ڤ���
--	AddRecipe( OwnerID(), 551787 ); --�����j�C
--	AddRecipe( OwnerID(), 551788 ); --�Ǹo���C
--	AddRecipe( OwnerID(), 551789 ); --�Ǹo����
--	AddRecipe( OwnerID(), 551790 ); --�������
--	AddRecipe( OwnerID(), 551791 ); --�ϫq����
--	AddRecipe( OwnerID(), 551792 ); --�^�k����
--	AddRecipe( OwnerID(), 551793 ); --���c�P��
	for i=0,7 do
		AddRecipe( OwnerID(), 551812 +i )
	end
--	AddRecipe( OwnerID(), 551812 );--�j�Ƴج��ڤ���
--	AddRecipe( OwnerID(), 551813 );--�j�ƪ����j�C
--	AddRecipe( OwnerID(), 551814 );--�j�ƥǸo���C
--	AddRecipe( OwnerID(), 551815 );--�j�ƥǸo����
--	AddRecipe( OwnerID(), 551816 );--�j�ƪ������
--	AddRecipe( OwnerID(), 551817 );--�j�Ƥϫq����
--	AddRecipe( OwnerID(), 551818 );--�j�Ʀ^�k����
--	AddRecipe( OwnerID(), 551819 );--�j�ƥ��c�P��
	for i=0,7 do
		AddRecipe( OwnerID(), 551838+i )
	end
--	AddRecipe( OwnerID(), 551838 );--�}���ج��ڤ���
--	AddRecipe( OwnerID(), 551839 );--�}�������j�C
--	AddRecipe( OwnerID(), 551840 );--�}���Ǹo���C
--	AddRecipe( OwnerID(), 551841 );--�}���Ǹo����
--	AddRecipe( OwnerID(), 551842 );--�}���������
--	AddRecipe( OwnerID(), 551843 );--�}���ϫq����
--	AddRecipe( OwnerID(), 551844 );--�}���^�k����
--	AddRecipe( OwnerID(), 551845 );--�}�����c�P��
end

function Lua_119082_01_RecipeList_Init()
	AddRecipe( OwnerID(), 551745 ); --²�������M�a��u�c,
	AddRecipe( OwnerID(), 551746 ); --��Χ����M�a��u�c
	AddRecipe( OwnerID(), 551747 ); --��o�����M�a��u�c
	AddRecipe( OwnerID(), 551794 ); --�ϫq���}
	AddRecipe( OwnerID(), 551795 ); --�^�k����
	AddRecipe( OwnerID(), 551796 ); --���c����
	AddRecipe( OwnerID(), 551797 ); --���c�v��
	AddRecipe( OwnerID(), 551798 ); --�������F
end

function Lua_119082_02_RecipeList_Init()
	AddRecipe( OwnerID(), 551820 );--�j�Ƥϫq���}
	AddRecipe( OwnerID(), 551821 );--�j�Ʀ^�k����
	AddRecipe( OwnerID(), 551822 );--�j�ƥ��c����
	AddRecipe( OwnerID(), 551823 );--�j�ƥ��c�v��
	AddRecipe( OwnerID(), 551824 );--�j�ƥ������F
end

function Lua_119082_03_RecipeList_Init()
	AddRecipe( OwnerID(), 551846 );--�}���ϫq���}
	AddRecipe( OwnerID(), 551847 );--�}���^�k����
	AddRecipe( OwnerID(), 551848 );--�}�����c����
	AddRecipe( OwnerID(), 551849 );--�}�����c�v��
	AddRecipe( OwnerID(), 551850 );--�}���������F
end

function Lua_119288_RecipeList_Init()
	AddRecipe( OwnerID(), 551757 ); --�]�OŢ���
	AddRecipe( OwnerID(), 551758 ); --�]�OŢ���
	AddRecipe( OwnerID(), 551759 ); --�]�OŢ��Ѩ��G
end

function Lua_119289_RecipeList_Init()
	AddRecipe( OwnerID(), 551762 ); --���������
	AddRecipe( OwnerID(), 551763 ); --���������
	AddRecipe( OwnerID(), 551764 ); --���������
end

function Lua_119290_RecipeList_Init()
	AddRecipe( OwnerID(), 551767 ); --�մ��̤��
	AddRecipe( OwnerID(), 551768 ); --�մ��̤��
	AddRecipe( OwnerID(), 551769 ); --�մ��̤쪩
end

function Lua_119087_RecipeList_Init()
	AddRecipe( OwnerID(), 551737 ); --�t�Īv���Ĥ�
	AddRecipe( OwnerID(), 551738 ); --�t���]�O�Ĥ�
end

function Lua_119088_RecipeList_Init()
	AddRecipe( OwnerID(), 551739 ); --��N�A��
	AddRecipe( OwnerID(), 551740 ); --�P�n���ѥ]
	AddRecipe( OwnerID(), 551741 ); --��N�ر�
	AddRecipe( OwnerID(), 551742 ); --�γJ�T���v
	AddRecipe( OwnerID(), 551743 ); --���o�J�|
	AddRecipe( OwnerID(), 551744 ); --�������J�O
end