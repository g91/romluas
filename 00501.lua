function LuaInit_GuildBid_110748()

	SetCrystalID( OwnerID(), 450 ); 	
	SetPlot( OwnerID() , "Touch" , "LuaTouch_GetGuildBidInfo_110748" , 50 );
end

function LuaTouch_GetGuildBidInfo_110748()

	-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
	-- OpenGuildWarBid( OwnerID(), TargetID() );	

	SendBGInfoToClient( 450, OwnerID() );
	
end