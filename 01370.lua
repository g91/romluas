function Lua_DW_Chest(KeyID , GiveID1 , GiveID2 ,GiveID3 , GiveID4 , GiveID5) -- 鑰匙.給的東西 最多五樣 都給一份
	if	KeyID ~= nil	then
		if	CountBodyItem(OwnerID(),KeyID)<0	then
			local name = "["..KeyID.."]"
			local Str = "[SC_SYS_0][$SETVAR1="..name.."]"
			ScriptMessage( OwnerID(), OwnerID(), 1, Str  , 0 );
			return
		end
		DelBodyItem(OwnerID(),KeyID,1)
	end
	SetPlot(TargetID(),"touch","",0)
	NPCDead(TargetID(),OwnerID())
end