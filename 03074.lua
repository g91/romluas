--------------------Z27_哀嚎峽灣_商人清單---------------------	
-- 武器商人	
function lua_ZONE27_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600489 , "Test_Shop_Close" ); 
end	
--裝備商人	
function lua_ZONE27_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600490 , "Test_Shop_Close" ); 
end	
--雜貨商人	
function lua_ZONE27_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600491 , "Test_Shop_Close" ); 
end