---------------------一般商店，初始劇情---------------------
function lua_ZONE24_Potion()	-- 藥水商人
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600419 , "Test_Shop_Close" ); 
end
function lua_ZONE24_Weapon()	-- 武器商人
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600420 , "Test_Shop_Close" ); 
end
function lua_ZONE24_HeavyArmor()	--重型防具商人+盾牌
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600421 , "Test_Shop_Close" ); 
end
function lua_ZONE24_LightArmor()	--皮+布+披風
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600422 , "Test_Shop_Close" ); 
end
function lua_ZONE24_Shop()	--雜貨
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600436 , "Test_Shop_Close" ); 
end
-- 煉金材料商掛這個 LuaI_110993_shop
-- 烹飪材料商掛這個 LuaI_110992_shop