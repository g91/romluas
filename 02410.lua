
--��ܼ@���Τ@�� LuaS_ComShop
--��l�@�����H�U
--�K�s�Z��
function Zone20_Weapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600325, "Test_Shop_Close" );
end
--��s�Z��
function Zone20_Carpenter()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600326, "Test_Shop_Close" );
end
--���өʪZ��
function Zone20_Arrow()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600327, "Test_Shop_Close" );
end
--����--�Z�B��
function Zone20_HeaveArmor()--����
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600328, "Test_Shop_Close" );
end
--����--��
function Zone20_LightArmor()--����
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600329, "Test_Shop_Close" );
end
--�A��--��
function Zone20_Cloth()--�A��
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600330, "Test_Shop_Close" );
end
--��X�Z��
function Zone20_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600331, "Test_Shop_Close" );
end
--�Z�ҰӤH
function Zone20_HeaveArmor_A() --�Z��
SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600332, "Test_Shop_Close" );
end
--��ҰӤH
function Zone20_HeaveArmor_B() --���
SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600333, "Test_Shop_Close" );
end

----SHOP
function Ashley_Zone20_Potion()--�Ĥ�
	SetMinimapIcon (OwnerID(),EM_MapIconType_Potion)
	SetShop(OwnerID(),600323,"Test_Shop_Close")
end

function Ashley_Zone20_Other()--���f
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600324,"Test_Shop_Close")
end

function Ashley_Zone20_Meat_Shop() --�׫~
	SetMinimapIcon(OwnerID(),EM_MapIconType_Mat)
	SetShop(OwnerID(),600322,"Test_Shop_Close")
end
--���u�a�U���S��Үv
function Zone20_HighReFineStone() --������ҥ�
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600343,"Test_Shop_Close")
end
--�e�ﯸ���f�ӡA�[����ȹD��
function Zone20_Outpost_Other()
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600340,"Test_Shop_Close")
end
--================================================================--

-- �Ҫ����ư� LuaI_110993_shop()

-- �i�����ư� LuaI_110992_shop()

--================================================================--

-- ������a��ӤH LuaFunc_Shop_HomeFT1

-- ���d���a��ӤH LuaFunc_Shop_HomeFT2

-- �˹����a��ӤH LuaFunc_Shop_HomeFT3

-- �Ŷ����a��ӤH LuaFunc_Shop_HomeFT4

-- �`�X���a��ӤH LuaFunc_Shop_HomeFT5
--================================================================--
--�t��ӤH
--��ܼ@���i�Τ@��
function LuaS_ZONE20_Formula()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--�ڷQ�ݬݧA�檺�t��C
end
--��l�@����--�H�U�Ѧ�ZONE15
--���K--Lua_115954_RecipeList_Init
--��u--Lua_115957_RecipeList_Init
--�s��--Lua_115956_RecipeList_Init
--���_--Lua_115959_RecipeList_Init
--�i��--Lua_115958_RecipeList_Init
--���--Lua_115955_RecipeList_Init
--���q--Lua_115960_RecipeList_Init
--���--Lua_115961_RecipeList_Init
--����--Lua_115962_RecipeList_Init