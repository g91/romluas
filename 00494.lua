function LuaI_110305()
	SetPlot( OwnerID() , "touch" , "LuaI_110305_Go" , 25 );
end

function LuaI_110305_Go()
	if CountBodyItem( OwnerID() , 200893 ) >= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110305_1") , 0 )	-- �A�ϥ��s�ߥ�â�A���ת����Y�Ȯɱq�z�����e�����I
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end