--------------------Z32_�����x�a_�ӤH�M��---------------------
-- �Z���ӤH	
function lua_ZONE32_Weapon()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600556 , "Test_Shop_Close" ); 
end

--------------------Z33_�O�����C��_�ӤH�M��---------------------
-- �˳ưӤH
function lua_ZONE33_Armor()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600579, "Test_Shop_Close" ); 
end

-- �Ĥ��ӤH	
function lua_ZONE33_Potion()	
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600578, "Test_Shop_Close" ); 
end
