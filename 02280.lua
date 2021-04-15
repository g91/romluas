----------------ZONE19------------------------
function cl_Hsiang_ExchangeStone_shop()-------------------------------------------------賣溶解石的
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang_ExchangeStone_open", 0 )
end
function cl_Hsiang_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------關閉視窗
	BeginPlot( OwnerID() ,"cl_Hsiang_ExchangeStone_11_13",0)
end
function cl_Hsiang_ExchangeStone_11_13()--------------開啟8-10精煉屋
	OpenMagicStoneShop(207004,13, 22400 , 140 )
end
function cl_shop_117669() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Armor_Shop_zone19()--------------------------------簡單格拉夫裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600270 , "Test_Shop_Close" )
end
function cl_shop_117670() ---賣配方的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Formula_Shop_zone19()--------------------------------賣高級配方的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600271 , "Test_Shop_Close" )
end
function cl_shop_117668() ---賣藥水的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_food_Shop_zone19()--------------------------------賣高級藥水的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600272 , "Test_Shop_Close" )
end

function cl_World_warshop_118202() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_World_war_Shop_zone19()--------------------------------簡單格拉夫裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600321 , "Test_Shop_Close" )
end
function cl_shop_120542_NewWeapon() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Armor_Shop_zone19_NewWeapon()--------------------------------簡單格拉夫裝備
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600224 , "Test_Shop_Close" )
end
---------ZONE20------------------------
function cl_Hsiang20_ExchangeStone_shop()-------------------------------------------------賣溶解石的
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang20_ExchangeStone_open", 0 )
end
function cl_Hsiang20_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------關閉視窗
	BeginPlot( OwnerID() ,"cl_Hsiang20_ExchangeStone_11_13",0)
end
function cl_Hsiang20_ExchangeStone_11_13()--------------開啟8-10精煉屋
	OpenMagicStoneShop(207004,13, 22400 , 140 )
end
function cl_shop20_118889() ---賣食物藥水的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_food_Shop_zone20()--------------------------------賣食物藥水的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600341 , "Test_Shop_Close" )
end
function cl_shop20_118890() ---賣裝備的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Armor_Shop20_zone20()--------------------------------賣裝備的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600342 , "Test_Shop_Close" )
end
---------------------Z21黑色狩獵商店----------------------------
function cl_Hsiang21_ExchangeStone_shop()-------------------------------------------------賣溶解石的
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang21_ExchangeStone_open", 0 )
end
function cl_Hsiang21_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------關閉視窗
	BeginPlot( OwnerID() ,"cl_Hsiang21_ExchangeStone_12_14",0)
end
function cl_Hsiang21_ExchangeStone_12_14()--------------開啟8-10精煉屋
	OpenMagicStoneShop(207004,14, 22400 , 180 )
end
function cl_shop21_119206() ---賣裝備的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Armor_Shop_zone21()--------------------------------賣裝備的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600358 , "Test_Shop_Close" )
end
function cl_shop21_119207() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Weapon_Shop_zone21()--------------------------------賣武器的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600359 , "Test_Shop_Close" )
end
function cl_shop21_119209() ---賣藥水的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_food_Shop21_zone19()--------------------------------賣藥水的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600357 , "Test_Shop_Close" )
end

function cl_Formula21_119208() ---賣配方
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Formula_Shop_zone21()--------------------------------賣配方
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600360 , "Test_Shop_Close" )
end
function cl_shop21_120543_NewWeapon() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Weapon_Shop_zone21_NewWeapon()--------------------------------賣武器的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600389 , "Test_Shop_Close" )
end
-------------------------------------Z22永恆法陣
function cl_Hsiang22_ExchangeStone_shop()-------------------------------------------------賣溶解石的
	LoadQuestOption( OwnerID() )---------------------寫入人物敘述
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang22_ExchangeStone_open", 0 )
end
function cl_Hsiang22_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------關閉視窗
	BeginPlot( OwnerID() ,"cl_Hsiang22_ExchangeStone_12_14",0)
end
function cl_Hsiang22_ExchangeStone_12_14()--------------開啟8-10精煉屋
	OpenMagicStoneShop(207004,14, 22400 , 180 )
end

function cl_shop22_120353() ---賣裝備的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Armor_Shop_zone22()--------------------------------賣裝備的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600379 , "Test_Shop_Close" )
end

function cl_shop22_120354() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_Weapon_Shop_zone22()--------------------------------賣武器的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600380 , "Test_Shop_Close" )
end

function cl_shop22_120355() ---賣藥水的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end
function cl_food_Shop22_zone22()--------------------------------賣藥水的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600378 , "Test_Shop_Close" )
end