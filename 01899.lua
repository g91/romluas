--Zone16
function Az_Armor_Shop_zone16()-----------------------------競技場防具
	SetMinimapIcon(OwnerID(),EM_MapIconType_Armor)-------小地圖ICON設定為防具屋
	SetShop(OwnerID(),600221,"Test_Shop_Close");
end

function Az_food_shop_zone16()------------------------------競技場藥水
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------小地圖ICON設定為道具屋
	SetShop( OwnerID() , 600206 , "Test_Shop_Close" )
end

function Az_Goods_Shop_zone16()------------------------------競技場飾品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------小地圖ICON設定為道具屋
	SetShop( OwnerID() , 600223 , "Test_Shop_Close" )
end

--Zone17

function Az_food_shop_zone17()------------------------------佩謝神殿藥水
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------小地圖ICON設定為道具屋
	SetShop( OwnerID() , 600242 , "Test_Shop_Close" )
end

function Az_Recipe_shop_zone17()------------------------------佩謝神殿配方
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------小地圖ICON設定為道具屋
	SetShop( OwnerID() , 600241 , "Test_Shop_Close" )
end

function Az_Armor_Shop_Zone17()								--佩謝神殿防具
	SetMinimapIcon(OwnerID(),EM_MapIconType_Armor)			--小地圖ICON設定為防具屋
	SetShop(OwnerID(),600243,"Test_Shop_Close")				
end

function Az_Weapon_Shop_Zone17()							--佩謝神殿武器
	SetMinimapIcon(OwnerID(),EM_MapIconType_Weapon)		--武器屋
	SetShop(OwnerID(),600244,"Test_Shop_Close")		
end
	
function Az_StoneExchange_10_12()								--10~12精鍊屋
	OpenMagicStoneShop(207004,12,20000,100)
end

function Az_StoneExchange_open()								--開啟精鍊石視窗
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() ,"Az_StoneExchange_10_12",0)
end

function Az_StoneExchange_Zone17()								--Zone17精鍊石
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SO_WANTBUY]","Az_StoneExchange_open",0)
end

function Az_Armor_Shop_Zone18()								--卡沃克之墓防具
	SetMinimapIcon(OwnerID(),EM_MapIconType_Armor)			--小地圖ICON設定為防具屋
	SetShop(OwnerID(),600222,"Test_Shop_Close")				
end