--------------------Z28_���S�J�O�L_�ӤH�M��---------------------	
--�˳ưӤH	
function lua_ZONE28_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600498 , "Test_Shop_Close" ); 
end	
-- �Ĥ��ӤH	
function lua_ZONE28_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600499 , "Test_Shop_Close" ); 
end	
--���f�ӤH	
function lua_ZONE28_Shop()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600500 , "Test_Shop_Close" ); 
end