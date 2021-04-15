-------------------------------------------------------------------------------------/*第二符文法陣
function LuaQ_421106_2()
	SetPlot( OwnerID() , "range" , "LuaQ_421106_3" , 50 )
end

function LuaQ_421106_3()
	if CheckAcceptQuest( OwnerID() , 421106 ) == true and Checkflag(OwnerID() , 541283) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421106") , 0 )
		SetFlag( OwnerID() , 541283 , 1)
	end
end
-------------------------------------------------------------------------------------/*第三符文法陣
function LuaQ_421106_4()
	SetPlot( OwnerID() , "range" , "LuaQ_421106_5" , 50 )
end

function LuaQ_421106_5()
	if CheckAcceptQuest( OwnerID() , 421106 ) == true and Checkflag(OwnerID() , 541284) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421106") , 0 )
		SetFlag( OwnerID() , 541284 , 1)
	end
end
-------------------------------------------------------------------------------------/*符文王座
function LuaQ_421107_0()
	SetPlot( OwnerID() , "range" , "LuaQ_421107_1" , 50 )
end

function LuaQ_421107_1()
	if CheckAcceptQuest( OwnerID() , 421107 ) == true and Checkflag(OwnerID() , 541285) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421107") , 0 )
		SetFlag( OwnerID() , 541285 , 1)
	end
	if CheckAcceptQuest( OwnerID() , 421106 ) == true and Checkflag(OwnerID() , 541282) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421106") , 0 )
		SetFlag( OwnerID() , 541282 , 1)
	end

end

function LuaQ_421107_2()
	CastSpell( OwnerID() , OwnerID() , 490312)
	sleep(5)
end