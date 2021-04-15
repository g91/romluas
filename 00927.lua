function LuaS_111460_1()
	LoadQuestOption(OwnerID())
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111460_1") , "LuaS_111460_2", 0 ) --玩家選項：
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111460_3") , "LuaS_111460_3", 0 ) --玩家選項：
end

function LuaS_111460_2()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111460_2"))
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111460_5") , "LuaS_111460_4", 0 ) --玩家選項：
end

function LuaS_111460_3()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111460_4"))
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111460_5") , "LuaS_111460_4", 0 ) --玩家選項：
end

function LuaS_111460_4()
	SetSpeakDetail ( OwnerID(), GetString ("SC_111460_6"))
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111460_1") , "LuaS_111460_2", 0 ) --玩家選項：
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111460_3") , "LuaS_111460_3", 0 ) --玩家選項：
end