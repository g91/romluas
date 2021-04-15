function fatest_rand()
	local Owner = OwnerID()
	local RandT = {"-1","0","1","2","3","4","10","15"}
	for i = 1, table.getn(RandT) 	do
		say(Owner,FA_Rand(RandT[i]))
	end
end

function fa_maid_01()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_MEEK_TEST1]")
	AddSpeakOption(Player, NPC, "[SC_MEEK_TEST1-1]", "LuaFA_Test_01", 0)
	AddSpeakOption(Player, NPC, "[SC_MEEK_TEST1-2]", "LuaFA_Test_02", 0)
end

function LuaFA_Test_01()
	SetSpeakDetail(Player, "[SC_MEEK_TEST2]")
	AddSpeakOption(Player, NPC, "[SC_MEEK_TEST1-1]", "LuaFA_Test_01", 0)
end

function LuaFA_Test_02()
	SetSpeakDetail(Player, "[SC_MEEK_TEST2]")
end