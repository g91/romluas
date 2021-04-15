
function LuaS_421094_0()
	Hide(OwnerID())
	local Player = TargetID()
	local Boss = LuaS_Discowood_CreateMonster( 100805 , Player , -32568.4 , -326.7 , 6667 , 90 ,"LuaS_Discowood_CheckPeace")
	local No1 = LuaS_Discowood_CreateMonster( 100806 , Player , -32540,-330,6563,    0,"LuaS_Discowood_CheckPeace" )
	local No2 = LuaS_Discowood_CreateMonster( 100806 , Player , -32477,-328,6614,180,"LuaS_Discowood_CheckPeace" )
	local No3 = LuaS_Discowood_CreateMonster( 100806 , Player , -32540,-330,6563,    0,"LuaS_Discowood_CheckPeace" )
	local No4 = LuaS_Discowood_CreateMonster( 100806 , Player , -32477,-328,6614,180,"LuaS_Discowood_CheckPeace" )

	while true do
		sleep(20)
		if CheckID(Boss)==false and CheckID(No1)==false and CheckID(No2)==false and CheckID(No3)==false and CheckID(No4)==false then
			Show(OwnerID() , 0 )
			break
		end
	end
end