function LuaS_111015_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111015_0") , "LuaS_111015_1", 0 )
end

function LuaS_111015_1()
	SetSpeakDetail(OwnerID(),GetString("SC_111015_1"))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111352_2") , "LuaS_111015_0", 0 )

end

----------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111016_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111016_0") , "LuaS_111016_1", 0 )
end

function LuaS_111016_1()
	SetSpeakDetail(OwnerID(),GetString("SC_111016_1"))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111352_2") , "LuaS_111016_0", 0 )

end