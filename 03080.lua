--------------------Z28_赫特克叢林_商人清單---------------------	
--裝備商人	
function lua_ZONE28_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600498 , "Test_Shop_Close" ); 
end	
-- 藥水商人	
function lua_ZONE28_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600499 , "Test_Shop_Close" ); 
end	
--雜貨商人	
function lua_ZONE28_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600500 , "Test_Shop_Close" ); 
end