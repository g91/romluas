function LuaS_110348_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_1"),  "LuaS_110348_1",  0 );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_2"),  "LuaS_110348_2",  0 );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_3"),  "LuaS_110348_3",  0 );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_4"),  "LuaS_110348_4",  0 );
end
--------------------------------------------------------------------------------------------------
function LuaS_110348_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110348_1")   );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_0"),  "LuaS_110348_0",  0 );
end
---------------------------------------------------------------------------------------------------
function LuaS_110348_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110348_2")   );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_0"),  "LuaS_110348_0",  0 );
end
---------------------------------------------------------------------------------------------------
function LuaS_110348_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110348_3")   );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_0"),  "LuaS_110348_0",  0 );
end
---------------------------------------------------------------------------------------------------
function LuaS_110348_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110348_4")   );
	AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110348_0"),  "LuaS_110348_0",  0 );
end
---------------------------------------------------------------------------------------------------