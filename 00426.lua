function LuaI_110577_shop() 

	SetShop( OwnerID() , 600057 , "Test_Shop_Close" );--初始化商店

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_110577() 

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_WANTBUY") , "LuaS_110577_1", 0 ); --/我想看看你賣的東西
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaI_dindin_leave", 0 ); --/離開	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110577_1()
	CloseSpeak( OwnerID() ); 
	OpenShop()
end
