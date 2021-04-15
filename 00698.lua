function LuaS_421089_0()
	DisableQuest( OwnerID() , true )--鎖多摩塔吉任務
	local Player = TargetID()
	local No1 = LuaS_Discowood_CreateMonster( 100806  , Player , -32448.6 , -324 , 6623.4 , 86 , "LuaS_Discowood_CheckPeace" )
	local No2 = LuaS_Discowood_CreateMonster( 100806  , Player , -32502.1 , -328 , 6603.9 , 59 , "LuaS_Discowood_CheckPeace" )

	while true do
		Sleep(20)
		if CheckID(No1)==false and CheckID(No2)==false then
			DisableQuest( OwnerID() , false )--開多摩塔吉任務
			break
		end
	end
end
