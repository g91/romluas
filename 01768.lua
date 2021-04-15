function bk_Hsiang_ExchangeStone_shop()-------------------------------------------------設定成為精鍊屋
---	SetMinimapIcon ( OwnerID(), 102 );------------------------設定成為精鍊屋
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "bk_Hsiang_ExchangeStone_open", 0 )
end
function bk_Hsiang_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------關閉視窗
	BeginPlot( OwnerID() ,"bk_Hsiang_ExchangeStone_8_10",0)
end
function bk_Hsiang_ExchangeStone_8_10()--------------開啟8-10精煉屋
	OpenMagicStoneShop(207004,10, 8000 , 30 )
end
function bk_shop_114821()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end

function bk_Weapon_Shop_zone7()--------------------------------簡單海音武器
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600201 , "Test_Shop_Close" )
end
function bk_Goods_Shop_zone7()--------------------------------簡單海音飾品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600199 , "Test_Shop_Close" )
end
function bk_Armor_Shop_zone7()--------------------------------簡單海音裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600200 , "Test_Shop_Close" );
end
function bk_food_shop_zone7()--------------------------------簡單海音藥水食物
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600202 , "Test_Shop_Close" );
end
function bk_insArmor_Shop_zone7()--------------------------------簡單海音套裝裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600207 , "Test_Shop_Close" );
end

function bk_Weapon_Shop_zone8()--------------------------------簡單遺民武器	
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600203 , "Test_Shop_Close" )
end
function bk_Goods_Shop_zone8()--------------------------------簡單遺民飾品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600205 , "Test_Shop_Close" )
end
function bk_Armor_Shop_zone8()--------------------------------簡單遺民裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600204 , "Test_Shop_Close" )
end
function bk_food_shop_zone8()--------------------------------簡單遺民藥水食物
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600206 , "Test_Shop_Close" )
end
function bk_insArmor_Shop_zone8()--------------------------------簡單遺民裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600208 , "Test_Shop_Close" )
end
function bk_206880_3_5()
	local player=OwnerID()
	local need=1
	local needbag=Check_Bag_Space( player , need  )
	local Luck=DW_Rand(100)
	if (Luck >= 0 and Luck < 33) then
		YOYO_GetTokenValue( 2, 3);--古代遺物
	elseif (Luck >= 33 and Luck < 66) then 
		YOYO_GetTokenValue( 2, 4);--古代遺物
	elseif (Luck >= 66 and Luck < 101) then 
		YOYO_GetTokenValue( 2, 5);--古代遺物
	end
end
function bk_207052_5_8()
	local player=OwnerID()
	local need=1
	local needbag=Check_Bag_Space( player , need  )
	local Luck=DW_Rand(100)
	if (Luck >= 0 and Luck < 25) then
		YOYO_GetTokenValue( 2, 5);--古代遺物
	elseif (Luck >= 25 and Luck < 50) then 
		YOYO_GetTokenValue( 2, 6);--古代遺物
	elseif (Luck >= 50 and Luck < 75) then 
		YOYO_GetTokenValue( 2, 7);--古代遺物
	elseif (Luck >= 75 and Luck < 101) then 
		YOYO_GetTokenValue( 2, 8);--古代遺物
	end
end
function bk_207053_9_12()
	local player=OwnerID()
	local need=1
	local needbag=Check_Bag_Space( player , need  )
	local Luck=DW_Rand(100)
	if (Luck >= 0 and Luck < 25) then
		YOYO_GetTokenValue( 2, 9);--古代遺物
	elseif (Luck >= 25 and Luck < 50) then 
		YOYO_GetTokenValue( 2, 10);--古代遺物
	elseif (Luck >= 50 and Luck < 75) then 
		YOYO_GetTokenValue( 2, 11);--古代遺物
	elseif (Luck >= 75 and Luck < 101) then 
		YOYO_GetTokenValue( 2, 12);--古代遺物
	end
end
function bk_gold1_shop_zone7()-------------------------------換取商城物品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600215 , "Test_Shop_Close" )
end
function bk_gold2_shop_zone7()-------------------------------換取商城物品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600216 , "Test_Shop_Close" )
end

function bk_Weapon_Shop_zone15()-----15冷門武器
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600219 , "Test_Shop_Close" )
end
function bk_Goods_Shop_zone15()-----15裝備是品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600220 , "Test_Shop_Close" )
end
function bk_food_shop_zone15()--------------------------------15藥水食物
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600206 , "Test_Shop_Close" )
end