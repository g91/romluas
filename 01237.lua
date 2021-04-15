function LuaS_420898()
                Hide( OwnerID() )                                                                          --隱藏任務NPC
	local Boss = Lua_DW_CreateObj("obj" , 101678 , OwnerID() )    --叫出怪物NPC
	SetAttack(Boss , TargetID() )
	BeginPlot(Boss  , "LuaS_Discowood_CheckPeace" , 0 )
	while true do
		sleep(10)
		if CheckID(Boss)==false then
			Show(OwnerID() , 0)
			break
		end
	end
end

function LuaS_421769()
	Hide( OwnerID() )
	local Boss = Lua_DW_CreateObj("obj" , 101630 , OwnerID() )
	SetAttack(Boss , TargetID() )
	BeginPlot(Boss  , "LuaS_Discowood_CheckPeace" , 0 )
	while true do
		sleep(10)
		if CheckID(Boss)==false then
			Show(OwnerID() , 0)
			break
		end
	end
end

function LuaS_421767()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_CRY)
end

function LuaS_420896()
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_BEGIN) 
	sleep( 30 )
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_CRAFTING_END)
end

