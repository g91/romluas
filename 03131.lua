--------------------Z30_�d�F�R��_�ӤH�M��---------------------	
--�˳ưӤH	
function lua_ZONE30_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600540 , "Test_Shop_Close" ); 
end

-- �Ĥ��ӤH	
function lua_ZONE30_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600532 , "Test_Shop_Close" ); 
end

--���f�ӤH	
function lua_ZONE30_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600533 , "Test_Shop_Close" ); 
end

-- �Z���ӤH	
function lua_ZONE30_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600541 , "Test_Shop_Close" ); 
end