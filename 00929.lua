function Lua_NeedleTrap_Touch()
	SetPlot( OwnerID() , "Range" , "Lua_NeedleTrap_Touch_2" , 25 )
end

function Lua_NeedleTrap_Touch_2()
	BeginPlot( TargetID() , "Lua_NeedleTrap_Touch_3" , 0 )
end

function Lua_NeedleTrap_Touch_3()
	SetPlot( OwnerID() , "Range" , "" , 0 )
	for i = 1 , 1200 , 1 do
		CastSpell( OwnerID() , OwnerID() , 491917) 
		sleep(5)
	end
	SetPlot( OwnerID() , "Range" , "Lua_NeedleTrap_Touch_2" , 25 )
end

function Lua_PoisonTrap_Touch()
	SetPlot( OwnerID() , "Range" , "Lua_PoisonTrap_Touch_2" , 25 )
end

function Lua_PoisonTrap_Touch_2()
	BeginPlot( TargetID() , "Lua_PoisonTrap_Touch_3" , 0 )
end

function Lua_PoisonTrap_Touch_3()
	SetPlot( OwnerID() , "Range" , "" , 0)
	for i = 1 , 10 , 1 do
		CastSpell( OwnerID() , OwnerID() , 491918) 
		sleep(5)
	end
	SetPlot( OwnerID() , "Range" , "Lua_PoisonTrap_Touch_2" , 25)
end