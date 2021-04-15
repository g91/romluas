----------------------------------------------------------------------------
--↓先遣者虛華
----------------------------------------------------------------------------
function YoYo_AncientDreamSpace_NPC119545()	--法寶
	SetSpeakDetail( OwnerID() , "[ADS_NPC119545]" )
	AddSpeakOption( OwnerID() , TargetID() , "[ADS_SHOP_MAGICTOOLS]" , "YoYo_ADS_NPC119545_Shop1" , 5 )	--法寶
end

function YoYo_ADS_NPC119545_Shop1()
	SetShop( TargetID() , 600320 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end
----------------------------------------------------------------------------
--↓先遣者蜃樓
----------------------------------------------------------------------------
function YoYo_AncientDreamSpace_NPC119546() --武器商人
	SetSpeakDetail( OwnerID() , "[ADS_NPC119546]" )
	AddSpeakOption( OwnerID() , TargetID() , "[ADS_SHOP_00]" , "YoYo_ADS_NPC119546_Shop1" , 5 )	--武器
end

function YoYo_ADS_NPC119546_Shop1()
	SetShop( TargetID() , 600267 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end
----------------------------------------------------------------------------
--↓先遣者詭譎
----------------------------------------------------------------------------
function YoYo_AncientDreamSpace_NPC119547()	--防具商人
	local NPC = OwnerID()
	local Player = TargetID()
	SetSpeakDetail( NPC , "[ADS_NPC119547]" )
	AddSpeakOption( NPC , Player , "[ADS_SHOP_01]" , "YoYo_ADS_NPC119547_Shop1" , 5 )	--鎧甲
	AddSpeakOption( NPC , Player , "[ADS_SHOP_02]" , "YoYo_ADS_NPC119547_Shop2" , 5 )	--鎖甲
	AddSpeakOption( NPC , Player , "[ADS_SHOP_03]" , "YoYo_ADS_NPC119547_Shop3" , 5 )	--皮甲
	AddSpeakOption( NPC , Player , "[ADS_SHOP_04]" , "YoYo_ADS_NPC119547_Shop4" , 5 )	--布衣法傷
	AddSpeakOption( NPC , Player , "[ADS_SHOP_05]" , "YoYo_ADS_NPC119547_Shop5" , 5 )	--布衣治療
end

function YoYo_ADS_NPC119547_Shop1()
	SetShop( TargetID() , 600478 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end

function YoYo_ADS_NPC119547_Shop2()
	SetShop( TargetID() , 600479 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end

function YoYo_ADS_NPC119547_Shop3()
	SetShop( TargetID() , 600480 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end

function YoYo_ADS_NPC119547_Shop4()
	SetShop( TargetID() , 600481 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end

function YoYo_ADS_NPC119547_Shop5()
	SetShop( TargetID() , 600482 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end