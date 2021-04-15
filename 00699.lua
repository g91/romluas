
function LuaS_421092_0()
	local Player = TargetID()
	DisableQuest( OwnerID() , true )--鎖福庫修任務
	local No1 = LuaS_Discowood_CreateMonster( 100806 , Player , -32540,-330,6563,    0,"LuaS_Discowood_CheckPeace" )
	local No2 = LuaS_Discowood_CreateMonster( 100806 , Player , -32477,-328,6614,180,"LuaS_Discowood_CheckPeace" )

	while true do
		Sleep(20)
		if CheckID(No1)==false and CheckID(No2)==false then
			DisableQuest( OwnerID() , false )--開福庫修任務
			break
		end
	end
end
