function LuaS_421265_0()
	DelBodyItem(OwnerID() , 202394 , 1 )
	BeginPlot(TargetID() , "LuaS_421265_1" , 0 )
	return true
end

function LuaS_421265_1()
	sleep(50)
	CastSpell( OwnerID() , OwnerID() , 491259 )
	sleep(10)
	Hide(OwnerID())
	sleep(850)
	Show(OwnerID() , 0 )
end