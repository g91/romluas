--------------------Z26_薩烏洛_商人清單---------------------	
-- 藥水商人	
function lua_ZONE26_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600467 , "Test_Shop_Close" ); 
end	
-- 武器商人	
function lua_ZONE26_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600420 , "Test_Shop_Close" ); 
end	
--重型防具商人	
function lua_ZONE26_HeavyArmor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600468 , "Test_Shop_Close" ); 
end	
--輕型防具商人	
function lua_ZONE26_LightArmor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600469 , "Test_Shop_Close" ); 
end	
--雜貨商人	
function lua_ZONE26_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600470 , "Test_Shop_Close" ); 
end
