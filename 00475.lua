------------------------------------------------------------------------------------
-- 武器店
------------------------------------------------------------------------------------
-- ZONE4 武器商人
function ZONE4_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600063 , "Test_Shop_Close" ); --銀瀑村
end
-- ZONE4 武器商人
function ZONE4_SMITH_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600064 , "Test_Shop_Close" ); --麥酒旅店
end

-- ZONE5 武器商人
function ZONE5_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600071 , "Test_Shop_Close" ); --哈洛夫
end
-- ZONE5 武器商人
function ZONE5_SMITH_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600064 , "Test_Shop_Close" ); --奇拉爾
end

-- 黑曜武器店消耗性武器
function LuaI_110863_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600095 , "Test_Shop_Close" );
end

-- 黑曜武器店一般性武器
function LuaI_110862_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600096 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- 防具店
------------------------------------------------------------------------------------

-- ZONE4防具商人
function  Zone4_Armor1_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600067 , "Test_Shop_Close" );--銀瀑村鎖
end

-- ZONE4防具商人
function Zone4_Armor2_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600065 , "Test_Shop_Close" );--銀瀑村服
end

-- ZONE4防具商人
function Zone4_Armor3_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600068 , "Test_Shop_Close" );--麥酒鎖
end

-- ZONE4防具商人
function Zone4_Armor4_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600066 , "Test_Shop_Close" );--麥酒服
end

-- ZONE5防具商人
function  Zone5_Armor1_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600075 , "Test_Shop_Close" );--哈洛夫鎖
end

-- ZONE5防具商人
function Zone5_Armor2_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600073 , "Test_Shop_Close" );--哈洛夫服
end

-- ZONE5防具商人
function Zone5_Armor3_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600076 , "Test_Shop_Close" );--奇拉爾鎖
end

-- ZONE5防具商人
function Zone5_Armor4_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600074 , "Test_Shop_Close" );--奇拉爾服
end
-- 黑曜防具店布衣商
function LuaI_110864_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600097 , "Test_Shop_Close" );
end

-- 黑曜防具店披風與盾商
function LuaI_110867_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600098 , "Test_Shop_Close" );
end

-- 黑曜防具店法袍商
function LuaI_110871_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600099 , "Test_Shop_Close" );
end

-- 黑曜防具店皮甲商
function LuaI_110868_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600100, "Test_Shop_Close" );
end

-- 黑曜防具店鎖甲商
function LuaI_110866_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600101, "Test_Shop_Close" );
end

-- 黑曜防具店鎧甲商
function LuaI_110865_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600102 , "Test_Shop_Close" );
end
------------------------------------------------------------------------------------
-- 藥水
------------------------------------------------------------------------------------
-- 黑曜魔法店藥水商
function LuaI_110870_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600105 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- 雜貨店
------------------------------------------------------------------------------------

-- 奇拉納營地雜貨商奧塔德
function LuaI_110039_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop ); --雜貨店
	SetShop( OwnerID() , 600060 , "Test_Shop_Close" );
end
-- ZONE4 雜貨商人
function ZONE4_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600061, "Test_Shop_Close" ); --銀瀑村
end
-- ZONE4 雜貨商人
function ZONE4_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600062 , "Test_Shop_Close" ); --麥酒旅店
end
-- ZONE5 雜貨商人
function ZONE5_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600069, "Test_Shop_Close" ); --哈洛夫
end
-- ZONE5 雜貨商人
function ZONE5_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600070 , "Test_Shop_Close" ); --奇拉爾
end
--海波拉古城商人
function HighBora_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600128 , "Test_Shop_Close" ); --艾力克支援者
end

--海波拉古城商人
function HighBora_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600150 , "Test_Shop_Close" ); --艾力克支援者
end

--ZONE5
function LuaI_110276()
	SetShop( OwnerID() , 600077 , "Test_Shop_Close" ); --彼拉多
end

--洛可洛可
function LuaI_110875()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion);
	SetShop( OwnerID() , 600107 , "Test_Shop_Close" )
end
-- 卡沙喀消耗武器
function LuaI_110404_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600108 , "Test_Shop_Close" );
end

-- 卡沙喀消耗品
function LuaI_110940_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion);
	SetShop( OwnerID() , 600109 , "Test_Shop_Close" );
end

-- 紅谷走私商人
function LuaI_110939_shop()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
	SetShop( OwnerID() , 600110 , "Test_Shop_Close" );
end
------------------------------------------------------------------------------------
-- 採集原料
------------------------------------------------------------------------------------
-- 煉金材料商
function LuaI_110993_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600041 , "Test_Shop_Close" );
end

-- 製甲材料商
function LuaI_110994_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600042 , "Test_Shop_Close" );
end

-- 烹飪材料商
function LuaI_110992_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600045 , "Test_Shop_Close" );
end

-- 打鐵材料商
function LuaI_110997_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600103, "Test_Shop_Close" );
end

-- 木工材料商
function LuaI_110996_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600104 , "Test_Shop_Close" );
end

-- 裁縫材料商
function LuaI_110995_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600106 , "Test_Shop_Close" );
end


------------------------------------------------------------------------------------

-- 桌椅類家具商人
function LuaFunc_Shop_HomeFT1()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600087 , "Test_Shop_Close" );
end
-- 床櫃類家具商人
function LuaFunc_Shop_HomeFT2()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600089 , "Test_Shop_Close" );
end
-- 裝飾類家具商人
function LuaFunc_Shop_HomeFT3()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600090 , "Test_Shop_Close" );
end
-- 空間類家具商人
function LuaFunc_Shop_HomeFT4()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600091 , "Test_Shop_Close" );
end
-- 總合類家具商人
function LuaFunc_Shop_HomeFT5()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600092 , "Test_Shop_Close" );
end
