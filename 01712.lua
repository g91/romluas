------------------------------------------------------------------------------------
-- �Z����
------------------------------------------------------------------------------------
-- ZONE15 �K�s�Z���ӤH �t���Y�Z��
function ZONE15_Smith()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600191 , "Test_Shop_Close" ); --
end
-- ZONE15 ���өʪZ���ӤH
function ZONE15_Arrow()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600193, "Test_Shop_Close" ); 
end
-- ZONE15 ��s�Z���ӤH �t�b��
function ZONE15_Carpenter()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600192 , "Test_Shop_Close" ); --
end
-- ZONE15 ��X�Z���ӤH
function ZONE15_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600197 , "Test_Shop_Close" ); --
end
-- ZONE16 �Z���ӤH
function ZONE16_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600211 , "Test_Shop_Close" ); --
end
-- ZONE17 �Z���ӤH
function ZONE17_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600229 , "Test_Shop_Close" ); --
end

------------------------------------------------------------------------------------
-- ���㩱
------------------------------------------------------------------------------------

-- ZONE15���Ҩ���ӤH �t�޵P
function  Zone15_HeaveArmor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600194, "Test_Shop_Close" );--
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 114361 then
		SetDefIdleMotion( OwnerID() , ruFUSION_MIME_GATHER_LOOP )
	end
end
-- ZONE15���Ҩ���ӤH
function  Zone15_LightArmor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600195, "Test_Shop_Close" );--
end
-- ZONE15�A������ӤH
function  Zone15_Cloth() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600196, "Test_Shop_Close" );--
end

-- ZONE16 �ҫ`�ӤH
function  Zone16_Armor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600212 , "Test_Shop_Close" );--
end

-- ZONE16 �A���ӤH
function  Zone16_Cloth() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600213 , "Test_Shop_Close" );--
end

-- ZONE17 �ҫ`�ӤH
function  Zone17_Armor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600230 , "Test_Shop_Close" );--
end

-- ZONE17 �A���ӤH
function  Zone17_Cloth() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600231 , "Test_Shop_Close" );--
end
------------------------------------------------------------------------------------
-- ���f��
------------------------------------------------------------------------------------

-- ZONE15 ���f�ӤH
function ZONE15_Goods()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600190 , "Test_Shop_Close" ); 
end
-- ZONE15 �Ĥ��ӤH
function ZONE15_Potion()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600189 , "Test_Shop_Close" ); 
end

-- ZONE16 ���f�ӤH
function ZONE16_Goods()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600210 , "Test_Shop_Close" ); 
end
-- ZONE16 �Ĥ��ӤH
function ZONE16_Potion()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600209 , "Test_Shop_Close" ); 
end
-- ZONE17 ���f�ӤH
function ZONE17_Goods()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600228 , "Test_Shop_Close" ); 
end

-- ZONE17 �Ĥ��ӤH
function ZONE17_Potion()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600227 , "Test_Shop_Close" ); 
end