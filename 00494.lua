function LuaI_110305()
	SetPlot( OwnerID() , "touch" , "LuaI_110305_Go" , 25 );
end

function LuaI_110305_Go()
	if CountBodyItem( OwnerID() , 200893 ) >= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110305_1") , 0 )	-- 你使用龍心石璽，阻擋的石頭暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end