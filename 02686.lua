function cl_VCity_Magic_Stone_Shop() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MAGIC_STONE_WEAPON]" , "cl_VCity_Magic_Stone_Weapon", 0 ); --/�ڷQ�ݬݧA�檺�Z�������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MAGIC_STONE_ARMOR]" , "cl_VCity_Magic_Stone_Armor", 0 ); --/�ڷQ�ݬݧA�檺��������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_MAGIC_STONE_JEWELRY]" , "cl_VCity_Magic_Stone_Jewelry", 0 ); --/�ڷQ�ݬݧA�檺���~�����
end
function cl_VCity_Magic_Stone_Weapon()
	CloseSpeak( OwnerID() );  --������ܵ���
	SetShop( TargetID() , 600393 , "Test_Shop_Close" )
	OpenShop()
end
function cl_VCity_Magic_Stone_Armor()
	CloseSpeak( OwnerID() );  --������ܵ���
	SetShop( TargetID() , 600394 , "Test_Shop_Close" )
	OpenShop()
end
function cl_VCity_Magic_Stone_Jewelry()
	CloseSpeak( OwnerID() );  --������ܵ���
	SetShop( TargetID() , 600395 , "Test_Shop_Close" )
	OpenShop()
end