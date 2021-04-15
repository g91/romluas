--------------------Z32_裂水台地_商人清單---------------------
-- 武器商人	
function lua_ZONE32_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600556 , "Test_Shop_Close" ); 
end

--------------------Z33_費泰爾丘陵_商人清單---------------------
-- 裝備商人
function lua_ZONE33_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600579, "Test_Shop_Close" ); 
end

-- 藥水商人	
function lua_ZONE33_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600578, "Test_Shop_Close" ); 
end
