function LuaI_110577_shop() 

	SetShop( OwnerID() , 600057 , "Test_Shop_Close" );--��l�ưө�

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_110577() 

	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_WANTBUY") , "LuaS_110577_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaI_dindin_leave", 0 ); --/���}	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110577_1()
	CloseSpeak( OwnerID() ); 
	OpenShop()
end
