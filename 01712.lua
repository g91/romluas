------------------------------------------------------------------------------------
-- 武器店
------------------------------------------------------------------------------------
-- ZONE15 鐵製武器商人 含投擲武器
function ZONE15_Smith()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600191 , "Test_Shop_Close" ); --
end
-- ZONE15 消耗性武器商人
function ZONE15_Arrow()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600193, "Test_Shop_Close" ); 
end
-- ZONE15 木製武器商人 含箭矢
function ZONE15_Carpenter()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600192 , "Test_Shop_Close" ); --
end
-- ZONE15 綜合武器商人
function ZONE15_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600197 , "Test_Shop_Close" ); --
end
-- ZONE16 武器商人
function ZONE16_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600211 , "Test_Shop_Close" ); --
end
-- ZONE17 武器商人
function ZONE17_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600229 , "Test_Shop_Close" ); --
end

------------------------------------------------------------------------------------
-- 防具店
------------------------------------------------------------------------------------

-- ZONE15重甲防具商人 含盾牌
function  Zone15_HeaveArmor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600194, "Test_Shop_Close" );--
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 114361 then
		SetDefIdleMotion( OwnerID() , ruFUSION_MIME_GATHER_LOOP )
	end
end
-- ZONE15輕甲防具商人
function  Zone15_LightArmor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600195, "Test_Shop_Close" );--
end
-- ZONE15服飾防具商人
function  Zone15_Cloth() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600196, "Test_Shop_Close" );--
end

-- ZONE16 甲冑商人
function  Zone16_Armor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600212 , "Test_Shop_Close" );--
end

-- ZONE16 服飾商人
function  Zone16_Cloth() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600213 , "Test_Shop_Close" );--
end

-- ZONE17 甲冑商人
function  Zone17_Armor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600230 , "Test_Shop_Close" );--
end

-- ZONE17 服飾商人
function  Zone17_Cloth() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600231 , "Test_Shop_Close" );--
end
------------------------------------------------------------------------------------
-- 雜貨店
------------------------------------------------------------------------------------

-- ZONE15 雜貨商人
function ZONE15_Goods()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600190 , "Test_Shop_Close" ); 
end
-- ZONE15 藥水商人
function ZONE15_Potion()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600189 , "Test_Shop_Close" ); 
end

-- ZONE16 雜貨商人
function ZONE16_Goods()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600210 , "Test_Shop_Close" ); 
end
-- ZONE16 藥水商人
function ZONE16_Potion()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600209 , "Test_Shop_Close" ); 
end
-- ZONE17 雜貨商人
function ZONE17_Goods()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600228 , "Test_Shop_Close" ); 
end

-- ZONE17 藥水商人
function ZONE17_Potion()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600227 , "Test_Shop_Close" ); 
end