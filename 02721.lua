---------------------�@��ө��A��l�@��---------------------
function lua_ZONE24_Potion()	-- �Ĥ��ӤH
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600419 , "Test_Shop_Close" ); 
end
function lua_ZONE24_Weapon()	-- �Z���ӤH
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600420 , "Test_Shop_Close" ); 
end
function lua_ZONE24_HeavyArmor()	--��������ӤH+�޵P
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600421 , "Test_Shop_Close" ); 
end
function lua_ZONE24_LightArmor()	--��+��+�ܭ�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600422 , "Test_Shop_Close" ); 
end
function lua_ZONE24_Shop()	--���f
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600436 , "Test_Shop_Close" ); 
end
-- �Ҫ����ưӱ��o�� LuaI_110993_shop
-- �i�����ưӱ��o�� LuaI_110992_shop