function LuaSpeak_110000()


	SetSpeakDetail( OwnerID(),GetString("ST_110068_1") ); 
		
	--ScriptMessage( OwnerID(), OwnerID(), 0, GetString("MSG_GET_ARMOR_FORMULA2"), C_SYSTEM);

	LoadQuestOption( OwnerID() );	-- ���J�� NPC ������ ( �]�A��ܤΥ��� )
	--AddSpeakOption( OwnerID(), TargetID( ), "SO_110000_1" , "LuaSO_110000_1", 0 );
	--if CheckFlag( OwnerID() , 540751 ) == true then  
	--	AddSpeakOption( OwnerID(), TargetID( ), "����_1_���}" , "LuaSO_110000_1", 4 );
	--end
	--AddSpeakOption( OwnerID(), TargetID( ), "����_2_�ө�" , "LuaSO_110000_1", 5 );
	--AddSpeakOption( OwnerID(), TargetID( ), "����_3_12345678901234567890123456789012345678901234567890" , "LuaSO_110000_1", 0 );
	--AddSpeakOption( OwnerID(), TargetID( ), "����_4_12345678901234567890123456789012345678901234567890" , "LuaSO_110000_1", 0 );
	--AddSpeakOption( OwnerID(), TargetID( ), "����_5_12345678901234567890123456789012345678901234567890" , "LuaSO_110000_1", 0 );
	--AddSpeakOption( OwnerID(), TargetID( ), "����_6_12345678901234567890123456789012345678901234567890" , "LuaSO_110000_1", 0 );
	--AddSpeakOption( OwnerID(), TargetID( ), "����_7_12345678901234567890123456789012345678901234567890" , "LuaSO_110000_1", 0 );
	--AddSpeakOption( OwnerID(), TargetID( ), "����_8_12345678901234567890123456789012345678901234567890" , "LuaSO_110000_1", 0 );

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110000_1()

	SetSpeakDetail( OwnerID(), "SD_110000_1"   );
	AddSpeakOption( 	OwnerID(), TargetID( ), "SO_110000_2", 	"LuaSO_110000_2", 	0 );
	AddSpeakOption( 	OwnerID(), TargetID( ), "SO_BACK", 		"LuaSpeak_110000", 	0 );

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110000_2()

	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------