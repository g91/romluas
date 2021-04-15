function LuaS_421093_0()
	Hide( OwnerID() )
	local Player = TargetID()
	local Boss = LuaS_Discowood_CreateMonster( 100805 , Player , -32568.4 , -326.7 , 6667 , 90 ,"LuaS_Discowood_CheckPeace")
	while true do
		sleep(20)
		if CheckID(Boss)==false then
			Show(OwnerID() , 0)
			break
		end
	end
end