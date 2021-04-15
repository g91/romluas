--------------------Z30_卡沙愛蘭_商人清單---------------------	
--裝備商人	
function lua_ZONE30_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600540 , "Test_Shop_Close" ); 
end

-- 藥水商人	
function lua_ZONE30_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600532 , "Test_Shop_Close" ); 
end

--雜貨商人	
function lua_ZONE30_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600533 , "Test_Shop_Close" ); 
end

-- 武器商人	
function lua_ZONE30_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600541 , "Test_Shop_Close" ); 
end