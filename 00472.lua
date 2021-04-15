------------------------------------------------------------------------------------
-- 武器店
------------------------------------------------------------------------------------
-- 新手村_商人
function Newbie_Weapon_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600018 , "Test_Shop_Close" );
end

function Zone1_Pet_Shop()
	SetShop( OwnerID() , 600119 , "Test_Shop_Close" );
end

-- ZONE1鐵匠舖
function ZONE1_SMITH_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600014 , "Test_Shop_Close" );
end

-- 凡城武器店消耗性武器
function LuaI_110563_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600034 , "Test_Shop_Close" );
end

-- 凡城武器店一般性武器
function LuaI_110564_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600035 , "Test_Shop_Close" );
end

-- ZONE3鐵匠舖
function ZONE3_SMITH_SHOP()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( ObjID , 600014 , "Test_Shop_Close" );
	Test_Shop_Open() --開啟商店介面
end

-- 野外武器店消耗性武器
function LuaI_110739_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600043 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- 防具店
------------------------------------------------------------------------------------
-- 新手村_商人
function Newbie_Armor_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600021 , "Test_Shop_Close" );
end

-- 新手村_商人
function Newbie_Cloth_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600059 , "Test_Shop_Close" );
end

-- ZONE1衣飾商人
function ZONE1_CLOTH_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600015 , "Test_Shop_Close" );
end

-- ZONE1甲胄商人
function ZONE1_ARMOR_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600016 , "Test_Shop_Close" );
end

-- 凡城防具店布衣商
function LuaI_110565_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600036 , "Test_Shop_Close" );
end

-- 凡城防具店披風與盾商
function LuaI_110566_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600037 , "Test_Shop_Close" );
end

-- 凡城防具店法袍商
function LuaI_110567_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600038 , "Test_Shop_Close" );
end

-- 凡城防具店皮甲商
function LuaI_110568_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600039 , "Test_Shop_Close" );
end

-- 凡城防具店鎖甲商
function LuaI_110569_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600040 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- 雜貨店
------------------------------------------------------------------------------------
-- 新手村_商人
function Newbie_Goods_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600017 , "Test_Shop_Close" );
end

-- ZONE1雜貨商人
function ZONE1_GOODS_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600013 , "Test_Shop_Close" );
end

-- 新手村_雜貨商B
function Newbie_Goods_Shop_B()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600021 , "Test_Shop_Close" );
	SetPlot( OwnerID() , "Touch" , "Test_Shop_Open" ,40);
end

------------------------------------------------------------------------------------
-- 魔法商店
------------------------------------------------------------------------------------
-- 新手村波特符文商店
function Lua_110490_shop() 
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Magic);
	SetShop( OwnerID() , 600032 , "Test_Shop_Close" );
end
-- 凡城符文商店
function LuaI_110575_shop() 
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Magic);
	SetShop( OwnerID() , 600055 , "Test_Shop_Close" );
end

-- 羅格鎮與凡瑞娜絲城分解師
function LuaInit_110600()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Magic );
	SetShop( OwnerID() , 600058 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- 藥水
------------------------------------------------------------------------------------
-- 凡城魔法店藥水商
function LuaI_110573_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600044 , "Test_Shop_Close" );
end
------------------------------------------------------------------------------------
-- 精煉配方
------------------------------------------------------------------------------------
-- 凡城打鐵精煉配方商人
function Lua_updata1_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600020, "Test_Shop_Close" );
end

-- 凡城裁縫精煉配方商人
function Lua_updata2_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600022, "Test_Shop_Close" );
end

-- 凡城煉金精煉配方商人
function Lua_updata3_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600023 , "Test_Shop_Close" );
end

-- 凡城製甲精煉配方商人
function Lua_updata4_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600052 , "Test_Shop_Close" );
end

-- 凡城木工精煉配方商人
function Lua_updata5_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600053 , "Test_Shop_Close" );
end

-- 凡城烹飪精煉配方商人
function Lua_updata6_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600054, "Test_Shop_Close" );
end

--凡城新手裝備
function Lua_BasicEQ_Shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  );
	SetShop( OwnerID() , 600142, "Test_Shop_Close" );
end
