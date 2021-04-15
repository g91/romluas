------------------------------------------------------------------------------------
-- 武器店
------------------------------------------------------------------------------------
-- ZONE12 武器商人
function ZONE12_SMITH_NEWBIE()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600144 , "Test_Shop_Close" ); --出征之所
end

function ZONE12_SMITH()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600148, "Test_Shop_Close" ); --遠行之點
end

-- ZONE8 武器商人
function ZONE8_WEAPON_A()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600152 , "Test_Shop_Close" ); --綠之塔
end

-- ZONE9 武器商人
function ZONE9_WEAPON_A()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600159 , "Test_Shop_Close" ); --英雄村
end

------------------------------------------------------------------------------------
-- 防具店
------------------------------------------------------------------------------------

-- ZONE12 防具商人
function  Zone12_Armor1_NEWBIE() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600146, "Test_Shop_Close" );--出征之所服
end
function  Zone12_Armor2_NEWBIE() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600145, "Test_Shop_Close" );--出征之所甲
end

function  Zone12_Armor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600149, "Test_Shop_Close" );--遠行之點
end

--ZONE8 防具商人
function  Zone8_Armor_A() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600153, "Test_Shop_Close" );--綠之塔甲
end
function  Zone8_Armor_B() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600154, "Test_Shop_Close" );--綠之塔服
end

--ZONE9 防具商人
function  Zone9_Armor_A() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600160, "Test_Shop_Close" );--英雄村甲
end
function  Zone9_Armor_B() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600161, "Test_Shop_Close" );--英雄村服
end

------------------------------------------------------------------------------------
-- 雜貨店
------------------------------------------------------------------------------------

-- ZONE12 雜貨商人
function ZONE12_GOODS_NEWBIE()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600143, "Test_Shop_Close" ); --出征之所
end
function ZONE12_GOODS()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600147, "Test_Shop_Close" ); --遠行之點
end

-- ZONE8 中繼村藥水商人
function ZONE8_GOODS()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600151, "Test_Shop_Close" ); --綠之塔
end
-- ZONE8 雜貨商人
function ZONE8_GOODS_WILD()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600155, "Test_Shop_Close" ); --原生之地
end

-- ZONE9 中繼村藥水商人
function ZONE9_GOODS()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600158, "Test_Shop_Close" ); --英雄村
end
-- ZONE9 雜貨商人
function ZONE9_GOODS_WILD()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600162, "Test_Shop_Close" ); --奧圖拉傑火山
end

-- Zone9 交易所
function LuaI_113526()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_AuctionHouse );
end
function LuaS_113526()
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENAC") , "LuaS_110770_OpenAC" , 0 )	-- 開啟交易所
end