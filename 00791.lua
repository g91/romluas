function LuaS_110531_0()

	LoadQuestOption( OwnerID() )

	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_2"), "LuaS_110944_2", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_3"), "LuaS_110944_3", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_6"), "LuaS_110944_6", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_7"), "LuaS_110944_7", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

	if ReadRoleValue( OwnerID()  , EM_RoleValue_VOC ) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_9"), "LuaS_110805_Secret", 0 ) 
		AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_10"), "LuaS_110944_Secret", 0 ) 
	end

end