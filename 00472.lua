------------------------------------------------------------------------------------
-- �Z����
------------------------------------------------------------------------------------
-- �s���_�ӤH
function Newbie_Weapon_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600018 , "Test_Shop_Close" );
end

function Zone1_Pet_Shop()
	SetShop( OwnerID() , 600119 , "Test_Shop_Close" );
end

-- ZONE1�K�K�E
function ZONE1_SMITH_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600014 , "Test_Shop_Close" );
end

-- �Z���Z�������өʪZ��
function LuaI_110563_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600034 , "Test_Shop_Close" );
end

-- �Z���Z�����@��ʪZ��
function LuaI_110564_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600035 , "Test_Shop_Close" );
end

-- ZONE3�K�K�E
function ZONE3_SMITH_SHOP()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( ObjID , 600014 , "Test_Shop_Close" );
	Test_Shop_Open() --�}�Ұө�����
end

-- ���~�Z�������өʪZ��
function LuaI_110739_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600043 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- ���㩱
------------------------------------------------------------------------------------
-- �s���_�ӤH
function Newbie_Armor_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600021 , "Test_Shop_Close" );
end

-- �s���_�ӤH
function Newbie_Cloth_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600059 , "Test_Shop_Close" );
end

-- ZONE1�繢�ӤH
function ZONE1_CLOTH_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600015 , "Test_Shop_Close" );
end

-- ZONE1�ҭH�ӤH
function ZONE1_ARMOR_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600016 , "Test_Shop_Close" );
end

-- �Z�����㩱�����
function LuaI_110565_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600036 , "Test_Shop_Close" );
end

-- �Z�����㩱�ܭ��P�ް�
function LuaI_110566_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600037 , "Test_Shop_Close" );
end

-- �Z�����㩱�k�T��
function LuaI_110567_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600038 , "Test_Shop_Close" );
end

-- �Z�����㩱�֥Ұ�
function LuaI_110568_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600039 , "Test_Shop_Close" );
end

-- �Z�����㩱��Ұ�
function LuaI_110569_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600040 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- ���f��
------------------------------------------------------------------------------------
-- �s���_�ӤH
function Newbie_Goods_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600017 , "Test_Shop_Close" );
end

-- ZONE1���f�ӤH
function ZONE1_GOODS_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600013 , "Test_Shop_Close" );
end

-- �s���_���f��B
function Newbie_Goods_Shop_B()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600021 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" ,40);
end

------------------------------------------------------------------------------------
-- �]�k�ө�
------------------------------------------------------------------------------------
-- �s����i�S�Ť�ө�
function Lua_110490_shop() 
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Magic);
	SetShop( OwnerID() , 600032 , "Test_Shop_Close" );
end
-- �Z���Ť�ө�
function LuaI_110575_shop() 
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Magic);
	SetShop( OwnerID() , 600055 , "Test_Shop_Close" );
end

-- ù����P�Z��R�������Ѯv
function LuaInit_110600()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Magic );
	SetShop( OwnerID() , 600058 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- �Ĥ�
------------------------------------------------------------------------------------
-- �Z���]�k���Ĥ���
function LuaI_110573_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600044 , "Test_Shop_Close" );
end
------------------------------------------------------------------------------------
-- ��Ұt��
------------------------------------------------------------------------------------
-- �Z�����K��Ұt��ӤH
function Lua_updata1_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600020, "Test_Shop_Close" );
end

-- �Z�����_��Ұt��ӤH
function Lua_updata2_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600022, "Test_Shop_Close" );
end

-- �Z���Ҫ���Ұt��ӤH
function Lua_updata3_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600023 , "Test_Shop_Close" );
end

-- �Z���s�Һ�Ұt��ӤH
function Lua_updata4_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600052 , "Test_Shop_Close" );
end

-- �Z����u��Ұt��ӤH
function Lua_updata5_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600053 , "Test_Shop_Close" );
end

-- �Z���i����Ұt��ӤH
function Lua_updata6_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600054, "Test_Shop_Close" );
end

--�Z���s��˳�
function Lua_BasicEQ_Shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  );
	SetShop( OwnerID() , 600142, "Test_Shop_Close" );
end
