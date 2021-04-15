function LuaS_111352_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111352_0") , "LuaS_111352_1", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111352_1") , "LuaS_111352_2", 0 )
end

function LuaS_111352_1()
	SetSpeakDetail(OwnerID(),GetString("SC_111352_3"))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111352_2") , "LuaS_111352_0", 0 )
end

function LuaS_111352_2()
	SetSpeakDetail(OwnerID(),GetString("SC_111352_4"))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111352_2") , "LuaS_111352_0", 0 )
end
