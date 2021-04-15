function LuaI_110499()
	SetPlot( OwnerID() ,"touch" , "LuaQ_420488" , 40 )
end

function LuaQ_420488()
 	SAY( TargetID() , GetString("SAY_420488_0") ) --/*喵嗚～喵喵嗚～
	if CheckAcceptQuest( OwnerID() , 420488 ) == true then
		SetFlag( OwnerID() , 540776 )
		SetPlot( TargetID() ,"touch" , "" , 0 )		
	end
end

function LuaQ_420489_Complete()
	SetPlot( OwnerID() ,"touch" , "LuaQ_420488_1" , 40 )--/*木箱內真好玩，讓我再待一會...
end