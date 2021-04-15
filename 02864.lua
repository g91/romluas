--------------------Z25_希爾卑特隘口_商人清單---------------------	
-- 藥水商人	
function lua_ZONE25_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600419 , "Test_Shop_Close" ); 
end	
-- 武器商人	
function lua_ZONE25_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600420 , "Test_Shop_Close" ); 
end	
--重型防具商人	
function lua_ZONE25_HeavyArmor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600421 , "Test_Shop_Close" ); 
end	
--輕型防具商人	
function lua_ZONE25_LightArmor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600422 , "Test_Shop_Close" ); 
end	
--裝備商人	
function lua_ZONE25_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600456 , "Test_Shop_Close" ); 
end	
--雜貨商人	
function lua_ZONE25_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600436 , "Test_Shop_Close" ); 
end	