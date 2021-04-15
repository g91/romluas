function LuaI_110074()
	local P = Rand(6)
	if P == 0 then
		SetPosByFlag( OwnerID(), 780043 , 0 )
	elseif P == 1 then
		SetPosByFlag( OwnerID(), 780043 , 1 )
	elseif P == 2 then
		SetPosByFlag( OwnerID(), 780043 , 2 )
	elseif P == 3 then
		SetPosByFlag( OwnerID(), 780043 , 3 )
	elseif P == 4 then
		SetPosByFlag( OwnerID(), 780043 , 4 )
	else
		SetPosByFlag( OwnerID(), 780043 , 5 )
	end
	DisableQuest(OwnerID() , false)
end

function LuaQ_420487_Complete()
--	sleep( 300 )
	DisableQuest(OwnerID() , true )
	BeginPlot( OwnerID() , "LuaI_110074" , 0 ) 	
end

--『【 ##注意：此段劇情的作用 移到 701531的 LuaS_118toZone1_3 】』

function LuaQ_420491_0()
	SetPlot( OwnerID() , "range" , "LuaQ_420491_1" , 50 )
end

function LuaQ_420491_1()
	if CheckAcceptQuest( OwnerID() , 420491 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SAY_420491") , 0 )
		SetFlag( OwnerID() , 540777 , 1)
	end
end