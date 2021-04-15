function cl_VCity_Magic_Stone_Shop() ---賣武器的
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MAGIC_STONE_WEAPON]" , "cl_VCity_Magic_Stone_Weapon", 0 ); --/我想看看你賣的武器精鍊石
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MAGIC_STONE_ARMOR]" , "cl_VCity_Magic_Stone_Armor", 0 ); --/我想看看你賣的防具精鍊石
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MAGIC_STONE_JEWELRY]" , "cl_VCity_Magic_Stone_Jewelry", 0 ); --/我想看看你賣的飾品精鍊石
end
function cl_VCity_Magic_Stone_Weapon()
	CloseSpeak( OwnerID() );  --關閉對話視窗
	SetShop( TargetID() , 600393 , "Test_Shop_Close" )
	OpenShop()
end
function cl_VCity_Magic_Stone_Armor()
	CloseSpeak( OwnerID() );  --關閉對話視窗
	SetShop( TargetID() , 600394 , "Test_Shop_Close" )
	OpenShop()
end
function cl_VCity_Magic_Stone_Jewelry()
	CloseSpeak( OwnerID() );  --關閉對話視窗
	SetShop( TargetID() , 600395 , "Test_Shop_Close" )
	OpenShop()
end