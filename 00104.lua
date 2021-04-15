function LuaSpeak_110382()

	SetSpeakDetail( OwnerID(), "SD_110382_1"   );

	AddSpeakOption( OwnerID(), TargetID(), "SO_110382_1" , "LuaSO_110382_1", 0 );
end

function LuaSO_110382_1()

	SetSpeakDetail( OwnerID(), "SD_110382_2"   );
	AddSpeakOption( OwnerID(), TargetID(), "SO_LEAVE" , "LuaSO_Leave", 0 );
			
end

function LuaSO_Leave()

	CloseSpeak( OwnerID() );

end