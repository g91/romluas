------------------------------------------------------------------------------------
-- 武器店
------------------------------------------------------------------------------------
-- ZONE10 武器商人
function ZONE10_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600115 , "Test_Shop_Close" ); --瑞弗特
end
-- ZONE10 武器商人
function ZONE10_SMITH_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600123, "Test_Shop_Close" ); --艾爾恩
end
-- ZONE10 武器商人
function ZONE10_SMITH_SHOP_3()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600124 , "Test_Shop_Close" ); --艾爾恩杖
end
-- ZONE3 武器商人
function ZONE3_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600131, "Test_Shop_Close" );  --廢棄城寨武器
end
-- ZONE7 武器商人
function ZONE7_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600138, "Test_Shop_Close" );  --岩風村武器
end

------------------------------------------------------------------------------------
-- 防具店
------------------------------------------------------------------------------------

-- ZONE10 防具商人
function  Zone10_Armor1_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600116 , "Test_Shop_Close" );--瑞弗特甲
end

-- ZONE10 防具商人
function Zone10_Armor2_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600117, "Test_Shop_Close" );--瑞弗特服
end

-- ZONE10 防具商人
function Zone10_Armor3_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600126 , "Test_Shop_Close" );--艾爾恩甲
end

-- ZONE10 防具商人
function Zone10_Armor4_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600125, "Test_Shop_Close" );--艾爾恩服
end

-- ZONE11 防具商人
function Zone11_Armor1_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600067, "Test_Shop_Close" );--雷克鎮甲
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
-- ZONE3 防具商人
function Zone3_Armor1_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600132, "Test_Shop_Close" );--廢棄城寨甲
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
-- ZONE3 防具商人
function Zone3_Armor2_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600133, "Test_Shop_Close" );--廢棄城寨服
end

-- ZONE7 防具商人
function Zone7_Armor1_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600139, "Test_Shop_Close" );--岩風村甲
end
-- ZONE7 防具商人
function Zone7_Armor2_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600140, "Test_Shop_Close" );--岩風村服
end
------------------------------------------------------------------------------------
-- 雜貨店
------------------------------------------------------------------------------------

-- ZONE10 雜貨商人
function ZONE10_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600114, "Test_Shop_Close" ); --瑞弗特
end
-- ZONE10 雜貨商人
function ZONE10_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600122 , "Test_Shop_Close" ); --艾爾恩
end

-- 黑曜石前鋒隊
function LuaI_111095_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600111 , "Test_Shop_Close" );
end
-- 席格斯消耗品
function LuaI_111429_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600118 , "Test_Shop_Close" );
end

-- ZONE 3 
function ZONE3_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600130 , "Test_Shop_Close" ); --廢棄城寨道具
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
-- ZONE 3 
function ZONE3_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Food );
	SetShop( OwnerID() , 600129 , "Test_Shop_Close" ); --廢棄城寨酒店
end
-- ZONE 7
function ZONE7_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion  );
	SetShop( OwnerID() , 600137 , "Test_Shop_Close" ); --岩風村道具
end
-- ZONE 7
function ZONE7_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600141 , "Test_Shop_Close" ); --邦加湖道具+投擲武器
end